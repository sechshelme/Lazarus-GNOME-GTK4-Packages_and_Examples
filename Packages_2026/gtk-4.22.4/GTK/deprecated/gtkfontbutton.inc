

  {$IFDEF read_struct}
type
  PGtkFontButton = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_font_button_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_font_button_new: PGtkWidget; cdecl; external libgtk4; deprecated;
function gtk_font_button_new_with_font(fontname: pchar): PGtkWidget; cdecl; external libgtk4; deprecated;
function gtk_font_button_get_title(font_button: PGtkFontButton): pchar; cdecl; external libgtk4; deprecated;
procedure gtk_font_button_set_title(font_button: PGtkFontButton; title: pchar); cdecl; external libgtk4; deprecated;
function gtk_font_button_get_modal(font_button: PGtkFontButton): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_font_button_set_modal(font_button: PGtkFontButton; modal: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_font_button_get_use_font(font_button: PGtkFontButton): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_font_button_set_use_font(font_button: PGtkFontButton; use_font: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_font_button_get_use_size(font_button: PGtkFontButton): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_font_button_set_use_size(font_button: PGtkFontButton; use_size: Tgboolean); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:45:32 ===

function GTK_TYPE_FONT_BUTTON: TGType;
function GTK_FONT_BUTTON(obj: Pointer): PGtkFontButton;
function GTK_IS_FONT_BUTTON(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_FONT_BUTTON: TGType;
begin
  GTK_TYPE_FONT_BUTTON := gtk_font_button_get_type;
end;

function GTK_FONT_BUTTON(obj: Pointer): PGtkFontButton;
begin
  Result := PGtkFontButton(g_type_check_instance_cast(obj, GTK_TYPE_FONT_BUTTON));
end;

function GTK_IS_FONT_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FONT_BUTTON);
end;



{$ENDIF read_implementation}
