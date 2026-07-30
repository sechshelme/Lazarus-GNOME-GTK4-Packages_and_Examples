unit as_checksum;

interface

uses
  fp_glib2, fp_appstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAsChecksumKind = ^TAsChecksumKind;
  TAsChecksumKind = longint;
const
  AS_CHECKSUM_KIND_NONE = 0;
  AS_CHECKSUM_KIND_SHA1 = 1;
  AS_CHECKSUM_KIND_SHA256 = 2;
  AS_CHECKSUM_KIND_SHA512 = 3;
  AS_CHECKSUM_KIND_BLAKE2B = 4;
  AS_CHECKSUM_KIND_BLAKE3 = 5;
  AS_CHECKSUM_KIND_LAST = 6;

type
  TAsChecksum = record
    parent_instance: TGObject;
  end;
  PAsChecksum = ^TAsChecksum;

  PAsChecksumClass = ^TAsChecksumClass;
  TAsChecksumClass = record
    parent_class: TGObjectClass;
    _as_reserved1: procedure; cdecl;
    _as_reserved2: procedure; cdecl;
    _as_reserved3: procedure; cdecl;
    _as_reserved4: procedure; cdecl;
    _as_reserved5: procedure; cdecl;
    _as_reserved6: procedure; cdecl;
  end;

function as_checksum_get_type: TGType; cdecl; external libappstream;
function as_checksum_kind_to_string(kind: TAsChecksumKind): Pgchar; cdecl; external libappstream;
function as_checksum_kind_from_string(kind_str: Pgchar): TAsChecksumKind; cdecl; external libappstream;
function as_checksum_new: PAsChecksum; cdecl; external libappstream;
function as_checksum_new_with_value(kind: TAsChecksumKind; value: Pgchar): PAsChecksum; cdecl; external libappstream;
function as_checksum_get_kind(cs: PAsChecksum): TAsChecksumKind; cdecl; external libappstream;
procedure as_checksum_set_kind(cs: PAsChecksum; kind: TAsChecksumKind); cdecl; external libappstream;
function as_checksum_get_value(cs: PAsChecksum): Pgchar; cdecl; external libappstream;
procedure as_checksum_set_value(cs: PAsChecksum; value: Pgchar); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:36:35 ===

function AS_TYPE_CHECKSUM: TGType;
function AS_CHECKSUM(obj: Pointer): PAsChecksum;
function AS_IS_CHECKSUM(obj: Pointer): Tgboolean;
function AS_CHECKSUM_CLASS(klass: Pointer): PAsChecksumClass;
function AS_IS_CHECKSUM_CLASS(klass: Pointer): Tgboolean;
function AS_CHECKSUM_GET_CLASS(obj: Pointer): PAsChecksumClass;

implementation

function AS_TYPE_CHECKSUM: TGType;
begin
  Result := as_checksum_get_type;
end;

function AS_CHECKSUM(obj: Pointer): PAsChecksum;
begin
  Result := PAsChecksum(g_type_check_instance_cast(obj, AS_TYPE_CHECKSUM));
end;

function AS_IS_CHECKSUM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_CHECKSUM);
end;

function AS_CHECKSUM_CLASS(klass: Pointer): PAsChecksumClass;
begin
  Result := PAsChecksumClass(g_type_check_class_cast(klass, AS_TYPE_CHECKSUM));
end;

function AS_IS_CHECKSUM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_CHECKSUM);
end;

function AS_CHECKSUM_GET_CLASS(obj: Pointer): PAsChecksumClass;
begin
  Result := PAsChecksumClass(PGTypeInstance(obj)^.g_class);
end;

end.
