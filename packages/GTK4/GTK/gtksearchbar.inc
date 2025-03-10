
{$IFDEF read_interface}


type
  TGtkSearchBar = record // _GtkSearchBar
  end;
  PGtkSearchBar = ^TGtkSearchBar;

function gtk_search_bar_get_type: TGType; cdecl; external libgtk4;
function gtk_search_bar_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_search_bar_connect_entry(bar: PGtkSearchBar; entry: PGtkEditable); cdecl; external libgtk4;
function gtk_search_bar_get_search_mode(bar: PGtkSearchBar): Tgboolean; cdecl; external libgtk4;
procedure gtk_search_bar_set_search_mode(bar: PGtkSearchBar; search_mode: Tgboolean); cdecl; external libgtk4;
function gtk_search_bar_get_show_close_button(bar: PGtkSearchBar): Tgboolean; cdecl; external libgtk4;
procedure gtk_search_bar_set_show_close_button(bar: PGtkSearchBar; Visible: Tgboolean); cdecl; external libgtk4;
procedure gtk_search_bar_set_key_capture_widget(bar: PGtkSearchBar; widget: PGtkWidget); cdecl; external libgtk4;
function gtk_search_bar_get_key_capture_widget(bar: PGtkSearchBar): PGtkWidget; cdecl; external libgtk4;
procedure gtk_search_bar_set_child(bar: PGtkSearchBar; child: PGtkWidget); cdecl; external libgtk4;
function gtk_search_bar_get_child(bar: PGtkSearchBar): PGtkWidget; cdecl; external libgtk4;

// === Konventiert am: 28-7-24 15:27:23 ===

function GTK_TYPE_SEARCH_BAR: TGType;
function GTK_SEARCH_BAR(obj: Pointer): PGtkSearchBar;
function GTK_IS_SEARCH_BAR(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_SEARCH_BAR: TGType;
begin
  GTK_TYPE_SEARCH_BAR := gtk_search_bar_get_type;
end;

function GTK_SEARCH_BAR(obj: Pointer): PGtkSearchBar;
begin
  Result := PGtkSearchBar(g_type_check_instance_cast(obj, GTK_TYPE_SEARCH_BAR));
end;

function GTK_IS_SEARCH_BAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SEARCH_BAR);
end;



{$ENDIF read_implementation}
