unit gtkshortcutlabel;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkShortcutLabel = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_shortcut_label_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_shortcut_label_new(accelerator: pchar): PGtkWidget; cdecl; external libgtk4; deprecated;
function gtk_shortcut_label_get_accelerator(self: PGtkShortcutLabel): pchar; cdecl; external libgtk4; deprecated;
procedure gtk_shortcut_label_set_accelerator(self: PGtkShortcutLabel; accelerator: pchar); cdecl; external libgtk4; deprecated;
function gtk_shortcut_label_get_disabled_text(self: PGtkShortcutLabel): pchar; cdecl; external libgtk4; deprecated;
procedure gtk_shortcut_label_set_disabled_text(self: PGtkShortcutLabel; disabled_text: pchar); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:49:55 ===

function GTK_TYPE_SHORTCUT_LABEL: TGType;
function GTK_SHORTCUT_LABEL(obj: Pointer): PGtkShortcutLabel;
function GTK_IS_SHORTCUT_LABEL(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_SHORTCUT_LABEL: TGType;
begin
  GTK_TYPE_SHORTCUT_LABEL := gtk_shortcut_label_get_type;
end;

function GTK_SHORTCUT_LABEL(obj: Pointer): PGtkShortcutLabel;
begin
  Result := PGtkShortcutLabel(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUT_LABEL));
end;

function GTK_IS_SHORTCUT_LABEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SHORTCUT_LABEL);
end;



end.
