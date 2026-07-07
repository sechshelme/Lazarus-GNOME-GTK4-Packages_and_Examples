unit gtkapplication;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwindow;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkApplication = ^TGtkApplication;
  TGtkApplication = record
    parent_instance: TGApplication;
  end;

  PGtkApplicationClass = ^TGtkApplicationClass;
  TGtkApplicationClass = record
    parent_class: TGApplicationClass;
    window_added: procedure(application: PGtkApplication; window: PGtkWindow); cdecl;
    window_removed: procedure(application: PGtkApplication; window: PGtkWindow); cdecl;
    padding: array[0..7] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_application_get_type: TGType; cdecl; external libgtk4;
function gtk_application_new(application_id: pchar; flags: TGApplicationFlags): PGtkApplication; cdecl; external libgtk4;
procedure gtk_application_add_window(application: PGtkApplication; window: PGtkWindow); cdecl; external libgtk4;
procedure gtk_application_remove_window(application: PGtkApplication; window: PGtkWindow); cdecl; external libgtk4;
function gtk_application_get_windows(application: PGtkApplication): PGList; cdecl; external libgtk4;
function gtk_application_get_menubar(application: PGtkApplication): PGMenuModel; cdecl; external libgtk4;
procedure gtk_application_set_menubar(application: PGtkApplication; menubar: PGMenuModel); cdecl; external libgtk4;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PGtkApplicationInhibitFlags = ^TGtkApplicationInhibitFlags;
  TGtkApplicationInhibitFlags = longint;
const
  GTK_APPLICATION_INHIBIT_LOGOUT = 1 shl 0;
  GTK_APPLICATION_INHIBIT_SWITCH = 1 shl 1;
  GTK_APPLICATION_INHIBIT_SUSPEND = 1 shl 2;
  GTK_APPLICATION_INHIBIT_IDLE = 1 shl 3;
  {$ENDIF read_enum}

{$IFDEF read_function}
function gtk_application_inhibit(application: PGtkApplication; window: PGtkWindow; flags: TGtkApplicationInhibitFlags; reason: pchar): Tguint; cdecl; external libgtk4;
procedure gtk_application_uninhibit(application: PGtkApplication; cookie: Tguint); cdecl; external libgtk4;
function gtk_application_get_window_by_id(application: PGtkApplication; id: Tguint): PGtkWindow; cdecl; external libgtk4;
function gtk_application_get_active_window(application: PGtkApplication): PGtkWindow; cdecl; external libgtk4;
function gtk_application_list_action_descriptions(application: PGtkApplication): Ppchar; cdecl; external libgtk4;
function gtk_application_get_accels_for_action(application: PGtkApplication; detailed_action_name: pchar): Ppchar; cdecl; external libgtk4;
function gtk_application_get_actions_for_accel(application: PGtkApplication; accel: pchar): Ppchar; cdecl; external libgtk4;
procedure gtk_application_set_accels_for_action(application: PGtkApplication; detailed_action_name: pchar; accels: PPchar); cdecl; external libgtk4;
function gtk_application_get_menu_by_id(application: PGtkApplication; id: pchar): PGMenu; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 19:16:20 ===

function GTK_TYPE_APPLICATION: TGType;
function GTK_APPLICATION(obj: Pointer): PGtkApplication;
function GTK_APPLICATION_CLASS(klass: Pointer): PGtkApplicationClass;
function GTK_IS_APPLICATION(obj: Pointer): Tgboolean;
function GTK_IS_APPLICATION_CLASS(klass: Pointer): Tgboolean;
function GTK_APPLICATION_GET_CLASS(obj: Pointer): PGtkApplicationClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_APPLICATION: TGType;
begin
  GTK_TYPE_APPLICATION := gtk_application_get_type;
end;

function GTK_APPLICATION(obj: Pointer): PGtkApplication;
begin
  Result := PGtkApplication(g_type_check_instance_cast(obj, GTK_TYPE_APPLICATION));
end;

function GTK_APPLICATION_CLASS(klass: Pointer): PGtkApplicationClass;
begin
  Result := PGtkApplicationClass(g_type_check_class_cast(klass, GTK_TYPE_APPLICATION));
end;

function GTK_IS_APPLICATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_APPLICATION);
end;

function GTK_IS_APPLICATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_APPLICATION);
end;

function GTK_APPLICATION_GET_CLASS(obj: Pointer): PGtkApplicationClass;
begin
  Result := PGtkApplicationClass(PGTypeInstance(obj)^.g_class);
end;



end.
