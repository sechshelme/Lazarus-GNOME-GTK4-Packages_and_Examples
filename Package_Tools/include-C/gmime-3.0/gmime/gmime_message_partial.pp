
unit gmime_message_partial;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_message_partial.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_message_partial.h
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
PGMimeMessagePartial  = ^GMimeMessagePartial;
PGMimeMessagePartialClass  = ^GMimeMessagePartialClass;
Psize_t  = ^size_t;
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

{ was #define dname def_expr }
function GMIME_TYPE_MESSAGE_PARTIAL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_PARTIAL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_PARTIAL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MESSAGE_PARTIAL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MESSAGE_PARTIAL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_PARTIAL_GET_CLASS(obj : longint) : longint;

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


function g_mime_message_partial_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_mime_message_partial_new(id:Pchar; number:longint; total:longint):PGMimeMessagePartial;cdecl;external;
(* Const before type ignored *)
function g_mime_message_partial_get_id(partial:PGMimeMessagePartial):Pchar;cdecl;external;
function g_mime_message_partial_get_number(partial:PGMimeMessagePartial):longint;cdecl;external;
function g_mime_message_partial_get_total(partial:PGMimeMessagePartial):longint;cdecl;external;
function g_mime_message_partial_reconstruct_message(partials:PPGMimeMessagePartial; num:Tsize_t):PGMimeMessage;cdecl;external;
function g_mime_message_partial_split_message(message:PGMimeMessage; max_size:Tsize_t; nparts:Psize_t):^PGMimeMessage;cdecl;external;
{$endif}
{ __GMIME_MESSAGE_PARTIAL_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_MESSAGE_PARTIAL : longint; { return type might be wrong }
  begin
    GMIME_TYPE_MESSAGE_PARTIAL:=g_mime_message_partial_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_PARTIAL(obj : longint) : longint;
begin
  GMIME_MESSAGE_PARTIAL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_MESSAGE_PARTIAL,GMimeMessagePartial);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_PARTIAL_CLASS(klass : longint) : longint;
begin
  GMIME_MESSAGE_PARTIAL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_MESSAGE_PARTIAL,GMimeMessagePartialClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MESSAGE_PARTIAL(obj : longint) : longint;
begin
  GMIME_IS_MESSAGE_PARTIAL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_MESSAGE_PARTIAL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MESSAGE_PARTIAL_CLASS(klass : longint) : longint;
begin
  GMIME_IS_MESSAGE_PARTIAL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_MESSAGE_PARTIAL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_PARTIAL_GET_CLASS(obj : longint) : longint;
begin
  GMIME_MESSAGE_PARTIAL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_MESSAGE_PARTIAL,GMimeMessagePartialClass);
end;


end.
