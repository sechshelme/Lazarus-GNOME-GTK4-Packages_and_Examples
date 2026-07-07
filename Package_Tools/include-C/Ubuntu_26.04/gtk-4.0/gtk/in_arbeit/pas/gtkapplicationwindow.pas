unit gtkapplicationwindow;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtktypes, gtkwindow, gtkwidget, gtkapplication;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkApplicationWindow = ^TGtkApplicationWindow;
  TGtkApplicationWindow = record
    parent_instance: TGtkWindow;
  end;

  PGtkApplicationWindowClass = ^TGtkApplicationWindowClass;
  TGtkApplicationWindowClass = record
    parent_class: TGtkWindowClass;
    padding: array[0..7] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_application_window_get_type: TGType; cdecl; external libgtk4;
function gtk_application_window_new(application: PGtkApplication): PGtkWidget; cdecl; external libgtk4;
procedure gtk_application_window_set_show_menubar(window: PGtkApplicationWindow; show_menubar: Tgboolean); cdecl; external libgtk4;
function gtk_application_window_get_show_menubar(window: PGtkApplicationWindow): Tgboolean; cdecl; external libgtk4;
function gtk_application_window_get_id(window: PGtkApplicationWindow): Tguint; cdecl; external libgtk4;
procedure gtk_application_window_set_help_overlay(window: PGtkApplicationWindow; help_overlay: PGtkShortcutsWindow); cdecl; external libgtk4; deprecated;
function gtk_application_window_get_help_overlay(window: PGtkApplicationWindow): PGtkShortcutsWindow; cdecl; external libgtk4; deprecated;

// === Konventiert am: 5-7-26 19:16:15 ===

function GTK_TYPE_APPLICATION_WINDOW: TGType;
function GTK_APPLICATION_WINDOW(obj: Pointer): PGtkApplicationWindow;
function GTK_APPLICATION_WINDOW_CLASS(klass: Pointer): PGtkApplicationWindowClass;
function GTK_IS_APPLICATION_WINDOW(obj: Pointer): Tgboolean;
function GTK_IS_APPLICATION_WINDOW_CLASS(klass: Pointer): Tgboolean;
function GTK_APPLICATION_WINDOW_GET_CLASS(obj: Pointer): PGtkApplicationWindowClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_APPLICATION_WINDOW: TGType;
begin
  GTK_TYPE_APPLICATION_WINDOW := gtk_application_window_get_type;
end;

function GTK_APPLICATION_WINDOW(obj: Pointer): PGtkApplicationWindow;
begin
  Result := PGtkApplicationWindow(g_type_check_instance_cast(obj, GTK_TYPE_APPLICATION_WINDOW));
end;

function GTK_APPLICATION_WINDOW_CLASS(klass: Pointer): PGtkApplicationWindowClass;
begin
  Result := PGtkApplicationWindowClass(g_type_check_class_cast(klass, GTK_TYPE_APPLICATION_WINDOW));
end;

function GTK_IS_APPLICATION_WINDOW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_APPLICATION_WINDOW);
end;

function GTK_IS_APPLICATION_WINDOW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_APPLICATION_WINDOW);
end;

function GTK_APPLICATION_WINDOW_GET_CLASS(obj: Pointer): PGtkApplicationWindowClass;
begin
  Result := PGtkApplicationWindowClass(PGTypeInstance(obj)^.g_class);
end;



end.
