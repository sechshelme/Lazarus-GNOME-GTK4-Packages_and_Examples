{$IFDEF read_interface}


type
  PTCOD_Tileset = ^TTCOD_Tileset;

  PTCOD_TilesetObserver = ^TTCOD_TilesetObserver;

  TTCOD_TilesetObserver = record
    tileset: PTCOD_Tileset;
    next: PTCOD_TilesetObserver;
    userdata: pointer;
    on_observer_delete: procedure(observer: PTCOD_TilesetObserver); cdecl;
    on_tile_changed: function(observer: PTCOD_TilesetObserver; tile_id: longint): longint; cdecl;
  end;

  TTCOD_Tileset = record
    tile_width: longint;
    tile_height: longint;
    tile_length: longint;
    tiles_capacity: longint;
    tiles_count: longint;
    pixels: PTCOD_ColorRGBA;
    character_map_length: longint;
    character_map: Plongint;
    observer_list: PTCOD_TilesetObserver;
    virtual_columns: longint;
    ref_count: longint;
  end;

const
  TCOD_CHARMAP_CP437: array[0..255] of integer = (
    $0000, $263A, $263B, $2665, $2666, $2663, $2660, $2022,
    $25D8, $25CB, $25D9, $2642, $2640, $266A, $266B, $263C,
    $25BA, $25C4, $2195, $203C, $00B6, $00A7, $25AC, $21A8,
    $2191, $2193, $2192, $2190, $221F, $2194, $25B2, $25BC,
    $0020, $0021, $0022, $0023, $0024, $0025, $0026, $0027,
    $0028, $0029, $002A, $002B, $002C, $002D, $002E, $002F,
    $0030, $0031, $0032, $0033, $0034, $0035, $0036, $0037,
    $0038, $0039, $003A, $003B, $003C, $003D, $003E, $003F,
    $0040, $0041, $0042, $0043, $0044, $0045, $0046, $0047,
    $0048, $0049, $004A, $004B, $004C, $004D, $004E, $004F,
    $0050, $0051, $0052, $0053, $0054, $0055, $0056, $0057,
    $0058, $0059, $005A, $005B, $005C, $005D, $005E, $005F,
    $0060, $0061, $0062, $0063, $0064, $0065, $0066, $0067,
    $0068, $0069, $006A, $006B, $006C, $006D, $006E, $006F,
    $0070, $0071, $0072, $0073, $0074, $0075, $0076, $0077,
    $0078, $0079, $007A, $007B, $007C, $007D, $007E, $007F,
    $00C7, $00FC, $00E9, $00E2, $00E4, $00E0, $00E5, $00E7,
    $00EA, $00EB, $00E8, $00EF, $00EE, $00EC, $00C4, $00C5,
    $00C9, $00E6, $00C6, $00F4, $00F6, $00F2, $00FB, $00F9,
    $00FF, $00D6, $00DC, $00A2, $00A3, $00A5, $20A7, $0192,
    $00E1, $00ED, $00F3, $00FA, $00F1, $00D1, $00AA, $00BA,
    $00BF, $2310, $00AC, $00BD, $00BC, $00A1, $00AB, $00BB,
    $2591, $2592, $2593, $2502, $2524, $2561, $2562, $2556,
    $2555, $2563, $2551, $2557, $255D, $255C, $255B, $2510,
    $2514, $2534, $252C, $251C, $2500, $253C, $255E, $255F,
    $255A, $2554, $2569, $2566, $2560, $2550, $256C, $2567,
    $2568, $2564, $2565, $2559, $2558, $2552, $2553, $256B,
    $256A, $2518, $250C, $2588, $2584, $258C, $2590, $2580,
    $03B1, $00DF, $0393, $03C0, $03A3, $03C3, $00B5, $03C4,
    $03A6, $0398, $03A9, $03B4, $221E, $03C6, $03B5, $2229,
    $2261, $00B1, $2265, $2264, $2320, $2321, $00F7, $2248,
    $00B0, $2219, $00B7, $221A, $207F, $00B2, $25A0, $00A0);

  TCOD_CHARMAP_TCOD: array[0..255] of integer = (
    $0020, $0021, $0022, $0023, $0024, $0025, $0026, $0027,
    $0028, $0029, $002A, $002B, $002C, $002D, $002E, $002F,
    $0030, $0031, $0032, $0033, $0034, $0035, $0036, $0037,
    $0038, $0039, $003A, $003B, $003C, $003D, $003E, $003F,
    $0040, $005B, $005C, $005D, $005E, $005F, $0060, $007B,
    $007C, $007D, $007E, $2591, $2592, $2593, $2502, $2500,
    $253C, $2524, $2534, $251C, $252C, $2514, $250C, $2510,
    $2518, $2598, $259D, $2580, $2596, $259A, $2590, $2597,
    $2191, $2193, $2190, $2192, $25B2, $25BC, $25C4, $25BA,
    $2195, $2194, $2610, $2611, $25CB, $25C9, $2551, $2550,
    $256C, $2563, $2569, $2560, $2566, $255A, $2554, $2557,
    $255D, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
    $0041, $0042, $0043, $0044, $0045, $0046, $0047, $0048,
    $0049, $004A, $004B, $004C, $004D, $004E, $004F, $0050,
    $0051, $0052, $0053, $0054, $0055, $0056, $0057, $0058,
    $0059, $005A, $0000, $0000, $0000, $0000, $0000, $0000,
    $0061, $0062, $0063, $0064, $0065, $0066, $0067, $0068,
    $0069, $006A, $006B, $006C, $006D, $006E, $006F, $0070,
    $0071, $0072, $0073, $0074, $0075, $0076, $0077, $0078,
    $0079, $007A, $0000, $0000, $0000, $0000, $0000, $0000,
    $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
    $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
    $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
    $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
    $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
    $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
    $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
    $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
    $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
    $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
    $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
    $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000);

