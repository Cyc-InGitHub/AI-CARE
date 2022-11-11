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
*/

BrainBrowser.VolumeViewer.modules.loading = function(viewer) {
  "use strict";


  var VolumeViewer = BrainBrowser.VolumeViewer;
  var default_color_map = null;
  var default_color_map1 = null;
  var default_panel_width ;
  var default_panel_height;

  /**
  * @doc function
  * @name viewer.loading:loadVolumes
  * @param {object} options Description of volumes to load:
  * * **volumes** {array} An array of volume descriptions.
  * * **overlay** {boolean|object} Set to true to display an overlay of
  *   the loaded volumes without any interface, or provide and object
  *   containing a description of the template to use for the UI (see below).
  * * **complete** {function} Callback invoked once all volumes are loaded.
  *
  * @description
  * Initial load of volumes. Usage:
  * ```js
  * viewer.loadVolumes({
  *   volumes: [
  *     {
  *       type: "minc",
  *       header_url: "volume1.mnc?minc_headers=true",
  *       raw_data_url: "volume1.mnc?raw_data=true",
  *       template: {
  *         element_id: "volume-ui-template",
  *         viewer_insert_class: "volume-viewer-display"
  *       }
  *     },
  *     {
  *       type: "minc",
  *       header_file: document.getElementById("header-file"),
  *       raw_data_file: document.getElementById("raw-data-file"),
  *       template: {
  *         element_id: "volume-ui-template",
  *         viewer_insert_class: "volume-viewer-display"
  *       }
  *     }
  *   ],
  *   overlay: {
  *     template: {
  *       element_id: "overlay-ui-template",
  *       viewer_insert_class: "overlay-viewer-display"
  *     }
  *   }
  * });
  * ```
  * The volume viewer can use the following parameters to describe the volumes to be loaded:
  * * **type** The type of volume. This should map to one of the volume loaders.
  * * **template** (optional) Object containing information about the template to use
  *   to produce the UI for each volume. Its properties include **element\_id**,
  *   the id of the element containing the template, and
  *   **viewer\_insert\_class**, the class of the element within the template
  *   in which to insert the volume's display panels.
  *
  * Other parameters may be required for given volume types.
  */
  viewer.loadVolumes = function(options) {

    options = options || {};
    viewer.masktem=  options.overlay && typeof options.overlay === "object" ? options.overlay : {};
    var overlay_options = options.overlay && typeof options.overlay === "object" ? options.overlay : {};
    var volume_descriptions = options.volumes;
    var num_descriptions = options.volumes.length;
    viewer.num=num_descriptions;
    var complete = options.complete;
    var num_loaded = 0;
    var i;
    viewer.masktem=options.overlay && typeof options.overlay === "object" ? options.overlay : {};
    function loadVolume(i) {
      setVolume(i, volume_descriptions[i], function() {
        if (++num_loaded < num_descriptions&&num_descriptions>1) {
          return;
        }
        if (options.overlay) {
          viewer.createOverlay(overlay_options, function() {
            if (BrainBrowser.utils.isFunction(complete)) {
              complete();
            }
            viewer.triggerEvent("volumesloaded");
          });
        } else {
          if (BrainBrowser.utils.isFunction(complete)) {
            complete();
          }
          viewer.triggerEvent("volumesloaded");
        }
      });
    }
    for (i = 0; i < num_descriptions; i++) {
      loadVolume(i);
    }
  };
  viewer.loadVolumes1 = function(options) {

    options = options || {};
    var overlay_options = options.overlay && typeof options.overlay === "object" ? options.overlay : {};
    var volume_descriptions = options.volumes;
    var num_descriptions = options.volumes.length;
    var complete = options.complete;
    var num_loaded = 0;
    var i;

    function loadVolume1(i) {

      setVolume1(i, volume_descriptions[i], function() {
        console.log("已返回");
        if (++num_loaded < num_descriptions&&num_descriptions>1) {
          return;
        }

        if (options.overlay) {
console.log("进入overlay");
          viewer.createOverlay(overlay_options, function() {
            if (BrainBrowser.utils.isFunction(complete)) {
              complete();
            }

            viewer.triggerEvent("volumesloaded");
          });
        } else {
          if (BrainBrowser.utils.isFunction(complete)) {
            complete();
          }

          viewer.triggerEvent("volumesloaded");
        }
      });
    }

    for (i = 0; i < num_descriptions; i++) {

      loadVolume1(i);
    }

  };
  /**
  * @doc function
  * @name viewer.loading:loadVolumeColorMapFromURL
  * @param {number} vol_id Index of the volume to be updated.
  * @param {string} url URL of the color map file.
  * @param {string} cursor_color Color to be used for the cursor.
  * @param {function} callback Callback to which the color map object will be passed
  *   after loading.
  *
  * @description
  * Load a color map for the specified volume.
  * ```js
  * viewer.loadVolumeColorMapFromURL(vol_id, url, "#FF0000", function(volume, color_map) {
  *   // Manipulate volume or color map.
  * });
  * ```
  */
  viewer.loadVolumeColorMapFromURL = function(vol_id, url, cursor_color, callback) {
    BrainBrowser.loader.loadColorMapFromURL(url, function(color_map) {
      setVolumeColorMap(vol_id, color_map, cursor_color, callback);
    }, { scale: 255 });
  };

  /**
  * @doc function
  * @name viewer.loading:loadDefaultColorMapFromURL
  * @param {string} url URL of the color map file.
  * @param {string} cursor_color Color to be used for the cursor.
  * @param {function} callback Callback to which the color map object will be passed
  *   after loading.
  *
  * @description
  * Load a default color map for the viewer. Used when a given volume
  *   doesn't have its color map set.
  * ```js
  * viewer.loadDefaultColorMapFromURL(url, "#FF0000", function(color_map) {
  *   // Manipulate color map.
  * });
  * ```
  */
  viewer.loadDefaultColorMapFromURL = function(url, cursor_color, callback) {
    BrainBrowser.loader.loadColorMapFromURL(url, function(color_map) {
      setDefaultColorMap(color_map, cursor_color, callback);
    }, { scale: 255 });
  };
  viewer.loadDefaultColorMapFromURL1 = function(url, cursor_color, callback) {
    BrainBrowser.loader.loadColorMapFromURL(url, function(color_map) {
      setDefaultColorMap1(color_map, cursor_color, callback);
    }, { scale: 255 });
  };
  /**
  * @doc function
  * @name viewer.loading:loadVolumeColorMapFromFile
  * @param {number} vol_id Index of the volume to be updated.
  * @param {DOMElement} file_input File input element representing the color map file to load.
  * @param {string} cursor_color Color to be used for the cursor.
  * @param {function} callback Callback to which the color map object will be passed
  *   after loading.
  *
  * @description
  * Load a color map for the specified volume.
  * ```js
  * viewer.loadVolumeColorMapFromFile(vol_id, file_input_element, "#FF0000", function(volume, color_map) {
  *   // Manipulate volume or color map.
  * });
  * ```
  */
  viewer.loadVolumeColorMapFromFile = function(vol_id, file_input, cursor_color, callback) {
    BrainBrowser.loader.loadColorMapFromFile(file_input, function(color_map) {
      setVolumeColorMap(vol_id, color_map, cursor_color, callback);
    }, { scale: 255 });
  };

  /**
  * @doc function
  * @name viewer.loading:loadDefaultColorMapFromFile
  * @param {DOMElement} file_input File input element representing the color map file to load.
  * @param {string} cursor_color Color to be used for the cursor.
  * @param {function} callback Callback to which the color map object will be passed
  *   after loading.
  *
  * @description
  * Load a default color map for the viewer. Used when a given volume
  *   doesn't have its color map set.
  * ```js
  * viewer.loadDefaultColorMapFromFile(file_input_element, "#FF0000", function(color_map) {
  *   // Manipulate color map.
  * });
  * ```
  */
  viewer.loadDefaultColorMapFromFile = function(file_input, cursor_color, callback) {
    BrainBrowser.loader.loadColorMapFromFile(file_input, function(color_map) {
      setDefaultColorMap(color_map, cursor_color, callback);
    }, { scale: 255 });
  };
  /**
  * @doc function
  * @name viewer.loading:setVolumeColorMap
  * @param {number} vol_id Index of the volume to be updated.
  * @param {object} color_map Color map to use for the indicated volume.
  *
  * @description
  * Set the color map for the indicated volume using an actual color map
  *   object.
  * ```js
  * viewer.setVolumeColorMap(vol_id, color_map));
  * ```
  */
  viewer.setVolumeColorMap = function(vol_id, color_map) {
    viewer.volumes[vol_id].color_map = color_map;
  };

  /**
  * @doc function
  * @name viewer.loading:loadVolume
  * @param {object} volume_description Description of the volume to be loaded.
  *   Must contain at least a **type** property that maps to the volume loaders in
  *   **BrainBrowser.volume_loaders.** May contain a **template** property that
  *   indicates the template to be used for the volume's UI. Other properties will be
  *   specific to a particular volume type.
  * @param {function} callback Callback to which the new volume object will be passed
  *   after loading.
  *
  * @description
  * Load a new volume.
  * ```js
  * // Load over the network.
  * viewer.loadVolume({
  *   type: "minc",
  *   header_url: "volume1.mnc?minc_headers=true",
  *   raw_data_url: "volume1.mnc?raw_data=true",
  *   template: {
  *     element_id: "volume-ui-template",
  *     viewer_insert_class: "volume-viewer-display"
  *   }
  * });
  *
  * // Load from local files.
  * viewer.loadVolume({
  *   type: "minc",
  *   header_file: document.getElementById("header-file"),
  *   raw_data_file: document.getElementById("raw-data-file"),
  *   template: {
  *     element_id: "volume-ui-template",
  *     viewer_insert_class: "volume-viewer-display"
  *   }
  * });
  * ```
  */
  viewer.loadVolume = function(volume_description, callback) {

    setVolume1(viewer.volumedata.length, volume_description, callback);
  };
  viewer.loadVolume1 = function(volume_description, callback) {

    setVolume1(viewer.volumes.length, volume_description, callback);
  };
  /**
  * @doc function
  * @name viewer.loading:clearVolumes
  *
  * @description
  * Clear all loaded volumes.
  * ```js
  * viewer.clearVolumes();
  * ```
  */
  viewer.clearVolumes = function() {
    viewer.volumes.forEach(function(volume) {
      volume.triggerEvent("eventmodelcleanup");
    });

    viewer.volumes = [];
    viewer.containers = [];
    viewer.active_panel = null;
    viewer.dom_element.innerHTML = "";
  };

  /**
  * @doc function
  * @name viewer.loading:createOverlay
  * @param {object} volume_description Will contain at most a **template**
  *   property indicating the template to use for the UI.
  * @param {function} callback Callback to which the new overlay volume object
  *   will be passed after loading.
  *
  * @description
  * Create an overlay of the currently loaded volumes.
  * ```js
  * viewer.createOverlay({
  *   template: {
  *     element_id: "overlay-ui-template",
  *     viewer_insert_class: "overlay-viewer-display"
  *   }
  * });
  * ```
  */
  viewer.createOverlay = function(description, callback) {

    description = description || {};

    viewer.loadVolume({
        volumes: viewer.volumedata,
        type: "overlay",
        template: description.template
      },
      callback
    );
  };
  viewer.createOverlay1 = function(description, callback) {

    description = description || {};

    viewer.loadVolume({
          volumes: viewer.mask,
          type: "overlay",
          template: description.template
        },
        callback
    );
  };
  /**
  * @doc function
  * @name viewer.loading:setDefaultPanelSize
  * @param {number} width Panel width.
  * @param {number} height Panel height.
  *
  * @description
  * Set the default size for panel canvases.
  * ```js
  * viewer.setDefaultPanelSize(512, 512);
  * ```
  */
  viewer.setDefaultPanelSize = function(width, height) {
    default_panel_width = width;
    default_panel_height = height;
  };
		// syncPosition函数使所有图片十字位置保持一致
		// panel,volume,axis_name都在volume.viewer.js文件413行定义
  viewer.syncPosition = function(panel, volume, axis_name) {
    var wc = volume.getWorldCoords();
    viewer.volumes.forEach(function(synced_volume) {
      if (synced_volume !== volume) {
        var synced_panel = synced_volume.display.getPanel(axis_name);
        synced_panel.volume.setWorldCoords(wc.x, wc.y, wc.z);
        synced_panel.updated = true;
        synced_volume.display.forEach(function(panel) {
          if (panel !== synced_panel) {
            panel.updateSlice();
          }
        });
      }
    });
  };

  ///////////////////////////
  // Private Functions
  ///////////////////////////

  // Open volume using appropriate volume loader
  function openVolume(volume_description, callback){
    var loader = VolumeViewer.volume_loaders[volume_description.type];
    var error_message;

    if(loader){
      loader(volume_description, callback);
    } else {
      error_message = "Unsuported Volume Type";

      BrainBrowser.events.triggerEvent("error", { message: error_message });
      throw new Error(error_message);
    }
  }

  // Place a volume at a certain position in the volumes array.
  // This function should be used with care as empty places in the volumes
  // array will cause problems with rendering.将卷放置在卷阵列中的特定位置。使用此函数时应小心，因为卷数组中的空白位置会导致渲染问题。
  function  setVolume(vol_id, volume_description, callback) {
    openVolume(volume_description, function(volume) {
      volume.id=vol_id;
      var slices_loaded = 0;
      var views = volume_description.views || ["xspace","yspace","zspace"];

      BrainBrowser.events.addEventModel(volume);

      volume.addEventListener("eventmodelcleanup", function() {
        volume.display.triggerEvent("eventmodelcleanup");
      });
      viewer.volumes[vol_id] = volume;
      viewer.volumedata[vol_id]=volume;
      volume.color_map = default_color_map;
      volume.display = createVolumeDisplay(viewer.dom_element, vol_id, volume_description);
      volume.propagateEventTo("*", viewer);
      ["xspace", "yspace", "zspace"].forEach(function(axis) {
var hm=0;
        if(viewer.select===1)
        {

          var header =volume.header;
          if(axis==="xspace") {

            volume.position[axis] = header.xspace.step > 0 ? volume.position[axis] : header.xspace.space_length - volume.position[axis];
          }
          if(axis==="yspace") {

            volume.position[axis] = header.yspace.step > 0 ? volume.position[axis] : header.yspace.space_length - volume.position[axis];
          }
          if(axis==="zspace") {

            volume.position[axis] = header.zspace.step > 0 ? volume.position[axis] : header.zspace.space_length - volume.position[axis];
          }
          hm=hm+1;
        }else{

          volume.position[axis] = Math.floor(volume.header[axis].space_length / 2);
          hm=hm+1;
        }

        var hm=document.getElementById("scroll1");
        var bar1=document.getElementById("bar1");
        var bar2=document.getElementById("bar2");
        viewer.spacing[0]=250/volume.header["xspace"].space_length;
        viewer.spacing[1]=250/volume.header["yspace"].space_length;
        viewer.spacing[2]=250/volume.header["zspace"].space_length;
        viewer.headerwidth[0]=volume.header["xspace"].space_length;
        viewer.headerwidth[1]=volume.header["yspace"].space_length;
        viewer.headerwidth[2]=volume.header["zspace"].space_length;
        if(axis==="xspace")
      {
        var i=viewer.spacing[0]* volume.position[axis];
  bar1.style.top = i+ 'px';
      }
        if(axis==="yspace")
        {
          var i=viewer.spacing[1]* volume.position[axis];
          bar2.style.top = i+ 'px';
        }
      });
      volume.display.forEach(function(panel) {
          panel.updateSlice(function() {
          if (++slices_loaded === views.length) {
            viewer.triggerEvent("volumeloaded", {
              volume: volume
            });
            if (BrainBrowser.utils.isFunction(callback)) {

              callback(volume);
            }
          }
        });
      });

    });
  }
  function  setVolume1(vol_id, volume_description,callback) {
    openVolume(volume_description, function(volume) {
      var slices_loaded = 0;
      var views = volume_description.views || ["xspace","yspace","zspace"];
      BrainBrowser.events.addEventModel(volume);
      volume.id=vol_id;
      volume.addEventListener("eventmodelcleanup", function() {
        volume.display.triggerEvent("eventmodelcleanup");
      });


      var hm=0;
      ["xspace", "yspace", "zspace"].forEach(function(axis) {
        if(viewer.select===1)
        {
          volume.position[axis]=viewer.save[hm];
          var header =volume.header;
          if(axis==="xspace") {
            volume.position[axis] = header.xspace.step > 0 ? volume.position[axis] : header.xspace.space_length - volume.position[axis];
          }
          if(axis==="yspace") {
            volume.position[axis] = header.yspace.step > 0 ? volume.position[axis] : header.yspace.space_length - volume.position[axis];
          }
          if(axis==="zspace") {

            volume.position[axis] = header.zspace.step > 0 ? volume.position[axis] : header.zspace.space_length - volume.position[axis];
          }
          hm=hm+1;
        }else{

        volume.position[axis] = Math.floor(volume.header[axis].space_length / 2);
        hm=hm+1;
        }
        viewer.headerwidth[0]=volume.header["xspace"].space_length;
        viewer.headerwidth[1]=volume.header["yspace"].space_length;
        viewer.headerwidth[2]=volume.header["zspace"].space_length;
      });



      if(vol_id===0){
        volume.color_map = default_color_map;}
      else {

        volume.color_map = default_color_map1;
      }
      if(vol_id===2){
        viewer.volumes[vol_id] = volume;
      volume.display = createVolumeDisplay(viewer.dom_element, vol_id, volume_description);
        volume.propagateEventTo("*", viewer);
        volume.display.forEach(function(panel) {
          panel.updateSlice(function() {
            if (++slices_loaded === views.length) {
              viewer.triggerEvent("volumeloaded", {
                volume: volume
              });
              if (BrainBrowser.utils.isFunction(callback)) {
                callback(volume);
              }
            }
          });
        });

      }
      else{
        viewer.volumedata[vol_id]=volume;
        viewer.volumes[vol_id] = volume;

        volume.display = createVolumeDisplay1(viewer.dom_element, vol_id, volume_description);
        volume.propagateEventTo("*", viewer);
        volume.display.forEach(function(panel) {
          panel.updateSlice(function() {
            if (++slices_loaded === views.length) {
              viewer.triggerEvent("volumeloaded", {
                volume: volume
              });
              if (BrainBrowser.utils.isFunction(callback)) {
                callback(volume);
              }
            }
          });
        });
      }

    });
    // return viewer.volumes[0];
  }

  function setDefaultColorMap(color_map, cursor_color, callback) {
    color_map.cursor_color = cursor_color;
    default_color_map = color_map;

    viewer.volumes.forEach(function(volume) {
      volume.color_map = volume.color_map || default_color_map;
    });

    if (BrainBrowser.utils.isFunction(callback)) {
      callback(color_map);
    }
  }
  function setDefaultColorMap1(color_map, cursor_color, callback) {
    color_map.cursor_color = cursor_color;
    default_color_map1 = color_map;
    if (BrainBrowser.utils.isFunction(callback)) {
      callback(color_map);
    }
  }
  function setVolumeColorMap(vol_id, color_map, cursor_color, callback) {
    color_map.cursor_color = cursor_color;
    viewer.setVolumeColorMap(vol_id, color_map);

    if (BrainBrowser.utils.isFunction(callback)) {
      callback(viewer.volumes[vol_id], color_map);
    }
  }

  function getTemplate(dom_element, vol_id, template_id, viewer_insert_class) {
    var template = document.getElementById(template_id).innerHTML.replace(/\{\{VOLID\}\}/gm, vol_id);
    var temp = document.createElement("div");
    temp.innerHTML = template;
    var template_elements = temp.childNodes;
    var viewer_insert = temp.getElementsByClassName(viewer_insert_class)[0];

    var i, count;
    var node;

    for (i = 0, count = dom_element.childNodes.length; i < count; i++) {
      node = dom_element.childNodes[i];
      if (node.nodeType === 1) {
        viewer_insert.appendChild(node);
        i--;
        count--;
      }
    }

    return template_elements;
  }

  // Create canvases and add mouse interface.
  function createVolumeDisplay(dom_element, vol_id, volume_description) {
    var container = document.createElement("div");
    container.id="container";
    var volume = viewer.volumes[vol_id];
    var display = VolumeViewer.createDisplay();
    var template_options = volume_description.template || {};
    var views = volume_description.views || ["xspace", "yspace", "zspace"];
    var template;

    display.propagateEventTo("*", volume);

    container.classList.add("volume-container");

    views.forEach(function(axis_name) {
      var canvas;
      if(axis_name==="xspace"){
       canvas= document.getElementById("editbox");
    }
      else if(axis_name==="yspace"){
        canvas= document.getElementById("edit1box");
       }
      else{
        canvas= document.getElementById("edit2box");

      }

      canvas.width = default_panel_width;
      canvas.height = default_panel_height;
      // canvas.classList.add("slice-display");

      canvas.style.backgroundColor = "#000000";
      // container.appendChild(canvas);
      display.setPanel(
        axis_name,
        VolumeViewer.createPanel({
          volume: volume,
          volume_id: vol_id,
          axis: axis_name,
          canvas: canvas,
          image_center: {
            x: canvas.width / 2,
            y: canvas.height / 2
          }
        })
      );
    });

    if (template_options.element_id && template_options.viewer_insert_class) {
      template = getTemplate(container, vol_id, template_options.element_id, template_options.viewer_insert_class);

      if (typeof template_options.complete === "function") {
        template_options.complete(volume, template);
      }
      Array.prototype.forEach.call(template, function(node) {
        if (node.nodeType === 1) {
          container.appendChild(node);
        }
      });
    }

    ///////////////////////////////////
    // Mouse Events
    ///////////////////////////////////

    (function() {

      var current_target = null;

      views.forEach(function(axis_name) {
        var canvas1=document.getElementById("coverbox");
        var canvas2=document.getElementById("coverbox1");
        var canvas3=document.getElementById("coverbox2");
        var panel = display.getPanel(axis_name);
        var canvas = panel.canvas;
        var last_touch_distance = null;
        function startDrag(pointer, shift_key, ctrl_key) {
          if (ctrl_key) {
            viewer.volumes.forEach(function(volume) {
              volume.display.forEach(function(panel) {
                panel.anchor = null;
              });
            });

            panel.anchor = {
              x: pointer.x,
              y: pointer.y
            };
          }

          if (!shift_key) {
            panel.updateVolumePosition(pointer.x, pointer.y);
            volume.display.forEach(function(other_panel) {

              if (panel !== other_panel) {
                other_panel.updateSlice();
              }
            });

            if (viewer.synced){
              viewer.syncPosition(panel, volume, axis_name);
            }
          }
          panel.updated = true;
        }

        function drag(pointer, shift_key) {
          var drag_delta;
          if(shift_key) {

            drag_delta = panel.followPointer(pointer);
            if (viewer.synced){
              viewer.volumes.forEach(function(synced_volume, synced_vol_id) {
                var synced_panel;
                if (synced_vol_id !== vol_id) {
                  synced_panel = synced_volume.display.getPanel(axis_name);
                  synced_panel.translateImage(drag_delta.dx, drag_delta.dy);
                }
              });
            }}
          else {
            panel.updateVolumePosition(pointer.x, pointer.y);
            volume.display.forEach(function(other_panel) {
              if (panel !== other_panel) {
                other_panel.updateSlice();
              }
            });

            if (viewer.synced){
              viewer.syncPosition(panel, volume, axis_name);
            }
          }
          panel.updated = true;
        }
        function mouseDrag1(event) {
          if(event.target === current_target) {
            event.preventDefault();
            drag1(panel.mouse, event.shiftKey,event.ctrlKey);
          }
        }
        function drag1(pointer, shift_key,ctrl_key) {
          var drag_delta;
          if(shift_key) {
            viewer.click=1;

            if (axis_name === "xspace") {

              drag_delta = panel.followPointer(pointer);
              if (viewer.synced) {
                viewer.volumes.forEach(function (synced_volume, synced_vol_id) {
                  var synced_panel;
                  if (synced_vol_id !== vol_id) {
                    synced_panel = synced_volume.display.getPanel(axis_name);
                    synced_panel.translateImage(drag_delta.dx, drag_delta.dy);
                  }
                });
              }
            }

            panel.updated = true;
          }
          if(ctrl_key)
          {

            panel = display.getPanel("xspace");
            viewer.active_panel = panel;
          }}
        function mouseDrag2(event) {
          if(event.target === current_target) {
            event.preventDefault();
            drag2(panel.mouse, event.shiftKey);
          }
        }
        function drag2(pointer, shift_key) {
          var drag_delta;
          if(shift_key) {
            if (axis_name === "yspace") {

              drag_delta = panel.followPointer(pointer);
              if (viewer.synced) {
                viewer.volumes.forEach(function (synced_volume, synced_vol_id) {
                  var synced_panel;
                  if (synced_vol_id !== vol_id) {
                    if(axis_name === "yspace"){
                    synced_panel = synced_volume.display.getPanel(axis_name);
                    synced_panel.translateImage(drag_delta.dx, drag_delta.dy);
                  }}
                });
              }
            }

            panel.updated = true;
          } }
        function mouseDrag3(event) {

          if(event.target === current_target) {
            event.preventDefault();
            drag3(panel.mouse, event.shiftKey,event.ctrlKey);
          }
        }
        function drag3(pointer, shift_key,ctrl_kry) {
          var drag_delta;
          if(shift_key) {
            if (axis_name === "zspace") {

              drag_delta = panel.followPointer(pointer);
              if (viewer.synced) {
                viewer.volumes.forEach(function (synced_volume, synced_vol_id) {
                  var synced_panel;
                  if (synced_vol_id !== vol_id) {
                    synced_panel = synced_volume.display.getPanel(axis_name);
                    synced_panel.translateImage(drag_delta.dx, drag_delta.dy);
                  }
                });
              }
            }

            panel.updated = true;
          }
        if(ctrl_kry)
        {
          panel = display.getPanel("zspace");
          viewer.active_panel = panel;
        }
        }
        function mouseDrag(event) {
          if(event.target === current_target) {
            event.preventDefault();
            drag(panel.mouse, event.shiftKey);
          }
        }
        function touchDrag(event) {
          if(event.target === current_target) {
            event.preventDefault();
            drag(panel.touches[0], panel.touches.length === views.length);
          }
        }

        function mouseDragEnd() {
          document.removeEventListener("mousemove", mouseDrag, false);
          document.removeEventListener("mouseup", mouseDragEnd, false);
          viewer.volumes.forEach(function(volume) {
            volume.display.forEach(function(panel) {
              panel.anchor = null;
            });
          });
          current_target = null;
        }
        function mouseDragEnd1() {
          viewer.click=0;
          document.removeEventListener("mousemove", mouseDrag1, false);
          document.removeEventListener("mouseup", mouseDragEnd1, false);
          viewer.volumes.forEach(function(volume) {
            volume.display.forEach(function(panel) {
              panel.anchor = null;
            });
          });
          current_target = null;
        }
        function mouseDragEnd2() {
          document.removeEventListener("mousemove", mouseDrag2, false);
          document.removeEventListener("mouseup", mouseDragEnd2, false);
          viewer.volumes.forEach(function(volume) {
            volume.display.forEach(function(panel) {
              panel.anchor = null;
            });
          });
          current_target = null;
        }
        function mouseDragEnd3() {
          document.removeEventListener("mousemove", mouseDrag3, false);
          document.removeEventListener("mouseup", mouseDragEnd3, false);
          viewer.volumes.forEach(function(volume) {
            volume.display.forEach(function(panel) {
              panel.anchor = null;
            });
          });
          current_target = null;
        }
        function touchDragEnd() {
          document.removeEventListener("touchmove", touchDrag, false);
          document.removeEventListener("touchend", touchDragEnd, false);
          viewer.volumes.forEach(function(volume) {
            volume.display.forEach(function(panel) {
              panel.anchor = null;
            });
          });
          current_target = null;
        }

        function touchZoom(event) {
          var dx = panel.touches[0].x - panel.touches[1].x;
          var dy = panel.touches[0].y - panel.touches[1].y;

          var distance = Math.sqrt(dx * dx + dy * dy);
          var delta;

          event.preventDefault();

          if (last_touch_distance !== null) {
            delta = distance - last_touch_distance;

            zoom(delta * 0.2);
          }

          last_touch_distance = distance;
        }

        function touchZoomEnd() {
          document.removeEventListener("touchmove", touchZoom, false);
          document.removeEventListener("touchend", touchZoomEnd, false);

          last_touch_distance = null;
        }

        canvas1.addEventListener("mousedown", function(event) {
          event.preventDefault()
            current_target = event.target;
            if (viewer.active_panel) {
              viewer.active_panel.updated = true;
            }
          panel = display.getPanel("xspace");
            viewer.active_panel = panel;
            document.addEventListener("mousemove", mouseDrag1, false);
            document.addEventListener("mouseup", mouseDragEnd1, false);
            // startDrag(panel.mouse, event.shiftKey, event.ctrlKey);
           }, false);
        canvas2.addEventListener("mousedown", function(event) {
          event.preventDefault()
          current_target = event.target;
          if (viewer.active_panel) {
            viewer.active_panel.updated = true;
          }
          panel = display.getPanel("yspace");
          viewer.active_panel = panel;
if(axis_name==="yspace")
          document.addEventListener("mousemove", mouseDrag2, false);
          document.addEventListener("mouseup", mouseDragEnd2, false);
          // startDrag(panel.mouse, event.shiftKey, event.ctrlKey);
        }, false);
        canvas3.addEventListener("mousedown", function(event) {
          event.preventDefault()
          current_target = event.target;
          if (viewer.active_panel) {
            viewer.active_panel.updated = true;
          }
          panel = display.getPanel("zspace");
          viewer.active_panel = panel;

          document.addEventListener("mousemove", mouseDrag3, false);
          document.addEventListener("mouseup", mouseDragEnd3, false);
          // startDrag(panel.mouse, event.shiftKey, event.ctrlKey);
        }, false);
        canvas.addEventListener("mousedown", function(event) {
          event.preventDefault()
          current_target = event.target;
          if (viewer.active_panel) {
            viewer.active_panel.updated = true;
          }
          viewer.active_panel = panel;

          document.addEventListener("mousemove", mouseDrag, false);
          document.addEventListener("mouseup", mouseDragEnd, false);
          startDrag(panel.mouse, event.shiftKey, event.ctrlKey);
        }, false);
        canvas.addEventListener("touchstart", function(event) {
          event.preventDefault();

          current_target = event.target;

          if (viewer.active_panel) {
            viewer.active_panel.updated = true;
          }
          viewer.active_panel = panel;

          if (panel.touches.length === 2) {
            document.removeEventListener("touchmove", touchDrag, false);
            document.removeEventListener("touchend", touchDragEnd, false);
            document.addEventListener("touchmove", touchZoom, false);
            document.addEventListener("touchend", touchZoomEnd, false);
          } else {
            document.removeEventListener("touchmove", touchZoom, false);
            document.removeEventListener("touchend", touchZoomEnd, false);
            document.addEventListener("touchmove", touchDrag, false);
            document.addEventListener("touchend", touchDragEnd, false);

            startDrag(panel.touches[0], panel.touches.length === 3, true);
          }

        }, false);

        function wheelHandler(event) {
          event.preventDefault();
            zoom(Math.max(-1, Math.min(1, (event.wheelDelta || -event.detail))));
        }
        function zoom(delta) {
          panel.zoom *= (delta < 0) ? 1/1.05 : 1.05;
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
        function wheelHandler1(event) {
          event.preventDefault();
          zoom1(Math.max(-1, Math.min(1, (event.wheelDelta || -event.detail))));
        }
        function zoom1(delta) {
          panel.zoom *= (delta < 0) ? 1/1.05 : 1.05;
          panel.zoom = Math.max(panel.zoom, 0.25);
          panel.updateVolumePosition();
          if(panel.axis==="xspace")
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
        function wheelHandler2(event) {
          event.preventDefault();
          zoom2(Math.max(-1, Math.min(1, (event.wheelDelta || -event.detail))));
        }
        function zoom2(delta) {
          panel.zoom *= (delta < 0) ? 1/1.05 : 1.05;
          panel.zoom = Math.max(panel.zoom, 0.25);
          panel.updateVolumePosition();
          if(panel.axis==="yspace")
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
        function wheelHandler3(event) {
          event.preventDefault();
          zoom3(Math.max(-1, Math.min(1, (event.wheelDelta || -event.detail))));
        }
        function zoom3(delta) {
          panel.zoom *= (delta < 0) ? 1/1.05 : 1.05;
          panel.zoom = Math.max(panel.zoom, 0.25);
          panel.updateVolumePosition();
          if(panel.axis==="zspace")
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
        //在标注时使用可覆盖一层canvas进行标注，本来想的时当标注时取消鼠标监听事件，直接在原来的canvas标注，
        // 但是clear标注时需要清空canvas,就会把原图像清空。选中各个覆盖canvas对应的space，当在特定的canvas进行滚轮事件时
        //特定的space图像发生放大缩小，添加了if(panel.axis==="xspace"）
        //火狐上鼠标滑轮滚动事件是 DOMMouseScroll，其余为mouse wheel
        canvas1.addEventListener("mousewheel", wheelHandler1, false);
        canvas2.addEventListener("mousewheel", wheelHandler2, false);
        canvas3.addEventListener("mousewheel", wheelHandler3, false);
        canvas1.addEventListener("DOMMouseScroll", wheelHandler1, false);
        canvas2.addEventListener("DOMMouseScroll", wheelHandler2, false);
        canvas3.addEventListener("DOMMouseScroll", wheelHandler3, false);
        canvas.addEventListener("mousewheel", wheelHandler, false);
        canvas.addEventListener("DOMMouseScroll", wheelHandler, false); // Dammit Firefox

        });
    })();
    viewer.containers[vol_id] = container;
    /* See if a subsequent volume has already been loaded. If so we want
     * to be sure that this container is inserted before the subsequent
     * container. This guarantees the ordering of elements.
     */
    var containers = viewer.containers;
    var next_id;

    // if(vol_id===containers.length-1){
    // for (next_id = vol_id + 1; next_id < containers.length; next_id++) {

    //   if (next_id in containers) {
    //     dom_element.insertBefore(container, containers[vol_id]);
    //     break;
    //   }
    // }}

      dom_element.appendChild(container);

    viewer.triggerEvent("volumeuiloaded", {
      container: container,
      volume: volume,
      volume_id: vol_id
    });

    return display;
  }
  function createVolumeDisplay1(dom_element, vol_id, volume_description) {
    var container = document.createElement("div");
    var volume = viewer.volumes[vol_id];

    var display = VolumeViewer.createDisplay();
    var template_options = volume_description.template || {};
    var views = volume_description.views || ["xspace", "yspace", "zspace"];
    var template;

    display.propagateEventTo("*", volume);

    container.classList.add("volume-container");

    views.forEach(function(axis_name) {
      var canvas;
      if(axis_name==="xspace"){

        canvas= document.getElementById("editbox");}
      else if(axis_name==="yspace"){

        canvas= document.getElementById("edit1box");}
      else{

        canvas= document.getElementById("edit2box");
      }
      canvas.width = default_panel_width;
      canvas.height = default_panel_height;
      // canvas.classList.add("slice-display");

      canvas.style.backgroundColor = "#000000";
      // container.appendChild(canvas);
      display.setPanel(
          axis_name,
          VolumeViewer.createPanel({
            volume: volume,
            volume_id: vol_id,
            axis: axis_name,
            canvas: canvas,
            image_center: {
              x: canvas.width / 2,
              y: canvas.height / 2
            }
          })
      );
    });

    if (template_options.element_id && template_options.viewer_insert_class) {
      template = getTemplate(container, vol_id, template_options.element_id, template_options.viewer_insert_class);

      if (typeof template_options.complete === "function") {
        template_options.complete(volume, template);
      }

      Array.prototype.forEach.call(template, function(node) {
        if (node.nodeType === 1) {
          // container.appendChild(node);
        }
      });
    }

    ///////////////////////////////////
    // Mouse Events
    ///////////////////////////////////

    (function() {
      var current_target = null;

      views.forEach(function(axis_name) {
        var panel = display.getPanel(axis_name);
        var canvas = panel.canvas;
        var last_touch_distance = null;
        function startDrag(pointer, shift_key, ctrl_key) {
          if (ctrl_key) {
            viewer.volumes.forEach(function(volume) {
              volume.display.forEach(function(panel) {
                panel.anchor = null;
              });
            });

            panel.anchor = {
              x: pointer.x,
              y: pointer.y
            };
          }

          if (!shift_key) {
            panel.updateVolumePosition(pointer.x, pointer.y);
            volume.display.forEach(function(other_panel) {
              if (panel !== other_panel) {
                other_panel.updateSlice();
              }
            });

            if (viewer.synced){
              viewer.syncPosition(panel, volume, axis_name);
            }
          }
          panel.updated = true;
        }

        function drag(pointer, shift_key) {
          var drag_delta;
          if(shift_key) {
            drag_delta = panel.followPointer(pointer);
            if (viewer.synced){
              viewer.volumes.forEach(function(synced_volume, synced_vol_id) {
                var synced_panel;
                if (synced_vol_id !== vol_id) {
                  synced_panel = synced_volume.display.getPanel(axis_name);
                  synced_panel.translateImage(drag_delta.dx, drag_delta.dy);
                }
              });
            }
          } else {
            panel.updateVolumePosition(pointer.x, pointer.y);
            volume.display.forEach(function(other_panel) {
              if (panel !== other_panel) {
                other_panel.updateSlice();
              }
            });

            if (viewer.synced){
              viewer.syncPosition(panel, volume, axis_name);
            }
          }
          panel.updated = true;
        }

        function mouseDrag(event) {
          if(event.target === current_target) {
            event.preventDefault();
            drag(panel.mouse, event.shiftKey);
          }
        }

        function touchDrag(event) {
          if(event.target === current_target) {
            event.preventDefault();
            drag(panel.touches[0], panel.touches.length === views.length);
          }
        }

        function mouseDragEnd() {
          document.removeEventListener("mousemove", mouseDrag, false);
          document.removeEventListener("mouseup", mouseDragEnd, false);
          viewer.volumes.forEach(function(volume) {
            volume.display.forEach(function(panel) {
              panel.anchor = null;
            });
          });
          current_target = null;
        }

        function touchDragEnd() {
          document.removeEventListener("touchmove", touchDrag, false);
          document.removeEventListener("touchend", touchDragEnd, false);
          viewer.volumes.forEach(function(volume) {
            volume.display.forEach(function(panel) {
              panel.anchor = null;
            });
          });
          current_target = null;
        }

        function touchZoom(event) {
          var dx = panel.touches[0].x - panel.touches[1].x;
          var dy = panel.touches[0].y - panel.touches[1].y;

          var distance = Math.sqrt(dx * dx + dy * dy);
          var delta;

          event.preventDefault();

          if (last_touch_distance !== null) {
            delta = distance - last_touch_distance;

            zoom(delta * 0.2);
          }

          last_touch_distance = distance;
        }

        function touchZoomEnd() {
          document.removeEventListener("touchmove", touchZoom, false);
          document.removeEventListener("touchend", touchZoomEnd, false);

          last_touch_distance = null;
        }

        canvas.addEventListener("mousedown", function(event) {
          event.preventDefault();

          current_target = event.target;

          if (viewer.active_panel) {
            viewer.active_panel.updated = true;
          }
          viewer.active_panel = panel;

          document.addEventListener("mousemove", mouseDrag , false);
          document.addEventListener("mouseup", mouseDragEnd, false);

          startDrag(panel.mouse, event.shiftKey, event.ctrlKey);
        }, false);

        canvas.addEventListener("touchstart", function(event) {
          event.preventDefault();

          current_target = event.target;

          if (viewer.active_panel) {
            viewer.active_panel.updated = true;
          }
          viewer.active_panel = panel;

          if (panel.touches.length === 2) {
            document.removeEventListener("touchmove", touchDrag, false);
            document.removeEventListener("touchend", touchDragEnd, false);
            document.addEventListener("touchmove", touchZoom, false);
            document.addEventListener("touchend", touchZoomEnd, false);
          } else {
            document.removeEventListener("touchmove", touchZoom, false);
            document.removeEventListener("touchend", touchZoomEnd, false);
            document.addEventListener("touchmove", touchDrag, false);
            document.addEventListener("touchend", touchDragEnd, false);

            startDrag(panel.touches[0], panel.touches.length === 3, true);
          }

        }, false);

        function wheelHandler(event) {
          event.preventDefault();

          zoom(Math.max(-1, Math.min(1, (event.wheelDelta || -event.detail))));
        }

        function zoom(delta) {
          panel.zoom *= (delta < 0) ? 1/1.05 : 1.05;
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

        canvas.addEventListener("mousewheel", wheelHandler, false);
        canvas.addEventListener("DOMMouseScroll", wheelHandler, false); // Dammit Firefox
      });
    })();
    viewer.containers[vol_id] = container;
    /* See if a subsequent volume has already been loaded. If so we want
     * to be sure that this container is inserted before the subsequent
     * container. This guarantees the ordering of elements.
     */
    var containers = viewer.containers;
    var next_id;
    for (next_id = vol_id + 1; next_id < containers.length; next_id++) {
      if (next_id in containers) {
        // dom_element.insertBefore(container, containers[next_id]);
        break;
      }
    }
    if (next_id === containers.length) {
      // dom_element.appendChild(container);
    }
    viewer.triggerEvent("volumeuiloaded", {
      container: container,
      volume: volume,
      volume_id: vol_id
    });

    return display;
  }
};
