

  {$IFDEF read_struct}
type
  PGtkVideo = type Pointer;

  TGtkVideoClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkVideoClass = ^TGtkVideoClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_video_get_type: TGType; cdecl; external libgtk4;
function gtk_video_new: PGtkWidget; cdecl; external libgtk4;
function gtk_video_new_for_media_stream(stream: PGtkMediaStream): PGtkWidget; cdecl; external libgtk4;
function gtk_video_new_for_file(file_: PGFile): PGtkWidget; cdecl; external libgtk4;
function gtk_video_new_for_filename(filename: pchar): PGtkWidget; cdecl; external libgtk4;
function gtk_video_new_for_resource(resource_path: pchar): PGtkWidget; cdecl; external libgtk4;
function gtk_video_get_media_stream(self: PGtkVideo): PGtkMediaStream; cdecl; external libgtk4;
procedure gtk_video_set_media_stream(self: PGtkVideo; stream: PGtkMediaStream); cdecl; external libgtk4;
function gtk_video_get_file(self: PGtkVideo): PGFile; cdecl; external libgtk4;
procedure gtk_video_set_file(self: PGtkVideo; file_: PGFile); cdecl; external libgtk4;
procedure gtk_video_set_filename(self: PGtkVideo; filename: pchar); cdecl; external libgtk4;
procedure gtk_video_set_resource(self: PGtkVideo; resource_path: pchar); cdecl; external libgtk4;
function gtk_video_get_autoplay(self: PGtkVideo): Tgboolean; cdecl; external libgtk4;
procedure gtk_video_set_autoplay(self: PGtkVideo; autoplay: Tgboolean); cdecl; external libgtk4;
function gtk_video_get_loop(self: PGtkVideo): Tgboolean; cdecl; external libgtk4;
procedure gtk_video_set_loop(self: PGtkVideo; loop: Tgboolean); cdecl; external libgtk4;
function gtk_video_get_graphics_offload(self: PGtkVideo): TGtkGraphicsOffloadEnabled; cdecl; external libgtk4;
procedure gtk_video_set_graphics_offload(self: PGtkVideo; enabled: TGtkGraphicsOffloadEnabled); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:32:55 ===

function GTK_TYPE_VIDEO: TGType;
function GTK_VIDEO(obj: Pointer): PGtkVideo;
function GTK_IS_VIDEO(obj: Pointer): Tgboolean;
{$ENDIF read_struct}


{$IFDEF read_implementation}

function GTK_TYPE_VIDEO: TGType;
begin
  Result := gtk_video_get_type;
end;

function GTK_VIDEO(obj: Pointer): PGtkVideo;
begin
  Result := PGtkVideo(g_type_check_instance_cast(obj, GTK_TYPE_VIDEO));
end;

function GTK_IS_VIDEO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_VIDEO);
end;

{$ENDIF read_implementation}
