{$IFDEF read_interface}

type
  TEina_Quad = record
    x0: double;
    y0: double;
    x1: double;
    y1: double;
    x2: double;
    y2: double;
    x3: double;
    y3: double;
  end;
  PEina_Quad = ^TEina_Quad;

procedure eina_quad_rectangle_to(q: PEina_Quad; r: PEina_Rectangle); cdecl; external libeina;
procedure eina_quad_rectangle_from(q: PEina_Quad; r: PEina_Rectangle); cdecl; external libeina;
procedure eina_quad_coords_set(q: PEina_Quad; x0: double; y0: double; x1: double; y1: double; x2: double; y2: double; x3: double; y3: double); cdecl; external libeina;
procedure eina_quad_coords_get(q: PEina_Quad; x0: Pdouble; y0: Pdouble; x1: Pdouble; y1: Pdouble; x2: Pdouble; y2: Pdouble; x3: Pdouble; y3: Pdouble); cdecl; external libeina;

// === Konventiert am: 15-5-25 17:41:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
