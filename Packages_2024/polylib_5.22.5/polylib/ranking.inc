{$IFDEF read_interface}


function LexSmaller(P: PPolyhedron; D: PPolyhedron; dim: dword; C: PPolyhedron; MAXRAYS: dword): PPolyhedron; cdecl; external libpolylib;
function Polyhedron_LexSmallerEnumerate(P: PPolyhedron; D: PPolyhedron; dim: dword; C: PPolyhedron; MAXRAYS: dword): PEnumeration; cdecl; external libpolylib;
function Polyhedron_Ranking(P: PPolyhedron; C: PPolyhedron; MAXRAYS: dword): PEnumeration; cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:36:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
