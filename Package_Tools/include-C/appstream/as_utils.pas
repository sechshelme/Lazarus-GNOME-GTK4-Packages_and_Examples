unit as_utils;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_appstream, as_component, as_bundle;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PAsUtilsError = ^TAsUtilsError;
  TAsUtilsError = longint;
const
  AS_UTILS_ERROR_FAILED = 0;
  AS_UTILS_ERROR_LAST = 1;

type
  PAsDataIdMatchFlags = ^TAsDataIdMatchFlags;
  TAsDataIdMatchFlags = longint;
const
  AS_DATA_ID_MATCH_FLAG_NONE = 0;
  AS_DATA_ID_MATCH_FLAG_SCOPE = 1 shl 0;
  AS_DATA_ID_MATCH_FLAG_BUNDLE_KIND = 1 shl 1;
  AS_DATA_ID_MATCH_FLAG_ORIGIN = 1 shl 2;
  AS_DATA_ID_MATCH_FLAG_ID = 1 shl 3;
  AS_DATA_ID_MATCH_FLAG_BRANCH = 1 shl 4;
  AS_DATA_ID_MATCH_FLAG_LAST = (1 shl 4) + 1;

type
  PAsMetadataLocation = ^TAsMetadataLocation;
  TAsMetadataLocation = longint;
const
  AS_METADATA_LOCATION_UNKNOWN = 0;
  AS_METADATA_LOCATION_SHARED = 1;
  AS_METADATA_LOCATION_STATE = 2;
  AS_METADATA_LOCATION_CACHE = 3;
  AS_METADATA_LOCATION_USER = 4;
  AS_METADATA_LOCATION_LAST = 5;

type
  PAsMarkupKind = ^TAsMarkupKind;
  TAsMarkupKind = longint;
const
  AS_MARKUP_KIND_UNKNOWN = 0;
  AS_MARKUP_KIND_XML = 1;
  AS_MARKUP_KIND_TEXT = 2;
  AS_MARKUP_KIND_MARKDOWN = 3;
  AS_MARKUP_KIND_LAST = 4;
  {$ENDIF read_enum}

{$IFDEF read_function}
function as_utils_error_quark: TGQuark; cdecl; external libappstream;
function as_markup_strsplit_words(text: Pgchar; line_len: Tguint): PPgchar; cdecl; external libappstream;
function as_markup_convert(markup: Pgchar; to_kind: TAsMarkupKind; error: PPGError): Pgchar; cdecl; external libappstream;
function as_utils_locale_is_compatible(locale1: Pgchar; locale2: Pgchar): Tgboolean; cdecl; external libappstream;
function as_utils_posix_locale_to_bcp47(locale: Pgchar): Pgchar; cdecl; external libappstream;
function as_utils_is_category_name(category_name: Pgchar): Tgboolean; cdecl; external libappstream;
function as_utils_is_tld(tld: Pgchar): Tgboolean; cdecl; external libappstream;
function as_utils_is_desktop_environment(de_id: Pgchar): Tgboolean; cdecl; external libappstream;
function as_utils_get_desktop_environment_name(de_id: Pgchar): Pgchar; cdecl; external libappstream;
function as_utils_is_gui_environment_style(env_style: Pgchar): Tgboolean; cdecl; external libappstream;
function as_utils_get_gui_environment_style_name(env_style: Pgchar): Pgchar; cdecl; external libappstream;
procedure as_utils_sort_components_into_categories(cpts: PGPtrArray; categories: PGPtrArray; check_duplicates: Tgboolean); cdecl; external libappstream;
function as_utils_build_data_id(scope: TAsComponentScope; bundle_kind: TAsBundleKind; origin: Pgchar; cid: Pgchar; branch: Pgchar): Pgchar; cdecl; external libappstream;
function as_utils_data_id_valid(data_id: Pgchar): Tgboolean; cdecl; external libappstream;
function as_utils_data_id_get_cid(data_id: Pgchar): Pgchar; cdecl; external libappstream;
function as_utils_data_id_match(data_id1: Pgchar; data_id2: Pgchar; match_flags: TAsDataIdMatchFlags): Tgboolean; cdecl; external libappstream;
function as_utils_data_id_equal(data_id1: Pgchar; data_id2: Pgchar): Tgboolean; cdecl; external libappstream;
function as_utils_data_id_hash(data_id: Pgchar): Tguint; cdecl; external libappstream;
function as_gstring_replace(_string: PGString; find: Pgchar; replace: Pgchar; limit: Tguint): Tguint; cdecl; external libappstream;
function as_utils_is_platform_triplet(triplet: Pgchar): Tgboolean; cdecl; external libappstream;
function as_utils_install_metadata_file(location: TAsMetadataLocation; filename: Pgchar; origin: Pgchar; destdir: Pgchar; error: PPGError): Tgboolean; cdecl; external libappstream;
function as_utils_guess_scope_from_path(path: Pgchar): TAsComponentScope; cdecl; external libappstream;
function as_utils_get_tag_search_weight(tag_name: Pgchar): Tguint16; cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:34:29 ===

function AS_UTILS_ERROR: TGQuark;
{$ENDIF read_function}

implementation

function AS_UTILS_ERROR: TGQuark;
begin
  AS_UTILS_ERROR := as_utils_error_quark;
end;

end.
