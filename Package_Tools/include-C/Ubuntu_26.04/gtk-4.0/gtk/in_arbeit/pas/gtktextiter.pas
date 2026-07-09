unit gtktextiter;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_pango, fp_gtk4, gtktypes, gtktextchild, gtktexttag;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGtkTextSearchFlags = ^TGtkTextSearchFlags;
  TGtkTextSearchFlags = longint;
const
  GTK_TEXT_SEARCH_VISIBLE_ONLY = 1 shl 0;
  GTK_TEXT_SEARCH_TEXT_ONLY = 1 shl 1;
  GTK_TEXT_SEARCH_CASE_INSENSITIVE = 1 shl 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGtkTextIter = ^TGtkTextIter;
  TGtkTextIter = record
    dummy1: Tgpointer;
    dummy2: Tgpointer;
    dummy3: longint;
    dummy4: longint;
    dummy5: longint;
    dummy6: longint;
    dummy7: longint;
    dummy8: longint;
    dummy9: Tgpointer;
    dummy10: Tgpointer;
    dummy11: longint;
    dummy12: longint;
    dummy13: longint;
    dummy14: Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_text_iter_get_buffer(iter: PGtkTextIter): PGtkTextBuffer; cdecl; external libgtk4;
function gtk_text_iter_copy(iter: PGtkTextIter): PGtkTextIter; cdecl; external libgtk4;
procedure gtk_text_iter_free(iter: PGtkTextIter); cdecl; external libgtk4;
procedure gtk_text_iter_assign(iter: PGtkTextIter; other: PGtkTextIter); cdecl; external libgtk4;
function gtk_text_iter_get_type: TGType; cdecl; external libgtk4;
function gtk_text_iter_get_offset(iter: PGtkTextIter): longint; cdecl; external libgtk4;
function gtk_text_iter_get_line(iter: PGtkTextIter): longint; cdecl; external libgtk4;
function gtk_text_iter_get_line_offset(iter: PGtkTextIter): longint; cdecl; external libgtk4;
function gtk_text_iter_get_line_index(iter: PGtkTextIter): longint; cdecl; external libgtk4;
function gtk_text_iter_get_visible_line_offset(iter: PGtkTextIter): longint; cdecl; external libgtk4;
function gtk_text_iter_get_visible_line_index(iter: PGtkTextIter): longint; cdecl; external libgtk4;
function gtk_text_iter_get_char(iter: PGtkTextIter): Tgunichar; cdecl; external libgtk4;
function gtk_text_iter_get_slice(start: PGtkTextIter; end_: PGtkTextIter): pchar; cdecl; external libgtk4;
function gtk_text_iter_get_text(start: PGtkTextIter; end_: PGtkTextIter): pchar; cdecl; external libgtk4;
function gtk_text_iter_get_visible_slice(start: PGtkTextIter; end_: PGtkTextIter): pchar; cdecl; external libgtk4;
function gtk_text_iter_get_visible_text(start: PGtkTextIter; end_: PGtkTextIter): pchar; cdecl; external libgtk4;
function gtk_text_iter_get_paintable(iter: PGtkTextIter): PGdkPaintable; cdecl; external libgtk4;
function gtk_text_iter_get_marks(iter: PGtkTextIter): PGSList; cdecl; external libgtk4;
function gtk_text_iter_get_child_anchor(iter: PGtkTextIter): PGtkTextChildAnchor; cdecl; external libgtk4;
function gtk_text_iter_get_toggled_tags(iter: PGtkTextIter; toggled_on: Tgboolean): PGSList; cdecl; external libgtk4;
function gtk_text_iter_starts_tag(iter: PGtkTextIter; tag: PGtkTextTag): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_ends_tag(iter: PGtkTextIter; tag: PGtkTextTag): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_toggles_tag(iter: PGtkTextIter; tag: PGtkTextTag): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_has_tag(iter: PGtkTextIter; tag: PGtkTextTag): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_get_tags(iter: PGtkTextIter): PGSList; cdecl; external libgtk4;
function gtk_text_iter_editable(iter: PGtkTextIter; default_setting: Tgboolean): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_can_insert(iter: PGtkTextIter; default_editability: Tgboolean): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_starts_word(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_ends_word(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_inside_word(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_starts_sentence(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_ends_sentence(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_inside_sentence(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_starts_line(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_ends_line(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_is_cursor_position(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_get_chars_in_line(iter: PGtkTextIter): longint; cdecl; external libgtk4;
function gtk_text_iter_get_bytes_in_line(iter: PGtkTextIter): longint; cdecl; external libgtk4;
function gtk_text_iter_get_language(iter: PGtkTextIter): PPangoLanguage; cdecl; external libgtk4;
function gtk_text_iter_is_end(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_is_start(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;

function gtk_text_iter_forward_char(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_char(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_chars(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_chars(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_line(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_line(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_lines(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_lines(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_word_end(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_word_start(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_word_ends(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_word_starts(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_visible_line(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_visible_line(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_visible_lines(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_visible_lines(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_visible_word_end(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_visible_word_start(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_visible_word_ends(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_visible_word_starts(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_sentence_end(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_sentence_start(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_sentence_ends(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_sentence_starts(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_cursor_position(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_cursor_position(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_cursor_positions(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_cursor_positions(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_visible_cursor_position(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_visible_cursor_position(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_visible_cursor_positions(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_visible_cursor_positions(iter: PGtkTextIter; count: longint): Tgboolean; cdecl; external libgtk4;
procedure gtk_text_iter_set_offset(iter: PGtkTextIter; char_offset: longint); cdecl; external libgtk4;
procedure gtk_text_iter_set_line(iter: PGtkTextIter; line_number: longint); cdecl; external libgtk4;
procedure gtk_text_iter_set_line_offset(iter: PGtkTextIter; char_on_line: longint); cdecl; external libgtk4;
procedure gtk_text_iter_set_line_index(iter: PGtkTextIter; byte_on_line: longint); cdecl; external libgtk4;
procedure gtk_text_iter_forward_to_end(iter: PGtkTextIter); cdecl; external libgtk4;
function gtk_text_iter_forward_to_line_end(iter: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
procedure gtk_text_iter_set_visible_line_offset(iter: PGtkTextIter; char_on_line: longint); cdecl; external libgtk4;
procedure gtk_text_iter_set_visible_line_index(iter: PGtkTextIter; byte_on_line: longint); cdecl; external libgtk4;
function gtk_text_iter_forward_to_tag_toggle(iter: PGtkTextIter; tag: PGtkTextTag): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_to_tag_toggle(iter: PGtkTextIter; tag: PGtkTextTag): Tgboolean; cdecl; external libgtk4;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TGtkTextCharPredicate = function(ch: Tgunichar; user_data: Tgpointer): Tgboolean; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_text_iter_forward_find_char(iter: PGtkTextIter; pred: TGtkTextCharPredicate; user_data: Tgpointer; limit: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_find_char(iter: PGtkTextIter; pred: TGtkTextCharPredicate; user_data: Tgpointer; limit: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_forward_search(iter: PGtkTextIter; str: pchar; flags: TGtkTextSearchFlags; match_start: PGtkTextIter; match_end: PGtkTextIter;
  limit: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_backward_search(iter: PGtkTextIter; str: pchar; flags: TGtkTextSearchFlags; match_start: PGtkTextIter; match_end: PGtkTextIter;
  limit: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_equal(lhs: PGtkTextIter; rhs: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
function gtk_text_iter_compare(lhs: PGtkTextIter; rhs: PGtkTextIter): longint; cdecl; external libgtk4;
function gtk_text_iter_in_range(iter: PGtkTextIter; start: PGtkTextIter; end_: PGtkTextIter): Tgboolean; cdecl; external libgtk4;
procedure gtk_text_iter_order(first: PGtkTextIter; second: PGtkTextIter); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 14:19:02 ===

function GTK_TYPE_TEXT_ITER: TGType;
{$ENDIF read_function}

implementation

function GTK_TYPE_TEXT_ITER: TGType;
begin
  GTK_TYPE_TEXT_ITER := gtk_text_iter_get_type;
end;



end.
