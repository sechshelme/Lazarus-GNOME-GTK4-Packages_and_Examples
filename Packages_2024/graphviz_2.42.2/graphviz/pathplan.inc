{$IFDEF read_interface}


function Pshortestpath(boundary: PPpoly_t; endpoints: PPpoint_t; output_route: PPpolyline_t): longint; cdecl; external libpathplan;
function Proutespline(barriers: PPedge_t; n_barriers: longint; input_route: TPpolyline_t; endpoint_slopes: PPvector_t; output_route: PPpolyline_t): longint; cdecl; external libpathplan;
function Ppolybarriers(polys: PPPpoly_t; npolys: longint; barriers: PPPedge_t; n_barriers: Plongint): longint; cdecl; external libpathplan;
procedure make_polyline(line: TPpolyline_t; sline: PPpolyline_t); cdecl; external libpathplan;

// === Konventiert am: 3-12-25 15:07:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
