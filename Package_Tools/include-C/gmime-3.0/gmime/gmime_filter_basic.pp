
unit gmime_filter_basic;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_filter_basic.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_filter_basic.h
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
PGMimeFilter  = ^GMimeFilter;
PGMimeFilterBasic  = ^GMimeFilterBasic;
PGMimeFilterBasicClass  = ^GMimeFilterBasicClass;
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
{$ifndef __GMIME_FILTER_BASIC_H__}
{$define __GMIME_FILTER_BASIC_H__}
{$include <gmime/gmime-encodings.h>}
{$include <gmime/gmime-filter.h>}

{ was #define dname def_expr }
function GMIME_TYPE_FILTER_BASIC : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_BASIC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_BASIC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_BASIC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_BASIC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_BASIC_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeFilterBasic:
 * @parent_object: parent #GMimeFilter
 * @encoder: #GMimeEncoding state
 *
 * A basic encoder/decoder filter for the MIME encodings.
 * }
  PGMimeFilterBasic = ^TGMimeFilterBasic;
  TGMimeFilterBasic = record
      parent_object : TGMimeFilter;
      encoder : TGMimeEncoding;
    end;

  PGMimeFilterBasicClass = ^TGMimeFilterBasicClass;
  TGMimeFilterBasicClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_basic_get_type:TGType;cdecl;external;
function g_mime_filter_basic_new(encoding:TGMimeContentEncoding; encode:Tgboolean):PGMimeFilter;cdecl;external;
{$endif}
{ __GMIME_FILTER_BASIC_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_FILTER_BASIC : longint; { return type might be wrong }
  begin
    GMIME_TYPE_FILTER_BASIC:=g_mime_filter_basic_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_BASIC(obj : longint) : longint;
begin
  GMIME_FILTER_BASIC:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_FILTER_BASIC,GMimeFilterBasic);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_BASIC_CLASS(klass : longint) : longint;
begin
  GMIME_FILTER_BASIC_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_FILTER_BASIC,GMimeFilterBasicClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_BASIC(obj : longint) : longint;
begin
  GMIME_IS_FILTER_BASIC:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_FILTER_BASIC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_BASIC_CLASS(klass : longint) : longint;
begin
  GMIME_IS_FILTER_BASIC_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_FILTER_BASIC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_BASIC_GET_CLASS(obj : longint) : longint;
begin
  GMIME_FILTER_BASIC_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_FILTER_BASIC,GMimeFilterBasicClass);
end;


end.
