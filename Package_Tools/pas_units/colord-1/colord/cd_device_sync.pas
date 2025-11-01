unit cd_device_sync;

interface

uses
  fp_glib2, fp_colord, cd_device, cd_enum;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function cd_device_connect_sync(device: PCdDevice; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_device_set_property_sync(device: PCdDevice; key: Pgchar; value: Pgchar; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_device_add_profile_sync(device: PCdDevice; relation: TCdDeviceRelation; profile: PCdProfile; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_device_remove_profile_sync(device: PCdDevice; profile: PCdProfile; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_device_get_profile_for_qualifiers_sync(device: PCdDevice; qualifiers: PPgchar; cancellable: PGCancellable; error: PPGError): PCdProfile; cdecl; external libcolord;
function cd_device_make_profile_default_sync(device: PCdDevice; profile: PCdProfile; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_device_profiling_inhibit_sync(device: PCdDevice; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_device_profiling_uninhibit_sync(device: PCdDevice; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_device_get_profile_relation_sync(device: PCdDevice; profile: PCdProfile; cancellable: PGCancellable; error: PPGError): TCdDeviceRelation; cdecl; external libcolord;
function cd_device_set_enabled_sync(device: PCdDevice; enabled: Tgboolean; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_device_set_model_sync(device: PCdDevice; value: Pgchar; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_device_set_serial_sync(device: PCdDevice; value: Pgchar; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_device_set_vendor_sync(device: PCdDevice; value: Pgchar; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_device_set_kind_sync(device: PCdDevice; kind: TCdDeviceKind; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_device_set_colorspace_sync(device: PCdDevice; colorspace: TCdColorspace; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_device_set_mode_sync(device: PCdDevice; mode: TCdDeviceMode; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:08:21 ===


implementation



end.
