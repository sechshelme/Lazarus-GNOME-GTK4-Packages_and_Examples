unit gtkappchooser;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkAppChooser = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_app_chooser_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_app_chooser_get_app_info(self: PGtkAppChooser): PGAppInfo; cdecl; external libgtk4; deprecated;
function gtk_app_chooser_get_content_type(self: PGtkAppChooser): pchar; cdecl; external libgtk4; deprecated;
procedure gtk_app_chooser_refresh(self: PGtkAppChooser); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:33:27 ===

function GTK_TYPE_APP_CHOOSER: TGType;
function GTK_APP_CHOOSER(obj: Pointer): PGtkAppChooser;
function GTK_IS_APP_CHOOSER(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_APP_CHOOSER: TGType;
begin
  GTK_TYPE_APP_CHOOSER := gtk_app_chooser_get_type;
end;

function GTK_APP_CHOOSER(obj: Pointer): PGtkAppChooser;
begin
  Result := PGtkAppChooser(g_type_check_instance_cast(obj, GTK_TYPE_APP_CHOOSER));
end;

function GTK_IS_APP_CHOOSER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_APP_CHOOSER);
end;



end.
