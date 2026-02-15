/*
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
 */

#ifndef cglmc_mat4x2_h
#define cglmc_mat4x2_h
#ifdef __cplusplus
extern "C" {
#endif

#include "../cglm.h"

extern
void
glmc_mat4x2_copy(mat4x2 mat, mat4x2 dest);

extern
void
glmc_mat4x2_zero(mat4x2 mat);

extern
void
glmc_mat4x2_make(float *  src, mat4x2 dest);

extern
void
glmc_mat4x2_mul(mat4x2 m1, mat2x4 m2, mat4 dest);

extern
void
glmc_mat4x2_mulv(mat4x2 m, vec2 v, vec4 dest);

extern
void
glmc_mat4x2_transpose(mat4x2 m, mat2x4 dest);

extern
void
glmc_mat4x2_scale(mat4x2 m, float s);

#ifdef __cplusplus
}
#endif
#endif /* cglmc_mat4x2_h */
