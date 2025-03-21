
{$IFDEF read_interface}

type
  TGtkPasswordEntry = record // _GtkPasswordEntry
  end;
  PGtkPasswordEntry = ^TGtkPasswordEntry;

  TGtkPasswordEntryClass = record // _GtkPasswordEntryClass
  end;
  PGtkPasswordEntryClass = ^TGtkPasswordEntryClass;

function gtk_password_entry_get_type: TGType; cdecl; external libgtk4;
function gtk_password_entry_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_password_entry_set_show_peek_icon(entry: PGtkPasswordEntry; show_peek_icon: Tgboolean); cdecl; external libgtk4;
function gtk_password_entry_get_show_peek_icon(entry: PGtkPasswordEntry): Tgboolean; cdecl; external libgtk4;
procedure gtk_password_entry_set_extra_menu(entry: PGtkPasswordEntry; model: PGMenuModel); cdecl; external libgtk4;
function gtk_password_entry_get_extra_menu(entry: PGtkPasswordEntry): PGMenuModel; cdecl; external libgtk4;

// === Konventiert am: 28-7-24 15:14:10 ===

function GTK_TYPE_PASSWORD_ENTRY: TGType;
function GTK_PASSWORD_ENTRY(obj: Pointer): PGtkPasswordEntry;
function GTK_IS_PASSWORD_ENTRY(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

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



{$ENDIF read_implementation}
