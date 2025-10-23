{$IFDEF read_interface}

type
  PGtkSourceFileLoaderError = ^TGtkSourceFileLoaderError;
  TGtkSourceFileLoaderError = longint;

const
  GTK_SOURCE_FILE_LOADER_ERROR_TOO_BIG = 0;
  GTK_SOURCE_FILE_LOADER_ERROR_ENCODING_AUTO_DETECTION_FAILED = 1;
  GTK_SOURCE_FILE_LOADER_ERROR_CONVERSION_FALLBACK = 2;

  {G_DECLARE_FINAL_TYPE (GtkSourceFileLoader, gtk_source_file_loader, GTK_SOURCE, FILE_LOADER, GObject) }

type
  TGtkSourceFileLoader = record
  end;
  PGtkSourceFileLoader = ^TGtkSourceFileLoader;

  TGtkSourceFileLoaderClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceFileLoaderClass = ^TGtkSourceFileLoaderClass;

function gtk_source_file_loader_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_file_loader_error_quark: TGQuark; cdecl; external libgtksourceview5;
function gtk_source_file_loader_new(buffer: PGtkSourceBuffer; file_: PGtkSourceFile): PGtkSourceFileLoader; cdecl; external libgtksourceview5;
function gtk_source_file_loader_new_from_stream(buffer: PGtkSourceBuffer; file_: PGtkSourceFile; stream: PGInputStream): PGtkSourceFileLoader; cdecl; external libgtksourceview5;
procedure gtk_source_file_loader_set_candidate_encodings(loader: PGtkSourceFileLoader; candidate_encodings: PGSList); cdecl; external libgtksourceview5;
function gtk_source_file_loader_get_buffer(loader: PGtkSourceFileLoader): PGtkSourceBuffer; cdecl; external libgtksourceview5;
function gtk_source_file_loader_get_file(loader: PGtkSourceFileLoader): PGtkSourceFile; cdecl; external libgtksourceview5;
function gtk_source_file_loader_get_location(loader: PGtkSourceFileLoader): PGFile; cdecl; external libgtksourceview5;
function gtk_source_file_loader_get_input_stream(loader: PGtkSourceFileLoader): PGInputStream; cdecl; external libgtksourceview5;
procedure gtk_source_file_loader_load_async(loader: PGtkSourceFileLoader; io_priority: Tgint; cancellable: PGCancellable; progress_callback: TGFileProgressCallback; progress_callback_data: Tgpointer;
  progress_callback_notify: TGDestroyNotify; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtksourceview5;
function gtk_source_file_loader_load_finish(loader: PGtkSourceFileLoader; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_file_loader_get_encoding(loader: PGtkSourceFileLoader): PGtkSourceEncoding; cdecl; external libgtksourceview5;
function gtk_source_file_loader_get_newline_type(loader: PGtkSourceFileLoader): TGtkSourceNewlineType; cdecl; external libgtksourceview5;
function gtk_source_file_loader_get_compression_type(loader: PGtkSourceFileLoader): TGtkSourceCompressionType; cdecl; external libgtksourceview5;

function GTK_SOURCE_FILE_LOADER_ERROR: TGQuark;

// === Konventiert am: 29-3-25 16:47:33 ===

function GTK_SOURCE_TYPE_FILE_LOADER: TGType;
function GTK_SOURCE_FILE_LOADER(obj: Pointer): PGtkSourceFileLoader;
function GTK_SOURCE_IS_FILE_LOADER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_FILE_LOADER: TGType;
begin
  Result := gtk_source_file_loader_get_type;
end;

function GTK_SOURCE_FILE_LOADER(obj: Pointer): PGtkSourceFileLoader;
begin
  Result := PGtkSourceFileLoader(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_FILE_LOADER));
end;

function GTK_SOURCE_IS_FILE_LOADER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_FILE_LOADER);
end;

function GTK_SOURCE_FILE_LOADER_ERROR: TGQuark;
begin
  GTK_SOURCE_FILE_LOADER_ERROR := gtk_source_file_loader_error_quark;
end;


{$ENDIF read_implementation}
