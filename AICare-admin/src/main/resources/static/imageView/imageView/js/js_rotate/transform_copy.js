"use strict";

function updateImageOtherMat() {

    updateTransforms(Transform.mat);

    // Transform.mmMat[0][0] = volume.Ph[2];
    // Transform.mmMat[1][1] = -1 * volume.Ph[4];
    // Transform.mmMat[2][2] = -1 * volume.Ph[9];
    //
    // Transform.originMat[0][3] = Math.round(volume.Ph[14]);
    // Transform.originMat[1][1] = -1;
    // Transform.originMat[1][3] = Math.round(volume.Ph[13]);
    // Transform.originMat[2][2] = -1;
    // Transform.originMat[2][3] = Math.round(volume.Ph[12]);
    //
    // Transform.sizeMat[0][0] = volume.$c[0];
    // Transform.sizeMat[1][1] = Math.abs(volume.$c[1]);
    // Transform.sizeMat[2][2] = Math.abs(volume.$c[2]);
    //
    // Transform.sizeMatInverse[0][0] = volume.Ph[2];
    // Transform.sizeMatInverse[1][1] = -1 * volume.Ph[4];
    // Transform.sizeMatInverse[2][2] = -1 * volume.Ph[9];
    //
    // Transform.tempMat[0][3] = Math.round(volume.Ph[14]);
    // Transform.tempMat[1][1] = -1;
    // Transform.tempMat[1][3] = Math.round(volume.Ph[13]);
    // Transform.tempMat[2][2] = -1;
    // Transform.tempMat[2][3] = Math.round(volume.Ph[12]);
    //
    // Transform.worldMat[0][0] = volume.Ph[2];
    // Transform.worldMat[0][3] = Math.round(volume.Ph[14]);
    // Transform.worldMat[1][1] = volume.Ph[4];
    // Transform.worldMat[1][3] = Math.round(volume.Ph[13]);
    // Transform.worldMat[2][2] = volume.Ph[9];
    // Transform.worldMat[2][3] = Math.round(volume.Ph[12]);
}

