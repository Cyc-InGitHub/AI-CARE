(function() {
	"use strict";

	var VolumeViewer = BrainBrowser.VolumeViewer;

	VolumeViewer.volume_loaders.dicom = function(description, callback) {
		var error_message;
		if(description.dicom_files){
			BrainBrowser.loader.loadFromFiles(description.dicom_files, function(dicom_data) {
				parseDicomHeader(dicom_data,function(header,series){
					createDicomVolume(header,series, callback);
				});
				}, {
				result_type: "arraybuffer"
			});
		} else if (description.dicom_url) {

				BrainBrowser.loader.loadFromUrls(description.dicom_url, function(dicom_data) {
					parseDicomHeader(dicom_data,function(header,series){
						createDicomVolume(header,series, callback);
					});
				}, {
					result_type: "arraybuffer"
				});

		} else {
			error_message = "invalid volume description.\n" +"Description must contain the property dicom_file";

			BrainBrowser.events.triggerEvent("error", {
				message: error_message
			});
			throw new Error(error_message);
		}

	};
	
	
	function createSeries(dicom_data){
		var series;
		for(var i=0;i<dicom_data.length;i++){
			var image = daikon.Series.parseImage(new DataView(dicom_data[i]));
			if(image==null){
				var error_message=daikon.Series.parserError;
				BrainBrowser.events.triggerEvent("error", {
					message: error_message
				});
				throw new Error(error_message);
			}else if (image.hasPixelData()) {
				if (!series) {
					series = new daikon.Series();
				}
					series.addImage(image);
              
            }else{
				var error_message="No pixel data found!";
				BrainBrowser.events.triggerEvent("error", {
					message: error_message
				});
				throw new Error(error_message);
			}
		}
		series.buildSeries();
		// output some header info
		console.log("Number of images read is " + series.images.length);
		console.log("Series imagePosition " + series.images[0].getImageMax()+series.images[0].getImageMin());
		console.log("Each slice is " + series.images[0].getCols() + " x " + series.images[0].getRows());
		
		console.log("Each voxel is " + series.images[0].getBitsAllocated() + " bits, " + 
		    (series.images[0].littleEndian ? "little" : "big") + " endian");
		
	
		return series;
	}
	/**
	 * @doc  function
	 * @name parseNifti1Header
	 * @param {DOMElement}  raw_data  一个ArrayBuffer对象，存放原始二进制数据
	 * @param {Function}   callback   回调函数，解析完头文件之后的操作
	 * @description 解析头文件信息
	 */
	
	function parseDicomHeader(dicom_data, callback) {
		var header = {
			format: "dicom",
			order: [],
			xspace: {},
			yspace: {},
			zspace: {},
			bytes_per_voxel:null,
			must_swap_data:false,
			datatype:null,
			vox_offset:null,
			scl_slope:null,
			scl_inter:null
		};
		var series=createSeries(dicom_data);//构建一个series
		if((series.images[0].getPixelRepresentation())==0){
			header.datatype="uint16";
		}else{
			header.datatype="int16";
		}//获取数据类型
		
		console.log(header.datatype);
		header.bytes_per_voxel=series.images[0].getBitsAllocated()/8;//每个像素元素所占的字节数
		console.log(header.bytes_per_voxel);
		header.must_swap_data=series.images[0].littleEndian? false:true;//大端需要转小端
		console.log(header.must_swap_data);
		header.scl_slope=series.images[0].getDataScaleSlope();//斜率
		console.log(header.scl_slope);
		header.scl_inter=series.images[0].getDataScaleIntercept();//截距
		console.log(header.scl_inter);
		//x,y,z 三个维度的大小
		header.order[2]="zspace";
		header.order[1]="yspace";
		header.order[0]="xspace";
		header[header.order[2]].space_length = series.images.length;
		header[header.order[1]].space_length = series.images[0].getCols();
		header[header.order[0]].space_length =  series.images[0].getRows();

		console.log("当前header");
		console.log(header);
		
		//createDicomData(series,header);
		header[header.order[2]].offset = header[header.order[0]].space_length * header[header.order[1]].space_length;
		header[header.order[1]].offset = header[header.order[0]].space_length; 
		header[header.order[0]].offset = 1; 
		
		
		//设置像素间距
		var xyPixelSpacing=series.images[0].getPixelSpacing();
		var zPixelSpacing=Math.abs(series.images[1].getImagePosition()[2]-series.images[0].getImagePosition()[2]);
		header[header.order[2]].step=zPixelSpacing;
		header[header.order[1]].step=xyPixelSpacing[1];
		header[header.order[0]].step=xyPixelSpacing[0];
		
		if (BrainBrowser.utils.isFunction(callback)) {
			callback(header,series);
		}
	}
	//创建dicom文件的Volume对象
	function createDicomVolume(header,series, callback) {
		
		var volume = VolumeViewer.createVolume(header, createDicomData(series,header));
		//volume类型
		volume.type = "dicom";
		//体素的最大最小值
		volume.intensity_min = volume.header.voxel_min;
		volume.intensity_max = volume.header.voxel_max;
		// 保存世界坐标下的原点位置和w2v转换矩阵
		//volume.saveOriginAndTransform(header);
		console.log("header.voxel_origin: ");
		console.log(header.voxel_origin);
		if (BrainBrowser.utils.isFunction(callback)) {
			console.log("dicom的volume对象内容如下：")
			console.log(volume);
			callback(volume);
		}
	}
	//创建dicom数据
	function createDicomData(series,header) {
		var dicomData;
		var datatype=series.images[0].getPixelRepresentation();
		console.log(datatype);
		// 将数据拼接到一个字节数组中
		//series.orderBySliceLocation(series.images);
		var imageData=concatenateImageData(series);
		    console.log("Total image data size is " + imageData.byteLength + " bytes");
			var swap=series.images[0].littleEndian? false:true;
			//转换为小端存储
			if (swap) {
				VolumeViewer.utils.swapn(new Uint8Array(imageData),
					series.images[0].getBitsAllocated()/8);
			}
			
			
			//根据数据类型创建相应数组
			switch (datatype) {
				case 0: // UNSIGNED_INT
					// no translation necessary; could optimize this out.
					dicomData = new Uint16Array(imageData);
					break;
				case 1: // INT
					dicomData = new Int16Array(imageData);
					break;
				default:
					// We don't yet support 64-bit, complex, RGB, and float 128 types.
					var error_message = "Unsupported data type: " + header.datatype;
					BrainBrowser.events.triggerEvent("error", {
						message: error_message
					});
					throw new Error(error_message);
			}
			//存在截距斜率信息，改写数值
			var slope=series.images[0].getDataScaleSlope();
			var inter=series.images[0].getDataScaleIntercept();
			if(slope){
				console.log("2222222222");
				var float_data = new Float32Array(dicomData.length);
				
				for ( var d = 0; d < dicomData.length; d++) {
					float_data[d] = dicomData[d] * slope + inter;
				}
				dicomData = float_data; // Return the new float buffer.
			}
			console.log(dicomData);
			VolumeViewer.utils.scanDataRange(dicomData, header);
			
			return dicomData;
		
	}
	//将dicom数据拼接为一个字节数组
	function concatenateImageData(series){
		var length = series.validatePixelDataLength(series.images[0]);
		var buffer = new Uint8Array(new ArrayBuffer(length * series.images.length));
		for(var i=0;i<series.images.length;i++){
				var data = series.images[i].getPixelDataBytes();
				var length = series.validatePixelDataLength(series.images[i]);
				console.log(length);
				series.images[i].clearPixelData();
				
				buffer.set(new Uint8Array(data, 0, length), i*length);
				
		}
		
		return buffer.buffer;
	}

}());
