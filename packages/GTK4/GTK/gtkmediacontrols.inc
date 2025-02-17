
{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkMediaControls, gtk_media_controls, GTK, MEDIA_CONTROLS, GtkWidget) }
type
  TGtkMediaControls = record
  end;
  PGtkMediaControls = ^TGtkMediaControls;

  TGtkMediaControlsClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkMediaControlsClass = ^TGtkMediaControlsClass;

function gtk_media_controls_get_type: TGType; cdecl; external libgtk4;
function gtk_media_controls_new(stream: PGtkMediaStream): PGtkWidget; cdecl; external libgtk4;
function gtk_media_controls_get_media_stream(Controls: PGtkMediaControls): PGtkMediaStream; cdecl; external libgtk4;
procedure gtk_media_controls_set_media_stream(Controls: PGtkMediaControls; stream: PGtkMediaStream); cdecl; external libgtk4;

// === Konventiert am: 28-7-24 13:37:03 ===

function GTK_TYPE_MEDIA_CONTROLS: TGType;
function GTK_MEDIA_CONTROLS(obj: Pointer): PGtkMediaControls;
function GTK_IS_MEDIA_CONTROLS(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

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




{$ENDIF read_implementation}
