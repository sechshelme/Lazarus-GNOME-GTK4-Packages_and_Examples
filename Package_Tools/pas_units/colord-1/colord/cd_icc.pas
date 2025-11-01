unit cd_icc;

interface

uses
  fp_glib2, fp_colord, cd_enum, cd_color, cd_edid;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  PCdIccError = ^TCdIccError;
  TCdIccError = longint;

const
  CD_ICC_ERROR_FAILED_TO_OPEN = 0;
  CD_ICC_ERROR_FAILED_TO_PARSE = 1;
  CD_ICC_ERROR_INVALID_LOCALE = 2;
  CD_ICC_ERROR_NO_DATA = 3;
  CD_ICC_ERROR_FAILED_TO_SAVE = 4;
  CD_ICC_ERROR_FAILED_TO_CREATE = 5;
  CD_ICC_ERROR_INVALID_COLORSPACE = 6;
  CD_ICC_ERROR_CORRUPTION_DETECTED = 7;
  CD_ICC_ERROR_INTERNAL = 8;
  CD_ICC_ERROR_LAST = 9;

type
  PCdIccLoadFlags = ^TCdIccLoadFlags;
  TCdIccLoadFlags = longint;

const
  CD_ICC_LOAD_FLAGS_NONE = 0;
  CD_ICC_LOAD_FLAGS_NAMED_COLORS = 1 shl 0;
  CD_ICC_LOAD_FLAGS_TRANSLATIONS = 1 shl 1;
  CD_ICC_LOAD_FLAGS_METADATA = 1 shl 2;
  CD_ICC_LOAD_FLAGS_FALLBACK_MD5 = 1 shl 3;
  CD_ICC_LOAD_FLAGS_PRIMARIES = 1 shl 4;
  CD_ICC_LOAD_FLAGS_CHARACTERIZATION = 1 shl 5;
  CD_ICC_LOAD_FLAGS_ALL = $ff;
  CD_ICC_LOAD_FLAGS_LAST = 256;

type
  PCdIccSaveFlags = ^TCdIccSaveFlags;
  TCdIccSaveFlags = longint;

const
  CD_ICC_SAVE_FLAGS_NONE = 0;
  CD_ICC_SAVE_FLAGS_LAST = 1;

type
  TCdIcc = record
    parent_instance: TGObject;
  end;
  PCdIcc = ^TCdIcc;

  TCdIccClass = record
    parent_class: TGObjectClass;
    _cd_icc_reserved1: procedure; cdecl;
    _cd_icc_reserved2: procedure; cdecl;
    _cd_icc_reserved3: procedure; cdecl;
    _cd_icc_reserved4: procedure; cdecl;
    _cd_icc_reserved5: procedure; cdecl;
    _cd_icc_reserved6: procedure; cdecl;
    _cd_icc_reserved7: procedure; cdecl;
    _cd_icc_reserved8: procedure; cdecl;
  end;
  PCdIccClass = ^TCdIccClass;

