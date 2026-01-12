unit fp_caca;

interface

const
  {$IFDEF linux}
  libcaca = 'caca';
  {$ENDIF}

  {$IFDEF windows}
  libcaca = 'libcaca-0.dll';
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;
  Tssize_t = SizeInt;
  Pssize_t = ^Tssize_t;

  Tva_list = Pointer;

  // =====

type
  Pcaca_canvas_t = type Pointer;
  Pcaca_dither_t = type Pointer;
  Pcaca_charfont_t = type Pointer;
  Pcaca_font_t = type Pointer;
  Pcaca_file_t = type Pointer;
  Pcaca_display_t = type Pointer;

type
  Tcaca_color = longint;

const
  CACA_BLACK = $00;
  CACA_BLUE = $01;
  CACA_GREEN = $02;
  CACA_CYAN = $03;
  CACA_RED = $04;
  CACA_MAGENTA = $05;
  CACA_BROWN = $06;
  CACA_LIGHTGRAY = $07;
  CACA_DARKGRAY = $08;
  CACA_LIGHTBLUE = $09;
  CACA_LIGHTGREEN = $0a;
  CACA_LIGHTCYAN = $0b;
  CACA_LIGHTRED = $0c;
  CACA_LIGHTMAGENTA = $0d;
  CACA_YELLOW = $0e;
  CACA_WHITE = $0f;
  CACA_DEFAULT = $10;
  CACA_TRANSPARENT = $20;

type
  Tcaca_style = longint;

const
  CACA_BOLD = $01;
  CACA_ITALICS = $02;
  CACA_UNDERLINE = $04;
  CACA_BLINK = $08;

type
  Tcaca_event_type = longint;

const
  CACA_EVENT_NONE = $0000;
  CACA_EVENT_KEY_PRESS = $0001;
  CACA_EVENT_KEY_RELEASE = $0002;
  CACA_EVENT_MOUSE_PRESS = $0004;
  CACA_EVENT_MOUSE_RELEASE = $0008;
  CACA_EVENT_MOUSE_MOTION = $0010;
  CACA_EVENT_RESIZE = $0020;
  CACA_EVENT_QUIT = $0040;
  CACA_EVENT_ANY = $ffff;

type
  Tcaca_event_t = record
    _type: Tcaca_event_type;
    data: record
      case longint of
        0: (mouse: record
            x: longint;
            y: longint;
            button: longint;
            end);
        1: (resize: record
            w: longint;
            h: longint;
            end);
        2: (key: record
            ch: longint;
            utf32: Tuint32_t;
            utf8: array[0..7] of char;
            end);
      end;
    padding: array[0..15] of Tuint8_t;
  end;
  Pcaca_event_t = ^Tcaca_event_t;

  Tcaca_option = record
    name: pchar;
    has_arg: longint;
    flag: Plongint;
    val: longint;
  end;
  Pcaca_option = ^Tcaca_option;

type
  Tcaca_key = longint;

