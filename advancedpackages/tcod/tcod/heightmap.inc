{$IFDEF read_interface}


type
  TTCOD_heightmap_t = record
    w: longint;
    h: longint;
    values: Psingle;
  end;
  PTCOD_heightmap_t = ^TTCOD_heightmap_t;

function TCOD_heightmap_new(w: longint; h: longint): PTCOD_heightmap_t; cdecl; external libtcod;
procedure TCOD_heightmap_delete(hm: PTCOD_heightmap_t); cdecl; external libtcod;
function TCOD_heightmap_get_value(hm: PTCOD_heightmap_t; x: longint; y: longint): single; cdecl; external libtcod;
function TCOD_heightmap_get_interpolated_value(hm: PTCOD_heightmap_t; x: single; y: single): single; cdecl; external libtcod;
procedure TCOD_heightmap_set_value(hm: PTCOD_heightmap_t; x: longint; y: longint; value: single); cdecl; external libtcod;
function TCOD_heightmap_get_slope(hm: PTCOD_heightmap_t; x: longint; y: longint): single; cdecl; external libtcod;
procedure TCOD_heightmap_get_normal(hm: PTCOD_heightmap_t; x: single; y: single; n: Psingle; waterLevel: single); cdecl; external libtcod;
function TCOD_heightmap_count_cells(hm: PTCOD_heightmap_t; min: single; max: single): longint; cdecl; external libtcod;
function TCOD_heightmap_has_land_on_border(hm: PTCOD_heightmap_t; waterLevel: single): Tbool; cdecl; external libtcod;
procedure TCOD_heightmap_get_minmax(hm: PTCOD_heightmap_t; min: Psingle; max: Psingle); cdecl; external libtcod;
procedure TCOD_heightmap_copy(hm_source: PTCOD_heightmap_t; hm_dest: PTCOD_heightmap_t); cdecl; external libtcod;
procedure TCOD_heightmap_add(hm: PTCOD_heightmap_t; value: single); cdecl; external libtcod;
procedure TCOD_heightmap_scale(hm: PTCOD_heightmap_t; value: single); cdecl; external libtcod;
procedure TCOD_heightmap_clamp(hm: PTCOD_heightmap_t; min: single; max: single); cdecl; external libtcod;
procedure TCOD_heightmap_normalize(hm: PTCOD_heightmap_t; min: single; max: single); cdecl; external libtcod;
procedure TCOD_heightmap_clear(hm: PTCOD_heightmap_t); cdecl; external libtcod;
procedure TCOD_heightmap_lerp_hm(hm1: PTCOD_heightmap_t; hm2: PTCOD_heightmap_t; out_: PTCOD_heightmap_t; coef: single); cdecl; external libtcod;
procedure TCOD_heightmap_add_hm(hm1: PTCOD_heightmap_t; hm2: PTCOD_heightmap_t; out_: PTCOD_heightmap_t); cdecl; external libtcod;
procedure TCOD_heightmap_multiply_hm(hm1: PTCOD_heightmap_t; hm2: PTCOD_heightmap_t; out_: PTCOD_heightmap_t); cdecl; external libtcod;
procedure TCOD_heightmap_add_hill(hm: PTCOD_heightmap_t; hx: single; hy: single; h_radius: single; h_height: single); cdecl; external libtcod;
procedure TCOD_heightmap_dig_hill(hm: PTCOD_heightmap_t; hx: single; hy: single; h_radius: single; h_height: single); cdecl; external libtcod;
procedure TCOD_heightmap_dig_bezier(hm: PTCOD_heightmap_t; px: Plongint; py: Plongint; startRadius: single; startDepth: single;
  endRadius: single; endDepth: single); cdecl; external libtcod;
procedure TCOD_heightmap_rain_erosion(hm: PTCOD_heightmap_t; nbDrops: longint; erosionCoef: single; sedimentationCoef: single; rnd: TTCOD_random_t); cdecl; external libtcod;
procedure TCOD_heightmap_kernel_transform(hm: PTCOD_heightmap_t; kernelsize: longint; dx: Plongint; dy: Plongint; weight: Psingle;
  minLevel: single; maxLevel: single); cdecl; external libtcod;
procedure TCOD_heightmap_add_voronoi(hm: PTCOD_heightmap_t; nbPoints: longint; nbCoef: longint; coef: Psingle; rnd: TTCOD_random_t); cdecl; external libtcod;
procedure TCOD_heightmap_mid_point_displacement(hm: PTCOD_heightmap_t; rnd: TTCOD_random_t; roughness: single); cdecl; external libtcod;
procedure TCOD_heightmap_add_fbm(hm: PTCOD_heightmap_t; noise: TTCOD_noise_t; mul_x: single; mul_y: single; add_x: single;
  add_y: single; octaves: single; delta: single; scale: single); cdecl; external libtcod;
procedure TCOD_heightmap_scale_fbm(hm: PTCOD_heightmap_t; noise: TTCOD_noise_t; mul_x: single; mul_y: single; add_x: single;
  add_y: single; octaves: single; delta: single; scale: single); cdecl; external libtcod;
procedure TCOD_heightmap_islandify(hm: PTCOD_heightmap_t; seaLevel: single; rnd: TTCOD_random_t); cdecl; external libtcod; deprecated'This function does nothing and will be removed.';

// === Konventiert am: 10-9-25 13:49:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
