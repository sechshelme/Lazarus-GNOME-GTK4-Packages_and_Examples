

  {$IFDEF read_struct}
type
  PGtkColorButton = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_color_button_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_color_button_new: PGtkWidget; cdecl; external libgtk4; deprecated;
function gtk_color_button_new_with_rgba(rgba: PGdkRGBA): PGtkWidget; cdecl; external libgtk4; deprecated;
procedure gtk_color_button_set_title(button: PGtkColorButton; title: pchar); cdecl; external libgtk4; deprecated;
function gtk_color_button_get_title(button: PGtkColorButton): pchar; cdecl; external libgtk4; deprecated;
function gtk_color_button_get_modal(button: PGtkColorButton): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_color_button_set_modal(button: PGtkColorButton; modal: Tgboolean); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:42:51 ===

function GTK_TYPE_COLOR_BUTTON: TGType;
function GTK_COLOR_BUTTON(obj: Pointer): PGtkColorButton;
function GTK_IS_COLOR_BUTTON(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_COLOR_BUTTON: TGType;
begin
  GTK_TYPE_COLOR_BUTTON := gtk_color_button_get_type;
end;

function GTK_COLOR_BUTTON(obj: Pointer): PGtkColorButton;
begin
  Result := PGtkColorButton(g_type_check_instance_cast(obj, GTK_TYPE_COLOR_BUTTON));
end;

function GTK_IS_COLOR_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_COLOR_BUTTON);
end;



{$ENDIF read_implementation}
