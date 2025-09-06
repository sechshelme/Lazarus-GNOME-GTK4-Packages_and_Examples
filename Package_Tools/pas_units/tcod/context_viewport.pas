unit context_viewport;

interface

uses
  fp_tcod, color;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TTCOD_ViewportOptions = record
    tcod_version: longint;
    keep_aspect: Tbool;
    integer_scaling: Tbool;
    clear_color: TTCOD_ColorRGBA;
    align_x: single;
    align_y: single;
  end;
  PTCOD_ViewportOptions = ^TTCOD_ViewportOptions;

var
  TCOD_VIEWPORT_DEFAULT_: TTCOD_ViewportOptions; cvar;external libtcod;

function TCOD_viewport_new: PTCOD_ViewportOptions; cdecl; external libtcod;
procedure TCOD_viewport_delete(viewport: PTCOD_ViewportOptions); cdecl; external libtcod;

// === Konventiert am: 6-9-25 17:01:20 ===


implementation



end.
