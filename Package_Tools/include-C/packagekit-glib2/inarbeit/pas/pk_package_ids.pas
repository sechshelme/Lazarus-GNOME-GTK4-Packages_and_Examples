unit pk_package_ids;

interface

uses
  fp_glib2, fp_packagekit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  PK_PACKAGE_IDS_DELIM = '&';

function pk_package_ids_from_id(package_id: Pgchar): PPgchar; cdecl; external libpackagekit;
function pk_package_ids_from_string(package_id: Pgchar): PPgchar; cdecl; external libpackagekit;
function pk_package_ids_check(package_ids: PPgchar): Tgboolean; cdecl; external libpackagekit;
function pk_package_ids_to_string(package_ids: PPgchar): Pgchar; cdecl; external libpackagekit;
function pk_package_ids_present_id(package_ids: PPgchar; package_id: Pgchar): Tgboolean; cdecl; external libpackagekit;
function pk_package_ids_add_id(package_ids: PPgchar; package_id: Pgchar): PPgchar; cdecl; external libpackagekit;
function pk_package_ids_add_ids(package_ids: PPgchar; package_ids_new: PPgchar): PPgchar; cdecl; external libpackagekit;
function pk_package_ids_remove_id(package_ids: PPgchar; package_id: Pgchar): PPgchar; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:10:58 ===


implementation



end.
