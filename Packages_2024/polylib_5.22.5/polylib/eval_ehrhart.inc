{$IFDEF read_interface}


function compute_evalue(e: Pevalue; list_args: PValue): double; cdecl; external libpolylib;
function compute_poly(en: PEnumeration; list_args: PValue): PValue; cdecl; external libpolylib;
function in_domain(P: PPolyhedron; list_args: PValue): longint; cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:35:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
