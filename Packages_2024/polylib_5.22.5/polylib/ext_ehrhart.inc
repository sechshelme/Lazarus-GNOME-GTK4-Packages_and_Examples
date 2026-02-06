{$IFDEF read_interface}


function Domain_Enumerate(D: PPolyhedron; C: PPolyhedron; MAXRAYS: dword; pn: PPchar): PEnumeration; cdecl; external libpolylib;
procedure new_eadd(e1: Pevalue; res: Pevalue); cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:35:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
