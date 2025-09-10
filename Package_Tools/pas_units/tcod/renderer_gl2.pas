unit renderer_gl2;

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

  TTCOD_RendererGL2 = record
    common: TTCOD_RendererGLCommon;
    prg: Tuint32_t;
    console_textures: array[0..2] of Tuint32_t;
    console_width: longint;
    console_height: longint;
    vertex_buffer: Tuint32_t;
  end;
  PTCOD_RendererGL2 = ^TTCOD_RendererGL2;


function TCOD_renderer_new_gl2(x: longint; y: longint; width: longint; height: longint; title: pchar;
  window_flags: longint; vsync: longint; tileset: PTCOD_Tileset): PTCOD_Context; cdecl; external libtcod;

// === Konventiert am: 10-9-25 16:24:33 ===


implementation



end.
