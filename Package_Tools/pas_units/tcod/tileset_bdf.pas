unit tileset_bdf;

interface

uses
  fp_tcod, tileset;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function TCOD_load_bdf(path: pchar): PTCOD_Tileset; cdecl; external libtcod;
function TCOD_load_bdf_memory(size: longint; buffer: pbyte): PTCOD_Tileset; cdecl; external libtcod;

// === Konventiert am: 10-9-25 16:24:44 ===


implementation



end.
