{$IFDEF read_interface}


function homogenize(P: PPolyhedron; MAXRAYS: dword): PPolyhedron; cdecl; external libpolylib;
procedure dehomogenize_evalue(ep: Pevalue; nb_param: longint); cdecl; external libpolylib;
procedure dehomogenize_enode(p: Penode; nb_param: longint); cdecl; external libpolylib;
procedure dehomogenize_enumeration(en: PEnumeration; nb_param: longint; maxRays: longint); cdecl; external libpolylib;
function dehomogenize_polyhedron(p: PPolyhedron; maxRays: longint): PPolyhedron; cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:35:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
