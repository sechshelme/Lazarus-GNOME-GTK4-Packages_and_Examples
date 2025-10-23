{$IFDEF read_interface}


type
  TTCOD_TilesetAtlasOpenGL = record
    tileset: PTCOD_Tileset;
    observer: PTCOD_TilesetObserver;
    texture: Tuint32_t;
    texture_size: longint;
    texture_columns: longint;
    texture_rows: longint;
  end;
  PTCOD_TilesetAtlasOpenGL = ^TTCOD_TilesetAtlasOpenGL;

  TTCOD_RendererGLCommon = record
    window: PSDL_Window;
    glcontext: pointer;
    atlas: PTCOD_TilesetAtlasOpenGL;
    sdl_subsystems: Tuint32_t;
    last_offset_x: double;
    last_offset_y: double;
    last_scale_x: double;
    last_scale_y: double;
  end;
  PTCOD_RendererGLCommon = ^TTCOD_RendererGLCommon;

function TCOD_gl_atlas_new(tileset: PTCOD_Tileset): PTCOD_TilesetAtlasOpenGL; cdecl; external libtcod;
procedure TCOD_gl_atlas_delete(atlas: PTCOD_TilesetAtlasOpenGL); cdecl; external libtcod;

// === Konventiert am: 10-9-25 16:24:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
