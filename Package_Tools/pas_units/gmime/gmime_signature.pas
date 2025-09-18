unit gmime_signature;

interface

uses
  fp_glib2, fp_gmime3, gmime_certificate;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGMimeSignatureStatus = ^TGMimeSignatureStatus;
  TGMimeSignatureStatus = longint;

const
  GMIME_SIGNATURE_STATUS_VALID = $0001;
  GMIME_SIGNATURE_STATUS_GREEN = $0002;
  GMIME_SIGNATURE_STATUS_RED = $0004;
  GMIME_SIGNATURE_STATUS_KEY_REVOKED = $0010;
  GMIME_SIGNATURE_STATUS_KEY_EXPIRED = $0020;
  GMIME_SIGNATURE_STATUS_SIG_EXPIRED = $0040;
  GMIME_SIGNATURE_STATUS_KEY_MISSING = $0080;
  GMIME_SIGNATURE_STATUS_CRL_MISSING = $0100;
  GMIME_SIGNATURE_STATUS_CRL_TOO_OLD = $0200;
  GMIME_SIGNATURE_STATUS_BAD_POLICY = $0400;
  GMIME_SIGNATURE_STATUS_SYS_ERROR = $0800;
  GMIME_SIGNATURE_STATUS_TOFU_CONFLICT = $1000;

  GMIME_SIGNATURE_STATUS_ERROR_MASK = not ((GMIME_SIGNATURE_STATUS_VALID or GMIME_SIGNATURE_STATUS_GREEN) or GMIME_SIGNATURE_STATUS_RED);

type
  TGMimeSignature = record
    parent_object: TGObject;
    status: TGMimeSignatureStatus;
    cert: PGMimeCertificate;
    created: Ttime_t;
    expires: Ttime_t;
  end;
  PGMimeSignature = ^TGMimeSignature;

  TGMimeSignatureClass = record
    parent_class: TGObjectClass;
  end;
  PGMimeSignatureClass = ^TGMimeSignatureClass;

function g_mime_signature_get_type: TGType; cdecl; external libgmime3;
function g_mime_signature_new: PGMimeSignature; cdecl; external libgmime3;
procedure g_mime_signature_set_certificate(sig: PGMimeSignature; cert: PGMimeCertificate); cdecl; external libgmime3;
function g_mime_signature_get_certificate(sig: PGMimeSignature): PGMimeCertificate; cdecl; external libgmime3;
procedure g_mime_signature_set_status(sig: PGMimeSignature; status: TGMimeSignatureStatus); cdecl; external libgmime3;
function g_mime_signature_get_status(sig: PGMimeSignature): TGMimeSignatureStatus; cdecl; external libgmime3;
procedure g_mime_signature_set_created(sig: PGMimeSignature; created: Ttime_t); cdecl; external libgmime3;
function g_mime_signature_get_created(sig: PGMimeSignature): Ttime_t; cdecl; external libgmime3;
function g_mime_signature_get_created64(sig: PGMimeSignature): Tgint64; cdecl; external libgmime3;
procedure g_mime_signature_set_expires(sig: PGMimeSignature; expires: Ttime_t); cdecl; external libgmime3;
function g_mime_signature_get_expires(sig: PGMimeSignature): Ttime_t; cdecl; external libgmime3;
function g_mime_signature_get_expires64(sig: PGMimeSignature): Tgint64; cdecl; external libgmime3;

type
  TGMimeSignatureList = record
    parent_object: TGObject;
    arr: PGPtrArray;
  end;
  PGMimeSignatureList = ^TGMimeSignatureList;

  TGMimeSignatureListClass = record
    parent_class: TGObjectClass;
  end;
  PGMimeSignatureListClass = ^TGMimeSignatureListClass;

