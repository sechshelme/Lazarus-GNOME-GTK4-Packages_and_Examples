unit gdbusnameowning;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  TGBusAcquiredCallback = procedure(connection: PGDBusConnection; name: Pgchar; user_data: Tgpointer); cdecl;
  TGBusNameAcquiredCallback = procedure(connection: PGDBusConnection; name: Pgchar; user_data: Tgpointer); cdecl;
  TGBusNameLostCallback = procedure(connection: PGDBusConnection; name: Pgchar; user_data: Tgpointer); cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_bus_own_name(bus_type: TGBusType; name: Pgchar; flags: TGBusNameOwnerFlags; bus_acquired_handler: TGBusAcquiredCallback; name_acquired_handler: TGBusNameAcquiredCallback;
  name_lost_handler: TGBusNameLostCallback; user_data: Tgpointer; user_data_free_func: TGDestroyNotify): Tguint; cdecl; external libgio2;
function g_bus_own_name_on_connection(connection: PGDBusConnection; name: Pgchar; flags: TGBusNameOwnerFlags; name_acquired_handler: TGBusNameAcquiredCallback; name_lost_handler: TGBusNameLostCallback;
  user_data: Tgpointer; user_data_free_func: TGDestroyNotify): Tguint; cdecl; external libgio2;
function g_bus_own_name_with_closures(bus_type: TGBusType; name: Pgchar; flags: TGBusNameOwnerFlags; bus_acquired_closure: PGClosure; name_acquired_closure: PGClosure;
  name_lost_closure: PGClosure): Tguint; cdecl; external libgio2;
function g_bus_own_name_on_connection_with_closures(connection: PGDBusConnection; name: Pgchar; flags: TGBusNameOwnerFlags; name_acquired_closure: PGClosure; name_lost_closure: PGClosure): Tguint; cdecl; external libgio2;
procedure g_bus_unown_name(owner_id: Tguint); cdecl; external libgio2;
{$ENDIF read_function}

// === Konventiert am: 26-6-26 16:49:24 ===


implementation



end.
