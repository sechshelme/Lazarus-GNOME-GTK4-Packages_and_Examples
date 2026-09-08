unit pk_offline;

interface

uses
  fp_glib2, fp_packagekit, pk_package_sack, pk_results;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPkOfflineAction = ^TPkOfflineAction;
  TPkOfflineAction = longint;
const
  PK_OFFLINE_ACTION_UNKNOWN = 0;
  PK_OFFLINE_ACTION_REBOOT = 1;
  PK_OFFLINE_ACTION_POWER_OFF = 2;
  PK_OFFLINE_ACTION_UNSET = 3;
  PK_OFFLINE_ACTION_LAST = 4;

type
  PPkOfflineError = ^TPkOfflineError;
  TPkOfflineError = longint;
const
  PK_OFFLINE_ERROR_FAILED = 0;
  PK_OFFLINE_ERROR_INVALID_VALUE = 1;
  PK_OFFLINE_ERROR_NO_DATA = 2;
  PK_OFFLINE_ERROR_LAST = 3;

type
  PPkOfflineFlags = ^TPkOfflineFlags;
  TPkOfflineFlags = longint;
const
  PK_OFFLINE_FLAGS_NONE = 0;
  PK_OFFLINE_FLAGS_INTERACTIVE = 1 shl 0;

function pk_offline_error_quark: TGQuark; cdecl; external libpackagekit;
function pk_offline_action_to_string(action: TPkOfflineAction): Pgchar; cdecl; external libpackagekit;
function pk_offline_action_from_string(action: Pgchar): TPkOfflineAction; cdecl; external libpackagekit;
function pk_offline_get_action(error: PPGError): TPkOfflineAction; cdecl; external libpackagekit;
function pk_offline_get_prepared_ids(error: PPGError): PPgchar; cdecl; external libpackagekit;
function pk_offline_get_prepared_upgrade_name(error: PPGError): Pgchar; cdecl; external libpackagekit;
function pk_offline_get_prepared_upgrade_version(error: PPGError): Pgchar; cdecl; external libpackagekit;
function pk_offline_get_prepared_sack(error: PPGError): PPkPackageSack; cdecl; external libpackagekit;
function pk_offline_get_prepared_monitor(cancellable: PGCancellable; error: PPGError): PGFileMonitor; cdecl; external libpackagekit;
function pk_offline_get_prepared_upgrade_monitor(cancellable: PGCancellable; error: PPGError): PGFileMonitor; cdecl; external libpackagekit;
function pk_offline_get_action_monitor(cancellable: PGCancellable; error: PPGError): PGFileMonitor; cdecl; external libpackagekit;
function pk_offline_get_results(error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_offline_get_results_mtime(error: PPGError): Tguint64; cdecl; external libpackagekit;
function pk_offline_cancel(cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_offline_cancel_with_flags(flags: TPkOfflineFlags; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_offline_clear_results(cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_offline_clear_results_with_flags(flags: TPkOfflineFlags; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_offline_trigger(action: TPkOfflineAction; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_offline_trigger_with_flags(action: TPkOfflineAction; flags: TPkOfflineFlags; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_offline_trigger_upgrade(action: TPkOfflineAction; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_offline_trigger_upgrade_with_flags(action: TPkOfflineAction; flags: TPkOfflineFlags; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libpackagekit;

function PK_OFFLINE_ERROR: TGQuark;

// === Konventiert am: 7-9-26 15:11:26 ===


implementation


function PK_OFFLINE_ERROR: TGQuark;
begin
  PK_OFFLINE_ERROR := pk_offline_error_quark;
end;


end.
