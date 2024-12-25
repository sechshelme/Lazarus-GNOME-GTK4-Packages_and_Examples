unit hb_buffer;

interface

uses
  fp_glib2, hb_common, hb_unicode;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Thb_glyph_info_t = record
    codepoint: Thb_codepoint_t;
    mask: Thb_mask_t;
    cluster: Tuint32_t;
    var1: Thb_var_int_t;
    var2: Thb_var_int_t;
  end;
  Phb_glyph_info_t = ^Thb_glyph_info_t;

  Phb_glyph_flags_t = ^Thb_glyph_flags_t;
  Thb_glyph_flags_t = longint;

const
  HB_GLYPH_FLAG_UNSAFE_TO_BREAK = $00000001;
  HB_GLYPH_FLAG_UNSAFE_TO_CONCAT = $00000002;
  HB_GLYPH_FLAG_SAFE_TO_INSERT_TATWEEL = $00000004;
  HB_GLYPH_FLAG_DEFINED = $00000007;

function hb_glyph_info_get_glyph_flags(info: Phb_glyph_info_t): Thb_glyph_flags_t; cdecl; external libharfbuzz;

type
  Thb_glyph_position_t = record
    x_advance: Thb_position_t;
    y_advance: Thb_position_t;
    x_offset: Thb_position_t;
    y_offset: Thb_position_t;
    var_: Thb_var_int_t;
  end;
  Phb_glyph_position_t = ^Thb_glyph_position_t;

  Thb_segment_properties_t = record
    direction: Thb_direction_t;
    script: Thb_script_t;
    language: Thb_language_t;
    reserved1: pointer;
    reserved2: pointer;
  end;
  Phb_segment_properties_t = ^Thb_segment_properties_t;

