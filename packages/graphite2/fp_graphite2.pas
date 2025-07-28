unit fp_graphite2;

interface

const
  {$IFDEF Linux}
  libgraphite2 = 'libgraphite2';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tsize_t = SizeInt;
  Psize_t = ^Tsize_t;

  PFILE = type Pointer;

// === Types.h

type
  Pgr_uint8 = ^Tgr_uint8;
  Tgr_uint8 = uint8;

  Pgr_byte = ^Tgr_byte;
  Tgr_byte = uint8;

  Pgr_int8 = ^Tgr_int8;
  Tgr_int8 = uint8;

  Pgr_uint16 = ^Tgr_uint16;
  Tgr_uint16 = uint16;

  Pgr_int16 = ^Tgr_int16;
  Tgr_int16 = int16;

  Pgr_uint32 = ^Tgr_uint32;
  Tgr_uint32 = uint32;

  Pgr_int32 = ^Tgr_int32;
  Tgr_int32 = int32;

type
  Tgr_encform = longint;

const
  gr_utf8 = 1;
  gr_utf16 = 2;
  gr_utf32 = 4;


// === Font.h

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


// === Log.h

type
  PGrLogMask = ^TGrLogMask;
  TGrLogMask = longint;

const
  GRLOG_NONE = $0;
  GRLOG_FACE = $01;
  GRLOG_SEGMENT = $02;
  GRLOG_PASS = $04;
  GRLOG_CACHE = $08;
  GRLOG_OPCODE = $80;
  GRLOG_ALL = $FF;

function gr_start_logging(face: Pgr_face; log_path: pchar): Boolean; cdecl; external libgraphite2;
procedure gr_stop_logging(face: Pgr_face); cdecl; external libgraphite2;
function graphite_start_logging(logFile: PFILE; mask: TGrLogMask): Boolean; cdecl; external libgraphite2;
procedure graphite_stop_logging; cdecl; external libgraphite2;


// === Segment.h

type
  Tgr_break_weight = longint;

const
  gr_breakNone = 0;
  gr_breakWhitespace = 10;
  gr_breakWord = 15;
  gr_breakIntra = 20;
  gr_breakLetter = 30;
  gr_breakClip = 40;
  gr_breakBeforeWhitespace = -(10);
  gr_breakBeforeWord = -(15);
  gr_breakBeforeIntra = -(20);
  gr_breakBeforeLetter = -(30);
  gr_breakBeforeClip = -(40);

type
  Tgr_justFlags = longint;

const
  gr_justCompleteLine = 0;
  gr_justStartInline = 1;
  gr_justEndInline = 2;

type
  Tgr_attrCode = longint;

const
  gr_slatAdvX = 0;
  gr_slatAdvY = 1;
  gr_slatAttTo = 2;
  gr_slatAttX = 3;
  gr_slatAttY = 4;
  gr_slatAttGpt = 5;
  gr_slatAttXOff = 6;
  gr_slatAttYOff = 7;
  gr_slatAttWithX = 8;
  gr_slatAttWithY = 9;
  gr_slatWithGpt = 10;
  gr_slatAttWithXOff = 11;
  gr_slatAttWithYOff = 12;
  gr_slatAttLevel = 13;
  gr_slatBreak = 14;
  gr_slatCompRef = 15;
  gr_slatDir = 16;
  gr_slatInsert = 17;
  gr_slatPosX = 18;
  gr_slatPosY = 19;
  gr_slatShiftX = 20;
  gr_slatShiftY = 21;
  gr_slatUserDefnV1 = 22;
  gr_slatMeasureSol = 23;
  gr_slatMeasureEol = 24;
  gr_slatJStretch = 25;
  gr_slatJShrink = 26;
  gr_slatJStep = 27;
  gr_slatJWeight = 28;
  gr_slatJWidth = 29;
  gr_slatSegSplit = gr_slatJStretch + 29;
  gr_slatUserDefn = (gr_slatJStretch + 29) + 1;
  gr_slatBidiLevel = 56;
  gr_slatColFlags = 57;
  gr_slatColLimitblx = 58;
  gr_slatColLimitbly = 59;
  gr_slatColLimittrx = 60;
  gr_slatColLimittry = 61;
  gr_slatColShiftx = 62;
  gr_slatColShifty = 63;
  gr_slatColMargin = 64;
  gr_slatColMarginWt = 65;
  gr_slatColExclGlyph = 66;
  gr_slatColExclOffx = 67;
  gr_slatColExclOffy = 68;
  gr_slatSeqClass = 69;
  gr_slatSeqProxClass = 70;
  gr_slatSeqOrder = 71;
  gr_slatSeqAboveXoff = 72;
  gr_slatSeqAboveWt = 73;
  gr_slatSeqBelowXlim = 74;
  gr_slatSeqBelowWt = 75;
  gr_slatSeqValignHt = 76;
  gr_slatSeqValignWt = 77;
  gr_slatMax = 78;
  gr_slatNoEffect = gr_slatMax + 1;

