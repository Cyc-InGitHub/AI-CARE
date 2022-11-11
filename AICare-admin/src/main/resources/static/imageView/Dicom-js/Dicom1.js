

(function() {
    "use strict";

    var VolumeViewer = BrainBrowser.VolumeViewer;
    cornerstoneWADOImageLoader.external.cornerstone = cornerstone;

    VolumeViewer.volume_loaders.Dicom1 = function(description, callback) {
        var error_message;

        if (description.Dicom_url) {
            // 获取选定的 studyId 的JSON数据
            $.getJSON(description.Dicom_url, function (data) {
                var stack = {
                    seriesDescription: "",
                    stackId: 1,
                    imageIds: [],
                    seriesIndex: 0,
                    currentImageIdIndex: 0,
                    frameRate: undefined
                };

                data.seriesList[0].instanceList.forEach(function (image) {
                    var imageId = image.imageId;
                    if (image.imageId.substr(0, 4) !== 'http') {
                        imageId = "dicomweb://localhost:80/imageView/models/" + imageId;
                    }
                    stack.imageIds.push(imageId);
                });

                var element = document.getElementById("brainbrowser");
                cornerstone.enable(element);

                displayThumbnail(element, stack, function (element, stack) {
                    if (!$(element).data('setup')) {
                        setupViewport(element, stack, this);
                        $(element).data('setup', true);
                    }
                });

            });
        }else if (description.nii_file) {
            BrainBrowser.loader.loadFromURL(description.Dicom_url, function (nii_data) {
                var dataSet = void 0;
                var nii_data = new Uint8Array(nii_data);
                dataSet = dicomParser.parseDicom(nii_data);

            }, {result_type: "arraybuffer"});
        } else {
            error_message = "invalid volume description.\n" +
                "Description must contain the property 'nii_url' or 'nii_file' or 'nii_source'.";

            BrainBrowser.events.triggerEvent("error", { message: error_message });
            throw new Error(error_message);
        }

        function displayThumbnail(element, stack, loaded) {

            // 得到canvas画布  element：
            // var enabledImage = cornerstone.getEnabledElement(element);
            // if (enabledImage.image) {
            //     // Stop clip from if playing on element
            //     cornerstoneTools.stopClip(element);
            //     // Disable stack scrolling
            //     cornerstoneTools.stackScroll.disable(element);
            //     // Enable stackScroll on selected series
            //     cornerstoneTools.stackScroll.enable(element);
            // }

            // Load the first image of the selected series stack
            cornerstone.loadAndCacheImage(stack.imageIds[0]).then(function(image) {
                if(image.windowCenter === 0) {
                    var maxVoi = image.maxPixelValue * image.slope + image.intercept;
                    var minVoi = image.minPixelValue * image.slope + image.intercept;
                    image.windowWidth = maxVoi - minVoi;
                    image.windowCenter = (maxVoi + minVoi) / 2;
                }

                if (loaded) {
                    loaded.call(image, element, stack);
                }

                // Get the state of the stack tool
                var stackState = cornerstoneTools.getToolState(element, 'stack');
                stackState.data[0] = stack;
                stackState.data[0].currentImageIdIndex = 0;

                // Get the default viewport
                var defViewport = cornerstone.getDefaultViewport(element, image);
                // Get the current series stack index
                // Display the image
                cornerstone.displayImage(element, image, defViewport);
                // Fit the image to the viewport window
                cornerstone.fitToWindow(element);

                // Prefetch the remaining images in the stack (?)
                cornerstoneTools.stackPrefetch.enable(element);

                // Play clip if stack is a movie (has framerate)
                if (stack.frameRate !== undefined) {
                    cornerstoneTools.playClip(element, stack.frameRate);
                }
            });
        };

        function setupViewport(element, stack, image) {
            // Display the image on the viewer element
            cornerstone.displayImage(element, image);

            // If it's a movie (has frames), then play the clip
            // if (stack.frameRate !== undefined) {
            //     cornerstone.playClip(element, stack.frameRate);
            // }

            // Activate mouse clicks, mouse wheel and touch
            cornerstoneTools.mouseInput.enable(element);
            cornerstoneTools.mouseWheelInput.enable(element);
            cornerstoneTools.touchInput.enable(element);

            // Enable all tools we want to use with this element
            cornerstoneTools.wwwc.activate(element, 1); // ww/wc is the default tool for left mouse button
            cornerstoneTools.pan.activate(element, 2); // pan is the default tool for middle mouse button
            cornerstoneTools.zoom.activate(element, 4); // zoom is the default tool for right mouse button
            // cornerstoneTools.probe.enable(element);
            // cornerstoneTools.length.enable(element);
            // cornerstoneTools.ellipticalRoi.enable(element);
            // cornerstoneTools.rectangleRoi.enable(element);
            // cornerstoneTools.wwwcTouchDrag.activate(element);
            // cornerstoneTools.zoomTouchPinch.activate(element);

            // Stack tools
            cornerstoneTools.addStackStateManager(element, ['playClip']);
            cornerstoneTools.addToolState(element, 'stack', stack);
            cornerstoneTools.stackScrollWheel.activate(element);
            cornerstoneTools.stackPrefetch.enable(element);


        }
    };
}());