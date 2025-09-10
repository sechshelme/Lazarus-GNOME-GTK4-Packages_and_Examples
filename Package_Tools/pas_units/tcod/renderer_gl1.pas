unit renderer_gl1;

interface

uses
  fp_tcod, tileset, context, renderer_gl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSDL_Window = ^TSDL_Window;
  TSDL_Window = record
    {undefined structure}
  end;

  PTCOD_RendererGL1 = ^TTCOD_RendererGL1;

  TTCOD_RendererGL1 = record
    common: TTCOD_RendererGLCommon;
    background_texture: Tuint32_t;
    background_width: longint;
    background_height: longint;
  end;


function TCOD_renderer_init_gl1(x: longint; y: longint; width: longint; height: longint; title: pchar;
  window_flags: longint; vsync: longint; tileset: PTCOD_Tileset): PTCOD_Context; cdecl; external libtcod;

// === Konventiert am: 10-9-25 16:24:31 ===


implementation



end.
