{$IFDEF read_interface}


type
  PsfSensorType = ^TsfSensorType;
  TsfSensorType = longint;

const
  sfSensorAccelerometer = 0;
  sfSensorGyroscope = 1;
  sfSensorMagnetometer = 2;
  sfSensorGravity = 3;
  sfSensorUserAcceleration = 4;
  sfSensorOrientation = 5;
  sfSensorCount = 6;

function sfSensor_isAvailable(sensor: TsfSensorType): TsfBool; cdecl; external libcsfml_window;
procedure sfSensor_setEnabled(sensor: TsfSensorType; enabled: TsfBool); cdecl; external libcsfml_window;
function sfSensor_getValue(sensor: TsfSensorType): TsfVector3f; cdecl; external libcsfml_window;

// === Konventiert am: 24-9-25 16:58:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
