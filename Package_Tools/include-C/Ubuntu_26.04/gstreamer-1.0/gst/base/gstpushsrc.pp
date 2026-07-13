
unit gstpushsrc;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstpushsrc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstpushsrc.h
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
PGstBuffer  = ^GstBuffer;
PGstPushSrc  = ^GstPushSrc;
PGstPushSrcClass  = ^GstPushSrcClass;
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

{ was #define dname def_expr }
function GST_TYPE_PUSH_SRC : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PUSH_SRC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PUSH_SRC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PUSH_SRC_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PUSH_SRC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PUSH_SRC_CLASS(klass : longint) : longint;

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


function gst_push_src_get_type:TGType;cdecl;external;
{////////G_DEFINE_AUTOPTR_CLEANUP_FUNC     (GstPushSrc, gst_object_unref) }
{$endif}
{ __GST_PUSH_SRC_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_PUSH_SRC : longint; { return type might be wrong }
  begin
    GST_TYPE_PUSH_SRC:=gst_push_src_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PUSH_SRC(obj : longint) : longint;
begin
  GST_PUSH_SRC:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PUSH_SRC,GstPushSrc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PUSH_SRC_CLASS(klass : longint) : longint;
begin
  GST_PUSH_SRC_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PUSH_SRC,GstPushSrcClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PUSH_SRC_GET_CLASS(obj : longint) : longint;
begin
  GST_PUSH_SRC_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_PUSH_SRC,GstPushSrcClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PUSH_SRC(obj : longint) : longint;
begin
  GST_IS_PUSH_SRC:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PUSH_SRC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PUSH_SRC_CLASS(klass : longint) : longint;
begin
  GST_IS_PUSH_SRC_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PUSH_SRC);
end;


end.
