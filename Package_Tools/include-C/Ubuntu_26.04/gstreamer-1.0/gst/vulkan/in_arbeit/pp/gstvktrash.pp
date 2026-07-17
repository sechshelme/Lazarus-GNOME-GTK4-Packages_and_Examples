
unit gstvktrash;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvktrash.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvktrash.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PGstVulkanDevice  = ^GstVulkanDevice;
PGstVulkanFence  = ^GstVulkanFence;
PGstVulkanTrash  = ^GstVulkanTrash;
PGstVulkanTrashList  = ^GstVulkanTrashList;
PGstVulkanTrashListClass  = ^GstVulkanTrashListClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2016 Matthew Waters <matthew@centricular.com>
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
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_VULKAN_TRASH_H__}
{$define __GST_VULKAN_TRASH_H__}
{$include <gst/vulkan/vulkan.h>}
{*
 * GstVulkanTrashNotify:
 * @device: the #GstVulkanDevice
 * @user_data: user data
 *
 * Since: 1.18
  }
type

  TGstVulkanTrashNotify = procedure (device:PGstVulkanDevice; user_data:Tgpointer);cdecl;
{*
 * GstVulkanTrash:
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanTrash = ^TGstVulkanTrash;
  TGstVulkanTrash = record
      parent : TGstMiniObject;cdecl;
      cache : PGstVulkanTrashList;
      fence : PGstVulkanFence;
      notify : TGstVulkanTrashNotify;
      user_data : Tgpointer;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GST_TYPE_VULKAN_TRASH:
 *
 * Since: 1.18
  }

