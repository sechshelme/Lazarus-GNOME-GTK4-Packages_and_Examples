unit Lattice;

interface

uses
  fp_polylib64, types, arithmetique;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure AffineHermite(A: PLattice; H: PPLattice; U: PPMatrix); cdecl; external libpolylib;
procedure AffineSmith(A: PLattice; U: PPLattice; V: PPLattice; Diag: PPLattice); cdecl; external libpolylib;
function ChangeLatticeDimension(A: PLattice; dimension: longint): PLattice; cdecl; external libpolylib;
function EmptyLattice(dimension: longint): PLattice; cdecl; external libpolylib;
function ExtractLinearPart(A: PLattice): PLattice; cdecl; external libpolylib;
function FindHermiteBasisofDomain(A: PPolyhedron; B: PPMatrix): longint; cdecl; external libpolylib;
function Homogenise(A: PLattice; Forward: TBool): PLattice; cdecl; external libpolylib;
function intcompare(a: pointer; b: pointer): longint; cdecl; external libpolylib;
function isEmptyLattice(A: PLattice): TBool; cdecl; external libpolylib;
function isfulldim(m: PMatrix): TBool; cdecl; external libpolylib;
function IsLattice(m: PMatrix): TBool; cdecl; external libpolylib;
function isLinear(A: PLattice): TBool; cdecl; external libpolylib;
function LatticeDifference(A: PLattice; B: PLattice): PLatticeUnion; cdecl; external libpolylib;
function LatticeImage(A: PLattice; M: PMatrix): PLattice; cdecl; external libpolylib;
function LatticeIncludes(A: PLattice; B: PLattice): TBool; cdecl; external libpolylib;
function LatticeIntersection(X: PLattice; Y: PLattice): PLattice; cdecl; external libpolylib;
function LatticePreimage(L: PLattice; G: PMatrix): PLattice; cdecl; external libpolylib;
function LatticeSimplify(latlist: PLatticeUnion): PLatticeUnion; cdecl; external libpolylib;
function LatticeUnion_Alloc: PLatticeUnion; cdecl; external libpolylib;
procedure LatticeUnion_Free(Head: PLatticeUnion); cdecl; external libpolylib;
procedure PrintLatticeUnion(fp: PFILE; format: pchar; Head: PLatticeUnion); cdecl; external libpolylib;
function sameAffinepart(A: PLattice; B: PLattice): TBool; cdecl; external libpolylib;
function sameLattice(A: PLattice; B: PLattice): TBool; cdecl; external libpolylib;
function Lattice2LatticeUnion(X: PLattice; Y: PLattice): PLatticeUnion; cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:36:00 ===


implementation



end.
