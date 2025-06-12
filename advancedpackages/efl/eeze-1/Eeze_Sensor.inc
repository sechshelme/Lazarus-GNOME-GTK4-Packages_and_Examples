{$IFDEF read_interface}


type
  PEeze_Sensor_Type = ^TEeze_Sensor_Type;
  TEeze_Sensor_Type = longint;

const
  EEZE_SENSOR_TYPE_ACCELEROMETER = 0;
  EEZE_SENSOR_TYPE_GRAVITY = 1;
  EEZE_SENSOR_TYPE_LINEAR_ACCELERATION = 2;
  EEZE_SENSOR_TYPE_DEVICE_ORIENTATION = 3;
  EEZE_SENSOR_TYPE_MAGNETIC = 4;
  EEZE_SENSOR_TYPE_ORIENTATION = 5;
  EEZE_SENSOR_TYPE_GYROSCOPE = 6;
  EEZE_SENSOR_TYPE_LIGHT = 7;
  EEZE_SENSOR_TYPE_PROXIMITY = 8;
  EEZE_SENSOR_TYPE_MOTION_SNAP = 9;
  EEZE_SENSOR_TYPE_MOTION_SHAKE = 10;
  EEZE_SENSOR_TYPE_MOTION_DOUBLETAP = 11;
  EEZE_SENSOR_TYPE_MOTION_PANNING = 12;
  EEZE_SENSOR_TYPE_MOTION_PANNING_BROWSE = 13;
  EEZE_SENSOR_TYPE_MOTION_TILT = 14;
  EEZE_SENSOR_TYPE_MOTION_FACEDOWN = 15;
  EEZE_SENSOR_TYPE_MOTION_DIRECT_CALL = 16;
  EEZE_SENSOR_TYPE_MOTION_SMART_ALERT = 17;
  EEZE_SENSOR_TYPE_MOTION_NO_MOVE = 18;
  EEZE_SENSOR_TYPE_BAROMETER = 19;
  EEZE_SENSOR_TYPE_TEMPERATURE = 20;
  EEZE_SENSOR_TYPE_LAST = $FF;

var
  EEZE_SENSOR_EVENT_ACCELEROMETER: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_GRAVITY: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_LINEAR_ACCELERATION: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_DEVICE_ORIENTATION: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_MAGNETIC: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_ORIENTATION: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_GYROSCOPE: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_LIGHT: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_PROXIMITY: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_SNAP: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_SHAKE: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_DOUBLETAP: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_PANNING: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_PANNING_BROWSE: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_TILT: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_FACEDOWN: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_DIRECT_CALL: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_SMART_ALERT: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_NO_MOVE: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_BAROMETER: longint; cvar;external libeeze;
  EEZE_SENSOR_EVENT_TEMPERATURE: longint; cvar;external libeeze;

type
  TEeze_Sensor_Obj = record
    _type: TEeze_Sensor_Type;
    accuracy: longint;
    data: array[0..2] of single;
    timestamp: double;
    continuous_flow: TEina_Bool;
    user_data: pointer;
  end;
  PEeze_Sensor_Obj = ^TEeze_Sensor_Obj;

function eeze_sensor_new(_type: TEeze_Sensor_Type): PEeze_Sensor_Obj; cdecl; external libeeze;
procedure eeze_sensor_free(sens: PEeze_Sensor_Obj); cdecl; external libeeze;
function eeze_sensor_accuracy_get(sens: PEeze_Sensor_Obj; accuracy: Plongint): TEina_Bool; cdecl; external libeeze;
function eeze_sensor_xyz_get(sens: PEeze_Sensor_Obj; x: Psingle; y: Psingle; z: Psingle): TEina_Bool; cdecl; external libeeze;
function eeze_sensor_xy_get(sens: PEeze_Sensor_Obj; x: Psingle; y: Psingle): TEina_Bool; cdecl; external libeeze;
function eeze_sensor_x_get(sens: PEeze_Sensor_Obj; x: Psingle): TEina_Bool; cdecl; external libeeze;
function eeze_sensor_timestamp_get(sens: PEeze_Sensor_Obj; timestamp: Pdouble): TEina_Bool; cdecl; external libeeze;
function eeze_sensor_read(sens: PEeze_Sensor_Obj): TEina_Bool; cdecl; external libeeze;
function eeze_sensor_async_read(sens: PEeze_Sensor_Obj; user_data: pointer): TEina_Bool; cdecl; external libeeze;

// === Konventiert am: 12-6-25 17:32:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
