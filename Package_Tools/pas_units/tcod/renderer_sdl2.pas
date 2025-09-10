unit renderer_sdl2;

interface

uses
  fp_tcod, tileset, error, console, context;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSDL_Window = ^TSDL_Window;
  TSDL_Window = record
    {undefined structure}
  end;

  PSDL_Renderer = ^TSDL_Renderer;
  TSDL_Renderer = record
    {undefined structure}
  end;

  PPSDL_Texture = ^PSDL_Texture;
  PSDL_Texture = ^TSDL_Texture;
  TSDL_Texture = record
    {undefined structure}
  end;

  TTCOD_TilesetAtlasSDL2 = record
    renderer: PSDL_Renderer;
    texture: PSDL_Texture;
    tileset: PTCOD_Tileset;
    observer: PTCOD_TilesetObserver;
    texture_columns: longint;
  end;
  PTCOD_TilesetAtlasSDL2 = ^TTCOD_TilesetAtlasSDL2;

  TTCOD_RendererSDL2 = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    atlas: PTCOD_TilesetAtlasSDL2;
    cache_console: PTCOD_Console;
    cache_texture: PSDL_Texture;
    sdl_subsystems: Tuint32_t;
    last_offset_x: double;
    last_offset_y: double;
    last_scale_x: double;
    last_scale_y: double;
  end;
  PTCOD_RendererSDL2 = ^TTCOD_RendererSDL2;

function TCOD_renderer_init_sdl2(x: longint; y: longint; width: longint; height: longint; title: pchar;
  window_flags: longint; renderer_flags: longint; tileset: PTCOD_Tileset): PTCOD_Context; cdecl; external libtcod;
function TCOD_sdl2_atlas_new(renderer: PSDL_Renderer; tileset: PTCOD_Tileset): PTCOD_TilesetAtlasSDL2; cdecl; external libtcod;
procedure TCOD_sdl2_atlas_delete(atlas: PTCOD_TilesetAtlasSDL2); cdecl; external libtcod;
function TCOD_sdl2_render_texture_setup(atlas: PTCOD_TilesetAtlasSDL2; console: PTCOD_Console; cache: PPTCOD_Console; target: PPSDL_Texture): TTCOD_Error; cdecl; external libtcod;
function TCOD_sdl2_render_texture(atlas: PTCOD_TilesetAtlasSDL2; console: PTCOD_Console; cache: PTCOD_Console; target: PSDL_Texture): TTCOD_Error; cdecl; external libtcod;

// === Konventiert am: 10-9-25 16:25:32 ===


implementation



end.
