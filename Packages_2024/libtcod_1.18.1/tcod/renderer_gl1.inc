{$IFDEF read_interface}


type
  TTCOD_RendererGL1 = record
    common: TTCOD_RendererGLCommon;
    background_texture: Tuint32_t;
    background_width: longint;
    background_height: longint;
  end;
PTCOD_RendererGL1 = ^TTCOD_RendererGL1;


function TCOD_renderer_init_gl1(x: longint; y: longint; width: longint; height: longint; title: pchar;
  window_flags: longint; vsync: longint; tileset: PTCOD_Tileset): PTCOD_Context; cdecl; external libtcod;

// === Konventiert am: 10-9-25 16:24:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
