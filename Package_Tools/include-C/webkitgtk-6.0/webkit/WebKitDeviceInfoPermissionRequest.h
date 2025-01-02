/*
 * Copyright (C) 2018 Igalia S.L
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 2 of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

#if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <webkit/webkit.h> can be included directly."
#endif

#ifndef WebKitDeviceInfoPermissionRequest_h
#define WebKitDeviceInfoPermissionRequest_h

#include <glib-object.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_DEVICE_INFO_PERMISSION_REQUEST            (webkit_device_info_permission_request_get_type())

WEBKIT_DECLARE_FINAL_TYPE (WebKitDeviceInfoPermissionRequest, webkit_device_info_permission_request, WEBKIT, DEVICE_INFO_PERMISSION_REQUEST, GObject)



#endif
