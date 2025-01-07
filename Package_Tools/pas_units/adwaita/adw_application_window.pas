unit adw_application_window;

interface

uses
  fp_glib2, fp_GTK4, adw_breakpoint, adw_dialog;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_DERIVABLE_TYPE (AdwApplicationWindow, adw_application_window, ADW, APPLICATION_WINDOW, GtkApplicationWindow) }
type
  TAdwApplicationWindowClass = record
    parent_class: TGtkApplicationWindowClass;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwApplicationWindowClass = ^TAdwApplicationWindowClass;

  TAdwApplicationWindow = record
    parent_instance: TGtkApplicationWindow;
  end;
  PAdwApplicationWindow = ^TAdwApplicationWindow;

function adw_application_window_get_type: TGType; cdecl; external libadwaita;
function adw_application_window_new(app: PGtkApplication): PGtkWidget; cdecl; external libadwaita;
procedure adw_application_window_set_content(self: PAdwApplicationWindow; content: PGtkWidget); cdecl; external libadwaita;
function adw_application_window_get_content(self: PAdwApplicationWindow): PGtkWidget; cdecl; external libadwaita;
procedure adw_application_window_add_breakpoint(self: PAdwApplicationWindow; breakpoint: PAdwBreakpoint); cdecl; external libadwaita;
function adw_application_window_get_current_breakpoint(self: PAdwApplicationWindow): PAdwBreakpoint; cdecl; external libadwaita;
function adw_application_window_get_dialogs(self: PAdwApplicationWindow): PGListModel; cdecl; external libadwaita;
function adw_application_window_get_visible_dialog(self: PAdwApplicationWindow): PAdwDialog; cdecl; external libadwaita;

// === Konventiert am: 7-1-25 19:47:29 ===

function ADW_TYPE_APPLICATION_WINDOW: TGType;
function ADW_APPLICATION_WINDOW(obj: Pointer): PAdwApplicationWindow;
function ADW_IS_APPLICATION_WINDOW(obj: Pointer): Tgboolean;
function ADW_APPLICATION_WINDOW_CLASS(klass: Pointer): PAdwApplicationWindowClass;
function ADW_IS_APPLICATION_WINDOW_CLASS(klass: Pointer): Tgboolean;
function ADW_APPLICATION_WINDOW_GET_CLASS(obj: Pointer): PAdwApplicationWindowClass;

implementation

function ADW_TYPE_APPLICATION_WINDOW: TGType;
begin
  Result := adw_application_window_get_type;
end;

function ADW_APPLICATION_WINDOW(obj: Pointer): PAdwApplicationWindow;
begin
  Result := PAdwApplicationWindow(g_type_check_instance_cast(obj, ADW_TYPE_APPLICATION_WINDOW));
end;

function ADW_IS_APPLICATION_WINDOW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_APPLICATION_WINDOW);
end;

function ADW_APPLICATION_WINDOW_CLASS(klass: Pointer): PAdwApplicationWindowClass;
begin
  Result := PAdwApplicationWindowClass(g_type_check_class_cast(klass, ADW_TYPE_APPLICATION_WINDOW));
end;

function ADW_IS_APPLICATION_WINDOW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_APPLICATION_WINDOW);
end;

function ADW_APPLICATION_WINDOW_GET_CLASS(obj: Pointer): PAdwApplicationWindowClass;
begin
  Result := PAdwApplicationWindowClass(PGTypeInstance(obj)^.g_class);
end;


end.
