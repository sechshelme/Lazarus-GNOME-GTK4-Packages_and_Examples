unit internet_address_xxxxx1;

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
{$ifndef __INTERNET_ADDRESS_H__}
{$define __INTERNET_ADDRESS_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gmime/gmime-format-options.h>}
{$include <gmime/gmime-parser-options.h>}

{ was #define dname def_expr }
function INTERNET_ADDRESS_TYPE_MAILBOX : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function INTERNET_ADDRESS_MAILBOX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function INTERNET_ADDRESS_MAILBOX_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function INTERNET_ADDRESS_IS_MAILBOX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function INTERNET_ADDRESS_IS_MAILBOX_CLASS(klass : longint) : longint;

{ was #define dname def_expr }
function INTERNET_ADDRESS_LIST_TYPE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function INTERNET_ADDRESS_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function INTERNET_ADDRESS_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_INTERNET_ADDRESS_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_INTERNET_ADDRESS_LIST_CLASS(klass : longint) : longint;

type
{*
 * InternetAddress:
 * @parent_object: parent #GObject
 * @charset: the charset used for encoding the name
 * @name: display name
 *
 * An RFC 2822 Address object.
 * }
{ < private >  }
  PInternetAddress = ^TInternetAddress;
  TInternetAddress = record
      parent_object : TGObject;
      charset : Pchar;
      name : Pchar;
      changed : Tgpointer;
    end;

{ public virtual methods  }
  PInternetAddressClass = ^TInternetAddressClass;
  TInternetAddressClass = record
      parent_class : TGObjectClass;
      to_string : procedure (ia:PInternetAddress; options:PGMimeFormatOptions; flags:Tguint32; linelen:Psize_t; str:PGString);cdecl;
    end;


function internet_address_get_type:TGType;cdecl;external libgmime3;
procedure internet_address_set_name(ia:PInternetAddress; name:Pchar);cdecl;external libgmime3;
function internet_address_get_name(ia:PInternetAddress):Pchar;cdecl;external libgmime3;
procedure internet_address_set_charset(ia:PInternetAddress; charset:Pchar);cdecl;external libgmime3;
function internet_address_get_charset(ia:PInternetAddress):Pchar;cdecl;external libgmime3;
function internet_address_to_string(ia:PInternetAddress; options:PGMimeFormatOptions; encode:Tgboolean):Pchar;cdecl;external libgmime3;
{*
 * InternetAddressMailbox:
 * @parent_object: parent #InternetAddress
 * @idn_addr: the ascii-encoded version of @addr
 * @addr: the address string
 * @at: the index of the '@' character
 *
 * An RFC 2822 Mailbox address.
 * }
type
  PInternetAddressMailbox = ^TInternetAddressMailbox;
  TInternetAddressMailbox = record
      parent_object : TInternetAddress;
      idn_addr : Pchar;
      addr : Pchar;
      at : longint;
    end;

  PInternetAddressMailboxClass = ^TInternetAddressMailboxClass;
  TInternetAddressMailboxClass = record
      parent_class : TInternetAddressClass;
    end;


function internet_address_mailbox_get_type:TGType;cdecl;external libgmime3;
function internet_address_mailbox_new(name:Pchar; addr:Pchar):PInternetAddress;cdecl;external libgmime3;
procedure internet_address_mailbox_set_addr(mailbox:PInternetAddressMailbox; addr:Pchar);cdecl;external libgmime3;
function internet_address_mailbox_get_addr(mailbox:PInternetAddressMailbox):Pchar;cdecl;external libgmime3;
function internet_address_mailbox_get_idn_addr(mailbox:PInternetAddressMailbox):Pchar;cdecl;external libgmime3;
{*
 * InternetAddressGroup:
 * @parent_object: parent #InternetAddress
 * @members: a #InternetAddressList of group members
 *
 * An RFC 2822 Group address.
 * }
type
  PInternetAddressGroup = ^TInternetAddressGroup;
  TInternetAddressGroup = record
      parent_object : TInternetAddress;
      members : PInternetAddressList;
    end;

  PInternetAddressGroupClass = ^TInternetAddressGroupClass;
  TInternetAddressGroupClass = record
      parent_class : TInternetAddressClass;
    end;


function internet_address_group_get_type:TGType;cdecl;external libgmime3;
function internet_address_group_new(name:Pchar):PInternetAddress;cdecl;external libgmime3;
procedure internet_address_group_set_members(group:PInternetAddressGroup; members:PInternetAddressList);cdecl;external libgmime3;
function internet_address_group_get_members(group:PInternetAddressGroup):PInternetAddressList;cdecl;external libgmime3;
function internet_address_group_add_member(group:PInternetAddressGroup; member:PInternetAddress):longint;cdecl;external libgmime3;
{*
 * InternetAddressList:
 * @parent_object: parent #GObject
 * @array: The array of #InternetAddress objects.
 *
 * A collection of #InternetAddress objects.
 * }
{ < private >  }
type
  PInternetAddressList = ^TInternetAddressList;
  TInternetAddressList = record
      parent_object : TGObject;
      array : PGPtrArray;
      changed : Tgpointer;
    end;

  PInternetAddressListClass = ^TInternetAddressListClass;
  TInternetAddressListClass = record
      parent_class : TGObjectClass;
    end;


function internet_address_list_get_type:TGType;cdecl;external libgmime3;
function internet_address_list_new:PInternetAddressList;cdecl;external libgmime3;
function internet_address_list_length(list:PInternetAddressList):longint;cdecl;external libgmime3;
procedure internet_address_list_clear(list:PInternetAddressList);cdecl;external libgmime3;
function internet_address_list_add(list:PInternetAddressList; ia:PInternetAddress):longint;cdecl;external libgmime3;
procedure internet_address_list_prepend(list:PInternetAddressList; prepend:PInternetAddressList);cdecl;external libgmime3;
procedure internet_address_list_append(list:PInternetAddressList; append:PInternetAddressList);cdecl;external libgmime3;
procedure internet_address_list_insert(list:PInternetAddressList; index:longint; ia:PInternetAddress);cdecl;external libgmime3;
function internet_address_list_remove(list:PInternetAddressList; ia:PInternetAddress):Tgboolean;cdecl;external libgmime3;
function internet_address_list_remove_at(list:PInternetAddressList; index:longint):Tgboolean;cdecl;external libgmime3;
function internet_address_list_contains(list:PInternetAddressList; ia:PInternetAddress):Tgboolean;cdecl;external libgmime3;
function internet_address_list_index_of(list:PInternetAddressList; ia:PInternetAddress):longint;cdecl;external libgmime3;
function internet_address_list_get_address(list:PInternetAddressList; index:longint):PInternetAddress;cdecl;external libgmime3;
procedure internet_address_list_set_address(list:PInternetAddressList; index:longint; ia:PInternetAddress);cdecl;external libgmime3;
function internet_address_list_to_string(list:PInternetAddressList; options:PGMimeFormatOptions; encode:Tgboolean):Pchar;cdecl;external libgmime3;
procedure internet_address_list_encode(list:PInternetAddressList; options:PGMimeFormatOptions; str:PGString);cdecl;external libgmime3;
function internet_address_list_parse(options:PGMimeParserOptions; str:Pchar):PInternetAddressList;cdecl;external libgmime3;
{$endif}
{ __INTERNET_ADDRESS_H__  }

// === Konventiert am: 18-9-25 15:36:59 ===


implementation


{ was #define dname def_expr }
function INTERNET_ADDRESS_TYPE_MAILBOX : longint; { return type might be wrong }
  begin
    INTERNET_ADDRESS_TYPE_MAILBOX:=internet_address_mailbox_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function INTERNET_ADDRESS_MAILBOX(obj : longint) : longint;
begin
  INTERNET_ADDRESS_MAILBOX:=G_TYPE_CHECK_INSTANCE_CAST(obj,INTERNET_ADDRESS_TYPE_MAILBOX,InternetAddressMailbox);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function INTERNET_ADDRESS_MAILBOX_CLASS(klass : longint) : longint;
begin
  INTERNET_ADDRESS_MAILBOX_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,INTERNET_ADDRESS_TYPE_MAILBOX,InternetAddressMailboxClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function INTERNET_ADDRESS_IS_MAILBOX(obj : longint) : longint;
begin
  INTERNET_ADDRESS_IS_MAILBOX:=G_TYPE_CHECK_INSTANCE_TYPE(obj,INTERNET_ADDRESS_TYPE_MAILBOX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function INTERNET_ADDRESS_IS_MAILBOX_CLASS(klass : longint) : longint;
begin
  INTERNET_ADDRESS_IS_MAILBOX_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,INTERNET_ADDRESS_TYPE_MAILBOX);
end;

{ was #define dname def_expr }
function INTERNET_ADDRESS_LIST_TYPE : longint; { return type might be wrong }
  begin
    INTERNET_ADDRESS_LIST_TYPE:=internet_address_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function INTERNET_ADDRESS_LIST(obj : longint) : longint;
begin
  INTERNET_ADDRESS_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,INTERNET_ADDRESS_LIST_TYPE,InternetAddressList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function INTERNET_ADDRESS_LIST_CLASS(klass : longint) : longint;
begin
  INTERNET_ADDRESS_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,INTERNET_ADDRESS_LIST_TYPE,InternetAddressListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_INTERNET_ADDRESS_LIST(obj : longint) : longint;
begin
  IS_INTERNET_ADDRESS_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,INTERNET_ADDRESS_LIST_TYPE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_INTERNET_ADDRESS_LIST_CLASS(klass : longint) : longint;
begin
  IS_INTERNET_ADDRESS_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,INTERNET_ADDRESS_LIST_TYPE);
end;


end.
