unit gtksettings;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGtkSettings = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_settings_get_type: TGType; cdecl; external libgtk4;
function gtk_settings_get_default: PGtkSettings; cdecl; external libgtk4;
function gtk_settings_get_for_display(display: PGdkDisplay): PGtkSettings; cdecl; external libgtk4;
procedure gtk_settings_reset_property(settings: PGtkSettings; name: pchar); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:14:11 ===

function GTK_TYPE_SETTINGS: TGType;
function GTK_SETTINGS(obj: Pointer): PGtkSettings;
function GTK_IS_SETTINGS(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

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

end.
