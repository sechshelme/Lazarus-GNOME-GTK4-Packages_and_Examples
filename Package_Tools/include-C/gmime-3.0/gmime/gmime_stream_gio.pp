
unit gmime_stream_gio;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_stream_gio.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_stream_gio.h
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
PGFile  = ^GFile;
PGInputStream  = ^GInputStream;
PGMimeStream  = ^GMimeStream;
PGMimeStreamGIO  = ^GMimeStreamGIO;
PGMimeStreamGIOClass  = ^GMimeStreamGIOClass;
PGOutputStream  = ^GOutputStream;
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
{$ifndef __GMIME_STREAM_GIO_H__}
{$define __GMIME_STREAM_GIO_H__}
{$include <gio/gio.h>}
{$include <gmime/gmime-stream.h>}

{ was #define dname def_expr }
function GMIME_TYPE_STREAM_GIO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_GIO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_GIO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_GIO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_GIO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_GIO_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeStreamGIO:
 * @parent_object: parent #GMimeStream
 * @ostream: a #GOutputStream
 * @istream: a #GInputStream
 * @file: a #GFile
 * @owner: %TRUE if this stream owns the #GFile or %FALSE otherwise
 * @eos: %TRUE if the end of the stream has been reached or %FALSE otherwise
 *
 * A #GMimeStream wrapper around GLib's GIO streams.
 * }
  PGMimeStreamGIO = ^TGMimeStreamGIO;
  TGMimeStreamGIO = record
      parent_object : TGMimeStream;
      ostream : PGOutputStream;
      istream : PGInputStream;
      file : PGFile;
      owner : Tgboolean;
      eos : Tgboolean;
    end;

  PGMimeStreamGIOClass = ^TGMimeStreamGIOClass;
  TGMimeStreamGIOClass = record
      parent_class : TGMimeStreamClass;
    end;


function g_mime_stream_gio_get_type:TGType;cdecl;external;
function g_mime_stream_gio_new(file:PGFile):PGMimeStream;cdecl;external;
function g_mime_stream_gio_new_with_bounds(file:PGFile; start:Tgint64; end:Tgint64):PGMimeStream;cdecl;external;
function g_mime_stream_gio_get_owner(stream:PGMimeStreamGIO):Tgboolean;cdecl;external;
procedure g_mime_stream_gio_set_owner(stream:PGMimeStreamGIO; owner:Tgboolean);cdecl;external;
{$endif}
{ __GMIME_STREAM_GIO_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_STREAM_GIO : longint; { return type might be wrong }
  begin
    GMIME_TYPE_STREAM_GIO:=g_mime_stream_gio_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_GIO(obj : longint) : longint;
begin
  GMIME_STREAM_GIO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_STREAM_GIO,GMimeStreamGIO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_GIO_CLASS(klass : longint) : longint;
begin
  GMIME_STREAM_GIO_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_STREAM_GIO,GMimeStreamGIOClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_GIO(obj : longint) : longint;
begin
  GMIME_IS_STREAM_GIO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_STREAM_GIO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_GIO_CLASS(klass : longint) : longint;
begin
  GMIME_IS_STREAM_GIO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_STREAM_GIO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_GIO_GET_CLASS(obj : longint) : longint;
begin
  GMIME_STREAM_GIO_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_STREAM_GIO,GMimeStreamGIOClass);
end;


end.
