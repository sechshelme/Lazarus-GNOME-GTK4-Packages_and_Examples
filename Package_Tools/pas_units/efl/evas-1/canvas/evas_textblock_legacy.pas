unit evas_textblock_legacy;

interface

uses
  ctypes, efl, eina_rectangle, eina_types, eina_iterator, Evas_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEvas_Textblock = ^TEvas_Textblock;
  TEvas_Textblock = TEo;

  TEvas_Textblock_Style = record
  end;
  PEvas_Textblock_Style = ^TEvas_Textblock_Style;

  TEvas_Textblock_Cursor = record
  end;
  PEvas_Textblock_Cursor = ^TEvas_Textblock_Cursor;

  TEvas_Object_Textblock_Node_Format = record
  end;
  PEvas_Object_Textblock_Node_Format = ^TEvas_Object_Textblock_Node_Format;

  TEfl_Canvas_Textblock_Style = TEvas_Textblock_Style;
  TEfl_Text_Cursor_Handle = TEvas_Textblock_Cursor;
  TEvas_Textblock_Node_Format = TEvas_Object_Textblock_Node_Format;

  PEvas_Textblock_Rectangle = ^TEvas_Textblock_Rectangle;
  TEvas_Textblock_Rectangle = TEina_Rectangle;

type
  PEvas_Textblock_Text_Type = ^TEvas_Textblock_Text_Type;
  TEvas_Textblock_Text_Type = longint;

const
  EVAS_TEXTBLOCK_TEXT_RAW = 0;
  EVAS_TEXTBLOCK_TEXT_PLAIN = 1;
  EVAS_TEXTBLOCK_TEXT_MARKUP = 2;

type
  PEvas_Textblock_Cursor_Type = ^TEvas_Textblock_Cursor_Type;
  TEvas_Textblock_Cursor_Type = longint;

const
  EVAS_TEXTBLOCK_CURSOR_UNDER = 0;
  EVAS_TEXTBLOCK_CURSOR_BEFORE = 1;

