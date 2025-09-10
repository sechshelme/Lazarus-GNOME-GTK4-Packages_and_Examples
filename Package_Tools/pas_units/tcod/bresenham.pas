unit bresenham;

interface

uses
  fp_tcod;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TTCOD_line_listener_t = function(x: longint; y: longint): Tbool; cdecl;

procedure TCOD_line_init(xFrom: longint; yFrom: longint; xTo: longint; yTo: longint); cdecl; external libtcod; deprecated 'This function is not reentrant. Use TCOD_line_init_mt instead.';
function TCOD_line_step(xCur: Plongint; yCur: Plongint): Tbool; cdecl; external libtcod; deprecated'This function is not reentrant.';
function TCOD_line(xFrom: longint; yFrom: longint; xTo: longint; yTo: longint; listener: TTCOD_line_listener_t): Tbool; cdecl; external libtcod;

type
  TTCOD_bresenham_data_t = record
    stepx: longint;
    stepy: longint;
    e: longint;
    deltax: longint;
    deltay: longint;
    origx: longint;
    origy: longint;
    destx: longint;
    desty: longint;
  end;
  PTCOD_bresenham_data_t = ^TTCOD_bresenham_data_t;

procedure TCOD_line_init_mt(xFrom: longint; yFrom: longint; xTo: longint; yTo: longint; data: PTCOD_bresenham_data_t); cdecl; external libtcod;
function TCOD_line_step_mt(xCur: Plongint; yCur: Plongint; data: PTCOD_bresenham_data_t): Tbool; cdecl; external libtcod;
function TCOD_line_mt(xFrom: longint; yFrom: longint; xTo: longint; yTo: longint; listener: TTCOD_line_listener_t;
  data: PTCOD_bresenham_data_t): Tbool; cdecl; external libtcod; deprecated'Use TCOD_line instead.';

// === Konventiert am: 10-9-25 13:48:42 ===


implementation



end.
