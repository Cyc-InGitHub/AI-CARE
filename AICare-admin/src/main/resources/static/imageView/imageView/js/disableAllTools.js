// Disable all tools
function disableAllTools() {
    forEachViewport(function(element) {
        cornerstoneTools.crosshairs.disable(element);
        cornerstoneTools.wwwc.disable(element);
        cornerstoneTools.pan.activate(element, 2); // 2 is middle mouse button
        cornerstoneTools.zoom.activate(element, 4); // 4 is right mouse button

        cornerstoneTools.wwwcRegion.deactivate(element, 1);
        cornerstoneTools.magnify.deactivate(element, 1);
        cornerstoneTools.arrowAnnotate.deactivate(element, 1);
        cornerstoneTools.adaptiveBrush.deactivate(element, 1);
        cornerstoneTools.brush.deactivate(element, 1);
        cornerstoneTools.dragProbe.deactivate(element, 1);

        cornerstoneTools.stackScroll.deactivate(element, 1);
        cornerstoneTools.rotate.deactivate(element, 1);
        cornerstoneTools.rectangleRoi.deactivate(element, 1);
        cornerstoneTools.probe.deactivate(element, 1);
        cornerstoneTools.length.deactivate(element, 1);

        cornerstoneTools.freehand.deactivate(element, 1);
        cornerstoneTools.highlight.deactivate(element, 1);
        cornerstoneTools.ellipticalRoi.deactivate(element, 1);
        cornerstoneTools.angle.deactivate(element, 1);
        cornerstoneTools.seedAnnotate.deactivate(element, 1);
        cornerstoneTools.simpleAngle.deactivate(element, 1);

        cornerstoneTools.panTouchDrag.deactivate(element);
        //cornerstoneTools.stackScrollTouchDrag.deactivate(element);

        cornerstoneTools.wwwcRegionTouch.deactivate(element);
        cornerstoneTools.magnifyTouchDrag.deactivate(element);
        cornerstoneTools.arrowAnnotateTouch.deactivate(element);
        cornerstoneTools.drawBrushOnCanvas.deactivate(element);
        cornerstoneTools.dragProbeTouch.deactivate(element);
        cornerstoneTools.zoomTouchDrag.deactivate(element);
        cornerstoneTools.stackScrollTouchDrag.deactivate(element);
        cornerstoneTools.rotateTouchDrag.deactivate(element);

        cornerstoneTools.crosshairsTouch.deactivate(element);
        cornerstoneTools.rectangleRoiTouch.deactivate(element);
        cornerstoneTools.probeTouch.deactivate(element);
        cornerstoneTools.lengthTouch.deactivate(element);
        // cornerstoneTools.textMarker.deactivate(element, 1);
        // cornerstoneTools.textMarkerTouch.deactivate(element);
        cornerstoneTools.freehand.deactivate(element,1);
        cornerstoneTools.highlightTouch.deactivate(element);
        // cornerstoneTools.eraser.disable(element);
        // cornerstoneTools.eraserTouch.deactivate(element, 1);
        cornerstoneTools.ellipticalRoiTouch.deactivate(element);
        cornerstoneTools.angleTouch.deactivate(element);
        cornerstoneTools.seedAnnotateTouch.deactivate(element);
        cornerstoneTools.simpleAngleTouch.deactivate(element);
        //cornerstoneTools.wwwc.disable(element);
        cornerstoneTools.wwwcTouchDrag.deactivate(element);
        // cornerstoneTools.eraser.deactivate(element,1);
        // cornerstoneTools.eraserTouch.deactivate(element);

    });
}