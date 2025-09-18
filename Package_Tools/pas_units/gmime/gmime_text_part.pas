unit gmime_text_part;

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
{$ifndef __GMIME_TEXT_PART_H__}
{$define __GMIME_TEXT_PART_H__}
{$include <gmime/gmime-part.h>}

type
{*
 * GMimeTextPart:
 * @parent_object: parent #GMimePart
 *
 * A text MIME part object.
 * }
  PGMimeTextPart = ^TGMimeTextPart;
  TGMimeTextPart = record
      parent_object : TGMimePart;
    end;

  PGMimeTextPartClass = ^TGMimeTextPartClass;
  TGMimeTextPartClass = record
      parent_class : TGMimePartClass;
    end;


function g_mime_text_part_get_type:TGType;cdecl;external libgmime3;
{ constructors  }
function g_mime_text_part_new:PGMimeTextPart;cdecl;external libgmime3;
function g_mime_text_part_new_with_subtype(subtype:Pchar):PGMimeTextPart;cdecl;external libgmime3;
procedure g_mime_text_part_set_charset(mime_part:PGMimeTextPart; charset:Pchar);cdecl;external libgmime3;
function g_mime_text_part_get_charset(mime_part:PGMimeTextPart):Pchar;cdecl;external libgmime3;
procedure g_mime_text_part_set_text(mime_part:PGMimeTextPart; text:Pchar);cdecl;external libgmime3;
function g_mime_text_part_get_text(mime_part:PGMimeTextPart):Pchar;cdecl;external libgmime3;
{$endif}
{ __GMIME_TEXT_PART_H__  }

// === Konventiert am: 18-9-25 15:34:26 ===

function GMIME_TYPE_TEXT_PART : TGType;
function GMIME_TEXT_PART(obj : Pointer) : PGMimeTextPart;
function GMIME_TEXT_PART_CLASS(klass : Pointer) : PGMimeTextPartClass;
function GMIME_IS_TEXT_PART(obj : Pointer) : Tgboolean;
function GMIME_IS_TEXT_PART_CLASS(klass : Pointer) : Tgboolean;
function GMIME_TEXT_PART_GET_CLASS(obj : Pointer) : PGMimeTextPartClass;

implementation

function GMIME_TYPE_TEXT_PART : TGType;
  begin
    GMIME_TYPE_TEXT_PART:=g_mime_text_part_get_type;
  end;

function GMIME_TEXT_PART(obj : Pointer) : PGMimeTextPart;
begin
  Result := PGMimeTextPart(g_type_check_instance_cast(obj, GMIME_TYPE_TEXT_PART));
end;

function GMIME_TEXT_PART_CLASS(klass : Pointer) : PGMimeTextPartClass;
begin
  Result := PGMimeTextPartClass(g_type_check_class_cast(klass, GMIME_TYPE_TEXT_PART));
end;

function GMIME_IS_TEXT_PART(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_TEXT_PART);
end;

function GMIME_IS_TEXT_PART_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_TEXT_PART);
end;

function GMIME_TEXT_PART_GET_CLASS(obj : Pointer) : PGMimeTextPartClass;
begin
  Result := PGMimeTextPartClass(PGTypeInstance(obj)^.g_class);
end;



end.
