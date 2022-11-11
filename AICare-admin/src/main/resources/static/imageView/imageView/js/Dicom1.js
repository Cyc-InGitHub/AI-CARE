

(function() {
    "use strict";

    var VolumeViewer = BrainBrowser.VolumeViewer;
    cornerstoneWADOImageLoader.external.cornerstone = cornerstone;

    VolumeViewer.volume_loaders.Dicom1 = function(description, callback) {
        var error_message;

        if (description.Dicom_url) {
            // 获取选定的 studyId 的JSON数据
            $.getJSON(description.Dicom_url, function (data) {

                var imageViewer = new ImageViewer(studyViewerTemplate, viewportTemplate);
                imageViewer.setLayout('1x1'); // default layout
                function initViewports() {
                    imageViewer.forEachElement(function (el) {
                        cornerstone.enable(el);
                        $(el).droppable({
                            drop: function (evt, ui) {
                                var fromStack = $(ui.draggable.context).data('stack'),
                                    toItem = $(this).data('index');
                                useItemStack(toItem, fromStack);
                            }
                        });
                    });
                }

                // 设置工具按钮
                setupButtons(studyViewerTemplate);

                //布局选择
                $(studyViewerTemplate).find('.choose-layout a').click(function () {
                    var previousUsed = [];
                    imageViewer.forEachElement(function (el, vp, i) {
                        if (!isNaN($(el).data('useStack'))) {
                            previousUsed.push($(el).data('useStack'));
                        }
                    });

                    var type = $(this).text();
                    imageViewer.setLayout(type);
                    initViewports();
                    resizeStudyViewer();
                    if (previousUsed.length > 0) {
                        previousUsed = previousUsed.slice(0, imageViewer.viewports.length);
                        var item = 0;
                        previousUsed.forEach(function (v) {
                            useItemStack(item++, v);
                        });
                    }

                });

                var seriesIndex = 0;
                data.seriesList.forEach(function (series) {
                    var stack = {
                        seriesDescription: series.seriesDescription,
                        stackId: series.seriesNumber,
                        imageIds: [],
                        seriesIndex: seriesIndex,
                        currentImageIdIndex: 0,
                        frameRate: series.frameRate
                    };

                    if (series.numberOfFrames !== undefined) {
                        var numberOfFrames = series.numberOfFrames;
                        for (var i = 0; i < numberOfFrames; i++) {
                            var imageId = series.instanceList[0].imageId + "?frame=" + i;
                            if (imageId.substr(0, 4) !== 'http') {
                                imageId = "dicomweb://localhost:80/imageView/models/" + imageId;
                            }
                            stack.imageIds.push(imageId);
                        }
                    } else {
                        series.instanceList.forEach(function (image) {
                            var imageId = image.imageId;
                            if (image.imageId.substr(0, 4) !== 'http') {
                                imageId = "dicomweb://localhost:80/imageView/models/" + imageId;
                            }
                            stack.imageIds.push(imageId);
                        });
                    }
                    // Move to next series
                    seriesIndex++;
                    // Add the series stack to the stacks array
                    imageViewer.stacks.push(stack);
                });

                // Resize the parent div of the viewport to fit the screen
                var imageViewerElement = $(studyViewerTemplate).find('.imageViewer')[0];
                var viewportWrapper = $(imageViewerElement).find('.viewportWrapper')[0];
                var parentDiv = $(studyViewerTemplate).find('.viewer')[0];

                // var studyRow = $(studyViewerTemplate).find('.studyRow')[0];
                // var width = $(studyRow).width();

                // Get the viewport elements
                var element = $(studyViewerTemplate).find('.viewport')[0];

                // Image enable the dicomImage element
                initViewports();

                // Get series list from the series thumbnails (?)
                var seriesList = $(studyViewerTemplate).find('.thumbnails')[0];
                imageViewer.stacks.forEach(function (stack, stackIndex) {

                    // Create series thumbnail item
                    var seriesEntry = '<a class="list-group-item" + ' +
                        'oncontextmenu="return false"' +
                        'unselectable="on"' +
                        'onselectstart="return false;"' +
                        'onmousedown="return false;">' +
                        '<div class="csthumbnail"' +
                        'oncontextmenu="return false"' +
                        'unselectable="on"' +
                        'onselectstart="return false;"' +
                        'onmousedown="return false;"></div>' +
                        "<div class='text-center small'>" + stack.seriesDescription + '</div></a>';

                    // Add to series list
                    var seriesElement = $(seriesEntry).appendTo(seriesList);

                    // Find thumbnail
                    var thumbnail = $(seriesElement).find('div')[0];

                    // Enable cornerstone on the thumbnail
                    cornerstone.enable(thumbnail);

                    // Have cornerstone load the thumbnail image
                    cornerstone.loadAndCacheImage(imageViewer.stacks[stack.seriesIndex].imageIds[Math.round(imageViewer.stacks[stack.seriesIndex].imageIds.length)/2]).then(function (image) {

                        if(image.windowCenter === 0) {
                            var maxVoi = image.maxPixelValue * image.slope + image.intercept;
                            var minVoi = image.minPixelValue * image.slope + image.intercept;
                            image.windowWidth = maxVoi - minVoi;
                            image.windowCenter = (maxVoi + minVoi) / 2;
                        }

                        // Make the first thumbnail active
                        if (stack.seriesIndex === 0) {
                            $(seriesElement).addClass('active');
                        }
                        // Display the image
                        cornerstone.displayImage(thumbnail, image);
                        $(seriesElement).draggable({
                            helper: "clone"
                        });
                    });

                    // Handle thumbnail click
                    $(seriesElement).on('click touchstart', function () {
                        useItemStack(0, stackIndex);
                    }).data('stack', stackIndex);
                });

                function useItemStack(item, stack) {
                    var imageId = imageViewer.stacks[stack].imageIds[0],
                        element = imageViewer.getElement(item);
                    if ($(element).data('waiting')) {
                        imageViewer.viewports[item].find('.overlay-text').remove();
                        $(element).data('waiting', false);
                    }
                    $(element).data('useStack', stack);

                    displayThumbnail(seriesList, $(seriesList).find('.list-group-item')[stack], element, imageViewer.stacks[stack], function (el, stack) {
                        if (!$(el).data('setup')) {
                            setupViewport(el, stack, this);
                            //setupViewportOverlays(el, data);
                            $(el).data('setup', true);
                            $("#loading").hide();
                        }
                    });
                }

                // Resize study viewer
                function resizeStudyViewer() {
                    var studyRow = $(studyViewerTemplate).find('.studyContainer')[0];
                    //var height = $(studyRow).height();
                    var width = $(studyRow).width();
                    $(seriesList).height("100%");
                    $(parentDiv).width(width - $(studyViewerTemplate).find('.thumbnailSelector:eq(0)').width());
                    $(parentDiv).css({
                        height: '100%'
                    });
                    $(imageViewerElement).css({
                        height: $(parentDiv).height()
                    });
                    //console.log($(parentDiv).height());
                    //console.log($(parentDiv).find('.text-center:eq(0)').height());
                    //console.log($(parentDiv).height() - $(parentDiv).find('.text-center:eq(0)').height());

                    imageViewer.forEachElement(function (el, vp) {
                        cornerstone.resize(el, true);

                        if ($(el).data('waiting')) {
                            var ol = vp.find('.overlay-text');
                            if (ol.length < 1) {
                                ol = $('<div class="overlay overlay-text">Please drag a stack onto here to view images.</div>').appendTo(vp);
                            }
                            var ow = vp.width() / 2,
                                oh = vp.height() / 2;
                            ol.css({
                                top: oh,
                                left: ow - (ol.width() / 2)
                            });
                        }
                    });
                }
                // Call resize viewer on window resize
                $(window).resize(function () {
                    resizeStudyViewer();
                });
                resizeStudyViewer();
                if (imageViewer.isSingle())
                    useItemStack(0, 0);
            });
        }else if (description.Dicom_files) {

            document.getElementById("list-group").innerHTML="";

            var dcm_upload = description.Dicom_files;

            var imageViewer = new ImageViewer(studyViewerTemplate, viewportTemplate);
            imageViewer.setLayout('1x1'); // default layout
            function initViewports() {
                imageViewer.forEachElement(function (el) {
                    cornerstone.enable(el);
                    $(el).droppable({
                        drop: function (evt, ui) {
                            var fromStack = $(ui.draggable.context).data('stack'),
                                toItem = $(this).data('index');
                            useItemStack(toItem, fromStack);
                        }
                    });
                });
            }

            // 设置工具按钮
            setupButtons(studyViewerTemplate);

            //布局选择
            $(studyViewerTemplate).find('.choose-layout a').click(function () {
                var previousUsed = [];
                imageViewer.forEachElement(function (el, vp, i) {
                    if (!isNaN($(el).data('useStack'))) {
                        previousUsed.push($(el).data('useStack'));
                    }
                });

                var type = $(this).text();
                imageViewer.setLayout(type);
                initViewports();
                resizeStudyViewer();
                if (previousUsed.length > 0) {
                    previousUsed = previousUsed.slice(0, imageViewer.viewports.length);
                    var item = 0;
                    previousUsed.forEach(function (v) {
                        useItemStack(item++, v);
                    });
                }

            });

            const imageId0 = cornerstoneWADOImageLoader.wadouri.fileManager.add(dcm_upload[0]);
            var seriesIndex = 0;
            var UID,name,id;
            cornerstone.loadAndCacheImage(imageId0).then(function (image) {
                UID = image.data.string('x00200011');
                name = image.data.string('x00100010');
                id = image.data.string('x00100020');
            });

            var stack = {
                //seriesDescription: series.seriesDescription,
                seriesDescription:"upload",
                stackId: UID,
                imageIds: [],
                seriesIndex: seriesIndex,
                currentImageIdIndex: 0,
                //frameRate: series.frameRate
                frameRate:undefined
            };

            for (var i=0;i<files.length;i++){
                const file = files[i];
                const imageId = cornerstoneWADOImageLoader.wadouri.fileManager.add(file);
                stack.imageIds.push(imageId);
            }

            // Move to next series
            seriesIndex++;
            // Add the series stack to the stacks array
            imageViewer.stacks.push(stack);

            // Resize the parent div of the viewport to fit the screen
            var imageViewerElement = $(studyViewerTemplate).find('.imageViewer')[0];
            var viewportWrapper = $(imageViewerElement).find('.viewportWrapper')[0];
            var parentDiv = $(studyViewerTemplate).find('.viewer')[0];

            // var studyRow = $(studyViewerTemplate).find('.studyRow')[0];
            // var width = $(studyRow).width();

            // Get the viewport elements
            var element = $(studyViewerTemplate).find('.viewport')[0];

            // Image enable the dicomImage element
            initViewports();

            // Get series list from the series thumbnails (?)
            var seriesList = $(studyViewerTemplate).find('.thumbnails')[0];
            imageViewer.stacks.forEach(function (stack, stackIndex) {

                // Create series thumbnail item
                var seriesEntry = '<a class="list-group-item" + ' +
                    'oncontextmenu="return false"' +
                    'unselectable="on"' +
                    'onselectstart="return false;"' +
                    'onmousedown="return false;">' +
                    '<div class="csthumbnail"' +
                    'oncontextmenu="return false"' +
                    'unselectable="on"' +
                    'onselectstart="return false;"' +
                    'onmousedown="return false;"></div>' +
                    "<div class='text-center small'>" + stack.seriesDescription + '</div></a>';

                // Add to series list
                var seriesElement = $(seriesEntry).appendTo(seriesList);

                // Find thumbnail
                var thumbnail = $(seriesElement).find('div')[0];

                // Enable cornerstone on the thumbnail
                cornerstone.enable(thumbnail);

                // Have cornerstone load the thumbnail image
                cornerstone.loadAndCacheImage(imageViewer.stacks[stack.seriesIndex].imageIds[Math.round(imageViewer.stacks[stack.seriesIndex].imageIds.length)/2]).then(function (image) {

                    if(image.windowCenter === 0) {
                        var maxVoi = image.maxPixelValue * image.slope + image.intercept;
                        var minVoi = image.minPixelValue * image.slope + image.intercept;
                        image.windowWidth = maxVoi - minVoi;
                        image.windowCenter = (maxVoi + minVoi) / 2;
                    }

                    // Make the first thumbnail active
                    if (stack.seriesIndex === 0) {
                        $(seriesElement).addClass('active');
                    }
                    // Display the image
                    cornerstone.displayImage(thumbnail, image);
                    $(seriesElement).draggable({
                        helper: "clone"
                    });
                });

                // Handle thumbnail click
                $(seriesElement).on('click touchstart', function () {
                    useItemStack(0, stackIndex);
                }).data('stack', stackIndex);
            });

            function useItemStack(item, stack) {
                var imageId = imageViewer.stacks[stack].imageIds[0],
                    element = imageViewer.getElement(item);
                if ($(element).data('waiting')) {
                    imageViewer.viewports[item].find('.overlay-text').remove();
                    $(element).data('waiting', false);
                }
                $(element).data('useStack', stack);

                displayThumbnail(seriesList, $(seriesList).find('.list-group-item')[stack], element, imageViewer.stacks[stack], function (el, stack) {
                    if (!$(el).data('setup')) {
                        setupViewport(el, stack, this);
                        //setupViewportOverlays(el, data);
                        $(el).data('setup', true);
                        $("#loading").hide();
                    }
                });
            }

            // Resize study viewer
            function resizeStudyViewer() {
                var studyRow = $(studyViewerTemplate).find('.studyContainer')[0];
                //var height = $(studyRow).height();
                var width = $(studyRow).width();
                $(seriesList).height("100%");
                $(parentDiv).width(width - $(studyViewerTemplate).find('.thumbnailSelector:eq(0)').width());
                $(parentDiv).css({
                    height: '100%'
                });
                $(imageViewerElement).css({
                    height: $(parentDiv).height()
                });
                //console.log($(parentDiv).height());
                //console.log($(parentDiv).find('.text-center:eq(0)').height());
                //console.log($(parentDiv).height() - $(parentDiv).find('.text-center:eq(0)').height());

                imageViewer.forEachElement(function (el, vp) {
                    cornerstone.resize(el, true);

                    if ($(el).data('waiting')) {
                        var ol = vp.find('.overlay-text');
                        if (ol.length < 1) {
                            ol = $('<div class="overlay overlay-text">Please drag a stack onto here to view images.</div>').appendTo(vp);
                        }
                        var ow = vp.width() / 2,
                            oh = vp.height() / 2;
                        ol.css({
                            top: oh,
                            left: ow - (ol.width() / 2)
                        });
                    }
                });
            }
            // Call resize viewer on window resize
            $(window).resize(function () {
                resizeStudyViewer();
            });
            resizeStudyViewer();

            if (imageViewer.isSingle())
                useItemStack(0, 0);

            //

            //
            // let element = document.getElementById("Viewport");
            // // element.removeAttribute("style");
            // cornerstone.enable(element);
            // // $(element).data('setup', false);
            // displayThumbnail(element, stack, function (element, stack) {
            //     // console.log(!$(element).data('setup'));
            //     if (!$(element).data('setup')) {
            //         setupViewport(element, stack, this);
            //         $(element).data('setup', true);
            //     }
            // });

        } else {
            error_message = "invalid volume description.\n" +
                "Description must contain the property 'nii_url' or 'nii_file' or 'nii_source'.";

            BrainBrowser.events.triggerEvent("error", { message: error_message });
            throw new Error(error_message);
        }
    };
}());