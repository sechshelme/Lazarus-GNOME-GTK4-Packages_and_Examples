unit gmenuexporter;

interface

uses
  fp_glib2, giotypes, gmenumodel;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  G_MENU_EXPORTER_MAX_SECTION_SIZE = 1000;

function g_dbus_connection_export_menu_model(connection: PGDBusConnection; object_path: Pgchar; menu: PGMenuModel; error: PPGError): Tguint; cdecl; external libgio2;
procedure g_dbus_connection_unexport_menu_model(connection: PGDBusConnection; export_id: Tguint); cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:38:51 ===


implementation



end.
