unit tileset_render;

interface

uses
  fp_tcod, error, tileset, console;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPSDL_Surface = ^PSDL_Surface;
  PSDL_Surface = ^TSDL_Surface;
  TSDL_Surface = record
    {undefined structure}
  end;

function TCOD_tileset_render_to_surface(tileset: PTCOD_Tileset; console: PTCOD_Console; cache: PPTCOD_Console; surface_out: PPSDL_Surface): TTCOD_Error; cdecl; external libtcod;

// === Konventiert am: 10-9-25 16:24:49 ===


implementation



end.
