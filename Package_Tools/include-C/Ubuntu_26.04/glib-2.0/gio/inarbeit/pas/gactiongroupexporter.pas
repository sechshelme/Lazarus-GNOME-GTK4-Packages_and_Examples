unit gactiongroupexporter;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$IFDEF read_function}
function g_dbus_connection_export_action_group(connection: PGDBusConnection; object_path: Pgchar; action_group: PGActionGroup; error: PPGError): Tguint; cdecl; external libgio2;
procedure g_dbus_connection_unexport_action_group(connection: PGDBusConnection; export_id: Tguint); cdecl; external libgio2;
{$ENDIF read_function}

// === Konventiert am: 26-6-26 16:29:12 ===


implementation



end.
