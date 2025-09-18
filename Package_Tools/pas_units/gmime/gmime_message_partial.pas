unit gmime_message_partial;

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
{$ifndef __GMIME_MESSAGE_PARTIAL_H__}
{$define __GMIME_MESSAGE_PARTIAL_H__}
{$include <glib.h>}
{$include <gmime/gmime-part.h>}
{$include <gmime/gmime-message.h>}

type
{*
 * GMimeMessagePartial:
 * @parent_object: parent #GMimePart object
 * @number: the part number
 * @total: the total number of message/partials that make up the whole message/rfc822
 * @id: message/partial id
 *
 * A message/partial MIME part.
 * }
  PGMimeMessagePartial = ^TGMimeMessagePartial;
  TGMimeMessagePartial = record
      parent_object : TGMimePart;
      number : longint;
      total : longint;
      id : Pchar;
    end;

  PGMimeMessagePartialClass = ^TGMimeMessagePartialClass;
  TGMimeMessagePartialClass = record
      parent_class : TGMimePartClass;
    end;


function g_mime_message_partial_get_type:TGType;cdecl;external libgmime3;
function g_mime_message_partial_new(id:Pchar; number:longint; total:longint):PGMimeMessagePartial;cdecl;external libgmime3;
function g_mime_message_partial_get_id(partial:PGMimeMessagePartial):Pchar;cdecl;external libgmime3;
function g_mime_message_partial_get_number(partial:PGMimeMessagePartial):longint;cdecl;external libgmime3;
function g_mime_message_partial_get_total(partial:PGMimeMessagePartial):longint;cdecl;external libgmime3;
function g_mime_message_partial_reconstruct_message(partials:PPGMimeMessagePartial; num:Tsize_t):PGMimeMessage;cdecl;external libgmime3;
function g_mime_message_partial_split_message(message:PGMimeMessage; max_size:Tsize_t; nparts:Psize_t):^PGMimeMessage;cdecl;external libgmime3;
{$endif}
{ __GMIME_MESSAGE_PARTIAL_H__  }

// === Konventiert am: 18-9-25 15:29:43 ===

function GMIME_TYPE_MESSAGE_PARTIAL : TGType;
function GMIME_MESSAGE_PARTIAL(obj : Pointer) : PGMimeMessagePartial;
function GMIME_MESSAGE_PARTIAL_CLASS(klass : Pointer) : PGMimeMessagePartialClass;
function GMIME_IS_MESSAGE_PARTIAL(obj : Pointer) : Tgboolean;
function GMIME_IS_MESSAGE_PARTIAL_CLASS(klass : Pointer) : Tgboolean;
function GMIME_MESSAGE_PARTIAL_GET_CLASS(obj : Pointer) : PGMimeMessagePartialClass;

implementation

function GMIME_TYPE_MESSAGE_PARTIAL : TGType;
  begin
    GMIME_TYPE_MESSAGE_PARTIAL:=g_mime_message_partial_get_type;
  end;

function GMIME_MESSAGE_PARTIAL(obj : Pointer) : PGMimeMessagePartial;
begin
  Result := PGMimeMessagePartial(g_type_check_instance_cast(obj, GMIME_TYPE_MESSAGE_PARTIAL));
end;

function GMIME_MESSAGE_PARTIAL_CLASS(klass : Pointer) : PGMimeMessagePartialClass;
begin
  Result := PGMimeMessagePartialClass(g_type_check_class_cast(klass, GMIME_TYPE_MESSAGE_PARTIAL));
end;

function GMIME_IS_MESSAGE_PARTIAL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_MESSAGE_PARTIAL);
end;

function GMIME_IS_MESSAGE_PARTIAL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_MESSAGE_PARTIAL);
end;

function GMIME_MESSAGE_PARTIAL_GET_CLASS(obj : Pointer) : PGMimeMessagePartialClass;
begin
  Result := PGMimeMessagePartialClass(PGTypeInstance(obj)^.g_class);
end;



end.
