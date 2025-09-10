unit image;

interface

uses
  fp_tcod, error, color, console;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TTCOD_mipmap_ = record
    width: longint;
    height: longint;
    fwidth: single;
    fheight: single;
    buf: PTCOD_ColorRGB;
    dirty: Tbool;
  end;
  PTCOD_mipmap_ = ^TTCOD_mipmap_;

  TTCOD_Image = record
    nb_mipmaps: longint;
    mipmaps: PTCOD_mipmap_;
    key_color: TTCOD_ColorRGB;
    has_key_color: Tbool;
  end;
  PTCOD_Image = ^TTCOD_Image;

  PTCOD_image_t = ^TTCOD_image_t;
  TTCOD_image_t = PTCOD_Image;

function TCOD_image_new(width: longint; height: longint): PTCOD_Image; cdecl; external libtcod;
function TCOD_image_from_console(console: PTCOD_Console): PTCOD_Image; cdecl; external libtcod;
procedure TCOD_image_refresh_console(image: PTCOD_Image; console: PTCOD_Console); cdecl; external libtcod;
procedure TCOD_image_clear(image: PTCOD_Image; color: TTCOD_color_t); cdecl; external libtcod;
procedure TCOD_image_invert(image: PTCOD_Image); cdecl; external libtcod;
procedure TCOD_image_hflip(image: PTCOD_Image); cdecl; external libtcod;
procedure TCOD_image_rotate90(image: PTCOD_Image; numRotations: longint); cdecl; external libtcod;
procedure TCOD_image_vflip(image: PTCOD_Image); cdecl; external libtcod;
procedure TCOD_image_scale(image: PTCOD_Image; new_w: longint; new_h: longint); cdecl; external libtcod;
function TCOD_image_load(filename: pchar): PTCOD_Image; cdecl; external libtcod;
function TCOD_image_save(image: PTCOD_Image; filename: pchar): TTCOD_Error; cdecl; external libtcod;
procedure TCOD_image_get_size(image: PTCOD_Image; w: Plongint; h: Plongint); cdecl; external libtcod;
function TCOD_image_get_pixel(image: PTCOD_Image; x: longint; y: longint): TTCOD_color_t; cdecl; external libtcod;
function TCOD_image_get_alpha(image: PTCOD_Image; x: longint; y: longint): longint; cdecl; external libtcod;
function TCOD_image_get_mipmap_pixel(image: PTCOD_Image; x0: single; y0: single; x1: single; y1: single): TTCOD_color_t; cdecl; external libtcod;
procedure TCOD_image_put_pixel(image: PTCOD_Image; x: longint; y: longint; col: TTCOD_color_t); cdecl; external libtcod;
procedure TCOD_image_blit(image: PTCOD_Image; console: TTCOD_console_t; x: single; y: single; bkgnd_flag: TTCOD_bkgnd_flag_t;
  scale_x: single; scale_y: single; angle: single); cdecl; external libtcod;
procedure TCOD_image_blit_rect(image: PTCOD_Image; console: TTCOD_console_t; x: longint; y: longint; w: longint;
  h: longint; bkgnd_flag: TTCOD_bkgnd_flag_t); cdecl; external libtcod;
procedure TCOD_image_blit_2x(image: PTCOD_Image; dest: PTCOD_Console; dx: longint; dy: longint; sx: longint;
  sy: longint; w: longint; h: longint); cdecl; external libtcod;
procedure TCOD_image_delete(image: PTCOD_Image); cdecl; external libtcod;
procedure TCOD_image_set_key_color(image: PTCOD_Image; key_color: TTCOD_color_t); cdecl; external libtcod;
function TCOD_image_is_pixel_transparent(image: PTCOD_Image; x: longint; y: longint): Tbool; cdecl; external libtcod;

// === Konventiert am: 10-9-25 13:49:27 ===


implementation



end.