{ was #define dname def_expr }
function GST_TYPE_VULKAN_TRASH : longint; { return type might be wrong }

function gst_vulkan_trash_get_type:TGType;cdecl;external;
{*xxxxxxxxxx
static inline GstVulkanTrash* gst_vulkan_trash_ref(GstVulkanTrash* trash);
static inline GstVulkanTrash *
gst_vulkan_trash_ref (GstVulkanTrash * trash)

  return (GstVulkanTrash *) gst_mini_object_ref (GST_MINI_OBJECT_CAST (trash));


static inline void gst_vulkan_trash_unref(GstVulkanTrash* trash);
static inline void
gst_vulkan_trash_unref (GstVulkanTrash * trash)

  gst_mini_object_unref (GST_MINI_OBJECT_CAST (trash));

  }
{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC         (GstVulkanTrash, gst_vulkan_trash_unref) }
function gst_vulkan_trash_new(fence:PGstVulkanFence; notify:TGstVulkanTrashNotify; user_data:Tgpointer):PGstVulkanTrash;cdecl;external;
procedure gst_vulkan_trash_mini_object_unref(device:PGstVulkanDevice; user_data:Tgpointer);cdecl;external;
procedure gst_vulkan_trash_object_unref(device:PGstVulkanDevice; user_data:Tgpointer);cdecl;external;
function gst_vulkan_trash_new_free_semaphore(fence:PGstVulkanFence; semaphore:TVkSemaphore):PGstVulkanTrash;cdecl;external;
{*xxxxxxxxxxx
static inline GstVulkanTrash *
gst_vulkan_trash_new_object_unref (GstVulkanFence * fence, GstObject * object)

  g_return_val_if_fail (GST_IS_OBJECT (object), NULL);
  return gst_vulkan_trash_new (fence,
      (GstVulkanTrashNotify) gst_vulkan_trash_object_unref, (gpointer) object);


static inline GstVulkanTrash *
gst_vulkan_trash_new_mini_object_unref (GstVulkanFence * fence, GstMiniObject * object)

  return gst_vulkan_trash_new (fence,
      (GstVulkanTrashNotify) gst_vulkan_trash_mini_object_unref, (gpointer) object);

  }
function gst_vulkan_trash_list_get_type:TGType;cdecl;external;
{*
 * GST_TYPE_VULKAN_TRASH_LIST:
 *
 * Since: 1.18
  }
{ was #define dname def_expr }
function GST_TYPE_VULKAN_TRASH_LIST : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_TRASH_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_TRASH_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_TRASH_LIST_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_TRASH_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_TRASH_LIST_CLASS(klass : longint) : longint;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC         (GstVulkanTrashList, gst_object_unref) }
{*
 * GstVulkanTrashList:
 * @parent: the parent #GstVulkanHandle
 *
 * Since: 1.18
  }
{ <private>  }
type
  PGstVulkanTrashList = ^TGstVulkanTrashList;
  TGstVulkanTrashList = record
      parent : TGstVulkanHandlePool;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanTrashListGC:
 * @trash_list: the #GstVulkanTrashList instance
 *
 * Remove any memory allocated by any signalled objects.
 *
 * Since: 1.18
  }

  TGstVulkanTrashListGC = procedure (trash_list:PGstVulkanTrashList);cdecl;
{*
 * GstVulkanTrashListAdd:
 * @trash_list: the #GstVulkanTrashList instance
 * @trash: the #GstVulkanTrash to add to @trash_list
 *
 * Add @trash to @trash_list for tracking
 *
 * Returns: whether @trash could be added to @trash_list
 *
 * Since: 1.18
  }

  TGstVulkanTrashListAdd = function (trash_list:PGstVulkanTrashList; trash:PGstVulkanTrash):Tgboolean;cdecl;
{*
 * GstVulkanTrashListWait:
 * @trash_list: the #GstVulkanTrashList instance
 * @timeout: the timeout in ns to wait
 *
 * Wait for a most @timeout to pass for all #GstVulkanTrash objects to be
 * signalled and freed.
 *
 * Returns: whether all objects were signalled and freed within the @timeout
 *
 * Since: 1.18
  }

  TGstVulkanTrashListWait = function (trash_list:PGstVulkanTrashList; timeout:Tguint64):Tgboolean;cdecl;
{*
 * GstVulkanTrashListClass:
 * @parent_class: the #GstVulkanHandlePoolClass
 * @add_func: the #GstVulkanTrashListAdd functions
 * @gc_func: the #GstVulkanTrashListGC function
 * @wait_func: the #GstVulkanTrashListWait function
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanTrashListClass = ^TGstVulkanTrashListClass;
  TGstVulkanTrashListClass = record
      parent_class : TGstVulkanHandlePoolClass;cdecl;
      add_func : TGstVulkanTrashListAdd;
      gc_func : TGstVulkanTrashListGC;
      wait_func : TGstVulkanTrashListWait;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


procedure gst_vulkan_trash_list_gc(trash_list:PGstVulkanTrashList);cdecl;external;
function gst_vulkan_trash_list_wait(trash_list:PGstVulkanTrashList; timeout:Tguint64):Tgboolean;cdecl;external;
function gst_vulkan_trash_list_add(trash_list:PGstVulkanTrashList; trash:PGstVulkanTrash):Tgboolean;cdecl;external;
function gst_vulkan_trash_list_acquire(trash_list:PGstVulkanTrashList; fence:PGstVulkanFence; notify:TGstVulkanTrashNotify; user_data:Tgpointer):PGstVulkanTrash;cdecl;external;
{*
 * GstVulkanTrashFenceList:
 *
 * Since: 1.18
  }
{*
 * GstVulkanTrashFenceListClass:
 *
 * Since: 1.18
  }
{G_DECLARE_FINAL_TYPE (GstVulkanTrashFenceList, gst_vulkan_trash_fence_list, GST, VULKAN_TRASH_FENCE_LIST, GstVulkanTrashList); }
function gst_vulkan_trash_fence_list_new:PGstVulkanTrashList;cdecl;external;
{$endif}
{ __GST_VULKAN_TRASH_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_TRASH : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_TRASH:=gst_vulkan_trash_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_VULKAN_TRASH_LIST : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_TRASH_LIST:=gst_vulkan_trash_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_TRASH_LIST(obj : longint) : longint;
begin
  GST_VULKAN_TRASH_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VULKAN_TRASH_LIST,GstVulkanTrashList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_TRASH_LIST_CLASS(klass : longint) : longint;
begin
  GST_VULKAN_TRASH_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VULKAN_TRASH_LIST,GstVulkanTrashListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_TRASH_LIST_GET_CLASS(obj : longint) : longint;
begin
  GST_VULKAN_TRASH_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VULKAN_TRASH_LIST,GstVulkanTrashListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_TRASH_LIST(obj : longint) : longint;
begin
  GST_IS_VULKAN_TRASH_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VULKAN_TRASH_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_TRASH_LIST_CLASS(klass : longint) : longint;
begin
  GST_IS_VULKAN_TRASH_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VULKAN_TRASH_LIST);
end;


end.
