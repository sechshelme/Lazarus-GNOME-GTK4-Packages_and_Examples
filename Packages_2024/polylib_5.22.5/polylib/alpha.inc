{$IFDEF read_interface}


function GaussSimplify(M: PMatrix; M2: PMatrix): longint; cdecl; external libpolylib;
function PolyhedronLTQ(P1: PPolyhedron; P2: PPolyhedron; INDEX: longint; PDIM: longint; MAXRAYS: longint): longint; cdecl; external libpolylib;
function PolyhedronTSort(L: PPPolyhedron; n: dword; index: dword; pdim: dword; time: Plongint;
  pvect: Plongint; MAXRAYS: dword): longint; cdecl; external libpolylib;
function Polyhedron_Not_Empty(P: PPolyhedron; C: PPolyhedron; MAXRAYS: longint): longint; cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:35:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
