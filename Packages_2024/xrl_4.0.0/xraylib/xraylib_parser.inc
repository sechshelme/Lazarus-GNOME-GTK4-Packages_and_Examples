{$IFDEF read_interface}


type
  PcompoundData = ^TcompoundData;
  TcompoundData = record
    nElements: longint;
    nAtomsAll: double;
    Elements: Plongint;
    massFractions: Pdouble;
    nAtoms: Pdouble;
    molarMass: double;
  end;

procedure FreeCompoundData(para1: PcompoundData); cdecl; external libxrl;
function CompoundParser(compoundString: pchar; error: PPxrl_error): PcompoundData; cdecl; external libxrl;
function add_compound_data(A: TcompoundData; weightA: double; B: TcompoundData; weightB: double): PcompoundData; cdecl; external libxrl;
function AtomicNumberToSymbol(Z: longint; error: PPxrl_error): pchar; cdecl; external libxrl;
function SymbolToAtomicNumber(symbol: pchar; error: PPxrl_error): longint; cdecl; external libxrl;
procedure xrlFree(para1: pointer); cdecl; external libxrl;

// === Konventiert am: 8-9-26 17:30:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
