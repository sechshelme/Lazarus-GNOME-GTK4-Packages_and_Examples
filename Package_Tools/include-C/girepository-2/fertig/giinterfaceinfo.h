/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Interface
 *
 * Copyright (C) 2005 Matthias Clasen
 * Copyright (C) 2008,2009 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#pragma once

#if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)
#error "Only <girepository.h> can be included directly."
#endif

#include <girepository/gitypes.h>


#define GI_TYPE_INTERFACE_INFO (gi_interface_info_get_type ())

/**
 * GI_INTERFACE_INFO:
 * @info: Info object which is subject to casting.
 *
 * Casts a [type@GIRepository.InterfaceInfo] or derived pointer into a
 * `(GIInterfaceInfo*)` pointer.
 *
 * Depending on the current debugging level, this function may invoke
 * certain runtime checks to identify invalid casts.
 *
 * Since: 2.80
 */
#define GI_INTERFACE_INFO(info) (G_TYPE_CHECK_INSTANCE_CAST ((info), GI_TYPE_INTERFACE_INFO, GIInterfaceInfo))

/**
 * GI_IS_INTERFACE_INFO:
 * @info: an info structure
 *
 * Checks if @info is a [class@GIRepository.InterfaceInfo] (or a derived type).
 *
 * Since: 2.80
 */
#define GI_IS_INTERFACE_INFO(info) (G_TYPE_CHECK_INSTANCE_TYPE ((info), GI_TYPE_INTERFACE_INFO))


extern
unsigned int     gi_interface_info_get_n_prerequisites (GIInterfaceInfo *info);

extern
GIBaseInfo *     gi_interface_info_get_prerequisite    (GIInterfaceInfo *info,
                                                        unsigned int     n);

extern
unsigned int     gi_interface_info_get_n_properties    (GIInterfaceInfo *info);

extern
GIPropertyInfo * gi_interface_info_get_property        (GIInterfaceInfo *info,
                                                        unsigned int     n);

extern
unsigned int     gi_interface_info_get_n_methods       (GIInterfaceInfo *info);

extern
GIFunctionInfo * gi_interface_info_get_method          (GIInterfaceInfo *info,
                                                        unsigned int     n);

extern
GIFunctionInfo * gi_interface_info_find_method         (GIInterfaceInfo *info,
                                                        const char      *name);

extern
unsigned int     gi_interface_info_get_n_signals       (GIInterfaceInfo *info);

extern
GISignalInfo *   gi_interface_info_get_signal          (GIInterfaceInfo *info,
                                                        unsigned int     n);

extern
GISignalInfo *   gi_interface_info_find_signal         (GIInterfaceInfo *info,
                                                        const char      *name);

extern
unsigned int     gi_interface_info_get_n_vfuncs        (GIInterfaceInfo *info);

extern
GIVFuncInfo *    gi_interface_info_get_vfunc           (GIInterfaceInfo *info,
                                                        unsigned int     n);

extern
GIVFuncInfo *    gi_interface_info_find_vfunc          (GIInterfaceInfo *info,
                                                        const char      *name);

extern
unsigned int     gi_interface_info_get_n_constants     (GIInterfaceInfo *info);

extern
GIConstantInfo * gi_interface_info_get_constant        (GIInterfaceInfo *info,
                                                        unsigned int     n);


extern
GIStructInfo *   gi_interface_info_get_iface_struct    (GIInterfaceInfo *info);


