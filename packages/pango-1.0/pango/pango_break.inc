
{$IFDEF read_interface}

type
  TPangoLogAttr = bitpacked record
    is_line_break: 0..1;
    is_mandatory_break: 0..1;
    is_char_break: 0..1;
    is_white: 0..1;
    is_cursor_position: 0..1;
    is_word_start: 0..1;
    is_word_end: 0..1;
    is_sentence_boundary: 0..1;
    is_sentence_start: 0..1;
    is_sentence_end: 0..1;
    backspace_deletes_character: 0..1;
    is_expandable_space: 0..1;
    is_word_boundary: 0..1;
    break_inserts_hyphen: 0..1;
    break_removes_preceding: 0..1;
    reserved: UInt16;
//    reserved: 0..1 shl 17;
  end;
  PPangoLogAttr = ^TPangoLogAttr;
  PPPangoLogAttr = ^PPangoLogAttr;

const
  bm_TPangoLogAttr_is_line_break = $1;
  bp_TPangoLogAttr_is_line_break = 0;
  bm_TPangoLogAttr_is_mandatory_break = $2;
  bp_TPangoLogAttr_is_mandatory_break = 1;
  bm_TPangoLogAttr_is_char_break = $4;
  bp_TPangoLogAttr_is_char_break = 2;
  bm_TPangoLogAttr_is_white = $8;
  bp_TPangoLogAttr_is_white = 3;
  bm_TPangoLogAttr_is_cursor_position = $10;
  bp_TPangoLogAttr_is_cursor_position = 4;
  bm_TPangoLogAttr_is_word_start = $20;
  bp_TPangoLogAttr_is_word_start = 5;
  bm_TPangoLogAttr_is_word_end = $40;
  bp_TPangoLogAttr_is_word_end = 6;
  bm_TPangoLogAttr_is_sentence_boundary = $80;
  bp_TPangoLogAttr_is_sentence_boundary = 7;
  bm_TPangoLogAttr_is_sentence_start = $100;
  bp_TPangoLogAttr_is_sentence_start = 8;
  bm_TPangoLogAttr_is_sentence_end = $200;
  bp_TPangoLogAttr_is_sentence_end = 9;
  bm_TPangoLogAttr_backspace_deletes_character = $400;
  bp_TPangoLogAttr_backspace_deletes_character = 10;
  bm_TPangoLogAttr_is_expandable_space = $800;
  bp_TPangoLogAttr_is_expandable_space = 11;
  bm_TPangoLogAttr_is_word_boundary = $1000;
  bp_TPangoLogAttr_is_word_boundary = 12;
  bm_TPangoLogAttr_break_inserts_hyphen = $2000;
  bp_TPangoLogAttr_break_inserts_hyphen = 13;
  bm_TPangoLogAttr_break_removes_preceding = $4000;
  bp_TPangoLogAttr_break_removes_preceding = 14;
  bm_TPangoLogAttr_reserved = $FFFF8000;
  bp_TPangoLogAttr_reserved = 15;


procedure pango_break(Text: pchar; length: longint; analysis: PPangoAnalysis; attrs: PPangoLogAttr; attrs_len: longint); cdecl; external libpango;
procedure pango_get_log_attrs(Text: pchar; length: longint; level: longint; language: PPangoLanguage; attrs: PPangoLogAttr;
  attrs_len: longint); cdecl; external libpango;
procedure pango_default_break(Text: pchar; length: longint; analysis: PPangoAnalysis; attrs: PPangoLogAttr; attrs_len: longint); cdecl; external libpango;
procedure pango_tailor_break(Text: pchar; length: longint; analysis: PPangoAnalysis; offset: longint; attrs: PPangoLogAttr;
  attrs_len: longint); cdecl; external libpango;
procedure pango_attr_break(Text: pchar; length: longint; attr_list: PPangoAttrList; offset: longint; attrs: PPangoLogAttr;
  attrs_len: longint); cdecl; external libpango;

// === Konventiert am: 23-11-24 19:50:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
