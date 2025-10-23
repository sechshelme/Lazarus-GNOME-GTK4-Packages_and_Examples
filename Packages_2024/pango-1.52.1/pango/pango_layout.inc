
{$IFDEF read_interface}

type
  PPangoLayoutRun = ^TPangoLayoutRun;
  TPangoLayoutRun = TPangoGlyphItem;

  PPangoAlignment = ^TPangoAlignment;
  TPangoAlignment = longint;

const
  PANGO_ALIGN_LEFT = 0;
  PANGO_ALIGN_CENTER = 1;
  PANGO_ALIGN_RIGHT = 2;

type
  PPangoWrapMode = ^TPangoWrapMode;
  TPangoWrapMode = longint;

const
  PANGO_WRAP_WORD = 0;
  PANGO_WRAP_CHAR = 1;
  PANGO_WRAP_WORD_CHAR = 2;

type
  PPangoEllipsizeMode = ^TPangoEllipsizeMode;
  TPangoEllipsizeMode = longint;

const
  PANGO_ELLIPSIZE_NONE = 0;
  PANGO_ELLIPSIZE_START = 1;
  PANGO_ELLIPSIZE_MIDDLE = 2;
  PANGO_ELLIPSIZE_END = 3;

type
  TPangoLayout = record
  end;
  PPangoLayout = ^TPangoLayout;

  TPangoLayoutLine = record
    layout: PPangoLayout;
    start_index: Tgint;
    length: Tgint;
    runs: PGSList;
    flag0: word;
  end;
  PPangoLayoutLine = ^TPangoLayoutLine;


const
  bm_TPangoLayoutLine_is_paragraph_start = $1;
  bp_TPangoLayoutLine_is_paragraph_start = 0;
  bm_TPangoLayoutLine_resolved_dir = $E;
  bp_TPangoLayoutLine_resolved_dir = 1;