function updateImageMat(centerX, centerY, centerZ, rotX, rotY, rotZ) {
    var theta, cosTheta, sinTheta, ctrOut, ctrIn;
    updateCenterMat(centerX, centerY, centerZ);


    theta = (rotX * Math.PI) / 180.0;
    cosTheta = Math.cos(theta);
    sinTheta = Math.sin(theta);
    Transform.rotMatX[1][1] = cosTheta;
    Transform.rotMatX[1][2] = sinTheta;
    Transform.rotMatX[2][1] = -1 * sinTheta;
    Transform.rotMatX[2][2] = cosTheta;

    theta = (rotY * Math.PI) / 180.0;
    cosTheta = Math.cos(theta);
    sinTheta = Math.sin(theta);
    Transform.rotMatY[0][0] = cosTheta;
    Transform.rotMatY[0][2] = -1 * sinTheta;
    Transform.rotMatY[2][0] = sinTheta;
    Transform.rotMatY[2][2] = cosTheta;

    theta = (rotZ * Math.PI) / 180.0;
    cosTheta = Math.cos(theta);
    sinTheta = Math.sin(theta);
    Transform.rotMatZ[0][0] = cosTheta;
    Transform.rotMatZ[0][1] = sinTheta;
    Transform.rotMatZ[1][0] = -1 * sinTheta;
    Transform.rotMatZ[1][1] = cosTheta;

    for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
        for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
            Transform.tempMat[ctrOut][ctrIn] =
                (Transform.rotMatX[ctrOut][0] * Transform.rotMatY[0][ctrIn]) +
                (Transform.rotMatX[ctrOut][1] * Transform.rotMatY[1][ctrIn]) +
                (Transform.rotMatX[ctrOut][2] * Transform.rotMatY[2][ctrIn]) +
                (Transform.rotMatX[ctrOut][3] * Transform.rotMatY[3][ctrIn]);
        }
    }

    for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
        for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
            Transform.rotMat[ctrOut][ctrIn] =
                (Transform.tempMat[ctrOut][0] * Transform.rotMatZ[0][ctrIn]) +
                (Transform.tempMat[ctrOut][1] * Transform.rotMatZ[1][ctrIn]) +
                (Transform.tempMat[ctrOut][2] * Transform.rotMatZ[2][ctrIn]) +
                (Transform.tempMat[ctrOut][3] * Transform.rotMatZ[3][ctrIn]);
        }
    }

    for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
        for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
            Transform.tempMat[ctrOut][ctrIn] =
                (Transform.sizeMatInverse[ctrOut][0] * Transform.centerMatInverse[0][ctrIn]) +
                (Transform.sizeMatInverse[ctrOut][1] * Transform.centerMatInverse[1][ctrIn]) +
                (Transform.sizeMatInverse[ctrOut][2] * Transform.centerMatInverse[2][ctrIn]) +
                (Transform.sizeMatInverse[ctrOut][3] * Transform.centerMatInverse[3][ctrIn]);
        }
    }

    for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
        for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
            Transform.tempMat2[ctrOut][ctrIn] =
                (Transform.tempMat[ctrOut][0] * Transform.rotMat[0][ctrIn]) +
                (Transform.tempMat[ctrOut][1] * Transform.rotMat[1][ctrIn]) +
                (Transform.tempMat[ctrOut][2] * Transform.rotMat[2][ctrIn]) +
                (Transform.tempMat[ctrOut][3] * Transform.rotMat[3][ctrIn]);
        }
    }

    for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
        for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
            Transform.tempMat[ctrOut][ctrIn] =
                (Transform.tempMat2[ctrOut][0] * Transform.centerMat[0][ctrIn]) +
                (Transform.tempMat2[ctrOut][1] * Transform.centerMat[1][ctrIn]) +
                (Transform.tempMat2[ctrOut][2] * Transform.centerMat[2][ctrIn]) +
                (Transform.tempMat2[ctrOut][3] * Transform.centerMat[3][ctrIn]);
        }
    }

    for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
        for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
            Transform.tempMat2[ctrOut][ctrIn] =
                (Transform.tempMat[ctrOut][0] * Transform.sizeMat[0][ctrIn]) +
                (Transform.tempMat[ctrOut][1] * Transform.sizeMat[1][ctrIn]) +
                (Transform.tempMat[ctrOut][2] * Transform.sizeMat[2][ctrIn]) +
                (Transform.tempMat[ctrOut][3] * Transform.sizeMat[3][ctrIn]);
        }
    }

    updateTransforms(Transform.tempMat2);
};

 function updateCenterMat(x, y, z) {
     Transform.centerMat[0][0] = 1;
     Transform.centerMat[1][1] = 1;
     Transform.centerMat[2][2] = 1;
     Transform.centerMat[3][3] = 1;
     Transform.centerMat[0][3] = -1 * x;
     Transform.centerMat[1][3] = -1 * y;
     Transform.centerMat[2][3] = -1 * z;

     Transform.centerMatInverse[0][0] = 1;
     Transform.centerMatInverse[1][1] = 1;
     Transform.centerMatInverse[2][2] = 1;
     Transform.centerMatInverse[3][3] = 1;
     Transform.centerMatInverse[0][3] = x;
     Transform.centerMatInverse[1][3] = y;
     Transform.centerMatInverse[2][3] = z;
};

