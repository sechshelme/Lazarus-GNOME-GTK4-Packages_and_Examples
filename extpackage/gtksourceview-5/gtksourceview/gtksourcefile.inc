{$IFDEF read_interface}

type
  PGtkSourceNewlineType = ^TGtkSourceNewlineType;
  TGtkSourceNewlineType = longint;

const
  GTK_SOURCE_NEWLINE_TYPE_LF = 0;
  GTK_SOURCE_NEWLINE_TYPE_CR = 1;
  GTK_SOURCE_NEWLINE_TYPE_CR_LF = 2;

const
  {$ifdef mswindow}
  GTK_SOURCE_NEWLINE_TYPE_DEFAULT = GTK_SOURCE_NEWLINE_TYPE_CR_LF;
  {$else}
  GTK_SOURCE_NEWLINE_TYPE_DEFAULT = GTK_SOURCE_NEWLINE_TYPE_LF;
  {$endif}

type
  PGtkSourceCompressionType = ^TGtkSourceCompressionType;
  TGtkSourceCompressionType = longint;

const
  GTK_SOURCE_COMPRESSION_TYPE_NONE = 0;
  GTK_SOURCE_COMPRESSION_TYPE_GZIP = 1;

  {G_DECLARE_DERIVABLE_TYPE (GtkSourceFile, gtk_source_file, GTK_SOURCE, FILE, GObject) }
type
  TGtkSourceFile = record
    parent_instance: TGObject;
  end;
  PGtkSourceFile = ^TGtkSourceFile;

  PGtkSourceMountOperationFactory = ^TGtkSourceMountOperationFactory;
  TGtkSourceMountOperationFactory = function(file_: PGtkSourceFile; userdata: Tgpointer): PGMountOperation; cdecl;

  TGtkSourceFileClass = record
    parent_class: TGObjectClass;
    _reserved: array[0..9] of Tgpointer;
  end;
  PGtkSourceFileClass = ^TGtkSourceFileClass;

function gtk_source_file_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_file_new: PGtkSourceFile; cdecl; external libgtksourceview5;
function gtk_source_file_get_location(file_: PGtkSourceFile): PGFile; cdecl; external libgtksourceview5;
procedure gtk_source_file_set_location(file_: PGtkSourceFile; location: PGFile); cdecl; external libgtksourceview5;
function gtk_source_file_get_encoding(file_: PGtkSourceFile): PGtkSourceEncoding; cdecl; external libgtksourceview5;
function gtk_source_file_get_newline_type(file_: PGtkSourceFile): TGtkSourceNewlineType; cdecl; external libgtksourceview5;
function gtk_source_file_get_compression_type(file_: PGtkSourceFile): TGtkSourceCompressionType; cdecl; external libgtksourceview5;
procedure gtk_source_file_set_mount_operation_factory(file_: PGtkSourceFile; callback: TGtkSourceMountOperationFactory; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgtksourceview5;
procedure gtk_source_file_check_file_on_disk(file_: PGtkSourceFile); cdecl; external libgtksourceview5;
function gtk_source_file_is_local(file_: PGtkSourceFile): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_file_is_externally_modified(file_: PGtkSourceFile): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_file_is_deleted(file_: PGtkSourceFile): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_file_is_readonly(file_: PGtkSourceFile): Tgboolean; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 16:58:17 ===

function GTK_SOURCE_TYPE_FILE: TGType;
function GTK_SOURCE_FILE(obj: Pointer): PGtkSourceFile;
function GTK_SOURCE_IS_FILE(obj: Pointer): Tgboolean;
function GTK_SOURCE_FILE_CLASS(klass: Pointer): PGtkSourceFileClass;
function GTK_SOURCE_IS_FILE_CLASS(klass: Pointer): Tgboolean;
function GTK_SOURCE_FILE_GET_CLASS(obj: Pointer): PGtkSourceFileClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_FILE: TGType;
begin
  Result := gtk_source_file_get_type;
end;

function GTK_SOURCE_FILE(obj: Pointer): PGtkSourceFile;
begin
  Result := PGtkSourceFile(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_FILE));
end;

function GTK_SOURCE_IS_FILE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_FILE);
end;

function GTK_SOURCE_FILE_CLASS(klass: Pointer): PGtkSourceFileClass;
begin
  Result := PGtkSourceFileClass(g_type_check_class_cast(klass, GTK_SOURCE_TYPE_FILE));
end;

function GTK_SOURCE_IS_FILE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_SOURCE_TYPE_FILE);
end;

function GTK_SOURCE_FILE_GET_CLASS(obj: Pointer): PGtkSourceFileClass;
begin
  Result := PGtkSourceFileClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
