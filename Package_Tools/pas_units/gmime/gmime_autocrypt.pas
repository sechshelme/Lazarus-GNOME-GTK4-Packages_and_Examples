unit gmime_autocrypt;

interface

uses
  fp_glib2, fp_gmime3, internet_address;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGMimeAutocryptPreferEncrypt = ^TGMimeAutocryptPreferEncrypt;
  TGMimeAutocryptPreferEncrypt = longint;

const
  GMIME_AUTOCRYPT_PREFER_ENCRYPT_NONE = 0;
  GMIME_AUTOCRYPT_PREFER_ENCRYPT_MUTUAL = 1;

type
  TGMimeAutocryptHeader = record
    parent_object: TGObject;
    address: PInternetAddressMailbox;
    prefer_encrypt: TGMimeAutocryptPreferEncrypt;
    keydata: PGBytes;
    effective_date: PGDateTime;
  end;
  PGMimeAutocryptHeader = ^TGMimeAutocryptHeader;

  TGMimeAutocryptHeaderClass = record
    parent_class: TGObjectClass;
  end;
  PGMimeAutocryptHeaderClass = ^TGMimeAutocryptHeaderClass;

function g_mime_autocrypt_header_get_type: TGType; cdecl; external libgmime3;
function g_mime_autocrypt_header_new: PGMimeAutocryptHeader; cdecl; external libgmime3;
function g_mime_autocrypt_header_new_from_string(_string: pchar): PGMimeAutocryptHeader; cdecl; external libgmime3;
procedure g_mime_autocrypt_header_set_address(ah: PGMimeAutocryptHeader; address: PInternetAddressMailbox); cdecl; external libgmime3;
function g_mime_autocrypt_header_get_address(ah: PGMimeAutocryptHeader): PInternetAddressMailbox; cdecl; external libgmime3;
procedure g_mime_autocrypt_header_set_address_from_string(ah: PGMimeAutocryptHeader; address: pchar); cdecl; external libgmime3;
function g_mime_autocrypt_header_get_address_as_string(ah: PGMimeAutocryptHeader): pchar; cdecl; external libgmime3;
procedure g_mime_autocrypt_header_set_prefer_encrypt(ah: PGMimeAutocryptHeader; pref: TGMimeAutocryptPreferEncrypt); cdecl; external libgmime3;
function g_mime_autocrypt_header_get_prefer_encrypt(ah: PGMimeAutocryptHeader): TGMimeAutocryptPreferEncrypt; cdecl; external libgmime3;
procedure g_mime_autocrypt_header_set_keydata(ah: PGMimeAutocryptHeader; keydata: PGBytes); cdecl; external libgmime3;
function g_mime_autocrypt_header_get_keydata(ah: PGMimeAutocryptHeader): PGBytes; cdecl; external libgmime3;
procedure g_mime_autocrypt_header_set_effective_date(ah: PGMimeAutocryptHeader; effective_date: PGDateTime); cdecl; external libgmime3;
function g_mime_autocrypt_header_get_effective_date(ah: PGMimeAutocryptHeader): PGDateTime; cdecl; external libgmime3;
function g_mime_autocrypt_header_to_string(ah: PGMimeAutocryptHeader; gossip: Tgboolean): pchar; cdecl; external libgmime3;
function g_mime_autocrypt_header_is_complete(ah: PGMimeAutocryptHeader): Tgboolean; cdecl; external libgmime3;
function g_mime_autocrypt_header_compare(ah1: PGMimeAutocryptHeader; ah2: PGMimeAutocryptHeader): longint; cdecl; external libgmime3;
procedure g_mime_autocrypt_header_clone(dst: PGMimeAutocryptHeader; src: PGMimeAutocryptHeader); cdecl; external libgmime3;

type
  TGMimeAutocryptHeaderList = record
    parent_object: TGObject;
    arr: PGPtrArray;
  end;
  PGMimeAutocryptHeaderList = ^TGMimeAutocryptHeaderList;

  TGMimeAutocryptHeaderListClass = record
    parent_class: TGObjectClass;
  end;
  PGMimeAutocryptHeaderListClass = ^TGMimeAutocryptHeaderListClass;

