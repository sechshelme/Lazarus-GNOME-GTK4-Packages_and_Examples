unit tileset_fallback;

interface

uses
  fp_tcod, tileset;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function TCOD_tileset_load_fallback_font_(tile_width: longint; tile_height: longint): PTCOD_Tileset; cdecl; external libtcod;

// === Konventiert am: 10-9-25 16:24:47 ===


implementation



end.
