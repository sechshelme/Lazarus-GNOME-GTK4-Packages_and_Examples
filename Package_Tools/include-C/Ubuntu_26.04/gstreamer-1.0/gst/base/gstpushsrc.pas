unit gstpushsrc;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *                    2005 Wim Taymans <wim@fluendo.com>
 *
 * gstpushsrc.h:
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
{$ifndef __GST_PUSH_SRC_H__}
{$define __GST_PUSH_SRC_H__}
{$include <gst/gst.h>}
{$include <gst/base/gstbasesrc.h>}

type
{*
 * GstPushSrc:
 *
 * The opaque #GstPushSrc data structure.
  }
{< private > }
  PGstPushSrc = ^TGstPushSrc;
  TGstPushSrc = record
      parent : TGstBaseSrc;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstPushSrcClass:
 * @parent_class: Element parent class
 * @create: Ask the subclass to create a buffer. The subclass decides which
 *          size this buffer should be. Other then that, refer to
 *          #GstBaseSrc<!-- -->.create() for more details. If this method is
 *          not implemented, @alloc followed by @fill will be called.
 * @alloc: Ask the subclass to allocate a buffer. The subclass decides which
 *         size this buffer should be. The default implementation will create
 *         a new buffer from the negotiated allocator.
 * @fill: Ask the subclass to fill the buffer with data.
 *
 * Subclasses can override any of the available virtual methods or not, as
 * needed. At the minimum, the @fill method should be overridden to produce
 * buffers.
  }
{*
   * GstPushSrcClass::create:
   * @buf: (inout) (nullable):
   *
   * Ask the subclass to create a buffer, the default implementation will call alloc if
   * no allocated @buf is provided and then call fill.
    }
{*
   * GstPushSrcClass::alloc:
   * @buf: (out) (nullable):
   *
   * Allocate memory for a buffer.
    }
{ ask the subclass to fill a buffer  }
{< private > }
  PGstPushSrcClass = ^TGstPushSrcClass;
  TGstPushSrcClass = record
      parent_class : TGstBaseSrcClass;
      create : function (src:PGstPushSrc; buf:PPGstBuffer):TGstFlowReturn;cdecl;
      alloc : function (src:PGstPushSrc; buf:PPGstBuffer):TGstFlowReturn;cdecl;
      fill : function (src:PGstPushSrc; buf:PGstBuffer):TGstFlowReturn;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_push_src_get_type:TGType;cdecl;external libgstbase;
{////////G_DEFINE_AUTOPTR_CLEANUP_FUNC     (GstPushSrc, gst_object_unref) }
{$endif}
{ __GST_PUSH_SRC_H__  }

// === Konventiert am: 13-7-26 19:20:29 ===

function GST_TYPE_PUSH_SRC : TGType;
function GST_PUSH_SRC(obj : Pointer) : PGstPushSrc;
function GST_PUSH_SRC_CLASS(klass : Pointer) : PGstPushSrcClass;
function GST_PUSH_SRC_GET_CLASS(obj : Pointer) : Tgboolean;
function GST_IS_PUSH_SRC(obj : Tgboolean) : longint;
function GST_IS_PUSH_SRC_CLASS(klass : PGstPushSrcClass) : longint;

implementation

function GST_TYPE_PUSH_SRC : TGType;
  begin
    GST_TYPE_PUSH_SRC:=gst_push_src_get_type;
  end;

function GST_PUSH_SRC(obj : Pointer) : PGstPushSrc;
begin
  Result := PGstPushSrc(g_type_check_instance_cast(obj, GST_TYPE_PUSH_SRC));
end;

function GST_PUSH_SRC_CLASS(klass : Pointer) : PGstPushSrcClass;
begin
  Result := PGstPushSrcClass(g_type_check_class_cast(klass, GST_TYPE_PUSH_SRC));
end;

function GST_PUSH_SRC_GET_CLASS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_PUSH_SRC);
end;

function GST_IS_PUSH_SRC(obj : Tgboolean) : longint;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_PUSH_SRC);
end;

function GST_IS_PUSH_SRC_CLASS(klass : PGstPushSrcClass) : longint;
begin
  Result := PGstPushSrcClass(PGTypeInstance(obj)^.g_class);
end;



end.
