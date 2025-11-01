unit cd_profile_sync;

interface

uses
  fp_glib2, fp_colord;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function cd_profile_connect_sync(profile: PCdProfile; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_profile_set_property_sync(profile: PCdProfile; key: Pgchar; value: Pgchar; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_profile_install_system_wide_sync(profile: PCdProfile; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:06:54 ===


implementation



end.
