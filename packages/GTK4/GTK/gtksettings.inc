
{$IFDEF read_interface}

  // ausgelagert
//type
//  TGtkSettings = record // _GtkSettings
//  end;
//  PGtkSettings = ^TGtkSettings;


function gtk_settings_get_type: TGType; cdecl; external libgtk4;
function gtk_settings_get_default: PGtkSettings; cdecl; external libgtk4;
function gtk_settings_get_for_display(display: PGdkDisplay): PGtkSettings; cdecl; external libgtk4;
procedure gtk_settings_reset_property(settings: PGtkSettings; Name: PChar); cdecl; external libgtk4;

// === Konventiert am: 28-7-24 15:48:53 ===

function GTK_TYPE_SETTINGS: TGType;
function GTK_SETTINGS(obj: Pointer): PGtkSettings;
function GTK_IS_SETTINGS(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_SETTINGS: TGType;
begin
  GTK_TYPE_SETTINGS := gtk_settings_get_type;
end;

function GTK_SETTINGS(obj: Pointer): PGtkSettings;
begin
  Result := PGtkSettings(g_type_check_instance_cast(obj, GTK_TYPE_SETTINGS));
end;

function GTK_IS_SETTINGS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SETTINGS);
end;



{$ENDIF read_implementation}
