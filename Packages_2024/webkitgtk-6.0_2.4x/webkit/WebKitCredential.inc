{$IFDEF read_interface}

type
  PWebKitCredentialPersistence = ^TWebKitCredentialPersistence;
  TWebKitCredentialPersistence = longint;

const
  WEBKIT_CREDENTIAL_PERSISTENCE_NONE = 0;
  WEBKIT_CREDENTIAL_PERSISTENCE_FOR_SESSION = 1;
  WEBKIT_CREDENTIAL_PERSISTENCE_PERMANENT = 2;

type
  TWebKitCredential = record
  end;
  PWebKitCredential = ^TWebKitCredential;

function webkit_credential_get_type: TGType; cdecl; external libwebkit;
function webkit_credential_new(username: Pgchar; password: Pgchar; persistence: TWebKitCredentialPersistence): PWebKitCredential; cdecl; external libwebkit;
function webkit_credential_new_for_certificate_pin(pin: Pgchar; persistence: TWebKitCredentialPersistence): PWebKitCredential; cdecl; external libwebkit;
function webkit_credential_new_for_certificate(certificate: PGTlsCertificate; persistence: TWebKitCredentialPersistence): PWebKitCredential; cdecl; external libwebkit;
function webkit_credential_copy(credential: PWebKitCredential): PWebKitCredential; cdecl; external libwebkit;
procedure webkit_credential_free(credential: PWebKitCredential); cdecl; external libwebkit;
function webkit_credential_get_username(credential: PWebKitCredential): Pgchar; cdecl; external libwebkit;
function webkit_credential_get_password(credential: PWebKitCredential): Pgchar; cdecl; external libwebkit;
function webkit_credential_has_password(credential: PWebKitCredential): Tgboolean; cdecl; external libwebkit;
function webkit_credential_get_certificate(credential: PWebKitCredential): PGTlsCertificate; cdecl; external libwebkit;
function webkit_credential_get_persistence(credential: PWebKitCredential): TWebKitCredentialPersistence; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:54:00 ===

function WEBKIT_TYPE_CREDENTIAL: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_CREDENTIAL: TGType;
begin
  WEBKIT_TYPE_CREDENTIAL := webkit_credential_get_type;
end;



{$ENDIF read_implementation}
