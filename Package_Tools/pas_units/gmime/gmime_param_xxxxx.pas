unit gmime_param_xxxxx;

interface

uses
  fp_glib2, fp_gmime3;

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


function g_mime_param_get_type:TGType;cdecl;external libgmime3;
function g_mime_param_get_name(param:PGMimeParam):Pchar;cdecl;external libgmime3;
function g_mime_param_get_value(param:PGMimeParam):Pchar;cdecl;external libgmime3;
procedure g_mime_param_set_value(param:PGMimeParam; value:Pchar);cdecl;external libgmime3;
function g_mime_param_get_charset(param:PGMimeParam):Pchar;cdecl;external libgmime3;
procedure g_mime_param_set_charset(param:PGMimeParam; charset:Pchar);cdecl;external libgmime3;
function g_mime_param_get_lang(param:PGMimeParam):Pchar;cdecl;external libgmime3;
procedure g_mime_param_set_lang(param:PGMimeParam; lang:Pchar);cdecl;external libgmime3;
function g_mime_param_get_encoding_method(param:PGMimeParam):TGMimeParamEncodingMethod;cdecl;external libgmime3;
procedure g_mime_param_set_encoding_method(param:PGMimeParam; method:TGMimeParamEncodingMethod);cdecl;external libgmime3;
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


function g_mime_param_list_get_type:TGType;cdecl;external libgmime3;
function g_mime_param_list_new:PGMimeParamList;cdecl;external libgmime3;
function g_mime_param_list_parse(options:PGMimeParserOptions; str:Pchar):PGMimeParamList;cdecl;external libgmime3;
function g_mime_param_list_length(list:PGMimeParamList):longint;cdecl;external libgmime3;
procedure g_mime_param_list_clear(list:PGMimeParamList);cdecl;external libgmime3;
procedure g_mime_param_list_set_parameter(list:PGMimeParamList; name:Pchar; value:Pchar);cdecl;external libgmime3;
function g_mime_param_list_get_parameter(list:PGMimeParamList; name:Pchar):PGMimeParam;cdecl;external libgmime3;
function g_mime_param_list_get_parameter_at(list:PGMimeParamList; index:longint):PGMimeParam;cdecl;external libgmime3;
function g_mime_param_list_remove(list:PGMimeParamList; name:Pchar):Tgboolean;cdecl;external libgmime3;
function g_mime_param_list_remove_at(list:PGMimeParamList; index:longint):Tgboolean;cdecl;external libgmime3;
procedure g_mime_param_list_encode(list:PGMimeParamList; options:PGMimeFormatOptions; fold:Tgboolean; str:PGString);cdecl;external libgmime3;
{$endif}
{ __GMIME_PARAM_H__  }

// === Konventiert am: 18-9-25 15:32:31 ===

function GMIME_TYPE_PARAM_LIST : TGType;
function GMIME_PARAM_LIST(obj : Pointer) : PGMimeParamList;
function GMIME_PARAM_LIST_CLASS(klass : Pointer) : PGMimeParamListClass;
function GMIME_IS_PARAM_LIST(obj : Pointer) : Tgboolean;
function GMIME_IS_PARAM_LIST_CLASS(klass : Pointer) : Tgboolean;
function GMIME_PARAM_LIST_GET_CLASS(obj : Pointer) : PGMimeParamListClass;

implementation

function GMIME_TYPE_PARAM_LIST : TGType;
  begin
    GMIME_TYPE_PARAM_LIST:=g_mime_param_list_get_type;
  end;

function GMIME_PARAM_LIST(obj : Pointer) : PGMimeParamList;
begin
  Result := PGMimeParamList(g_type_check_instance_cast(obj, GMIME_TYPE_PARAM_LIST));
end;

function GMIME_PARAM_LIST_CLASS(klass : Pointer) : PGMimeParamListClass;
begin
  Result := PGMimeParamListClass(g_type_check_class_cast(klass, GMIME_TYPE_PARAM_LIST));
end;

function GMIME_IS_PARAM_LIST(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_PARAM_LIST);
end;

function GMIME_IS_PARAM_LIST_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_PARAM_LIST);
end;

function GMIME_PARAM_LIST_GET_CLASS(obj : Pointer) : PGMimeParamListClass;
begin
  Result := PGMimeParamListClass(PGTypeInstance(obj)^.g_class);
end;



end.