function pango_layout_get_type: TGType; cdecl; external libpango;
function pango_layout_new(context: PPangoContext): PPangoLayout; cdecl; external libpango;
function pango_layout_copy(src: PPangoLayout): PPangoLayout; cdecl; external libpango;
function pango_layout_get_context(layout: PPangoLayout): PPangoContext; cdecl; external libpango;
procedure pango_layout_set_attributes(layout: PPangoLayout; attrs: PPangoAttrList); cdecl; external libpango;
function pango_layout_get_attributes(layout: PPangoLayout): PPangoAttrList; cdecl; external libpango;
procedure pango_layout_set_text(layout: PPangoLayout; Text: pchar; length: longint); cdecl; external libpango;
function pango_layout_get_text(layout: PPangoLayout): pchar; cdecl; external libpango;
function pango_layout_get_character_count(layout: PPangoLayout): Tgint; cdecl; external libpango;
procedure pango_layout_set_markup(layout: PPangoLayout; markup: pchar; length: longint); cdecl; external libpango;
procedure pango_layout_set_markup_with_accel(layout: PPangoLayout; markup: pchar; length: longint; accel_marker: Tgunichar; accel_char: Pgunichar); cdecl; external libpango;
procedure pango_layout_set_font_description(layout: PPangoLayout; desc: PPangoFontDescription); cdecl; external libpango;
function pango_layout_get_font_description(layout: PPangoLayout): PPangoFontDescription; cdecl; external libpango;
procedure pango_layout_set_width(layout: PPangoLayout; Width: longint); cdecl; external libpango;
function pango_layout_get_width(layout: PPangoLayout): longint; cdecl; external libpango;
procedure pango_layout_set_height(layout: PPangoLayout; Height: longint); cdecl; external libpango;
function pango_layout_get_height(layout: PPangoLayout): longint; cdecl; external libpango;
procedure pango_layout_set_wrap(layout: PPangoLayout; wrap: TPangoWrapMode); cdecl; external libpango;
function pango_layout_get_wrap(layout: PPangoLayout): TPangoWrapMode; cdecl; external libpango;
function pango_layout_is_wrapped(layout: PPangoLayout): Tgboolean; cdecl; external libpango;
procedure pango_layout_set_indent(layout: PPangoLayout; indent: longint); cdecl; external libpango;
function pango_layout_get_indent(layout: PPangoLayout): longint; cdecl; external libpango;
procedure pango_layout_set_spacing(layout: PPangoLayout; spacing: longint); cdecl; external libpango;
function pango_layout_get_spacing(layout: PPangoLayout): longint; cdecl; external libpango;
procedure pango_layout_set_line_spacing(layout: PPangoLayout; factor: single); cdecl; external libpango;
function pango_layout_get_line_spacing(layout: PPangoLayout): single; cdecl; external libpango;
procedure pango_layout_set_justify(layout: PPangoLayout; justify: Tgboolean); cdecl; external libpango;
function pango_layout_get_justify(layout: PPangoLayout): Tgboolean; cdecl; external libpango;
procedure pango_layout_set_justify_last_line(layout: PPangoLayout; justify: Tgboolean); cdecl; external libpango;
function pango_layout_get_justify_last_line(layout: PPangoLayout): Tgboolean; cdecl; external libpango;
procedure pango_layout_set_auto_dir(layout: PPangoLayout; auto_dir: Tgboolean); cdecl; external libpango;
function pango_layout_get_auto_dir(layout: PPangoLayout): Tgboolean; cdecl; external libpango;
procedure pango_layout_set_alignment(layout: PPangoLayout; alignment: TPangoAlignment); cdecl; external libpango;
function pango_layout_get_alignment(layout: PPangoLayout): TPangoAlignment; cdecl; external libpango;
procedure pango_layout_set_tabs(layout: PPangoLayout; tabs: PPangoTabArray); cdecl; external libpango;
function pango_layout_get_tabs(layout: PPangoLayout): PPangoTabArray; cdecl; external libpango;
procedure pango_layout_set_single_paragraph_mode(layout: PPangoLayout; setting: Tgboolean); cdecl; external libpango;
function pango_layout_get_single_paragraph_mode(layout: PPangoLayout): Tgboolean; cdecl; external libpango;
procedure pango_layout_set_ellipsize(layout: PPangoLayout; ellipsize: TPangoEllipsizeMode); cdecl; external libpango;
function pango_layout_get_ellipsize(layout: PPangoLayout): TPangoEllipsizeMode; cdecl; external libpango;
function pango_layout_is_ellipsized(layout: PPangoLayout): Tgboolean; cdecl; external libpango;
function pango_layout_get_unknown_glyphs_count(layout: PPangoLayout): longint; cdecl; external libpango;
function pango_layout_get_direction(layout: PPangoLayout; index: longint): TPangoDirection; cdecl; external libpango;
procedure pango_layout_context_changed(layout: PPangoLayout); cdecl; external libpango;
function pango_layout_get_serial(layout: PPangoLayout): Tguint; cdecl; external libpango;
procedure pango_layout_get_log_attrs(layout: PPangoLayout; attrs: PPPangoLogAttr; n_attrs: Pgint); cdecl; external libpango;
function pango_layout_get_log_attrs_readonly(layout: PPangoLayout; n_attrs: Pgint): PPangoLogAttr; cdecl; external libpango;
procedure pango_layout_index_to_pos(layout: PPangoLayout; index_: longint; pos: PPangoRectangle); cdecl; external libpango;
procedure pango_layout_index_to_line_x(layout: PPangoLayout; index_: longint; trailing: Tgboolean; line: Plongint; x_pos: Plongint); cdecl; external libpango;
procedure pango_layout_get_cursor_pos(layout: PPangoLayout; index_: longint; strong_pos: PPangoRectangle; weak_pos: PPangoRectangle); cdecl; external libpango;
procedure pango_layout_get_caret_pos(layout: PPangoLayout; index_: longint; strong_pos: PPangoRectangle; weak_pos: PPangoRectangle); cdecl; external libpango;
procedure pango_layout_move_cursor_visually(layout: PPangoLayout; strong: Tgboolean; old_index: longint; old_trailing: longint; direction: longint;
  new_index: Plongint; new_trailing: Plongint); cdecl; external libpango;
