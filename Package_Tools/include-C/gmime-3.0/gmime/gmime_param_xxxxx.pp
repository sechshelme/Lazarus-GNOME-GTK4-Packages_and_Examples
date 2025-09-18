
unit gmime_param_xxxxx;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_param_xxxxx.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_param_xxxxx.h
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
PGMimeFormatOptions  = ^GMimeFormatOptions;
PGMimeParam  = ^GMimeParam;
PGMimeParamClass  = ^GMimeParamClass;
PGMimeParamList  = ^GMimeParamList;
PGMimeParamListClass  = ^GMimeParamListClass;
PGMimeParserOptions  = ^GMimeParserOptions;
PGPtrArray  = ^GPtrArray;
PGString  = ^GString;
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
{$ifndef __GMIME_PARAM_H__}
{$define __GMIME_PARAM_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gmime/gmime-format-options.h>}
{$include <gmime/gmime-parser-options.h>}

{ was #define dname def_expr }
function GMIME_TYPE_PARAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PARAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PARAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARAM_GET_CLASS(obj : longint) : longint;

{ was #define dname def_expr }
function GMIME_TYPE_PARAM_LIST : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARAM_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARAM_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PARAM_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PARAM_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARAM_LIST_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeParam:
 * @method: The encoding method used for the parameter value.
 * @charset: The charset to use when encoding the parameter value.
 * @lang: the language specifier to use when encoding the value.
 * @name: The parameter name.
 * @value: The parameter value.
 *
 * A parameter name/value pair as used in the Content-Type and Content-Disposition headers.
 * }
{ < private >  }
  PGMimeParam = ^TGMimeParam;
  TGMimeParam = record
      parent_object : TGObject;
      method : TGMimeParamEncodingMethod;
      charset : Pchar;
      lang : Pchar;
      name : Pchar;
      value : Pchar;
      changed : Tgpointer;
    end;

  PGMimeParamClass = ^TGMimeParamClass;
  TGMimeParamClass = record
      parent_class : TGObjectClass;
    end;


function g_mime_param_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_mime_param_get_name(param:PGMimeParam):Pchar;cdecl;external;
(* Const before type ignored *)
function g_mime_param_get_value(param:PGMimeParam):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_param_set_value(param:PGMimeParam; value:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_param_get_charset(param:PGMimeParam):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_param_set_charset(param:PGMimeParam; charset:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_param_get_lang(param:PGMimeParam):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_param_set_lang(param:PGMimeParam; lang:Pchar);cdecl;external;
function g_mime_param_get_encoding_method(param:PGMimeParam):TGMimeParamEncodingMethod;cdecl;external;
procedure g_mime_param_set_encoding_method(param:PGMimeParam; method:TGMimeParamEncodingMethod);cdecl;external;
{*
 * GMimeParamList:
 *
 * A list of Content-Type or Content-Disposition parameters.
 * }
{ < private >  }
type
  PGMimeParamList = ^TGMimeParamList;
  TGMimeParamList = record
      parent_object : TGObject;
      array : PGPtrArray;
      changed : Tgpointer;
    end;

  PGMimeParamListClass = ^TGMimeParamListClass;
  TGMimeParamListClass = record
      parent_class : TGObjectClass;
    end;


function g_mime_param_list_get_type:TGType;cdecl;external;
function g_mime_param_list_new:PGMimeParamList;cdecl;external;
(* Const before type ignored *)
function g_mime_param_list_parse(options:PGMimeParserOptions; str:Pchar):PGMimeParamList;cdecl;external;
function g_mime_param_list_length(list:PGMimeParamList):longint;cdecl;external;
procedure g_mime_param_list_clear(list:PGMimeParamList);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_mime_param_list_set_parameter(list:PGMimeParamList; name:Pchar; value:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_param_list_get_parameter(list:PGMimeParamList; name:Pchar):PGMimeParam;cdecl;external;
function g_mime_param_list_get_parameter_at(list:PGMimeParamList; index:longint):PGMimeParam;cdecl;external;
(* Const before type ignored *)
function g_mime_param_list_remove(list:PGMimeParamList; name:Pchar):Tgboolean;cdecl;external;
function g_mime_param_list_remove_at(list:PGMimeParamList; index:longint):Tgboolean;cdecl;external;
procedure g_mime_param_list_encode(list:PGMimeParamList; options:PGMimeFormatOptions; fold:Tgboolean; str:PGString);cdecl;external;
{$endif}
{ __GMIME_PARAM_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_PARAM : longint; { return type might be wrong }
  begin
    GMIME_TYPE_PARAM:=g_mime_param_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARAM(obj : longint) : longint;
begin
  GMIME_PARAM:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_PARAM,GMimeParam);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARAM_CLASS(klass : longint) : longint;
begin
  GMIME_PARAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_PARAM,GMimeParamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PARAM(obj : longint) : longint;
begin
  GMIME_IS_PARAM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_PARAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PARAM_CLASS(klass : longint) : longint;
begin
  GMIME_IS_PARAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_PARAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARAM_GET_CLASS(obj : longint) : longint;
begin
  GMIME_PARAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_PARAM,GMimeParamClass);
end;

{ was #define dname def_expr }
function GMIME_TYPE_PARAM_LIST : longint; { return type might be wrong }
  begin
    GMIME_TYPE_PARAM_LIST:=g_mime_param_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARAM_LIST(obj : longint) : longint;
begin
  GMIME_PARAM_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_PARAM_LIST,GMimeParamList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARAM_LIST_CLASS(klass : longint) : longint;
begin
  GMIME_PARAM_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_PARAM_LIST,GMimeParamListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PARAM_LIST(obj : longint) : longint;
begin
  GMIME_IS_PARAM_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_PARAM_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PARAM_LIST_CLASS(klass : longint) : longint;
begin
  GMIME_IS_PARAM_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_PARAM_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARAM_LIST_GET_CLASS(obj : longint) : longint;
begin
  GMIME_PARAM_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_PARAM_LIST,GMimeParamListClass);
end;


end.
