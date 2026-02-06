unit Zpolyhedron;

interface

uses
  fp_polylib64, types, arithmetique;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure CanonicalForm(Zpol: PZPolyhedron; Result: PPZPolyhedron; Basis: PPMatrix); cdecl; external libpolylib;
function EmptyZPolyhedron(dimension: longint): PZPolyhedron; cdecl; external libpolylib;
function IntegraliseLattice(A: PZPolyhedron): PZPolyhedron; cdecl; external libpolylib;
function isEmptyZPolyhedron(Zpol: PZPolyhedron): TBool; cdecl; external libpolylib;
function ZDomainDifference(A: PZPolyhedron; B: PZPolyhedron): PZPolyhedron; cdecl; external libpolylib;
function ZDomainImage(A: PZPolyhedron; Func: PMatrix): PZPolyhedron; cdecl; external libpolylib;
function ZDomainIncludes(A: PZPolyhedron; B: PZPolyhedron): TBool; cdecl; external libpolylib;
function ZDomainIntersection(A: PZPolyhedron; B: PZPolyhedron): PZPolyhedron; cdecl; external libpolylib;
function ZDomainPreimage(A: PZPolyhedron; Func: PMatrix): PZPolyhedron; cdecl; external libpolylib;
procedure ZDomainPrint(fp: PFILE; format: pchar; A: PZPolyhedron); cdecl; external libpolylib;
function ZDomainSimplify(ZDom: PZPolyhedron): PZPolyhedron; cdecl; external libpolylib;
function ZDomainUnion(A: PZPolyhedron; B: PZPolyhedron): PZPolyhedron; cdecl; external libpolylib;
function ZDomain_Copy(Head: PZPolyhedron): PZPolyhedron; cdecl; external libpolylib;
procedure ZDomain_Free(Head: PZPolyhedron); cdecl; external libpolylib;
function ZPolyhedronIncludes(A: PZPolyhedron; B: PZPolyhedron): TBool; cdecl; external libpolylib;
function ZPolyhedron_Alloc(Lat: PLattice; Poly: PPolyhedron): PZPolyhedron; cdecl; external libpolylib;
function SplitZpolyhedron(ZPol: PZPolyhedron; B: PLattice): PZPolyhedron; cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:36:29 ===


implementation



end.
