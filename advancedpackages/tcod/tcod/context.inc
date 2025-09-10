{$IFDEF read_interface}


type
  PPTCOD_Context = ^PTCOD_Context;
  PTCOD_Context = ^TTCOD_Context;

  TTCOD_Context = record
    _type: longint;
    contextdata_: pointer;
    c_destructor_: procedure(self: PTCOD_Context); cdecl;
    c_present_: function(self: PTCOD_Context; console: PTCOD_Console; viewport: PTCOD_ViewportOptions): TTCOD_Error; cdecl;
    c_pixel_to_tile_: procedure(self: PTCOD_Context; x: Pdouble; y: Pdouble); cdecl;
    c_save_screenshot_: function(self: PTCOD_Context; filename: pchar): TTCOD_Error; cdecl;
    c_get_sdl_window_: function(self: PTCOD_Context): PSDL_Window; cdecl;
    c_get_sdl_renderer_: function(self: PTCOD_Context): PSDL_Renderer; cdecl;
    c_accumulate_: function(self: PTCOD_Context; console: PTCOD_Console; viewport: PTCOD_ViewportOptions): TTCOD_Error; cdecl;
    c_set_tileset_: function(self: PTCOD_Context; tileset: PTCOD_Tileset): TTCOD_Error; cdecl;
    c_recommended_console_size_: function(self: PTCOD_Context; magnification: single; columns: Plongint; rows: Plongint): TTCOD_Error; cdecl;
  end;

procedure TCOD_context_delete(renderer: PTCOD_Context); cdecl; external libtcod;
function TCOD_context_new_: PTCOD_Context; cdecl; external libtcod;
function TCOD_context_present(context: PTCOD_Context; console: PTCOD_Console; viewport: PTCOD_ViewportOptions): TTCOD_Error; cdecl; external libtcod;
function TCOD_context_screen_pixel_to_tile_d(context: PTCOD_Context; x: Pdouble; y: Pdouble): TTCOD_Error; cdecl; external libtcod;
function TCOD_context_screen_pixel_to_tile_i(context: PTCOD_Context; x: Plongint; y: Plongint): TTCOD_Error; cdecl; external libtcod;
function TCOD_context_save_screenshot(context: PTCOD_Context; filename: pchar): TTCOD_Error; cdecl; external libtcod;
function TCOD_context_get_sdl_window(context: PTCOD_Context): PSDL_Window; cdecl; external libtcod;
function TCOD_context_get_sdl_renderer(context: PTCOD_Context): PSDL_Renderer; cdecl; external libtcod;
function TCOD_context_change_tileset(self: PTCOD_Context; tileset: PTCOD_Tileset): TTCOD_Error; cdecl; external libtcod;
function TCOD_context_get_renderer_type(context: PTCOD_Context): longint; cdecl; external libtcod;
function TCOD_context_recommended_console_size(context: PTCOD_Context; magnification: single; columns: Plongint; rows: Plongint): TTCOD_Error; cdecl; external libtcod;



// === Konventiert am: 10-9-25 13:48:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
