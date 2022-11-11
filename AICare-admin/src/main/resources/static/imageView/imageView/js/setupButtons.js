
function setupButtons(studyViewerTemplate) {
    // Get the button elements
    var buttons = $(studyViewerTemplate).find('button');

    // Tool button event handlers that set the new active tool  设置新活动工具的工具按钮事件处理程序

    // 加载示例图像
    $(buttons[0]).on('click touchstart', function() {
        location.reload();
    });

    // 加载上传图像
    $(buttons[1]).on('click touchstart', function() {
        files = document.getElementById("file-upload").files;

        if(files.length === 0){
            alert("请先选择文件！！！");
        }else {
            // 判断上传文件类型
            //console.log(files[0].name.substr(files[0].name.lastIndexOf(".")+1));
            if (files[0].name.substr(files[0].name.lastIndexOf(".")+1) ==="nii"){
                $("#viewer").hide();
                $("#brainbrowser-wrapper").show();
                $("#loading").show();
                $("#instructions").show();
                $('#container').remove();
                $('#color-map-select').remove();

                viewer.loadVolumes({
                    volumes: [
                        {
                            type: "nifti1",
                            nii_file: files,
                            template: {
                                element_id: "volume-ui-template",
                                viewer_insert_class: "volume-viewer-display"
                            }
                        },

                    ],
                    complete: function () {
                        $(".slice-display").css("display", "inline");
                        $("#loading").hide();
                        $("#edit2").hide();
                        //$("#brainbrowser-wrapper").show();
                    }
                });

                //$("#viewer").hide();
                $("#To2D").hide();
                $("#tabContent").css("float", "left");
            }else {
                viewer.loadVolume({
                    type: "Dicom1",
                    Dicom_files: files,
                    template: {
                        element_id: "volume-ui-template",
                        viewer_insert_class: "volume-viewer-display"
                    }
                });
                $("#To2D").show();
                flag_UP = true;
            }

        }
    });

    // WW/WL 窗宽窗位
    $(buttons[2]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function(element) {
            cornerstoneTools.wwwc.activate(element, 1);
            cornerstoneTools.wwwcTouchDrag.activate(element);
        });
    });

    // Invert 反片
    $(buttons[3]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function(element) {
            var viewport = cornerstone.getViewport(element);
            // Toggle invert
            if (viewport.invert === true) {
                viewport.invert = false;
            } else {
                viewport.invert = true;
            }
            cornerstone.setViewport(element, viewport);
        });
    });

    // Zoom  放大缩小
    $(buttons[4]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function(element) {
            cornerstoneTools.zoom.activate(element, 5); // 5 is right mouse button and left mouse button
            cornerstoneTools.zoomTouchDrag.activate(element);
        });
    });

    // Pan  移动
    $(buttons[5]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function(element) {
            cornerstoneTools.pan.activate(element, 3); // 3 is middle mouse button and left mouse button
            cornerstoneTools.panTouchDrag.activate(element);
        });
    });

    // Stack scroll  翻页
    $(buttons[6]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function(element) {
            cornerstoneTools.stackScroll.activate(element, 1);
            cornerstoneTools.stackScrollTouchDrag.activate(element);
        });
    });

    // Length measurement  画线直线
    $(buttons[7]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function(element) {
            cornerstoneTools.length.activate(element, 1);
        });
    });

    // Angle measurement  角度
    $(buttons[8]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function(element) {
            cornerstoneTools.angle.activate(element, 1);
        });
    });

    // Pixel probe  坐标点
    $(buttons[9]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function(element) {
            cornerstoneTools.probe.activate(element, 1);
        });
    });

    // Elliptical ROI 圆形
    $(buttons[10]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function(element) {
            cornerstoneTools.ellipticalRoi.activate(element, 1);
        });
    });

    // Rectangle ROI 矩形
    $(buttons[11]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function (element) {
            cornerstoneTools.rectangleRoi.activate(element, 1);
        });
    });

    // Play clip  播放
    $(buttons[12]).on('click touchstart', function() {
        forEachViewport(function(element) {
          var stackState = cornerstoneTools.getToolState(element, 'stack');
          var frameRate = stackState.data[0].frameRate;
          // Play at a default 10 FPS if the framerate is not specified
          if (frameRate === undefined) {
            frameRate = 10;
          }
          cornerstoneTools.playClip(element, frameRate);
        });
    });

    // Stop clip 停止
    $(buttons[13]).on('click touchstart', function() {
        forEachViewport(function(element) {
            cornerstoneTools.stopClip(element);
        });
    });

    //  透镜
    $(buttons[14]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function(element) {
            cornerstoneTools.magnify.activate(element, 1);
            cornerstoneTools.magnifyTouchDrag.activate(element);
            cornerstoneTools.crosshairs.enable(element);
        });
    });

    //
    $(buttons[15]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function(element) {
            cornerstoneTools.wwwcRegion.activate(element, 1);
            cornerstoneTools.wwwcRegionTouch.activate(element);
        });
    });

    $(buttons[16]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function(element) {
            cornerstoneTools.arrowAnnotate.activate(element, 1);
            cornerstoneTools.arrowAnnotateTouch.activate(element);
        });
    });

    $(buttons[17]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function(element) {
            cornerstoneTools.simpleAngle.activate(element, 1);
            cornerstoneTools.simpleAngleTouch.activate(element);
        });
    });

    $(buttons[18]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function(element) {
            cornerstoneTools.rotate.activate(element, 1);
            cornerstoneTools.rotateTouchDrag.activate(element);
        });
    });

    $(buttons[19]).on('click touchstart', function() {
        disableAllTools();
        forEachViewport(function(element) {
            cornerstoneTools.highlight.activate(element, 1);
            cornerstoneTools.highlightTouch.activate(element);
        });
    });

    $(buttons[20]).on('click touchstart', function() {
        disableAllTools();

        const gCanvas = document.querySelector("div.viewport.ui-droppable canvas[class='cornerstone-canvas']");

            gCanvas.toBlob((blob) => {
                const timestamp = Date.now().toString();
                const a = document.createElement('a');
                document.body.append(a);
                a.download = `${timestamp}.png`;
                a.href = URL.createObjectURL(blob);
                a.click();
                a.remove();
            });

    });

    $(buttons[21]).on('click touchstart', function () {
        disableAllTools();

        if (files==undefined){
            files = document.getElementById("file-upload").files;
        }

        if (files.length != 0){
            // 判断上传文件类型

            if (flag_UP){
                $('#color-map-select').remove();
                $('#container').remove();
                $("#loading").show();
                $("#instructions").show();

                viewer.loadVolumes({
                    volumes: [
                        {
                            type: "dicom",
                            dicom_files: files,
                            template: {
                                element_id: "volume-ui-template",
                                viewer_insert_class: "volume-viewer-display"
                            }
                        },

                    ],
                    complete: function () {
                        $("#loading").hide();
                    }
                });

                $("#viewer").hide();
                // $("#To2D").show();
                $("#tabContent").css("float", "left");
                // $("#brainbrowser").width(1000);
                flag_UP = false;
            }else{
                $("#instructions").show();
                $("#brainbrowser-wrapper").show();
                $("#viewer").hide();
            }
        }else {
            if (flag_D) {
                ///DicomTo3D show 暂时先使用该方法展示，由于未解决向服务器请求多个文件
                // 按键操作测量提示文字显示
                $("#instructions").show();
                // Dicom按钮操作隐藏
                $("#viewer").hide();
                //加载dicom文件
                //viewer.clearVolumes();
                viewer.loadVolumes({
                    volumes: [
                        {
                            type: "nifti1",
                            nii_url: "./studies/test.nii",
                            // views:["xspace"],
                            template: {
                                element_id: "volume-ui-template",
                                viewer_insert_class: "volume-viewer-display"
                            }
                        },

                    ],
                    complete: function () {
                        $(".slice-display").css("display", "inline");
                        $("#brainbrowser-wrapper").show();
                        $("#loading").hide();
                        $("#edit2").hide();
                    }
                });

                $("#tabContent").css("float", "left");
                flag_D = false;
            } else {
                $("#instructions").show();
                $("#brainbrowser-wrapper").show();
                $("#viewer").hide();
            }

        }

    });

    // Tooltips
    $(buttons[0]).tooltip();
    $(buttons[1]).tooltip();
    $(buttons[2]).tooltip();
    $(buttons[3]).tooltip();
    $(buttons[4]).tooltip();
    $(buttons[5]).tooltip();
    $(buttons[6]).tooltip();
    $(buttons[7]).tooltip();
    $(buttons[8]).tooltip();
    $(buttons[9]).tooltip();
    $(buttons[10]).tooltip();
    $(buttons[11]).tooltip();
    $(buttons[12]).tooltip();
    $(buttons[13]).tooltip();
    $(buttons[14]).tooltip();
    $(buttons[15]).tooltip();
    $(buttons[16]).tooltip();
    $(buttons[17]).tooltip();
    $(buttons[18]).tooltip();
    $(buttons[19]).tooltip();
    $(buttons[20]).tooltip();
    $(buttons[21]).tooltip();
    $(buttons[22]).tooltip();
}
