/*
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
 */

#ifndef cglmc_mat3x2_h
#define cglmc_mat3x2_h
#ifdef __cplusplus
extern "C" {
#endif

#include "../cglm.h"

extern
void
glmc_mat3x2_copy(mat3x2 mat, mat3x2 dest);

extern
void
glmc_mat3x2_zero(mat3x2 mat);

extern
void
glmc_mat3x2_make(float *  src, mat3x2 dest);

extern
void
glmc_mat3x2_mul(mat3x2 m1, mat2x3 m2, mat3 dest);

extern
void
glmc_mat3x2_mulv(mat3x2 m, vec2 v, vec3 dest);

extern
void
glmc_mat3x2_transpose(mat3x2 m, mat2x3 dest);

extern
void
glmc_mat3x2_scale(mat3x2 m, float s);

#ifdef __cplusplus
}
#endif
#endif /* cglmc_mat3x2_h */
