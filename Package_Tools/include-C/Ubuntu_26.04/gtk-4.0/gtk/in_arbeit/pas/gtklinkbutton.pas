unit gtklinkbutton;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkLinkButton = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_link_button_get_type: TGType; cdecl; external libgtk4;
function gtk_link_button_new(uri: pchar): PGtkWidget; cdecl; external libgtk4;
function gtk_link_button_new_with_label(uri: pchar; _label: pchar): PGtkWidget; cdecl; external libgtk4;
function gtk_link_button_get_uri(link_button: PGtkLinkButton): pchar; cdecl; external libgtk4;
procedure gtk_link_button_set_uri(link_button: PGtkLinkButton; uri: pchar); cdecl; external libgtk4;
function gtk_link_button_get_visited(link_button: PGtkLinkButton): Tgboolean; cdecl; external libgtk4;
procedure gtk_link_button_set_visited(link_button: PGtkLinkButton; visited: Tgboolean); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:03:21 ===

function GTK_TYPE_LINK_BUTTON: TGType;
function GTK_LINK_BUTTON(obj: Pointer): PGtkLinkButton;
function GTK_IS_LINK_BUTTON(obj: Pointer): Tgboolean;
{$ENDIF read_struct}

implementation

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



end.
