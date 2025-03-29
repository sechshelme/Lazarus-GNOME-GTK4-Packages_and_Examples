unit gtksourcefilesaver;

interface

uses
  fp_glib2, fp_GTK4, gtksourcebuffer, gtksourcefile, gtksourceencoding;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGtkSourceFileSaverError = ^TGtkSourceFileSaverError;
  TGtkSourceFileSaverError = longint;

const
  GTK_SOURCE_FILE_SAVER_ERROR_INVALID_CHARS = 0;
  GTK_SOURCE_FILE_SAVER_ERROR_EXTERNALLY_MODIFIED = 1;

type
  PGtkSourceFileSaverFlags = ^TGtkSourceFileSaverFlags;
  TGtkSourceFileSaverFlags = longint;

const
  GTK_SOURCE_FILE_SAVER_FLAGS_NONE = 0;
  GTK_SOURCE_FILE_SAVER_FLAGS_IGNORE_INVALID_CHARS = 1 shl 0;
  GTK_SOURCE_FILE_SAVER_FLAGS_IGNORE_MODIFICATION_TIME = 1 shl 1;
  GTK_SOURCE_FILE_SAVER_FLAGS_CREATE_BACKUP = 1 shl 2;

  {G_DECLARE_FINAL_TYPE (GtkSourceFileSaver, gtk_source_file_saver, GTK_SOURCE, FILE_SAVER, GObject) }
type
  TGtkSourceFileSaver = record
  end;
  PGtkSourceFileSaver = ^TGtkSourceFileSaver;

  TGtkSourceFileSaverClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceFileSaverClass = ^TGtkSourceFileSaverClass;

function gtk_source_file_saver_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_file_saver_error_quark: TGQuark; cdecl; external libgtksourceview5;
function gtk_source_file_saver_new(buffer: PGtkSourceBuffer; file_: PGtkSourceFile): PGtkSourceFileSaver; cdecl; external libgtksourceview5;
function gtk_source_file_saver_new_with_target(buffer: PGtkSourceBuffer; file_: PGtkSourceFile; target_location: PGFile): PGtkSourceFileSaver; cdecl; external libgtksourceview5;
function gtk_source_file_saver_get_buffer(saver: PGtkSourceFileSaver): PGtkSourceBuffer; cdecl; external libgtksourceview5;
function gtk_source_file_saver_get_file(saver: PGtkSourceFileSaver): PGtkSourceFile; cdecl; external libgtksourceview5;
function gtk_source_file_saver_get_location(saver: PGtkSourceFileSaver): PGFile; cdecl; external libgtksourceview5;
procedure gtk_source_file_saver_set_encoding(saver: PGtkSourceFileSaver; encoding: PGtkSourceEncoding); cdecl; external libgtksourceview5;
function gtk_source_file_saver_get_encoding(saver: PGtkSourceFileSaver): PGtkSourceEncoding; cdecl; external libgtksourceview5;
procedure gtk_source_file_saver_set_newline_type(saver: PGtkSourceFileSaver; newline_type: TGtkSourceNewlineType); cdecl; external libgtksourceview5;
function gtk_source_file_saver_get_newline_type(saver: PGtkSourceFileSaver): TGtkSourceNewlineType; cdecl; external libgtksourceview5;
procedure gtk_source_file_saver_set_compression_type(saver: PGtkSourceFileSaver; compression_type: TGtkSourceCompressionType); cdecl; external libgtksourceview5;
function gtk_source_file_saver_get_compression_type(saver: PGtkSourceFileSaver): TGtkSourceCompressionType; cdecl; external libgtksourceview5;
procedure gtk_source_file_saver_set_flags(saver: PGtkSourceFileSaver; flags: TGtkSourceFileSaverFlags); cdecl; external libgtksourceview5;
function gtk_source_file_saver_get_flags(saver: PGtkSourceFileSaver): TGtkSourceFileSaverFlags; cdecl; external libgtksourceview5;
procedure gtk_source_file_saver_save_async(saver: PGtkSourceFileSaver; io_priority: Tgint; cancellable: PGCancellable; progress_callback: TGFileProgressCallback; progress_callback_data: Tgpointer;
  progress_callback_notify: TGDestroyNotify; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtksourceview5;
function gtk_source_file_saver_save_finish(saver: PGtkSourceFileSaver; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgtksourceview5;

function GTK_SOURCE_FILE_SAVER_ERROR: TGQuark;

// === Konventiert am: 29-3-25 16:47:36 ===

function GTK_SOURCE_TYPE_FILE_SAVER: TGType;
function GTK_SOURCE_FILE_SAVER(obj: Pointer): PGtkSourceFileSaver;
function GTK_SOURCE_IS_FILE_SAVER(obj: Pointer): Tgboolean;

implementation

function GTK_SOURCE_TYPE_FILE_SAVER: TGType;
begin
  Result := gtk_source_file_saver_get_type;
end;

function GTK_SOURCE_FILE_SAVER(obj: Pointer): PGtkSourceFileSaver;
begin
  Result := PGtkSourceFileSaver(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_FILE_SAVER));
end;

function GTK_SOURCE_IS_FILE_SAVER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_FILE_SAVER);
end;


function GTK_SOURCE_FILE_SAVER_ERROR: TGQuark;
begin
  GTK_SOURCE_FILE_SAVER_ERROR := gtk_source_file_saver_error_quark;
end;


end.