function TCOD_tileset_new(tile_width: longint; tile_height: longint): PTCOD_Tileset; cdecl; external libtcod;
procedure TCOD_tileset_delete(tileset: PTCOD_Tileset); cdecl; external libtcod;
function TCOD_tileset_get_tile_width_(tileset: PTCOD_Tileset): longint; cdecl; external libtcod;
function TCOD_tileset_get_tile_height_(tileset: PTCOD_Tileset): longint; cdecl; external libtcod;
function TCOD_tileset_get_tile_(tileset: PTCOD_Tileset; codepoint: longint; buffer: PTCOD_ColorRGBA): TTCOD_Error; cdecl; external libtcod;
function TCOD_tileset_set_tile_(tileset: PTCOD_Tileset; codepoint: longint; buffer: PTCOD_ColorRGBA): TTCOD_Error; cdecl; external libtcod;
function TCOD_tileset_load(filename: pchar; columns: longint; rows: longint; n: longint; charmap: Plongint): PTCOD_Tileset; cdecl; external libtcod;
function TCOD_tileset_load_mem(buffer_length: Tsize_t; buffer: pbyte; columns: longint; rows: longint; n: longint;
  charmap: Plongint): PTCOD_Tileset; cdecl; external libtcod;
function TCOD_tileset_load_raw(width: longint; height: longint; pixels: PTCOD_ColorRGBA; columns: longint; rows: longint;
  n: longint; charmap: Plongint): PTCOD_Tileset; cdecl; external libtcod;
function TCOD_tileset_assign_tile(tileset: PTCOD_Tileset; tile_id: longint; codepoint: longint): longint; cdecl; external libtcod;
function TCOD_tileset_get_tile(tileset: PTCOD_Tileset; codepoint: longint): PTCOD_ColorRGBA; cdecl; external libtcod;
function TCOD_tileset_observer_new(tileset: PTCOD_Tileset): PTCOD_TilesetObserver; cdecl; external libtcod;
procedure TCOD_tileset_observer_delete(observer: PTCOD_TilesetObserver); cdecl; external libtcod;
procedure TCOD_tileset_notify_tile_changed(tileset: PTCOD_Tileset; tile_id: longint); cdecl; external libtcod;
function TCOD_tileset_reserve(tileset: PTCOD_Tileset; desired: longint): TTCOD_Error; cdecl; external libtcod;

// === Konventiert am: 6-9-25 15:48:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
