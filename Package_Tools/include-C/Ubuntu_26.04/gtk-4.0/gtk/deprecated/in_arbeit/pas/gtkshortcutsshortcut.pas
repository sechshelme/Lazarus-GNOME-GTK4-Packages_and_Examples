unit gtkshortcutsshortcut;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGtkShortcutType = ^TGtkShortcutType;
  TGtkShortcutType = longint;
const
  GTK_SHORTCUT_ACCELERATOR = 0;
  GTK_SHORTCUT_GESTURE_PINCH = 1;
  GTK_SHORTCUT_GESTURE_STRETCH = 2;
  GTK_SHORTCUT_GESTURE_ROTATE_CLOCKWISE = 3;
  GTK_SHORTCUT_GESTURE_ROTATE_COUNTERCLOCKWISE = 4;
  GTK_SHORTCUT_GESTURE_TWO_FINGER_SWIPE_LEFT = 5;
  GTK_SHORTCUT_GESTURE_TWO_FINGER_SWIPE_RIGHT = 6;
  GTK_SHORTCUT_GESTURE = 7;
  GTK_SHORTCUT_GESTURE_SWIPE_LEFT = 8;
  GTK_SHORTCUT_GESTURE_SWIPE_RIGHT = 9;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGtkShortcutsShortcut = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_shortcuts_shortcut_get_type: TGType; cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:49:42 ===

function GTK_TYPE_SHORTCUTS_SHORTCUT: TGType;
function GTK_SHORTCUTS_SHORTCUT(obj: Pointer): PGtkShortcutsShortcut;
function GTK_IS_SHORTCUTS_SHORTCUT(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_SHORTCUTS_SHORTCUT: TGType;
begin
  GTK_TYPE_SHORTCUTS_SHORTCUT := gtk_shortcuts_shortcut_get_type;
end;

function GTK_SHORTCUTS_SHORTCUT(obj: Pointer): PGtkShortcutsShortcut;
begin
  Result := PGtkShortcutsShortcut(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUTS_SHORTCUT));
end;

function GTK_IS_SHORTCUTS_SHORTCUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SHORTCUTS_SHORTCUT);
end;



end.
