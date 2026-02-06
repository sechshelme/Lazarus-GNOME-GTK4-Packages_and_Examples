unit ranking;

interface

uses
  fp_polylib64, types, arithmetique;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function LexSmaller(P: PPolyhedron; D: PPolyhedron; dim: dword; C: PPolyhedron; MAXRAYS: dword): PPolyhedron; cdecl; external libpolylib;
function Polyhedron_LexSmallerEnumerate(P: PPolyhedron; D: PPolyhedron; dim: dword; C: PPolyhedron; MAXRAYS: dword): PEnumeration; cdecl; external libpolylib;
function Polyhedron_Ranking(P: PPolyhedron; C: PPolyhedron; MAXRAYS: dword): PEnumeration; cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:36:19 ===


implementation



end.
