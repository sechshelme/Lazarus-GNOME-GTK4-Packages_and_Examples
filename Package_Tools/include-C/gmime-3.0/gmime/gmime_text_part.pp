
unit gmime_text_part;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_text_part.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_text_part.h
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
PGMimeTextPart  = ^GMimeTextPart;
PGMimeTextPartClass  = ^GMimeTextPartClass;
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

{ was #define dname def_expr }
function GMIME_TYPE_TEXT_PART : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_TEXT_PART(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_TEXT_PART_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_TEXT_PART(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_TEXT_PART_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_TEXT_PART_GET_CLASS(obj : longint) : longint;

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


function g_mime_text_part_get_type:TGType;cdecl;external;
{ constructors  }
function g_mime_text_part_new:PGMimeTextPart;cdecl;external;
(* Const before type ignored *)
function g_mime_text_part_new_with_subtype(subtype:Pchar):PGMimeTextPart;cdecl;external;
(* Const before type ignored *)
procedure g_mime_text_part_set_charset(mime_part:PGMimeTextPart; charset:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_text_part_get_charset(mime_part:PGMimeTextPart):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_text_part_set_text(mime_part:PGMimeTextPart; text:Pchar);cdecl;external;
function g_mime_text_part_get_text(mime_part:PGMimeTextPart):Pchar;cdecl;external;
{$endif}
{ __GMIME_TEXT_PART_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_TEXT_PART : longint; { return type might be wrong }
  begin
    GMIME_TYPE_TEXT_PART:=g_mime_text_part_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_TEXT_PART(obj : longint) : longint;
begin
  GMIME_TEXT_PART:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_TEXT_PART,GMimeTextPart);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_TEXT_PART_CLASS(klass : longint) : longint;
begin
  GMIME_TEXT_PART_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_TEXT_PART,GMimeTextPartClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_TEXT_PART(obj : longint) : longint;
begin
  GMIME_IS_TEXT_PART:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_TEXT_PART);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_TEXT_PART_CLASS(klass : longint) : longint;
begin
  GMIME_IS_TEXT_PART_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_TEXT_PART);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_TEXT_PART_GET_CLASS(obj : longint) : longint;
begin
  GMIME_TEXT_PART_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_TEXT_PART,GMimeTextPartClass);
end;


end.
