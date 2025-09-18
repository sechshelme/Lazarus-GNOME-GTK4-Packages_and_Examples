unit gmime_autocrypt_xxxx;

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

// === Konventiert am: 18-9-25 15:25:39 ===


implementation




end.
