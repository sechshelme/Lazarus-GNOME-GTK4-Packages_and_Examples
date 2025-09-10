unit zip;

interface

uses
  fp_tcod, color, console, image, mersenne_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PTCOD_Zip = type Pointer;

  PTCOD_zip_t = ^TTCOD_zip_t;
  TTCOD_zip_t = PTCOD_Zip;

function TCOD_zip_new: TTCOD_zip_t; cdecl; external libtcod; deprecated'This method of serialization is not cross-platform.  It''s recommended to find a standard alternative.';
procedure TCOD_zip_delete(zip: TTCOD_zip_t); cdecl; external libtcod;
procedure TCOD_zip_put_char(zip: TTCOD_zip_t; val: char); cdecl; external libtcod;
procedure TCOD_zip_put_int(zip: TTCOD_zip_t; val: longint); cdecl; external libtcod;
procedure TCOD_zip_put_float(zip: TTCOD_zip_t; val: single); cdecl; external libtcod;
procedure TCOD_zip_put_string(zip: TTCOD_zip_t; val: pchar); cdecl; external libtcod;
procedure TCOD_zip_put_color(zip: TTCOD_zip_t; val: TTCOD_color_t); cdecl; external libtcod;
procedure TCOD_zip_put_image(zip: TTCOD_zip_t; val: TTCOD_image_t); cdecl; external libtcod;
procedure TCOD_zip_put_console(zip: TTCOD_zip_t; val: PTCOD_Console); cdecl; external libtcod; deprecated'This function will fail with console characters greater than 255.';
procedure TCOD_zip_put_random(zip: TTCOD_zip_t; val: PTCOD_Random); cdecl; external libtcod;
procedure TCOD_zip_put_data(zip: TTCOD_zip_t; nbBytes: longint; data: pointer); cdecl; external libtcod;
function TCOD_zip_get_current_bytes(zip: TTCOD_zip_t): Tuint32_t; cdecl; external libtcod;
function TCOD_zip_save_to_file(zip: TTCOD_zip_t; filename: pchar): longint; cdecl; external libtcod;
function TCOD_zip_load_from_file(zip: TTCOD_zip_t; filename: pchar): longint; cdecl; external libtcod;
function TCOD_zip_get_char(zip: TTCOD_zip_t): char; cdecl; external libtcod;
function TCOD_zip_get_int(zip: TTCOD_zip_t): longint; cdecl; external libtcod;
function TCOD_zip_get_float(zip: TTCOD_zip_t): single; cdecl; external libtcod;
function TCOD_zip_get_string(zip: TTCOD_zip_t): pchar; cdecl; external libtcod;
function TCOD_zip_get_color(zip: TTCOD_zip_t): TTCOD_color_t; cdecl; external libtcod;
function TCOD_zip_get_image(zip: TTCOD_zip_t): TTCOD_image_t; cdecl; external libtcod;
function TCOD_zip_get_console(zip: TTCOD_zip_t): TTCOD_console_t; cdecl; external libtcod;
function TCOD_zip_get_random(zip: TTCOD_zip_t): TTCOD_random_t; cdecl; external libtcod;
function TCOD_zip_get_data(zip: TTCOD_zip_t; nbBytes: longint; data: pointer): longint; cdecl; external libtcod;
function TCOD_zip_get_remaining_bytes(zip: TTCOD_zip_t): Tuint32_t; cdecl; external libtcod;
procedure TCOD_zip_skip_bytes(zip: TTCOD_zip_t; nbBytes: Tuint32_t); cdecl; external libtcod;

// === Konventiert am: 10-9-25 16:25:09 ===


implementation



end.
