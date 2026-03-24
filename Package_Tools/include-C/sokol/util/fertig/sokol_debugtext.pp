
unit sokol_debugtext;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_debugtext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_debugtext.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Psdtx_allocator_t  = ^sdtx_allocator_t;
Psdtx_context  = ^sdtx_context;
Psdtx_context_desc_t  = ^sdtx_context_desc_t;
Psdtx_desc_t  = ^sdtx_desc_t;
Psdtx_font_desc_t  = ^sdtx_font_desc_t;
Psdtx_logger_t  = ^sdtx_logger_t;
Psdtx_range  = ^sdtx_range;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(* Const before type ignored *)
{ always "sdtx" }
{ 0=panic, 1=error, 2=warning, 3=info }
{ SDTX_LOGITEM_* }
(* Const before type ignored *)
{ a message string, may be nullptr in release mode }
{ line number in sokol_debugtext.h }
(* Const before type ignored *)
{ source filename, may be nullptr in release mode }
type
  Psdtx_logger_t = ^Tsdtx_logger_t;
  Tsdtx_logger_t = record
      func : procedure (tag:Pchar; log_level:Tuint32_t; log_item_id:Tuint32_t; message_or_null:Pchar; line_nr:Tuint32_t; 
                    filename_or_null:Pchar; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{ a rendering context handle  }

  Psdtx_context = ^Tsdtx_context;
  Tsdtx_context = record
      id : Tuint32_t;
    end;
{ the default context handle  }
{xxxxxxxxxxx  static const sdtx_context SDTX_DEFAULT_CONTEXT =  0x00010001 ; }
{
    sdtx_range is a pointer-size-pair struct used to pass memory
    blobs into sokol-debugtext. When initialized from a value type
    (array or struct), use the SDTX_RANGE() macro to build
    an sdtx_range struct.
 }
(* Const before type ignored *)

  Psdtx_range = ^Tsdtx_range;
  Tsdtx_range = record
      ptr : pointer;
      size : Tsize_t;
    end;
{
    sdtx_font_desc_t

    Describes the pixel data of a font. A font consists of up to
    256 8x8 character tiles, where each character tile is described
    by 8 consecutive bytes, each byte describing 8 pixels.

    For instance the character 'A' could look like this (this is also
    how most home computers used to describe their fonts in ROM):

        bits
        7 6 5 4 3 2 1 0
        . . . X X . . .     byte 0: 0x18
        . . X X X X . .     byte 1: 0x3C
        . X X . . X X .     byte 2: 0x66
        . X X . . X X .     byte 3: 0x66
        . X X X X X X .     byte 4: 0x7E
        . X X . . X X .     byte 5: 0x66
        . X X . . X X .     byte 6: 0x66
        . . . . . . . .     byte 7: 0x00
  }

const
  SDTX_MAX_FONTS = 8;  
{ pointer to and size of font pixel data }
{ first character index in font pixel data }
{ last character index in font pixel data, inclusive (default: 255) }
type
  Psdtx_font_desc_t = ^Tsdtx_font_desc_t;
  Tsdtx_font_desc_t = record
      data : Tsdtx_range;
      first_char : Tuint8_t;
      last_char : Tuint8_t;
    end;
{
    sdtx_context_desc_t

    Describes the initialization parameters of a rendering context. Creating
    additional rendering contexts is useful if you want to render in
    different sokol-gfx rendering passes, or when rendering several layers
    of text.
 }
{ max number of draw commands, each layer transition counts as a command, default: 4096 }
{ max number of characters rendered in one frame, default: 4096 }
{ the initial virtual canvas width, default: 640 }
{ the initial virtual canvas height, default: 400 }
{ tab width in number of characters, default: 4 }
{ color pixel format of target render pass }
{ depth pixel format of target render pass }
{ MSAA sample count of target render pass }

  Psdtx_context_desc_t = ^Tsdtx_context_desc_t;
  Tsdtx_context_desc_t = record
      max_commands : longint;
      char_buf_size : longint;
      canvas_width : single;
      canvas_height : single;
      tab_width : longint;
      color_format : Tsg_pixel_format;
      depth_format : Tsg_pixel_format;
      sample_count : longint;
    end;
{
    sdtx_allocator_t

    Used in sdtx_desc_t to provide custom memory-alloc and -free functions
    to sokol_debugtext.h. If memory management should be overridden, both the
    alloc_fn and free_fn function must be provided (e.g. it's not valid to
    override one function but not the other).
 }

  Psdtx_allocator_t = ^Tsdtx_allocator_t;
  Tsdtx_allocator_t = record
      alloc_fn : function (size:Tsize_t; user_data:pointer):pointer;cdecl;
      free_fn : procedure (ptr:pointer; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{
    sdtx_desc_t

    Describes the sokol-debugtext API initialization parameters. Passed
    to the sdtx_setup() function.

    NOTE: to populate the fonts item array with builtin fonts, use any
    of the following functions:

        sdtx_font_kc853()
        sdtx_font_kc854()
        sdtx_font_z1013()
        sdtx_font_cpc()
        sdtx_font_c64()
        sdtx_font_oric()
 }
{ max number of rendering contexts that can be created, default: 8 }
{ size of internal buffer for snprintf(), default: 4096 }
{ up to 8 fonts descriptions }
{ the default context creation parameters }
{ optional memory allocation overrides (default: malloc/free) }
{ optional log override function (default: NO LOGGING) }

  Psdtx_desc_t = ^Tsdtx_desc_t;
  Tsdtx_desc_t = record
      context_pool_size : longint;
      printf_buf_size : longint;
      fonts : array[0..(SDTX_MAX_FONTS)-1] of Tsdtx_font_desc_t;
      context : Tsdtx_context_desc_t;
      allocator : Tsdtx_allocator_t;
      logger : Tsdtx_logger_t;
    end;
{ initialization/shutdown  }
(* Const before type ignored *)

procedure sdtx_setup(desc:Psdtx_desc_t);cdecl;external;
procedure sdtx_shutdown;cdecl;external;
{ builtin font data (use to populate sdtx_desc.font[])  }
function sdtx_font_kc853:Tsdtx_font_desc_t;cdecl;external;
function sdtx_font_kc854:Tsdtx_font_desc_t;cdecl;external;
function sdtx_font_z1013:Tsdtx_font_desc_t;cdecl;external;
function sdtx_font_cpc:Tsdtx_font_desc_t;cdecl;external;
function sdtx_font_c64:Tsdtx_font_desc_t;cdecl;external;
function sdtx_font_oric:Tsdtx_font_desc_t;cdecl;external;
{ context functions  }
(* Const before type ignored *)
function sdtx_make_context(desc:Psdtx_context_desc_t):Tsdtx_context;cdecl;external;
procedure sdtx_destroy_context(ctx:Tsdtx_context);cdecl;external;
procedure sdtx_set_context(ctx:Tsdtx_context);cdecl;external;
function sdtx_get_context:Tsdtx_context;cdecl;external;
function sdtx_default_context:Tsdtx_context;cdecl;external;
{ drawing functions (call inside sokol-gfx render pass)  }
procedure sdtx_draw;cdecl;external;
procedure sdtx_context_draw(ctx:Tsdtx_context);cdecl;external;
procedure sdtx_draw_layer(layer_id:longint);cdecl;external;
procedure sdtx_context_draw_layer(ctx:Tsdtx_context; layer_id:longint);cdecl;external;
{ switch render layer  }
procedure sdtx_layer(layer_id:longint);cdecl;external;
{ switch to a different font  }
procedure sdtx_font(font_index:longint);cdecl;external;
{ set a new virtual canvas size in screen pixels  }
procedure sdtx_canvas(w:single; h:single);cdecl;external;
{ set a new origin in character grid coordinates  }
procedure sdtx_origin(x:single; y:single);cdecl;external;
{ cursor movement functions (relative to origin in character grid coordinates)  }
procedure sdtx_home;cdecl;external;
procedure sdtx_pos(x:single; y:single);cdecl;external;
procedure sdtx_pos_x(x:single);cdecl;external;
procedure sdtx_pos_y(y:single);cdecl;external;
procedure sdtx_move(dx:single; dy:single);cdecl;external;
procedure sdtx_move_x(dx:single);cdecl;external;
procedure sdtx_move_y(dy:single);cdecl;external;
procedure sdtx_crlf;cdecl;external;
{ set the current text color  }
procedure sdtx_color3b(r:Tuint8_t; g:Tuint8_t; b:Tuint8_t);cdecl;external;
{ RGB 0..255, A=255 }
procedure sdtx_color3f(r:single; g:single; b:single);cdecl;external;
{ RGB 0.0f..1.0f, A=1.0f }
procedure sdtx_color4b(r:Tuint8_t; g:Tuint8_t; b:Tuint8_t; a:Tuint8_t);cdecl;external;
{ RGBA 0..255 }
procedure sdtx_color4f(r:single; g:single; b:single; a:single);cdecl;external;
{ RGBA 0.0f..1.0f }
procedure sdtx_color1i(rgba:Tuint32_t);cdecl;external;
{ ABGR 0xAABBGGRR }
{ text rendering  }
procedure sdtx_putc(c:char);cdecl;external;
(* Const before type ignored *)
procedure sdtx_puts(str:Pchar);cdecl;external;
{ does NOT append newline! }
(* Const before type ignored *)
procedure sdtx_putr(str:Pchar; len:longint);cdecl;external;
{ 'put range', also stops at zero-char }
(* Const before type ignored *)
function sdtx_printf(fmt:Pchar; args:array of const):longint;cdecl;external;
function sdtx_printf(fmt:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function sdtx_vprintf(fmt:Pchar; args:Tva_list):longint;cdecl;external;
{ language bindings helper: get the internal printf format buffer  }
function sdtx_get_cleared_fmt_buffer:Tsdtx_range;cdecl;external;

implementation


end.
