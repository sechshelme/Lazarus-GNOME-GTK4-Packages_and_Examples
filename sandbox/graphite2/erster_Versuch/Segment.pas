unit Segment;

interface

uses
  fp_graphite2, Types, Font;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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

// === Konventiert am: 27-7-25 17:44:04 ===


implementation



end.
