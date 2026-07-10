
unit gstbufferlist;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstbufferlist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstbufferlist.h
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
PGstBufferList  = ^GstBufferList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2009 Axis Communications <dev-gstreamer at axis dot com>
 * @author Jonas Holmberg <jonas dot holmberg at axis dot com>
 *
 * gstbufferlist.h: Header for GstBufferList object
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
{$ifndef __GST_BUFFER_LIST_H__}
{$define __GST_BUFFER_LIST_H__}
{$include <gst/gstbuffer.h>}
  var
    _gst_buffer_list_type : TGType;cvar;external;

const
  GST_TYPE_BUFFER_LIST = _gst_buffer_list_type;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_IS_BUFFER_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BUFFER_LIST_CAST(obj : longint) : PGstBufferList;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_LIST(obj : longint) : longint;

type
{*
 * GstBufferListFunc:
 * @buffer: (inout) (nullable): pointer to the buffer
 * @idx: the index of @buffer
 * @user_data: user data passed to gst_buffer_list_foreach()
 *
 * A function that will be called from gst_buffer_list_foreach(). The @buffer
 * field will point to a the reference of the buffer at @idx.
 *
 * When this function returns %TRUE, the next buffer will be
 * returned. When %FALSE is returned, gst_buffer_list_foreach() will return.
 *
 * When @buffer is set to %NULL, the item will be removed from the bufferlist.
 * When @buffer has been made writable, the new buffer reference can be assigned
 * to @buffer. This function is responsible for unreffing the old buffer when
 * removing or modifying.
 *
 * Returns: %FALSE when gst_buffer_list_foreach() should stop
  }

  TGstBufferListFunc = function (buffer:PPGstBuffer; idx:Tguint; user_data:Tgpointer):Tgboolean;cdecl;

function gst_buffer_list_ref(list:PGstBufferList):PGstBufferList;cdecl;external;
procedure gst_buffer_list_unref(list:PGstBufferList);cdecl;external;
procedure gst_clear_buffer_list(list_ptr:PPGstBufferList);cdecl;external;
(* Const before type ignored *)
function gst_buffer_list_copy(list:PGstBufferList):PGstBufferList;cdecl;external;
function gst_buffer_list_replace(old_list:PPGstBufferList; new_list:PGstBufferList):Tgboolean;cdecl;external;
function gst_buffer_list_take(old_list:PPGstBufferList; new_list:PGstBufferList):Tgboolean;cdecl;external;
function gst_buffer_list_steal(old_list:PPGstBufferList):PGstBufferList;cdecl;external;
function gst_buffer_list_make_writable(list:PGstBufferList):PGstBufferList;cdecl;external;
(* Const before type ignored *)
function gst_buffer_list_is_writable(list:PGstBufferList):Tgboolean;cdecl;external;
function gst_buffer_list_get_type:TGType;cdecl;external;
{ allocation  }
function gst_buffer_list_new:PGstBufferList;cdecl;external;
function gst_buffer_list_new_sized(size:Tguint):PGstBufferList;cdecl;external;
function gst_buffer_list_length(list:PGstBufferList):Tguint;cdecl;external;
function gst_buffer_list_get(list:PGstBufferList; idx:Tguint):PGstBuffer;cdecl;external;
function gst_buffer_list_get_writable(list:PGstBufferList; idx:Tguint):PGstBuffer;cdecl;external;
procedure gst_buffer_list_insert(list:PGstBufferList; idx:Tgint; buffer:PGstBuffer);cdecl;external;
procedure gst_buffer_list_remove(list:PGstBufferList; idx:Tguint; length:Tguint);cdecl;external;
function gst_buffer_list_foreach(list:PGstBufferList; func:TGstBufferListFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_buffer_list_copy_deep(list:PGstBufferList):PGstBufferList;cdecl;external;
function gst_buffer_list_calculate_size(list:PGstBufferList):Tgsize;cdecl;external;
{xxxxxxxx #define gst_buffer_list_add(l,b) gst_buffer_list_insert((l),-1,(b)); }
{$endif}
{ __GST_BUFFER_LIST_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BUFFER_LIST(obj : longint) : longint;
begin
  GST_IS_BUFFER_LIST:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_BUFFER_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BUFFER_LIST_CAST(obj : longint) : PGstBufferList;
begin
  GST_BUFFER_LIST_CAST:=PGstBufferList(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_LIST(obj : longint) : longint;
begin
  GST_BUFFER_LIST:=GST_BUFFER_LIST_CAST(obj);
end;


end.
