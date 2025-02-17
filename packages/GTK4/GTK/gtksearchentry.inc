
{$IFDEF read_interface}


type
  TGtkSearchEntry = record // _GtkSearchEntry
  end;
  PGtkSearchEntry = ^TGtkSearchEntry;

function gtk_search_entry_get_type: TGType; cdecl; external libgtk4;
function gtk_search_entry_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_search_entry_set_key_capture_widget(entry: PGtkSearchEntry; widget: PGtkWidget); cdecl; external libgtk4;
function gtk_search_entry_get_key_capture_widget(entry: PGtkSearchEntry): PGtkWidget; cdecl; external libgtk4;
procedure gtk_search_entry_set_search_delay(entry: PGtkSearchEntry; delay: Tguint); cdecl; external libgtk4;
function gtk_search_entry_get_search_delay(entry: PGtkSearchEntry): Tguint; cdecl; external libgtk4;
procedure gtk_search_entry_set_placeholder_text(entry: PGtkSearchEntry; Text: PChar); cdecl; external libgtk4;
function gtk_search_entry_get_placeholder_text(entry: PGtkSearchEntry): PChar; cdecl; external libgtk4;
procedure gtk_search_entry_set_input_purpose(entry: PGtkSearchEntry; purpose: TGtkInputPurpose); cdecl; external libgtk4;
function gtk_search_entry_get_input_purpose(entry: PGtkSearchEntry): TGtkInputPurpose; cdecl; external libgtk4;
procedure gtk_search_entry_set_input_hints(entry: PGtkSearchEntry; hints: TGtkInputHints); cdecl; external libgtk4;
function gtk_search_entry_get_input_hints(entry: PGtkSearchEntry): TGtkInputHints; cdecl; external libgtk4;

// === Konventiert am: 28-7-24 15:27:32 ===

function GTK_TYPE_SEARCH_ENTRY: TGType;
function GTK_SEARCH_ENTRY(obj: Pointer): PGtkSearchEntry;
function GTK_IS_SEARCH_ENTRY(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_SEARCH_ENTRY: TGType;
begin
  GTK_TYPE_SEARCH_ENTRY := gtk_search_entry_get_type;
end;

function GTK_SEARCH_ENTRY(obj: Pointer): PGtkSearchEntry;
begin
  Result := PGtkSearchEntry(g_type_check_instance_cast(obj, GTK_TYPE_SEARCH_ENTRY));
end;

function GTK_IS_SEARCH_ENTRY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SEARCH_ENTRY);
end;



{$ENDIF read_implementation}
