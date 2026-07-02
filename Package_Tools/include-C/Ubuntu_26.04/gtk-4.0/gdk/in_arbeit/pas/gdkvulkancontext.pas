unit gdkvulkancontext;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 *
 * gdkvulkancontext.h:  specific Vulkan wrappers
 *
 * Copyright © 2016  Benjamin Otte
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

{ was #define dname def_expr }
function GDK_VULKAN_ERROR : longint; { return type might be wrong }

function gdk_vulkan_error_quark:TGQuark;cdecl;external libgtk4;
function gdk_vulkan_context_get_type:TGType;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkVulkanContext, g_object_unref) }

// === Konventiert am: 2-7-26 19:29:09 ===

function GDK_TYPE_VULKAN_CONTEXT : TGType;
function GDK_VULKAN_CONTEXT(obj : Pointer) : PGdkVulkanContext;
function GDK_IS_VULKAN_CONTEXT(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_VULKAN_CONTEXT : TGType;
  begin
    GDK_TYPE_VULKAN_CONTEXT:=gdk_vulkan_context_get_type;
  end;

function GDK_VULKAN_CONTEXT(obj : Pointer) : PGdkVulkanContext;
begin
  Result := PGdkVulkanContext(g_type_check_instance_cast(obj, GDK_TYPE_VULKAN_CONTEXT));
end;

function GDK_IS_VULKAN_CONTEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_VULKAN_CONTEXT);
end;


{ was #define dname def_expr }
function GDK_VULKAN_ERROR : longint; { return type might be wrong }
  begin
    GDK_VULKAN_ERROR:=gdk_vulkan_error_quark;
  end;


end.
