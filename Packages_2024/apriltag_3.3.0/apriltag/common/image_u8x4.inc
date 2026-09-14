{$IFDEF read_interface}


function image_u8x4_create(width: dword; height: dword): Pimage_u8x4_t; cdecl; external libapriltag_utils;
function image_u8x4_create_alignment(width: dword; height: dword; alignment: dword): Pimage_u8x4_t; cdecl; external libapriltag_utils;
function image_u8x4_create_from_pnm(path: pchar): Pimage_u8x4_t; cdecl; external libapriltag_utils;
function image_u8x4_copy(in_: Pimage_u8x4_t): Pimage_u8x4_t; cdecl; external libapriltag_utils;
procedure image_u8x4_destroy(im: Pimage_u8x4_t); cdecl; external libapriltag_utils;
function image_u8x4_write_pnm(im: Pimage_u8x4_t; path: pchar): longint; cdecl; external libapriltag_utils;
function image_u8x4_create_from_pam(path: pchar): Pimage_u8x4_t; cdecl; external libapriltag_utils;
procedure image_u8x4_write_pam(im: Pimage_u8x4_t; path: pchar); cdecl; external libapriltag_utils;

// === Konventiert am: 12-9-26 17:22:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
