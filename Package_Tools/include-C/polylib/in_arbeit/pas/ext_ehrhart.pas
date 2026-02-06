unit ext_ehrhart;

interface

uses
  fp_polylib64, types, arithmetique;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function Domain_Enumerate(D: PPolyhedron; C: PPolyhedron; MAXRAYS: dword; pn: PPchar): PEnumeration; cdecl; external libpolylib;
procedure new_eadd(e1: Pevalue; res: Pevalue); cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:35:55 ===


implementation



end.
