/*
* BrainBrowser: Web-based Neurological Visualization Tools
* (https://brainbrowser.cbrain.mcgill.ca)
*
* Copyright (C) 2011
* The Royal Institution for the Advancement of Learning
* McGill University
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU Affero General Public License as
* published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU Affero General Public License for more details.
*
* You should have received a copy of the GNU Affero General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/*
* Author: Tarek Sherif <tsherif@gmail.com> (http://tareksherif.ca/)
* Author: Paul Mougel
*/

/**
* @doc object
* @name panel
* @property {object} volume The volume being displayed.
* @property {string} axis The name of the axis being displayed (xspace, yspace or zspace).
* @property {object} slice The slice currently being displayed.
* @property {object} canvas Reference to the canvas area used for drawing.
* @property {object} context The 2D context of the canvas. 
* @property {object} image_center The **x** and **y** coordinates of the
*   center of the slice currently being displayed.
* @property {number} zoom The current zoom level of the panel. 
* @property {object} cursor The current **x** and **y** coordinates of the cursor. 
* @property {object} mouse The current **x** and **y** coordinates of the mouse. 
* @description
* Object representing an individual canvas panel.
*/
(function() {
  "use strict";

  /**
  * @doc function
  * @name VolumeViewer.static methods:createPanel
  * @param {object} options Options used to create the panel.
  *  Options can include:
  *
  * * **volume** The volume being displayed on the panel.
  * * **volume_id** The ID of the volume being displayed on the panel.
  * * **axis** The axis being displayed on the panel (xspace, yspace or zspace).
  * * **canvas** The canvas on which to draw slices.
  * * **image_center** An object containing the starting **x** and **y** positions of 
  *     the slice image center.
  * * **updated** Boolean value indicating whether the panel should be redrawn.
  *
  * @returns {object} Panel object used to control display of a slice.
  * @description
  * Factory function to produce the panel object used to control the 
  * display of a slice.
  * ```js
  * BrainBrowser.VolumeViewer.createPanel({
  *   volume: volume,
  *   axis: "xspace",
  *   canvas: canvas,
  *   image_center: {
  *     x: canvas.width / 2,
  *     y: canvas.height / 2
  *   }
  * });
  * ```
  * Handlers can be attached to the  **panel** object to listen
  * for certain events occuring over the panel's lifetime. Currently, the
  * following panel events can be listened for:
  *
  * * **sliceupdate** The slice being displayed has been updated.
  * * **cursorupdate** The cursor has moved.
  * * **zoom** The zoom level has changed on the panel.
  * * **draw** The panel is being re-drawn.
  *
  * To listen for an event, simply use the viewer's **addEventListener()** method with
  * with the event name and a callback funtion:
  *
  * ```js
  *    viewer.addEventListener("sliceupdate", function() {
  *      console.log("Slice updated!");
  *    });
  *
  * ```
  */
  /**
  * @doc object
  * @name VolumeViewer.Panel Events:sliceupdate
  *
  * @description
  * Triggered when the slice being displayed is updated. 
  * The following information will be passed in the event object:
  *
  * * **event.volume**: the volume on which the slice was updated.
  * * **event.slice**: the new slice.
  *
  * ```js
  *    panel.addEventListener("sliceupdate", function(event) {
  *      console.log("New slice!");
  *    });
  * ```
  */
  /**
  * @doc object
  * @name VolumeViewer.Panel Events:cursorupdate
  *
  * @description
  * Triggered when the user changes the cursor's position in the panel.
  * The following information will be passed in the event object:
  *
  * * **event.volume**: the volume for which the cursor moved.
  * * **event.cursor**: an object representing the cursor position.
  *
  * ```js
  *    panel.addEventListener("cursorupdate", function(event) {
  *      console.log("New cursor position:", event.cursor.x, event.cursor.y);
  *    });
  * ```
  */
  /**
  * @doc object
  * @name VolumeViewer.Panel Events:zoom
  *
  * @description
  * Triggered when the user changes the zoom level of the panel (scroll or touch events).
  * The following information will be passed in the event object:
  *
  * * **event.volume**: the volume on which the slice was updated.
  * * **event.zoom**: the new zoom level.
  *
  * ```js
  *    panel.addEventListener("zoom", function(event) {
  *      console.log("New zoom level:", event.zoom);
  *    });
  * ```
  */
  /**
  * @doc object
  * @name VolumeViewer.Panel Events:draw
  *
  * @description
  * Triggered when the panel is redrawn.
  * The following information will be passed in the event object:
  *
  * * **event.canvas**: the panel drawing canvas.
  * * **event.context**: the panel canvas 2D drawing context.
  * * **event.volume**: the volume on which the slice was updated.
  * * **event.cursor**: an object representing the cursor position.
  *
  * ```js
  *    panel.addEventListener("draw", function(event) {
  *      console.log("Panel refresh!");
  *    });
  * ```
  */
  BrainBrowser.VolumeViewer.createPanel = function(options) {

    options = options || {};

    var old_zoom_level = 0;
    
    // Where the cursor used to be.
    var old_cursor_position = {
      x: 0,
      y: 0
    };

    // Where the mouse or touch used to be.
    var old_pointer_position = {
      x: 0,
      y: 0
    };

    var update_timeout = null;

    // Because slice updates can be interrupted, keep
    // callbacks in an array to be executed at the end.
    var update_callbacks = [];

    var panel = {
      image_center: {
        x: 0,
        y: 0
      },
      zoom: 1,  //缩放
      contrast: 1,
      brightness: 0,
      updated: true,
      /**
      * @doc function
      * @name panel.panel:setSize
      * @param {number} width Width of the panel canvas.
      * @param {number} height Height of the panel canvas.
      * @description
      * Set the size of the panel canvas.
      * ```js
      * panel.setSize(512, 512);
      * ```
      */
      setSize: function(width, height, options) {
        options = options || {};
        width = width > 0 ? width : 0;
        height = height > 0 ? height : 0;

        var scale_image = options.scale_image;
        var old_width, old_height, ratio;

        if (scale_image) {
          old_width = panel.canvas.width;
          old_height = panel.canvas.width;
          ratio = Math.min(width / old_width, height / old_height);
        }

        panel.canvas.width = width;
        panel.canvas.height = height;

        if (scale_image) {
          panel.zoom = panel.zoom * ratio;
          panel.default_zoom = panel.default_zoom * ratio;
          panel.image_center.x = width / 2;
          panel.image_center.y = height / 2;
          panel.updateVolumePosition();
          panel.updateSlice();
        }

        panel.updated = true;
      },

      /**
      * @doc function
      * @name panel.panel:followPointer
      * @param {object} pointer The pointer to follow.
      * @returns {object} Object containing properties **dx** and **dy** indicating
      * how much the image moved.
      *
      * @description
      * Will translate the image by the same amount that the pointer has moved since
      * this method was last called.
      * ```js
      * panel.followPointer({
      *   x: 100,
      *   y: 125
      * });
      * ```
      */
      followPointer: function(pointer) {
        var dx = pointer.x - old_pointer_position.x;
        var dy = pointer.y - old_pointer_position.y;

        panel.translateImage(dx, dy);

        old_pointer_position.x = pointer.x;
        old_pointer_position.y = pointer.y;

        return {
          dx: dx,
          dy: dy
        };
      },

      /**
      * @doc function
      * @name panel.panel:translateImage
      * @param {number} dx The **x** component of the translation vector.
      * @param {number} dy The **y** component of the translation vector.
      *
      * @description
      * Translates the slice image by **dx** and **dy**.
      * ```js
      * panel.translateImage(10, 40));
      * ```
      */
      translateImage: function(dx, dy) {
        panel.image_center.x += dx;
        panel.image_center.y += dy;

        panel.updated = true;
      },

      /**
      * @doc function
      * @name panel.panel:reset
      * @description
      * Reset image to it's original position and zoom level.
      * ```js
      * panel.reset();
      * ```
      */
      reset: function() {
        panel.zoom = panel.default_zoom;
        panel.image_center.x = panel.canvas.width / 2;
        panel.image_center.y = panel.canvas.height / 2;
        panel.updated = true;
      },

      /**
      * @doc function
      * @name panel.panel:getCursorPosition
      * @description
      * Get the current position of the cursor.    光标位置获取
      * ```js
      * panel.getCursorPosition();
      * ```
      */
      getCursorPosition: function() {
        var volume = panel.volume;
        var slice = panel.slice;
        var origin = getDrawingOrigin(panel);

        return {
          x: volume.position[slice.width_space.name] * Math.abs(slice.width_space.step) * panel.zoom + origin.x,
          y: (slice.height_space.space_length - volume.position[slice.height_space.name] - 1) * Math.abs(slice.height_space.step) * panel.zoom  + origin.y
        };
      },

      /**
      * @doc function
      * @name panel.panel:updateVolumePosition
      * @param {number} x The x coordinate of the canvas position.
      * @param {number} y The y coordinate of the canvas position.
      * @description
      * Update the volume position based on the given x and y
      * coordinates on the panel. Can be used without arguments
      * which will update based only on the zoom level.
      * ```js
      * panel.updateVolumePosition(x, y);
      * ```
      */
      updateVolumePosition: function(x, y) {
        var origin = getDrawingOrigin(panel);
        var zoom = panel.zoom;
        var volume = panel.volume;
        var slice = panel.slice;
        var cursor;
        var slice_x, slice_y;

        if (x === undefined || y === undefined) {
          cursor = panel.getCursorPosition();
          x = cursor.x;
          y = cursor.y;
        }

        slice_x = Math.round((x - origin.x) / zoom / Math.abs(slice.width_space.step));
        slice_y = Math.round(slice.height_space.space_length - (y - origin.y) / zoom  / Math.abs(slice.height_space.step) - 1);

        volume.position[panel.slice.width_space.name] = slice_x;
        volume.position[panel.slice.height_space.name] = slice_y;

        panel.updated = true;
      },

      /**
      * @doc function
      * @name panel.panel:updateSlice
      * @param {function} callback A callback function to call after
      * the update is complete.
      * @description
      * Update the current slice being drawn based
      * on the current volume position. This function
      * is asynchronous.
      * ```js
      * panel.updateSlice();
      * ```
      */
      updateSlice: function(callback) {
        
        clearTimeout(update_timeout);
        if (BrainBrowser.utils.isFunction(callback)) {
          update_callbacks.push(callback);
        }

        update_timeout = setTimeout(function() {
          var volume = panel.volume;
          var slice;
          
          slice = volume.slice(panel.axis);

          // if(volume.invert == false){
          //   setSlice(panel, slice);
          // }else {
          //   var max = volume.maxPixelValue;
          //   for (let i = 0; i < slice.data.length; i++) {
          //     slice.data[i] = max- slice.data[i];
          //   };
          //   setSlice(panel, slice);
          // }
          setSlice(panel, slice);
          panel.triggerEvent("sliceupdate", {
            volume: volume,
            slice: slice
          });

          panel.updated = true;

          update_callbacks.forEach(function(callback) {
            callback(slice);
          });
          update_callbacks.length = 0;

        }, 0);
      },

      /**
      * @doc function
      * @name panel.panel:draw
      * @param {string} cursor_color The color of the cursor.
      * @param {boolean} active Whether this panel is active or not (i.e.
      * highlighted in red).
      * @description
      * Draw the current slice to the canvas.
      * ```js       绘制切片到当前的画布上
      * panel.draw();
      * ```
      */
      draw: function(cursor_color, active) {
        var cursor = panel.getCursorPosition();

        if (old_cursor_position.x !== cursor.x || old_cursor_position.y !== cursor.y) {
          old_cursor_position.x = cursor.x;
          old_cursor_position.y = cursor.y;
          panel.updated = true;
          panel.triggerEvent("cursorupdate", {
            volume: panel.volume,
            cursor: cursor
          });
        }

        if (old_zoom_level !== panel.zoom) {
          old_zoom_level = panel.zoom;
          panel.updated = true;
          panel.triggerEvent("zoom", {
            volume: panel.volume,
            zoom: panel.zoom
          });
        }

        if (panel.touches[0]) {
          old_pointer_position.x = panel.touches[0].x;
          old_pointer_position.y = panel.touches[0].y;
        } else {
          old_pointer_position.x = panel.mouse.x;
          old_pointer_position.y = panel.mouse.y;
        }

        if (!panel.updated) {
          return;
        }

        var canvas = panel.canvas;
        var context = panel.context;
        var frame_width = 4;
        var half_frame_width = frame_width / 2;
        
        context.globalAlpha = 255;
        context.clearRect(0, 0, canvas.width, canvas.height);

        drawSlice(panel);
        
        panel.triggerEvent("draw", {
          volume: panel.volume,
          cursor: cursor,
          canvas: canvas,
          context: context
        });
        
        drawCursor(panel, cursor_color);

        if (active) {
          context.save();
          context.strokeStyle = "#EC2121";
          context.lineWidth = frame_width;
          context.strokeRect(
            half_frame_width,
            half_frame_width,
            canvas.width - frame_width,
            canvas.height - frame_width
          );
          context.restore();
        }

        panel.updated = false;
      }
    };

    Object.keys(options).forEach(function(k) {
      if (!BrainBrowser.utils.isFunction(panel[k])) {
        panel[k] = options[k];
      }
    });

    BrainBrowser.events.addEventModel(panel);

    if (panel.canvas && BrainBrowser.utils.isFunction(panel.canvas.getContext)) {
      panel.context = panel.canvas.getContext("2d");
      panel.mouse = BrainBrowser.utils.captureMouse(panel.canvas);
      panel.touches = BrainBrowser.utils.captureTouch(panel.canvas);
    }

    if (panel.volume) {
      var volume = panel.volume;
      setSlice(panel, volume.slice(panel.axis));
      panel.default_zoom = volume.getPreferredZoom(panel.canvas.width, panel.canvas.height);
      panel.zoom = panel.default_zoom;
    }

    return panel;
  };

  ///////////////////////
  // Private functions
  ///////////////////////

  // Set the volume slice to be rendered on the panel.
  function setSlice(panel, slice) {
    panel.slice = slice;
    panel.slice_image = panel.volume.getSliceImage(panel.slice, panel.zoom, panel.contrast, panel.brightness);
  }

  // Draw the cursor at its current position on the canvas.
  function drawCursor(panel, color) {
    var context = panel.context;
    var cursor = panel.getCursorPosition();
    var zoom = panel.zoom;
    var length = 8 * (zoom / panel.default_zoom);
    var x, y, space;
    var distance;
    var dx, dy;
    color = color || "#FF0000";
    
    context.save();
    
    context.strokeStyle = color;
    context.fillStyle = color;

    space = 1;
    x = cursor.x;
    y = cursor.y;

    var val=$('input:radio[name="Crosshair"]:checked').val();
    if (val == "hiddenCrosshairs"){

    }else if(val == "showCrosshairs1"){
      context.lineWidth = space * 1;
      context.beginPath();
      context.moveTo(x, 0);
      context.lineTo(x, y - space* 2);
      context.moveTo(x, y + space* 2);
      context.lineTo(x, context.canvas.clientHeight);
      context.moveTo(0, y);
      context.lineTo(x - space* 2, y);
      context.moveTo(x + space* 2, y);
      context.lineTo(context.canvas.clientWidth, y);
      context.stroke();
    }else{
      context.lineWidth = space * 2;
      context.beginPath();
      context.moveTo(x, y - length);
      context.lineTo(x, y - space);
      context.moveTo(x, y + space);
      context.lineTo(x, y + length);
      context.moveTo(x - length, y);
      context.lineTo(x - space, y);
      context.moveTo(x + space, y);
      context.lineTo(x + length, y);
      context.stroke();
    }

    if (panel.Pan){
      panel.followPointer(panel.mouse);
    }

    if (panel.anchor) {
      dx = (panel.anchor.x - cursor.x) / panel.zoom;
      dy = (panel.anchor.y - cursor.y) / panel.zoom;
      distance = Math.sqrt(dx * dx + dy * dy);

      context.font = "bold 12px arial";

      if (panel.canvas.width - cursor.x < 50) {
        context.textAlign = "right";
        x = cursor.x - length;
      } else {
        context.textAlign = "left";
        x = cursor.x + length;
      }

      if (cursor.y < 30) {
        context.textBaseline = "top";
        y = cursor.y + length;
      } else {
        context.textBaseline = "bottom";
        y = cursor.y - length;
      }

      context.fillText(distance.toFixed(2), x, y);

      context.lineWidth = 1;
      context.beginPath();
      context.arc(panel.anchor.x, panel.anchor.y, 2 * space, 0, 2 * Math.PI);
      context.fill();
      context.moveTo(panel.anchor.x, panel.anchor.y);
      context.lineTo(cursor.x, cursor.y);
      context.stroke();
    }

    if (panel.arrow) {
      var piX = panel.arrow.x;
      var piY = panel.arrow.y;
      //var piX, piY;
      var headLength = 10;

      var angle = Math.atan2(piY - cursor.y, piX - cursor.x);

      // Starting path of the arrow from the start square to the end square and drawing the stroke
      var options = {
        color: "red",
        lineWidth: 1
      };
      context.beginPath();
      context.strokeStyle = options.color;
      context.lineWidth = options.lineWidth;
      //context.moveTo(piX, piY);
      //context.lineTo(piX, piY);

      var points = [{
        x: piX - headLength * Math.cos(angle - Math.PI / 7),
        y: piY - headLength * Math.sin(angle - Math.PI / 7)
      }, {
        x: piX - headLength * Math.cos(angle + Math.PI / 7),
        y: piY - headLength * Math.sin(angle + Math.PI / 7)
      }, {x:piX,  y:piY}];

      //context.moveTo(piX, piY);
      points.forEach(function (_ref) {
        var x = _ref.x,
            y = _ref.y;

        context.lineTo(x, y);});
      context.strokeStyle = options.color;
      context.fill();
      context.moveTo(panel.arrow.x, panel.arrow.y);
      context.lineTo(cursor.x, cursor.y);
      context.stroke();
      context.save();
    }

    if (panel.Elliptical) {
      var x = Math.min(panel.Elliptical.x, cursor.x);
      var y = Math.min(panel.Elliptical.y, cursor.y);
      var w = Math.abs(panel.Elliptical.x - cursor.x);
      var h = Math.abs(panel.Elliptical.y - cursor.y);

      var kappa = 0.5522848,
          ox = w / 2 * kappa,
          // Control point offset horizontal
          oy = h / 2 * kappa,
          // Control point offset vertical
          xe = x + w,
          // X-end
          ye = y + h,
          // Y-end
          xm = x + w / 2,
          // X-middle
          ym = y + h / 2; // Y-middle
      context.beginPath();
      context.strokeStyle = color;
      context.lineWidth = 1;
        context.moveTo(x, ym);
        context.bezierCurveTo(x, ym - oy, xm - ox, y, xm, y);
        context.bezierCurveTo(xm + ox, y, xe, ym - oy, xe, ym);
        context.bezierCurveTo(xe, ym + oy, xm + ox, ye, xm, ye);
        context.bezierCurveTo(xm - ox, ye, x, ym + oy, x, ym);
        context.closePath();
      context.stroke();
      context.save();
    }
    if (panel.Rectangle) {
      var left = Math.min(panel.Rectangle.x, cursor.x);
      var top = Math.min(panel.Rectangle.y, cursor.y);
      var width = Math.abs(panel.Rectangle.x - cursor.x);
      var height = Math.abs(panel.Rectangle.y - cursor.y);

      context.beginPath();
      context.strokeStyle = color;
      context.lineWidth = 1;
      context.rect(left, top, width, height);
      context.stroke();
      context.save();
    }


    if (panel.angle){

      context.font = "bold 12px arial";

      if (panel.canvas.width - cursor.x < 50) {
        context.textAlign = "right";
        x = cursor.x - length;
      } else {
        context.textAlign = "left";
        x = cursor.x + length;
      }

      if (cursor.y < 30) {
        context.textBaseline = "top";
        y = cursor.y + length;
      } else {
        context.textBaseline = "bottom";
        y = cursor.y - length;
      }

      context.lineWidth = 1;
      context.beginPath();
      context.arc(panel.angle.x, panel.angle.y, 2 * space, 0, 2 * Math.PI);
      context.fill();

      context.moveTo(panel.angle.x, panel.angle.y);
      context.lineTo(cursor.x, cursor.y);
      context.arc(cursor.x, cursor.y, 2 * space, 0, 2 * Math.PI);
      var cursor1 = panel.getCursorPosition();
      context.moveTo(cursor.x,cursor.y);
      context.lineTo(cursor1.x, cursor1.y);
      context.stroke();
      context.save();
    }
      context.restore();
  }

  // Draw the current slice to the canvas.
  function drawSlice(panel) {
    var image = panel.slice_image;
    var origin;

    if (image) {
      origin = {
        x: panel.image_center.x - panel.slice_image.width / 2,
        y: panel.image_center.y - panel.slice_image.height / 2,
      };
      panel.context.putImageData(image, origin.x, origin.y);
    }

  }

  // Get the origin at which slices should be drawn.
  function getDrawingOrigin(panel) {
    var slice = panel.slice;
    return {
      x: panel.image_center.x - Math.abs(slice.width_space.step * slice.width_space.space_length * panel.zoom) / 2,
      y: panel.image_center.y - Math.abs(slice.height_space.step * slice.height_space.space_length * panel.zoom) / 2
    };
  }

})();

