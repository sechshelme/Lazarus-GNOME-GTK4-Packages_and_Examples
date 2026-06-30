unit gmenuexporter;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes, gmenumodel;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  G_MENU_EXPORTER_MAX_SECTION_SIZE = 1000;
  {$ENDIF read_enum}

{$IFDEF read_function}
function g_dbus_connection_export_menu_model(connection: PGDBusConnection; object_path: Pgchar; menu: PGMenuModel; error: PPGError): Tguint; cdecl; external libgio2;
procedure g_dbus_connection_unexport_menu_model(connection: PGDBusConnection; export_id: Tguint); cdecl; external libgio2;
{$ENDIF read_function}

// === Konventiert am: 26-6-26 19:38:51 ===


implementation



end.
