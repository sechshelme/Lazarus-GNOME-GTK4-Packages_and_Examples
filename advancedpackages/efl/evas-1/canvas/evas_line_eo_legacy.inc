{$IFDEF read_interface}

type
  PEvas_Line = ^TEvas_Line;
  TEvas_Line = TEo;

procedure evas_object_line_xy_set(obj: PEvas_Line; x1: longint; y1: longint; x2: longint; y2: longint); cdecl; external libevas;
procedure evas_object_line_xy_get(obj: PEvas_Line; x1: Plongint; y1: Plongint; x2: Plongint; y2: Plongint); cdecl; external libevas;

// === Konventiert am: 13-5-25 17:21:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