function evas_textblock_escape_string_get(escape: pchar): pchar; cdecl; external libevas;
function evas_textblock_string_escape_get(_string: pchar; len_ret: Plongint): pchar; cdecl; external libevas;
function evas_textblock_escape_string_range_get(escape_start: pchar; escape_end: pchar): pchar; cdecl; external libevas;
function evas_textblock_style_new: PEvas_Textblock_Style; cdecl; external libevas;
procedure evas_textblock_style_free(ts: PEvas_Textblock_Style); cdecl; external libevas;
procedure evas_textblock_style_set(ts: PEvas_Textblock_Style; text: pchar); cdecl; external libevas;
function evas_textblock_style_get(ts: PEvas_Textblock_Style): pchar; cdecl; external libevas;
function evas_textblock_node_format_next_get(n: PEvas_Object_Textblock_Node_Format): PEvas_Object_Textblock_Node_Format; cdecl; external libevas;
function evas_textblock_node_format_prev_get(n: PEvas_Object_Textblock_Node_Format): PEvas_Object_Textblock_Node_Format; cdecl; external libevas;
procedure evas_textblock_cursor_set_at_format(cur: PEvas_Textblock_Cursor; n: PEvas_Object_Textblock_Node_Format); cdecl; external libevas;
function evas_textblock_cursor_format_get(cur: PEvas_Textblock_Cursor): PEvas_Object_Textblock_Node_Format; cdecl; external libevas;
function evas_textblock_node_format_text_get(fnode: PEvas_Object_Textblock_Node_Format): pchar; cdecl; external libevas;
procedure evas_textblock_cursor_at_format_set(cur: PEvas_Textblock_Cursor; fmt: PEvas_Object_Textblock_Node_Format); cdecl; external libevas;
function evas_textblock_cursor_format_is_visible_get(cur: PEvas_Textblock_Cursor): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_format_next(cur: PEvas_Textblock_Cursor): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_format_prev(cur: PEvas_Textblock_Cursor): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_is_format(cur: PEvas_Textblock_Cursor): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_pos_get(cur: PEvas_Textblock_Cursor): longint; cdecl; external libevas;
function evas_textblock_cursor_line_set(cur: PEvas_Textblock_Cursor; line: longint): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_format_append(cur: PEvas_Textblock_Cursor; format: pchar): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_format_prepend(cur: PEvas_Textblock_Cursor; format: pchar): TEina_Bool; cdecl; external libevas;
procedure evas_textblock_cursor_range_delete(cur1: PEvas_Textblock_Cursor; cur2: PEvas_Textblock_Cursor); cdecl; external libevas;
function evas_textblock_cursor_paragraph_text_get(cur: PEvas_Textblock_Cursor): pchar; cdecl; external libevas;
function evas_textblock_cursor_paragraph_text_length_get(cur: PEvas_Textblock_Cursor): longint; cdecl; external libevas;
function evas_textblock_cursor_visible_range_get(start: PEvas_Textblock_Cursor; end_: PEvas_Textblock_Cursor): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_range_formats_get(cur1: PEvas_Textblock_Cursor; cur2: PEvas_Textblock_Cursor): PEina_List; cdecl; external libevas;
function evas_textblock_cursor_range_text_get(cur1: PEvas_Textblock_Cursor; cur2: PEvas_Textblock_Cursor; format: TEvas_Textblock_Text_Type): pchar; cdecl; external libevas;
function evas_textblock_cursor_content_get(cur: PEvas_Textblock_Cursor): pchar; cdecl; external libevas;
function evas_textblock_cursor_geometry_bidi_get(cur: PEvas_Textblock_Cursor; cx: PEvas_Coord; cy: PEvas_Coord; cw: PEvas_Coord; ch: PEvas_Coord;
  cx2: PEvas_Coord; cy2: PEvas_Coord; cw2: PEvas_Coord; ch2: PEvas_Coord; ctype: TEvas_Textblock_Cursor_Type): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_geometry_get(cur: PEvas_Textblock_Cursor; cx: PEvas_Coord; cy: PEvas_Coord; cw: PEvas_Coord; ch: PEvas_Coord;
  dir: PEvas_BiDi_Direction; ctype: TEvas_Textblock_Cursor_Type): longint; cdecl; external libevas;
