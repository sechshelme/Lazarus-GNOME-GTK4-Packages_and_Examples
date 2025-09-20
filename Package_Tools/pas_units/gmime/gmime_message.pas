unit gmime_message;

interface

uses
  fp_glib2, fp_gmime3, gmime_object, internet_address, gmime_autocrypt, gmime_crypto_context;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGMimeAddressType = ^TGMimeAddressType;
  TGMimeAddressType = longint;

const
  GMIME_ADDRESS_TYPE_SENDER = 0;
  GMIME_ADDRESS_TYPE_FROM = 1;
  GMIME_ADDRESS_TYPE_REPLY_TO = 2;
  GMIME_ADDRESS_TYPE_TO = 3;
  GMIME_ADDRESS_TYPE_CC = 4;
  GMIME_ADDRESS_TYPE_BCC = 5;

type
  TGMimeMessage = record
    parent_object: TGMimeObject;
    addrlists: ^PInternetAddressList;
    mime_part: PGMimeObject;
    message_id: pchar;
    date: PGDateTime;
    subject: pchar;
    marker: pchar;
  end;
  PGMimeMessage = ^TGMimeMessage;
  PPGMimeMessage = ^PGMimeMessage;

  TGMimeMessageClass = record
    parent_class: TGMimeObjectClass;
  end;
  PGMimeMessageClass = ^TGMimeMessageClass;

function g_mime_message_get_type: TGType; cdecl; external libgmime3;
function g_mime_message_new(pretty_headers: Tgboolean): PGMimeMessage; cdecl; external libgmime3;
function g_mime_message_get_from(message: PGMimeMessage): PInternetAddressList; cdecl; external libgmime3;
function g_mime_message_get_sender(message: PGMimeMessage): PInternetAddressList; cdecl; external libgmime3;
function g_mime_message_get_reply_to(message: PGMimeMessage): PInternetAddressList; cdecl; external libgmime3;
function g_mime_message_get_to(message: PGMimeMessage): PInternetAddressList; cdecl; external libgmime3;
function g_mime_message_get_cc(message: PGMimeMessage): PInternetAddressList; cdecl; external libgmime3;
function g_mime_message_get_bcc(message: PGMimeMessage): PInternetAddressList; cdecl; external libgmime3;
procedure g_mime_message_add_mailbox(message: PGMimeMessage; _type: TGMimeAddressType; name: pchar; addr: pchar); cdecl; external libgmime3;
function g_mime_message_get_addresses(message: PGMimeMessage; _type: TGMimeAddressType): PInternetAddressList; cdecl; external libgmime3;
function g_mime_message_get_all_recipients(message: PGMimeMessage): PInternetAddressList; cdecl; external libgmime3;
procedure g_mime_message_set_subject(message: PGMimeMessage; subject: pchar; charset: pchar); cdecl; external libgmime3;
function g_mime_message_get_subject(message: PGMimeMessage): pchar; cdecl; external libgmime3;
procedure g_mime_message_set_date(message: PGMimeMessage; date: PGDateTime); cdecl; external libgmime3;
function g_mime_message_get_date(message: PGMimeMessage): PGDateTime; cdecl; external libgmime3;
procedure g_mime_message_set_message_id(message: PGMimeMessage; message_id: pchar); cdecl; external libgmime3;
function g_mime_message_get_message_id(message: PGMimeMessage): pchar; cdecl; external libgmime3;
function g_mime_message_get_mime_part(message: PGMimeMessage): PGMimeObject; cdecl; external libgmime3;
procedure g_mime_message_set_mime_part(message: PGMimeMessage; mime_part: PGMimeObject); cdecl; external libgmime3;
function g_mime_message_get_autocrypt_header(message: PGMimeMessage; now: PGDateTime): PGMimeAutocryptHeader; cdecl; external libgmime3;
function g_mime_message_get_autocrypt_gossip_headers(message: PGMimeMessage; now: PGDateTime; flags: TGMimeDecryptFlags; session_key: pchar; err: PPGError): PGMimeAutocryptHeaderList; cdecl; external libgmime3;
function g_mime_message_get_autocrypt_gossip_headers_from_inner_part(message: PGMimeMessage; now: PGDateTime; inner_part: PGMimeObject): PGMimeAutocryptHeaderList; cdecl; external libgmime3;
procedure g_mime_message_foreach(message: PGMimeMessage; callback: TGMimeObjectForeachFunc; user_data: Tgpointer); cdecl; external libgmime3;
function g_mime_message_get_body(message: PGMimeMessage): PGMimeObject; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:29:32 ===

function GMIME_TYPE_MESSAGE: TGType;
function GMIME_MESSAGE(obj: Pointer): PGMimeMessage;
function GMIME_MESSAGE_CLASS(klass: Pointer): PGMimeMessageClass;
function GMIME_IS_MESSAGE(obj: Pointer): Tgboolean;
function GMIME_IS_MESSAGE_CLASS(klass: Pointer): Tgboolean;
function GMIME_MESSAGE_GET_CLASS(obj: Pointer): PGMimeMessageClass;

implementation

function GMIME_TYPE_MESSAGE: TGType;
begin
  GMIME_TYPE_MESSAGE := g_mime_message_get_type;
end;

function GMIME_MESSAGE(obj: Pointer): PGMimeMessage;
begin
  Result := PGMimeMessage(g_type_check_instance_cast(obj, GMIME_TYPE_MESSAGE));
end;

function GMIME_MESSAGE_CLASS(klass: Pointer): PGMimeMessageClass;
begin
  Result := PGMimeMessageClass(g_type_check_class_cast(klass, GMIME_TYPE_MESSAGE));
end;

function GMIME_IS_MESSAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_MESSAGE);
end;

function GMIME_IS_MESSAGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_MESSAGE);
end;

function GMIME_MESSAGE_GET_CLASS(obj: Pointer): PGMimeMessageClass;
begin
  Result := PGMimeMessageClass(PGTypeInstance(obj)^.g_class);
end;



end.
