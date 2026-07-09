
  {$IFDEF read_struct}
type
  PGtkColorDialogButton = type Pointer;

  TGtkColorDialogButtonClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkColorDialogButtonClass = ^TGtkColorDialogButtonClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_color_dialog_button_get_type: TGType; cdecl; external libgtk4;
function gtk_color_dialog_button_new(dialog: PGtkColorDialog): PGtkWidget; cdecl; external libgtk4;
function gtk_color_dialog_button_get_dialog(self: PGtkColorDialogButton): PGtkColorDialog; cdecl; external libgtk4;
procedure gtk_color_dialog_button_set_dialog(self: PGtkColorDialogButton; dialog: PGtkColorDialog); cdecl; external libgtk4;
function gtk_color_dialog_button_get_rgba(self: PGtkColorDialogButton): PGdkRGBA; cdecl; external libgtk4;
procedure gtk_color_dialog_button_set_rgba(self: PGtkColorDialogButton; color: PGdkRGBA); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 14:02:49 ===

function GTK_TYPE_COLOR_DIALOG_BUTTON: TGType;
function GTK_COLOR_DIALOG_BUTTON(obj: Pointer): PGtkColorDialogButton;
function GTK_IS_COLOR_DIALOG_BUTTON(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_COLOR_DIALOG_BUTTON: TGType;
begin
  Result := gtk_color_dialog_button_get_type;
end;

function GTK_COLOR_DIALOG_BUTTON(obj: Pointer): PGtkColorDialogButton;
begin
  Result := PGtkColorDialogButton(g_type_check_instance_cast(obj, GTK_TYPE_COLOR_DIALOG_BUTTON));
end;

function GTK_IS_COLOR_DIALOG_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_COLOR_DIALOG_BUTTON);
end;

{$ENDIF read_implementation}
