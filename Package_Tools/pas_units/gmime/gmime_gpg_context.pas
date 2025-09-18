unit gmime_gpg_context;

interface

uses
  fp_glib2, fp_gmime3, gmime_crypto_context;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function g_mime_gpg_context_get_type: TGType; cdecl; external libgmime3;
function g_mime_gpg_context_new: PGMimeCryptoContext; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:28:51 ===

function GMIME_TYPE_GPG_CONTEXT: TGType;
function GMIME_GPG_CONTEXT(obj: Pointer): PGMimeGpgContext;
function GMIME_GPG_CONTEXT_CLASS(klass: Pointer): PGMimeGpgContextClass;
function GMIME_IS_GPG_CONTEXT(obj: Pointer): Tgboolean;
function GMIME_IS_GPG_CONTEXT_CLASS(klass: Pointer): Tgboolean;
function GMIME_GPG_CONTEXT_GET_CLASS(obj: Pointer): PGMimeGpgContextClass;

implementation

function GMIME_TYPE_GPG_CONTEXT: TGType;
begin
  GMIME_TYPE_GPG_CONTEXT := g_mime_gpg_context_get_type;
end;

function GMIME_GPG_CONTEXT(obj: Pointer): PGMimeGpgContext;
begin
  Result := PGMimeGpgContext(g_type_check_instance_cast(obj, GMIME_TYPE_GPG_CONTEXT));
end;

function GMIME_GPG_CONTEXT_CLASS(klass: Pointer): PGMimeGpgContextClass;
begin
  Result := PGMimeGpgContextClass(g_type_check_class_cast(klass, GMIME_TYPE_GPG_CONTEXT));
end;

function GMIME_IS_GPG_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_GPG_CONTEXT);
end;

function GMIME_IS_GPG_CONTEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_GPG_CONTEXT);
end;

function GMIME_GPG_CONTEXT_GET_CLASS(obj: Pointer): PGMimeGpgContextClass;
begin
  Result := PGMimeGpgContextClass(PGTypeInstance(obj)^.g_class);
end;



end.
