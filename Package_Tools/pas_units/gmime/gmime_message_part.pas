unit gmime_message_part;

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
{$ifndef __GMIME_MESSAGE_PART_H__}
{$define __GMIME_MESSAGE_PART_H__}
{$include <gmime/gmime-object.h>}
{$include <gmime/gmime-message.h>}

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


function g_mime_message_part_get_type:TGType;cdecl;external libgmime3;
function g_mime_message_part_new(subtype:Pchar):PGMimeMessagePart;cdecl;external libgmime3;
function g_mime_message_part_new_with_message(subtype:Pchar; message:PGMimeMessage):PGMimeMessagePart;cdecl;external libgmime3;
procedure g_mime_message_part_set_message(part:PGMimeMessagePart; message:PGMimeMessage);cdecl;external libgmime3;
function g_mime_message_part_get_message(part:PGMimeMessagePart):PGMimeMessage;cdecl;external libgmime3;
{$endif}
{ __GMIME_MESSAGE_PART_H__  }

// === Konventiert am: 18-9-25 15:29:39 ===

function GMIME_TYPE_MESSAGE_PART : TGType;
function GMIME_MESSAGE_PART(obj : Pointer) : PGMimeMessagePart;
function GMIME_MESSAGE_PART_CLASS(klass : Pointer) : PGMimeMessagePartClass;
function GMIME_IS_MESSAGE_PART(obj : Pointer) : Tgboolean;
function GMIME_IS_MESSAGE_PART_CLASS(klass : Pointer) : Tgboolean;
function GMIME_MESSAGE_PART_GET_CLASS(obj : Pointer) : PGMimeMessagePartClass;

implementation

function GMIME_TYPE_MESSAGE_PART : TGType;
  begin
    GMIME_TYPE_MESSAGE_PART:=g_mime_message_part_get_type;
  end;

function GMIME_MESSAGE_PART(obj : Pointer) : PGMimeMessagePart;
begin
  Result := PGMimeMessagePart(g_type_check_instance_cast(obj, GMIME_TYPE_MESSAGE_PART));
end;

function GMIME_MESSAGE_PART_CLASS(klass : Pointer) : PGMimeMessagePartClass;
begin
  Result := PGMimeMessagePartClass(g_type_check_class_cast(klass, GMIME_TYPE_MESSAGE_PART));
end;

function GMIME_IS_MESSAGE_PART(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_MESSAGE_PART);
end;

function GMIME_IS_MESSAGE_PART_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_MESSAGE_PART);
end;

function GMIME_MESSAGE_PART_GET_CLASS(obj : Pointer) : PGMimeMessagePartClass;
begin
  Result := PGMimeMessagePartClass(PGTypeInstance(obj)^.g_class);
end;



end.
