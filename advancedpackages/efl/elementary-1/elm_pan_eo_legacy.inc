{$IFDEF read_interface}


type
  PElm_Pan = ^TElm_Pan;
  TElm_Pan = TEo;

procedure elm_pan_pos_set(obj: PElm_Pan; x: longint; y: longint); cdecl; external libelementary;
procedure elm_pan_pos_get(obj: PElm_Pan; x: Plongint; y: Plongint); cdecl; external libelementary;
procedure elm_pan_content_size_get(obj: PElm_Pan; w: Plongint; h: Plongint); cdecl; external libelementary;
procedure elm_pan_pos_min_get(obj: PElm_Pan; x: Plongint; y: Plongint); cdecl; external libelementary;
procedure elm_pan_pos_max_get(obj: PElm_Pan; x: Plongint; y: Plongint); cdecl; external libelementary;

// === Konventiert am: 25-5-25 20:06:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
