unit gmime_pkcs7_context;

interface

uses
  fp_glib2, fp_gmime3, gmime_crypto_context;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGMimePkcs7Context = type Pointer;
  PGMimePkcs7ContextClass = type Pointer;

function g_mime_pkcs7_context_get_type: TGType; cdecl; external libgmime3;
function g_mime_pkcs7_context_new: PGMimeCryptoContext; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:33:11 ===

function GMIME_TYPE_PKCS7_CONTEXT: TGType;
function GMIME_PKCS7_CONTEXT(obj: Pointer): PGMimePkcs7Context;
function GMIME_PKCS7_CONTEXT_CLASS(klass: Pointer): PGMimePkcs7ContextClass;
function GMIME_IS_PKCS7_CONTEXT(obj: Pointer): Tgboolean;
function GMIME_IS_PKCS7_CONTEXT_CLASS(klass: Pointer): Tgboolean;
function GMIME_PKCS7_CONTEXT_GET_CLASS(obj: Pointer): PGMimePkcs7ContextClass;

implementation

function GMIME_TYPE_PKCS7_CONTEXT: TGType;
begin
  GMIME_TYPE_PKCS7_CONTEXT := g_mime_pkcs7_context_get_type;
end;

function GMIME_PKCS7_CONTEXT(obj: Pointer): PGMimePkcs7Context;
begin
  Result := PGMimePkcs7Context(g_type_check_instance_cast(obj, GMIME_TYPE_PKCS7_CONTEXT));
end;

function GMIME_PKCS7_CONTEXT_CLASS(klass: Pointer): PGMimePkcs7ContextClass;
begin
  Result := PGMimePkcs7ContextClass(g_type_check_class_cast(klass, GMIME_TYPE_PKCS7_CONTEXT));
end;

function GMIME_IS_PKCS7_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_PKCS7_CONTEXT);
end;

function GMIME_IS_PKCS7_CONTEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_PKCS7_CONTEXT);
end;

function GMIME_PKCS7_CONTEXT_GET_CLASS(obj: Pointer): PGMimePkcs7ContextClass;
begin
  Result := PGMimePkcs7ContextClass(PGTypeInstance(obj)^.g_class);
end;



end.
