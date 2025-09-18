unit gmime_autocrypt;

interface

uses
  fp_glib2, fp_gmime3;

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


function g_mime_autocrypt_header_get_type:TGType;cdecl;external libgmime3;
function g_mime_autocrypt_header_new:PGMimeAutocryptHeader;cdecl;external libgmime3;
function g_mime_autocrypt_header_new_from_string(_string:Pchar):PGMimeAutocryptHeader;cdecl;external libgmime3;
procedure g_mime_autocrypt_header_set_address(ah:PGMimeAutocryptHeader; address:PInternetAddressMailbox);cdecl;external libgmime3;
function g_mime_autocrypt_header_get_address(ah:PGMimeAutocryptHeader):PInternetAddressMailbox;cdecl;external libgmime3;
procedure g_mime_autocrypt_header_set_address_from_string(ah:PGMimeAutocryptHeader; address:Pchar);cdecl;external libgmime3;
function g_mime_autocrypt_header_get_address_as_string(ah:PGMimeAutocryptHeader):Pchar;cdecl;external libgmime3;
procedure g_mime_autocrypt_header_set_prefer_encrypt(ah:PGMimeAutocryptHeader; pref:TGMimeAutocryptPreferEncrypt);cdecl;external libgmime3;
function g_mime_autocrypt_header_get_prefer_encrypt(ah:PGMimeAutocryptHeader):TGMimeAutocryptPreferEncrypt;cdecl;external libgmime3;
procedure g_mime_autocrypt_header_set_keydata(ah:PGMimeAutocryptHeader; keydata:PGBytes);cdecl;external libgmime3;
function g_mime_autocrypt_header_get_keydata(ah:PGMimeAutocryptHeader):PGBytes;cdecl;external libgmime3;
procedure g_mime_autocrypt_header_set_effective_date(ah:PGMimeAutocryptHeader; effective_date:PGDateTime);cdecl;external libgmime3;
function g_mime_autocrypt_header_get_effective_date(ah:PGMimeAutocryptHeader):PGDateTime;cdecl;external libgmime3;
function g_mime_autocrypt_header_to_string(ah:PGMimeAutocryptHeader; gossip:Tgboolean):Pchar;cdecl;external libgmime3;
function g_mime_autocrypt_header_is_complete(ah:PGMimeAutocryptHeader):Tgboolean;cdecl;external libgmime3;
function g_mime_autocrypt_header_compare(ah1:PGMimeAutocryptHeader; ah2:PGMimeAutocryptHeader):longint;cdecl;external libgmime3;
procedure g_mime_autocrypt_header_clone(dst:PGMimeAutocryptHeader; src:PGMimeAutocryptHeader);cdecl;external libgmime3;
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


function g_mime_autocrypt_header_list_get_type:TGType;cdecl;external libgmime3;
function g_mime_autocrypt_header_list_new:PGMimeAutocryptHeaderList;cdecl;external libgmime3;
function g_mime_autocrypt_header_list_add_missing_addresses(list:PGMimeAutocryptHeaderList; addresses:PInternetAddressList):Tguint;cdecl;external libgmime3;
procedure g_mime_autocrypt_header_list_add(list:PGMimeAutocryptHeaderList; header:PGMimeAutocryptHeader);cdecl;external libgmime3;
function g_mime_autocrypt_header_list_get_count(list:PGMimeAutocryptHeaderList):Tguint;cdecl;external libgmime3;
function g_mime_autocrypt_header_list_get_header_at(list:PGMimeAutocryptHeaderList; index:Tguint):PGMimeAutocryptHeader;cdecl;external libgmime3;
function g_mime_autocrypt_header_list_get_header_for_address(list:PGMimeAutocryptHeaderList; mailbox:PInternetAddressMailbox):PGMimeAutocryptHeader;cdecl;external libgmime3;
procedure g_mime_autocrypt_header_list_remove_incomplete(list:PGMimeAutocryptHeaderList);cdecl;external libgmime3;
{$endif}
{ __GMIME_AUTOCRYPT_H__  }

// === Konventiert am: 18-9-25 15:25:34 ===

function GMIME_TYPE_AUTOCRYPT_HEADER : TGType;
function GMIME_AUTOCRYPT_HEADER(obj : Pointer) : PGMimeAutocryptHeader;
function GMIME_AUTOCRYPT_HEADER_CLASS(klass : Pointer) : PGMimeAutocryptHeaderClass;
function GMIME_IS_AUTOCRYPT_HEADER(obj : Pointer) : Tgboolean;
function GMIME_IS_AUTOCRYPT_HEADER_CLASS(klass : Pointer) : Tgboolean;
function GMIME_AUTOCRYPT_HEADER_GET_CLASS(obj : Pointer) : PGMimeAutocryptHeaderClass;

implementation

function GMIME_TYPE_AUTOCRYPT_HEADER : TGType;
  begin
    GMIME_TYPE_AUTOCRYPT_HEADER:=g_mime_autocrypt_header_get_type;
  end;

function GMIME_AUTOCRYPT_HEADER(obj : Pointer) : PGMimeAutocryptHeader;
begin
  Result := PGMimeAutocryptHeader(g_type_check_instance_cast(obj, GMIME_TYPE_AUTOCRYPT_HEADER));
end;

function GMIME_AUTOCRYPT_HEADER_CLASS(klass : Pointer) : PGMimeAutocryptHeaderClass;
begin
  Result := PGMimeAutocryptHeaderClass(g_type_check_class_cast(klass, GMIME_TYPE_AUTOCRYPT_HEADER));
end;

function GMIME_IS_AUTOCRYPT_HEADER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_AUTOCRYPT_HEADER);
end;

function GMIME_IS_AUTOCRYPT_HEADER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_AUTOCRYPT_HEADER);
end;

function GMIME_AUTOCRYPT_HEADER_GET_CLASS(obj : Pointer) : PGMimeAutocryptHeaderClass;
begin
  Result := PGMimeAutocryptHeaderClass(PGTypeInstance(obj)^.g_class);
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
