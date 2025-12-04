{$IFDEF read_interface}


type
  TPxy_t = record
    x: double;
    y: double;
  end;

  TPpoint_t = TPxy_t;
  PPpoint_t = ^TPpoint_t;

  TPvector_t = TPxy_t;
  PPvector_t = ^TPvector_t;

type
  TPpoly_t = record
    ps: PPpoint_t;
    pn: longint;
  end;
  PPpoly_t = ^TPpoly_t;
  PPPpoly_t = ^PPpoly_t;

  TPpolyline_t = TPpoly_t;
  PPpolyline_t = ^TPpolyline_t;

  TPedge_t = record
    a: TPpoint_t;
    b: TPpoint_t;
  end;
  PPedge_t = ^TPedge_t;
  PPPedge_t = ^PPedge_t;

  Pvconfig_t = type Pointer;

procedure freePath(p: PPpolyline_t); cdecl; external libpathplan;

// === Konventiert am: 3-12-25 15:07:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
