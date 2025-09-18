
unit gmime_content_type;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_content_type.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_content_type.h
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
PGMimeContentType  = ^GMimeContentType;
PGMimeContentTypeClass  = ^GMimeContentTypeClass;
PGMimeFormatOptions  = ^GMimeFormatOptions;
PGMimeParamList  = ^GMimeParamList;
PGMimeParserOptions  = ^GMimeParserOptions;
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
{$ifndef __GMIME_CONTENT_TYPE_H__}
{$define __GMIME_CONTENT_TYPE_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gmime/gmime-param.h>}

{ was #define dname def_expr }
function GMIME_TYPE_CONTENT_TYPE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CONTENT_TYPE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CONTENT_TYPE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CONTENT_TYPE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CONTENT_TYPE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CONTENT_TYPE_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeContentType:
 * @parent_object: parent #GObject
 * @type: media type
 * @subtype: media subtype
 * @params: a #GMimeParam list
 *
 * A data structure representing a Content-Type.
 * }
{ < private >  }
  PGMimeContentType = ^TGMimeContentType;
  TGMimeContentType = record
      parent_object : TGObject;
      _type : Pchar;
      subtype : Pchar;
      params : PGMimeParamList;
      changed : Tgpointer;
    end;

  PGMimeContentTypeClass = ^TGMimeContentTypeClass;
  TGMimeContentTypeClass = record
      parent_class : TGObjectClass;
    end;


function g_mime_content_type_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_mime_content_type_new(_type:Pchar; subtype:Pchar):PGMimeContentType;cdecl;external;
(* Const before type ignored *)
function g_mime_content_type_parse(options:PGMimeParserOptions; str:Pchar):PGMimeContentType;cdecl;external;
function g_mime_content_type_get_mime_type(content_type:PGMimeContentType):Pchar;cdecl;external;
function g_mime_content_type_encode(content_type:PGMimeContentType; options:PGMimeFormatOptions):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_mime_content_type_is_type(content_type:PGMimeContentType; _type:Pchar; subtype:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure g_mime_content_type_set_media_type(content_type:PGMimeContentType; _type:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_content_type_get_media_type(content_type:PGMimeContentType):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_content_type_set_media_subtype(content_type:PGMimeContentType; subtype:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_content_type_get_media_subtype(content_type:PGMimeContentType):Pchar;cdecl;external;
function g_mime_content_type_get_parameters(content_type:PGMimeContentType):PGMimeParamList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_mime_content_type_set_parameter(content_type:PGMimeContentType; name:Pchar; value:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_mime_content_type_get_parameter(content_type:PGMimeContentType; name:Pchar):Pchar;cdecl;external;
{$endif}
{ __GMIME_CONTENT_TYPE_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_CONTENT_TYPE : longint; { return type might be wrong }
  begin
    GMIME_TYPE_CONTENT_TYPE:=g_mime_content_type_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CONTENT_TYPE(obj : longint) : longint;
begin
  GMIME_CONTENT_TYPE:=G_TYPE_CHECK_INSTANCE_CAST(obj,g_mime_content_type_get_type,GMimeContentType);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CONTENT_TYPE_CLASS(klass : longint) : longint;
begin
  GMIME_CONTENT_TYPE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,g_mime_content_type_get_type,GMimeContentTypeClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CONTENT_TYPE(obj : longint) : longint;
begin
  GMIME_IS_CONTENT_TYPE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,g_mime_content_type_get_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CONTENT_TYPE_CLASS(klass : longint) : longint;
begin
  GMIME_IS_CONTENT_TYPE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,g_mime_content_type_get_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CONTENT_TYPE_GET_CLASS(obj : longint) : longint;
begin
  GMIME_CONTENT_TYPE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,g_mime_content_type_get_type,GMimeContentTypeClass);
end;


end.