function hb_segment_properties_equal(a: Phb_segment_properties_t; b: Phb_segment_properties_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_segment_properties_hash(p: Phb_segment_properties_t): dword; cdecl; external libharfbuzz;
procedure hb_segment_properties_overlay(p: Phb_segment_properties_t; src: Phb_segment_properties_t); cdecl; external libharfbuzz;

type
  Thb_buffer_t = record
  end;
  Phb_buffer_t = ^Thb_buffer_t;

function hb_buffer_create: Phb_buffer_t; cdecl; external libharfbuzz;
function hb_buffer_create_similar(src: Phb_buffer_t): Phb_buffer_t; cdecl; external libharfbuzz;
procedure hb_buffer_reset(buffer: Phb_buffer_t); cdecl; external libharfbuzz;
function hb_buffer_get_empty: Phb_buffer_t; cdecl; external libharfbuzz;
function hb_buffer_reference(buffer: Phb_buffer_t): Phb_buffer_t; cdecl; external libharfbuzz;
procedure hb_buffer_destroy(buffer: Phb_buffer_t); cdecl; external libharfbuzz;
function hb_buffer_set_user_data(buffer: Phb_buffer_t; key: Phb_user_data_key_t; Data: pointer; Destroy: Thb_destroy_func_t; replace: Thb_bool_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_buffer_get_user_data(buffer: Phb_buffer_t; key: Phb_user_data_key_t): pointer; cdecl; external libharfbuzz;

type
  Phb_buffer_content_type_t = ^Thb_buffer_content_type_t;
  Thb_buffer_content_type_t = longint;

const
  HB_BUFFER_CONTENT_TYPE_INVALID = 0;
  HB_BUFFER_CONTENT_TYPE_UNICODE = 1;
  HB_BUFFER_CONTENT_TYPE_GLYPHS = 2;

procedure hb_buffer_set_content_type(buffer: Phb_buffer_t; content_type: Thb_buffer_content_type_t); cdecl; external libharfbuzz;
function hb_buffer_get_content_type(buffer: Phb_buffer_t): Thb_buffer_content_type_t; cdecl; external libharfbuzz;
procedure hb_buffer_set_unicode_funcs(buffer: Phb_buffer_t; unicode_funcs: Phb_unicode_funcs_t); cdecl; external libharfbuzz;
function hb_buffer_get_unicode_funcs(buffer: Phb_buffer_t): Phb_unicode_funcs_t; cdecl; external libharfbuzz;
procedure hb_buffer_set_direction(buffer: Phb_buffer_t; direction: Thb_direction_t); cdecl; external libharfbuzz;
function hb_buffer_get_direction(buffer: Phb_buffer_t): Thb_direction_t; cdecl; external libharfbuzz;
procedure hb_buffer_set_script(buffer: Phb_buffer_t; script: Thb_script_t); cdecl; external libharfbuzz;
function hb_buffer_get_script(buffer: Phb_buffer_t): Thb_script_t; cdecl; external libharfbuzz;
procedure hb_buffer_set_language(buffer: Phb_buffer_t; language: Thb_language_t); cdecl; external libharfbuzz;
function hb_buffer_get_language(buffer: Phb_buffer_t): Thb_language_t; cdecl; external libharfbuzz;
procedure hb_buffer_set_segment_properties(buffer: Phb_buffer_t; props: Phb_segment_properties_t); cdecl; external libharfbuzz;
procedure hb_buffer_get_segment_properties(buffer: Phb_buffer_t; props: Phb_segment_properties_t); cdecl; external libharfbuzz;
procedure hb_buffer_guess_segment_properties(buffer: Phb_buffer_t); cdecl; external libharfbuzz;

type
  Phb_buffer_flags_t = ^Thb_buffer_flags_t;
  Thb_buffer_flags_t = longint;

const
  HB_BUFFER_FLAG_DEFAULT = $00000000;
  HB_BUFFER_FLAG_BOT = $00000001;
  HB_BUFFER_FLAG_EOT = $00000002;
  HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES = $00000004;
  HB_BUFFER_FLAG_REMOVE_DEFAULT_IGNORABLES = $00000008;
  HB_BUFFER_FLAG_DO_NOT_INSERT_DOTTED_CIRCLE = $00000010;
  HB_BUFFER_FLAG_VERIFY = $00000020;
  HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT = $00000040;
  HB_BUFFER_FLAG_PRODUCE_SAFE_TO_INSERT_TATWEEL = $00000080;
  HB_BUFFER_FLAG_DEFINED = $000000FF;

procedure hb_buffer_set_flags(buffer: Phb_buffer_t; flags: Thb_buffer_flags_t); cdecl; external libharfbuzz;
function hb_buffer_get_flags(buffer: Phb_buffer_t): Thb_buffer_flags_t; cdecl; external libharfbuzz;

type
  Phb_buffer_cluster_level_t = ^Thb_buffer_cluster_level_t;
  Thb_buffer_cluster_level_t = longint;

const
  HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES = 0;
  HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS = 1;
  HB_BUFFER_CLUSTER_LEVEL_CHARACTERS = 2;
  HB_BUFFER_CLUSTER_LEVEL_DEFAULT = HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES;

procedure hb_buffer_set_cluster_level(buffer: Phb_buffer_t; cluster_level: Thb_buffer_cluster_level_t); cdecl; external libharfbuzz;
function hb_buffer_get_cluster_level(buffer: Phb_buffer_t): Thb_buffer_cluster_level_t; cdecl; external libharfbuzz;

const
  HB_BUFFER_REPLACEMENT_CODEPOINT_DEFAULT = $FFFD;

procedure hb_buffer_set_replacement_codepoint(buffer: Phb_buffer_t; replacement: Thb_codepoint_t); cdecl; external libharfbuzz;
function hb_buffer_get_replacement_codepoint(buffer: Phb_buffer_t): Thb_codepoint_t; cdecl; external libharfbuzz;
procedure hb_buffer_set_invisible_glyph(buffer: Phb_buffer_t; invisible: Thb_codepoint_t); cdecl; external libharfbuzz;
function hb_buffer_get_invisible_glyph(buffer: Phb_buffer_t): Thb_codepoint_t; cdecl; external libharfbuzz;
procedure hb_buffer_set_not_found_glyph(buffer: Phb_buffer_t; not_found: Thb_codepoint_t); cdecl; external libharfbuzz;
function hb_buffer_get_not_found_glyph(buffer: Phb_buffer_t): Thb_codepoint_t; cdecl; external libharfbuzz;
procedure hb_buffer_clear_contents(buffer: Phb_buffer_t); cdecl; external libharfbuzz;
function hb_buffer_pre_allocate(buffer: Phb_buffer_t; size: dword): Thb_bool_t; cdecl; external libharfbuzz;
function hb_buffer_allocation_successful(buffer: Phb_buffer_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_buffer_reverse(buffer: Phb_buffer_t); cdecl; external libharfbuzz;
procedure hb_buffer_reverse_range(buffer: Phb_buffer_t; start: dword; end_: dword); cdecl; external libharfbuzz;
procedure hb_buffer_reverse_clusters(buffer: Phb_buffer_t); cdecl; external libharfbuzz;
procedure hb_buffer_add(buffer: Phb_buffer_t; codepoint: Thb_codepoint_t; cluster: dword); cdecl; external libharfbuzz;
procedure hb_buffer_add_utf8(buffer: Phb_buffer_t; Text: pchar; text_length: longint; item_offset: dword; item_length: longint); cdecl; external libharfbuzz;
procedure hb_buffer_add_utf16(buffer: Phb_buffer_t; Text: Puint16_t; text_length: longint; item_offset: dword; item_length: longint); cdecl; external libharfbuzz;
procedure hb_buffer_add_utf32(buffer: Phb_buffer_t; Text: Puint32_t; text_length: longint; item_offset: dword; item_length: longint); cdecl; external libharfbuzz;
procedure hb_buffer_add_latin1(buffer: Phb_buffer_t; Text: Puint8_t; text_length: longint; item_offset: dword; item_length: longint); cdecl; external libharfbuzz;
procedure hb_buffer_add_codepoints(buffer: Phb_buffer_t; Text: Phb_codepoint_t; text_length: longint; item_offset: dword; item_length: longint); cdecl; external libharfbuzz;
procedure hb_buffer_append(buffer: Phb_buffer_t; Source: Phb_buffer_t; start: dword; end_: dword); cdecl; external libharfbuzz;
function hb_buffer_set_length(buffer: Phb_buffer_t; length: dword): Thb_bool_t; cdecl; external libharfbuzz;
function hb_buffer_get_length(buffer: Phb_buffer_t): dword; cdecl; external libharfbuzz;
function hb_buffer_get_glyph_infos(buffer: Phb_buffer_t; length: Pdword): Phb_glyph_info_t; cdecl; external libharfbuzz;
function hb_buffer_get_glyph_positions(buffer: Phb_buffer_t; length: Pdword): Phb_glyph_position_t; cdecl; external libharfbuzz;
function hb_buffer_has_positions(buffer: Phb_buffer_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_buffer_normalize_glyphs(buffer: Phb_buffer_t); cdecl; external libharfbuzz;

type
  Phb_buffer_serialize_flags_t = ^Thb_buffer_serialize_flags_t;
  Thb_buffer_serialize_flags_t = longint;

const
  HB_BUFFER_SERIALIZE_FLAG_DEFAULT = $00000000;
  HB_BUFFER_SERIALIZE_FLAG_NO_CLUSTERS = $00000001;
  HB_BUFFER_SERIALIZE_FLAG_NO_POSITIONS = $00000002;
  HB_BUFFER_SERIALIZE_FLAG_NO_GLYPH_NAMES = $00000004;
  HB_BUFFER_SERIALIZE_FLAG_GLYPH_EXTENTS = $00000008;
  HB_BUFFER_SERIALIZE_FLAG_GLYPH_FLAGS = $00000010;
  HB_BUFFER_SERIALIZE_FLAG_NO_ADVANCES = $00000020;
  HB_BUFFER_SERIALIZE_FLAG_DEFINED = $0000003F;

type
  Phb_buffer_serialize_format_t = ^Thb_buffer_serialize_format_t;
  Thb_buffer_serialize_format_t = longint;

const
  HB_BUFFER_SERIALIZE_FORMAT_TEXT = (Ord('T') shl 24) or (Ord('E') shl 16) or (Ord('X') shl 8) or Ord('T');
  HB_BUFFER_SERIALIZE_FORMAT_JSON = (Ord('J') shl 24) or (Ord('S') shl 16) or (Ord('O') shl 8) or Ord('N');
  HB_BUFFER_SERIALIZE_FORMAT_INVALID = HB_TAG_NONE;

function hb_buffer_serialize_format_from_string(str: pchar; len: longint): Thb_buffer_serialize_format_t; cdecl; external libharfbuzz;
function hb_buffer_serialize_format_to_string(format: Thb_buffer_serialize_format_t): pchar; cdecl; external libharfbuzz;
function hb_buffer_serialize_list_formats: PPchar; cdecl; external libharfbuzz;
function hb_buffer_serialize_glyphs(buffer: Phb_buffer_t; start: dword; end_: dword; buf: pchar; buf_size: dword;
  buf_consumed: Pdword; font: Phb_font_t; format: Thb_buffer_serialize_format_t; flags: Thb_buffer_serialize_flags_t): dword; cdecl; external libharfbuzz;
function hb_buffer_serialize_unicode(buffer: Phb_buffer_t; start: dword; end_: dword; buf: pchar; buf_size: dword;
  buf_consumed: Pdword; format: Thb_buffer_serialize_format_t; flags: Thb_buffer_serialize_flags_t): dword; cdecl; external libharfbuzz;
function hb_buffer_serialize(buffer: Phb_buffer_t; start: dword; end_: dword; buf: pchar; buf_size: dword;
  buf_consumed: Pdword; font: Phb_font_t; format: Thb_buffer_serialize_format_t; flags: Thb_buffer_serialize_flags_t): dword; cdecl; external libharfbuzz;
function hb_buffer_deserialize_glyphs(buffer: Phb_buffer_t; buf: pchar; buf_len: longint; end_ptr: PPchar; font: Phb_font_t;
  format: Thb_buffer_serialize_format_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_buffer_deserialize_unicode(buffer: Phb_buffer_t; buf: pchar; buf_len: longint; end_ptr: PPchar; format: Thb_buffer_serialize_format_t): Thb_bool_t; cdecl; external libharfbuzz;

type
  Phb_buffer_diff_flags_t = ^Thb_buffer_diff_flags_t;
  Thb_buffer_diff_flags_t = longint;

const
  HB_BUFFER_DIFF_FLAG_EQUAL = $0000;
  HB_BUFFER_DIFF_FLAG_CONTENT_TYPE_MISMATCH = $0001;
  HB_BUFFER_DIFF_FLAG_LENGTH_MISMATCH = $0002;
  HB_BUFFER_DIFF_FLAG_NOTDEF_PRESENT = $0004;
  HB_BUFFER_DIFF_FLAG_DOTTED_CIRCLE_PRESENT = $0008;
  HB_BUFFER_DIFF_FLAG_CODEPOINT_MISMATCH = $0010;
  HB_BUFFER_DIFF_FLAG_CLUSTER_MISMATCH = $0020;
  HB_BUFFER_DIFF_FLAG_GLYPH_FLAGS_MISMATCH = $0040;
  HB_BUFFER_DIFF_FLAG_POSITION_MISMATCH = $0080;

function hb_buffer_diff(buffer: Phb_buffer_t; reference: Phb_buffer_t; dottedcircle_glyph: Thb_codepoint_t; position_fuzz: dword): Thb_buffer_diff_flags_t; cdecl; external libharfbuzz;

type
  Thb_buffer_message_func_t = function(buffer: Phb_buffer_t; font: Phb_font_t; message: pchar; user_data: pointer): Thb_bool_t; cdecl;

procedure hb_buffer_set_message_func(buffer: Phb_buffer_t; func: Thb_buffer_message_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;


// === Konventiert am: 25-12-24 16:40:40 ===


implementation


end.
