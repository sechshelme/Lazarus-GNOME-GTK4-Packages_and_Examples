{$IFDEF read_interface}


const
  ZMAX = 120;  
  MENDEL_MAX = 107;  
  CRYSTALARRAY_MAX = 512;  
  MAXFILENAMESIZE = 1000;  
  SHELLNUM = 28;  
  SHELLNUM_K = 31;  
  SHELLNUM_C = 29;  
  LINENUM = 383;  
  TRANSNUM = 15;  
  AUGERNUM = 996;  
  SHELLNUM_A = 9;  
  N_NEW_CRYSTAL = 10;

type
  PxrlComplex = ^TxrlComplex;
  TxrlComplex = record
      re : double;
      im : double;
    end;

function c_abs(x:TxrlComplex):double;cdecl;external libxrl;
function c_mul(x:TxrlComplex; y:TxrlComplex):TxrlComplex;cdecl;external libxrl;

type
  PCrystal_Atom = ^TCrystal_Atom;
  TCrystal_Atom = record
      Zatom : longint;
      fraction : double;
      x : double;
      y : double;
      z : double;
    end;

  PCrystal_Struct = ^TCrystal_Struct;
  TCrystal_Struct = record
      name : Pchar;
      a : double;
      b : double;
      c : double;
      alpha : double;
      beta : double;
      gamma : double;
      volume : double;
      n_atom : longint;
      atom : PCrystal_Atom;
    end;

  PCrystal_Array = ^TCrystal_Array;
  TCrystal_Array = record
      n_crystal : longint;
      n_alloc : longint;
      crystal : PCrystal_Struct;
    end;

// === Konventiert am: 8-9-26 17:31:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
