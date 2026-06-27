unit gdbusnamewatching;

interface

uses
  fp_glib2,giotypes,gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGBusNameAppearedCallback = procedure(connection: PGDBusConnection; name: Pgchar; name_owner: Pgchar; user_data: Tgpointer); cdecl;
  TGBusNameVanishedCallback = procedure(connection: PGDBusConnection; name: Pgchar; user_data: Tgpointer); cdecl;

function g_bus_watch_name(bus_type: TGBusType; name: Pgchar; flags: TGBusNameWatcherFlags; name_appeared_handler: TGBusNameAppearedCallback; name_vanished_handler: TGBusNameVanishedCallback;
  user_data: Tgpointer; user_data_free_func: TGDestroyNotify): Tguint; cdecl; external libgio2;
function g_bus_watch_name_on_connection(connection: PGDBusConnection; name: Pgchar; flags: TGBusNameWatcherFlags; name_appeared_handler: TGBusNameAppearedCallback; name_vanished_handler: TGBusNameVanishedCallback;
  user_data: Tgpointer; user_data_free_func: TGDestroyNotify): Tguint; cdecl; external libgio2;
function g_bus_watch_name_with_closures(bus_type: TGBusType; name: Pgchar; flags: TGBusNameWatcherFlags; name_appeared_closure: PGClosure; name_vanished_closure: PGClosure): Tguint; cdecl; external libgio2;
function g_bus_watch_name_on_connection_with_closures(connection: PGDBusConnection; name: Pgchar; flags: TGBusNameWatcherFlags; name_appeared_closure: PGClosure; name_vanished_closure: PGClosure): Tguint; cdecl; external libgio2;
procedure g_bus_unwatch_name(watcher_id: Tguint); cdecl; external libgio2;

// === Konventiert am: 26-6-26 16:49:16 ===


implementation



end.
