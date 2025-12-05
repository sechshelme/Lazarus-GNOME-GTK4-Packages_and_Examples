{$IFDEF read_interface}


type
  PAdapLengthUnit = ^TAdapLengthUnit;
  TAdapLengthUnit = longint;

const
  ADAP_LENGTH_UNIT_PX = 0;
  ADAP_LENGTH_UNIT_PT = 1;
  ADAP_LENGTH_UNIT_SP = 2;

function adap_length_unit_to_px(unit_: TAdapLengthUnit; value: double; settings: PGtkSettings): double; cdecl; external libadapta;
function adap_length_unit_from_px(unit_: TAdapLengthUnit; value: double; settings: PGtkSettings): double; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:08:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
