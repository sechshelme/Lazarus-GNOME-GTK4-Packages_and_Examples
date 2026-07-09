unit gtksearchentry;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkenums, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkSearchEntry = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_search_entry_get_type: TGType; cdecl; external libgtk4;
function gtk_search_entry_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_search_entry_set_key_capture_widget(entry: PGtkSearchEntry; widget: PGtkWidget); cdecl; external libgtk4;
function gtk_search_entry_get_key_capture_widget(entry: PGtkSearchEntry): PGtkWidget; cdecl; external libgtk4;
procedure gtk_search_entry_set_search_delay(entry: PGtkSearchEntry; delay: Tguint); cdecl; external libgtk4;
function gtk_search_entry_get_search_delay(entry: PGtkSearchEntry): Tguint; cdecl; external libgtk4;
procedure gtk_search_entry_set_placeholder_text(entry: PGtkSearchEntry; text: pchar); cdecl; external libgtk4;
function gtk_search_entry_get_placeholder_text(entry: PGtkSearchEntry): pchar; cdecl; external libgtk4;
procedure gtk_search_entry_set_input_purpose(entry: PGtkSearchEntry; purpose: TGtkInputPurpose); cdecl; external libgtk4;
function gtk_search_entry_get_input_purpose(entry: PGtkSearchEntry): TGtkInputPurpose; cdecl; external libgtk4;
procedure gtk_search_entry_set_input_hints(entry: PGtkSearchEntry; hints: TGtkInputHints); cdecl; external libgtk4;
function gtk_search_entry_get_input_hints(entry: PGtkSearchEntry): TGtkInputHints; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:45:21 ===

function GTK_TYPE_SEARCH_ENTRY: TGType;
function GTK_SEARCH_ENTRY(obj: Pointer): PGtkSearchEntry;
function GTK_IS_SEARCH_ENTRY(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

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



end.
