unit gmime_application_pkcs7_mime;

interface

uses
  fp_glib2, fp_gmime3, gmime_part, gmime_object, gmime_crypto_context, gmime_signature;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGMimeSecureMimeType = ^TGMimeSecureMimeType;
  TGMimeSecureMimeType = longint;

const
  GMIME_SECURE_MIME_TYPE_COMPRESSED_DATA = 0;
  GMIME_SECURE_MIME_TYPE_ENVELOPED_DATA = 1;
  GMIME_SECURE_MIME_TYPE_SIGNED_DATA = 2;
  GMIME_SECURE_MIME_TYPE_CERTS_ONLY = 3;
  GMIME_SECURE_MIME_TYPE_UNKNOWN = 4;

type
  TGMimeApplicationPkcs7Mime = record
    parent_object: TGMimePart;
    smime_type: TGMimeSecureMimeType;
  end;
  PGMimeApplicationPkcs7Mime = ^TGMimeApplicationPkcs7Mime;

  TGMimeApplicationPkcs7MimeClass = record
    parent_class: TGMimePartClass;
  end;
  PGMimeApplicationPkcs7MimeClass = ^TGMimeApplicationPkcs7MimeClass;

function g_mime_application_pkcs7_mime_get_type: TGType; cdecl; external libgmime3;
function g_mime_application_pkcs7_mime_new(_type: TGMimeSecureMimeType): PGMimeApplicationPkcs7Mime; cdecl; external libgmime3;
function g_mime_application_pkcs7_mime_get_smime_type(pkcs7_mime: PGMimeApplicationPkcs7Mime): TGMimeSecureMimeType; cdecl; external libgmime3;
function g_mime_application_pkcs7_mime_encrypt(entity: PGMimeObject; flags: TGMimeEncryptFlags; recipients: PGPtrArray; err: PPGError): PGMimeApplicationPkcs7Mime; cdecl; external libgmime3;
function g_mime_application_pkcs7_mime_decrypt(pkcs7_mime: PGMimeApplicationPkcs7Mime; flags: TGMimeDecryptFlags; session_key: pchar; result: PPGMimeDecryptResult; err: PPGError): PGMimeObject; cdecl; external libgmime3;
function g_mime_application_pkcs7_mime_sign(entity: PGMimeObject; userid: pchar; err: PPGError): PGMimeApplicationPkcs7Mime; cdecl; external libgmime3;
function g_mime_application_pkcs7_mime_verify(pkcs7_mime: PGMimeApplicationPkcs7Mime; flags: TGMimeVerifyFlags; entity: PPGMimeObject; err: PPGError): PGMimeSignatureList; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:25:07 ===

function GMIME_TYPE_APPLICATION_PKCS7_MIME: TGType;
function GMIME_APPLICATION_PKCS7_MIME(obj: Pointer): PGMimeApplicationPkcs7Mime;
function GMIME_APPLICATION_PKCS7_MIME_CLASS(klass: Pointer): PGMimeApplicationPkcs7MimeClass;
function GMIME_IS_APPLICATION_PKCS7_MIME(obj: Pointer): Tgboolean;
function GMIME_IS_APPLICATION_PKCS7_MIME_CLASS(klass: Pointer): Tgboolean;
function GMIME_APPLICATION_PKCS7_MIME_GET_CLASS(obj: Pointer): PGMimeApplicationPkcs7MimeClass;

implementation

function GMIME_TYPE_APPLICATION_PKCS7_MIME: TGType;
begin
  GMIME_TYPE_APPLICATION_PKCS7_MIME := g_mime_application_pkcs7_mime_get_type;
end;

function GMIME_APPLICATION_PKCS7_MIME(obj: Pointer): PGMimeApplicationPkcs7Mime;
begin
  Result := PGMimeApplicationPkcs7Mime(g_type_check_instance_cast(obj, GMIME_TYPE_APPLICATION_PKCS7_MIME));
end;

function GMIME_APPLICATION_PKCS7_MIME_CLASS(klass: Pointer): PGMimeApplicationPkcs7MimeClass;
begin
  Result := PGMimeApplicationPkcs7MimeClass(g_type_check_class_cast(klass, GMIME_TYPE_APPLICATION_PKCS7_MIME));
end;

function GMIME_IS_APPLICATION_PKCS7_MIME(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_APPLICATION_PKCS7_MIME);
end;

function GMIME_IS_APPLICATION_PKCS7_MIME_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_APPLICATION_PKCS7_MIME);
end;

function GMIME_APPLICATION_PKCS7_MIME_GET_CLASS(obj: Pointer): PGMimeApplicationPkcs7MimeClass;
begin
  Result := PGMimeApplicationPkcs7MimeClass(PGTypeInstance(obj)^.g_class);
end;



end.
