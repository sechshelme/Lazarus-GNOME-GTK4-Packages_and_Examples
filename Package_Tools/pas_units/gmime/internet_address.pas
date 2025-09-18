unit internet_address;

interface

uses
  fp_glib2, fp_gmime3, gmime_format_options;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TInternetAddress = record
    parent_object: TGObject;
    charset: pchar;
    name: pchar;
    changed: Tgpointer;
  end;
  PInternetAddress = ^TInternetAddress;

  TInternetAddressClass = record
    parent_class: TGObjectClass;
    to_string: procedure(ia: PInternetAddress; options: PGMimeFormatOptions; flags: Tguint32; linelen: Psize_t; str: PGString); cdecl;
  end;
  PInternetAddressClass = ^TInternetAddressClass;

function internet_address_get_type: TGType; cdecl; external libgmime3;
procedure internet_address_set_name(ia: PInternetAddress; name: pchar); cdecl; external libgmime3;
function internet_address_get_name(ia: PInternetAddress): pchar; cdecl; external libgmime3;
procedure internet_address_set_charset(ia: PInternetAddress; charset: pchar); cdecl; external libgmime3;
function internet_address_get_charset(ia: PInternetAddress): pchar; cdecl; external libgmime3;
function internet_address_to_string(ia: PInternetAddress; options: PGMimeFormatOptions; encode: Tgboolean): pchar; cdecl; external libgmime3;

type
  TInternetAddressMailbox = record
    parent_object: TInternetAddress;
    idn_addr: pchar;
    addr: pchar;
    at: longint;
  end;
  PInternetAddressMailbox = ^TInternetAddressMailbox;

  TInternetAddressMailboxClass = record
    parent_class: TInternetAddressClass;
  end;
  PInternetAddressMailboxClass = ^TInternetAddressMailboxClass;

function internet_address_mailbox_get_type: TGType; cdecl; external libgmime3;
function internet_address_mailbox_new(name: pchar; addr: pchar): PInternetAddress; cdecl; external libgmime3;
procedure internet_address_mailbox_set_addr(mailbox: PInternetAddressMailbox; addr: pchar); cdecl; external libgmime3;
function internet_address_mailbox_get_addr(mailbox: PInternetAddressMailbox): pchar; cdecl; external libgmime3;
function internet_address_mailbox_get_idn_addr(mailbox: PInternetAddressMailbox): pchar; cdecl; external libgmime3;

type
  TInternetAddressGroup = record
    parent_object: TInternetAddress;
    members: PInternetAddressList;
  end;
  PInternetAddressGroup = ^TInternetAddressGroup;

  TInternetAddressGroupClass = record
    parent_class: TInternetAddressClass;
  end;
  PInternetAddressGroupClass = ^TInternetAddressGroupClass;

function internet_address_group_get_type: TGType; cdecl; external libgmime3;
function internet_address_group_new(name: pchar): PInternetAddress; cdecl; external libgmime3;
procedure internet_address_group_set_members(group: PInternetAddressGroup; members: PInternetAddressList); cdecl; external libgmime3;
function internet_address_group_get_members(group: PInternetAddressGroup): PInternetAddressList; cdecl; external libgmime3;
function internet_address_group_add_member(group: PInternetAddressGroup; member: PInternetAddress): longint; cdecl; external libgmime3;

type
  TInternetAddressList = record
    parent_object: TGObject;
    arr: PGPtrArray;
    changed: Tgpointer;
  end;
  PInternetAddressList = ^TInternetAddressList;

  TInternetAddressListClass = record
    parent_class: TGObjectClass;
  end;
  PInternetAddressListClass = ^TInternetAddressListClass;

function internet_address_list_get_type: TGType; cdecl; external libgmime3;
function internet_address_list_new: PInternetAddressList; cdecl; external libgmime3;
function internet_address_list_length(list: PInternetAddressList): longint; cdecl; external libgmime3;
procedure internet_address_list_clear(list: PInternetAddressList); cdecl; external libgmime3;
function internet_address_list_add(list: PInternetAddressList; ia: PInternetAddress): longint; cdecl; external libgmime3;
procedure internet_address_list_prepend(list: PInternetAddressList; prepend: PInternetAddressList); cdecl; external libgmime3;
procedure internet_address_list_append(list: PInternetAddressList; append: PInternetAddressList); cdecl; external libgmime3;
procedure internet_address_list_insert(list: PInternetAddressList; index: longint; ia: PInternetAddress); cdecl; external libgmime3;
function internet_address_list_remove(list: PInternetAddressList; ia: PInternetAddress): Tgboolean; cdecl; external libgmime3;
function internet_address_list_remove_at(list: PInternetAddressList; index: longint): Tgboolean; cdecl; external libgmime3;
function internet_address_list_contains(list: PInternetAddressList; ia: PInternetAddress): Tgboolean; cdecl; external libgmime3;
function internet_address_list_index_of(list: PInternetAddressList; ia: PInternetAddress): longint; cdecl; external libgmime3;
function internet_address_list_get_address(list: PInternetAddressList; index: longint): PInternetAddress; cdecl; external libgmime3;
procedure internet_address_list_set_address(list: PInternetAddressList; index: longint; ia: PInternetAddress); cdecl; external libgmime3;
function internet_address_list_to_string(list: PInternetAddressList; options: PGMimeFormatOptions; encode: Tgboolean): pchar; cdecl; external libgmime3;
procedure internet_address_list_encode(list: PInternetAddressList; options: PGMimeFormatOptions; str: PGString); cdecl; external libgmime3;
function internet_address_list_parse(options: PGMimeParserOptions; str: pchar): PInternetAddressList; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:35:47 ===

