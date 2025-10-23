{$IFDEF read_interface}


const
  GMIME_MULTIPART_ENCRYPTED_VERSION = 0;
  GMIME_MULTIPART_ENCRYPTED_CONTENT = 1;

type
  TGMimeMultipartEncrypted = record
    parent_object: TGMimeMultipart;
  end;
  PGMimeMultipartEncrypted = ^TGMimeMultipartEncrypted;

  TGMimeMultipartEncryptedClass = record
    parent_class: TGMimeMultipartClass;
  end;
  PGMimeMultipartEncryptedClass = ^TGMimeMultipartEncryptedClass;

function g_mime_multipart_encrypted_get_type: TGType; cdecl; external libgmime3;
function g_mime_multipart_encrypted_new: PGMimeMultipartEncrypted; cdecl; external libgmime3;
function g_mime_multipart_encrypted_encrypt(ctx: PGMimeCryptoContext; entity: PGMimeObject; sign: Tgboolean; userid: pchar; flags: TGMimeEncryptFlags;
  recipients: PGPtrArray; err: PPGError): PGMimeMultipartEncrypted; cdecl; external libgmime3;
function g_mime_multipart_encrypted_decrypt(encrypted: PGMimeMultipartEncrypted; flags: TGMimeDecryptFlags; session_key: pchar; result: PPGMimeDecryptResult; err: PPGError): PGMimeObject; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:29:56 ===

function GMIME_TYPE_MULTIPART_ENCRYPTED: TGType;
function GMIME_MULTIPART_ENCRYPTED(obj: Pointer): PGMimeMultipartEncrypted;
function GMIME_MULTIPART_ENCRYPTED_CLASS(klass: Pointer): PGMimeMultipartEncryptedClass;
function GMIME_IS_MULTIPART_ENCRYPTED(obj: Pointer): Tgboolean;
function GMIME_IS_MULTIPART_ENCRYPTED_CLASS(klass: Pointer): Tgboolean;
function GMIME_MULTIPART_ENCRYPTED_GET_CLASS(obj: Pointer): PGMimeMultipartEncryptedClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_MULTIPART_ENCRYPTED: TGType;
begin
  GMIME_TYPE_MULTIPART_ENCRYPTED := g_mime_multipart_encrypted_get_type;
end;

function GMIME_MULTIPART_ENCRYPTED(obj: Pointer): PGMimeMultipartEncrypted;
begin
  Result := PGMimeMultipartEncrypted(g_type_check_instance_cast(obj, GMIME_TYPE_MULTIPART_ENCRYPTED));
end;

function GMIME_MULTIPART_ENCRYPTED_CLASS(klass: Pointer): PGMimeMultipartEncryptedClass;
begin
  Result := PGMimeMultipartEncryptedClass(g_type_check_class_cast(klass, GMIME_TYPE_MULTIPART_ENCRYPTED));
end;

function GMIME_IS_MULTIPART_ENCRYPTED(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_MULTIPART_ENCRYPTED);
end;

function GMIME_IS_MULTIPART_ENCRYPTED_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_MULTIPART_ENCRYPTED);
end;

function GMIME_MULTIPART_ENCRYPTED_GET_CLASS(obj: Pointer): PGMimeMultipartEncryptedClass;
begin
  Result := PGMimeMultipartEncryptedClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
