{$IFDEF read_interface}


type
  Tgsl_rng_type = record
    name: pchar;
    max: dword;
    min: dword;
    size: Tsize_t;
    set_: procedure(state: pointer; seed: dword); cdecl;
    get: function(state: pointer): dword; cdecl;
    get_double: function(state: pointer): Tdouble; cdecl;
  end;
  Pgsl_rng_type = ^Tgsl_rng_type;
  PPgsl_rng_type = ^Pgsl_rng_type;

  Tgsl_rng = record
    _type: Pgsl_rng_type;
    state: pointer;
  end;
  Pgsl_rng = ^Tgsl_rng;

var
  gsl_rng_borosh13: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_coveyou: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_cmrg: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_fishman18: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_fishman20: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_fishman2x: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_gfsr4: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_knuthran: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_knuthran2: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_knuthran2002: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_lecuyer21: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_minstd: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_mrg: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_mt19937: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_mt19937_1999: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_mt19937_1998: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_r250: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_ran0: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_ran1: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_ran2: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_ran3: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_rand: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_rand48: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random128_bsd: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random128_glibc2: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random128_libc5: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random256_bsd: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random256_glibc2: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random256_libc5: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random32_bsd: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random32_glibc2: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random32_libc5: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random64_bsd: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random64_glibc2: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random64_libc5: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random8_bsd: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random8_glibc2: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random8_libc5: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random_bsd: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random_glibc2: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_random_libc5: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_randu: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_ranf: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_ranlux: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_ranlux389: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_ranlxd1: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_ranlxd2: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_ranlxs0: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_ranlxs1: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_ranlxs2: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_ranmar: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_slatec: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_taus: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_taus2: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_taus113: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_transputer: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_tt800: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_uni: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_uni32: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_vax: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_waterman14: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_zuf: Pgsl_rng_type; cvar;external libgsl;

function gsl_rng_types_setup: PPgsl_rng_type; cdecl; external libgsl;

var
  gsl_rng_default: Pgsl_rng_type; cvar;external libgsl;
  gsl_rng_default_seed: dword; cvar;external libgsl;

function gsl_rng_alloc(T: Pgsl_rng_type): Pgsl_rng; cdecl; external libgsl;
function gsl_rng_memcpy(dest: Pgsl_rng; src: Pgsl_rng): longint; cdecl; external libgsl;
function gsl_rng_clone(r: Pgsl_rng): Pgsl_rng; cdecl; external libgsl;
procedure gsl_rng_free(r: Pgsl_rng); cdecl; external libgsl;
procedure gsl_rng_set(r: Pgsl_rng; seed: dword); cdecl; external libgsl;
function gsl_rng_max(r: Pgsl_rng): dword; cdecl; external libgsl;
function gsl_rng_min(r: Pgsl_rng): dword; cdecl; external libgsl;
function gsl_rng_name(r: Pgsl_rng): pchar; cdecl; external libgsl;
function gsl_rng_fread(stream: PFILE; r: Pgsl_rng): longint; cdecl; external libgsl;
function gsl_rng_fwrite(stream: PFILE; r: Pgsl_rng): longint; cdecl; external libgsl;
function gsl_rng_size(r: Pgsl_rng): Tsize_t; cdecl; external libgsl;
function gsl_rng_state(r: Pgsl_rng): pointer; cdecl; external libgsl;
procedure gsl_rng_print_state(r: Pgsl_rng); cdecl; external libgsl;
function gsl_rng_env_setup: Pgsl_rng_type; cdecl; external libgsl;
function gsl_rng_get(r: Pgsl_rng): dword; cdecl; external libgsl;
function gsl_rng_uniform(r: Pgsl_rng): Tdouble; cdecl; external libgsl;
function gsl_rng_uniform_pos(r: Pgsl_rng): Tdouble; cdecl; external libgsl;
function gsl_rng_uniform_int(r: Pgsl_rng; n: dword): dword; cdecl; external libgsl;

// === Konventiert am: 21-8-25 20:00:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
