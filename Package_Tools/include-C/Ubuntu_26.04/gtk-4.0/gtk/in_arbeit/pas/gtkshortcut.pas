unit gtkshortcut;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkShortcutClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_shortcut_get_type: TGType; cdecl; external libgtk4;
function gtk_shortcut_new(trigger: PGtkShortcutTrigger; action: PGtkShortcutAction): PGtkShortcut; cdecl; external libgtk4;
function gtk_shortcut_new_with_arguments(trigger: PGtkShortcutTrigger; action: PGtkShortcutAction; format_string: pchar; args: array of const): PGtkShortcut; cdecl; external libgtk4;
function gtk_shortcut_new_with_arguments(trigger: PGtkShortcutTrigger; action: PGtkShortcutAction; format_string: pchar): PGtkShortcut; cdecl; external libgtk4;
function gtk_shortcut_get_trigger(self: PGtkShortcut): PGtkShortcutTrigger; cdecl; external libgtk4;
procedure gtk_shortcut_set_trigger(self: PGtkShortcut; trigger: PGtkShortcutTrigger); cdecl; external libgtk4;
function gtk_shortcut_get_action(self: PGtkShortcut): PGtkShortcutAction; cdecl; external libgtk4;
procedure gtk_shortcut_set_action(self: PGtkShortcut; action: PGtkShortcutAction); cdecl; external libgtk4;
function gtk_shortcut_get_arguments(self: PGtkShortcut): PGVariant; cdecl; external libgtk4;
procedure gtk_shortcut_set_arguments(self: PGtkShortcut; args: PGVariant); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:00:14 ===

function GTK_TYPE_SHORTCUT: TGType;
function GTK_SHORTCUT(obj: Pointer): PGtkShortcut;
function GTK_IS_SHORTCUT(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_SHORTCUT: TGType;
begin
  Result := gtk_shortcut_get_type;
end;

function GTK_SHORTCUT(obj: Pointer): PGtkShortcut;
begin
  Result := PGtkShortcut(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUT));
end;

function GTK_IS_SHORTCUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SHORTCUT);
end;

end.