function evas_textblock_cursor_char_geometry_get(cur: PEvas_Textblock_Cursor; cx: PEvas_Coord; cy: PEvas_Coord; cw: PEvas_Coord; ch: PEvas_Coord): longint; cdecl; external libevas;
function evas_textblock_cursor_pen_geometry_get(cur: PEvas_Textblock_Cursor; cpen_x: PEvas_Coord; cy: PEvas_Coord; cadv: PEvas_Coord; ch: PEvas_Coord): longint; cdecl; external libevas;
function evas_textblock_cursor_line_geometry_get(cur: PEvas_Textblock_Cursor; cx: PEvas_Coord; cy: PEvas_Coord; cw: PEvas_Coord; ch: PEvas_Coord): longint; cdecl; external libevas;
function evas_textblock_cursor_line_coord_set(cur: PEvas_Textblock_Cursor; y: TEvas_Coord): longint; cdecl; external libevas;
function evas_textblock_cursor_range_geometry_get(cur1: PEvas_Textblock_Cursor; cur2: PEvas_Textblock_Cursor): PEina_List; cdecl; external libevas;
function evas_textblock_cursor_range_simple_geometry_get(cur1: PEvas_Textblock_Cursor; cur2: PEvas_Textblock_Cursor): PEina_Iterator; cdecl; external libevas;
function evas_textblock_cursor_format_item_geometry_get(cur: PEvas_Textblock_Cursor; cx: PEvas_Coord; cy: PEvas_Coord; cw: PEvas_Coord; ch: PEvas_Coord): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_eol_get(cur: PEvas_Textblock_Cursor): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_char_prev(obj: PEvas_Textblock_Cursor): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_char_next(obj: PEvas_Textblock_Cursor): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_cluster_prev(obj: PEvas_Textblock_Cursor): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_cluster_next(obj: PEvas_Textblock_Cursor): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_paragraph_next(obj: PEvas_Textblock_Cursor): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_paragraph_prev(obj: PEvas_Textblock_Cursor): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_word_start(obj: PEvas_Textblock_Cursor): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_word_end(obj: PEvas_Textblock_Cursor): TEina_Bool; cdecl; external libevas;
function evas_object_textblock_add(e: PEvas): PEvas_Object; cdecl; external libevas;
function evas_textblock_text_markup_to_utf8(obj: PEvas_Object; text: pchar): pchar; cdecl; external libevas;
function evas_textblock_text_utf8_to_markup(obj: PEvas_Object; text: pchar): pchar; cdecl; external libevas;
procedure evas_object_textblock_clear(obj: PEvas_Object); cdecl; external libevas;
procedure evas_object_textblock_text_markup_set(obj: PEvas_Object; text: pchar); cdecl; external libevas;
function evas_object_textblock_text_markup_get(obj: PEvas_Object): pchar; cdecl; external libevas;
procedure evas_object_textblock_text_markup_prepend(cur: PEvas_Textblock_Cursor; text: pchar); cdecl; external libevas;
procedure evas_object_textblock_style_set(obj: PEvas_Object; ts: PEvas_Textblock_Style); cdecl; external libevas;
function evas_object_textblock_style_get(obj: PEvas_Object): PEvas_Textblock_Style; cdecl; external libevas;
procedure evas_object_textblock_style_user_push(obj: PEvas_Object; ts: PEvas_Textblock_Style); cdecl; external libevas;
function evas_object_textblock_style_user_peek(obj: PEvas_Object): PEvas_Textblock_Style; cdecl; external libevas;
procedure evas_object_textblock_style_user_pop(obj: PEvas_Object); cdecl; external libevas;
function evas_textblock_node_format_first_get(obj: PEvas_Object): PEvas_Object_Textblock_Node_Format; cdecl; external libevas;
function evas_textblock_node_format_last_get(obj: PEvas_Object): PEvas_Object_Textblock_Node_Format; cdecl; external libevas;
function evas_textblock_node_format_list_get(obj: PEvas_Object; anchor: pchar): PEina_List; cdecl; external libevas;
procedure evas_textblock_node_format_remove_pair(obj: PEvas_Object; n: PEvas_Object_Textblock_Node_Format); cdecl; external libevas;
function evas_object_textblock_line_number_geometry_get(obj: PEvas_Object; line: longint; cx: PEvas_Coord; cy: PEvas_Coord; cw: PEvas_Coord;
  ch: PEvas_Coord): TEina_Bool; cdecl; external libevas;
