unit gtkshortcutssection;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkshortcutsgroup;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkShortcutsSection = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_shortcuts_section_get_type: TGType; cdecl; external libgtk4; deprecated;
procedure gtk_shortcuts_section_add_group(self: PGtkShortcutsSection; group: PGtkShortcutsGroup); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:49:45 ===

function GTK_TYPE_SHORTCUTS_SECTION: TGType;
function GTK_SHORTCUTS_SECTION(obj: Pointer): PGtkShortcutsSection;
function GTK_IS_SHORTCUTS_SECTION(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_SHORTCUTS_SECTION: TGType;
begin
  GTK_TYPE_SHORTCUTS_SECTION := gtk_shortcuts_section_get_type;
end;

function GTK_SHORTCUTS_SECTION(obj: Pointer): PGtkShortcutsSection;
begin
  Result := PGtkShortcutsSection(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUTS_SECTION));
end;

function GTK_IS_SHORTCUTS_SECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SHORTCUTS_SECTION);
end;



end.
