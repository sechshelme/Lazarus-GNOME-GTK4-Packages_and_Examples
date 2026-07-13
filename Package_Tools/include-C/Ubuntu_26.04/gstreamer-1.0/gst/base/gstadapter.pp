
unit gstadapter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstadapter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstadapter.h
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
PGBytes  = ^GBytes;
PGList  = ^GList;
PGstAdapter  = ^GstAdapter;
PGstBuffer  = ^GstBuffer;
PGstBufferList  = ^GstBufferList;
Pguint32  = ^guint32;
Pguint64  = ^guint64;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2004 Benjamin Otte <otte@gnome.org>
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
{$include <gst/gst.h>}
{$ifndef __GST_ADAPTER_H__}
{$define __GST_ADAPTER_H__}
{$include <gst/base/base-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_ADAPTER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ADAPTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ADAPTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ADAPTER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ADAPTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ADAPTER_CLASS(klass : longint) : longint;

{*
 * GstAdapter:
 *
 * The opaque #GstAdapter data structure.
  }
type

function gst_adapter_get_type:TGType;cdecl;external;
function gst_adapter_new:PGstAdapter;cdecl;external;
procedure gst_adapter_clear(adapter:PGstAdapter);cdecl;external;
procedure gst_adapter_push(adapter:PGstAdapter; buf:PGstBuffer);cdecl;external;
function gst_adapter_map(adapter:PGstAdapter; size:Tgsize):Tgconstpointer;cdecl;external;
procedure gst_adapter_unmap(adapter:PGstAdapter);cdecl;external;
procedure gst_adapter_copy(adapter:PGstAdapter; dest:Tgpointer; offset:Tgsize; size:Tgsize);cdecl;external;
function gst_adapter_copy_bytes(adapter:PGstAdapter; offset:Tgsize; size:Tgsize):PGBytes;cdecl;external;
procedure gst_adapter_flush(adapter:PGstAdapter; flush:Tgsize);cdecl;external;
function gst_adapter_take(adapter:PGstAdapter; nbytes:Tgsize):Tgpointer;cdecl;external;
function gst_adapter_take_buffer(adapter:PGstAdapter; nbytes:Tgsize):PGstBuffer;cdecl;external;
function gst_adapter_take_list(adapter:PGstAdapter; nbytes:Tgsize):PGList;cdecl;external;
function gst_adapter_take_buffer_fast(adapter:PGstAdapter; nbytes:Tgsize):PGstBuffer;cdecl;external;
function gst_adapter_take_buffer_list(adapter:PGstAdapter; nbytes:Tgsize):PGstBufferList;cdecl;external;
function gst_adapter_get_buffer(adapter:PGstAdapter; nbytes:Tgsize):PGstBuffer;cdecl;external;
function gst_adapter_get_list(adapter:PGstAdapter; nbytes:Tgsize):PGList;cdecl;external;
function gst_adapter_get_buffer_fast(adapter:PGstAdapter; nbytes:Tgsize):PGstBuffer;cdecl;external;
function gst_adapter_get_buffer_list(adapter:PGstAdapter; nbytes:Tgsize):PGstBufferList;cdecl;external;
function gst_adapter_available(adapter:PGstAdapter):Tgsize;cdecl;external;
function gst_adapter_available_fast(adapter:PGstAdapter):Tgsize;cdecl;external;
function gst_adapter_prev_pts(adapter:PGstAdapter; distance:Pguint64):TGstClockTime;cdecl;external;
function gst_adapter_prev_dts(adapter:PGstAdapter; distance:Pguint64):TGstClockTime;cdecl;external;
function gst_adapter_prev_pts_at_offset(adapter:PGstAdapter; offset:Tgsize; distance:Pguint64):TGstClockTime;cdecl;external;
function gst_adapter_prev_dts_at_offset(adapter:PGstAdapter; offset:Tgsize; distance:Pguint64):TGstClockTime;cdecl;external;
function gst_adapter_prev_offset(adapter:PGstAdapter; distance:Pguint64):Tguint64;cdecl;external;
function gst_adapter_pts_at_discont(adapter:PGstAdapter):TGstClockTime;cdecl;external;
function gst_adapter_dts_at_discont(adapter:PGstAdapter):TGstClockTime;cdecl;external;
function gst_adapter_offset_at_discont(adapter:PGstAdapter):Tguint64;cdecl;external;
function gst_adapter_distance_from_discont(adapter:PGstAdapter):Tguint64;cdecl;external;
function gst_adapter_masked_scan_uint32(adapter:PGstAdapter; mask:Tguint32; pattern:Tguint32; offset:Tgsize; size:Tgsize):Tgssize;cdecl;external;
function gst_adapter_masked_scan_uint32_peek(adapter:PGstAdapter; mask:Tguint32; pattern:Tguint32; offset:Tgsize; size:Tgsize; 
           value:Pguint32):Tgssize;cdecl;external;
{////////G_DEFINE_AUTOPTR_CLEANUP_FUNC     (GstAdapter, gst_object_unref) }
{$endif}
{ __GST_ADAPTER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_ADAPTER : longint; { return type might be wrong }
  begin
    GST_TYPE_ADAPTER:=gst_adapter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ADAPTER(obj : longint) : longint;
begin
  GST_ADAPTER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_ADAPTER,GstAdapter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ADAPTER_CLASS(klass : longint) : longint;
begin
  GST_ADAPTER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_ADAPTER,GstAdapterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ADAPTER_GET_CLASS(obj : longint) : longint;
begin
  GST_ADAPTER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_ADAPTER,GstAdapterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ADAPTER(obj : longint) : longint;
begin
  GST_IS_ADAPTER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_ADAPTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ADAPTER_CLASS(klass : longint) : longint;
begin
  GST_IS_ADAPTER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_ADAPTER);
end;


end.
