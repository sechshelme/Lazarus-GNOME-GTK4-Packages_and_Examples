
unit gmime_autocrypt;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_autocrypt.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_autocrypt.h
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
PGBytes  = ^GBytes;
PGDateTime  = ^GDateTime;
PGMimeAutocryptHeader  = ^GMimeAutocryptHeader;
PGMimeAutocryptHeaderClass  = ^GMimeAutocryptHeaderClass;
PGMimeAutocryptHeaderList  = ^GMimeAutocryptHeaderList;
PGMimeAutocryptHeaderListClass  = ^GMimeAutocryptHeaderListClass;
PGMimeAutocryptPreferEncrypt  = ^GMimeAutocryptPreferEncrypt;
PGPtrArray  = ^GPtrArray;
PInternetAddressList  = ^InternetAddressList;
PInternetAddressMailbox  = ^InternetAddressMailbox;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime Autocrypt
 *  Copyright (C) 2017 Daniel Kahn Gillmor
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
{$ifndef __GMIME_AUTOCRYPT_H__}
{$define __GMIME_AUTOCRYPT_H__}
{$include <glib.h>}
{$include <glib/gprintf.h>}
{$include <glib-object.h>}
{$include <gmime/internet-address.h>}

{ was #define dname def_expr }
function GMIME_TYPE_AUTOCRYPT_HEADER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_AUTOCRYPT_HEADER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_AUTOCRYPT_HEADER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_AUTOCRYPT_HEADER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_AUTOCRYPT_HEADER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_AUTOCRYPT_HEADER_GET_CLASS(obj : longint) : longint;

{ was #define dname def_expr }
function GMIME_TYPE_AUTOCRYPT_HEADER_LIST : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_AUTOCRYPT_HEADER_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_AUTOCRYPT_HEADER_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_AUTOCRYPT_HEADER_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_AUTOCRYPT_HEADER_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_AUTOCRYPT_HEADER_LIST_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeAutocryptPreferEncrypt:
 * @GMIME_AUTOCRYPT_PREFER_ENCRYPT_NONE: No preference stated.
 * @GMIME_AUTOCRYPT_PREFER_ENCRYPT_MUTUAL: Please encrypt, if you also have this preference
 *
 * A description of the user's preference for encrypted messaging.
 * }

  PGMimeAutocryptPreferEncrypt = ^TGMimeAutocryptPreferEncrypt;
  TGMimeAutocryptPreferEncrypt =  Longint;
  Const
    GMIME_AUTOCRYPT_PREFER_ENCRYPT_NONE = 0;
    GMIME_AUTOCRYPT_PREFER_ENCRYPT_MUTUAL = 1;
;
{*
 * GMimeAutocryptHeader:
 * @parent_object: parent #GObject
 * @address: the #InternetAddressMailbox associated with this Autocrypt header.
 * @prefer_encrypt: a #GMimeAutocryptPreferEncrypt value (defaults to @GMIME_AUTOCRYPT_PREFER_ENCRYPT_NONE).
 * @keydata: the raw binary form of the encoded key.
 * @effective_date: the date associated with the Autocrypt header in this message.
 *
 * An object containing Autocrypt information about a given e-mail
 * address, as derived from a message header.
 *
 * See https://autocrypt.org/ for details and motivation.
 * }
type
  PGMimeAutocryptHeader = ^TGMimeAutocryptHeader;
  TGMimeAutocryptHeader = record
      parent_object : TGObject;
      address : PInternetAddressMailbox;
      prefer_encrypt : TGMimeAutocryptPreferEncrypt;
      keydata : PGBytes;
      effective_date : PGDateTime;
    end;

  PGMimeAutocryptHeaderClass = ^TGMimeAutocryptHeaderClass;
  TGMimeAutocryptHeaderClass = record
      parent_class : TGObjectClass;
    end;


function g_mime_autocrypt_header_get_type:TGType;cdecl;external;
function g_mime_autocrypt_header_new:PGMimeAutocryptHeader;cdecl;external;
(* Const before type ignored *)
function g_mime_autocrypt_header_new_from_string(_string:Pchar):PGMimeAutocryptHeader;cdecl;external;
procedure g_mime_autocrypt_header_set_address(ah:PGMimeAutocryptHeader; address:PInternetAddressMailbox);cdecl;external;
function g_mime_autocrypt_header_get_address(ah:PGMimeAutocryptHeader):PInternetAddressMailbox;cdecl;external;
(* Const before type ignored *)
procedure g_mime_autocrypt_header_set_address_from_string(ah:PGMimeAutocryptHeader; address:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_autocrypt_header_get_address_as_string(ah:PGMimeAutocryptHeader):Pchar;cdecl;external;
procedure g_mime_autocrypt_header_set_prefer_encrypt(ah:PGMimeAutocryptHeader; pref:TGMimeAutocryptPreferEncrypt);cdecl;external;
function g_mime_autocrypt_header_get_prefer_encrypt(ah:PGMimeAutocryptHeader):TGMimeAutocryptPreferEncrypt;cdecl;external;
procedure g_mime_autocrypt_header_set_keydata(ah:PGMimeAutocryptHeader; keydata:PGBytes);cdecl;external;
function g_mime_autocrypt_header_get_keydata(ah:PGMimeAutocryptHeader):PGBytes;cdecl;external;
procedure g_mime_autocrypt_header_set_effective_date(ah:PGMimeAutocryptHeader; effective_date:PGDateTime);cdecl;external;
function g_mime_autocrypt_header_get_effective_date(ah:PGMimeAutocryptHeader):PGDateTime;cdecl;external;
function g_mime_autocrypt_header_to_string(ah:PGMimeAutocryptHeader; gossip:Tgboolean):Pchar;cdecl;external;
function g_mime_autocrypt_header_is_complete(ah:PGMimeAutocryptHeader):Tgboolean;cdecl;external;
function g_mime_autocrypt_header_compare(ah1:PGMimeAutocryptHeader; ah2:PGMimeAutocryptHeader):longint;cdecl;external;
procedure g_mime_autocrypt_header_clone(dst:PGMimeAutocryptHeader; src:PGMimeAutocryptHeader);cdecl;external;
{*
 * GMimeAutocryptHeaderList:
 * @parent_object: parent #GObject
 * @array: Array of #GMimeAutocryptHeader items.
 *
 * A list of Autocrypt headers, typically extracted from a GMimeMessage.
 * }
{ < private >  }
type
  PGMimeAutocryptHeaderList = ^TGMimeAutocryptHeaderList;
  TGMimeAutocryptHeaderList = record
      parent_object : TGObject;
      array : PGPtrArray;
    end;

  PGMimeAutocryptHeaderListClass = ^TGMimeAutocryptHeaderListClass;
  TGMimeAutocryptHeaderListClass = record
      parent_class : TGObjectClass;
    end;


function g_mime_autocrypt_header_list_get_type:TGType;cdecl;external;
function g_mime_autocrypt_header_list_new:PGMimeAutocryptHeaderList;cdecl;external;
function g_mime_autocrypt_header_list_add_missing_addresses(list:PGMimeAutocryptHeaderList; addresses:PInternetAddressList):Tguint;cdecl;external;
procedure g_mime_autocrypt_header_list_add(list:PGMimeAutocryptHeaderList; header:PGMimeAutocryptHeader);cdecl;external;
function g_mime_autocrypt_header_list_get_count(list:PGMimeAutocryptHeaderList):Tguint;cdecl;external;
function g_mime_autocrypt_header_list_get_header_at(list:PGMimeAutocryptHeaderList; index:Tguint):PGMimeAutocryptHeader;cdecl;external;
function g_mime_autocrypt_header_list_get_header_for_address(list:PGMimeAutocryptHeaderList; mailbox:PInternetAddressMailbox):PGMimeAutocryptHeader;cdecl;external;
procedure g_mime_autocrypt_header_list_remove_incomplete(list:PGMimeAutocryptHeaderList);cdecl;external;
{$endif}
{ __GMIME_AUTOCRYPT_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_AUTOCRYPT_HEADER : longint; { return type might be wrong }
  begin
    GMIME_TYPE_AUTOCRYPT_HEADER:=g_mime_autocrypt_header_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_AUTOCRYPT_HEADER(obj : longint) : longint;
begin
  GMIME_AUTOCRYPT_HEADER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_AUTOCRYPT_HEADER,GMimeAutocryptHeader);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_AUTOCRYPT_HEADER_CLASS(klass : longint) : longint;
begin
  GMIME_AUTOCRYPT_HEADER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_AUTOCRYPT_HEADER,GMimeAutocryptHeaderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_AUTOCRYPT_HEADER(obj : longint) : longint;
begin
  GMIME_IS_AUTOCRYPT_HEADER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_AUTOCRYPT_HEADER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_AUTOCRYPT_HEADER_CLASS(klass : longint) : longint;
begin
  GMIME_IS_AUTOCRYPT_HEADER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_AUTOCRYPT_HEADER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_AUTOCRYPT_HEADER_GET_CLASS(obj : longint) : longint;
begin
  GMIME_AUTOCRYPT_HEADER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_AUTOCRYPT_HEADER,GMimeAutocryptHeaderClass);
end;

{ was #define dname def_expr }
function GMIME_TYPE_AUTOCRYPT_HEADER_LIST : longint; { return type might be wrong }
  begin
    GMIME_TYPE_AUTOCRYPT_HEADER_LIST:=g_mime_autocrypt_header_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_AUTOCRYPT_HEADER_LIST(obj : longint) : longint;
begin
  GMIME_AUTOCRYPT_HEADER_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_AUTOCRYPT_HEADER_LIST,GMimeAutocryptHeaderList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_AUTOCRYPT_HEADER_LIST_CLASS(klass : longint) : longint;
begin
  GMIME_AUTOCRYPT_HEADER_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_AUTOCRYPT_HEADER_LIST,GMimeAutocryptHeaderListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_AUTOCRYPT_HEADER_LIST(obj : longint) : longint;
begin
  GMIME_IS_AUTOCRYPT_HEADER_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_AUTOCRYPT_HEADER_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_AUTOCRYPT_HEADER_LIST_CLASS(klass : longint) : longint;
begin
  GMIME_IS_AUTOCRYPT_HEADER_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_AUTOCRYPT_HEADER_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_AUTOCRYPT_HEADER_LIST_GET_CLASS(obj : longint) : longint;
begin
  GMIME_AUTOCRYPT_HEADER_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_AUTOCRYPT_HEADER_LIST,GMimeAutocryptHeaderListClass);
end;


end.