function pango_layout_xy_to_index(layout: PPangoLayout; x: longint; y: longint; index_: Plongint; trailing: Plongint): Tgboolean; cdecl; external libpango;
procedure pango_layout_get_extents(layout: PPangoLayout; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external libpango;
procedure pango_layout_get_pixel_extents(layout: PPangoLayout; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external libpango;
procedure pango_layout_get_size(layout: PPangoLayout; Width: Plongint; Height: Plongint); cdecl; external libpango;
procedure pango_layout_get_pixel_size(layout: PPangoLayout; Width: Plongint; Height: Plongint); cdecl; external libpango;
function pango_layout_get_baseline(layout: PPangoLayout): longint; cdecl; external libpango;
function pango_layout_get_line_count(layout: PPangoLayout): longint; cdecl; external libpango;
function pango_layout_get_line(layout: PPangoLayout; line: longint): PPangoLayoutLine; cdecl; external libpango;
function pango_layout_get_line_readonly(layout: PPangoLayout; line: longint): PPangoLayoutLine; cdecl; external libpango;
function pango_layout_get_lines(layout: PPangoLayout): PGSList; cdecl; external libpango;
function pango_layout_get_lines_readonly(layout: PPangoLayout): PGSList; cdecl; external libpango;

type
  PPangoLayoutSerializeFlags = ^TPangoLayoutSerializeFlags;
  TPangoLayoutSerializeFlags = longint;

const
  PANGO_LAYOUT_SERIALIZE_DEFAULT = 0;
  PANGO_LAYOUT_SERIALIZE_CONTEXT = 1 shl 0;
  PANGO_LAYOUT_SERIALIZE_OUTPUT = 1 shl 1;

function pango_layout_serialize(layout: PPangoLayout; flags: TPangoLayoutSerializeFlags): PGBytes; cdecl; external libpango;
function pango_layout_write_to_file(layout: PPangoLayout; flags: TPangoLayoutSerializeFlags; filename: pchar; error: PPGError): Tgboolean; cdecl; external libpango;

type
  PPangoLayoutDeserializeError = ^TPangoLayoutDeserializeError;
  TPangoLayoutDeserializeError = longint;

const
  PANGO_LAYOUT_DESERIALIZE_INVALID = 0;
  PANGO_LAYOUT_DESERIALIZE_INVALID_VALUE = 1;
  PANGO_LAYOUT_DESERIALIZE_MISSING_VALUE = 2;

function pango_layout_deserialize_error_quark: TGQuark; cdecl; external libpango;

type
  PPangoLayoutDeserializeFlags = ^TPangoLayoutDeserializeFlags;
  TPangoLayoutDeserializeFlags = longint;

const
  PANGO_LAYOUT_DESERIALIZE_DEFAULT = 0;
  PANGO_LAYOUT_DESERIALIZE_CONTEXT = 1 shl 0;

function pango_layout_deserialize(context: PPangoContext; bytes: PGBytes; flags: TPangoLayoutDeserializeFlags; error: PPGError): PPangoLayout; cdecl; external libpango;
function pango_layout_line_get_type: TGType; cdecl; external libpango;
function pango_layout_line_ref(line: PPangoLayoutLine): PPangoLayoutLine; cdecl; external libpango;
procedure pango_layout_line_unref(line: PPangoLayoutLine); cdecl; external libpango;
function pango_layout_line_get_start_index(line: PPangoLayoutLine): longint; cdecl; external libpango;
function pango_layout_line_get_length(line: PPangoLayoutLine): longint; cdecl; external libpango;
function pango_layout_line_is_paragraph_start(line: PPangoLayoutLine): Tgboolean; cdecl; external libpango;
function pango_layout_line_get_resolved_direction(line: PPangoLayoutLine): TPangoDirection; cdecl; external libpango;
function pango_layout_line_x_to_index(line: PPangoLayoutLine; x_pos: longint; index_: Plongint; trailing: Plongint): Tgboolean; cdecl; external libpango;
procedure pango_layout_line_index_to_x(line: PPangoLayoutLine; index_: longint; trailing: Tgboolean; x_pos: Plongint); cdecl; external libpango;
procedure pango_layout_line_get_x_ranges(line: PPangoLayoutLine; start_index: longint; end_index: longint; ranges: PPlongint; n_ranges: Plongint); cdecl; external libpango;
procedure pango_layout_line_get_extents(line: PPangoLayoutLine; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external libpango;
procedure pango_layout_line_get_height(line: PPangoLayoutLine; Height: Plongint); cdecl; external libpango;
procedure pango_layout_line_get_pixel_extents(layout_line: PPangoLayoutLine; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external libpango;

type
  TPangoLayoutIter = record
  end;
  PPangoLayoutIter = ^TPangoLayoutIter;

  TPangoLayoutClass = record
  end;
  PPangoLayoutClass = ^TPangoLayoutClass;

function pango_layout_iter_get_type: TGType; cdecl; external libpango;
function pango_layout_get_iter(layout: PPangoLayout): PPangoLayoutIter; cdecl; external libpango;
function pango_layout_iter_copy(iter: PPangoLayoutIter): PPangoLayoutIter; cdecl; external libpango;
procedure pango_layout_iter_free(iter: PPangoLayoutIter); cdecl; external libpango;
function pango_layout_iter_get_index(iter: PPangoLayoutIter): longint; cdecl; external libpango;
function pango_layout_iter_get_run(iter: PPangoLayoutIter): PPangoLayoutRun; cdecl; external libpango;
function pango_layout_iter_get_run_readonly(iter: PPangoLayoutIter): PPangoLayoutRun; cdecl; external libpango;
function pango_layout_iter_get_line(iter: PPangoLayoutIter): PPangoLayoutLine; cdecl; external libpango;
function pango_layout_iter_get_line_readonly(iter: PPangoLayoutIter): PPangoLayoutLine; cdecl; external libpango;
function pango_layout_iter_at_last_line(iter: PPangoLayoutIter): Tgboolean; cdecl; external libpango;
function pango_layout_iter_get_layout(iter: PPangoLayoutIter): PPangoLayout; cdecl; external libpango;
function pango_layout_iter_next_char(iter: PPangoLayoutIter): Tgboolean; cdecl; external libpango;
function pango_layout_iter_next_cluster(iter: PPangoLayoutIter): Tgboolean; cdecl; external libpango;
function pango_layout_iter_next_run(iter: PPangoLayoutIter): Tgboolean; cdecl; external libpango;
function pango_layout_iter_next_line(iter: PPangoLayoutIter): Tgboolean; cdecl; external libpango;
procedure pango_layout_iter_get_char_extents(iter: PPangoLayoutIter; logical_rect: PPangoRectangle); cdecl; external libpango;
procedure pango_layout_iter_get_cluster_extents(iter: PPangoLayoutIter; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external libpango;
procedure pango_layout_iter_get_run_extents(iter: PPangoLayoutIter; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external libpango;
procedure pango_layout_iter_get_line_extents(iter: PPangoLayoutIter; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external libpango;
procedure pango_layout_iter_get_line_yrange(iter: PPangoLayoutIter; y0_: Plongint; y1_: Plongint); cdecl; external libpango;
procedure pango_layout_iter_get_layout_extents(iter: PPangoLayoutIter; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external libpango;
function pango_layout_iter_get_baseline(iter: PPangoLayoutIter): longint; cdecl; external libpango;
function pango_layout_iter_get_run_baseline(iter: PPangoLayoutIter): longint; cdecl; external libpango;

function PANGO_LAYOUT_DESERIALIZE_ERROR: TGQuark;
function PANGO_TYPE_LAYOUT_LINE: TGType;
function PANGO_TYPE_LAYOUT_ITER: TGType;

// === Konventiert am: 24-11-24 19:32:08 ===

function PANGO_TYPE_LAYOUT: TGType;
function PANGO_LAYOUT(obj: Pointer): PPangoLayout;
function PANGO_LAYOUT_CLASS(klass: Pointer): PPangoLayoutClass;
function PANGO_IS_LAYOUT(obj: Pointer): Tgboolean;
function PANGO_IS_LAYOUT_CLASS(klass: Pointer): Tgboolean;
function PANGO_LAYOUT_GET_CLASS(obj: Pointer): PPangoLayoutClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_LAYOUT: TGType;
begin
  PANGO_TYPE_LAYOUT := pango_layout_get_type;
end;

function PANGO_LAYOUT(obj: Pointer): PPangoLayout;
begin
  Result := PPangoLayout(g_type_check_instance_cast(obj, PANGO_TYPE_LAYOUT));
end;

function PANGO_LAYOUT_CLASS(klass: Pointer): PPangoLayoutClass;
begin
  Result := PPangoLayoutClass(g_type_check_class_cast(klass, PANGO_TYPE_LAYOUT));
end;

function PANGO_IS_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_LAYOUT);
end;

function PANGO_IS_LAYOUT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PANGO_TYPE_LAYOUT);
end;

function PANGO_LAYOUT_GET_CLASS(obj: Pointer): PPangoLayoutClass;
begin
  Result := PPangoLayoutClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function PANGO_LAYOUT_DESERIALIZE_ERROR: TGQuark;
begin
  PANGO_LAYOUT_DESERIALIZE_ERROR := pango_layout_deserialize_error_quark;
end;

function PANGO_TYPE_LAYOUT_LINE: TGType;
begin
  PANGO_TYPE_LAYOUT_LINE := pango_layout_line_get_type;
end;

function PANGO_TYPE_LAYOUT_ITER: TGType;
begin
  PANGO_TYPE_LAYOUT_ITER := pango_layout_iter_get_type;
end;


{$ENDIF read_implementation}
