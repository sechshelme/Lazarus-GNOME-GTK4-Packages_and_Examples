
unit gmime_message;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_message.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_message.h
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
PGDateTime  = ^GDateTime;
PGError  = ^GError;
PGMimeAddressType  = ^GMimeAddressType;
PGMimeAutocryptHeader  = ^GMimeAutocryptHeader;
PGMimeAutocryptHeaderList  = ^GMimeAutocryptHeaderList;
PGMimeMessage  = ^GMimeMessage;
PGMimeMessageClass  = ^GMimeMessageClass;
PGMimeObject  = ^GMimeObject;
PInternetAddressList  = ^InternetAddressList;
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
{$ifndef __GMIME_MESSAGE_H__}
{$define __GMIME_MESSAGE_H__}
{$include <stdarg.h>}
{$include <time.h>}
{$include <gmime/internet-address.h>}
{$include <gmime/gmime-encodings.h>}
{$include <gmime/gmime-object.h>}
{$include <gmime/gmime-header.h>}
{$include <gmime/gmime-stream.h>}
{$include <gmime/gmime-autocrypt.h>}
{$include <gmime/gmime-crypto-context.h>}

{ was #define dname def_expr }
function GMIME_TYPE_MESSAGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MESSAGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MESSAGE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeAddressType:
 * @GMIME_ADDRESS_TYPE_SENDER: Represents the addresses in the Sender header.
 * @GMIME_ADDRESS_TYPE_FROM: Represents the addresses in the From header.
 * @GMIME_ADDRESS_TYPE_REPLY_TO: Represents the addresses in the Reply-To header.
 * @GMIME_ADDRESS_TYPE_TO: Represents the recipients in the To header.
 * @GMIME_ADDRESS_TYPE_CC: Represents the recipients in the Cc header.
 * @GMIME_ADDRESS_TYPE_BCC: Represents the recipients in the Bcc header.
 *
 * An address type.
 * }

  PGMimeAddressType = ^TGMimeAddressType;
  TGMimeAddressType =  Longint;
  Const
    GMIME_ADDRESS_TYPE_SENDER = 0;
    GMIME_ADDRESS_TYPE_FROM = 1;
    GMIME_ADDRESS_TYPE_REPLY_TO = 2;
    GMIME_ADDRESS_TYPE_TO = 3;
    GMIME_ADDRESS_TYPE_CC = 4;
    GMIME_ADDRESS_TYPE_BCC = 5;
;
{*
 * GMimeMessage:
 * @parent_object: parent #GMimeObject
 * @addrlists: a table of address lists
 * @mime_part: toplevel MIME part
 * @message_id: Message-Id string
 * @date: Date value
 * @subject: Subject string
 *
 * A MIME Message object.
 * }
{ <private>  }
type
  PGMimeMessage = ^TGMimeMessage;
  TGMimeMessage = record
      parent_object : TGMimeObject;
      addrlists : ^PInternetAddressList;
      mime_part : PGMimeObject;
      message_id : Pchar;
      date : PGDateTime;
      subject : Pchar;
      marker : Pchar;
    end;

  PGMimeMessageClass = ^TGMimeMessageClass;
  TGMimeMessageClass = record
      parent_class : TGMimeObjectClass;
    end;


function g_mime_message_get_type:TGType;cdecl;external;
function g_mime_message_new(pretty_headers:Tgboolean):PGMimeMessage;cdecl;external;
function g_mime_message_get_from(message:PGMimeMessage):PInternetAddressList;cdecl;external;
function g_mime_message_get_sender(message:PGMimeMessage):PInternetAddressList;cdecl;external;
function g_mime_message_get_reply_to(message:PGMimeMessage):PInternetAddressList;cdecl;external;
function g_mime_message_get_to(message:PGMimeMessage):PInternetAddressList;cdecl;external;
function g_mime_message_get_cc(message:PGMimeMessage):PInternetAddressList;cdecl;external;
function g_mime_message_get_bcc(message:PGMimeMessage):PInternetAddressList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_mime_message_add_mailbox(message:PGMimeMessage; _type:TGMimeAddressType; name:Pchar; addr:Pchar);cdecl;external;
function g_mime_message_get_addresses(message:PGMimeMessage; _type:TGMimeAddressType):PInternetAddressList;cdecl;external;
function g_mime_message_get_all_recipients(message:PGMimeMessage):PInternetAddressList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_mime_message_set_subject(message:PGMimeMessage; subject:Pchar; charset:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_message_get_subject(message:PGMimeMessage):Pchar;cdecl;external;
procedure g_mime_message_set_date(message:PGMimeMessage; date:PGDateTime);cdecl;external;
function g_mime_message_get_date(message:PGMimeMessage):PGDateTime;cdecl;external;
(* Const before type ignored *)
procedure g_mime_message_set_message_id(message:PGMimeMessage; message_id:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_message_get_message_id(message:PGMimeMessage):Pchar;cdecl;external;
function g_mime_message_get_mime_part(message:PGMimeMessage):PGMimeObject;cdecl;external;
procedure g_mime_message_set_mime_part(message:PGMimeMessage; mime_part:PGMimeObject);cdecl;external;
function g_mime_message_get_autocrypt_header(message:PGMimeMessage; now:PGDateTime):PGMimeAutocryptHeader;cdecl;external;
(* Const before type ignored *)
function g_mime_message_get_autocrypt_gossip_headers(message:PGMimeMessage; now:PGDateTime; flags:TGMimeDecryptFlags; session_key:Pchar; err:PPGError):PGMimeAutocryptHeaderList;cdecl;external;
function g_mime_message_get_autocrypt_gossip_headers_from_inner_part(message:PGMimeMessage; now:PGDateTime; inner_part:PGMimeObject):PGMimeAutocryptHeaderList;cdecl;external;
{ convenience functions  }
procedure g_mime_message_foreach(message:PGMimeMessage; callback:TGMimeObjectForeachFunc; user_data:Tgpointer);cdecl;external;
function g_mime_message_get_body(message:PGMimeMessage):PGMimeObject;cdecl;external;
{$endif}
{ __GMIME_MESSAGE_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_MESSAGE : longint; { return type might be wrong }
  begin
    GMIME_TYPE_MESSAGE:=g_mime_message_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE(obj : longint) : longint;
begin
  GMIME_MESSAGE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_MESSAGE,GMimeMessage);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_CLASS(klass : longint) : longint;
begin
  GMIME_MESSAGE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_MESSAGE,GMimeMessageClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MESSAGE(obj : longint) : longint;
begin
  GMIME_IS_MESSAGE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_MESSAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MESSAGE_CLASS(klass : longint) : longint;
begin
  GMIME_IS_MESSAGE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_MESSAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MESSAGE_GET_CLASS(obj : longint) : longint;
begin
  GMIME_MESSAGE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_MESSAGE,GMimeMessageClass);
end;


end.