type
  Tgr_bidirtl = longint;

const
  gr_rtl = 1;
  gr_nobidi = 2;
  gr_nomirror = 4;

type
  Pgr_char_info = type Pointer;
  Pgr_segment = type Pointer;
  Pgr_slot = type Pointer;

function gr_cinfo_unicode_char(p: Pgr_char_info): dword; cdecl; external libgraphite2;
function gr_cinfo_break_weight(p: Pgr_char_info): longint; cdecl; external libgraphite2;
function gr_cinfo_after(p: Pgr_char_info): longint; cdecl; external libgraphite2;
function gr_cinfo_before(p: Pgr_char_info): longint; cdecl; external libgraphite2;
function gr_cinfo_base(p: Pgr_char_info): Tsize_t; cdecl; external libgraphite2;
function gr_count_unicode_characters(enc: Tgr_encform; buffer_begin: pointer; buffer_end: pointer; pError: Ppointer): Tsize_t; cdecl; external libgraphite2;
function gr_make_seg(font: Pgr_font; face: Pgr_face; script: Tgr_uint32; pFeats: Pgr_feature_val; enc: Tgr_encform;
  pStart: pointer; nChars: Tsize_t; dir: longint): Pgr_segment; cdecl; external libgraphite2;
procedure gr_seg_destroy(p: Pgr_segment); cdecl; external libgraphite2;
function gr_seg_advance_X(pSeg: Pgr_segment): single; cdecl; external libgraphite2;
function gr_seg_advance_Y(pSeg: Pgr_segment): single; cdecl; external libgraphite2;
function gr_seg_n_cinfo(pSeg: Pgr_segment): dword; cdecl; external libgraphite2;
function gr_seg_cinfo(pSeg: Pgr_segment; index: dword): Pgr_char_info; cdecl; external libgraphite2;
function gr_seg_n_slots(pSeg: Pgr_segment): dword; cdecl; external libgraphite2;
function gr_seg_first_slot(pSeg: Pgr_segment): Pgr_slot; cdecl; external libgraphite2;
function gr_seg_last_slot(pSeg: Pgr_segment): Pgr_slot; cdecl; external libgraphite2;
function gr_seg_justify(pSeg: Pgr_segment; pStart: Pgr_slot; pFont: Pgr_font; width: double; flags: Tgr_justFlags;
  pFirst: Pgr_slot; pLast: Pgr_slot): single; cdecl; external libgraphite2;
function gr_slot_next_in_segment(p: Pgr_slot): Pgr_slot; cdecl; external libgraphite2;
function gr_slot_prev_in_segment(p: Pgr_slot): Pgr_slot; cdecl; external libgraphite2;
function gr_slot_attached_to(p: Pgr_slot): Pgr_slot; cdecl; external libgraphite2;
function gr_slot_first_attachment(p: Pgr_slot): Pgr_slot; cdecl; external libgraphite2;
function gr_slot_next_sibling_attachment(p: Pgr_slot): Pgr_slot; cdecl; external libgraphite2;
function gr_slot_gid(p: Pgr_slot): word; cdecl; external libgraphite2;
function gr_slot_origin_X(p: Pgr_slot): single; cdecl; external libgraphite2;
function gr_slot_origin_Y(p: Pgr_slot): single; cdecl; external libgraphite2;
function gr_slot_advance_X(p: Pgr_slot; face: Pgr_face; font: Pgr_font): single; cdecl; external libgraphite2;
function gr_slot_advance_Y(p: Pgr_slot; face: Pgr_face; font: Pgr_font): single; cdecl; external libgraphite2;
function gr_slot_before(p: Pgr_slot): longint; cdecl; external libgraphite2;
function gr_slot_after(p: Pgr_slot): longint; cdecl; external libgraphite2;
function gr_slot_index(p: Pgr_slot): dword; cdecl; external libgraphite2;
function gr_slot_attr(p: Pgr_slot; pSeg: Pgr_segment; index: Tgr_attrCode; subindex: Tgr_uint8): longint; cdecl; external libgraphite2;
function gr_slot_can_insert_before(p: Pgr_slot): longint; cdecl; external libgraphite2;
function gr_slot_original(p: Pgr_slot): longint; cdecl; external libgraphite2;
procedure gr_slot_linebreak_before(p: Pgr_slot); cdecl; external libgraphite2;


implementation

end.
