unit Sensor;

interface

uses
  fp_sfml, Config, Vector3;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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

function sfSensor_isAvailable(sensor: TsfSensorType): TsfBool; cdecl; external libsfml_window;
procedure sfSensor_setEnabled(sensor: TsfSensorType; enabled: TsfBool); cdecl; external libsfml_window;
function sfSensor_getValue(sensor: TsfSensorType): TsfVector3f; cdecl; external libsfml_window;

// === Konventiert am: 24-9-25 16:58:09 ===


implementation



end.
