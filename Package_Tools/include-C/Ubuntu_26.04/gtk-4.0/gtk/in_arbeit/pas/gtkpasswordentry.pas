unit gtkpasswordentry;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkPasswordEntry = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_password_entry_get_type: TGType; cdecl; external libgtk4;
function gtk_password_entry_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_password_entry_set_show_peek_icon(entry: PGtkPasswordEntry; show_peek_icon: Tgboolean); cdecl; external libgtk4;
function gtk_password_entry_get_show_peek_icon(entry: PGtkPasswordEntry): Tgboolean; cdecl; external libgtk4;
procedure gtk_password_entry_set_extra_menu(entry: PGtkPasswordEntry; model: PGMenuModel); cdecl; external libgtk4;
function gtk_password_entry_get_extra_menu(entry: PGtkPasswordEntry): PGMenuModel; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:06:58 ===

function GTK_TYPE_PASSWORD_ENTRY: TGType;
function GTK_PASSWORD_ENTRY(obj: Pointer): PGtkPasswordEntry;
function GTK_IS_PASSWORD_ENTRY(obj: Pointer): Tgboolean;
{$ENDIF read_struct}

implementation

function GTK_TYPE_PASSWORD_ENTRY: TGType;
begin
  GTK_TYPE_PASSWORD_ENTRY := gtk_password_entry_get_type;
end;

function GTK_PASSWORD_ENTRY(obj: Pointer): PGtkPasswordEntry;
begin
  Result := PGtkPasswordEntry(g_type_check_instance_cast(obj, GTK_TYPE_PASSWORD_ENTRY));
end;

function GTK_IS_PASSWORD_ENTRY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_PASSWORD_ENTRY);
end;



end.
