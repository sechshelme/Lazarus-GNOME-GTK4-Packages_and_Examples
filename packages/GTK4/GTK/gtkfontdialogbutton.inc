
{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkFontDialogButton, gtk_font_dialog_button, GTK, FONT_DIALOG_BUTTON, GtkWidget) }
type
  TGtkFontDialogButton = record
  end;
  PGtkFontDialogButton = ^TGtkFontDialogButton;

  TGtkFontDialogButtonClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkFontDialogButtonClass = ^TGtkFontDialogButtonClass;

function gtk_font_dialog_button_get_type: TGType; cdecl; external libgtk4;
function gtk_font_dialog_button_new(dialog: PGtkFontDialog): PGtkWidget; cdecl; external libgtk4;
function gtk_font_dialog_button_get_dialog(self: PGtkFontDialogButton): PGtkFontDialog; cdecl; external libgtk4;
procedure gtk_font_dialog_button_set_dialog(self: PGtkFontDialogButton; dialog: PGtkFontDialog); cdecl; external libgtk4;

type
  PGtkFontLevel = ^TGtkFontLevel;
  TGtkFontLevel = longint;

const
  GTK_FONT_LEVEL_FAMILY = 0;
  GTK_FONT_LEVEL_FACE = 1;
  GTK_FONT_LEVEL_FONT = 2;
  GTK_FONT_LEVEL_FEATURES = 3;

function gtk_font_dialog_button_get_level(self: PGtkFontDialogButton): TGtkFontLevel; cdecl; external libgtk4;
procedure gtk_font_dialog_button_set_level(self: PGtkFontDialogButton; level: TGtkFontLevel); cdecl; external libgtk4;
function gtk_font_dialog_button_get_font_desc(self: PGtkFontDialogButton): PPangoFontDescription; cdecl; external libgtk4;
procedure gtk_font_dialog_button_set_font_desc(self: PGtkFontDialogButton; font_desc: PPangoFontDescription); cdecl; external libgtk4;
function gtk_font_dialog_button_get_font_features(self: PGtkFontDialogButton): PChar; cdecl; external libgtk4;
procedure gtk_font_dialog_button_set_font_features(self: PGtkFontDialogButton; font_features: PChar); cdecl; external libgtk4;
function gtk_font_dialog_button_get_language(self: PGtkFontDialogButton): PPangoLanguage; cdecl; external libgtk4;
procedure gtk_font_dialog_button_set_language(self: PGtkFontDialogButton; language: PPangoLanguage); cdecl; external libgtk4;
function gtk_font_dialog_button_get_use_font(self: PGtkFontDialogButton): Tgboolean; cdecl; external libgtk4;
procedure gtk_font_dialog_button_set_use_font(self: PGtkFontDialogButton; use_font: Tgboolean); cdecl; external libgtk4;
function gtk_font_dialog_button_get_use_size(self: PGtkFontDialogButton): Tgboolean; cdecl; external libgtk4;
procedure gtk_font_dialog_button_set_use_size(self: PGtkFontDialogButton; use_size: Tgboolean); cdecl; external libgtk4;

// === Konventiert am: 27-7-24 15:31:46 ===

function GTK_TYPE_FONT_DIALOG_BUTTON: TGType;
function GTK_FONT_DIALOG_BUTTON(obj: Pointer): PGtkFontDialogButton;
function GTK_IS_FONT_DIALOG_BUTTON(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_FONT_DIALOG_BUTTON: TGType;
begin
  Result := gtk_font_dialog_button_get_type;
end;

function GTK_FONT_DIALOG_BUTTON(obj: Pointer): PGtkFontDialogButton;
begin
  Result := PGtkFontDialogButton(g_type_check_instance_cast(obj, GTK_TYPE_FONT_DIALOG_BUTTON));
end;

function GTK_IS_FONT_DIALOG_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FONT_DIALOG_BUTTON);
end;




{$ENDIF read_implementation}
