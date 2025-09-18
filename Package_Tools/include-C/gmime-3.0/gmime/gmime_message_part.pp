
unit gmime_message_part;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_message_part.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_message_part.h
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
PGMimeMessage  = ^GMimeMessage;
PGMimeMessagePart  = ^GMimeMessagePart;
PGMimeMessagePartClass  = ^GMimeMessagePartClass;
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
{$ifndef __GMIME_MESSAGE_PART_H__}
{$define __GMIME_MESSAGE_PART_H__}
{$include <gmime/gmime-object.h>}
{$include <gmime/gmime-message.h>}

{ was #define dname def_expr }
function GMIME_TYPE_MESSAGE_PART : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_PART(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_PART_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MESSAGE_PART(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MESSAGE_PART_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_PART_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeMessagePart:
 * @parent_object: parent #GMimeObject
 * @message: child #GMimeMessage
 *
 * A message/rfc822 or message/news MIME part.
 * }
  PGMimeMessagePart = ^TGMimeMessagePart;
  TGMimeMessagePart = record
      parent_object : TGMimeObject;
      message : PGMimeMessage;
    end;

  PGMimeMessagePartClass = ^TGMimeMessagePartClass;
  TGMimeMessagePartClass = record
      parent_class : TGMimeObjectClass;
    end;


function g_mime_message_part_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_mime_message_part_new(subtype:Pchar):PGMimeMessagePart;cdecl;external;
(* Const before type ignored *)
function g_mime_message_part_new_with_message(subtype:Pchar; message:PGMimeMessage):PGMimeMessagePart;cdecl;external;
procedure g_mime_message_part_set_message(part:PGMimeMessagePart; message:PGMimeMessage);cdecl;external;
function g_mime_message_part_get_message(part:PGMimeMessagePart):PGMimeMessage;cdecl;external;
{$endif}
{ __GMIME_MESSAGE_PART_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_MESSAGE_PART : longint; { return type might be wrong }
  begin
    GMIME_TYPE_MESSAGE_PART:=g_mime_message_part_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_PART(obj : longint) : longint;
begin
  GMIME_MESSAGE_PART:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_MESSAGE_PART,GMimeMessagePart);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_PART_CLASS(klass : longint) : longint;
begin
  GMIME_MESSAGE_PART_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_MESSAGE_PART,GMimeMessagePartClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MESSAGE_PART(obj : longint) : longint;
begin
  GMIME_IS_MESSAGE_PART:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_MESSAGE_PART);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MESSAGE_PART_CLASS(klass : longint) : longint;
begin
  GMIME_IS_MESSAGE_PART_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_MESSAGE_PART);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_PART_GET_CLASS(obj : longint) : longint;
begin
  GMIME_MESSAGE_PART_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_MESSAGE_PART,GMimeMessagePartClass);
end;


end.