const
  CACA_KEY_UNKNOWN = $00;
  CACA_KEY_CTRL_A = $01;
  CACA_KEY_CTRL_B = $02;
  CACA_KEY_CTRL_C = $03;
  CACA_KEY_CTRL_D = $04;
  CACA_KEY_CTRL_E = $05;
  CACA_KEY_CTRL_F = $06;
  CACA_KEY_CTRL_G = $07;
  CACA_KEY_BACKSPACE = $08;
  CACA_KEY_TAB = $09;
  CACA_KEY_CTRL_J = $0a;
  CACA_KEY_CTRL_K = $0b;
  CACA_KEY_CTRL_L = $0c;
  CACA_KEY_RETURN = $0d;
  CACA_KEY_CTRL_N = $0e;
  CACA_KEY_CTRL_O = $0f;
  CACA_KEY_CTRL_P = $10;
  CACA_KEY_CTRL_Q = $11;
  CACA_KEY_CTRL_R = $12;
  CACA_KEY_PAUSE = $13;
  CACA_KEY_CTRL_T = $14;
  CACA_KEY_CTRL_U = $15;
  CACA_KEY_CTRL_V = $16;
  CACA_KEY_CTRL_W = $17;
  CACA_KEY_CTRL_X = $18;
  CACA_KEY_CTRL_Y = $19;
  CACA_KEY_CTRL_Z = $1a;
  CACA_KEY_ESCAPE = $1b;
  CACA_KEY_DELETE = $7f;
  CACA_KEY_UP = $111;
  CACA_KEY_DOWN = $112;
  CACA_KEY_LEFT = $113;
  CACA_KEY_RIGHT = $114;
  CACA_KEY_INSERT = $115;
  CACA_KEY_HOME = $116;
  CACA_KEY_END = $117;
  CACA_KEY_PAGEUP = $118;
  CACA_KEY_PAGEDOWN = $119;
  CACA_KEY_F1 = $11a;
  CACA_KEY_F2 = $11b;
  CACA_KEY_F3 = $11c;
  CACA_KEY_F4 = $11d;
  CACA_KEY_F5 = $11e;
  CACA_KEY_F6 = $11f;
  CACA_KEY_F7 = $120;
  CACA_KEY_F8 = $121;
  CACA_KEY_F9 = $122;
  CACA_KEY_F10 = $123;
  CACA_KEY_F11 = $124;
  CACA_KEY_F12 = $125;
  CACA_KEY_F13 = $126;
  CACA_KEY_F14 = $127;
  CACA_KEY_F15 = $128;

type
  TcacaFunc = function(para1: pointer): longint; cdecl;

