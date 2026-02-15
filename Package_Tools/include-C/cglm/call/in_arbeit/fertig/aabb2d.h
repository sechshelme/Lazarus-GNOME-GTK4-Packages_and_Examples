/*
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
 */

#ifndef cglmc_aabb2d_h
#define cglmc_aabb2d_h
#ifdef __cplusplus
extern "C" {
#endif

#include "../cglm.h"

extern
void
glmc_aabb2d_copy(vec2 aabb[2], vec2 dest[2]);

extern
void
glmc_aabb2d_transform(vec2 aabb[2], mat3 m, vec2 dest[2]);

extern
void
glmc_aabb2d_merge(vec2 aabb1[2], vec2 aabb2[2], vec2 dest[2]);

extern
void
glmc_aabb2d_crop(vec2 aabb[2], vec2 cropAabb[2], vec2 dest[2]);

extern
void
glmc_aabb2d_crop_until(vec2 aabb[2],
                     vec2 cropAabb[2],
                     vec2 clampAabb[2],
                     vec2 dest[2]);

extern
void
glmc_aabb2d_invalidate(vec2 aabb[2]);

extern
bool
glmc_aabb2d_isvalid(vec2 aabb[2]);

extern
float
glmc_aabb2d_size(vec2 aabb[2]);

extern
float
glmc_aabb2d_radius(vec2 aabb[2]);

extern
void
glmc_aabb2d_center(vec2 aabb[2], vec2 dest);

extern
bool
glmc_aabb2d_aabb(vec2 aabb[2], vec2 other[2]);

extern
bool
glmc_aabb2d_point(vec2 aabb[2], vec2 point);

extern
bool
glmc_aabb2d_contains(vec2 aabb[2], vec2 other[2]);

extern
bool
glmc_aabb2d_circle(vec2 aabb[2], vec3 s);

#ifdef __cplusplus
}
#endif
#endif /* cglmc_aabb2d_h */


