{$IFDEF read_interface}

type
  PAdwEasing = ^TAdwEasing;
  TAdwEasing = longint;

const
  ADW_LINEAR = 0;
  ADW_EASE_IN_QUAD = 1;
  ADW_EASE_OUT_QUAD = 2;
  ADW_EASE_IN_OUT_QUAD = 3;
  ADW_EASE_IN_CUBIC = 4;
  ADW_EASE_OUT_CUBIC = 5;
  ADW_EASE_IN_OUT_CUBIC = 6;
  ADW_EASE_IN_QUART = 7;
  ADW_EASE_OUT_QUART = 8;
  ADW_EASE_IN_OUT_QUART = 9;
  ADW_EASE_IN_QUINT = 10;
  ADW_EASE_OUT_QUINT = 11;
  ADW_EASE_IN_OUT_QUINT = 12;
  ADW_EASE_IN_SINE = 13;
  ADW_EASE_OUT_SINE = 14;
  ADW_EASE_IN_OUT_SINE = 15;
  ADW_EASE_IN_EXPO = 16;
  ADW_EASE_OUT_EXPO = 17;
  ADW_EASE_IN_OUT_EXPO = 18;
  ADW_EASE_IN_CIRC = 19;
  ADW_EASE_OUT_CIRC = 20;
  ADW_EASE_IN_OUT_CIRC = 21;
  ADW_EASE_IN_ELASTIC = 22;
  ADW_EASE_OUT_ELASTIC = 23;
  ADW_EASE_IN_OUT_ELASTIC = 24;
  ADW_EASE_IN_BACK = 25;
  ADW_EASE_OUT_BACK = 26;
  ADW_EASE_IN_OUT_BACK = 27;
  ADW_EASE_IN_BOUNCE = 28;
  ADW_EASE_OUT_BOUNCE = 29;
  ADW_EASE_IN_OUT_BOUNCE = 30;

function adw_easing_ease(self: TAdwEasing; Value: double): double; cdecl; external libadwaita;

// === Konventiert am: 10-1-25 13:47:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