function g_mime_autocrypt_header_list_get_type: TGType; cdecl; external libgmime3;
function g_mime_autocrypt_header_list_new: PGMimeAutocryptHeaderList; cdecl; external libgmime3;
function g_mime_autocrypt_header_list_add_missing_addresses(list: PGMimeAutocryptHeaderList; addresses: PInternetAddressList): Tguint; cdecl; external libgmime3;
procedure g_mime_autocrypt_header_list_add(list: PGMimeAutocryptHeaderList; header: PGMimeAutocryptHeader); cdecl; external libgmime3;
function g_mime_autocrypt_header_list_get_count(list: PGMimeAutocryptHeaderList): Tguint; cdecl; external libgmime3;
function g_mime_autocrypt_header_list_get_header_at(list: PGMimeAutocryptHeaderList; index: Tguint): PGMimeAutocryptHeader; cdecl; external libgmime3;
function g_mime_autocrypt_header_list_get_header_for_address(list: PGMimeAutocryptHeaderList; mailbox: PInternetAddressMailbox): PGMimeAutocryptHeader; cdecl; external libgmime3;
procedure g_mime_autocrypt_header_list_remove_incomplete(list: PGMimeAutocryptHeaderList); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:25:34 ===

function GMIME_TYPE_AUTOCRYPT_HEADER: TGType;
function GMIME_AUTOCRYPT_HEADER(obj: Pointer): PGMimeAutocryptHeader;
function GMIME_AUTOCRYPT_HEADER_CLASS(klass: Pointer): PGMimeAutocryptHeaderClass;
function GMIME_IS_AUTOCRYPT_HEADER(obj: Pointer): Tgboolean;
function GMIME_IS_AUTOCRYPT_HEADER_CLASS(klass: Pointer): Tgboolean;
function GMIME_AUTOCRYPT_HEADER_GET_CLASS(obj: Pointer): PGMimeAutocryptHeaderClass;

function GMIME_TYPE_AUTOCRYPT_HEADER_LIST: TGType;
function GMIME_AUTOCRYPT_HEADER_LIST(obj: Pointer): PGMimeAutocryptHeaderList;
function GMIME_AUTOCRYPT_HEADER_LIST_CLASS(klass: Pointer): PGMimeAutocryptHeaderListClass;
function GMIME_IS_AUTOCRYPT_HEADER_LIST(obj: Pointer): Tgboolean;
function GMIME_IS_AUTOCRYPT_HEADER_LIST_CLASS(klass: Pointer): Tgboolean;
function GMIME_AUTOCRYPT_HEADER_LIST_GET_CLASS(obj: Pointer): PGMimeAutocryptHeaderListClass;


implementation

function GMIME_TYPE_AUTOCRYPT_HEADER: TGType;
begin
  GMIME_TYPE_AUTOCRYPT_HEADER := g_mime_autocrypt_header_get_type;
end;

function GMIME_AUTOCRYPT_HEADER(obj: Pointer): PGMimeAutocryptHeader;
begin
  Result := PGMimeAutocryptHeader(g_type_check_instance_cast(obj, GMIME_TYPE_AUTOCRYPT_HEADER));
end;

function GMIME_AUTOCRYPT_HEADER_CLASS(klass: Pointer): PGMimeAutocryptHeaderClass;
begin
  Result := PGMimeAutocryptHeaderClass(g_type_check_class_cast(klass, GMIME_TYPE_AUTOCRYPT_HEADER));
end;

function GMIME_IS_AUTOCRYPT_HEADER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_AUTOCRYPT_HEADER);
end;

function GMIME_IS_AUTOCRYPT_HEADER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_AUTOCRYPT_HEADER);
end;

function GMIME_AUTOCRYPT_HEADER_GET_CLASS(obj: Pointer): PGMimeAutocryptHeaderClass;
begin
  Result := PGMimeAutocryptHeaderClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GMIME_TYPE_AUTOCRYPT_HEADER_LIST: TGType;
begin
  GMIME_TYPE_AUTOCRYPT_HEADER_LIST := g_mime_autocrypt_header_list_get_type;
end;

function GMIME_AUTOCRYPT_HEADER_LIST(obj: Pointer): PGMimeAutocryptHeaderList;
begin
  Result := PGMimeAutocryptHeaderList(g_type_check_instance_cast(obj, GMIME_TYPE_AUTOCRYPT_HEADER_LIST));
end;

function GMIME_AUTOCRYPT_HEADER_LIST_CLASS(klass: Pointer): PGMimeAutocryptHeaderListClass;
begin
  Result := PGMimeAutocryptHeaderListClass(g_type_check_class_cast(klass, GMIME_TYPE_AUTOCRYPT_HEADER_LIST));
end;

function GMIME_IS_AUTOCRYPT_HEADER_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_AUTOCRYPT_HEADER_LIST);
end;

function GMIME_IS_AUTOCRYPT_HEADER_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_AUTOCRYPT_HEADER_LIST);
end;

function GMIME_AUTOCRYPT_HEADER_LIST_GET_CLASS(obj: Pointer): PGMimeAutocryptHeaderListClass;
begin
  Result := PGMimeAutocryptHeaderListClass(PGTypeInstance(obj)^.g_class);
end;


end.
