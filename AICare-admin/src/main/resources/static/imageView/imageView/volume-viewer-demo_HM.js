
$(function () {
    "use strict";    //  严格模式，不能使用未声明的变量

    $(".button").button();

    /////////////////////////////////////
    // Start running the Volume Viewer
    /////////////////////////////////////
    window.viewer = BrainBrowser.VolumeViewer.start("brainbrowser", function (viewer) {
        var pointArr1 = [];  //存放x标注所有点坐标的数组
        var pointArr2 = [];  //存放y标注边界的数组
        var pointArr3 = [];  //存放z标注边界的数组
        var pointArr = [];  //存放坐标的数组
        var arr3 = [];  //存放格式转换后的头部，与数据部分相连接
        var offset;  //存放头部所站格式的位数
        var arr2;
        var arr1;
        var oIndex = 0;
        var loading_div = $("#loading");

        // 标注清除按钮功能
        $("#sabutton").click(function () {
            $("#edit2").hide();  // 图像下方功能按钮隐藏

            pointArr1 = [];  //存放x标注所有点坐标的数组
            pointArr2 = [];  //存放y标注边界的数组
            pointArr3 = [];  //存放z标注边界的数组
            pointArr = [];  //存放坐标的数组
        });

        // 矢状位图像右侧上方点击翻页按钮功能   注：点击上下按钮要设置范围:不能<0,不能>图像层数.--未实现
        $("#1").click(function () {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            //var header = volumed.header;

            volumed.position["xspace"] = volumed.position["xspace"] + 1;

            volumed.display.forEach(function (other_panel) {

                if (other_panel.axis === "xspace") {
                    other_panel.updateSlice();
                }
            });
            volume.indexX = volume.indexX-1;
        });

        // 矢状位图像右侧下方点击翻页按钮功能
        $("#2").click(function () {
            var length = viewer.volumes.length - 1; //确保添加标签时按钮起到作用
            var volumed = viewer.volumes[length];
            volumed.position["xspace"] = volumed.position["xspace"] - 1;

            volumed.display.forEach(function (other_panel) {

                if (other_panel.axis === "xspace") {
                    other_panel.updateSlice();
                }
            });
            volume.indexX = volume.indexX+1;
        });

        // 冠状位图像右侧上方点击翻页按钮功能
        $("#3").click(function () {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            volumed.position["yspace"] = volumed.position["yspace"] + 1;

            volumed.display.forEach(function (other_panel) {

                if (other_panel.axis === "yspace") {
                    other_panel.updateSlice();
                }
            });
            volume.indexY = volume.indexY+1;
        });

        // 冠状位图像右侧下方点击翻页按钮功能
        $("#4").click(function () {
            var length = viewer.volumes.length - 1; //确保添加标签时按钮起到作用
            var volumed = viewer.volumes[length];
            volumed.position["yspace"] = volumed.position["yspace"] - 1;

            volumed.display.forEach(function (other_panel) {

                if (other_panel.axis === "yspace") {
                    other_panel.updateSlice();
                }
            });
            volume.indexY = volume.indexY-1;
        });

        // 横断面图像右侧上方点击翻页按钮功能
        $("#5").click(function () {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            volumed.position["zspace"] = volumed.position["zspace"] + 1;

            volumed.display.forEach(function (other_panel) {

                if (other_panel.axis === "zspace") {
                    other_panel.updateSlice();
                }
            });
            volume.indexZ = volume.indexZ+1;
        });

        // 横断面图像右侧下方点击翻页按钮功能
        $("#6").click(function () {
            var length = viewer.volumes.length - 1; //确保添加标签时按钮起到作用
            var volumed = viewer.volumes[length];
            volumed.position["zspace"] = volumed.position["zspace"] - 1;

            volumed.display.forEach(function (other_panel) {

                if (other_panel.axis === "zspace") {
                    other_panel.updateSlice();
                }
            });
            volume.indexZ = volume.indexZ-1;
        });

        // 点击绘画功能后,展示的功能按钮   矢状位图像右侧上方点击翻页按钮功能
        $("#7").click(function () {
            var length = viewer.volumes.length - 1;
            // var k= parseInt($("#voxel-k-"+length).val(), 10);
            // k=k+1;
            // var i = parseInt($("#voxel-i-"+length).val(), 10);
            // var j = parseInt($("#voxel-j-"+length).val(), 10);
            // viewer.volumes[length].setVoxelCoords(i, j, k);
            // if (viewer.synced) {
            //   var synced_volume = viewer.volumes[vol_id];
            //   var wc = synced_volume.getWorldCoords();
            //   viewer.volumes.forEach(function (volume) {
            //     if (synced_volume !== volume) {
            //       volume.setWorldCoords(wc.x, wc.y, wc.z);
            //     }
            //   });
            // }
            //
            // viewer.redrawVolumes();
            // $("#voxel-i-0").val(i);
            var volumed = viewer.volumes[length];
            volumed.position["xspace"] = volumed.position["xspace"] + 1;
            volumed.display.forEach(function (other_panel) {

                if (other_panel.axis === "xspace") {
                    other_panel.updateSlice();
                }
            });
            volume.indexX = volume.indexX-1;
        });

        // 点击绘画功能后,展示的功能按钮   矢状位图像右侧下方点击翻页按钮功能
        $("#8").click(function () {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            volumed.position["xspace"] = volumed.position["xspace"] - 1;
            volumed.display.forEach(function (other_panel) {

                if (other_panel.axis === "xspace") {
                    other_panel.updateSlice();
                }
            });
            volume.indexX = volume.indexX+1;
        });

        //  点击绘画功能后,展示的功能按钮   冠状位图像右侧上方点击翻页按钮功能
        $("#9").click(function () {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            volumed.position["yspace"] = volumed.position["yspace"] + 1;
            volumed.display.forEach(function (other_panel) {

                if (other_panel.axis === "yspace") {
                    other_panel.updateSlice();
                }
            });
            volume.indexY = volume.indexY+1;
        });

        //  点击绘画功能后,展示的功能按钮   冠状位图像右侧下方点击翻页按钮功能
        $("#10").click(function () {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            volumed.position["yspace"] = volumed.position["yspace"] - 1;
            volumed.display.forEach(function (other_panel) {

                if (other_panel.axis === "yspace") {
                    other_panel.updateSlice();
                }
            });
            volume.indexY = volume.indexY-1;
        });

        //  点击绘画功能后,展示的功能按钮   横断面图像右侧上方点击翻页按钮功能
        $("#11").click(function () {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            volumed.position["zspace"] = volumed.position["zspace"] + 1;
            volumed.display.forEach(function (other_panel) {

                if (other_panel.axis === "yspace") {
                    other_panel.updateSlice();
                }
            });
            volume.indexZ = volume.indexZ+1;
        });

        //  点击绘画功能后,展示的功能按钮   横断面图像右侧下方点击翻页按钮功能
        $("#12").click(function () {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            volumed.position["zspace"] = volumed.position["zspace"] - 1;
            volumed.display.forEach(function (other_panel) {

                if (other_panel.axis === "zspace") {
                    other_panel.updateSlice();
                }
            });
            volume.indexZ = volume.indexZ-1;
        });

        // 绘画的按钮点击事件
        $("#draw").click(function () {
            $("#edit2").css("display", "block");
            viewer.arr3 = [];
            var volume1 = viewer.volumedata[0];
            var header = volume1.header;
            viewer.sevolume = viewer.volumedata[0];
            viewer.arr1 = volume1.headerdata;
            console.log(viewer.arr1);
            var arr4 = viewer.arr1.buffer;
            switch (header.datatype) {
                case 2:                     // DT_UNSIGNED_CHAR
                    // no translation necessary; could optimize this out.
                    viewer.arr2 = new Uint8Array(volume1.data);
                    arr3 = new Uint8Array(arr4);
                    offset = 352;
                    break;
                case 4:                     // DT_SIGNED_SHORT
                    viewer.arr2 = new Int16Array(volume1.data);
                    arr3 = new Int16Array(arr4);
                    offset = 176;
                    break;
                case 8:                     // DT_SIGNED_INT
                    viewer.arr2 = new Int32Array(volume1.data);
                    arr3 = new Int32Array(arr4);
                    offset = 88;
                    break;
                case 16:                    // DT_FLOAT
                    viewer.arr2 = new Float32Array(volume1.data);
                    arr3 = new Float32Array(arr4);
                    offset = 88;
                    break;
                case 64:                    // DT_DOUBLE
                    viewer.arr2 = new Float64Array(volume1.data);
                    arr3 = new Float64Array(arr4);
                    offset = 44;
                    break;
                // Values above 256 are NIfTI-specific, and rarely used.
                case 256:                   // DT_INT8
                    viewer.arr2 = new Int8Array(volume1.data);
                    arr3 = new Int8Array(arr4);
                    offset = 352;
                    break;
                case 512:                   // DT_UINT16
                    viewer.arr2 = new Uint16Array(volume1.data);
                    arr3 = new Uint16Array(arr4);
                    offset = 176;
                    break;
                case 768:                   // DT_UINT32
                    viewer.arr2 = new Uint32Array(volume1.data);
                    arr3 = new Uint32Array(arr4);
                    offset = 88;
                    break;
                default:
                    // We don't yet support 64-bit, complex, RGB, and float 128 types.
                    var error_message = "Unsupported data type: " + header.datatype;
                    BrainBrowser.events.triggerEvent("error", {message: error_message});
                    throw new Error(error_message);
            }
            console.log(viewer.arr2);
            for (var hm = 0; hm < viewer.arr2.length; hm++)
                viewer.arr2[hm] = 0;
        });

        function point() {
            this.x = 0;
            this.y = 0;
        };

        var can = document.getElementById("coverbox");  // edit2 中的canvas画布
        var ctx = can.getContext('2d');
        var can1 = document.getElementById("coverbox1");
        var ctx1 = can1.getContext('2d');
        var can2 = document.getElementById("coverbox2");
        var ctx2 = can2.getContext('2d');
        var pointX, pointY;
        var click = 0;
        ctx.strokeStyle = 'rgba(102,168,255,1)'; //线条颜色
        ctx.lineWidth = 1; //线条粗细
        ctx1.strokeStyle = 'rgba(102,168,255,1)'; //线条颜色
        ctx1.lineWidth = 1; //线条粗细
        ctx2.strokeStyle = 'rgba(102,168,255,1)'; //线条颜色
        ctx2.lineWidth = 1; //线条粗细
        var i2 = 0, i1 = 0, i3 = 0;


        can.onmousedown = function (e) {
            click = 1;
            if (!e.shiftKey && !e.ctrlKey) {
                if (e.offsetX || e.layerX) {
                    pointX = e.offsetX == undefined ? e.layerX : e.offsetX;
                    pointY = e.offsetY == undefined ? e.layerY : e.offsetY;
                    var piX, piY;
                    if (oIndex > 0 && pointArr.length > 0) {
                        piX = pointArr[0].x;
                        piY = pointArr[0].y;
                        //画点
                        makearc(ctx, piX, piY, GetRandomNum(10, 10), 0, 180, 'rgba(102,168,255,1)');
                        pointArr.push({x: piX, y: piY});
                        // canvasSave(pointArr);//保存点线同步到另一个canvas
                    } else {
                        let style = window.getComputedStyle(can, null);
                        let cssWidth = parseFloat(style["width"]);
                        let cssHeight = parseFloat(style["height"]);
                        let borderLeft = parseFloat(style["border-left-width"]);
                        let borderTop = parseFloat(style["border-top-width"]);
                        let paddingLeft = parseFloat(style["padding-left"]);
                        let paddingTop = parseFloat(style["padding-top"]);
                        let scaleX = can.width / cssWidth; // 水平方向的缩放因子
                        let scaleY = can.height / cssHeight; // 垂直方向的缩放因子
                        let xx = e.clientX;
                        let yy = e.clientY;
                        let rect = can.getBoundingClientRect();
                        xx -= (rect.left + borderLeft + paddingLeft); // 去除 borderLeft paddingLeft 后的坐标
                        yy -= (rect.top + borderTop + paddingTop); // 去除 borderLeft paddingLeft 后的坐标
                        xx *= scaleX; // 修正水平方向的坐标
                        yy *= scaleY; // 修正垂直方向的坐
                        piX = xx;
                        piY = yy;
                        makearc(ctx, piX, piY, GetRandomNum(2, 2), 0, 180, 'rgba(102,168,255,1)');
                        pointArr.push({x: piX, y: piY});
                        // canvasSave(pointArr);//保存点线同步到另一个canvas
                    }
                }
                if (i1 === 0) {
                    i1 = i1 + 1;
                } else {
                    ctx.beginPath();
                    ctx.moveTo(pointArr[i1 - 1].x, pointArr[i1 - 1].y);
                    ctx.lineTo(pointArr[i1].x, pointArr[i1].y);
                    ctx.stroke();
                    i1 = i1 + 1;
                }
            }
        };
        can.onmouseup = function (e) {
            click = 0;
        };
        can.onmousemove = (e) => {
            if (!e.shiftKey && !e.ctrlKey) {
                if (click === 1) {
                    if (e.offsetX || e.layerX) {
                        pointX = e.offsetX == undefined ? e.layerX : e.offsetX;
                        pointY = e.offsetY == undefined ? e.layerY : e.offsetY;
                        var piX, piY;
                        if (oIndex > 0 && pointArr.length > 0) {
                            piX = pointArr[0].x;
                            piY = pointArr[0].y;
                            //画点

                            pointArr.push({x: piX, y: piY});
                            // canvasSave(pointArr);//保存点线同步到另一个canvas
                        } else {
                            let style = window.getComputedStyle(can, null);
                            let cssWidth = parseFloat(style["width"]);
                            let cssHeight = parseFloat(style["height"]);
                            let borderLeft = parseFloat(style["border-left-width"]);
                            let borderTop = parseFloat(style["border-top-width"]);
                            let paddingLeft = parseFloat(style["padding-left"]);
                            let paddingTop = parseFloat(style["padding-top"]);
                            let scaleX = can.width / cssWidth; // 水平方向的缩放因子
                            let scaleY = can.height / cssHeight; // 垂直方向的缩放因子
                            let xx = e.clientX;
                            let yy = e.clientY;
                            let rect = can.getBoundingClientRect();
                            xx -= (rect.left + borderLeft + paddingLeft); // 去除 borderLeft paddingLeft 后的坐标
                            yy -= (rect.top + borderTop + paddingTop); // 去除 borderLeft paddingLeft 后的坐标
                            xx *= scaleX; // 修正水平方向的坐标
                            yy *= scaleY; // 修正垂直方向的坐
                            piX = xx;
                            piY = yy;

                            pointArr.push({x: piX, y: piY});
                            // canvasSave(pointArr);//保存点线同步到另一个canvas
                        }
                    }
                    if (i1 === 0) {
                        i1 = i1 + 1;
                    } else {
                        ctx.beginPath();
                        ctx.moveTo(pointArr[i1 - 1].x, pointArr[i1 - 1].y);
                        ctx.lineTo(pointArr[i1].x, pointArr[i1].y);
                        ctx.stroke();
                        i1 = i1 + 1;
                    }
                }
            }
        };


        can1.onmousedown = function (e) {
            click = 1;
            if (!e.shiftKey && !e.ctrlKey) {
                if (e.offsetX || e.layerX) {
                    pointX = e.offsetX == undefined ? e.layerX : e.offsetX;
                    pointY = e.offsetY == undefined ? e.layerY : e.offsetY;
                    var piX, piY;
                    if (oIndex > 0 && pointArr2.length > 0) {
                        piX = pointArr2[0].x;
                        piY = pointArr2[0].y;
                        //画点
                        makearc1(ctx1, piX, piY, GetRandomNum(10, 10), 0, 180, 'rgba(102,168,255,1)');
                        pointArr2.push({x: piX, y: piY});

                    } else {
                        let style = window.getComputedStyle(can1, null);
                        let cssWidth = parseFloat(style["width"]);
                        let cssHeight = parseFloat(style["height"]);
                        let borderLeft = parseFloat(style["border-left-width"]);
                        let borderTop = parseFloat(style["border-top-width"]);
                        let paddingLeft = parseFloat(style["padding-left"]);
                        let paddingTop = parseFloat(style["padding-top"]);
                        let scaleX = can1.width / cssWidth; // 水平方向的缩放因子
                        let scaleY = can1.height / cssHeight; // 垂直方向的缩放因子
                        let xx = e.clientX;
                        let yy = e.clientY;
                        let rect = can1.getBoundingClientRect();
                        xx -= (rect.left + borderLeft + paddingLeft); // 去除 borderLeft paddingLeft 后的坐标
                        yy -= (rect.top + borderTop + paddingTop); // 去除 borderLeft paddingLeft 后的坐标
                        xx *= scaleX; // 修正水平方向的坐标
                        yy *= scaleY; // 修正垂直方向的坐
                        piX = xx;
                        piY = yy;
                        makearc1(ctx1, piX, piY, GetRandomNum(2, 2), 0, 180, 'rgba(102,168,255,1)');
                        pointArr2.push({x: piX, y: piY});
                    }
                }
                if (i2 === 0) {
                    i2 = i2 + 1;
                } else {
                    ctx1.beginPath();
                    ctx1.moveTo(pointArr2[i2 - 1].x, pointArr2[i2 - 1].y);
                    ctx1.lineTo(pointArr2[i2].x, pointArr2[i2].y);
                    ctx1.stroke();
                    i2 = i2 + 1;
                }
            }
        };
        can1.onmouseup = function (e) {
            click = 0;
        };
        can1.onmousemove = (e) => {
            if (!e.shiftKey && !e.ctrlKey) {
                if (click === 1) {
                    if (e.offsetX || e.layerX) {
                        pointX = e.offsetX == undefined ? e.layerX : e.offsetX;
                        pointY = e.offsetY == undefined ? e.layerY : e.offsetY;
                        var piX, piY;
                        if (oIndex > 0 && pointArr2.length > 0) {
                            piX = pointArr2[0].x;
                            piY = pointArr2[0].y;

                            pointArr2.push({x: piX, y: piY});

                        } else {
                            let style = window.getComputedStyle(can1, null);
                            let cssWidth = parseFloat(style["width"]);
                            let cssHeight = parseFloat(style["height"]);
                            let borderLeft = parseFloat(style["border-left-width"]);
                            let borderTop = parseFloat(style["border-top-width"]);
                            let paddingLeft = parseFloat(style["padding-left"]);
                            let paddingTop = parseFloat(style["padding-top"]);
                            let scaleX = can1.width / cssWidth; // 水平方向的缩放因子
                            let scaleY = can1.height / cssHeight; // 垂直方向的缩放因子
                            let xx = e.clientX;
                            let yy = e.clientY;
                            let rect = can1.getBoundingClientRect();
                            xx -= (rect.left + borderLeft + paddingLeft); // 去除 borderLeft paddingLeft 后的坐标
                            yy -= (rect.top + borderTop + paddingTop); // 去除 borderLeft paddingLeft 后的坐标
                            xx *= scaleX; // 修正水平方向的坐标
                            yy *= scaleY; // 修正垂直方向的坐
                            piX = xx;
                            piY = yy;
                            pointArr2.push({x: piX, y: piY});
                        }
                    }
                    if (i2 === 0) {
                        i2 = i2 + 1;
                    } else {
                        ctx1.beginPath();
                        ctx1.moveTo(pointArr2[i2 - 1].x, pointArr2[i2 - 1].y);
                        ctx1.lineTo(pointArr2[i2].x, pointArr2[i2].y);
                        ctx1.stroke();
                        i2 = i2 + 1;
                    }
                }
            }
        };


        can2.onmousedown = function (e) {
            click = 1;
            if (!e.shiftKey && !e.ctrlKey) {
                if (e.offsetX || e.layerX) {
                    pointX = e.offsetX == undefined ? e.layerX : e.offsetX;
                    pointY = e.offsetY == undefined ? e.layerY : e.offsetY;
                    var piX, piY;
                    if (oIndex > 0 && pointArr2.length > 0) {
                        piX = pointArr3[0].x;
                        piY = pointArr3[0].y;
                        //画点
                        makearc1(ctx2, piX, piY, GetRandomNum(10, 10), 0, 180, 'rgba(102,168,255,1)');
                        pointArr3.push({x: piX, y: piY});
                        // canvasSave(pointArr);//保存点线同步到另一个canvas

                    } else {
                        let style = window.getComputedStyle(can2, null);
                        let cssWidth = parseFloat(style["width"]);
                        let cssHeight = parseFloat(style["height"]);
                        let borderLeft = parseFloat(style["border-left-width"]);
                        let borderTop = parseFloat(style["border-top-width"]);
                        let paddingLeft = parseFloat(style["padding-left"]);
                        let paddingTop = parseFloat(style["padding-top"]);
                        let scaleX = can2.width / cssWidth; // 水平方向的缩放因子
                        let scaleY = can2.height / cssHeight; // 垂直方向的缩放因子
                        let xx = e.clientX;
                        let yy = e.clientY;
                        let rect = can2.getBoundingClientRect();
                        xx -= (rect.left + borderLeft + paddingLeft); // 去除 borderLeft paddingLeft 后的坐标
                        yy -= (rect.top + borderTop + paddingTop); // 去除 borderLeft paddingLeft 后的坐标
                        xx *= scaleX; // 修正水平方向的坐标
                        yy *= scaleY; // 修正垂直方向的坐
                        piX = xx;
                        piY = yy;
                        makearc1(ctx2, piX, piY, GetRandomNum(2, 2), 0, 180, 'rgba(102,168,255,1)');
                        pointArr3.push({x: piX, y: piY});
                        // canvasSave(pointArr);//保存点线同步到另一个canvas
                    }
                }
                if (i3 === 0) {
                    i3 = i3 + 1;
                } else {

                    ctx2.beginPath();
                    ctx2.moveTo(pointArr3[i3 - 1].x, pointArr3[i3 - 1].y);
                    ctx2.lineTo(pointArr3[i3].x, pointArr3[i3].y);
                    ctx2.stroke();
                    i3 = i3 + 1;
                }
            }
        };
        can2.onmouseup = function (e) {
            click = 0;
        };
        can2.onmousemove = (e) => {
            if (!e.shiftKey && !e.ctrlKey) {
                if (click === 1) {
                    if (e.offsetX || e.layerX) {
                        pointX = e.offsetX == undefined ? e.layerX : e.offsetX;
                        pointY = e.offsetY == undefined ? e.layerY : e.offsetY;
                        var piX, piY;
                        if (oIndex > 0 && pointArr2.length > 0) {
                            piX = pointArr3[0].x;
                            piY = pointArr3[0].y;
                            pointArr3.push({x: piX, y: piY});

                        } else {
                            let style = window.getComputedStyle(can2, null);
                            let cssWidth = parseFloat(style["width"]);
                            let cssHeight = parseFloat(style["height"]);
                            let borderLeft = parseFloat(style["border-left-width"]);
                            let borderTop = parseFloat(style["border-top-width"]);
                            let paddingLeft = parseFloat(style["padding-left"]);
                            let paddingTop = parseFloat(style["padding-top"]);
                            let scaleX = can2.width / cssWidth; // 水平方向的缩放因子
                            let scaleY = can2.height / cssHeight; // 垂直方向的缩放因子
                            let xx = e.clientX;
                            let yy = e.clientY;
                            let rect = can2.getBoundingClientRect();
                            xx -= (rect.left + borderLeft + paddingLeft); // 去除 borderLeft paddingLeft 后的坐标
                            yy -= (rect.top + borderTop + paddingTop); // 去除 borderLeft paddingLeft 后的坐标
                            xx *= scaleX; // 修正水平方向的坐标
                            yy *= scaleY; // 修正垂直方向的坐
                            piX = xx;
                            piY = yy;
                            pointArr3.push({x: piX, y: piY});
                        }
                    }
                    if (i3 === 0) {
                        i3 = i3 + 1;
                    } else {

                        ctx2.beginPath();
                        ctx2.moveTo(pointArr3[i3 - 1].x, pointArr3[i3 - 1].y);
                        ctx2.lineTo(pointArr3[i3].x, pointArr3[i3].y);
                        ctx2.stroke();
                        i3 = i3 + 1;
                    }
                }
            }
        };


        function save1Canvas() {
            viewer.length = viewer.volumes.length - 1;
            // ctxSave1.closePath();//结束路径状态，结束当前路径，如果是一个未封闭的图形，会自动将首尾相连封闭起来
            // ctxSave1.fill();//填充
            // ctxSave1.stroke();//绘制
            var m = 0;
            var n = 10000000;
            for (var j = 0; j < pointArr2.length; j++) {
                if (pointArr2[j].x < n) {
                    n = pointArr2[j].x;
                }
                if (pointArr2[j].x > m)
                    m = pointArr2[j].x;
            }
            var q = 0;
            var w = 10000000;
            for (var j = 0; j < pointArr2.length; j++) {
                if (pointArr2[j].y > q) {
                    q = pointArr2[j].y;
                }
                if (pointArr2[j].y < w)
                    w = pointArr2[j].y;
            }

            for (var u = n; u < m; u++) {

                for (var v = w; v < q; v++) {
                    var pt = new point();
                    pt.x = u;
                    pt.y = v;

                    var xx = PointInPoly(pt, pointArr2);
                    if (xx === true) {
                        pointArr1.push({x: u, y: v});

                    }
                }
            }

            viewer.sevolume.display.forEach2(function (panel1) {

                for (var o = 0; o < pointArr1.length; o++) {
                    var slice = panel1.slice;
                    var x1 = panel1.image_center.x - Math.abs(slice.width_space.step * slice.width_space.space_length * panel1.zoom) / 2;
                    var y1 = panel1.image_center.y - Math.abs(slice.height_space.step * slice.height_space.space_length * panel1.zoom) / 2;
                    var zoom = panel1.zoom;
                    var volume = panel1.volume;
                    var cursor;
                    var slice_x, slice_y;
                    var x2 = pointArr1[o].x;
                    var y2 = pointArr1[o].y;
                    slice_x = Math.round((x2 - x1) / zoom / Math.abs(slice.width_space.step));
                    slice_y = Math.round(slice.height_space.space_length - (y2 - y1) / zoom / Math.abs(slice.height_space.step) - 1);
                    var div = $(".voxel-coords");
                    var j = parseInt(div.find("#voxel-j-" + viewer.length).val(), 10);
                    var k = slice_x;
                    var i = slice_y;
                    var header = viewer.sevolume.header;
                    k = header.xspace.step > 0 ? k : header.xspace.space_length - k;
                    i = header.zspace.step > 0 ? i : header.zspace.space_length - i;

                    var time = time === undefined ? viewer.sevolume.current_time : time;
                    if (i < 0 || i >= header[header.order[0]].space_length ||
                        j < 0 || j >= header[header.order[1]].space_length ||
                        k < 0 || k >= header[header.order[2]].space_length) {
                        return 0;
                    }

                    var time_offset = header.time ? time * header.time.offset : 0;
                    var xyzt_offset = (i * header[header.order[0]].offset +
                        j * header[header.order[1]].offset +
                        k * header[header.order[2]].offset +
                        time_offset);


                    viewer.arr2[xyzt_offset] = viewer.grade;

                }

            });
            var o = offset;
            for (var d = 0; d < viewer.arr2.length; d++) {
                arr3[o] = viewer.arr2[d];

                o++;
            }
            viewer.arr3 = arr3;
            viewer.arr3 = viewer.arr3.buffer;
            i2 = 0;
            // canvasSave(pointArr);
            pointArr2 = [];
            pointArr1 = [];
            var div = $(".voxel-coords");
            viewer.save[0] = parseInt(div.find("#voxel-k-" + viewer.length).val(), 10);
            viewer.save[1] = parseInt(div.find("#voxel-j-" + viewer.length).val(), 10);
            viewer.save[2] = parseInt(div.find("#voxel-i-" + viewer.length).val(), 10);
            viewer.volumes.forEach(function (volume) {
                volume.triggerEvent("eventmodelcleanup");
            });
            $('#container').remove();
            viewer.volumes = [];
            viewer.mask = 1;
            viewer.select = 1;

            viewer.loadVolumes1({
                    volumes: [
                        {
                            type: "nifti1",
                            nii_file: document.getElementById("nifti1-file1"),
                            template: {
                                element_id: "volume-ui-template",
                                viewer_insert_class: "volume-viewer-display"
                            }
                        },

                        {
                            type: "nifti1",
                            nii_source: viewer.arr3,
                            template: {
                                element_id: "volume-ui-template",
                                viewer_insert_class: "volume-viewer-display"
                            }
                        },

                    ],
                    overlay: {
                        template: {
                            element_id: "overlay-ui-template",
                            viewer_insert_class: "overlay-viewer-display"
                        }
                    },
                }
            );
        }


        function save2Canvas() {
            viewer.length = viewer.volumes.length - 1;
            // ctxSave2.closePath();//结束路径状态，结束当前路径，如果是一个未封闭的图形，会自动将首尾相连封闭起来
            // ctxSave2.fill();//填充
            // ctxSave2.stroke();//绘制
            var m = 0;
            var n = 10000000;
            for (var j = 0; j < pointArr3.length; j++) {
                if (pointArr3[j].x < n) {
                    n = pointArr3[j].x;
                }
                if (pointArr3[j].x > m)
                    m = pointArr3[j].x;
            }
            var q = 0;
            var w = 10000000;
            for (var j = 0; j < pointArr3.length; j++) {
                if (pointArr3[j].y > q) {
                    q = pointArr3[j].y;
                }
                if (pointArr3[j].y < w)
                    w = pointArr3[j].y;
            }

            for (var u = n; u < m; u++) {

                for (var v = w; v < q; v++) {
                    var pt = new point();
                    pt.x = u;
                    pt.y = v;

                    var xx = PointInPoly(pt, pointArr3);
                    if (xx === true) {
                        pointArr1.push({x: u, y: v});

                    }
                }
            }

            viewer.sevolume.display.forEach3(function (panel1) {

                for (var o = 0; o < pointArr1.length; o++) {
                    var slice = panel1.slice;
                    var x1 = panel1.image_center.x - Math.abs(slice.width_space.step * slice.width_space.space_length * panel1.zoom) / 2;
                    var y1 = panel1.image_center.y - Math.abs(slice.height_space.step * slice.height_space.space_length * panel1.zoom) / 2;
                    var zoom = panel1.zoom;
                    var volume = panel1.volume;
                    var cursor;
                    var slice_x, slice_y;
                    var x2 = pointArr1[o].x;
                    var y2 = pointArr1[o].y;
                    slice_x = Math.round((x2 - x1) / zoom / Math.abs(slice.width_space.step));
                    slice_y = Math.round(slice.height_space.space_length - (y2 - y1) / zoom / Math.abs(slice.height_space.step) - 1);
                    var div = $(".voxel-coords");
                    var i = parseInt(div.find("#voxel-i-" + viewer.length).val(), 10);
                    var k = slice_x;
                    var j = slice_y;

                    var header = viewer.sevolume.header;
                    k = header.xspace.step > 0 ? k : header.xspace.space_length - k;
                    j = header.yspace.step > 0 ? j : header.yspace.space_length - j;

                    var time = time === undefined ? viewer.sevolume.current_time : time;
                    var time_offset = header.time ? time * header.time.offset : 0;
                    var xyzt_offset = (i * header[header.order[0]].offset +
                        j * header[header.order[1]].offset +
                        k * header[header.order[2]].offset +
                        time_offset);


                    viewer.arr2[xyzt_offset] = viewer.grade;
                }

            });

            var o = offset;
            for (var d = 0; d < viewer.arr2.length; d++) {
                arr3[o] = viewer.arr2[d];
                o++;
            }
            viewer.arr3 = arr3;
            viewer.arr3 = viewer.arr3.buffer;
            i3 = 0;
            pointArr3 = [];
            pointArr1 = [];
            var div = $(".voxel-coords");
            viewer.save[0] = parseInt(div.find("#voxel-k-" + viewer.length).val(), 10);
            viewer.save[1] = parseInt(div.find("#voxel-j-" + viewer.length).val(), 10);
            viewer.save[2] = parseInt(div.find("#voxel-i-" + viewer.length).val(), 10);
            viewer.volumes.forEach(function (volume) {
                volume.triggerEvent("eventmodelcleanup");
            });
            $('#container').remove();
            viewer.volumes = [];
            viewer.mask = 1;
            viewer.select = 1;
            viewer.loadVolumes1({
                    volumes: [
                        {
                            type: "nifti1",
                            nii_file: document.getElementById("nifti1-file1"),
                            template: {
                                element_id: "volume-ui-template",
                                viewer_insert_class: "volume-viewer-display"
                            }
                        },
                        {
                            type: "nifti1",
                            nii_source: viewer.arr3,
                            template: {
                                element_id: "volume-ui-template",
                                viewer_insert_class: "volume-viewer-display"
                            }
                        },

                    ],
                    overlay: {
                        template: {
                            element_id: "overlay-ui-template",
                            viewer_insert_class: "overlay-viewer-display"
                        }
                    },
                }
            );
        }

        /*生成画布 结束绘画*/
        function saveCanvas() {
            viewer.length = viewer.volumes.length - 1;
            // ctx.clearRect(0, 0, can.width, can.height);
            // ctxSave.closePath();//结束路径状态，结束当前路径，如果是一个未封闭的图形，会自动将首尾相连封闭起来
            // ctxSave.fill();//填充
            // ctxSave.stroke();//绘制
            var m = 0;
            var n = 10000000;
            for (var j = 0; j < pointArr.length; j++) {
                if (pointArr[j].x < n) {
                    n = pointArr[j].x;
                }
                if (pointArr[j].x > m)
                    m = pointArr[j].x;
            }
            var q = 0;
            var w = 10000000;
            for (var j = 0; j < pointArr.length; j++) {
                if (pointArr[j].y > q) {
                    q = pointArr[j].y;
                }
                if (pointArr[j].y < w)
                    w = pointArr[j].y;
            }

            for (var u = n; u < m; u++) {

                for (var v = w; v < q; v++) {
                    var pt = new point();
                    pt.x = u;
                    pt.y = v;

                    var xx = PointInPoly(pt, pointArr);
                    if (xx === true) {
                        pointArr1.push({x: u, y: v});

                    }
                }
            }

            viewer.sevolume.display.forEach1(function (panel1) {

                for (var o = 0; o < pointArr1.length; o++) {
                    var slice = panel1.slice;
                    var x1 = panel1.image_center.x - Math.abs(slice.width_space.step * slice.width_space.space_length * panel1.zoom) / 2;
                    var y1 = panel1.image_center.y - Math.abs(slice.height_space.step * slice.height_space.space_length * panel1.zoom) / 2;
                    var zoom = panel1.zoom;
                    var volume = panel1.volume;
                    var cursor;
                    var slice_x, slice_y;
                    var x2 = pointArr1[o].x;
                    var y2 = pointArr1[o].y;
                    slice_x = Math.round((x2 - x1) / zoom / Math.abs(slice.width_space.step));
                    slice_y = Math.round(slice.height_space.space_length - (y2 - y1) / zoom / Math.abs(slice.height_space.step) - 1);
                    var div = $(".voxel-coords");
                    var k = parseInt(div.find("#voxel-k-" + viewer.length).val(), 10);
                    var j = slice_x;
                    var i = slice_y;
                    var header = viewer.sevolume.header;

                    j = header.yspace.step > 0 ? j : header.yspace.space_length - j;
                    i = header.zspace.step > 0 ? i : header.zspace.space_length - i;
                    var time = time === undefined ? viewer.sevolume.current_time : time;
                    var time_offset = header.time ? time * header.time.offset : 0;
                    var xyzt_offset = (i * header[header.order[0]].offset +
                        j * header[header.order[1]].offset +
                        k * header[header.order[2]].offset +
                        time_offset);

                    viewer.arr2[xyzt_offset] = viewer.grade;

                }

            });
            var o = offset;
            for (var d = 0; d < viewer.arr2.length; d++) {
                arr3[o] = viewer.arr2[d];
                o++;
            }

            viewer.arr3 = arr3;
            viewer.arr3 = viewer.arr3.buffer;
            i1 = 0;
            pointArr = []; //
            pointArr1 = []; //标记的点数组清空
            var div = $(".voxel-coords");
            viewer.save[0] = parseInt(div.find("#voxel-k-" + viewer.length).val(), 10);
            viewer.save[1] = parseInt(div.find("#voxel-j-" + viewer.length).val(), 10);
            viewer.save[2] = parseInt(div.find("#voxel-i-" + viewer.length).val(), 10);
            viewer.volumes.forEach(function (volume) {
                volume.triggerEvent("eventmodelcleanup");
            });
            $('#container').remove();
            viewer.volumes = [];
            viewer.mask = 1;
            viewer.select = 1;
            viewer.loadVolumes1({
                    volumes: [
                        {
                            type: "nifti1",
                            nii_file: document.getElementById("nifti1-file1"),
                            template: {
                                element_id: "volume-ui-template",
                                viewer_insert_class: "volume-viewer-display"
                            }
                        },

                        {
                            type: "nifti1",
                            nii_source: viewer.arr3,
                            template: {
                                element_id: "volume-ui-template",
                                viewer_insert_class: "volume-viewer-display"
                            }
                        },

                    ],
                    overlay: {
                        template: {
                            element_id: "overlay-ui-template",
                            viewer_insert_class: "overlay-viewer-display"
                        }
                    },
                }
            );
        }

        /* 三个视图下方的 undo last point 点击事件 */
        $("#delete1").click(function () {
            ctx.clearRect(0, 0, can.width, can.height);
            pointArr.length = pointArr.length - 1;
            ctx.beginPath();
            ctx.moveTo(pointArr[0].x, pointArr[0].y);
            for (i1 = 1; i1 < pointArr.length; i1++) {
                ctx.lineTo(pointArr[i1].x, pointArr[i1].y);
            }
            ctx.fillStyle = 'rgba(161,195,255,0)';//填充颜色
            ctx.fill();//填充
            ctx.stroke();//绘制
        });
        $("#delete2").click(function () {
            ctx1.clearRect(0, 0, can1.width, can1.height);
            pointArr2.length = pointArr2.length - 1;
            ctx1.beginPath();
            ctx1.moveTo(pointArr2[0].x, pointArr2[0].y);
            for (i2 = 1; i2 < pointArr2.length; i2++) {
                ctx1.lineTo(pointArr2[i2].x, pointArr2[i2].y);
            }
            ctx1.fillStyle = 'rgba(161,195,255,0)';//填充颜色
            ctx1.fill();//填充
            ctx1.stroke();//绘制
        });
        $("#delete3").click(function () {
            ctx2.clearRect(0, 0, can2.width, can2.height);
            pointArr3.length = pointArr3.length - 1;
            ctx2.beginPath();
            ctx2.moveTo(pointArr3[0].x, pointArr3[0].y);
            for (i3 = 1; i3 < pointArr3.length; i3++) {
                ctx2.lineTo(pointArr3[i3].x, pointArr3[i3].y);
            }
            ctx2.fillStyle = 'rgba(161,195,255,0)';//填充颜色
            ctx2.fill();//填充
            ctx2.stroke();//绘制
        });

        /* 三个视图下方的 clear 点击事件 */
        $("#clear1").click(function () {
            ctx.clearRect(0, 0, can.width, can.height);
            pointArr = [];
            i1 = 0;
        });
        $("#clear2").click(function () {
            ctx1.clearRect(0, 0, can1.width, can1.height);
            pointArr2 = [];
            i2 = 0;
        });
        $("#clear3").click(function () {
            ctx2.clearRect(0, 0, can2.width, can2.height);
            pointArr3 = [];
            i3 = 0;
        });

        /* 三个视图下方的 complete 和 accept 点击事件 */
        $("#complete1").click(function () {
            ctx.beginPath();
            ctx.moveTo(pointArr[pointArr.length - 1].x, pointArr[pointArr.length - 1].y);
            ctx.lineTo(pointArr[0].x, pointArr[0].y);

            ctx.fill();//填充
            ctx.stroke();//绘制
        });
        $("#accept1").click(function () {
            saveCanvas();
            ctx.clearRect(0, 0, can.width, can.height);
        });

        $("#complete2").click(function () {
            ctx1.beginPath();
            ctx1.moveTo(pointArr2[pointArr2.length - 1].x, pointArr2[pointArr2.length - 1].y);
            ctx1.lineTo(pointArr2[0].x, pointArr2[0].y);

            ctx1.fill();//填充
            ctx1.stroke();//绘制
        });
        $("#accept2").click(function () {
            save1Canvas();
            ctx1.clearRect(0, 0, can.width, can.height);
        });

        $("#complete3").click(function () {
            ctx2.beginPath();
            ctx2.moveTo(pointArr3[pointArr3.length - 1].x, pointArr3[pointArr3.length - 1].y);
            ctx2.lineTo(pointArr3[0].x, pointArr3[0].y);

            ctx2.fill();//填充
            ctx2.stroke();//绘制
        });
        $("#accept3").click(function () {
            save2Canvas();
            ctx2.clearRect(0, 0, can.width, can.height);
        });

        // 保存按钮
        $('#savenii').click(function () {

            var maskname = document.getElementById("maskname").value;
            var name = maskname + ".nii";
            saveShareContent(viewer.arr3, name);
            i1 = 0;
            i2 = 0;
            i3 = 0;
        });

        function PointInPoly(pt, poly) {
            for (var c = false, i = -1, l = poly.length, j = l - 1; ++i < l; j = i)
                ((poly[i].y <= pt.y && pt.y < poly[j].y) || (poly[j].y <= pt.y && pt.y < poly[i].y))
                && (pt.x < (poly[j].x - poly[i].x) * (pt.y - poly[i].y) / (poly[j].y - poly[i].y) + poly[i].x)
                && (c = !c);
            return c;
        }

        /*canvas生成圆点*/
        function GetRandomNum(Min, Max) {
            var Range = Max - Min;
            var Rand = Math.random();
            return (Min + Math.round(Rand * Range));
        }

        function saveShareContent(content, fileName) {
            let downLink = document.createElement('a')
            downLink.download = fileName
            //字符内容转换为blod地址
            let blob = new Blob([content])
            downLink.href = URL.createObjectURL(blob)
            // 链接插入到页面
            document.body.appendChild(downLink)
            downLink.click()
            // 移除下载链接
            document.body.removeChild(downLink)
        }

        function makearc(ctx, x, y, r, s, e, color) {
            // ctx.clearRect(0, 0, 199, 202);//清空画布
            ctx.beginPath();
            ctx.fillStyle = color;
            ctx.arc(x, y, 2, s, e);
            ctx.fill();
        }

        function makearc1(ctx1, x, y, r, s, e, color) {
            // ctx.clearRect(0, 0, 199, 202);//清空画布
            ctx1.beginPath();
            ctx1.fillStyle = color;
            ctx1.arc(x, y, 2, s, e);
            ctx1.fill();
        }

        // edit1 下的canvas 画布
        const gCanvas = document.querySelector('#editbox');
        const gCanvas1 = document.querySelector('#edit1box');
        const gCanvas2 = document.querySelector('#edit2box');

        function onSave() {
            gCanvas.toBlob((blob) => {
                const timestamp = Date.now().toString();
                const a = document.createElement('a');
                document.body.append(a);
                a.download = `${timestamp}.png`;
                a.href = URL.createObjectURL(blob);
                a.click();
                a.remove();
            });
        }

        function onSave1() {
            gCanvas1.toBlob((blob) => {
                const timestamp = Date.now().toString();
                const a = document.createElement('a');
                document.body.append(a);
                a.download = `${timestamp}.png`;
                a.href = URL.createObjectURL(blob);
                a.click();
                a.remove();
            });
        }

        function onSave2() {
            gCanvas2.toBlob((blob) => {
                const timestamp = Date.now().toString();
                const a = document.createElement('a');
                document.body.append(a);
                a.download = `${timestamp}.png`;
                a.href = URL.createObjectURL(blob);
                a.click();
                a.remove();
            });
        }

        // 保存单个视图为png图像
        document.querySelector('#saveimg0').addEventListener('click', onSave);
        document.querySelector('#saveimg1').addEventListener('click', onSave1);
        document.querySelector('#saveimg2').addEventListener('click', onSave2);
        document.querySelector('#coverimg2').addEventListener('click', onSave1);
        document.querySelector('#coverimg1').addEventListener('click', onSave);
        document.querySelector('#coverimg3').addEventListener('click', onSave2);

        // This will create an image of all the display panels
        // currently being shown in the viewer.
        $("#screenshot").click(function () {
            var width = 0;
            var height = 0;
            var active_panel = viewer.active_panel;

            // Create a canvas on which we'll draw the images.
            var canvas = document.createElement("canvas");
            var canvas1 = document.getElementById("canvas1");
            var context = canvas.getContext("2d");
            var img = new Image();

            viewer.volumes.forEach(function (volume) {
                volume.display.forEach(function (panel) {
                    width = Math.max(width, panel.canvas.width);
                    height = Math.max(height, panel.canvas.height);
                });
            });

            canvas.width = width * viewer.volumes.length;
            canvas.height = height * 3;
            context.fillStyle = "#000000";
            context.fillRect(0, 0, canvas.width, canvas.height);

            // The active canvas is highlighted by the viewer,
            // so we set it to null and redraw the highlighting
            // isn't shown in the image.
            if (active_panel) {
                active_panel.updated = true;
                viewer.active_panel = null;
                viewer.draw();
            }

            viewer.volumes.forEach(function (volume, x) {
                volume.display.forEach(function (panel, axis_name, y) {
                    context.drawImage(panel.canvas, x * width, y * height);
                });
            });

            // Restore the active canvas.
            if (active_panel) {
                active_panel.updated = true;
                viewer.active_panel = active_panel;
                viewer.draw();
            }

            // Show the created image in a dialog box.
            img.onload = function () {
                $("<div></div>").append(img).dialog({
                    title: "Slices",
                    height: img.height,
                    width: img.width
                });

            };

            img.src = canvas.toDataURL('image/png');
            var url = img.src;
            var a = document.createElement('a');          // 创建一个a节点插入的document
            var event = new MouseEvent('click')           // 模拟鼠标click点击事件
            a.download = '图片名字'                  // 设置a节点的download属性值
            a.href = url;                                 // 将图片的src赋值给a节点的href
            a.dispatchEvent(event)
        });

        $(document).keypress(function (e) {
            if (e.keyCode === 114) {
                // Reset displays if user presses 'r' key.
                viewer.resetDisplays();
                viewer.redrawVolumes();
            }

        });

        /**
         * @doc function
         * @name viewer.setAutoResize
         * @param {boolean} flag Whether we should auto-resize the views.
         * @param {string} class_name The name of the class associated with volume
         * controls.
         *
         * @description
         * Enable or disable auto-resizing mode.
         * ```js
         * viewer.setAutoResize(true, 'volume-controls');
         * ```
         */
        viewer.setAutoResize = function (flag, class_name) {
            viewer.auto_resize = flag;
            viewer.volume_control_class = class_name;
        };

        /**
         * @doc function
         * @name viewer.doAutoResize
         * @description
         * This function implements auto-resizing of the volume panels
         * when the window itself is resized. It should therefore be invoked
         * as part of a window resize notification.
         */
        viewer.doAutoResize = function () {
            if (!viewer.auto_resize) {
                return;
            }

            function getIntProperty(class_name, prop_name) {
                return parseInt($(class_name).css(prop_name).replace('px', ''), 10);
            }

            /* Assumes at least three views or three volumes across.*/
            var n = Math.max(viewer.volumes.length, 3);
            var ml = getIntProperty('.slice-display', 'margin-left');
            var mr = getIntProperty('.slice-display', 'margin-right');

            var size = $('#' + viewer.dom_element.id).width() / n - (ml + mr);

            viewer.setDefaultPanelSize(size, size);
            viewer.setPanelSize(size, size, {scale_image: true});

            if (viewer.volume_control_class) {
                var pd = getIntProperty("." + viewer.volume_control_class, 'padding');
                $("." + viewer.volume_control_class).width(size - pd * 2);
            }
        };

        window.addEventListener('resize', viewer.doAutoResize, false);


        //////////////////////////////////
        // Per volume UI hooks go in here.
        //////////////////////////////////
        viewer.addEventListener("volumeuiloaded", function (event) {
            var container = event.container;
            var volumed = event.volume;
            var vol_id = event.volume_id;

            container = $(container);

            container.find(".button").button();

            // The world coordinate input fields.
            container.find(".world-coords").change(function () {
                var div = $(this);

                var x = parseFloat(div.find("#world-x-" + vol_id).val());
                var y = parseFloat(div.find("#world-y-" + vol_id).val());
                var z = parseFloat(div.find("#world-z-" + vol_id).val());

                // Make sure the values are numeric.
                if (!BrainBrowser.utils.isNumeric(x)) {
                    x = 0;
                }
                if (!BrainBrowser.utils.isNumeric(y)) {
                    y = 0;
                }
                if (!BrainBrowser.utils.isNumeric(z)) {
                    z = 0;
                }

                // Set coordinates and redraw.
                if (viewer.synced) {
                    viewer.volumes.forEach(function (volume) {
                        volume.setWorldCoords(x, y, z);
                    });
                } else {
                    viewer.volumes[vol_id].setWorldCoords(x, y, z);
                }

                viewer.redrawVolumes();
            });

            // The voxel coordinate input fields.
            container.find(".voxel-coords").change(function () {

                var div = $(this);
                var i = parseInt(div.find("#voxel-i-" + vol_id).val(), 10);
                var j = parseInt(div.find("#voxel-j-" + vol_id).val(), 10);
                var k = parseInt(div.find("#voxel-k-" + vol_id).val(), 10);
                // Make sure the values are numeric.
                if (!BrainBrowser.utils.isNumeric(i)) {
                    i = 0;
                }
                if (!BrainBrowser.utils.isNumeric(j)) {
                    j = 0;
                }
                if (!BrainBrowser.utils.isNumeric(k)) {
                    k = 0;
                }
                var volume = viewer.volumes[length];
                console.log(volume);
                volume.position["xspace"] = k;
                volume.position["yspace"] = j;
                volume.position["zspace"] = i;
                volume.display.forEach(function (other_panel) {
                    other_panel.updateSlice();
                });
            });

            // Color map URLs are read from the config file and added to the
            // color map select box.
            var color_map_select = $('<select id="color-map-select"></select>').change(function () {
                var selection = $(this).find(":selected");
                viewer.loadVolumeColorMapFromURL(vol_id, selection.val(), selection.data("cursor-color"), function () {
                    viewer.redrawVolumes();
                });
            });

            BrainBrowser.config.get("color_maps").forEach(function (color_map) {
                color_map_select.append('<option value="' + color_map.url +
                    '" data-cursor-color="' + color_map.cursor_color + '">' +
                    color_map.name + '</option>'
                );
            });
            $("#color-map-" + vol_id).append(color_map_select);

            // Load a color map select by the user.
            container.find(".color-map-file").change(function () {
                viewer.loadVolumeColorMapFromFile(vol_id, this, "#FF0000", function () {
                    viewer.redrawVolumes();
                });
            });

            // Change the range of intensities that will be displayed.更改将显示的强度范围。
            container.find(".threshold-div").each(function () {
                var div = $(this);

                // Input fields to input min and max thresholds directly.
                var min_input = div.find("#min-threshold-" + vol_id);
                var max_input = div.find("#max-threshold-" + vol_id);

                // Slider to modify min and max thresholds.
                var slider = div.find(".slider");

                var volume = viewer.volumes[vol_id];

                // Update the input fields.
                min_input.val(volume.getVoxelMin());
                max_input.val(volume.getVoxelMax());

                slider.slider({
                    range: true,
                    min: volume.getVoxelMin(),
                    max: volume.getVoxelMax(),
                    values: [volume.getVoxelMin(), volume.getVoxelMax()],
                    step: 1,
                    slide: function (event, ui) {
                        var values = ui.values;

                        // Update the input fields.
                        min_input.val(values[0]);
                        max_input.val(values[1]);

                        // Update the volume and redraw.
                        volume.intensity_min = values[0];
                        volume.intensity_max = values[1];
                        viewer.redrawVolumes();
                    },
                    stop: function () {
                        $(this).find("a").blur();
                    }
                });

                // Input field for minimum threshold.
                min_input.change(function () {
                    var value = parseFloat(this.value);

                    // Make sure input is numeric and in range.
                    if (!BrainBrowser.utils.isNumeric(value)) {
                        value = volume.getVoxelMin();
                    }
                    value = Math.max(volume.getVoxelMin(),
                        Math.min(value, volume.getVoxelMax()));
                    this.value = value;

                    // Update the slider.
                    slider.slider("values", 0, value);

                    // Update the volume and redraw.
                    volume.intensity_min = value;
                    viewer.redrawVolumes();
                });

                max_input.change(function () {
                    var value = parseFloat(this.value);

                    // Make sure input is numeric and in range.
                    if (!BrainBrowser.utils.isNumeric(value)) {
                        value = volume.getVoxelMax();
                    }
                    value = Math.max(volume.getVoxelMin(),
                        Math.min(value, volume.getVoxelMax()));
                    this.value = value;

                    // Update the slider.
                    slider.slider("values", 1, value);

                    // Update the volume and redraw.
                    volume.intensity_max = value;
                    viewer.redrawVolumes();
                });

            });

            // Create an image of all slices in a certain
            // orientation.
            container.find(".slice-series-div").each(function () {
                var div = $(this);
                var space_names = {
                    xspace: "Sagittal",
                    yspace: "Coronal",
                    zspace: "Transverse"
                };
                div.find(".slice-series-button").click(function () {
                    var axis_name = $(this).data("axis");
                    var axis = volumed.header[axis_name];
                    var space_length = axis.space_length;
                    var time = volumed.current_time;
                    var per_column = 10;
                    var zoom = 0.5;
                    var i, x, y;

                    // Canvas on which to draw the images.
                    var canvas = document.createElement("canvas");
                    var context = canvas.getContext("2d");

                    // Get first slice to set dimensions of the canvas.
                    var image_data = volumed.getSliceImage(volumed.slice(axis_name, 0, time), zoom);
                    var img = new Image();
                    canvas.width = per_column * image_data.width;
                    canvas.height = Math.ceil(space_length / per_column) * image_data.height;
                    // Math.ceil向上取整
                    context.fillStyle = "#000000";
                    context.fillRect(0, 0, canvas.width, canvas.height);

                    // Draw the slice on the canvas.
                    context.putImageData(image_data, 0, 0);

                    // Draw the rest of the slices on the canvas.
                    for (i = 1; i < space_length; i++) {
                        image_data = volumed.getSliceImage(volumed.slice(axis_name, i, time), zoom);
                        x = i % per_column * image_data.width;
                        y = Math.floor(i / per_column) * image_data.height;
                        context.putImageData(image_data, x, y);
                    }

                    // Retrieve image from canvas and display it
                    // in a dialog box.
                    img.onload = function () {
                        $("<div></div>").append(img).dialog({
                            title: space_names[axis_name] + " Slices",
                            height: 600,
                            width: img.width
                        });
                    };

                    img.src = canvas.toDataURL();
                });
            });

            container.find(".To2D").each(function() {
                var div = $(this);
                div.find(".2D").click(function() {
                    // 按键操作测量提示文字隐藏
                    $("#instructions").hide();
                    $("#brainbrowser-wrapper").hide();
                    // Dicom按钮操作隐藏
                    $("#viewer").show();
                    // $("#To3D").show();
                    //viewer.clearVolumes();  // Clear all loaded volumes.

                    // if (Flag_dcm){
                    //   viewer.loadVolume({
                    //     type: "Dicom1",
                    //     dicom_files: file_dcm,
                    //     template: {
                    //       element_id: "volume-ui-template",
                    //       viewer_insert_class: "volume-viewer-display"
                    //     }
                    //   }, function() {
                    //     $(".slice-display").css("display", "inline");
                    //     $(".volume-controls").css("width", "auto");
                    //   });
                    //
                    // }else{
                    //   viewer.loadVolume({
                    //     type: "Dicom1",
                    //     Dicom_url: "studies/Dicom.json",
                    //     template: {
                    //       element_id: "volume-ui-template",
                    //       viewer_insert_class: "volume-viewer-display"
                    //     }
                    //   }, function() {
                    //     $(".slice-display").css("display", "inline");
                    //     $(".volume-controls").css("width", "auto");
                    //   });
                    // }
                });

            });

            // Blend controls for a multivolume overlay.
            container.find(".blend-div").each(function () {
                var div = $(this);
                var slider = div.find(".slider");
                var blend_input = div.find("#blend-val");
                // Slider to select blend value.
                slider.slider({
                    min: 0,
                    max: 1,
                    step: 0.01,
                    value: 0.5,
                    slide: function (event, ui) {
                        var value = parseFloat(ui.value);
                        volumed.blend_ratios[1] = value;
                        blend_input.val(value);
                        viewer.redrawVolumes();
                    },
                    stop: function () {
                        $(this).find("a").blur();
                    }
                });

                // Input field to select blend values explicitly.
                blend_input.change(function () {
                    var value = parseFloat(this.value);

                    // Check that input is numeric and in range.
                    if (!BrainBrowser.utils.isNumeric(value)) {
                        value = 0;
                    }
                    value = Math.max(0, Math.min(value, 1));
                    this.value = value;
                    // Update slider and redraw volumes.
                    slider.slider("value", value);
                    volumed.blend_ratios[1] = value;
                    viewer.redrawVolumes();
                });
            });


            $("#clear").click(function(){
                viewer.volumes.forEach(function (volume) {
                    volume.display.forEach(function (panel) {
                        panel.anchor = null;
                        panel.angle = null;
                        panel.arrow = null;
                        panel.Elliptical = null;
                        panel.Rectangle = null;
                    });
                    var edit = document.getElementById("edit");
                    edit.removeEventListener("mousedown", WWWL,false);
                    edit.onmouseup= function() {};
                    edit.removeEventListener("mousedown", Pan,false);
                    edit.removeEventListener("mousedown",Zoom_x,false);
                    edit.removeEventListener("mousedown",Zoom_D,false);
                    edit.removeEventListener("mousedown",Length,false);
                    edit.removeEventListener("mousedown",arrowAnnotate,false);
                    edit.removeEventListener("mousedown",simpleAngle,false);
                    edit.removeEventListener("mousedown",Rectangle,false);
                    edit.removeEventListener("mousedown",Elliptical,false);
                });
            });


            $("#WW-WL").click(function(){
                viewer.volumes.forEach(function (volume) {
                    volume.display.forEach(function (panel) {
                        panel.anchor = null;
                        panel.angle = null;
                        panel.arrow = null;
                        panel.Elliptical = null;
                        panel.Rectangle = null;
                    });
                });
                var edit = document.getElementById("edit");
                edit.removeEventListener("mousedown", Pan,false);
                edit.removeEventListener("mousedown",Zoom_x,false);
                edit.removeEventListener("mousedown",Zoom_D,false);
                edit.removeEventListener("mousedown",Length,false);
                edit.removeEventListener("mousedown",arrowAnnotate,false);
                edit.removeEventListener("mousedown",simpleAngle,false);
                edit.removeEventListener("mousedown",Rectangle,false);
                edit.removeEventListener("mousedown",Elliptical,false);
                edit.addEventListener("mousedown",WWWL,false);
                var views = ["xspace", "yspace", "zspace"];
                views.forEach(function(axis_name) {
                    var panel = volumed.display.getPanel(axis_name);
                    var canvas = panel.canvas;
                    canvas.removeEventListener("mousedown",function () {

                    },false);

                });
            });

            function WWWL(e){
                var a1 = e.clientY;

                    edit.onmouseup = function(e) {
                        var a2 = e.clientY;
                        if (a2>a1){
                            var a3 =1 + 0.01*(a2-a1);
                            //var value3dL = volume.windowHigh;
                            //var value3dH = volume.max < volume.windowHigh + (a2-a1)*10 ? volume.max :volume.windowHigh + (a2-a1)*10;
                        }else{
                            var a3 =1 - 0.01*(a1-a2);
                            //var value3dH = volume.windowHigh;
                            //var value3dL = 0 > volume.windowHigh - (a1-a2)*10 ? 0:volume.windowHigh - (a1-a2)*10;
                        }
                        var value = parseFloat(a3);
                        volumed.display.setContrast(value);
                        volumed.display.refreshPanels();
                        viewer.redrawVolumes();

                        //windowLevelVolume(value3dH,value3dL);
                    }

            }

            $("#Invert").click(function(){
                // if (volumed.invert == false){
                //     volumed.invert = true;
                // }else {
                //     volumed.invert = false;
                // }

                var max = viewer.volumedata[0].intensity_max;
                for (let i = 0; i < viewer.volumedata[0].data.length; i++) {
                    viewer.volumes[0].data[i] = max- viewer.volumedata[0].data[i];
                    viewer.volumedata[0].data[i] = viewer.volumes[0].data[i];
                };
                //viewer.volumedata[0].data = max;
                //viewer.volumedata[0].data = max-viewer.volumedata[0].data;
                volumed.display.refreshPanels();
                viewer.redrawVolumes();
            });

            function Pan(event) {
                let current_target = null;
                var axis_name = event.target.id;
                if (axis_name=="editbox"){
                    axis_name = "xspace";
                }else if(axis_name=="edit1box"){
                    axis_name = "yspace";
                }else {
                    axis_name = "zspace";
                }
                var views = ["xspace"];
                views.forEach(function(e) {
                    const panel = volumed.display.getPanel(axis_name);
                    //const canvas = panel.canvas;

                    function mouseDrag(event) {
                        if(event.target === current_target) {
                            event.preventDefault();

                            panel.followPointer(panel.mouse);
                        }
                    }

                    function mouseDragEnd() {
                        document.removeEventListener("mousemove", mouseDrag, false);
                        document.removeEventListener("mouseup", mouseDragEnd, false);
                        //canvas.removeEventListener("mousedown",pann, false);
                        viewer.volumes.forEach(function(volume) {
                            volume.display.forEach(function(panel) {
                                panel.anchor = null;
                                panel.angle = null;
                                panel.arrow = null;
                                panel.Elliptical = null;
                                panel.Rectangle = null;
                            });
                        });
                        current_target = null;
                    }
                    //function pann(event){
                        event.preventDefault();

                        current_target = event.target;

                        if (viewer.active_panel) {
                            viewer.active_panel.updated = true;
                        }
                        viewer.active_panel = panel;

                        document.addEventListener("mousemove", mouseDrag , false);
                        document.addEventListener("mouseup", mouseDragEnd, false);
                   // }
                   // canvas.addEventListener("mousedown",pann, false);


                });
            }

            $("#Pan").click(function(){
                viewer.volumes.forEach(function (volume) {
                    volume.display.forEach(function (panel) {
                        panel.anchor = null;
                        panel.angle = null;
                        panel.arrow = null;
                        panel.Elliptical = null;
                        panel.Rectangle = null;
                    });
                });
                var edit = document.getElementById("edit");
                edit.removeEventListener("mousedown", WWWL,false);
                edit.onmouseup= function() {};
                edit.removeEventListener("mousedown",Zoom_x,false);
                edit.removeEventListener("mousedown",Zoom_D,false);
                edit.removeEventListener("mousedown",Length,false);
                edit.removeEventListener("mousedown",arrowAnnotate,false);
                edit.removeEventListener("mousedown",simpleAngle,false);
                edit.removeEventListener("mousedown",Rectangle,false);
                edit.removeEventListener("mousedown",Elliptical,false);
                edit.addEventListener("mousedown",Pan,false);
            });

            $("#Zoom-D").click(function(){
                viewer.volumes.forEach(function (volume) {
                    volume.display.forEach(function (panel) {
                        panel.anchor = null;
                        panel.angle = null;
                        panel.arrow = null;
                        panel.Elliptical = null;
                        panel.Rectangle = null;
                    });
                });
                var edit = document.getElementById("edit");
                edit.removeEventListener("mousedown", WWWL,false);
                edit.onmouseup= function() {};
                edit.removeEventListener("mousedown",Pan,false);
                edit.removeEventListener("mousedown",Zoom_x,false);
                edit.removeEventListener("mousedown",Length,false);
                edit.removeEventListener("mousedown",arrowAnnotate,false);
                edit.removeEventListener("mousedown",simpleAngle,false);
                edit.removeEventListener("mousedown",Rectangle,false);
                edit.removeEventListener("mousedown",Elliptical,false);
                edit.addEventListener("mousedown",Zoom_D,false);
            });

            function Zoom_D(event){
                var panel;
                var e;

                var views = ["xspace", "yspace", "zspace"];
                views.forEach(function(axis_name) {
                    panel = volumed.display.getPanel(axis_name);
                    event.preventDefault();
                    zoom();

                    function zoom(delta) {
                        //panel.zoom *= (delta < 0) ? 1/1.05 : 1.05;
                        panel.zoom *= 1.05;
                        panel.zoom = Math.max(panel.zoom, 0.25);
                        panel.updateVolumePosition();
                        panel.updateSlice();
                        if (viewer.synced){
                            viewer.volumes.forEach(function(synced_volume, synced_vol_id) {
                                var synced_panel = synced_volume.display.getPanel(axis_name);

                                if (synced_vol_id !== vol_id) {
                                    synced_panel.zoom = panel.zoom;
                                    synced_panel.updateVolumePosition();
                                    synced_panel.updateSlice();
                                }
                            });
                        }
                    }
                });

            }

            $("#Zoom-x").click(function(){
                viewer.volumes.forEach(function (volume) {
                    volume.display.forEach(function (panel) {
                        panel.anchor = null;
                        panel.angle = null;
                        panel.arrow = null;
                        panel.Elliptical = null;
                        panel.Rectangle = null;
                    });
                });
                var edit = document.getElementById("edit");
                edit.removeEventListener("mousedown", WWWL,false);
                edit.onmouseup= function() {};
                edit.removeEventListener("mousedown",Pan,false);
                edit.removeEventListener("mousedown",Zoom_D,false);
                edit.removeEventListener("mousedown",Length,false);
                edit.removeEventListener("mousedown",arrowAnnotate,false);
                edit.removeEventListener("mousedown",simpleAngle,false);
                edit.removeEventListener("mousedown",Rectangle,false);
                edit.removeEventListener("mousedown",Elliptical,false);
                edit.addEventListener("mousedown",Zoom_x,false);
            });

            function Zoom_x(event){
                var panel;

                var views = ["xspace", "yspace", "zspace"];
                views.forEach(function(axis_name) {
                    panel = volumed.display.getPanel(axis_name);
                    event.preventDefault();
                    zoom();

                    function zoom(delta) {
                        //panel.zoom *= (delta < 0) ? 1/1.05 : 1.05;
                        panel.zoom *=  1/1.05;
                        panel.zoom = Math.max(panel.zoom, 0.25);
                        panel.updateVolumePosition();
                        panel.updateSlice();
                        if (viewer.synced){
                            viewer.volumes.forEach(function(synced_volume, synced_vol_id) {
                                var synced_panel = synced_volume.display.getPanel(axis_name);

                                if (synced_vol_id !== vol_id) {
                                    synced_panel.zoom = panel.zoom;
                                    synced_panel.updateVolumePosition();
                                    synced_panel.updateSlice();
                                }
                            });
                        }
                    }
                });

            }

            $("#Length").click(function(){
                var edit = document.getElementById("edit");
                edit.removeEventListener("mousedown", WWWL,false);
                edit.onmouseup= function() {};
                edit.removeEventListener("mousedown",Pan,false);
                edit.removeEventListener("mousedown",Zoom_D,false);
                edit.removeEventListener("mousedown",Zoom_x,false);
                edit.removeEventListener("mousedown",arrowAnnotate,false);
                edit.removeEventListener("mousedown",simpleAngle,false);
                edit.removeEventListener("mousedown",Rectangle,false);
                edit.removeEventListener("mousedown",Elliptical,false);
                edit.addEventListener("mousedown",Length,false);
            });

            function Length(event){
                var axis_name = event.target.id;
                if (axis_name=="editbox"){
                    axis_name = "xspace";
                }else if(axis_name=="edit1box"){
                    axis_name = "yspace";
                }else {
                    axis_name = "zspace";
                }
                var views = ["xspace"];
                views.forEach(function(e) {
                    var panel = volumed.display.getPanel(axis_name);

                    viewer.volumes.forEach(function (volume) {
                        volume.display.forEach(function (panel) {
                            panel.anchor = null;
                            panel.angle = null;
                            panel.arrow = null;
                            panel.Elliptical = null;
                            panel.Rectangle = null;
                        });
                    });

                    panel.anchor = {
                        x: panel.mouse.x,
                        y: panel.mouse.y
                    };

                    panel.updated = true;

                    panel.updateVolumePosition(panel.mouse.x, panel.mouse.y);
                    volumed.display.forEach(function (other_panel) {
                        if (panel !== other_panel) {
                            other_panel.updateSlice();
                        }
                    });

                    if (viewer.synced) {
                        viewer.syncPosition(panel, volumed, axis_name);
                    }

                    panel = volumed.display.getPanel(axis_name);
                    viewer.active_panel = panel;
                })
            };

            $("#Sagittal").click(function () {
                var space_names = {
                    xspace: "Sagittal",
                    yspace: "Coronal",
                    zspace: "Transverse"
                };
                var axis_name = $(this).data("axis");
                var axis = volumed.header[axis_name];
                var space_length = axis.space_length;
                var time = volumed.current_time;
                var per_column = 6;
                var zoom = 0.5;
                var i, x, y;

                // Canvas on which to draw the images.
                var canvas = document.createElement("canvas");
                var context = canvas.getContext("2d");

                // Get first slice to set dimensions of the canvas.
                var image_data = volumed.getSliceImage(volumed.slice(axis_name, 0, time), zoom);
                var img = new Image();
                canvas.width = per_column * image_data.width;
                canvas.height = Math.ceil(space_length / per_column) * image_data.height;
                // Math.ceil向上取整
                context.fillStyle = "#000000";
                context.fillRect(0, 0, canvas.width, canvas.height);

                // Draw the slice on the canvas.
                context.putImageData(image_data, 0, 0);

                // Draw the rest of the slices on the canvas.
                for (i = 1; i < space_length; i++) {
                    image_data = volumed.getSliceImage(volumed.slice(axis_name, i, time), zoom);
                    x = i % per_column * image_data.width;
                    y = Math.floor(i / per_column) * image_data.height;
                    context.putImageData(image_data, x, y);
                }

                // Retrieve image from canvas and display it
                // in a dialog box.
                img.onload = function () {
                    $("<div></div>").append(img).dialog({
                        title: space_names[axis_name] + " Slices",
                        height: 600,
                        width: img.width
                    });
                };

                img.src = canvas.toDataURL();
            });

            $("#Coronal").click(function () {
                var space_names = {
                    xspace: "Sagittal",
                    yspace: "Coronal",
                    zspace: "Transverse"
                };
                var axis_name = $(this).data("axis");
                var axis = volumed.header[axis_name];
                var space_length = axis.space_length;
                var time = volumed.current_time;
                var per_column = 6;
                var zoom = 0.5;
                var i, x, y;

                // Canvas on which to draw the images.
                var canvas = document.createElement("canvas");
                var context = canvas.getContext("2d");

                // Get first slice to set dimensions of the canvas.
                var image_data = volumed.getSliceImage(volumed.slice(axis_name, 0, time), zoom);
                var img = new Image();
                canvas.width = per_column * image_data.width;
                canvas.height = Math.ceil(space_length / per_column) * image_data.height;
                // Math.ceil向上取整
                context.fillStyle = "#000000";
                context.fillRect(0, 0, canvas.width, canvas.height);

                // Draw the slice on the canvas.
                context.putImageData(image_data, 0, 0);

                // Draw the rest of the slices on the canvas.
                for (i = 1; i < space_length; i++) {
                    image_data = volumed.getSliceImage(volumed.slice(axis_name, i, time), zoom);
                    x = i % per_column * image_data.width;
                    y = Math.floor(i / per_column) * image_data.height;
                    context.putImageData(image_data, x, y);
                }

                // Retrieve image from canvas and display it
                // in a dialog box.
                img.onload = function () {
                    $("<div></div>").append(img).dialog({
                        title: space_names[axis_name] + " Slices",
                        height: 600,
                        width: img.width
                    });
                };

                img.src = canvas.toDataURL();
            });

            $("#Transverse").click(function () {
                var space_names = {
                    xspace: "Sagittal",
                    yspace: "Coronal",
                    zspace: "Transverse"
                };
                var axis_name = $(this).data("axis");
                var axis = volumed.header[axis_name];
                var space_length = axis.space_length;
                var time = volumed.current_time;
                var per_column = 6;
                var zoom = 0.5;
                var i, x, y;

                // Canvas on which to draw the images.
                var canvas = document.createElement("canvas");
                var context = canvas.getContext("2d");

                // Get first slice to set dimensions of the canvas.
                var image_data = volumed.getSliceImage(volumed.slice(axis_name, 0, time), zoom);
                var img = new Image();
                canvas.width = per_column * image_data.width;
                canvas.height = Math.ceil(space_length / per_column) * image_data.height;
                // Math.ceil向上取整
                context.fillStyle = "#000000";
                context.fillRect(0, 0, canvas.width, canvas.height);

                // Draw the slice on the canvas.
                context.putImageData(image_data, 0, 0);

                // Draw the rest of the slices on the canvas.
                for (i = 1; i < space_length; i++) {
                    image_data = volumed.getSliceImage(volumed.slice(axis_name, i, time), zoom);
                    x = i % per_column * image_data.width;
                    y = Math.floor(i / per_column) * image_data.height;
                    context.putImageData(image_data, x, y);
                }

                // Retrieve image from canvas and display it
                // in a dialog box.
                img.onload = function () {
                    $("<div></div>").append(img).dialog({
                        title: space_names[axis_name] + " Slices",
                        height: 600,
                        width: img.width
                    });
                };

                img.src = canvas.toDataURL();
            });

            $("#simpleAngle").click(function (){
                var edit = document.getElementById("edit");
                edit.removeEventListener("mousedown", WWWL,false);
                edit.onmouseup= function() {};
                edit.removeEventListener("mousedown",Pan,false);
                edit.removeEventListener("mousedown",Zoom_D,false);
                edit.removeEventListener("mousedown",Zoom_x,false);
                edit.removeEventListener("mousedown",arrowAnnotate,false);
                edit.removeEventListener("mousedown",Rectangle,false);
                edit.removeEventListener("mousedown",Elliptical,false);
                edit.addEventListener("mousedown",simpleAngle,false);
            });

            function simpleAngle(event) {
                var axis_name = event.target.id;
                if (axis_name == "editbox") {
                    axis_name = "xspace";
                } else if (axis_name == "edit1box") {
                    axis_name = "yspace";
                } else {
                    axis_name = "zspace";
                }
                var views = ["xspace"];
                views.forEach(function (e) {
                    var panel = volumed.display.getPanel(axis_name);

                    viewer.volumes.forEach(function (volume) {
                        volume.display.forEach(function (panel) {
                            panel.anchor = null;
                            panel.angle = null;
                            panel.arrow = null;
                            panel.Elliptical = null;
                            panel.Rectangle = null;
                        });
                    });

                    panel.angle = {
                        x: panel.mouse.x,
                        y: panel.mouse.y
                    };

                    panel.updated = true;

                    panel.updateVolumePosition(panel.mouse.x, panel.mouse.y);
                    volumed.display.forEach(function (other_panel) {
                        if (panel !== other_panel) {
                            other_panel.updateSlice();
                        }
                    });

                    if (viewer.synced) {
                        viewer.syncPosition(panel, volumed, axis_name);
                    }

                    panel = volumed.display.getPanel(axis_name);
                    viewer.active_panel = panel;
                });
            }

            $("#arrow").click(function (){
                var edit = document.getElementById("edit");
                edit.removeEventListener("mousedown", WWWL,false);
                edit.onmouseup= function() {};
                edit.removeEventListener("mousedown",Pan,false);
                edit.removeEventListener("mousedown",Zoom_D,false);
                edit.removeEventListener("mousedown",Zoom_x,false);
                edit.removeEventListener("mousedown",simpleAngle,false);
                edit.removeEventListener("mousedown",Rectangle,false);
                edit.removeEventListener("mousedown",Elliptical,false);
                edit.addEventListener("mousedown",arrowAnnotate,false);
            });

            function arrowAnnotate(event){

                var axis_name = event.target.id;
                if (axis_name=="editbox"){
                    axis_name = "xspace";
                }else if(axis_name=="edit1box"){
                    axis_name = "yspace";
                }else {
                    axis_name = "zspace";
                }
                var views = ["xspace"];
                views.forEach(function(e) {
                    var panel = volumed.display.getPanel(axis_name);

                    viewer.volumes.forEach(function (volume) {
                        volume.display.forEach(function (panel) {
                            panel.anchor = null;
                            panel.angle = null;
                            panel.arrow = null;
                            panel.Elliptical = null;
                            panel.Rectangle = null;
                        });
                    });

                    panel.arrow = {
                        x: panel.mouse.x,
                        y: panel.mouse.y
                    };

                    panel.updated = true;

                    panel.updateVolumePosition(panel.mouse.x, panel.mouse.y);
                    volumed.display.forEach(function (other_panel) {
                        if (panel !== other_panel) {
                            other_panel.updateSlice();
                        }
                    });

                    if (viewer.synced) {
                        viewer.syncPosition(panel, volumed, axis_name);
                    }

                    panel = volumed.display.getPanel(axis_name);
                    viewer.active_panel = panel;
                })

            }

            $("#Elliptical").click(function (){
                var edit = document.getElementById("edit");
                edit.removeEventListener("mousedown", WWWL,false);
                edit.onmouseup= function() {};
                edit.removeEventListener("mousedown",Pan,false);
                edit.removeEventListener("mousedown",Zoom_D,false);
                edit.removeEventListener("mousedown",Zoom_x,false);
                edit.removeEventListener("mousedown",arrowAnnotate,false);
                edit.removeEventListener("mousedown",Rectangle,false);
                //edit.removeEventListener("mousedown",Elliptical,false);
                edit.addEventListener("mousedown",Elliptical,false);
            });

            function Elliptical(event){

                var axis_name = event.target.id;
                if (axis_name=="editbox"){
                    axis_name = "xspace";
                }else if(axis_name=="edit1box"){
                    axis_name = "yspace";
                }else {
                    axis_name = "zspace";
                }
                var views = ["xspace"];
                views.forEach(function(e) {
                    var panel = volumed.display.getPanel(axis_name);

                    viewer.volumes.forEach(function (volume) {
                        volume.display.forEach(function (panel) {
                            panel.anchor = null;
                            panel.angle = null;
                            panel.arrow = null;
                            panel.Elliptical = null;
                            panel.Rectangle = null;
                        });
                    });

                    panel.Elliptical = {
                        x: panel.mouse.x,
                        y: panel.mouse.y
                    };

                    panel.updated = true;

                    panel.updateVolumePosition(panel.mouse.x, panel.mouse.y);
                    volumed.display.forEach(function (other_panel) {
                        if (panel !== other_panel) {
                            other_panel.updateSlice();
                        }
                    });

                    if (viewer.synced) {
                        viewer.syncPosition(panel, volumed, axis_name);
                    }

                    panel = volumed.display.getPanel(axis_name);
                    viewer.active_panel = panel;
                })

            }

            $("#Rectangle").click(function (){
                var edit = document.getElementById("edit");
                edit.removeEventListener("mousedown", WWWL,false);
                edit.onmouseup= function() {};
                edit.removeEventListener("mousedown",Pan,false);
                edit.removeEventListener("mousedown",Zoom_D,false);
                edit.removeEventListener("mousedown",Zoom_x,false);
                edit.removeEventListener("mousedown",arrowAnnotate,false);
                edit.removeEventListener("mousedown",Elliptical,false);
                edit.addEventListener("mousedown",Rectangle,false);
            });

            function Rectangle(event){

                var axis_name = event.target.id;
                if (axis_name=="editbox"){
                    axis_name = "xspace";
                }else if(axis_name=="edit1box"){
                    axis_name = "yspace";
                }else {
                    axis_name = "zspace";
                }
                var views = ["xspace"];
                views.forEach(function(e) {
                    var panel = volumed.display.getPanel(axis_name);

                    viewer.volumes.forEach(function (volume) {
                        volume.display.forEach(function (panel) {
                            panel.anchor = null;
                            panel.angle = null;
                            panel.arrow = null;
                            panel.Elliptical = null;
                            panel.Rectangle = null;
                        });
                    });

                    panel.Rectangle = {
                        x: panel.mouse.x,
                        y: panel.mouse.y
                    };

                    panel.updated = true;

                    panel.updateVolumePosition(panel.mouse.x, panel.mouse.y);
                    volumed.display.forEach(function (other_panel) {
                        if (panel !== other_panel) {
                            other_panel.updateSlice();
                        }
                    });

                    if (viewer.synced) {
                        viewer.syncPosition(panel, volumed, axis_name);
                    }

                    panel = volumed.display.getPanel(axis_name);
                    viewer.active_panel = panel;
                })

            }

// 3d changshi
            $("#3D-webgl").click(function (){
                //$("#3D-webgl").hide();
                //$("#3D-webgl2").show();
                volume.lowerThreshold = (volume.min + (volume.max/10));
                volume.volumeRendering = true;
                $('#windowlevel-label').hide();
                $('#windowlevel-volume').hide();
                $('#opacity-label').show();
                $('#opacity-volume').show();

            });

            $("#3D-webgl2").click(function (){
                //$("#3D-webgl2").hide();
                //$("#3D-webgl").show();
                $('#opacity-label').hide();
                $('#opacity-volume').hide();
                $('#windowlevel-label').show();
                $('#windowlevel-volume').show();
                volume.volumeRendering = false;

            });







            // Contrast controls
            container.find(".contrast-div").each(function () {
                var div = $(this);
                var slider = div.find(".slider");
                var contrast_input = div.find("#contrast-val");

                // Slider to select contrast value.
                slider.slider({
                    min: 0,
                    max: 2,
                    step: 0.05,
                    value: 1,
                    slide: function (event, ui) {
                        var value = parseFloat(ui.value);
                        volume.display.setContrast(value);
                        volume.display.refreshPanels();

                        contrast_input.val(value);
                    },
                    stop: function () {
                        $(this).find("a").blur();
                    }
                });

                // Input field to select contrast values explicitly.
                contrast_input.change(function () {
                    var value = parseFloat(this.value);

                    // Check that input is numeric and in range.
                    if (!BrainBrowser.utils.isNumeric(value)) {
                        value = 0;
                    }
                    value = Math.max(0, Math.min(value, 2));
                    this.value = value;

                    // Update slider and redraw volumes.
                    slider.slider("value", value);
                    volume.display.setContrast(value);
                    volume.display.refreshPanels();
                    viewer.redrawVolumes();
                });
            });

            // Contrast controls
            container.find(".brightness-div").each(function () {
                var div = $(this);
                var slider = div.find(".slider");
                var brightness_input = div.find("#brightness-val");

                // Slider to select brightness value.
                slider.slider({
                    min: -1,
                    max: 1,
                    step: 0.05,
                    value: 0,
                    slide: function (event, ui) {
                        var value = parseFloat(ui.value);
                        volume.display.setBrightness(value);
                        volume.display.refreshPanels();

                        brightness_input.val(value);
                    },
                    stop: function () {
                        $(this).find("a").blur();
                    }
                });

                // Input field to select brightness values explicitly.
                brightness_input.change(function () {
                    var value = parseFloat(this.value);

                    // Check that input is numeric and in range.
                    if (!BrainBrowser.utils.isNumeric(value)) {
                        value = 0;
                    }
                    value = Math.max(-1, Math.min(value, 1));
                    this.value = value;

                    // Update slider and redraw volumes.
                    slider.slider("value", value);
                    volume.display.setBrightness(value);
                    volume.display.refreshPanels();
                    viewer.redrawVolumes();
                });
            });

            drawniiimg(volumed);
            // 缩略图加载
            function drawniiimg(volume){
                var axis = volume.header["xspace"];
                var space_length = axis.space_length;
                var time = volume.current_time;
                var zoom = 0.5;
                // Canvas on which to draw the images.
                var canvas = document.querySelector("div.csthumbnail canvas");
                var context = canvas.getContext("2d");

                // Get first slice to set dimensions of the canvas.
                var image_data = volume.getSliceImage(volume.slice("xspace", space_length/2, time), zoom);
                var img = new Image();
                canvas.width = 170;
                canvas.height = 100;
                // Math.ceil向上取整
                context.fillStyle = "#000000";
                context.fillRect(0, 0, canvas.width, canvas.height);

                // Draw the slice on the canvas.
                context.putImageData(image_data, 0, 0);
            }
        });

        /* This function simply takes an input hex background color
     * and returns either "black" or "white" as the appropriate
     * foreground color for text rendered over the background colour.
     * Idea from https://24ways.org/2010/calculating-color-contrast/
     * Equation is from http://www.w3.org/TR/AERT#color-contrast
     */
        function getContrastYIQ(hexcolor) {
            var r = parseInt(hexcolor.substr(0, 2), 16);
            var g = parseInt(hexcolor.substr(2, 2), 16);
            var b = parseInt(hexcolor.substr(4, 2), 16);
            var yiq = ((r * 299) + (g * 587) + (b * 114)) / 1000;
            return (yiq >= 128) ? 'black' : 'white';
        }

        /////////////////////////////////////////////////////
        // UI updates to be performed after each slice update.
        //////////////////////////////////////////////////////
        viewer.addEventListener("sliceupdate", function (event) {
            var panel = event.target;
            var volume = event.volume;
            var vol_id = panel.volume_id;
            var world_coords, voxel_coords;
            var value;
            //addEventListener在three.js7056行处定义
            var bar1 = document.getElementById("bar1");
            var bar2 = document.getElementById("bar2");
            var bar3 = document.getElementById("bar3");
            var bar4 = document.getElementById("bar4");
            var bar5 = document.getElementById("bar5");
            var bar6 = document.getElementById("bar6");
            var height1 = viewer.spacing[0] * volume.position["xspace"];
            var height2 = viewer.spacing[1] * volume.position["yspace"];
            var height3 = viewer.spacing[2] * volume.position["zspace"];
            bar1.style.top = height1 + 'px';
            bar2.style.top = height2 + 'px';
            bar3.style.top = height3 + 'px';
            bar4.style.top = height1 + 'px';
            bar5.style.top = height2 + 'px';
            bar6.style.top = height3 + 'px';

            if (BrainBrowser.utils.isFunction(volume.getVoxelCoords)) {
                voxel_coords = volume.getVoxelCoords();
                $("#voxel-i-" + vol_id).val(parseInt(voxel_coords.i, 10));
                $("#voxel-j-" + vol_id).val(parseInt(voxel_coords.j, 10));
                $("#voxel-k-" + vol_id).val(parseInt(voxel_coords.k, 10));

                $("#voxeli1").val(parseInt(voxel_coords.k, 10) + "/" + viewer.headerwidth[0]);
                $("#voxeli2").val(parseInt(voxel_coords.j, 10) + "/" + viewer.headerwidth[1]);
                $("#voxeli3").val(parseInt(voxel_coords.i, 10) + "/" + viewer.headerwidth[2]);
            }
            value = volume.getIntensityValue();
            /* Set background color of intensity value to match colormap
       * entry for that value.
       */
            var bg_color = volume.color_map.colorFromValue(value, {
                hex: true,
                min: volume.intensity_min,
                max: volume.intensity_max,
                contrast: panel.contrast,
                brightness: panel.brightness
            });

            /* Given that the background color has a wide range, use a little
       * cleverness to pick either white or black as the foreground color
       * of the intensity value. This improves readability.
       */
            var fg_color = getContrastYIQ(bg_color);

            $("#intensity-value-" + vol_id)
                .css("background-color", "#" + bg_color)
                .css("color", fg_color)
                .html(Math.floor(value));

            if (volume.header && volume.header.time) {
                $("#time-slider-" + vol_id).slider("option", "value", volume.current_time);
                $("#time-val-" + vol_id).val(volume.current_time);
            }
        });

        var color_map_config = BrainBrowser.config.get("color_maps")[0];
        var color_map_config1 = BrainBrowser.config.get("color_maps")[2];
        loading_div.show();
        //////////////////////////////
        // Load the default color map.
        //////////////////////////////
        viewer.loadDefaultColorMapFromURL(color_map_config.url, color_map_config.cursor_color);
        viewer.loadDefaultColorMapFromURL1(color_map_config1.url, color_map_config1.cursor_color);
        ////////////////////////////////////////
        // Set the size of slice display panels.
        ////////////////////////////////////////
        //var canvas_div = document.getElementsByClassName("canvas-div")[0];
        viewer.setDefaultPanelSize(400, 300);
        ///////////////////
        // Start rendering.
        ///////////////////
        viewer.render();
        var color_map_select1 = $('<select id="color-map-select1"></select>').change(function () {
            var selection = $(this).find(":selected");
            viewer.loadVolumeColorMapFromURL(1, selection.val(), selection.data("cursor-color"), function () {
                viewer.redrawVolumes();
            });
        });

        BrainBrowser.config.get("color_maps1").forEach(function (color_map) {
            color_map_select1.append('<option value="' + color_map.url +
                '" data-cursor-color="' + color_map.cursor_color + '">' +
                color_map.name + '</option>'
            );
        });
        $("#color-map-heading2").after(color_map_select1);
        var color_map_select2 = $('<select id="color-map-select2"></select>').change(function () {
            var selection = $(this).find(":selected");

            viewer.loadVolumeColorMapFromURL(0, selection.val(), selection.data("cursor-color"), function () {
                viewer.redrawVolumes();
            });
        });

        BrainBrowser.config.get("color_maps").forEach(function (color_map) {
            color_map_select2.append('<option value="' + color_map.url +
                '" data-cursor-color="' + color_map.cursor_color + '">' +
                color_map.name + '</option>'
            );
        });

        $("#color-map-heading1").after(color_map_select2);
        /////////////////////
        // Load the volumes.
        /////////////////////
        // viewer.loadVolumes({
        //     volumes: [
        //         {
        //             type: "nifti1",
        //             nii_url: "../models/structural.nii",
        //             template: {
        //                 element_id: "volume-ui-template",
        //                 viewer_insert_class: "volume-viewer-display"
        //             }
        //         },
        //
        //     ],
        //     complete: function () {
        //         loading_div.hide();
        //         $("#edit2").hide();
        //         $("#brainbrowser-wrapper").slideDown({duration: 600});
        //
        //     }
        // });
        viewer.loadVolume({
            type: "Dicom1",
            Dicom_url: "studies/Dicom_example.json",
            template: {
                element_id: "volume-ui-template",
                viewer_insert_class: "volume-viewer-display"
            }
        });

        $("#load-example").click(function(){
            if (flag_D) {
                ///DicomTo3D show 暂时先使用该方法展示，由于未解决向服务器请求多个文件
                // 按键操作测量提示文字显示
                $("#instructions").show();

                viewer.loadVolumes({
                    volumes: [
                        {
                            type: "nifti1",
                            nii_url: "./studies/nii_example.nii",
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
                        $("#brainbrowser-wrapper").show();
                        // $("#brainbrowser-wrapper").slideDown({duration: 600});

                    }
                });
                $('#color-map-select').remove();
                $('#container').remove();
                $("#viewer").hide();
                $("#tabContent").css("float", "left");
                flag_D = false;
            } else {
                $("#instructions").show();
                $("#brainbrowser-wrapper").show();
                $("#viewer").hide();
            }
        });

        $("#upload-image").click(function(){
            files = document.getElementById("file-uploads").files;

            if(files.length === 0){
                alert("请先选择文件！！！");
            }else {

                if (files[0].name.substr(files[0].name.lastIndexOf(".")+1) ==="nii"){
                    $("#viewer").hide();
                    $("#brainbrowser-wrapper").show();
                    $("#loading").show();
                    $("#instructions").show();
                    $('#color-map-select').remove();
                    $('#container').remove();
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
                            $("#To2D").hide();
                            flag_D = true;
                        }
                    });

                   // $("#viewer").hide();
                    $("#To2D").hide();
                    $("#tabContent").css("float", "left");
                }else{
                    $("#loading").show();
                    // 按键操作测量提示文字隐藏
                    $("#instructions").hide();
                    $("#brainbrowser-wrapper").hide();
                    // Dicom按钮操作显示
                    $("#viewer").show();

                    viewer.loadVolumes({
                        volumes: [
                            {
                                type: "Dicom1",
                                Dicom_files: files,
                                template: {
                                    element_id: "volume-ui-template",
                                    viewer_insert_class: "volume-viewer-display"
                                }
                            },

                        ],
                        complete: function () {
                            $("#loading").hide();
                            $("#To2D").show();
                        }
                    });
                    flag_UP = true;
                }

            }
        });

    });


    // 标签对比度调整
    $("#blend-box").find(".blend-div").each(function () {
        var div = $(this);
        var slider = div.find(".slider");
        var blend_input = div.find("#blend-val1");

        // Slider to select blend value.
        slider.slider({
            min: 0,
            max: 1,
            step: 0.01,
            value: 0.5,
            slide: function (event, ui) {
                var value = parseFloat(ui.value);
                blend_input.val(value);
                if (viewer.volumes[2]) {
                    var volume = viewer.volumes[2];
                    volume.blend_ratios[1] = value;
                    viewer.redrawVolumes();
                }
            },
            stop: function () {
                $(this).find("a").blur();
            }
        });
        // Input field to select blend values explicitly.
        blend_input.change(function () {
            var value = parseFloat(this.value);

            // Check that input is numeric and in range.
            if (!BrainBrowser.utils.isNumeric(value)) {
                value = 0;
            }
            value = Math.max(0, Math.min(value, 1));
            this.value = value;
            // Update slider and redraw volumes.
            slider.slider("value", value);
            if (viewer.volumes[2]) {
                var volume = viewer.volumes[2];

                volume.blend_ratios[1] = value;
                viewer.redrawVolumes();
            }
        });
    });

    // 图像对比度调整
    $("#blend-box1").find(".blend-div").each(function () {
        var div = $(this);
        var slider = div.find(".slider");
        var blend_input = div.find("#blend-val2");

        // Slider to select blend value.
        slider.slider({
            min: 0,
            max: 1,
            step: 0.01,
            value: 1,
            slide: function (event, ui) {
                var value = parseFloat(ui.value);
                blend_input.val(value);
                if (viewer.volumes[2]) {
                    var volume = viewer.volumes[2];
                    console.log(value);
                    volume.blend_ratios[0] = value;
                    viewer.redrawVolumes();
                }
            },
            stop: function () {
                $(this).find("a").blur();
            }
        });
        // Input field to select blend values explicitly.
        blend_input.change(function () {
            var value = parseFloat(this.value);

            // Check that input is numeric and in range.
            if (!BrainBrowser.utils.isNumeric(value)) {
                value = 0;
            }
            value = Math.max(0, Math.min(value, 1));
            this.value = value;
            // Update slider and redraw volumes.
            slider.slider("value", value);
            if (viewer.volumes[2]) {
                var volume = viewer.volumes[2];
                volume.blend_ratios[0] = value;

                viewer.redrawVolumes();
            }
        });
    });

    // 标注等级选择
    $("#grade").change(function () {

        viewer.grade = $("#grade").val();

    });

    // 图像右侧滚动条 滚动位置标志
    var scr = document.getElementById('scroll1');
    var bar = document.getElementById('bar1');
    var scr2 = document.getElementById('scroll2');
    var bar2 = document.getElementById('bar2');
    var scr3 = document.getElementById('scroll3');
    var bar3 = document.getElementById('bar3');
    var scr4 = document.getElementById('scroll4');
    var bar4 = document.getElementById('bar4');
    var scr5 = document.getElementById('scroll5');
    var bar5 = document.getElementById('bar5');
    var scr6 = document.getElementById('scroll6');
    var bar6 = document.getElementById('bar6');
    //根据实际内容设置 滚动条的高度 = (盒子的高度 / 内容的高度) * 盒子的高度
    var y = null;
    var y4 = null;

    //当鼠标按下    //  右侧翻页的标志轮  edit2 --失状位
    bar.onmousedown = function (e) {
        var ev = window.event || e;
        //计算鼠标位置 差
        var a = ev.clientY - this.offsetTop;
        //拖动滚动条
        document.onmousemove = function (e) {
            var ev = window.event || e;
            //获取鼠标位置
            y = ev.clientY - a;
            roll(y);
        };
        return false; //阻止默认行为
    };

    //鼠标悬停box 滚动    edit1 --失状位
    scr.onmousewheel = function (e) {
        event.preventDefault();
        var ev = window.event || e;
        //监听滚轮 方向
        if (ev.wheelDelta > 0) {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            if (volumed.position["xspace"] + 1 <= volumed.header["xspace"].space_length) {
                volumed.position["xspace"] = volumed.position["xspace"] + 1;
                volumed.display.forEach(function (other_panel) {
                    if (other_panel.axis === "xspace") {
                        other_panel.updateSlice();
                    }
                });
                volume.indexX = volume.indexX-1;
            }
        } else {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            if (volumed.position["xspace"] - 1 >= 0) {
                volumed.position["xspace"] = volumed.position["xspace"] - 1;
                volumed.display.forEach(function (other_panel) {
                    if (other_panel.axis === "xspace") {
                        other_panel.updateSlice();
                    }
                });
                volume.indexX = volume.indexX+1;
            }
        }
    };

    //  右侧翻页的标志轮  edit2 --失状位
    bar4.onmousedown = function (e) {
        var ev = window.event || e;
        //计算鼠标位置 差
        var a = ev.clientY - this.offsetTop;
        //拖动滚动条
        document.onmousemove = function (e) {
            var ev = window.event || e;
            //获取鼠标位置
            y4 = ev.clientY - a;
            roll(y4);
        };
        return false; //阻止默认行为
    };

    // 滚动   失状位
    function roll(y) {
        var y = y;
        if (y <= 0) {
            y = 0;
        } else if (y >= scr.clientHeight - bar.clientHeight) {
            y = scr.clientHeight - bar.clientHeight;
        }
        //设置 滚动条
        var length = viewer.volumes.length - 1;
        var volumed = viewer.volumes[length];
        volumed.position["xspace"] = Math.round(y / viewer.spacing[0]);
        volumed.display.forEach(function (other_panel) {
            if (other_panel.axis === "xspace") {
                other_panel.updateSlice();
            }
        });
        volume.indexX = volume.range[0]-Math.floor(y / viewer.spacing[0]);
    }

    // 滚动   冠状位
    function roll1(y) {
        var y = y;
        if (y <= 0) {
            y = 0;
        } else if (y >= scr.clientHeight - bar.clientHeight) {
            y = scr.clientHeight - bar.clientHeight;
        }
        //设置 滚动条
        var length = viewer.volumes.length - 1;
        var volumed = viewer.volumes[length];
        volumed.position["yspace"] = Math.round(y / viewer.spacing[1]);

        volumed.display.forEach(function (other_panel) {

            if (other_panel.axis === "yspace") {
                other_panel.updateSlice();
            }
        });

        volume.indexY = Math.floor(y / viewer.spacing[1]);
    }

    // 滚动   横断面
    function roll2(y) {
        var y = y;
        if (y <= 0) {
            y = 0;
        } else if (y >= scr.clientHeight - bar.clientHeight) {
            y = scr.clientHeight - bar.clientHeight;
        }
        //设置 滚动条
        var length = viewer.volumes.length - 1;
        var volumed = viewer.volumes[length];
        volumed.position["zspace"] = Math.round(y / viewer.spacing[2]);

        volumed.display.forEach(function (other_panel) {

            if (other_panel.axis === "zspace") {
                other_panel.updateSlice();
            }
        });
        volume.indexZ = Math.floor(y / viewer.spacing[2]);
    }

    //鼠标悬停box 滚动    edi2 --失状位
    scr4.onmousewheel = function (e) {
        event.preventDefault();
        var ev = window.event || e;
        //监听滚轮 方向
        if (ev.wheelDelta > 0) {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            if (volumed.position["xspace"] + 1 <= volumed.header["xspace"].space_length) {
                volumed.position["xspace"] = volumed.position["xspace"] + 1;

                volumed.display.forEach(function (other_panel) {

                    if (other_panel.axis === "xspace") {
                        other_panel.updateSlice();
                    }
                });
                volume.indexX = volume.indexX - 1;
            }
        } else {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            if (volumed.position["xspace"] - 1 >= 0) {
                volumed.position["xspace"] = volumed.position["xspace"] - 1;

                volumed.display.forEach(function (other_panel) {

                    if (other_panel.axis === "xspace") {
                        other_panel.updateSlice();
                    }
                });
                volume.indexX = volume.indexX + 1;
            }
        }
    };

    //  右侧翻页的标志轮  edit1 --冠状位
    bar2.onmousedown = function (e) {
        var ev = window.event || e;
        //计算鼠标位置 差
        var a = ev.clientY - this.offsetTop;
        //拖动滚动条
        document.onmousemove = function (e) {
            var ev = window.event || e;
            //获取鼠标位置
            y = ev.clientY - a;
            roll1(y);
        };
        return false; //阻止默认行为
    };

    //鼠标悬停box 滚动    edi1 --冠状位
    scr2.onmousewheel = function (e) {
        event.preventDefault();
        var ev = window.event || e;
        //监听滚轮 方向
        if (ev.wheelDelta > 0) {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            if (volumed.position["yspace"] + 1 <= volumed.header["yspace"].space_length) {
                volumed.position["yspace"] = volumed.position["yspace"] + 1;

                volumed.display.forEach(function (other_panel) {

                    if (other_panel.axis === "yspace") {
                        other_panel.updateSlice();
                    }
                });
                volume.indexY = volume.indexY+1;
            }
        } else {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            if (volumed.position["yspace"] - 1 >= 0) {
                volumed.position["yspace"] = volumed.position["yspace"] - 1;

                volumed.display.forEach(function (other_panel) {

                    if (other_panel.axis === "yspace") {
                        other_panel.updateSlice();
                    }
                });
                volume.indexY = volume.indexY-1;
            }
        }
    };

    // 右侧翻页的标志轮  edit2 --冠状位
    bar5.onmousedown = function (e) {
        var ev = window.event || e;
        //计算鼠标位置 差
        var a = ev.clientY - this.offsetTop;
        //拖动滚动条
        document.onmousemove = function (e) {
            var ev = window.event || e;
            //获取鼠标位置
            y = ev.clientY - a;
            roll1(y);
        };
        return false; //阻止默认行为
    };

    // 鼠标悬停box 滚动  edi2 --冠状位
    scr5.onmousewheel = function (e) {
        event.preventDefault();
        var ev = window.event || e;
        //监听滚轮 方向
        if (ev.wheelDelta > 0) {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            if (volumed.position["yspace"] + 1 <= volumed.header["yspace"].space_length) {
                volumed.position["yspace"] = volumed.position["yspace"] + 1;

                volumed.display.forEach(function (other_panel) {

                    if (other_panel.axis === "yspace") {
                        other_panel.updateSlice();
                    }
                });
                volume.indexY = volume.indexY+1;
            }
        } else {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            if (volumed.position["yspace"] - 1 >= 0) {
                volumed.position["yspace"] = volumed.position["yspace"] - 1;

                volumed.display.forEach(function (other_panel) {

                    if (other_panel.axis === "yspace") {
                        other_panel.updateSlice();
                    }
                });
                volume.indexY = volume.indexY-1;
            }
        }
    };

    // 右侧翻页的标志轮  edit1 --横断面
    bar3.onmousedown = function (e) {
        var ev = window.event || e;
        //计算鼠标位置 差
        var a = ev.clientY - this.offsetTop;
        //拖动滚动条
        document.onmousemove = function (e) {
            var ev = window.event || e;
            //获取鼠标位置
            y = ev.clientY - a;
            roll2(y);
        };
        return false; //阻止默认行为
    };

    //鼠标悬停box 滚动  edit1 --横断面
    scr3.onmousewheel = function (e) {
        event.preventDefault();
        var ev = window.event || e;
        //监听滚轮 方向
        if (ev.wheelDelta > 0) {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            if (volumed.position["zspace"] + 1 <= volumed.header["zspace"].space_length) {
                volumed.position["zspace"] = volumed.position["zspace"] + 1;

                volumed.display.forEach(function (other_panel) {

                    if (other_panel.axis === "zspace") {
                        other_panel.updateSlice();
                    }
                });
                volume.indexZ =volume.indexZ+1;
            }
        } else {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            if (volumed.position["zspace"] - 1 >= 0) {
                volumed.position["zspace"] = volumed.position["zspace"] - 1;

                volumed.display.forEach(function (other_panel) {

                    if (other_panel.axis === "zspace") {
                        other_panel.updateSlice();
                    }
                });
                volume.indexZ = volume.indexZ-1;
            }
        }
    };

    // 右侧翻页的标志轮  edit2 --横断面
    bar6.onmousedown = function (e) {
        var ev = window.event || e;
        //计算鼠标位置 差
        var a = ev.clientY - this.offsetTop;
        //拖动滚动条
        document.onmousemove = function (e) {
            var ev = window.event || e;
            //获取鼠标位置
            y = ev.clientY - a;
            roll2(y);
        };
        return false; //阻止默认行为
    };

    //鼠标悬停box 滚动  edit2 --横断面
    scr6.onmousewheel = function (e) {
        event.preventDefault();
        var ev = window.event || e;
        //监听滚轮 方向
        if (ev.wheelDelta > 0) {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            if (volumed.position["zspace"] + 1 <= volumed.header["zspace"].space_length) {
                volumed.position["zspace"] = volumed.position["zspace"] + 1;

                volumed.display.forEach(function (other_panel) {

                    if (other_panel.axis === "zspace") {
                        other_panel.updateSlice();
                    }
                });
                volume.indexZ = volume.indexZ+1;
            }
        } else {
            var length = viewer.volumes.length - 1;
            var volumed = viewer.volumes[length];
            if (volumed.position["zspace"] - 1 >= 0) {
                volumed.position["zspace"] = volumed.position["zspace"] - 1;

                volumed.display.forEach(function (other_panel) {

                    if (other_panel.axis === "zspace") {
                        other_panel.updateSlice();
                    }
                });
                volume.indexZ = volume.indexZ-1;
            }
        }
    };

    //松开鼠标时
    document.onmouseup = function () {
        document.onmousemove = null;
    };

});