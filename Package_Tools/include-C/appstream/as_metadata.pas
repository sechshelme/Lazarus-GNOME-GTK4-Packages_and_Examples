unit as_metadata;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_appstream, as_component_box, as_release_list, as_context;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PAsParseFlags = ^TAsParseFlags;
  TAsParseFlags = longint;
const
  AS_PARSE_FLAG_NONE = 0;
  AS_PARSE_FLAG_IGNORE_MEDIABASEURL = 1 shl 0;

type
  PAsMetadataError = ^TAsMetadataError;
  TAsMetadataError = longint;
const
  AS_METADATA_ERROR_FAILED = 0;
  AS_METADATA_ERROR_PARSE = 1;
  AS_METADATA_ERROR_FORMAT_UNEXPECTED = 2;
  AS_METADATA_ERROR_NO_COMPONENT = 3;
  AS_METADATA_ERROR_VALUE_MISSING = 4;
  AS_METADATA_ERROR_LAST = 5;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsMetadata = record
    parent_instance: TGObject;
  end;
  PAsMetadata = ^TAsMetadata;

  PAsMetadataClass = ^TAsMetadataClass;
  TAsMetadataClass = record
    parent_class: TGObjectClass;
    _as_reserved1: procedure; cdecl;
    _as_reserved2: procedure; cdecl;
    _as_reserved3: procedure; cdecl;
    _as_reserved4: procedure; cdecl;
    _as_reserved5: procedure; cdecl;
    _as_reserved6: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function as_metadata_get_type: TGType; cdecl; external libappstream;
