{$IFDEF read_interface}


type
  PTCOD_noise_type_t = ^TTCOD_noise_type_t;
  TTCOD_noise_type_t = longint;

const
  TCOD_NOISE_PERLIN = 1;
  TCOD_NOISE_SIMPLEX = 2;
  TCOD_NOISE_WAVELET = 4;
  TCOD_NOISE_DEFAULT = 0;

type
  TTCOD_Noise = record
    ndim: longint;
    map: array[0..255] of byte;
    buffer: array[0..255] of array[0..(TCOD_NOISE_MAX_DIMENSIONS) - 1] of single;
    H: single;
    lacunarity: single;
    exponent: array[0..(TCOD_NOISE_MAX_OCTAVES) - 1] of single;
    waveletTileData: Psingle;
    rand: PTCOD_Random;
    noise_type: TTCOD_noise_type_t;
  end;
  PTCOD_Noise = ^TTCOD_Noise;

  PTCOD_noise_t = ^TTCOD_noise_t;
  TTCOD_noise_t = PTCOD_Noise;

function TCOD_noise_new(dimensions: longint; hurst: single; lacunarity: single; random: TTCOD_random_t): PTCOD_Noise; cdecl; external libtcod;
procedure TCOD_noise_set_type(noise: PTCOD_Noise; _type: TTCOD_noise_type_t); cdecl; external libtcod;
function TCOD_noise_get_ex(noise: PTCOD_Noise; f: Psingle; _type: TTCOD_noise_type_t): single; cdecl; external libtcod;
function TCOD_noise_get_fbm_ex(noise: PTCOD_Noise; f: Psingle; octaves: single; _type: TTCOD_noise_type_t): single; cdecl; external libtcod;
function TCOD_noise_get_turbulence_ex(noise: PTCOD_Noise; f: Psingle; octaves: single; _type: TTCOD_noise_type_t): single; cdecl; external libtcod;
function TCOD_noise_get(noise: PTCOD_Noise; f: Psingle): single; cdecl; external libtcod;
function TCOD_noise_get_fbm(noise: PTCOD_Noise; f: Psingle; octaves: single): single; cdecl; external libtcod;
function TCOD_noise_get_turbulence(noise: PTCOD_Noise; f: Psingle; octaves: single): single; cdecl; external libtcod;
procedure TCOD_noise_delete(noise: PTCOD_Noise); cdecl; external libtcod;
procedure TCOD_noise_get_vectorized(noise: PTCOD_Noise; _type: TTCOD_noise_type_t; n: longint; x: Psingle; y: Psingle;
  z: Psingle; w: Psingle; out_: Psingle); cdecl; external libtcod;
procedure TCOD_noise_get_fbm_vectorized(noise: PTCOD_Noise; _type: TTCOD_noise_type_t; octaves: single; n: longint; x: Psingle;
  y: Psingle; z: Psingle; w: Psingle; out_: Psingle); cdecl; external libtcod;
procedure TCOD_noise_get_turbulence_vectorized(noise: PTCOD_Noise; _type: TTCOD_noise_type_t; octaves: single; n: longint; x: Psingle;
  y: Psingle; z: Psingle; w: Psingle; out_: Psingle); cdecl; external libtcod;

// === Konventiert am: 10-9-25 13:57:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
