{$IFDEF read_interface}


function pk_package_sack_resolve(package_sack: PPkPackageSack; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_package_sack_get_details(package_sack: PPkPackageSack; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_package_sack_get_update_detail(package_sack: PPkPackageSack; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:10:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
