unit gtkshortcutsgroup;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkshortcutsshortcut;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkShortcutsGroup = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_shortcuts_group_get_type: TGType; cdecl; external libgtk4; deprecated;
procedure gtk_shortcuts_group_add_shortcut(self: PGtkShortcutsGroup; shortcut: PGtkShortcutsShortcut); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:49:51 ===

function GTK_TYPE_SHORTCUTS_GROUP: TGType;
function GTK_SHORTCUTS_GROUP(obj: Pointer): PGtkShortcutsGroup;
function GTK_IS_SHORTCUTS_GROUP(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_SHORTCUTS_GROUP: TGType;
begin
  GTK_TYPE_SHORTCUTS_GROUP := gtk_shortcuts_group_get_type;
end;

function GTK_SHORTCUTS_GROUP(obj: Pointer): PGtkShortcutsGroup;
begin
  Result := PGtkShortcutsGroup(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUTS_GROUP));
end;

function GTK_IS_SHORTCUTS_GROUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SHORTCUTS_GROUP);
end;



end.
