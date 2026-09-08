{$IFDEF read_interface}


const
  PK_PACKAGE_ID_NAME = 0;
  PK_PACKAGE_ID_VERSION = 1;
  PK_PACKAGE_ID_ARCH = 2;
  PK_PACKAGE_ID_DATA = 3;

function pk_package_id_build(name: Pgchar; version: Pgchar; arch: Pgchar; data: Pgchar): Pgchar; cdecl; external libpackagekit;
function pk_package_id_check(package_id: Pgchar): Tgboolean; cdecl; external libpackagekit;
function pk_package_id_split(package_id: Pgchar): PPgchar; cdecl; external libpackagekit;
function pk_package_id_to_printable(package_id: Pgchar): Pgchar; cdecl; external libpackagekit;
function pk_package_id_equal_fuzzy_arch(package_id1: Pgchar; package_id2: Pgchar): Tgboolean; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:11:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
