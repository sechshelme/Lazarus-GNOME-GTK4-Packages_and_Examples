/*
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
 */

#ifndef cglmc_sphere_h
#define cglmc_sphere_h
#ifdef __cplusplus
extern "C" {
#endif

#include "../cglm.h"

extern
float
glmc_sphere_radii(vec4 s);

extern
void
glmc_sphere_transform(vec4 s, mat4 m, vec4 dest);

extern
void
glmc_sphere_merge(vec4 s1, vec4 s2, vec4 dest);

extern
bool
glmc_sphere_sphere(vec4 s1, vec4 s2);

extern
bool
glmc_sphere_point(vec4 s, vec3 point);

#ifdef __cplusplus
}
#endif
#endif /* cglmc_sphere_h */
