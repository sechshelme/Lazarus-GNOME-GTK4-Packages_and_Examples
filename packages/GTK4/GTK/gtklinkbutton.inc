
{$IFDEF read_interface}

type
  TGtkLinkButton = record // _GtkLinkButton
  end;
  PGtkLinkButton = ^TGtkLinkButton;

function gtk_link_button_get_type: TGType; cdecl; external libgtk4;
function gtk_link_button_new(uri: PChar): PGtkWidget; cdecl; external libgtk4;
function gtk_link_button_new_with_label(uri: PChar; _label: PChar): PGtkWidget; cdecl; external libgtk4;
function gtk_link_button_get_uri(link_button: PGtkLinkButton): PChar; cdecl; external libgtk4;
procedure gtk_link_button_set_uri(link_button: PGtkLinkButton; uri: PChar); cdecl; external libgtk4;
function gtk_link_button_get_visited(link_button: PGtkLinkButton): Tgboolean; cdecl; external libgtk4;
procedure gtk_link_button_set_visited(link_button: PGtkLinkButton; visited: Tgboolean); cdecl; external libgtk4;

// === Konventiert am: 27-7-24 19:56:47 ===

function GTK_TYPE_LINK_BUTTON: TGType;
function GTK_LINK_BUTTON(obj: Pointer): PGtkLinkButton;
function GTK_IS_LINK_BUTTON(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_LINK_BUTTON: TGType;
begin
  GTK_TYPE_LINK_BUTTON := gtk_link_button_get_type;
end;

function GTK_LINK_BUTTON(obj: Pointer): PGtkLinkButton;
begin
  Result := PGtkLinkButton(g_type_check_instance_cast(obj, GTK_TYPE_LINK_BUTTON));
end;

function GTK_IS_LINK_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_LINK_BUTTON);
end;



{$ENDIF read_implementation}
