unit image_u8x3;

interface

uses
  fp_apriltag, image_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function image_u8x3_create(width: dword; height: dword): Pimage_u8x3_t; cdecl; external libapriltag;
function image_u8x3_create_alignment(width: dword; height: dword; alignment: dword): Pimage_u8x3_t; cdecl; external libapriltag;
function image_u8x3_create_from_pnm(path: pchar): Pimage_u8x3_t; cdecl; external libapriltag;
function image_u8x3_copy(in_: Pimage_u8x3_t): Pimage_u8x3_t; cdecl; external libapriltag;
procedure image_u8x3_gaussian_blur(im: Pimage_u8x3_t; sigma: Tdouble; ksz: longint); cdecl; external libapriltag;
procedure image_u8x3_destroy(im: Pimage_u8x3_t); cdecl; external libapriltag;
function image_u8x3_write_pnm(im: Pimage_u8x3_t; path: pchar): longint; cdecl; external libapriltag;
procedure image_u8x3_draw_line(im: Pimage_u8x3_t; x0: single; y0: single; x1: single; y1: single;
  rgb: Puint8_t; width: longint); cdecl; external libapriltag;

// === Konventiert am: 12-9-26 17:14:14 ===


implementation



end.