procedure evas_textblock_cursor_copy(cur: PEvas_Textblock_Cursor; cur_dest: PEvas_Textblock_Cursor); cdecl; external libevas;
function evas_object_textblock_cursor_new(obj: PEvas_Object): PEvas_Textblock_Cursor; cdecl; external libevas;
function evas_textblock_cursor_char_coord_set(obj: PEvas_Textblock_Cursor; x: TEvas_Coord; y: TEvas_Coord): TEina_Bool; cdecl; external libevas;
function evas_textblock_cursor_cluster_coord_set(obj: PEvas_Textblock_Cursor; x: TEvas_Coord; y: TEvas_Coord): TEina_Bool; cdecl; external libevas;
procedure evas_textblock_cursor_free(cur: PEvas_Textblock_Cursor); cdecl; external libevas;
function evas_textblock_cursor_text_append(cur: PEvas_Textblock_Cursor; text: pchar): longint; cdecl; external libevas;
function evas_textblock_cursor_text_prepend(cur: PEvas_Textblock_Cursor; text: pchar): longint; cdecl; external libevas;
procedure evas_object_textblock_replace_char_set(obj: PEvas_Object; ch: pchar); cdecl; external libevas;
function evas_object_textblock_replace_char_get(obj: PEvas_Object): pchar; cdecl; external libevas;
procedure evas_object_textblock_valign_set(obj: PEvas_Object; align: double); cdecl; external libevas;
function evas_object_textblock_valign_get(obj: PEvas_Object): double; cdecl; external libevas;
procedure evas_textblock_cursor_paragraph_first(cur: PEvas_Textblock_Cursor); cdecl; external libevas;
procedure evas_textblock_cursor_paragraph_last(cur: PEvas_Textblock_Cursor); cdecl; external libevas;
function evas_textblock_cursor_compare(cur1: PEvas_Textblock_Cursor; cur2: PEvas_Textblock_Cursor): longint; cdecl; external libevas;
function evas_textblock_cursor_equal(obj: PEvas_Textblock_Cursor; cur: PEvas_Textblock_Cursor): TEina_Bool; cdecl; external libevas;
procedure evas_textblock_cursor_line_char_first(cur: PEvas_Textblock_Cursor); cdecl; external libevas;
procedure evas_textblock_cursor_line_char_last(cur: PEvas_Textblock_Cursor); cdecl; external libevas;
procedure evas_textblock_cursor_pos_set(cur: PEvas_Textblock_Cursor; _pos: longint); cdecl; external libevas;
procedure evas_textblock_cursor_paragraph_char_first(cur: PEvas_Textblock_Cursor); cdecl; external libevas;
procedure evas_textblock_cursor_paragraph_char_last(cur: PEvas_Textblock_Cursor); cdecl; external libevas;
procedure evas_textblock_cursor_char_delete(cur: PEvas_Textblock_Cursor); cdecl; external libevas;
function evas_object_textblock_cursor_get(obj: PEvas_Object): PEvas_Textblock_Cursor; cdecl; external libevas;

const
  TEXTBLOCK_FIT_MODE_NONE = $0000;
  TEXTBLOCK_FIT_MODE_WIDTH = $0001;
  TEXTBLOCK_FIT_MODE_HEIGHT = $0002;
  TEXTBLOCK_FIT_MODE_ALL = $0003;
  EVAS_ERROR_SUCCESS = $0000;
  EVAS_ERROR_INVALID_PARAM = $0001;
  EVAS_ERROR_NO_MEMORY = $0002;
  EVAS_ERROR_INVALID_OPERATION = $0003;

function evas_textblock_fit_options_get(obj: PEvas_Object; p_options: Pdword): longint; cdecl; external libevas;
function evas_textblock_fit_options_set(obj: PEvas_Object; options: dword): longint; cdecl; external libevas;
function evas_textblock_fit_size_range_get(obj: PEvas_Object; p_min_font_size: Pdword; p_max_font_size: Pdword): longint; cdecl; external libevas;
function evas_textblock_fit_size_range_set(obj: PEvas_Object; min_font_size: dword; max_font_size: dword): longint; cdecl; external libevas;
function evas_textblock_fit_step_size_get(obj: PEvas_Object; p_step_size: Pdword): longint; cdecl; external libevas;
function evas_textblock_fit_step_size_set(obj: PEvas_Object; step_size: dword): longint; cdecl; external libevas;
function evas_textblock_fit_size_array_get(obj: PEvas_Object; p_size_array: Pdword; p_size_array_len: Psize_t; request_size_array: Tsize_t): longint; cdecl; external libevas;
function evas_textblock_fit_size_array_set(obj: PEvas_Object; p_size_array: Pdword; size_array_len: Tsize_t): longint; cdecl; external libevas;
function evas_textblock_fit_font_size_get(obj: PEvas_Object): longint; cdecl; external libevas;

// === Konventiert am: 11-5-25 19:22:28 ===


implementation



end.
