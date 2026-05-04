/*
 * Copyright © 2013 Intel Corporation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */

/** @file gl.h
 *
 * Provides an implementation of a GL dispatch layer using either
 * global function pointers or a hidden vtable.
 *
 * You should include `<epoxy/gl.h>` instead of `<GL/gl.h>` and `<GL/glext.h>`.
 */

#ifndef EPOXY_GL_H
#define EPOXY_GL_H

#include "epoxy/common.h"

#if defined(__gl_h_) || defined(__glext_h_)
#error epoxy/gl.h must be included before (or in place of) GL/gl.h
#else
#define __gl_h_
#define __glext_h_
#endif

#define KHRONOS_SUPPORT_INT64   1
#define KHRONOS_SUPPORT_FLOAT   1
#define KHRONOS_APIATTRIBUTES



#include "epoxy/gl_generated.h"

extern bool epoxy_has_gl_extension(const char *extension);
extern bool epoxy_is_desktop_gl(void);
extern int epoxy_gl_version(void);
extern int epoxy_glsl_version(void);

/*
 * the type of the stub function that the failure handler must return;
 * this function will be called on subsequent calls to the same bogus
 * function name
 */
typedef void (*epoxy_resolver_stub_t)(void);

/* the type of the failure handler itself */
typedef epoxy_resolver_stub_t
(*epoxy_resolver_failure_handler_t)(const char *name);

extern epoxy_resolver_failure_handler_t
epoxy_set_resolver_failure_handler(epoxy_resolver_failure_handler_t handler);


#endif /* EPOXY_GL_H */