function cd_icc_get_type: TGType; cdecl; external libcolord;
function cd_icc_error_quark: TGQuark; cdecl; external libcolord;
function cd_icc_new: PCdIcc; cdecl; external libcolord;
function cd_icc_load_data(icc: PCdIcc; data: Pguint8; data_len: Tgsize; flags: TCdIccLoadFlags; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_icc_load_file(icc: PCdIcc; file_: PGFile; flags: TCdIccLoadFlags; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_icc_load_fd(icc: PCdIcc; fd: Tgint; flags: TCdIccLoadFlags; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_icc_load_handle(icc: PCdIcc; handle: Tgpointer; flags: TCdIccLoadFlags; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_icc_save_data(icc: PCdIcc; flags: TCdIccSaveFlags; error: PPGError): PGBytes; cdecl; external libcolord;
function cd_icc_save_file(icc: PCdIcc; file_: PGFile; flags: TCdIccSaveFlags; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_icc_save_default(icc: PCdIcc; flags: TCdIccSaveFlags; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_icc_to_string(icc: PCdIcc): Pgchar; cdecl; external libcolord;
function cd_icc_get_handle(icc: PCdIcc): Tgpointer; cdecl; external libcolord;
function cd_icc_get_context(icc: PCdIcc): Tgpointer; cdecl; external libcolord;
function cd_icc_get_size(icc: PCdIcc): Tguint32; cdecl; external libcolord;
function cd_icc_get_filename(icc: PCdIcc): Pgchar; cdecl; external libcolord;
procedure cd_icc_set_filename(icc: PCdIcc; filename: Pgchar); cdecl; external libcolord;
function cd_icc_get_version(icc: PCdIcc): Tgdouble; cdecl; external libcolord;
procedure cd_icc_set_version(icc: PCdIcc; version: Tgdouble); cdecl; external libcolord;
function cd_icc_get_kind(icc: PCdIcc): TCdProfileKind; cdecl; external libcolord;
procedure cd_icc_set_kind(icc: PCdIcc; kind: TCdProfileKind); cdecl; external libcolord;
function cd_icc_get_colorspace(icc: PCdIcc): TCdColorspace; cdecl; external libcolord;
procedure cd_icc_set_colorspace(icc: PCdIcc; colorspace: TCdColorspace); cdecl; external libcolord;
function cd_icc_get_metadata(icc: PCdIcc): PGHashTable; cdecl; external libcolord;
function cd_icc_get_metadata_item(icc: PCdIcc; key: Pgchar): Pgchar; cdecl; external libcolord;
procedure cd_icc_add_metadata(icc: PCdIcc; key: Pgchar; value: Pgchar); cdecl; external libcolord;
procedure cd_icc_remove_metadata(icc: PCdIcc; key: Pgchar); cdecl; external libcolord;
function cd_icc_get_named_colors(icc: PCdIcc): PGPtrArray; cdecl; external libcolord;
function cd_icc_get_can_delete(icc: PCdIcc): Tgboolean; cdecl; external libcolord;
function cd_icc_get_created(icc: PCdIcc): PGDateTime; cdecl; external libcolord;
procedure cd_icc_set_created(icc: PCdIcc; creation_time: PGDateTime); cdecl; external libcolord;
function cd_icc_get_checksum(icc: PCdIcc): Pgchar; cdecl; external libcolord;
function cd_icc_get_description(icc: PCdIcc; locale: Pgchar; error: PPGError): Pgchar; cdecl; external libcolord;
function cd_icc_get_characterization_data(icc: PCdIcc): Pgchar; cdecl; external libcolord;
procedure cd_icc_set_characterization_data(icc: PCdIcc; data: Pgchar); cdecl; external libcolord;
function cd_icc_get_copyright(icc: PCdIcc; locale: Pgchar; error: PPGError): Pgchar; cdecl; external libcolord;
function cd_icc_get_manufacturer(icc: PCdIcc; locale: Pgchar; error: PPGError): Pgchar; cdecl; external libcolord;
function cd_icc_get_model(icc: PCdIcc; locale: Pgchar; error: PPGError): Pgchar; cdecl; external libcolord;
procedure cd_icc_set_description(icc: PCdIcc; locale: Pgchar; value: Pgchar); cdecl; external libcolord;
procedure cd_icc_set_description_items(icc: PCdIcc; values: PGHashTable); cdecl; external libcolord;
procedure cd_icc_set_copyright(icc: PCdIcc; locale: Pgchar; value: Pgchar); cdecl; external libcolord;
procedure cd_icc_set_copyright_items(icc: PCdIcc; values: PGHashTable); cdecl; external libcolord;
procedure cd_icc_set_manufacturer(icc: PCdIcc; locale: Pgchar; value: Pgchar); cdecl; external libcolord;
procedure cd_icc_set_manufacturer_items(icc: PCdIcc; values: PGHashTable); cdecl; external libcolord;
procedure cd_icc_set_model(icc: PCdIcc; locale: Pgchar; value: Pgchar); cdecl; external libcolord;
procedure cd_icc_set_model_items(icc: PCdIcc; values: PGHashTable); cdecl; external libcolord;
function cd_icc_get_red(icc: PCdIcc): PCdColorXYZ; cdecl; external libcolord;
function cd_icc_get_green(icc: PCdIcc): PCdColorXYZ; cdecl; external libcolord;
function cd_icc_get_blue(icc: PCdIcc): PCdColorXYZ; cdecl; external libcolord;
function cd_icc_get_white(icc: PCdIcc): PCdColorXYZ; cdecl; external libcolord;
function cd_icc_get_temperature(icc: PCdIcc): Tguint; cdecl; external libcolord;
function cd_icc_get_warnings(icc: PCdIcc): PGArray; cdecl; external libcolord;
function cd_icc_create_from_edid(icc: PCdIcc; gamma_value: Tgdouble; red: PCdColorYxy; green: PCdColorYxy; blue: PCdColorYxy;
  white: PCdColorYxy; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_icc_create_from_edid_data(icc: PCdIcc; edid: PCdEdid; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_icc_create_default(icc: PCdIcc; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_icc_create_default_full(icc: PCdIcc; flags: TCdIccLoadFlags; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_icc_get_vcgt(icc: PCdIcc; size: Tguint; error: PPGError): PGPtrArray; cdecl; external libcolord;
function cd_icc_set_vcgt(icc: PCdIcc; vcgt: PGPtrArray; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_icc_get_response(icc: PCdIcc; size: Tguint; error: PPGError): PGPtrArray; cdecl; external libcolord;
function cd_icc_get_tags(icc: PCdIcc; error: PPGError): PPgchar; cdecl; external libcolord;
function cd_icc_get_tag_data(icc: PCdIcc; tag: Pgchar; error: PPGError): PGBytes; cdecl; external libcolord;
function cd_icc_set_tag_data(icc: PCdIcc; tag: Pgchar; data: PGBytes; error: PPGError): Tgboolean; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:08:03 ===

function CD_TYPE_ICC: TGType;
function CD_ICC(obj: Pointer): PCdIcc;
function CD_IS_ICC(obj: Pointer): Tgboolean;
function CD_ICC_CLASS(klass: Pointer): PCdIccClass;
function CD_IS_ICC_CLASS(klass: Pointer): Tgboolean;
function CD_ICC_GET_CLASS(obj: Pointer): PCdIccClass;

implementation

function CD_TYPE_ICC: TGType;
begin
  Result := cd_icc_get_type;
end;

function CD_ICC(obj: Pointer): PCdIcc;
begin
  Result := PCdIcc(g_type_check_instance_cast(obj, CD_TYPE_ICC));
end;

function CD_IS_ICC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_ICC);
end;

function CD_ICC_CLASS(klass: Pointer): PCdIccClass;
begin
  Result := PCdIccClass(g_type_check_class_cast(klass, CD_TYPE_ICC));
end;

function CD_IS_ICC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, CD_TYPE_ICC);
end;

function CD_ICC_GET_CLASS(obj: Pointer): PCdIccClass;
begin
  Result := PCdIccClass(PGTypeInstance(obj)^.g_class);
end;



end.
