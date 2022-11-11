"use strict";
let MenuItemSlider={
    'rotationX': 0.5,
    'rotationY': 0.5,
    'rotationZ': 0.5,
    'action': "action",
    'rotate': [0.5,0.5,0.5],
};

let Transform={
    'centerMat': [[1,0,0,0],
                  [0,1,0,0],
                  [0,0,1,0],
                  [0,0,0,1]],
    'centerMatInverse': [[1,0,0,0],
                         [0,1,0,0],
                         [0,0,1,0],
                         [0,0,0,1]],
    'rotMat': [[1,0,0,0],
                [0,1,0,0],
                [0,0,1,0],
                [0,0,0,1]],
    'rotMatX': [[1,0,0,0],
                [0,1,0,0],
                [0,0,1,0],
                [0,0,0,1]],
    'rotMatY': [[1,0,0,0],
                [0,1,0,0],
                [0,0,1,0],
                [0,0,0,1]],
    'rotMatZ': [[1,0,0,0],
                [0,1,0,0],
                [0,0,1,0],
                [0,0,0,1]],
    'tempMat': [[1,0,0,0],
                [0,1,0,0],
                [0,0,1,0],
                [0,0,0,1]],
    'sizeMatInverse':[[1,0,0,0],
                      [0,1,0,0],
                      [0,0,1,0],
                      [0,0,0,1]],
    'tempMat2': [[1,0,0,0],
                 [0,1,0,0],
                 [0,0,1,0],
                 [0,0,0,1]],
    'sizeMat':[[1,0,0,0],
                [0,1,0,0],
                [0,0,1,0],
                [0,0,0,1]],
    'mat': [[1,0,0,0],
            [0,1,0,0],
            [0,0,1,0],
            [0,0,0,1]],
    'orientMat':[[1,0,0,0],
                [0,1,0,0],
                [0,0,1,0],
                [0,0,0,1]],
    'originMat':[[1,0,0,0],
                [0,1,0,0],
                [0,0,1,0],
                [0,0,0,1]],
    'indexMat':[[1,0,0,0],
                [0,1,0,0],
                [0,0,1,0],
                [0,0,0,1]],
    'mmMat':[[1,0,0,0],
        [0,1,0,0],
        [0,0,1,0],
        [0,0,0,1]],
    'worldMatNifti':null,
    'worldMat':[[1,0,0,0],
        [0,1,0,0],
        [0,0,1,0],
        [0,0,0,1]],
};