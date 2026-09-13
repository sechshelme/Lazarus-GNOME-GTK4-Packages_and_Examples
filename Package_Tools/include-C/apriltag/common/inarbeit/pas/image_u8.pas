unit image_u8;

interface

uses
  fp_apriltag, image_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pimage_u8_lut_t = ^Timage_u8_lut_t;
  Timage_u8_lut_t = record
    scale: single;
    nvalues: longint;
    values: Puint8_t;
  end;

function image_u8_create_stride(width: dword; height: dword; stride: dword): Pimage_u8_t; cdecl; external libapriltag;
function image_u8_create(width: dword; height: dword): Pimage_u8_t; cdecl; external libapriltag;
function image_u8_create_alignment(width: dword; height: dword; alignment: dword): Pimage_u8_t; cdecl; external libapriltag;
function image_u8_create_from_f32(fim: Pimage_f32_t): Pimage_u8_t; cdecl; external libapriltag;
function image_u8_create_from_pnm(path: pchar): Pimage_u8_t; cdecl; external libapriltag;
function image_u8_create_from_pnm_alignment(path: pchar; alignment: longint): Pimage_u8_t; cdecl; external libapriltag;
function image_u8_copy(in_: Pimage_u8_t): Pimage_u8_t; cdecl; external libapriltag;
procedure image_u8_draw_line(im: Pimage_u8_t; x0: single; y0: single; x1: single; y1: single;
  v: longint; width: longint); cdecl; external libapriltag;
procedure image_u8_draw_circle(im: Pimage_u8_t; x0: single; y0: single; r: single; v: longint); cdecl; external libapriltag;
procedure image_u8_draw_annulus(im: Pimage_u8_t; x0: single; y0: single; r0: single; r1: single;
  v: longint); cdecl; external libapriltag;
procedure image_u8_fill_line_max(im: Pimage_u8_t; lut: Pimage_u8_lut_t; xy0: Psingle; xy1: Psingle); cdecl; external libapriltag;
procedure image_u8_clear(im: Pimage_u8_t); cdecl; external libapriltag;
procedure image_u8_darken(im: Pimage_u8_t); cdecl; external libapriltag;
procedure image_u8_convolve_2D(im: Pimage_u8_t; k: Puint8_t; ksz: longint); cdecl; external libapriltag;
procedure image_u8_gaussian_blur(im: Pimage_u8_t; sigma: Tdouble; k: longint); cdecl; external libapriltag;
function image_u8_decimate(im: Pimage_u8_t; factor: single): Pimage_u8_t; cdecl; external libapriltag;
procedure image_u8_destroy(im: Pimage_u8_t); cdecl; external libapriltag;
function image_u8_write_pnm(im: Pimage_u8_t; path: pchar): longint; cdecl; external libapriltag;
function image_u8_rotate(in_: Pimage_u8_t; rad: Tdouble; pad: Tuint8_t): Pimage_u8_t; cdecl; external libapriltag;

// === Konventiert am: 12-9-26 17:14:16 ===


implementation



end.
