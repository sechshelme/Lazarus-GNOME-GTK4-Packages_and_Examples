unit console_rexpaint;

interface

uses
  fp_tcod, error, list, console;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function TCOD_console_from_xp(filename: pchar): TTCOD_console_t; cdecl; external libtcod;
function TCOD_console_load_xp(con: PTCOD_Console; filename: pchar): Tbool; cdecl; external libtcod;
function TCOD_console_save_xp(con: PTCOD_Console; filename: pchar; compress_level: longint): Tbool; cdecl; external libtcod;
function TCOD_console_list_from_xp(filename: pchar): TTCOD_list_t; cdecl; external libtcod;
function TCOD_console_list_save_xp(console_list: TTCOD_list_t; filename: pchar; compress_level: longint): Tbool; cdecl; external libtcod;
function TCOD_load_xp_from_memory(n_data: longint; data: pbyte; n_out: longint; out_: PPTCOD_Console): longint; cdecl; external libtcod;
function TCOD_save_xp_to_memory(n_consoles: longint; consoles: PPTCOD_Console; n_out: longint; out_: pbyte; compression_level: longint): longint; cdecl; external libtcod;
function TCOD_load_xp(path: pchar; n: longint; out_: PPTCOD_Console): longint; cdecl; external libtcod;
function TCOD_save_xp(n: longint; consoles: PPTCOD_Console; path: pchar; compress_level: longint): TTCOD_Error; cdecl; external libtcod;

// === Konventiert am: 10-9-25 13:16:18 ===


implementation



end.
