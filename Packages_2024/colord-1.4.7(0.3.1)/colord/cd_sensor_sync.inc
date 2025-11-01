{$IFDEF read_interface}


function cd_sensor_connect_sync(sensor: PCdSensor; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_sensor_lock_sync(sensor: PCdSensor; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_sensor_unlock_sync(sensor: PCdSensor; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_sensor_set_options_sync(sensor: PCdSensor; values: PGHashTable; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_sensor_get_sample_sync(sensor: PCdSensor; cap: TCdSensorCap; cancellable: PGCancellable; error: PPGError): PCdColorXYZ; cdecl; external libcolord;
function cd_sensor_get_spectrum_sync(sensor: PCdSensor; cap: TCdSensorCap; cancellable: PGCancellable; error: PPGError): PCdSpectrum; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:04:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