function caca_create_canvas(para1: longint; para2: longint): Pcaca_canvas_t; cdecl; external libcaca;
function caca_manage_canvas(para1: Pcaca_canvas_t; para2: TcacaFunc; para3: pointer): longint; cdecl; external libcaca;
function caca_unmanage_canvas(para1: Pcaca_canvas_t; para2: TcacaFunc; para3: pointer): longint; cdecl; external libcaca;
function caca_set_canvas_size(para1: Pcaca_canvas_t; para2: longint; para3: longint): longint; cdecl; external libcaca;
function caca_get_canvas_width(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_get_canvas_height(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_get_canvas_chars(para1: Pcaca_canvas_t): Puint32_t; cdecl; external libcaca;
function caca_get_canvas_attrs(para1: Pcaca_canvas_t): Puint32_t; cdecl; external libcaca;
function caca_free_canvas(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_rand(para1: longint; para2: longint): longint; cdecl; external libcaca;
function caca_get_version: pchar; cdecl; external libcaca;

const
  CACA_MAGIC_FULLWIDTH = $000ffffe;

function caca_gotoxy(para1: Pcaca_canvas_t; para2: longint; para3: longint): longint; cdecl; external libcaca;
function caca_wherex(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_wherey(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_put_char(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: Tuint32_t): longint; cdecl; external libcaca;
function caca_get_char(para1: Pcaca_canvas_t; para2: longint; para3: longint): Tuint32_t; cdecl; external libcaca;
function caca_put_str(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: pchar): longint; cdecl; external libcaca;
function caca_printf(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: pchar): longint; cdecl;varargs; external libcaca;
function caca_vprintf(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: pchar; para5: Tva_list): longint; cdecl; external libcaca;
function caca_clear_canvas(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_set_canvas_handle(para1: Pcaca_canvas_t; para2: longint; para3: longint): longint; cdecl; external libcaca;
function caca_get_canvas_handle_x(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_get_canvas_handle_y(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_blit(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: Pcaca_canvas_t; para5: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_set_canvas_boundaries(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint): longint; cdecl; external libcaca;

function caca_disable_dirty_rect(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_enable_dirty_rect(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_get_dirty_rect_count(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_get_dirty_rect(para1: Pcaca_canvas_t; para2: longint; para3: Plongint; para4: Plongint; para5: Plongint;
  para6: Plongint): longint; cdecl; external libcaca;
function caca_add_dirty_rect(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint): longint; cdecl; external libcaca;
function caca_remove_dirty_rect(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint): longint; cdecl; external libcaca;
function caca_clear_dirty_rect_list(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;

function caca_invert(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_flip(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_flop(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_rotate_180(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_rotate_left(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_rotate_right(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_stretch_left(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_stretch_right(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;

function caca_get_attr(para1: Pcaca_canvas_t; para2: longint; para3: longint): Tuint32_t; cdecl; external libcaca;
function caca_set_attr(para1: Pcaca_canvas_t; para2: Tuint32_t): longint; cdecl; external libcaca;
function caca_unset_attr(para1: Pcaca_canvas_t; para2: Tuint32_t): longint; cdecl; external libcaca;
function caca_toggle_attr(para1: Pcaca_canvas_t; para2: Tuint32_t): longint; cdecl; external libcaca;
function caca_put_attr(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: Tuint32_t): longint; cdecl; external libcaca;
function caca_set_color_ansi(para1: Pcaca_canvas_t; para2: Tuint8_t; para3: Tuint8_t): longint; cdecl; external libcaca;
function caca_set_color_argb(para1: Pcaca_canvas_t; para2: Tuint16_t; para3: Tuint16_t): longint; cdecl; external libcaca;
function caca_attr_to_ansi(para1: Tuint32_t): Tuint8_t; cdecl; external libcaca;
function caca_attr_to_ansi_fg(para1: Tuint32_t): Tuint8_t; cdecl; external libcaca;
function caca_attr_to_ansi_bg(para1: Tuint32_t): Tuint8_t; cdecl; external libcaca;
function caca_attr_to_rgb12_fg(para1: Tuint32_t): Tuint16_t; cdecl; external libcaca;
function caca_attr_to_rgb12_bg(para1: Tuint32_t): Tuint16_t; cdecl; external libcaca;
procedure caca_attr_to_argb64(para1: Tuint32_t; para2: Puint8_t); cdecl; external libcaca;

function caca_utf8_to_utf32(para1: pchar; para2: Psize_t): Tuint32_t; cdecl; external libcaca;
function caca_utf32_to_utf8(para1: pchar; para2: Tuint32_t): Tsize_t; cdecl; external libcaca;
function caca_utf32_to_cp437(para1: Tuint32_t): Tuint8_t; cdecl; external libcaca;
function caca_cp437_to_utf32(para1: Tuint8_t): Tuint32_t; cdecl; external libcaca;
function caca_utf32_to_ascii(para1: Tuint32_t): char; cdecl; external libcaca;
function caca_utf32_is_fullwidth(para1: Tuint32_t): longint; cdecl; external libcaca;

function caca_draw_line(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: Tuint32_t): longint; cdecl; external libcaca;
function caca_draw_polyline(para1: Pcaca_canvas_t; x: Plongint; y: Plongint; para4: longint; para5: Tuint32_t): longint; cdecl; external libcaca;
function caca_draw_thin_line(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint): longint; cdecl; external libcaca;
function caca_draw_thin_polyline(para1: Pcaca_canvas_t; x: Plongint; y: Plongint; para4: longint): longint; cdecl; external libcaca;
function caca_draw_circle(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: Tuint32_t): longint; cdecl; external libcaca;
function caca_draw_ellipse(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: Tuint32_t): longint; cdecl; external libcaca;
function caca_draw_thin_ellipse(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint): longint; cdecl; external libcaca;
function caca_fill_ellipse(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: Tuint32_t): longint; cdecl; external libcaca;
function caca_draw_box(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: Tuint32_t): longint; cdecl; external libcaca;
function caca_draw_thin_box(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint): longint; cdecl; external libcaca;
function caca_draw_cp437_box(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint): longint; cdecl; external libcaca;
function caca_fill_box(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: Tuint32_t): longint; cdecl; external libcaca;
function caca_draw_triangle(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: longint; para7: longint; para8: Tuint32_t): longint; cdecl; external libcaca;
function caca_draw_thin_triangle(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: longint; para7: longint): longint; cdecl; external libcaca;
function caca_fill_triangle(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: longint; para7: longint; para8: Tuint32_t): longint; cdecl; external libcaca;
function caca_fill_triangle_textured(cv: Pcaca_canvas_t; coords: Plongint; tex: Pcaca_canvas_t; uv: Psingle): longint; cdecl; external libcaca;

function caca_get_frame_count(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;
function caca_set_frame(para1: Pcaca_canvas_t; para2: longint): longint; cdecl; external libcaca;
function caca_get_frame_name(para1: Pcaca_canvas_t): pchar; cdecl; external libcaca;
function caca_set_frame_name(para1: Pcaca_canvas_t; para2: pchar): longint; cdecl; external libcaca;
function caca_create_frame(para1: Pcaca_canvas_t; para2: longint): longint; cdecl; external libcaca;
function caca_free_frame(para1: Pcaca_canvas_t; para2: longint): longint; cdecl; external libcaca;

function caca_create_dither(para1: longint; para2: longint; para3: longint; para4: longint; para5: Tuint32_t;
  para6: Tuint32_t; para7: Tuint32_t; para8: Tuint32_t): Pcaca_dither_t; cdecl; external libcaca;
function caca_set_dither_palette(para1: Pcaca_dither_t; r: Puint32_t; g: Puint32_t; b: Puint32_t; a: Puint32_t): longint; cdecl; external libcaca;
function caca_set_dither_brightness(para1: Pcaca_dither_t; para2: single): longint; cdecl; external libcaca;
function caca_get_dither_brightness(para1: Pcaca_dither_t): single; cdecl; external libcaca;
function caca_set_dither_gamma(para1: Pcaca_dither_t; para2: single): longint; cdecl; external libcaca;
function caca_get_dither_gamma(para1: Pcaca_dither_t): single; cdecl; external libcaca;
function caca_set_dither_contrast(para1: Pcaca_dither_t; para2: single): longint; cdecl; external libcaca;
function caca_get_dither_contrast(para1: Pcaca_dither_t): single; cdecl; external libcaca;
function caca_set_dither_antialias(para1: Pcaca_dither_t; para2: pchar): longint; cdecl; external libcaca;
function caca_get_dither_antialias_list(para1: Pcaca_dither_t): PPchar; cdecl; external libcaca;
function caca_get_dither_antialias(para1: Pcaca_dither_t): pchar; cdecl; external libcaca;
function caca_set_dither_color(para1: Pcaca_dither_t; para2: pchar): longint; cdecl; external libcaca;
function caca_get_dither_color_list(para1: Pcaca_dither_t): PPchar; cdecl; external libcaca;
function caca_get_dither_color(para1: Pcaca_dither_t): pchar; cdecl; external libcaca;
function caca_set_dither_charset(para1: Pcaca_dither_t; para2: pchar): longint; cdecl; external libcaca;
function caca_get_dither_charset_list(para1: Pcaca_dither_t): PPchar; cdecl; external libcaca;
function caca_get_dither_charset(para1: Pcaca_dither_t): pchar; cdecl; external libcaca;
function caca_set_dither_algorithm(para1: Pcaca_dither_t; para2: pchar): longint; cdecl; external libcaca;
function caca_get_dither_algorithm_list(para1: Pcaca_dither_t): PPchar; cdecl; external libcaca;
function caca_get_dither_algorithm(para1: Pcaca_dither_t): pchar; cdecl; external libcaca;
function caca_dither_bitmap(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: Pcaca_dither_t; para7: pointer): longint; cdecl; external libcaca;
function caca_free_dither(para1: Pcaca_dither_t): longint; cdecl; external libcaca;

function caca_load_charfont(para1: pointer; para2: Tsize_t): Pcaca_charfont_t; cdecl; external libcaca;
function caca_free_charfont(para1: Pcaca_charfont_t): longint; cdecl; external libcaca;

function caca_load_font(para1: pointer; para2: Tsize_t): Pcaca_font_t; cdecl; external libcaca;
function caca_get_font_list: PPchar; cdecl; external libcaca;
function caca_get_font_width(para1: Pcaca_font_t): longint; cdecl; external libcaca;
function caca_get_font_height(para1: Pcaca_font_t): longint; cdecl; external libcaca;
function caca_get_font_blocks(para1: Pcaca_font_t): Puint32_t; cdecl; external libcaca;
function caca_render_canvas(para1: Pcaca_canvas_t; para2: Pcaca_font_t; para3: pointer; para4: longint; para5: longint;
  para6: longint): longint; cdecl; external libcaca;
function caca_free_font(para1: Pcaca_font_t): longint; cdecl; external libcaca;

function caca_canvas_set_figfont(para1: Pcaca_canvas_t; para2: pchar): longint; cdecl; external libcaca;
function caca_set_figfont_smush(para1: Pcaca_canvas_t; para2: pchar): longint; cdecl; external libcaca;
function caca_set_figfont_width(para1: Pcaca_canvas_t; para2: longint): longint; cdecl; external libcaca;
function caca_put_figchar(para1: Pcaca_canvas_t; para2: Tuint32_t): longint; cdecl; external libcaca;
function caca_flush_figlet(para1: Pcaca_canvas_t): longint; cdecl; external libcaca;

function caca_file_open(para1: pchar; para2: pchar): Pcaca_file_t; cdecl; external libcaca;
function caca_file_close(para1: Pcaca_file_t): longint; cdecl; external libcaca;
function caca_file_tell(para1: Pcaca_file_t): Tuint64_t; cdecl; external libcaca;
function caca_file_read(para1: Pcaca_file_t; para2: pointer; para3: Tsize_t): Tsize_t; cdecl; external libcaca;
function caca_file_write(para1: Pcaca_file_t; para2: pointer; para3: Tsize_t): Tsize_t; cdecl; external libcaca;
function caca_file_gets(para1: Pcaca_file_t; para2: pchar; para3: longint): pchar; cdecl; external libcaca;
function caca_file_eof(para1: Pcaca_file_t): longint; cdecl; external libcaca;

function caca_import_canvas_from_memory(para1: Pcaca_canvas_t; para2: pointer; para3: Tsize_t; para4: pchar): Tssize_t; cdecl; external libcaca;
function caca_import_canvas_from_file(para1: Pcaca_canvas_t; para2: pchar; para3: pchar): Tssize_t; cdecl; external libcaca;
function caca_import_area_from_memory(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: pointer; para5: Tsize_t;
  para6: pchar): Tssize_t; cdecl; external libcaca;
function caca_import_area_from_file(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: pchar; para5: pchar): Tssize_t; cdecl; external libcaca;
function caca_get_import_list: PPchar; cdecl; external libcaca;
function caca_export_canvas_to_memory(para1: Pcaca_canvas_t; para2: pchar; para3: Psize_t): pointer; cdecl; external libcaca;
function caca_export_area_to_memory(para1: Pcaca_canvas_t; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: pchar; para7: Psize_t): pointer; cdecl; external libcaca;
function caca_get_export_list: PPchar; cdecl; external libcaca;

function caca_create_display(para1: Pcaca_canvas_t): Pcaca_display_t; cdecl; external libcaca;
function caca_create_display_with_driver(para1: Pcaca_canvas_t; para2: pchar): Pcaca_display_t; cdecl; external libcaca;
function caca_get_display_driver_list: PPchar; cdecl; external libcaca;
function caca_get_display_driver(para1: Pcaca_display_t): pchar; cdecl; external libcaca;
function caca_set_display_driver(para1: Pcaca_display_t; para2: pchar): longint; cdecl; external libcaca;
function caca_free_display(para1: Pcaca_display_t): longint; cdecl; external libcaca;
function caca_get_canvas(para1: Pcaca_display_t): Pcaca_canvas_t; cdecl; external libcaca;
function caca_refresh_display(para1: Pcaca_display_t): longint; cdecl; external libcaca;
function caca_set_display_time(para1: Pcaca_display_t; para2: longint): longint; cdecl; external libcaca;
function caca_get_display_time(para1: Pcaca_display_t): longint; cdecl; external libcaca;
function caca_get_display_width(para1: Pcaca_display_t): longint; cdecl; external libcaca;
function caca_get_display_height(para1: Pcaca_display_t): longint; cdecl; external libcaca;
function caca_set_display_title(para1: Pcaca_display_t; para2: pchar): longint; cdecl; external libcaca;
function caca_set_mouse(para1: Pcaca_display_t; para2: longint): longint; cdecl; external libcaca;
function caca_set_cursor(para1: Pcaca_display_t; para2: longint): longint; cdecl; external libcaca;

function caca_get_event(para1: Pcaca_display_t; para2: longint; para3: Pcaca_event_t; para4: longint): longint; cdecl; external libcaca;
function caca_get_mouse_x(para1: Pcaca_display_t): longint; cdecl; external libcaca;
function caca_get_mouse_y(para1: Pcaca_display_t): longint; cdecl; external libcaca;
function caca_get_event_type(para1: Pcaca_event_t): Tcaca_event_type; cdecl; external libcaca;
function caca_get_event_key_ch(para1: Pcaca_event_t): longint; cdecl; external libcaca;
function caca_get_event_key_utf32(para1: Pcaca_event_t): Tuint32_t; cdecl; external libcaca;
function caca_get_event_key_utf8(para1: Pcaca_event_t; para2: pchar): longint; cdecl; external libcaca;
function caca_get_event_mouse_button(para1: Pcaca_event_t): longint; cdecl; external libcaca;
function caca_get_event_mouse_x(para1: Pcaca_event_t): longint; cdecl; external libcaca;
function caca_get_event_mouse_y(para1: Pcaca_event_t): longint; cdecl; external libcaca;
function caca_get_event_resize_width(para1: Pcaca_event_t): longint; cdecl; external libcaca;
function caca_get_event_resize_height(para1: Pcaca_event_t): longint; cdecl; external libcaca;

var
  caca_optind: longint; cvar;external libcaca;
  caca_optarg: pchar; cvar;external libcaca;

function caca_getopt(para1: longint; para2: PPchar; para3: pchar; para4: Pcaca_option; para5: Plongint): longint; cdecl; external libcaca;

type
  TCACA_CONIO_COLORS = longint;

const
  CACA_CONIO_BLINK = 128;
  CACA_CONIO_BLACK = 0;
  CACA_CONIO_BLUE = 1;
  CACA_CONIO_GREEN = 2;
  CACA_CONIO_CYAN = 3;
  CACA_CONIO_RED = 4;
  CACA_CONIO_MAGENTA = 5;
  CACA_CONIO_BROWN = 6;
  CACA_CONIO_LIGHTGRAY = 7;
  CACA_CONIO_DARKGRAY = 8;
  CACA_CONIO_LIGHTBLUE = 9;
  CACA_CONIO_LIGHTGREEN = 10;
  CACA_CONIO_LIGHTCYAN = 11;
  CACA_CONIO_LIGHTRED = 12;
  CACA_CONIO_LIGHTMAGENTA = 13;
  CACA_CONIO_YELLOW = 14;
  CACA_CONIO_WHITE = 15;

type
  TCACA_CONIO_CURSOR = longint;

const
  CACA_CONIO__NOCURSOR = 0;
  CACA_CONIO__SOLIDCURSOR = 1;
  CACA_CONIO__NORMALCURSOR = 2;

type
  TCACA_CONIO_MODE = longint;

const
  CACA_CONIO_LASTMODE = -(1);
  CACA_CONIO_BW40 = 0;
  CACA_CONIO_C40 = 1;
  CACA_CONIO_BW80 = 2;
  CACA_CONIO_C80 = 3;
  CACA_CONIO_MONO = 7;
  CACA_CONIO_C4350 = 64;

type
  Pcaca_conio_text_info = ^Tcaca_conio_text_info;

  Tcaca_conio_text_info = record
    winleft: byte;
    wintop: byte;
    winright: byte;
    winbottom: byte;
    attribute: byte;
    normattr: byte;
    currmode: byte;
    screenheight: byte;
    screenwidth: byte;
    curx: byte;
    cury: byte;
  end;

var
  caca_conio_directvideo: longint; cvar;external libcaca;
  caca_conio__wscroll: longint; cvar;external libcaca;

function caca_conio_cgets(str: pchar): pchar; cdecl; external libcaca;
procedure caca_conio_clreol; cdecl; external libcaca;
procedure caca_conio_clrscr; cdecl; external libcaca;
function caca_conio_cprintf(format: pchar; args: array of const): longint; cdecl; external libcaca;
function caca_conio_cprintf(format: pchar): longint; cdecl; external libcaca;
function caca_conio_cputs(str: pchar): longint; cdecl; external libcaca;
function caca_conio_cscanf(format: pchar; args: array of const): longint; cdecl; external libcaca;
function caca_conio_cscanf(format: pchar): longint; cdecl; external libcaca;
procedure caca_conio_delay(para1: dword); cdecl; external libcaca;
procedure caca_conio_delline; cdecl; external libcaca;
function caca_conio_getch: longint; cdecl; external libcaca;
function caca_conio_getche: longint; cdecl; external libcaca;
function caca_conio_getpass(prompt: pchar): pchar; cdecl; external libcaca;
function caca_conio_gettext(left: longint; top: longint; right: longint; bottom: longint; destin: pointer): longint; cdecl; external libcaca;
procedure caca_conio_gettextinfo(r: Pcaca_conio_text_info); cdecl; external libcaca;
procedure caca_conio_gotoxy(x: longint; y: longint); cdecl; external libcaca;
procedure caca_conio_highvideo; cdecl; external libcaca;
procedure caca_conio_insline; cdecl; external libcaca;
function caca_conio_kbhit: longint; cdecl; external libcaca;
procedure caca_conio_lowvideo; cdecl; external libcaca;
function caca_conio_movetext(left: longint; top: longint; right: longint; bottom: longint; destleft: longint;
  desttop: longint): longint; cdecl; external libcaca;
procedure caca_conio_normvideo; cdecl; external libcaca;
procedure caca_conio_nosound; cdecl; external libcaca;
function caca_conio_printf(format: pchar; args: array of const): longint; cdecl; external libcaca;
function caca_conio_printf(format: pchar): longint; cdecl; external libcaca;
function caca_conio_putch(ch: longint): longint; cdecl; external libcaca;
function caca_conio_puttext(left: longint; top: longint; right: longint; bottom: longint; destin: pointer): longint; cdecl; external libcaca;
procedure caca_conio__setcursortype(cur_t: longint); cdecl; external libcaca;
procedure caca_conio_sleep(para1: dword); cdecl; external libcaca;
procedure caca_conio_sound(para1: dword); cdecl; external libcaca;
procedure caca_conio_textattr(newattr: longint); cdecl; external libcaca;
procedure caca_conio_textbackground(newcolor: longint); cdecl; external libcaca;
procedure caca_conio_textcolor(newcolor: longint); cdecl; external libcaca;
procedure caca_conio_textmode(newmode: longint); cdecl; external libcaca;
function caca_conio_ungetch(ch: longint): longint; cdecl; external libcaca;
function caca_conio_wherex: longint; cdecl; external libcaca;
function caca_conio_wherey: longint; cdecl; external libcaca;
procedure caca_conio_window(left: longint; top: longint; right: longint; bottom: longint); cdecl; external libcaca;

function caca_import_memory(para1: Pcaca_canvas_t; para2: pointer; para3: Tsize_t; para4: pchar): Tssize_t; cdecl; external libcaca; deprecated;
function caca_import_file(para1: Pcaca_canvas_t; para2: pchar; para3: pchar): Tssize_t; cdecl; external libcaca; deprecated;
function caca_export_memory(para1: Pcaca_canvas_t; para2: pchar; para3: Psize_t): pointer; cdecl; external libcaca; deprecated;

// === Konventiert am: 12-1-26 15:32:42 ===


implementation



end.
