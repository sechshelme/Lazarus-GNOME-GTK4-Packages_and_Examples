{$IFDEF read_interface}

type
  PAdwLengthUnit = ^TAdwLengthUnit;
  TAdwLengthUnit = longint;

const
  ADW_LENGTH_UNIT_PX = 0;
  ADW_LENGTH_UNIT_PT = 1;
  ADW_LENGTH_UNIT_SP = 2;

function adw_length_unit_to_px(unit_: TAdwLengthUnit; Value: Tdouble; settings: PGtkSettings): Tdouble; cdecl; external libadwaita;
function adw_length_unit_from_px(unit_: TAdwLengthUnit; Value: Tdouble; settings: PGtkSettings): Tdouble; cdecl; external libadwaita;

// === Konventiert am: 7-1-25 19:54:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
