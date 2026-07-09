

  {$IFDEF read_struct}
type
  PGtkColorDialog = type Pointer;

  TGtkColorDialogClass = record
    parent_class: TGObjectClass;
  end;
  PGtkColorDialogClass = ^TGtkColorDialogClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_color_dialog_get_type: TGType; cdecl; external libgtk4;
function gtk_color_dialog_new: PGtkColorDialog; cdecl; external libgtk4;
function gtk_color_dialog_get_title(self: PGtkColorDialog): pchar; cdecl; external libgtk4;
procedure gtk_color_dialog_set_title(self: PGtkColorDialog; title: pchar); cdecl; external libgtk4;
function gtk_color_dialog_get_modal(self: PGtkColorDialog): Tgboolean; cdecl; external libgtk4;
procedure gtk_color_dialog_set_modal(self: PGtkColorDialog; modal: Tgboolean); cdecl; external libgtk4;
function gtk_color_dialog_get_with_alpha(self: PGtkColorDialog): Tgboolean; cdecl; external libgtk4;
procedure gtk_color_dialog_set_with_alpha(self: PGtkColorDialog; with_alpha: Tgboolean); cdecl; external libgtk4;
procedure gtk_color_dialog_choose_rgba(self: PGtkColorDialog; parent: PGtkWindow; initial_color: PGdkRGBA; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgtk4;
function gtk_color_dialog_choose_rgba_finish(self: PGtkColorDialog; result: PGAsyncResult; error: PPGError): PGdkRGBA; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 14:03:09 ===

function GTK_TYPE_COLOR_DIALOG: TGType;
function GTK_COLOR_DIALOG(obj: Pointer): PGtkColorDialog;
function GTK_IS_COLOR_DIALOG(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_COLOR_DIALOG: TGType;
begin
  Result := gtk_color_dialog_get_type;
end;

function GTK_COLOR_DIALOG(obj: Pointer): PGtkColorDialog;
begin
  Result := PGtkColorDialog(g_type_check_instance_cast(obj, GTK_TYPE_COLOR_DIALOG));
end;

function GTK_IS_COLOR_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_COLOR_DIALOG);
end;

{$ENDIF read_implementation}
