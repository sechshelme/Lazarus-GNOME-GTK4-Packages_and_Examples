unit cd_sensor;

interface

uses
  fp_glib2, fp_colord, cd_enum, cd_color, cd_spectrum;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  TCdSensor = record
    parent_instance: TGObject;
  end;
  PCdSensor = ^TCdSensor;

  TCdSensorClass = record
    parent_class: TGObjectClass;
    button_pressed: procedure(sensor: PCdSensor); cdecl;
    _cd_sensor_reserved1: procedure; cdecl;
    _cd_sensor_reserved2: procedure; cdecl;
    _cd_sensor_reserved3: procedure; cdecl;
    _cd_sensor_reserved4: procedure; cdecl;
    _cd_sensor_reserved5: procedure; cdecl;
    _cd_sensor_reserved6: procedure; cdecl;
    _cd_sensor_reserved7: procedure; cdecl;
    _cd_sensor_reserved8: procedure; cdecl;
  end;
  PCdSensorClass = ^TCdSensorClass;

function cd_sensor_get_type: TGType; cdecl; external libcolord;
function cd_sensor_error_quark: TGQuark; cdecl; external libcolord;
function cd_sensor_new: PCdSensor; cdecl; external libcolord;
function cd_sensor_new_with_object_path(object_path: Pgchar): PCdSensor; cdecl; external libcolord;
procedure cd_sensor_connect(sensor: PCdSensor; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_sensor_connect_finish(sensor: PCdSensor; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_sensor_lock(sensor: PCdSensor; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_sensor_lock_finish(sensor: PCdSensor; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_sensor_unlock(sensor: PCdSensor; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_sensor_unlock_finish(sensor: PCdSensor; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_sensor_set_options(sensor: PCdSensor; values: PGHashTable; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_sensor_set_options_finish(sensor: PCdSensor; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_sensor_get_sample(sensor: PCdSensor; cap: TCdSensorCap; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_sensor_get_sample_finish(sensor: PCdSensor; res: PGAsyncResult; error: PPGError): PCdColorXYZ; cdecl; external libcolord;
procedure cd_sensor_get_spectrum(sensor: PCdSensor; cap: TCdSensorCap; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_sensor_get_spectrum_finish(sensor: PCdSensor; res: PGAsyncResult; error: PPGError): PCdSpectrum; cdecl; external libcolord;
function cd_sensor_get_object_path(sensor: PCdSensor): Pgchar; cdecl; external libcolord;
function cd_sensor_get_id(sensor: PCdSensor): Pgchar; cdecl; external libcolord;
function cd_sensor_get_connected(sensor: PCdSensor): Tgboolean; cdecl; external libcolord;
function cd_sensor_get_kind(sensor: PCdSensor): TCdSensorKind; cdecl; external libcolord;
function cd_sensor_get_state(sensor: PCdSensor): TCdSensorState; cdecl; external libcolord;
function cd_sensor_get_mode(sensor: PCdSensor): TCdSensorCap; cdecl; external libcolord;
function cd_sensor_get_serial(sensor: PCdSensor): Pgchar; cdecl; external libcolord;
function cd_sensor_get_model(sensor: PCdSensor): Pgchar; cdecl; external libcolord;
function cd_sensor_get_vendor(sensor: PCdSensor): Pgchar; cdecl; external libcolord;
function cd_sensor_get_native(sensor: PCdSensor): Tgboolean; cdecl; external libcolord;
function cd_sensor_get_embedded(sensor: PCdSensor): Tgboolean; cdecl; external libcolord;
function cd_sensor_get_locked(sensor: PCdSensor): Tgboolean; cdecl; external libcolord;
function cd_sensor_get_caps(sensor: PCdSensor): Tguint64; cdecl; external libcolord;
function cd_sensor_has_cap(sensor: PCdSensor; cap: TCdSensorCap): Tgboolean; cdecl; external libcolord;
function cd_sensor_get_options(sensor: PCdSensor): PGHashTable; cdecl; external libcolord;
function cd_sensor_get_option(sensor: PCdSensor; key: Pgchar): Pgchar; cdecl; external libcolord;
function cd_sensor_get_metadata(sensor: PCdSensor): PGHashTable; cdecl; external libcolord;
function cd_sensor_get_metadata_item(sensor: PCdSensor; key: Pgchar): Pgchar; cdecl; external libcolord;
procedure cd_sensor_set_object_path(sensor: PCdSensor; object_path: Pgchar); cdecl; external libcolord;
function cd_sensor_equal(sensor1: PCdSensor; sensor2: PCdSensor): Tgboolean; cdecl; external libcolord;
function cd_sensor_to_string(sensor: PCdSensor): Pgchar; cdecl; external libcolord;


// === Konventiert am: 1-11-25 16:06:40 ===

function CD_TYPE_SENSOR: TGType;
function CD_SENSOR(obj: Pointer): PCdSensor;
function CD_IS_SENSOR(obj: Pointer): Tgboolean;
function CD_SENSOR_CLASS(klass: Pointer): PCdSensorClass;
function CD_IS_SENSOR_CLASS(klass: Pointer): Tgboolean;
function CD_SENSOR_GET_CLASS(obj: Pointer): PCdSensorClass;

implementation

function CD_TYPE_SENSOR: TGType;
begin
  Result := cd_sensor_get_type;
end;

function CD_SENSOR(obj: Pointer): PCdSensor;
begin
  Result := PCdSensor(g_type_check_instance_cast(obj, CD_TYPE_SENSOR));
end;

function CD_IS_SENSOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_SENSOR);
end;

function CD_SENSOR_CLASS(klass: Pointer): PCdSensorClass;
begin
  Result := PCdSensorClass(g_type_check_class_cast(klass, CD_TYPE_SENSOR));
end;

function CD_IS_SENSOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, CD_TYPE_SENSOR);
end;

function CD_SENSOR_GET_CLASS(obj: Pointer): PCdSensorClass;
begin
  Result := PCdSensorClass(PGTypeInstance(obj)^.g_class);
end;


end.
