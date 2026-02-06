unit homogenization;

interface

uses
  fp_polylib64, types, arithmetique;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function homogenize(P: PPolyhedron; MAXRAYS: dword): PPolyhedron; cdecl; external libpolylib;
procedure dehomogenize_evalue(ep: Pevalue; nb_param: longint); cdecl; external libpolylib;
procedure dehomogenize_enode(p: Penode; nb_param: longint); cdecl; external libpolylib;
procedure dehomogenize_enumeration(en: PEnumeration; nb_param: longint; maxRays: longint); cdecl; external libpolylib;
function dehomogenize_polyhedron(p: PPolyhedron; maxRays: longint): PPolyhedron; cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:35:57 ===


implementation



end.
