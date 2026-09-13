unit image_u8x4;

interface

uses
  fp_apriltag, image_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function image_u8x4_create(width: dword; height: dword): Pimage_u8x4_t; cdecl; external libapriltag;
function image_u8x4_create_alignment(width: dword; height: dword; alignment: dword): Pimage_u8x4_t; cdecl; external libapriltag;
function image_u8x4_create_from_pnm(path: pchar): Pimage_u8x4_t; cdecl; external libapriltag;
function image_u8x4_copy(in_: Pimage_u8x4_t): Pimage_u8x4_t; cdecl; external libapriltag;
procedure image_u8x4_destroy(im: Pimage_u8x4_t); cdecl; external libapriltag;
function image_u8x4_write_pnm(im: Pimage_u8x4_t; path: pchar): longint; cdecl; external libapriltag;
function image_u8x4_create_from_pam(path: pchar): Pimage_u8x4_t; cdecl; external libapriltag;
procedure image_u8x4_write_pam(im: Pimage_u8x4_t; path: pchar); cdecl; external libapriltag;

// === Konventiert am: 12-9-26 17:22:41 ===


implementation



end.
