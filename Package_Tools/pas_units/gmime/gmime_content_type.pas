unit gmime_content_type;

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
{$ifndef __GMIME_CONTENT_TYPE_H__}
{$define __GMIME_CONTENT_TYPE_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gmime/gmime-param.h>}

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


function g_mime_content_type_get_type:TGType;cdecl;external libgmime3;
function g_mime_content_type_new(_type:Pchar; subtype:Pchar):PGMimeContentType;cdecl;external libgmime3;
function g_mime_content_type_parse(options:PGMimeParserOptions; str:Pchar):PGMimeContentType;cdecl;external libgmime3;
function g_mime_content_type_get_mime_type(content_type:PGMimeContentType):Pchar;cdecl;external libgmime3;
function g_mime_content_type_encode(content_type:PGMimeContentType; options:PGMimeFormatOptions):Pchar;cdecl;external libgmime3;
function g_mime_content_type_is_type(content_type:PGMimeContentType; _type:Pchar; subtype:Pchar):Tgboolean;cdecl;external libgmime3;
procedure g_mime_content_type_set_media_type(content_type:PGMimeContentType; _type:Pchar);cdecl;external libgmime3;
function g_mime_content_type_get_media_type(content_type:PGMimeContentType):Pchar;cdecl;external libgmime3;
procedure g_mime_content_type_set_media_subtype(content_type:PGMimeContentType; subtype:Pchar);cdecl;external libgmime3;
function g_mime_content_type_get_media_subtype(content_type:PGMimeContentType):Pchar;cdecl;external libgmime3;
function g_mime_content_type_get_parameters(content_type:PGMimeContentType):PGMimeParamList;cdecl;external libgmime3;
procedure g_mime_content_type_set_parameter(content_type:PGMimeContentType; name:Pchar; value:Pchar);cdecl;external libgmime3;
function g_mime_content_type_get_parameter(content_type:PGMimeContentType; name:Pchar):Pchar;cdecl;external libgmime3;
{$endif}
{ __GMIME_CONTENT_TYPE_H__  }

// === Konventiert am: 18-9-25 15:26:08 ===

function GMIME_TYPE_CONTENT_TYPE : TGType;
function GMIME_CONTENT_TYPE(obj : Pointer) : PGMimeContentType;
function GMIME_CONTENT_TYPE_CLASS(klass : Pointer) : PGMimeContentTypeClass;
function GMIME_IS_CONTENT_TYPE(obj : Pointer) : Tgboolean;
function GMIME_IS_CONTENT_TYPE_CLASS(klass : Pointer) : Tgboolean;
function GMIME_CONTENT_TYPE_GET_CLASS(obj : Pointer) : PGMimeContentTypeClass;

implementation

function GMIME_TYPE_CONTENT_TYPE : TGType;
  begin
    GMIME_TYPE_CONTENT_TYPE:=g_mime_content_type_get_type;
  end;

function GMIME_CONTENT_TYPE(obj : Pointer) : PGMimeContentType;
begin
  Result := PGMimeContentType(g_type_check_instance_cast(obj, GMIME_TYPE_CONTENT_TYPE));
end;

function GMIME_CONTENT_TYPE_CLASS(klass : Pointer) : PGMimeContentTypeClass;
begin
  Result := PGMimeContentTypeClass(g_type_check_class_cast(klass, GMIME_TYPE_CONTENT_TYPE));
end;

function GMIME_IS_CONTENT_TYPE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_CONTENT_TYPE);
end;

function GMIME_IS_CONTENT_TYPE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_CONTENT_TYPE);
end;

function GMIME_CONTENT_TYPE_GET_CLASS(obj : Pointer) : PGMimeContentTypeClass;
begin
  Result := PGMimeContentTypeClass(PGTypeInstance(obj)^.g_class);
end;



end.
