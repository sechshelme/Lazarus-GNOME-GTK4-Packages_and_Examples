unit internet_address_xxxxx3;

interface

uses
  fp_glib2, fp_gmime3;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  TInternetAddress = record
      parent_object : TGObject;
      charset : Pchar;
      name : Pchar;
      changed : Tgpointer;
    end;
  PInternetAddress = ^TInternetAddress;

  TInternetAddressClass = record
      parent_class : TGObjectClass;
      to_string : procedure (ia:PInternetAddress; options:PGMimeFormatOptions; flags:Tguint32; linelen:Psize_t; str:PGString);cdecl;
    end;
  PInternetAddressClass = ^TInternetAddressClass;

function internet_address_get_type:TGType;cdecl;external libgmime3;
procedure internet_address_set_name(ia:PInternetAddress; name:Pchar);cdecl;external libgmime3;
function internet_address_get_name(ia:PInternetAddress):Pchar;cdecl;external libgmime3;
procedure internet_address_set_charset(ia:PInternetAddress; charset:Pchar);cdecl;external libgmime3;
function internet_address_get_charset(ia:PInternetAddress):Pchar;cdecl;external libgmime3;
function internet_address_to_string(ia:PInternetAddress; options:PGMimeFormatOptions; encode:Tgboolean):Pchar;cdecl;external libgmime3;
type
  TInternetAddressMailbox = record
      parent_object : TInternetAddress;
      idn_addr : Pchar;
      addr : Pchar;
      at : longint;
    end;
  PInternetAddressMailbox = ^TInternetAddressMailbox;

  TInternetAddressMailboxClass = record
      parent_class : TInternetAddressClass;
    end;
  PInternetAddressMailboxClass = ^TInternetAddressMailboxClass;

function internet_address_mailbox_get_type:TGType;cdecl;external libgmime3;
function internet_address_mailbox_new(name:Pchar; addr:Pchar):PInternetAddress;cdecl;external libgmime3;
procedure internet_address_mailbox_set_addr(mailbox:PInternetAddressMailbox; addr:Pchar);cdecl;external libgmime3;
function internet_address_mailbox_get_addr(mailbox:PInternetAddressMailbox):Pchar;cdecl;external libgmime3;
function internet_address_mailbox_get_idn_addr(mailbox:PInternetAddressMailbox):Pchar;cdecl;external libgmime3;
type
  TInternetAddressGroup = record
      parent_object : TInternetAddress;
      members : PInternetAddressList;
    end;
  PInternetAddressGroup = ^TInternetAddressGroup;

  TInternetAddressGroupClass = record
      parent_class : TInternetAddressClass;
    end;
  PInternetAddressGroupClass = ^TInternetAddressGroupClass;

function internet_address_group_get_type:TGType;cdecl;external libgmime3;
function internet_address_group_new(name:Pchar):PInternetAddress;cdecl;external libgmime3;
procedure internet_address_group_set_members(group:PInternetAddressGroup; members:PInternetAddressList);cdecl;external libgmime3;
function internet_address_group_get_members(group:PInternetAddressGroup):PInternetAddressList;cdecl;external libgmime3;
function internet_address_group_add_member(group:PInternetAddressGroup; member:PInternetAddress):longint;cdecl;external libgmime3;
type
  TInternetAddressList = record
      parent_object : TGObject;
      arr : PGPtrArray;
      changed : Tgpointer;
    end;
  PInternetAddressList = ^TInternetAddressList;

  TInternetAddressListClass = record
      parent_class : TGObjectClass;
    end;
  PInternetAddressListClass = ^TInternetAddressListClass;

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

// === Konventiert am: 18-9-25 15:37:09 ===


implementation




end.
