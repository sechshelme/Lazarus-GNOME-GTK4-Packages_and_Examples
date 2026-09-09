{$IFDEF read_interface}



function Crystal_ArrayInit(n_crystal_alloc: longint; error: PPxrl_error): PCrystal_Array; cdecl; external libxrl;
procedure Crystal_ArrayFree(c_array: PCrystal_Array); cdecl; external libxrl;
function Crystal_MakeCopy(crystal: PCrystal_Struct; error: PPxrl_error): PCrystal_Struct; cdecl; external libxrl;
procedure Crystal_Free(crystal: PCrystal_Struct); cdecl; external libxrl;
function Crystal_GetCrystal(material: pchar; c_array: PCrystal_Array; error: PPxrl_error): PCrystal_Struct; cdecl; external libxrl;
function Bragg_angle(crystal: PCrystal_Struct; energy: double; i_miller: longint; j_miller: longint; k_miller: longint;
  error: PPxrl_error): double; cdecl; external libxrl;
function Q_scattering_amplitude(crystal: PCrystal_Struct; energy: double; i_miller: longint; j_miller: longint; k_miller: longint;
  rel_angle: double; error: PPxrl_error): double; cdecl; external libxrl;
function Atomic_Factors(Z: longint; energy: double; q: double; debye_factor: double; f0: Pdouble;
  f_primep: Pdouble; f_prime2: Pdouble; error: PPxrl_error): longint; cdecl; external libxrl;
function Crystal_F_H_StructureFactor(crystal: PCrystal_Struct; energy: double; i_miller: longint; j_miller: longint; k_miller: longint;
  debye_factor: double; rel_angle: double; error: PPxrl_error): TxrlComplex; cdecl; external libxrl;
function Crystal_F_H_StructureFactor_Partial(crystal: PCrystal_Struct; energy: double; i_miller: longint; j_miller: longint; k_miller: longint;
  debye_factor: double; rel_angle: double; f0_flag: longint; f_prime_flag: longint; f_prime2_flag: longint;
  error: PPxrl_error): TxrlComplex; cdecl; external libxrl;
function Crystal_UnitCellVolume(crystal: PCrystal_Struct; error: PPxrl_error): double; cdecl; external libxrl;
function Crystal_dSpacing(crystal: PCrystal_Struct; i_miller: longint; j_miller: longint; k_miller: longint; error: PPxrl_error): double; cdecl; external libxrl;
function Crystal_AddCrystal(crystal: PCrystal_Struct; c_array: PCrystal_Array; error: PPxrl_error): longint; cdecl; external libxrl;
function Crystal_ReadFile(file_name: pchar; c_array: PCrystal_Array; error: PPxrl_error): longint; cdecl; external libxrl;
function Crystal_GetCrystalsList(c_array: PCrystal_Array; nCrystals: Plongint; error: PPxrl_error): Ppchar; cdecl; external libxrl;

// === Konventiert am: 8-9-26 17:31:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
