unit context_init;

interface

uses
  fp_tcod, error, tileset, context;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TTCOD_ContextParams = record
    tcod_version: longint;
    window_x: longint;
    window_y: longint;
    pixel_width: longint;
    pixel_height: longint;
    columns: longint;
    rows: longint;
    renderer_type: longint;
    tileset: PTCOD_Tileset;
    vsync: longint;
    sdl_window_flags: longint;
    window_title: pchar;
    argc: longint;
    argv: ^pchar;
    cli_output: procedure(userdata: pointer; output: pchar); cdecl;
    cli_userdata: pointer;
    window_xy_defined: Tbool;
  end;
  PTCOD_ContextParams = ^TTCOD_ContextParams;

function TCOD_context_new(params: PTCOD_ContextParams; out_: PPTCOD_Context): TTCOD_Error; cdecl; external libtcod;

// === Konventiert am: 10-9-25 13:49:07 ===


implementation



end.
