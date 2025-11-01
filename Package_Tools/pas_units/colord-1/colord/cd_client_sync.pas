unit cd_client_sync;

interface

uses
  fp_glib2, fp_colord, cd_client, cd_device, cd_enum, cd_icc, cd_sensor;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function cd_client_connect_sync(client: PCdClient; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_client_delete_profile_sync(client: PCdClient; profile: PCdProfile; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_client_delete_device_sync(client: PCdClient; device: PCdDevice; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_client_find_profile_sync(client: PCdClient; id: Pgchar; cancellable: PGCancellable; error: PPGError): PCdProfile; cdecl; external libcolord;
function cd_client_find_profile_by_filename_sync(client: PCdClient; filename: Pgchar; cancellable: PGCancellable; error: PPGError): PCdProfile; cdecl; external libcolord;
function cd_client_create_profile_sync(client: PCdClient; id: Pgchar; scope: TCdObjectScope; properties: PGHashTable; cancellable: PGCancellable;
  error: PPGError): PCdProfile; cdecl; external libcolord;
function cd_client_create_profile_for_icc_sync(client: PCdClient; icc: PCdIcc; scope: TCdObjectScope; cancellable: PGCancellable; error: PPGError): PCdProfile; cdecl; external libcolord;
function cd_client_import_profile_sync(client: PCdClient; file_: PGFile; cancellable: PGCancellable; error: PPGError): PCdProfile; cdecl; external libcolord;
function cd_client_create_device_sync(client: PCdClient; id: Pgchar; scope: TCdObjectScope; properties: PGHashTable; cancellable: PGCancellable;
  error: PPGError): PCdDevice; cdecl; external libcolord;
function cd_client_get_devices_sync(client: PCdClient; cancellable: PGCancellable; error: PPGError): PGPtrArray; cdecl; external libcolord;
function cd_client_get_profiles_sync(client: PCdClient; cancellable: PGCancellable; error: PPGError): PGPtrArray; cdecl; external libcolord;
function cd_client_get_sensors_sync(client: PCdClient; cancellable: PGCancellable; error: PPGError): PGPtrArray; cdecl; external libcolord;
function cd_client_find_device_sync(client: PCdClient; id: Pgchar; cancellable: PGCancellable; error: PPGError): PCdDevice; cdecl; external libcolord;
function cd_client_find_device_by_property_sync(client: PCdClient; key: Pgchar; value: Pgchar; cancellable: PGCancellable; error: PPGError): PCdDevice; cdecl; external libcolord;
function cd_client_get_standard_space_sync(client: PCdClient; standard_space: TCdStandardSpace; cancellable: PGCancellable; error: PPGError): PCdProfile; cdecl; external libcolord;
function cd_client_get_devices_by_kind_sync(client: PCdClient; kind: TCdDeviceKind; cancellable: PGCancellable; error: PPGError): PGPtrArray; cdecl; external libcolord;
function cd_client_find_profile_by_property_sync(client: PCdClient; key: Pgchar; value: Pgchar; cancellable: PGCancellable; error: PPGError): PCdProfile; cdecl; external libcolord;
function cd_client_find_sensor_sync(client: PCdClient; id: Pgchar; cancellable: PGCancellable; error: PPGError): PCdSensor; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:08:34 ===


implementation



end.
