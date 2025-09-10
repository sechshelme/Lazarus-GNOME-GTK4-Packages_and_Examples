unit namegen;

interface

uses
  fp_tcod, mersenne_types, list;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PTCOD_NameGen = type Pointer;

  PTCOD_namegen_t = ^TTCOD_namegen_t;
  TTCOD_namegen_t = PTCOD_NameGen;

procedure TCOD_namegen_parse(filename: pchar; random: TTCOD_random_t); cdecl; external libtcod;
function TCOD_namegen_generate(name: pchar; allocate: Tbool): pchar; cdecl; external libtcod;
function TCOD_namegen_generate_custom(name: pchar; rule: pchar; allocate: Tbool): pchar; cdecl; external libtcod;
function TCOD_namegen_get_sets: TTCOD_list_t; cdecl; external libtcod;
procedure TCOD_namegen_destroy; cdecl; external libtcod;

// === Konventiert am: 10-9-25 15:53:55 ===


implementation



end.