function updateTransforms (mat) {
    updateMat(mat);
    updateSizeMat();
    updateOrientMat();
    updateOriginMat();
    updateIndexTransform();
    updateMmTransform();
    updateWorldMat();
};

 function updateMat (mat) {
    var ctrIn, ctrOut;

    for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
        for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
            Transform.mat[ctrOut][ctrIn] = mat[ctrOut][ctrIn];
        }
    }
};

 function updateSizeMat() {
     Transform.sizeMat[0][0] = viewer.volumes[0].header.xspace.step;
     Transform.sizeMat[1][1] = viewer.volumes[0].header.yspace.step;
     Transform.sizeMat[2][2] = viewer.volumes[0].header.zspace.step;
     Transform.sizeMat[3][3] = 1;

     Transform.sizeMatInverse[0][0] = 1 / viewer.volumes[0].header.xspace.step;
     Transform.sizeMatInverse[1][1] = 1 / viewer.volumes[0].header.yspace.step;
     Transform.sizeMatInverse[2][2] = 1 / viewer.volumes[0].header.zspace.step;
     Transform.sizeMatInverse[3][3] = 1;
};

 function updateOrientMat() {
     Transform.orientMat = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]];
};

 function updateOriginMat() {
     Transform.originMat[0][0] = 1;
     Transform.originMat[1][1] = -1;
     Transform.originMat[2][2] = -1;
     Transform.originMat[3][3] = 1;
     Transform.originMat[0][3] = Math.round(volume.Ph[14]);
     Transform.originMat[1][3] = Math.round(volume.Ph[12]);
     Transform.originMat[2][3] = Math.round(volume.Ph[13]);
};

 function updateIndexTransform() {
    var ctrOut, ctrIn;
    for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
        for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
            Transform.indexMat[ctrOut][ctrIn] = (Transform.orientMat[ctrOut][0] * Transform.mat[0][ctrIn]) +
                (Transform.orientMat[ctrOut][1] * Transform.mat[1][ctrIn]) +
                (Transform.orientMat[ctrOut][2] * Transform.mat[2][ctrIn]) +
                (Transform.orientMat[ctrOut][3] * Transform.mat[3][ctrIn]);
        }
    }
};

 function updateMmTransform() {
    var ctrOut, ctrIn;
    for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
        for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
            Transform.mmMat[ctrOut][ctrIn] = (Transform.indexMat[ctrOut][0] * Transform.sizeMatInverse[0][ctrIn]) +
                (Transform.indexMat[ctrOut][1] * Transform.sizeMatInverse[1][ctrIn]) +
                (Transform.indexMat[ctrOut][2] * Transform.sizeMatInverse[2][ctrIn]) +
                (Transform.indexMat[ctrOut][3] * Transform.sizeMatInverse[3][ctrIn]);
        }
    }
};

 function updateWorldMat() {
    var ctrOut, ctrIn, flipMat, originNiftiMat;

    if (Transform.worldMatNifti) {
        flipMat = [[ -1, 0, 0, viewer.volumes[0].header.xspace.step - 1 ], [ 0, 1, 0, 0 ], [ 0, 0, 1, 0 ], [ 0, 0, 0, 1 ]];

        originNiftiMat = [[1,0,0,0], [0,1,0,0], [0,0,1,0], [0,0,0,1]];
        originNiftiMat[0][0] = -1;
        originNiftiMat[1][1] = -1;
        originNiftiMat[2][2] = -1;
        originNiftiMat[3][3] = 1;
        originNiftiMat[0][3] = Math.round(volume.ph[14]);
        originNiftiMat[1][3] = Math.round(volume.ph[12]);
        originNiftiMat[2][3] = Math.round(volume.ph[13]);

        for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
            for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
                Transform.tempMat[ctrOut][ctrIn] = (Transform.sizeMat[ctrOut][0] * originNiftiMat[0][ctrIn]) +
                    (Transform.sizeMat[ctrOut][1] * originNiftiMat[1][ctrIn]) +
                    (Transform.sizeMat[ctrOut][2] * originNiftiMat[2][ctrIn]) +
                    (Transform.sizeMat[ctrOut][3] * originNiftiMat[3][ctrIn]);
            }
        }

        for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
            for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
                Transform.tempMat2[ctrOut][ctrIn] = (Transform.tempMat[ctrOut][0] * flipMat[0][ctrIn]) +
                    (Transform.tempMat[ctrOut][1] * flipMat[1][ctrIn]) +
                    (Transform.tempMat[ctrOut][2] * flipMat[2][ctrIn]) +
                    (Transform.tempMat[ctrOut][3] * flipMat[3][ctrIn]);
            }
        }

        for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
            for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
                Transform.tempMat[ctrOut][ctrIn] = (Transform.tempMat2[ctrOut][0] * this.mat[0][ctrIn]) +
                    (Transform.tempMat2[ctrOut][1] * Transform.mat[1][ctrIn]) +
                    (Transform.tempMat2[ctrOut][2] * Transform.mat[2][ctrIn]) +
                    (Transform.tempMat2[ctrOut][3] * Transform.mat[3][ctrIn]);
            }
        }

        for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
            for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
                Transform.tempMat2[ctrOut][ctrIn] = (Transform.tempMat[ctrOut][0] * flipMat[0][ctrIn]) +
                    (Transform.tempMat[ctrOut][1] * flipMat[1][ctrIn]) +
                    (Transform.tempMat[ctrOut][2] * flipMat[2][ctrIn]) +
                    (Transform.tempMat[ctrOut][3] * flipMat[3][ctrIn]);
            }
        }

        for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
            for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
                Transform.tempMat[ctrOut][ctrIn] = (Transform.tempMat2[ctrOut][0] * originNiftiMat[0][ctrIn]) +
                    (Transform.tempMat2[ctrOut][1] * originNiftiMat[1][ctrIn]) +
                    (Transform.tempMat2[ctrOut][2] * originNiftiMat[2][ctrIn]) +
                    (Transform.tempMat2[ctrOut][3] * originNiftiMat[3][ctrIn]);
            }
        }

        for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
            for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
                Transform.tempMat2[ctrOut][ctrIn] = (Transform.tempMat[ctrOut][0] * Transform.sizeMatInverse[0][ctrIn]) +
                    (Transform.tempMat[ctrOut][1] * Transform.sizeMatInverse[1][ctrIn]) +
                    (Transform.tempMat[ctrOut][2] * Transform.sizeMatInverse[2][ctrIn]) +
                    (Transform.tempMat[ctrOut][3] * Transform.sizeMatInverse[3][ctrIn]);
            }
        }

        for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
            for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
                Transform.worldMat[ctrOut][ctrIn] = (Transform.worldMatNifti[ctrOut][0] * Transform.tempMat2[0][ctrIn]) +
                    (Transform.worldMatNifti[ctrOut][1] * Transform.tempMat2[1][ctrIn]) +
                    (Transform.worldMatNifti[ctrOut][2] * Transform.tempMat2[2][ctrIn]) +
                    (Transform.worldMatNifti[ctrOut][3] * Transform.tempMat2[3][ctrIn]);
            }
        }
    } else {
        for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
            for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
                Transform.tempMat[ctrOut][ctrIn] = (Transform.indexMat[ctrOut][0] * Transform.originMat[0][ctrIn]) +
                    (Transform.indexMat[ctrOut][1] * Transform.originMat[1][ctrIn]) +
                    (Transform.indexMat[ctrOut][2] * Transform.originMat[2][ctrIn]) +
                    (Transform.indexMat[ctrOut][3] * Transform.originMat[3][ctrIn]);
            }
        }

        for (ctrOut = 0; ctrOut < 4; ctrOut += 1) {
            for (ctrIn = 0; ctrIn < 4; ctrIn += 1) {
                Transform.worldMat[ctrOut][ctrIn] = (Transform.tempMat[ctrOut][0] * Transform.sizeMatInverse[0][ctrIn]) +
                    (Transform.tempMat[ctrOut][1] * Transform.sizeMatInverse[1][ctrIn]) +
                    (Transform.tempMat[ctrOut][2] * Transform.sizeMatInverse[2][ctrIn]) +
                    (Transform.tempMat[ctrOut][3] * Transform.sizeMatInverse[3][ctrIn]);
            }
        }
    }
};