function g_mime_signature_list_get_type: TGType; cdecl; external libgmime3;
function g_mime_signature_list_new: PGMimeSignatureList; cdecl; external libgmime3;
function g_mime_signature_list_length(list: PGMimeSignatureList): longint; cdecl; external libgmime3;
procedure g_mime_signature_list_clear(list: PGMimeSignatureList); cdecl; external libgmime3;
function g_mime_signature_list_add(list: PGMimeSignatureList; sig: PGMimeSignature): longint; cdecl; external libgmime3;
procedure g_mime_signature_list_insert(list: PGMimeSignatureList; index: longint; sig: PGMimeSignature); cdecl; external libgmime3;
function g_mime_signature_list_remove(list: PGMimeSignatureList; sig: PGMimeSignature): Tgboolean; cdecl; external libgmime3;
function g_mime_signature_list_remove_at(list: PGMimeSignatureList; index: longint): Tgboolean; cdecl; external libgmime3;
function g_mime_signature_list_contains(list: PGMimeSignatureList; sig: PGMimeSignature): Tgboolean; cdecl; external libgmime3;
function g_mime_signature_list_index_of(list: PGMimeSignatureList; sig: PGMimeSignature): longint; cdecl; external libgmime3;
function g_mime_signature_list_get_signature(list: PGMimeSignatureList; index: longint): PGMimeSignature; cdecl; external libgmime3;
procedure g_mime_signature_list_set_signature(list: PGMimeSignatureList; index: longint; sig: PGMimeSignature); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:33:28 ===

function GMIME_TYPE_SIGNATURE: TGType;
function GMIME_SIGNATURE(obj: Pointer): PGMimeSignature;
function GMIME_SIGNATURE_CLASS(klass: Pointer): PGMimeSignatureClass;
function GMIME_IS_SIGNATURE(obj: Pointer): Tgboolean;
function GMIME_IS_SIGNATURE_CLASS(klass: Pointer): Tgboolean;
function GMIME_SIGNATURE_GET_CLASS(obj: Pointer): PGMimeSignatureClass;

function GMIME_TYPE_SIGNATURE_LIST: TGType;
function GMIME_SIGNATURE_LIST(obj: Pointer): PGMimeSignatureList;
function GMIME_SIGNATURE_LIST_CLASS(klass: Pointer): PGMimeSignatureListClass;
function GMIME_IS_SIGNATURE_LIST(obj: Pointer): Tgboolean;
function GMIME_IS_SIGNATURE_LIST_CLASS(klass: Pointer): Tgboolean;
function GMIME_SIGNATURE_LIST_GET_CLASS(obj: Pointer): PGMimeSignatureListClass;


implementation

function GMIME_TYPE_SIGNATURE: TGType;
begin
  GMIME_TYPE_SIGNATURE := g_mime_signature_get_type;
end;

function GMIME_SIGNATURE(obj: Pointer): PGMimeSignature;
begin
  Result := PGMimeSignature(g_type_check_instance_cast(obj, GMIME_TYPE_SIGNATURE));
end;

function GMIME_SIGNATURE_CLASS(klass: Pointer): PGMimeSignatureClass;
begin
  Result := PGMimeSignatureClass(g_type_check_class_cast(klass, GMIME_TYPE_SIGNATURE));
end;

function GMIME_IS_SIGNATURE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_SIGNATURE);
end;

function GMIME_IS_SIGNATURE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_SIGNATURE);
end;

function GMIME_SIGNATURE_GET_CLASS(obj: Pointer): PGMimeSignatureClass;
begin
  Result := PGMimeSignatureClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GMIME_TYPE_SIGNATURE_LIST: TGType;
begin
  GMIME_TYPE_SIGNATURE_LIST := g_mime_signature_list_get_type;
end;

function GMIME_SIGNATURE_LIST(obj: Pointer): PGMimeSignatureList;
begin
  Result := PGMimeSignatureList(g_type_check_instance_cast(obj, GMIME_TYPE_SIGNATURE_LIST));
end;

function GMIME_SIGNATURE_LIST_CLASS(klass: Pointer): PGMimeSignatureListClass;
begin
  Result := PGMimeSignatureListClass(g_type_check_class_cast(klass, GMIME_TYPE_SIGNATURE_LIST));
end;

function GMIME_IS_SIGNATURE_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_SIGNATURE_LIST);
end;

function GMIME_IS_SIGNATURE_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_SIGNATURE_LIST);
end;

function GMIME_SIGNATURE_LIST_GET_CLASS(obj: Pointer): PGMimeSignatureListClass;
begin
  Result := PGMimeSignatureListClass(PGTypeInstance(obj)^.g_class);
end;



end.
