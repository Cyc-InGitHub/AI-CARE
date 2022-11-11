function displayThumbnail(seriesList, seriesElement, element, stack, loaded) {
    // console.log(seriesList);
    // console.log(stack)
    // Deactivate other thumbnails
    $(seriesList).find('a').each(function() {
        $(this).removeClass('active');
    });

    // Make this series visible   使此系列可见

    // Make the selected thumbnail active  激活选定的缩略图
    $(seriesElement).addClass('active');

    var enabledImage = cornerstone.getEnabledElement(element);
    if (enabledImage.image) {
        // Stop clip from if playing on element 如果在元素上播放，则停止剪辑
        cornerstoneTools.stopClip(element);
        // Disable stack scrolling  禁用堆栈滚动
        cornerstoneTools.stackScroll.disable(element);
        // Enable stackScroll on selected series  对所选系列启用堆栈滚动
        cornerstoneTools.stackScroll.enable(element);
    }

    // Load the first image of the selected series stack 加载所选序列堆栈的第一个图像
    cornerstone.loadAndCacheImage(stack.imageIds[0]).then(function(image) {
        // if(image.windowCenter === 0) {
        //     var maxVoi = image.maxPixelValue * image.slope + image.intercept;
        //     var minVoi = image.minPixelValue * image.slope + image.intercept;
        //     image.windowWidth = maxVoi - minVoi;
        //     image.windowCenter = (maxVoi + minVoi) / 2;
        // }
        //console.log(image);
        if (loaded) {
            loaded.call(image, element, stack);
        }

        // Get the state of the stack tool  获取堆栈工具的状态
        var stackState = cornerstoneTools.getToolState(element, 'stack');
        stackState.data[0] = stack;
        stackState.data[0].currentImageIdIndex = 0;

        // Get the default viewport  获取默认视口
        var defViewport = cornerstone.getDefaultViewport(element, image);
        // Get the current series stack index  获取当前序列堆栈索引
        // Display the image  显示图像
        cornerstone.displayImage(element, image, defViewport);
        //console.log(image)
        // Fit the image to the viewport window  将图像适配到视口窗口
        cornerstone.fitToWindow(element);

        // Prefetch the remaining images in the stack (?) 预取堆栈中的剩余图像（？）
        cornerstoneTools.stackPrefetch.enable(element);
        //console.log(element)

        // Play clip if stack is a movie (has framerate)  播放剪辑如果堆栈是电影（有帧速率）
        if (stack.frameRate !== undefined) {
            cornerstoneTools.playClip(element, stack.frameRate);
        }
    });
};