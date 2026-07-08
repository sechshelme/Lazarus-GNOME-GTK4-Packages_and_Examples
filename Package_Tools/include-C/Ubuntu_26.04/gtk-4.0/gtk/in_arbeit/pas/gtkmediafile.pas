unit gtkmediafile;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkmediastream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  GTK_MEDIA_FILE_EXTENSION_POINT_NAME = 'gtk-media-file';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TGtkMediaFile = record
    parent_instance: TGtkMediaStream;
  end;
  PGtkMediaFile = ^TGtkMediaFile;

  PGtkMediaFileClass = ^TGtkMediaFileClass;
  TGtkMediaFileClass = record
    parent_class: TGtkMediaStreamClass;
    open: procedure(self: PGtkMediaFile); cdecl;
    close: procedure(self: PGtkMediaFile); cdecl;
    _gtk_reserved1: procedure; cdecl;
    _gtk_reserved2: procedure; cdecl;
    _gtk_reserved3: procedure; cdecl;
    _gtk_reserved4: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_media_file_get_type: TGType; cdecl; external libgtk4;
function gtk_media_file_new: PGtkMediaStream; cdecl; external libgtk4;
function gtk_media_file_new_for_filename(filename: pchar): PGtkMediaStream; cdecl; external libgtk4;
function gtk_media_file_new_for_resource(resource_path: pchar): PGtkMediaStream; cdecl; external libgtk4;
function gtk_media_file_new_for_file(file_: PGFile): PGtkMediaStream; cdecl; external libgtk4;
function gtk_media_file_new_for_input_stream(stream: PGInputStream): PGtkMediaStream; cdecl; external libgtk4;
procedure gtk_media_file_clear(self: PGtkMediaFile); cdecl; external libgtk4;
procedure gtk_media_file_set_filename(self: PGtkMediaFile; filename: pchar); cdecl; external libgtk4;
procedure gtk_media_file_set_resource(self: PGtkMediaFile; resource_path: pchar); cdecl; external libgtk4;
procedure gtk_media_file_set_file(self: PGtkMediaFile; file_: PGFile); cdecl; external libgtk4;
function gtk_media_file_get_file(self: PGtkMediaFile): PGFile; cdecl; external libgtk4;
procedure gtk_media_file_set_input_stream(self: PGtkMediaFile; stream: PGInputStream); cdecl; external libgtk4;
function gtk_media_file_get_input_stream(self: PGtkMediaFile): PGInputStream; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:37:03 ===

function GTK_TYPE_MEDIA_FILE: TGType;
function GTK_MEDIA_FILE(obj: Pointer): PGtkMediaFile;
function GTK_IS_MEDIA_FILE(obj: Pointer): Tgboolean;
function GTK_MEDIA_FILE_CLASS(klass: Pointer): PGtkMediaFileClass;
function GTK_IS_MEDIA_FILE_CLASS(klass: Pointer): Tgboolean;
function GTK_MEDIA_FILE_GET_CLASS(obj: Pointer): PGtkMediaFileClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_MEDIA_FILE: TGType;
begin
  Result := gtk_media_file_get_type;
end;

function GTK_MEDIA_FILE(obj: Pointer): PGtkMediaFile;
begin
  Result := PGtkMediaFile(g_type_check_instance_cast(obj, GTK_TYPE_MEDIA_FILE));
end;

function GTK_IS_MEDIA_FILE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MEDIA_FILE);
end;

function GTK_MEDIA_FILE_CLASS(klass: Pointer): PGtkMediaFileClass;
begin
  Result := PGtkMediaFileClass(g_type_check_class_cast(klass, GTK_TYPE_MEDIA_FILE));
end;

function GTK_IS_MEDIA_FILE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_MEDIA_FILE);
end;

function GTK_MEDIA_FILE_GET_CLASS(obj: Pointer): PGtkMediaFileClass;
begin
  Result := PGtkMediaFileClass(PGTypeInstance(obj)^.g_class);
end;

end.
