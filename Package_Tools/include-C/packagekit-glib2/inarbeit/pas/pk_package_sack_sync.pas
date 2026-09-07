unit pk_package_sack_sync;

interface

uses
  fp_glib2, fp_packagekit, pk_package_sack;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function pk_package_sack_resolve(package_sack: PPkPackageSack; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_package_sack_get_details(package_sack: PPkPackageSack; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_package_sack_get_update_detail(package_sack: PPkPackageSack; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:10:46 ===


implementation



end.
