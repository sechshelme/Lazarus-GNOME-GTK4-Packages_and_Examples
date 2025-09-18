
unit gmime_filter_gzip;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_filter_gzip.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_filter_gzip.h
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
PGMimeFilter  = ^GMimeFilter;
PGMimeFilterGZip  = ^GMimeFilterGZip;
PGMimeFilterGZipClass  = ^GMimeFilterGZipClass;
PGMimeFilterGZipMode  = ^GMimeFilterGZipMode;
PGMimeFilterGZipPrivate  = ^GMimeFilterGZipPrivate;
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
{$ifndef __GMIME_FILTER_GZIP_H__}
{$define __GMIME_FILTER_GZIP_H__}
{$include <gmime/gmime-filter.h>}

{ was #define dname def_expr }
function GMIME_TYPE_FILTER_GZIP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_GZIP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_GZIP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_GZIP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_GZIP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_GZIP_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeFilterGZipMode:
 * @GMIME_FILTER_GZIP_MODE_ZIP: Compress (zip) mode.
 * @GMIME_FILTER_GZIP_MODE_UNZIP: Uncompress (unzip) mode.
 *
 * The mode for the #GMimeFilterGZip filter.
 * }

  PGMimeFilterGZipMode = ^TGMimeFilterGZipMode;
  TGMimeFilterGZipMode =  Longint;
  Const
    GMIME_FILTER_GZIP_MODE_ZIP = 0;
    GMIME_FILTER_GZIP_MODE_UNZIP = 1;
;
{*
 * GMimeFilterGZip:
 * @parent_object: parent #GMimeFilter
 * @priv: private state data
 * @mode: #GMimeFilterGZipMode
 * @level: compression level
 *
 * A filter for compresing or decompressing a gzip stream.
 * }
type
  PGMimeFilterGZip = ^TGMimeFilterGZip;
  TGMimeFilterGZip = record
      parent_object : TGMimeFilter;
      priv : PGMimeFilterGZipPrivate;
      mode : TGMimeFilterGZipMode;
      level : longint;
    end;

  PGMimeFilterGZipClass = ^TGMimeFilterGZipClass;
  TGMimeFilterGZipClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_gzip_get_type:TGType;cdecl;external;
function g_mime_filter_gzip_new(mode:TGMimeFilterGZipMode; level:longint):PGMimeFilter;cdecl;external;
(* Const before type ignored *)
function g_mime_filter_gzip_get_filename(gzip:PGMimeFilterGZip):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_filter_gzip_set_filename(gzip:PGMimeFilterGZip; filename:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_filter_gzip_get_comment(gzip:PGMimeFilterGZip):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_filter_gzip_set_comment(gzip:PGMimeFilterGZip; comment:Pchar);cdecl;external;
{$endif}
{ __GMIME_FILTER_GZIP_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_FILTER_GZIP : longint; { return type might be wrong }
  begin
    GMIME_TYPE_FILTER_GZIP:=g_mime_filter_gzip_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_GZIP(obj : longint) : longint;
begin
  GMIME_FILTER_GZIP:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_FILTER_GZIP,GMimeFilterGZip);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_GZIP_CLASS(klass : longint) : longint;
begin
  GMIME_FILTER_GZIP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_FILTER_GZIP,GMimeFilterGZipClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_GZIP(obj : longint) : longint;
begin
  GMIME_IS_FILTER_GZIP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_FILTER_GZIP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_GZIP_CLASS(klass : longint) : longint;
begin
  GMIME_IS_FILTER_GZIP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_FILTER_GZIP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_GZIP_GET_CLASS(obj : longint) : longint;
begin
  GMIME_FILTER_GZIP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_FILTER_GZIP,GMimeFilterGZipClass);
end;


end.