function INTERNET_ADDRESS_TYPE: TGType;
function INTERNET_ADDRESS(obj: Pointer): PInternetAddress;
function INTERNET_ADDRESS_CLASS(klass: Pointer): PInternetAddressClass;
function IS_INTERNET_ADDRESS(obj: Pointer): Tgboolean;
function IS_INTERNET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
function INTERNET_ADDRESS_GET_CLASS(obj: Pointer): PInternetAddressClass;

function INTERNET_ADDRESS_TYPE_GROUP: TGType;
function INTERNET_ADDRESS_GROUP(obj: Pointer): PInternetAddressGroup;
function INTERNET_ADDRESS_GROUP_CLASS(klass: Pointer): PInternetAddressGroupClass;
function INTERNET_ADDRESS_IS_GROUP(obj: Pointer): Tgboolean;
function INTERNET_ADDRESS_IS_GROUP_CLASS(klass: Pointer): Tgboolean;

function INTERNET_ADDRESS_TYPE_MAILBOX: TGType;
function INTERNET_ADDRESS_MAILBOX(obj: Pointer): PInternetAddressMailbox;
function INTERNET_ADDRESS_MAILBOX_CLASS(klass: Pointer): PInternetAddressMailboxClass;
function INTERNET_ADDRESS_IS_MAILBOX(obj: Pointer): Tgboolean;
function INTERNET_ADDRESS_IS_MAILBOX_CLASS(klass: Pointer): Tgboolean;

function INTERNET_ADDRESS_LIST_TYPE: TGType;
function INTERNET_ADDRESS_LIST(obj: Pointer): PInternetAddressList;
function INTERNET_ADDRESS_LIST_CLASS(klass: Pointer): PInternetAddressListClass;
function IS_INTERNET_ADDRESS_LIST(obj: Pointer): Tgboolean;
function IS_INTERNET_ADDRESS_LIST_CLASS(klass: Pointer): Tgboolean;

implementation

function INTERNET_ADDRESS_TYPE: TGType;
begin
  INTERNET_ADDRESS_TYPE := internet_address_get_type;
end;

function INTERNET_ADDRESS(obj: Pointer): PInternetAddress;
begin
  Result := PInternetAddress(g_type_check_instance_cast(obj, INTERNET_ADDRESS_TYPE));
end;

function INTERNET_ADDRESS_CLASS(klass: Pointer): PInternetAddressClass;
begin
  Result := PInternetAddressClass(g_type_check_class_cast(klass, INTERNET_ADDRESS_TYPE));
end;

function IS_INTERNET_ADDRESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, INTERNET_ADDRESS_TYPE);
end;

function IS_INTERNET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, INTERNET_ADDRESS_TYPE);
end;

function INTERNET_ADDRESS_GET_CLASS(obj: Pointer): PInternetAddressClass;
begin
  Result := PInternetAddressClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function INTERNET_ADDRESS_TYPE_GROUP: TGType;
begin
  INTERNET_ADDRESS_TYPE_GROUP := internet_address_group_get_type;
end;

function INTERNET_ADDRESS_GROUP(obj: Pointer): PInternetAddressGroup;
begin
  Result := PInternetAddressGroup(g_type_check_instance_cast(obj, INTERNET_ADDRESS_TYPE_GROUP));
end;

function INTERNET_ADDRESS_GROUP_CLASS(klass: Pointer): PInternetAddressGroupClass;
begin
  Result := PInternetAddressGroupClass(g_type_check_class_cast(klass, INTERNET_ADDRESS_TYPE_GROUP));
end;

function INTERNET_ADDRESS_IS_GROUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, INTERNET_ADDRESS_TYPE_GROUP);
end;

function INTERNET_ADDRESS_IS_GROUP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, INTERNET_ADDRESS_TYPE_GROUP);
end;

// ====

function INTERNET_ADDRESS_TYPE_MAILBOX: TGType;
begin
  INTERNET_ADDRESS_TYPE_MAILBOX := internet_address_mailbox_get_type;
end;

function INTERNET_ADDRESS_MAILBOX(obj: Pointer): PInternetAddressMailbox;
begin
  Result := PInternetAddressMailbox(g_type_check_instance_cast(obj, INTERNET_ADDRESS_TYPE_MAILBOX));
end;

function INTERNET_ADDRESS_MAILBOX_CLASS(klass: Pointer): PInternetAddressMailboxClass;
begin
  Result := PInternetAddressMailboxClass(g_type_check_class_cast(klass, INTERNET_ADDRESS_TYPE_MAILBOX));
end;

function INTERNET_ADDRESS_IS_MAILBOX(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, INTERNET_ADDRESS_TYPE_MAILBOX);
end;

function INTERNET_ADDRESS_IS_MAILBOX_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, INTERNET_ADDRESS_TYPE_MAILBOX);
end;

// ====

function INTERNET_ADDRESS_LIST_TYPE: TGType;
begin
  INTERNET_ADDRESS_LIST_TYPE := internet_address_list_get_type;
end;

function INTERNET_ADDRESS_LIST(obj: Pointer): PInternetAddressList;
begin
  Result := PInternetAddressList(g_type_check_instance_cast(obj, INTERNET_ADDRESS_LIST_TYPE));
end;

function INTERNET_ADDRESS_LIST_CLASS(klass: Pointer): PInternetAddressListClass;
begin
  Result := PInternetAddressListClass(g_type_check_class_cast(klass, INTERNET_ADDRESS_LIST_TYPE));
end;

function IS_INTERNET_ADDRESS_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, INTERNET_ADDRESS_LIST_TYPE);
end;

function IS_INTERNET_ADDRESS_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, INTERNET_ADDRESS_LIST_TYPE);
end;



end.