function as_metadata_file_guess_style(filename: Pgchar): TAsFormatStyle; cdecl; external libappstream;
function as_metadata_new: PAsMetadata; cdecl; external libappstream;
function as_metadata_error_quark: TGQuark; cdecl; external libappstream;
function as_metadata_parse_file(metad: PAsMetadata; file_: PGFile; format: TAsFormatKind; error: PPGError): Tgboolean; cdecl; external libappstream;
function as_metadata_parse_data(metad: PAsMetadata; data: Pgchar; data_len: Tgssize; format: TAsFormatKind; error: PPGError): Tgboolean; cdecl; external libappstream;
function as_metadata_parse_bytes(metad: PAsMetadata; bytes: PGBytes; format: TAsFormatKind; error: PPGError): Tgboolean; cdecl; external libappstream;
function as_metadata_parse_desktop_data(metad: PAsMetadata; cid: Pgchar; data: Pgchar; data_len: Tgssize; error: PPGError): Tgboolean; cdecl; external libappstream;
function as_metadata_component_to_metainfo(metad: PAsMetadata; format: TAsFormatKind; error: PPGError): Pgchar; cdecl; external libappstream;
function as_metadata_save_metainfo(metad: PAsMetadata; fname: Pgchar; format: TAsFormatKind; error: PPGError): Tgboolean; cdecl; external libappstream;
function as_metadata_components_to_catalog(metad: PAsMetadata; format: TAsFormatKind; error: PPGError): Pgchar; cdecl; external libappstream;
function as_metadata_save_catalog(metad: PAsMetadata; fname: Pgchar; format: TAsFormatKind; error: PPGError): Tgboolean; cdecl; external libappstream;
function as_metadata_get_component(metad: PAsMetadata): PAsComponent; cdecl; external libappstream;
function as_metadata_get_components(metad: PAsMetadata): PAsComponentBox; cdecl; external libappstream;
procedure as_metadata_clear_components(metad: PAsMetadata); cdecl; external libappstream;
procedure as_metadata_add_component(metad: PAsMetadata; cpt: PAsComponent); cdecl; external libappstream;
function as_metadata_parse_releases_bytes(metad: PAsMetadata; bytes: PGBytes; error: PPGError): Tgboolean; cdecl; external libappstream;
function as_metadata_parse_releases_file(metad: PAsMetadata; file_: PGFile; error: PPGError): Tgboolean; cdecl; external libappstream;
function as_metadata_releases_to_data(metad: PAsMetadata; releases: PAsReleaseList; error: PPGError): Pgchar; cdecl; external libappstream;
function as_metadata_get_release_list(metad: PAsMetadata): PAsReleaseList; cdecl; external libappstream;
function as_metadata_get_release_lists(metad: PAsMetadata): PGPtrArray; cdecl; external libappstream;
procedure as_metadata_clear_releases(metad: PAsMetadata); cdecl; external libappstream;
function as_metadata_get_format_version(metad: PAsMetadata): TAsFormatVersion; cdecl; external libappstream;
procedure as_metadata_set_format_version(metad: PAsMetadata; version: TAsFormatVersion); cdecl; external libappstream;
function as_metadata_get_format_style(metad: PAsMetadata): TAsFormatStyle; cdecl; external libappstream;
procedure as_metadata_set_format_style(metad: PAsMetadata; mode: TAsFormatStyle); cdecl; external libappstream;
procedure as_metadata_set_locale(metad: PAsMetadata; locale: Pgchar); cdecl; external libappstream;
function as_metadata_get_locale(metad: PAsMetadata): Pgchar; cdecl; external libappstream;
function as_metadata_get_origin(metad: PAsMetadata): Pgchar; cdecl; external libappstream;
procedure as_metadata_set_origin(metad: PAsMetadata; origin: Pgchar); cdecl; external libappstream;
function as_metadata_get_update_existing(metad: PAsMetadata): Tgboolean; cdecl; external libappstream;
procedure as_metadata_set_update_existing(metad: PAsMetadata; update: Tgboolean); cdecl; external libappstream;
function as_metadata_get_write_header(metad: PAsMetadata): Tgboolean; cdecl; external libappstream;
procedure as_metadata_set_write_header(metad: PAsMetadata; wheader: Tgboolean); cdecl; external libappstream;
function as_metadata_get_media_baseurl(metad: PAsMetadata): Pgchar; cdecl; external libappstream;
procedure as_metadata_set_media_baseurl(metad: PAsMetadata; url: Pgchar); cdecl; external libappstream;
function as_metadata_get_architecture(metad: PAsMetadata): Pgchar; cdecl; external libappstream;
procedure as_metadata_set_architecture(metad: PAsMetadata; arch: Pgchar); cdecl; external libappstream;
function as_metadata_get_parse_flags(metad: PAsMetadata): TAsParseFlags; cdecl; external libappstream;
procedure as_metadata_set_parse_flags(metad: PAsMetadata; flags: TAsParseFlags); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:35:47 ===

function AS_TYPE_METADATA: TGType;
function AS_METADATA(obj: Pointer): PAsMetadata;
function AS_IS_METADATA(obj: Pointer): Tgboolean;
function AS_METADATA_CLASS(klass: Pointer): PAsMetadataClass;
function AS_IS_METADATA_CLASS(klass: Pointer): Tgboolean;
function AS_METADATA_GET_CLASS(obj: Pointer): PAsMetadataClass;

function AS_METADATA_ERROR: TGQuark;
{$ENDIF read_function}

implementation

function AS_TYPE_METADATA: TGType;
begin
  Result := as_metadata_get_type;
end;

function AS_METADATA(obj: Pointer): PAsMetadata;
begin
  Result := PAsMetadata(g_type_check_instance_cast(obj, AS_TYPE_METADATA));
end;

function AS_IS_METADATA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_METADATA);
end;

function AS_METADATA_CLASS(klass: Pointer): PAsMetadataClass;
begin
  Result := PAsMetadataClass(g_type_check_class_cast(klass, AS_TYPE_METADATA));
end;

function AS_IS_METADATA_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_METADATA);
end;

function AS_METADATA_GET_CLASS(obj: Pointer): PAsMetadataClass;
begin
  Result := PAsMetadataClass(PGTypeInstance(obj)^.g_class);
end;


function AS_METADATA_ERROR: TGQuark;
begin
  AS_METADATA_ERROR := as_metadata_error_quark;
end;

end.
