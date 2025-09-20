unit gmime_multipart_signed;

interface

uses
  fp_glib2, fp_gmime3, gmime_multipart, gmime_crypto_context, gmime_object, gmime_signature;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GMIME_MULTIPART_SIGNED_CONTENT = 0;
  GMIME_MULTIPART_SIGNED_SIGNATURE = 1;

type
  TGMimeMultipartSigned = record
    parent_object: TGMimeMultipart;
  end;
  PGMimeMultipartSigned = ^TGMimeMultipartSigned;

  TGMimeMultipartSignedClass = record
    parent_class: TGMimeMultipartClass;
  end;
  PGMimeMultipartSignedClass = ^TGMimeMultipartSignedClass;

function g_mime_multipart_signed_get_type: TGType; cdecl; external libgmime3;
function g_mime_multipart_signed_new: PGMimeMultipartSigned; cdecl; external libgmime3;
function g_mime_multipart_signed_sign(ctx: PGMimeCryptoContext; entity: PGMimeObject; userid: pchar; err: PPGError): PGMimeMultipartSigned; cdecl; external libgmime3;
function g_mime_multipart_signed_verify(mps: PGMimeMultipartSigned; flags: TGMimeVerifyFlags; err: PPGError): PGMimeSignatureList; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:30:01 ===

function GMIME_TYPE_MULTIPART_SIGNED: TGType;
function GMIME_MULTIPART_SIGNED(obj: Pointer): PGMimeMultipartSigned;
function GMIME_MULTIPART_SIGNED_CLASS(klass: Pointer): PGMimeMultipartSignedClass;
function GMIME_IS_MULTIPART_SIGNED(obj: Pointer): Tgboolean;
function GMIME_IS_MULTIPART_SIGNED_CLASS(klass: Pointer): Tgboolean;
function GMIME_MULTIPART_SIGNED_GET_CLASS(obj: Pointer): PGMimeMultipartSignedClass;

implementation

function GMIME_TYPE_MULTIPART_SIGNED: TGType;
begin
  GMIME_TYPE_MULTIPART_SIGNED := g_mime_multipart_signed_get_type;
end;

function GMIME_MULTIPART_SIGNED(obj: Pointer): PGMimeMultipartSigned;
begin
  Result := PGMimeMultipartSigned(g_type_check_instance_cast(obj, GMIME_TYPE_MULTIPART_SIGNED));
end;

function GMIME_MULTIPART_SIGNED_CLASS(klass: Pointer): PGMimeMultipartSignedClass;
begin
  Result := PGMimeMultipartSignedClass(g_type_check_class_cast(klass, GMIME_TYPE_MULTIPART_SIGNED));
end;

function GMIME_IS_MULTIPART_SIGNED(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_MULTIPART_SIGNED);
end;

function GMIME_IS_MULTIPART_SIGNED_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_MULTIPART_SIGNED);
end;

function GMIME_MULTIPART_SIGNED_GET_CLASS(obj: Pointer): PGMimeMultipartSignedClass;
begin
  Result := PGMimeMultipartSignedClass(PGTypeInstance(obj)^.g_class);
end;



end.
