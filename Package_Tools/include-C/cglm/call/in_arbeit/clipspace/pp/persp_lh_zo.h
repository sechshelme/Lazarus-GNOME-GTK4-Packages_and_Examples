/*
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
 */

#ifndef cglmc_persp_lh_zo_h
#define cglmc_persp_lh_zo_h
#ifdef __cplusplus
extern "C" {
#endif

#include "../../cglm.h"

extern
void
glmc_frustum_lh_zo(float left,    float right,
                   float bottom,  float top,
                   float nearZ,   float farZ,
                   mat4  dest);

extern
void
glmc_perspective_lh_zo(float fovy,
                       float aspect,
                       float nearVal,
                       float farVal,
                       mat4 dest);

extern
void
glmc_persp_move_far_lh_zo(mat4 proj, float deltaFar);

extern
void
glmc_persp_decomp_lh_zo(mat4 proj,
                        float * __restrict nearZ, float * __restrict farZ,
                        float * __restrict top,   float * __restrict bottom,
                        float * __restrict left,  float * __restrict right);

extern
void
glmc_persp_decompv_lh_zo(mat4 proj, float dest[6]);

extern
void
glmc_persp_decomp_x_lh_zo(mat4 proj,
                          float * __restrict left,
                          float * __restrict right);

extern
void
glmc_persp_decomp_y_lh_zo(mat4 proj,
                          float * __restrict top,
                          float * __restrict bottom);

extern
void
glmc_persp_decomp_z_lh_zo(mat4 proj,
                          float * __restrict nearZ,
                          float * __restrict farZ);

extern
void
glmc_persp_decomp_far_lh_zo(mat4 proj, float * __restrict farZ);

extern
void
glmc_persp_decomp_near_lh_zo(mat4 proj, float * __restrict nearZ);

extern
void
glmc_persp_sizes_lh_zo(mat4 proj, float fovy, vec4 dest);

extern
float
glmc_persp_fovy_lh_zo(mat4 proj);

extern
float
glmc_persp_aspect_lh_zo(mat4 proj);

#ifdef __cplusplus
}
#endif
#endif /* cglmc_persp_lh_zo_h */
