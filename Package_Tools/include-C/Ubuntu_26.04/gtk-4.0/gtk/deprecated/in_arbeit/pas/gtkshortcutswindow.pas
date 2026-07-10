unit gtkshortcutswindow;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkshortcutssection;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkShortcutsWindow = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_shortcuts_window_get_type: TGType; cdecl; external libgtk4; deprecated;
procedure gtk_shortcuts_window_add_section(self: PGtkShortcutsWindow; section: PGtkShortcutsSection); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:49:38 ===

function GTK_TYPE_SHORTCUTS_WINDOW: TGType;
function GTK_SHORTCUTS_WINDOW(obj: Pointer): PGtkShortcutsWindow;
function GTK_IS_SHORTCUTS_WINDOW(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_SHORTCUTS_WINDOW: TGType;
begin
  GTK_TYPE_SHORTCUTS_WINDOW := gtk_shortcuts_window_get_type;
end;

function GTK_SHORTCUTS_WINDOW(obj: Pointer): PGtkShortcutsWindow;
begin
  Result := PGtkShortcutsWindow(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUTS_WINDOW));
end;

function GTK_IS_SHORTCUTS_WINDOW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SHORTCUTS_WINDOW);
end;



end.
