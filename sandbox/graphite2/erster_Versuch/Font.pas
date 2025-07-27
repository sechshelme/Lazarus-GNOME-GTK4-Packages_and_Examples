unit Font;

interface

uses
  fp_graphite2,
  Types,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GR2_VERSION_MAJOR = 1;
  GR2_VERSION_MINOR = 3;
  GR2_VERSION_BUGFIX = 14;

type
  Pgr_face = type Pointer;
  Pgr_font = type Pointer;
  Pgr_feature_ref = type Pointer;
  Pgr_feature_val = type Pointer;

procedure gr_engine_version(nMajor: Plongint; nMinor: Plongint; nBugFix: Plongint); cdecl; external libgraphite2;

type
  Tgr_face_options = longint;

const
  gr_face_default = 0;
  gr_face_dumbRendering = 1;
  gr_face_preloadGlyphs = 2;
  gr_face_cacheCmap = 4;
  gr_face_preloadAll = gr_face_preloadGlyphs or gr_face_cacheCmap;

type
  Tgr_space_contextuals = longint;
  Pgr_space_contextuals = ^Tgr_space_contextuals;

const
  gr_space_unknown = 0;
  gr_space_none = 1;
  gr_space_left_only = 2;
  gr_space_right_only = 3;
  gr_space_either_only = 4;
  gr_space_both = 5;
  gr_space_cross = 6;

type
  Tgr_faceinfo = bitpacked record
    extra_ascent: Tgr_uint16;
    extra_descent: Tgr_uint16;
    upem: Tgr_uint16;
    space_contextuals: longint;
    has_bidi_pass: 0..1;
    line_ends: 0..1;
    justifies: 0..1;
  end;
  Pgr_faceinfo = ^Tgr_faceinfo;

type
  Tgr_get_table_fn = function(appFaceHandle: pointer; name: dword; len: Psize_t): pointer; cdecl;
  Tgr_release_table_fn = procedure(appFaceHandle: pointer; table_buffer: pointer); cdecl;

  Tgr_face_ops = record
    size: Tsize_t;
    get_table: Tgr_get_table_fn;
    release_table: Tgr_release_table_fn;
  end;
  Pgr_face_ops = ^Tgr_face_ops;

function gr_make_face_with_ops(appFaceHandle: pointer; face_ops: Pgr_face_ops; faceOptions: dword): Pgr_face; cdecl; external libgraphite2;
function gr_make_face(appFaceHandle: pointer; getTable: Tgr_get_table_fn; faceOptions: dword): Pgr_face; cdecl; external libgraphite2; deprecated;
function gr_make_face_with_seg_cache_and_ops(appFaceHandle: pointer; face_ops: Pgr_face_ops; segCacheMaxSize: dword; faceOptions: dword): Pgr_face; cdecl; external libgraphite2; deprecated;
function gr_make_face_with_seg_cache(appFaceHandle: pointer; getTable: Tgr_get_table_fn; segCacheMaxSize: dword; faceOptions: dword): Pgr_face; cdecl; external libgraphite2; deprecated;
function gr_str_to_tag(str: pchar): Tgr_uint32; cdecl; external libgraphite2;
procedure gr_tag_to_str(tag: Tgr_uint32; str: pchar); cdecl; external libgraphite2;
function gr_face_featureval_for_lang(pFace: Pgr_face; langname: Tgr_uint32): Pgr_feature_val; cdecl; external libgraphite2;
function gr_face_find_fref(pFace: Pgr_face; featId: Tgr_uint32): Pgr_feature_ref; cdecl; external libgraphite2;
function gr_face_n_fref(pFace: Pgr_face): Tgr_uint16; cdecl; external libgraphite2;
function gr_face_fref(pFace: Pgr_face; i: Tgr_uint16): Pgr_feature_ref; cdecl; external libgraphite2;
function gr_face_n_languages(pFace: Pgr_face): word; cdecl; external libgraphite2;
function gr_face_lang_by_index(pFace: Pgr_face; i: Tgr_uint16): Tgr_uint32; cdecl; external libgraphite2;
procedure gr_face_destroy(face: Pgr_face); cdecl; external libgraphite2;
function gr_face_n_glyphs(pFace: Pgr_face): word; cdecl; external libgraphite2;
function gr_face_info(pFace: Pgr_face; script: Tgr_uint32): Pgr_faceinfo; cdecl; external libgraphite2;
function gr_face_is_char_supported(pFace: Pgr_face; usv: Tgr_uint32; script: Tgr_uint32): longint; cdecl; external libgraphite2;
function gr_make_file_face(filename: pchar; faceOptions: dword): Pgr_face; cdecl; external libgraphite2;
function gr_make_file_face_with_seg_cache(filename: pchar; segCacheMaxSize: dword; faceOptions: dword): Pgr_face; cdecl; external libgraphite2; deprecated;
function gr_make_font(ppm: single; face: Pgr_face): Pgr_font; cdecl; external libgraphite2;

type
  Tgr_advance_fn = function(appFontHandle: pointer; glyphid: Tgr_uint16): single; cdecl;

  Tgr_font_ops = record
    size: Tsize_t;
    glyph_advance_x: Tgr_advance_fn;
    glyph_advance_y: Tgr_advance_fn;
  end;
  Pgr_font_ops = ^Tgr_font_ops;

function gr_make_font_with_ops(ppm: single; appFontHandle: pointer; font_ops: Pgr_font_ops; face: Pgr_face): Pgr_font; cdecl; external libgraphite2;
function gr_make_font_with_advance_fn(ppm: single; appFontHandle: pointer; getAdvance: Tgr_advance_fn; face: Pgr_face): Pgr_font; cdecl; external libgraphite2;
procedure gr_font_destroy(font: Pgr_font); cdecl; external libgraphite2;
function gr_fref_feature_value(pfeatureref: Pgr_feature_ref; feats: Pgr_feature_val): Tgr_uint16; cdecl; external libgraphite2;
function gr_fref_set_feature_value(pfeatureref: Pgr_feature_ref; val: Tgr_uint16; pDest: Pgr_feature_val): longint; cdecl; external libgraphite2;
function gr_fref_id(pfeatureref: Pgr_feature_ref): Tgr_uint32; cdecl; external libgraphite2;
function gr_fref_n_values(pfeatureref: Pgr_feature_ref): Tgr_uint16; cdecl; external libgraphite2;
function gr_fref_value(pfeatureref: Pgr_feature_ref; settingno: Tgr_uint16): Tgr_int16; cdecl; external libgraphite2;
function gr_fref_label(pfeatureref: Pgr_feature_ref; langId: Pgr_uint16; utf: Tgr_encform; length: Pgr_uint32): pointer; cdecl; external libgraphite2;
function gr_fref_value_label(pfeatureref: Pgr_feature_ref; settingno: Tgr_uint16; langId: Pgr_uint16; utf: Tgr_encform; length: Pgr_uint32): pointer; cdecl; external libgraphite2;
procedure gr_label_destroy(_label: pointer); cdecl; external libgraphite2;
function gr_featureval_clone(pfeatures: Pgr_feature_val): Pgr_feature_val; cdecl; external libgraphite2;
procedure gr_featureval_destroy(pfeatures: Pgr_feature_val); cdecl; external libgraphite2;

// === Konventiert am: 27-7-25 17:43:59 ===


implementation


end.
