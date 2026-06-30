unit gunixcredentialsmessage;

interface

uses
  fp_glib2, giotypes, gsocketcontrolmessage;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGUnixCredentialsMessagePrivate = type Pointer;

  PGUnixCredentialsMessage = ^TGUnixCredentialsMessage;
  TGUnixCredentialsMessage = record
    parent_instance: TGSocketControlMessage;
    priv: PGUnixCredentialsMessagePrivate;
  end;

  PGUnixCredentialsMessageClass = ^TGUnixCredentialsMessageClass;
  TGUnixCredentialsMessageClass = record
    parent_class: TGSocketControlMessageClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
  end;

function g_unix_credentials_message_get_type: TGType; cdecl; external libgio2;
function g_unix_credentials_message_new: PGSocketControlMessage; cdecl; external libgio2;
function g_unix_credentials_message_new_with_credentials(credentials: PGCredentials): PGSocketControlMessage; cdecl; external libgio2;
function g_unix_credentials_message_get_credentials(message: PGUnixCredentialsMessage): PGCredentials; cdecl; external libgio2;
function g_unix_credentials_message_is_supported: Tgboolean; cdecl; external libgio2;

// === Konventiert am: 26-6-26 20:03:27 ===

function G_TYPE_UNIX_CREDENTIALS_MESSAGE: TGType;
function G_UNIX_CREDENTIALS_MESSAGE(obj: Pointer): PGUnixCredentialsMessage;
function G_UNIX_CREDENTIALS_MESSAGE_CLASS(klass: Pointer): PGUnixCredentialsMessageClass;
function G_IS_UNIX_CREDENTIALS_MESSAGE(obj: Pointer): Tgboolean;
function G_IS_UNIX_CREDENTIALS_MESSAGE_CLASS(klass: Pointer): Tgboolean;
function G_UNIX_CREDENTIALS_MESSAGE_GET_CLASS(obj: Pointer): PGUnixCredentialsMessageClass;

implementation

function G_TYPE_UNIX_CREDENTIALS_MESSAGE: TGType;
begin
  G_TYPE_UNIX_CREDENTIALS_MESSAGE := g_unix_credentials_message_get_type;
end;

function G_UNIX_CREDENTIALS_MESSAGE(obj: Pointer): PGUnixCredentialsMessage;
begin
  Result := PGUnixCredentialsMessage(g_type_check_instance_cast(obj, G_TYPE_UNIX_CREDENTIALS_MESSAGE));
end;

function G_UNIX_CREDENTIALS_MESSAGE_CLASS(klass: Pointer): PGUnixCredentialsMessageClass;
begin
  Result := PGUnixCredentialsMessageClass(g_type_check_class_cast(klass, G_TYPE_UNIX_CREDENTIALS_MESSAGE));
end;

function G_IS_UNIX_CREDENTIALS_MESSAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_UNIX_CREDENTIALS_MESSAGE);
end;

function G_IS_UNIX_CREDENTIALS_MESSAGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_UNIX_CREDENTIALS_MESSAGE);
end;

function G_UNIX_CREDENTIALS_MESSAGE_GET_CLASS(obj: Pointer): PGUnixCredentialsMessageClass;
begin
  Result := PGUnixCredentialsMessageClass(PGTypeInstance(obj)^.g_class);
end;



end.
