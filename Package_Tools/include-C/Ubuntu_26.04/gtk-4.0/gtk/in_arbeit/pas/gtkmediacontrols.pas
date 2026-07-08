unit gtkmediacontrols;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget, gtkmediastream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkMediaControls = type Pointer;

  TGtkMediaControlsClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkMediaControlsClass = ^TGtkMediaControlsClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_media_controls_get_type: TGType; cdecl; external libgtk4;
function gtk_media_controls_new(stream: PGtkMediaStream): PGtkWidget; cdecl; external libgtk4;
function gtk_media_controls_get_media_stream(controls: PGtkMediaControls): PGtkMediaStream; cdecl; external libgtk4;
procedure gtk_media_controls_set_media_stream(controls: PGtkMediaControls; stream: PGtkMediaStream); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:14:36 ===

function GTK_TYPE_MEDIA_CONTROLS: TGType;
function GTK_MEDIA_CONTROLS(obj: Pointer): PGtkMediaControls;
function GTK_IS_MEDIA_CONTROLS(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_MEDIA_CONTROLS: TGType;
begin
  Result := gtk_media_controls_get_type;
end;

function GTK_MEDIA_CONTROLS(obj: Pointer): PGtkMediaControls;
begin
  Result := PGtkMediaControls(g_type_check_instance_cast(obj, GTK_TYPE_MEDIA_CONTROLS));
end;

function GTK_IS_MEDIA_CONTROLS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MEDIA_CONTROLS);
end;

end.
