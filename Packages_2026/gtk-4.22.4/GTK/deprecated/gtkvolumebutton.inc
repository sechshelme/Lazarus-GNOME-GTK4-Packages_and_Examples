

  {$IFDEF read_struct}
type
  PGtkVolumeButton = ^TGtkVolumeButton;
  TGtkVolumeButton = record
    parent: TGtkScaleButton;
  end;
  {$ENDIF read_struct}

  {$IFDEF read_function}

function gtk_volume_button_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_volume_button_new: PGtkWidget; cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:51:47 ===

function GTK_TYPE_VOLUME_BUTTON: TGType;
function GTK_VOLUME_BUTTON(obj: Pointer): PGtkVolumeButton;
function GTK_IS_VOLUME_BUTTON(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_VOLUME_BUTTON: TGType;
begin
  GTK_TYPE_VOLUME_BUTTON := gtk_volume_button_get_type;
end;

function GTK_VOLUME_BUTTON(obj: Pointer): PGtkVolumeButton;
begin
  Result := PGtkVolumeButton(g_type_check_instance_cast(obj, GTK_TYPE_VOLUME_BUTTON));
end;

function GTK_IS_VOLUME_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_VOLUME_BUTTON);
end;



{$ENDIF read_implementation}
