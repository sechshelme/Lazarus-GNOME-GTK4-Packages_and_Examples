/*
 * Copyright © 2011 Ryan Lortie
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
 */

#ifndef __G_ATOMIC_H__
#define __G_ATOMIC_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gtypes.h>
#include <glib/glib-typeof.h>



extern
gint                    g_atomic_int_get                      (const  gint *atomic);
extern
void                    g_atomic_int_set                      ( gint  *atomic,
                                                               gint            newval);
extern
void                    g_atomic_int_inc                      ( gint  *atomic);
extern
gboolean                g_atomic_int_dec_and_test             ( gint  *atomic);
extern
gboolean                g_atomic_int_compare_and_exchange     ( gint  *atomic,
                                                               gint            oldval,
                                                               gint            newval);
extern
gboolean                g_atomic_int_compare_and_exchange_full (gint         *atomic,
                                                                gint          oldval,
                                                                gint          newval,
                                                                gint         *preval);
extern
gint                    g_atomic_int_exchange                 (gint           *atomic,
                                                               gint            newval);
extern
gint                    g_atomic_int_add                      ( gint  *atomic,
                                                               gint            val);
extern
guint                   g_atomic_int_and                      ( guint *atomic,
                                                               guint           val);
extern
guint                   g_atomic_int_or                       ( guint *atomic,
                                                               guint           val);
extern
guint                   g_atomic_int_xor                      ( guint *atomic,
                                                               guint           val);

extern
gpointer                g_atomic_pointer_get                  (const  void *atomic);
extern
void                    g_atomic_pointer_set                  ( void  *atomic,
                                                               gpointer        newval);
extern
gboolean                g_atomic_pointer_compare_and_exchange ( void  *atomic,
                                                               gpointer        oldval,
                                                               gpointer        newval);
extern
gboolean                g_atomic_pointer_compare_and_exchange_full (void     *atomic,
                                                                    gpointer  oldval,
                                                                    gpointer  newval,
                                                                    void     *preval);
extern
gpointer                g_atomic_pointer_exchange             (void           *atomic,
                                                               gpointer        newval);
extern
gintptr                 g_atomic_pointer_add                  ( void  *atomic,
                                                               gssize          val);
extern
guintptr                g_atomic_pointer_and                  ( void  *atomic,
                                                               gsize           val);
extern
guintptr                g_atomic_pointer_or                   ( void  *atomic,
                                                               gsize           val);
extern
guintptr                g_atomic_pointer_xor                  ( void  *atomic,
                                                               gsize           val);

extern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_30_FOR(g_atomic_int_add)
gint                    g_atomic_int_exchange_and_add         ( gint  *atomic,
                                                               gint            val);




