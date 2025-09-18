
unit gmime_stream;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_stream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_stream.h
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
Pchar  = ^char;
PGMimeSeekWhence  = ^GMimeSeekWhence;
PGMimeStream  = ^GMimeStream;
PGMimeStreamClass  = ^GMimeStreamClass;
PGMimeStreamIOVector  = ^GMimeStreamIOVector;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime
 *  Copyright (C) 2000-2022 Jeffrey Stedfast
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
 *  02110-1301, USA.
  }
{$ifndef __GMIME_STREAM_H__}
{$define __GMIME_STREAM_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <stdio.h>}
{$include <sys/types.h>}
{$include <stdarg.h>}

{ was #define dname def_expr }
function GMIME_TYPE_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeSeekWhence:
 * @GMIME_STREAM_SEEK_SET: Seek relative to the beginning of the stream.
 * @GMIME_STREAM_SEEK_CUR: Seek relative to the current position in the stream.
 * @GMIME_STREAM_SEEK_END: Seek relative to the end of the stream.
 *
 * Relative seek position.
 * }

  PGMimeSeekWhence = ^TGMimeSeekWhence;
  TGMimeSeekWhence =  Longint;
  Const
    GMIME_STREAM_SEEK_SET = SEEK_SET;
    GMIME_STREAM_SEEK_CUR = SEEK_CUR;
    GMIME_STREAM_SEEK_END = SEEK_END;
;
{*
 * GMimeStreamIOVector:
 * @data: data to pass to the I/O function.
 * @len: length of the data, in bytes.
 *
 * An I/O vector for use with g_mime_stream_writev().
 * }
type
  PGMimeStreamIOVector = ^TGMimeStreamIOVector;
  TGMimeStreamIOVector = record
      data : pointer;
      len : Tsize_t;
    end;
{*
 * GMimeStream:
 * @parent_object: parent #GObject
 *
 * Abstract I/O stream class.
 * }
{ <private>  }
  PGMimeStream = ^TGMimeStream;
  TGMimeStream = record
      parent_object : TGObject;
      super_stream : PGMimeStream;
      position : Tgint64;
      bound_start : Tgint64;
      bound_end : Tgint64;
    end;

(* Const before type ignored *)
  PGMimeStreamClass = ^TGMimeStreamClass;
  TGMimeStreamClass = record
      parent_class : TGObjectClass;
      read : function (stream:PGMimeStream; buf:Pchar; len:Tsize_t):Tssize_t;cdecl;
      write : function (stream:PGMimeStream; buf:Pchar; len:Tsize_t):Tssize_t;cdecl;
      flush : function (stream:PGMimeStream):longint;cdecl;
      close : function (stream:PGMimeStream):longint;cdecl;
      eos : function (stream:PGMimeStream):Tgboolean;cdecl;
      reset : function (stream:PGMimeStream):longint;cdecl;
      seek : function (stream:PGMimeStream; offset:Tgint64; whence:TGMimeSeekWhence):Tgint64;cdecl;
      tell : function (stream:PGMimeStream):Tgint64;cdecl;
      length : function (stream:PGMimeStream):Tgint64;cdecl;
      substream : function (stream:PGMimeStream; start:Tgint64; end:Tgint64):PGMimeStream;cdecl;
    end;


function g_mime_stream_get_type:TGType;cdecl;external;
procedure g_mime_stream_construct(stream:PGMimeStream; start:Tgint64; end:Tgint64);cdecl;external;
{ public methods  }
function g_mime_stream_read(stream:PGMimeStream; buf:Pchar; len:Tsize_t):Tssize_t;cdecl;external;
(* Const before type ignored *)
function g_mime_stream_write(stream:PGMimeStream; buf:Pchar; len:Tsize_t):Tssize_t;cdecl;external;
function g_mime_stream_flush(stream:PGMimeStream):longint;cdecl;external;
function g_mime_stream_close(stream:PGMimeStream):longint;cdecl;external;
function g_mime_stream_eos(stream:PGMimeStream):Tgboolean;cdecl;external;
function g_mime_stream_reset(stream:PGMimeStream):longint;cdecl;external;
function g_mime_stream_seek(stream:PGMimeStream; offset:Tgint64; whence:TGMimeSeekWhence):Tgint64;cdecl;external;
function g_mime_stream_tell(stream:PGMimeStream):Tgint64;cdecl;external;
function g_mime_stream_length(stream:PGMimeStream):Tgint64;cdecl;external;
function g_mime_stream_substream(stream:PGMimeStream; start:Tgint64; end:Tgint64):PGMimeStream;cdecl;external;
procedure g_mime_stream_set_bounds(stream:PGMimeStream; start:Tgint64; end:Tgint64);cdecl;external;
(* Const before type ignored *)
function g_mime_stream_write_string(stream:PGMimeStream; str:Pchar):Tssize_t;cdecl;external;
(* Const before type ignored *)
function g_mime_stream_printf(stream:PGMimeStream; fmt:Pchar; args:array of const):Tssize_t;cdecl;external;
function g_mime_stream_printf(stream:PGMimeStream; fmt:Pchar):Tssize_t;cdecl;external;
function g_mime_stream_write_to_stream(src:PGMimeStream; dest:PGMimeStream):Tgint64;cdecl;external;
function g_mime_stream_writev(stream:PGMimeStream; vector:PGMimeStreamIOVector; count:Tsize_t):Tgint64;cdecl;external;
{$endif}
{ __GMIME_STREAM_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_STREAM : longint; { return type might be wrong }
  begin
    GMIME_TYPE_STREAM:=g_mime_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM(obj : longint) : longint;
begin
  GMIME_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_STREAM,GMimeStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_CLASS(klass : longint) : longint;
begin
  GMIME_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_STREAM,GMimeStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM(obj : longint) : longint;
begin
  GMIME_IS_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_CLASS(klass : longint) : longint;
begin
  GMIME_IS_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_GET_CLASS(obj : longint) : longint;
begin
  GMIME_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_STREAM,GMimeStreamClass);
end;


end.
