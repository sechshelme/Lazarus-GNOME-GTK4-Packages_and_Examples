unit adw_window;

interface

uses
  fp_glib2, fp_GTK4, adw_breakpoint, adw_dialog;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_DERIVABLE_TYPE (AdwWindow, adw_window, ADW, WINDOW, GtkWindow) }
type
  TAdwWindowClass = record
    parent_class: TGtkWindowClass;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwWindowClass = ^TAdwWindowClass;

  TAdwWindow = record
    parent_instance: TGtkWindow;
  end;
  PAdwWindow = ^TAdwWindow;

function adw_window_get_type: TGType; cdecl; external libadwaita;
function adw_window_new: PGtkWidget; cdecl; external libadwaita;
function adw_window_get_content(self: PAdwWindow): PGtkWidget; cdecl; external libadwaita;
procedure adw_window_set_content(self: PAdwWindow; content: PGtkWidget); cdecl; external libadwaita;
procedure adw_window_add_breakpoint(self: PAdwWindow; breakpoint: PAdwBreakpoint); cdecl; external libadwaita;
function adw_window_get_current_breakpoint(self: PAdwWindow): PAdwBreakpoint; cdecl; external libadwaita;
function adw_window_get_dialogs(self: PAdwWindow): PGListModel; cdecl; external libadwaita;
function adw_window_get_visible_dialog(self: PAdwWindow): PAdwDialog; cdecl; external libadwaita;

// === Konventiert am: 9-1-25 17:56:13 ===

function ADW_TYPE_WINDOW: TGType;
function ADW_WINDOW(obj: Pointer): PAdwWindow;
function ADW_IS_WINDOW(obj: Pointer): Tgboolean;
function ADW_WINDOW_CLASS(klass: Pointer): PAdwWindowClass;
function ADW_IS_WINDOW_CLASS(klass: Pointer): Tgboolean;
function ADW_WINDOW_GET_CLASS(obj: Pointer): PAdwWindowClass;

implementation

function ADW_TYPE_WINDOW: TGType;
begin
  Result := adw_window_get_type;
end;

function ADW_WINDOW(obj: Pointer): PAdwWindow;
begin
  Result := PAdwWindow(g_type_check_instance_cast(obj, ADW_TYPE_WINDOW));
end;

function ADW_IS_WINDOW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_WINDOW);
end;

function ADW_WINDOW_CLASS(klass: Pointer): PAdwWindowClass;
begin
  Result := PAdwWindowClass(g_type_check_class_cast(klass, ADW_TYPE_WINDOW));
end;

function ADW_IS_WINDOW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_WINDOW);
end;

function ADW_WINDOW_GET_CLASS(obj: Pointer): PAdwWindowClass;
begin
  Result := PAdwWindowClass(PGTypeInstance(obj)^.g_class);
end;


end.
