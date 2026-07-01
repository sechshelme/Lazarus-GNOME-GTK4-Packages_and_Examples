

{$IFDEF read_struct}
type
  PGAppInfo = type Pointer;
  PGAsyncResult = type Pointer;
  PGAsyncInitable = type Pointer;
  PGCharsetConverter = type Pointer;
  PGConverter = type Pointer;
  PGDatagramBased = type Pointer;
  PGSimplePermission = type Pointer;
  PGZlibCompressor = type Pointer;
  PGZlibDecompressor = type Pointer;
  PGRemoteActionGroup = type Pointer;
  PGDBusActionGroup = type Pointer;
  PGActionMap = type Pointer;
  PGActionGroup = type Pointer;
  PGPropertyAction = type Pointer;
  PGSimpleAction = type Pointer;
  PGAction = type Pointer;
  PGNotification = type Pointer;
  PGDrive = type Pointer;
  PGFile = type Pointer;
  PPGFile = ^PGFile;
  PGFileInfo = type Pointer;
  PPGFileInfo = type PGFileInfo;
  PGFileAttributeMatcher = type Pointer;
  PGFileIcon = type Pointer;
  PGFilenameCompleter = type Pointer;
  PGIcon = type Pointer;
  PGInitable = type Pointer;
  PGIOModule = type Pointer;
  PGIOExtensionPoint = type Pointer;
  PGIOExtension = type Pointer;
  PGIOSchedulerJob = type Pointer;
  PGIOStreamAdapter = type Pointer;
  PGLoadableIcon = type Pointer;
  PGBytesIcon = type Pointer;
  PGMount = type Pointer;
  PGNetworkMonitor = type Pointer;
  PGSimpleIOStream = type Pointer;
  PGPollableInputStream = type Pointer;
  PGPollableOutputStream = type Pointer;
  PGResource = type Pointer;
  PGSeekable = type Pointer;
  PGSimpleAsyncResult = type Pointer;
  PGSocketConnectable = type Pointer;
  PGSrvTarget = type Pointer;
  PGTask = type Pointer;
  PGDtlsConnection = type Pointer;
  PGDtlsClientConnection = type Pointer;
  PGDtlsServerConnection = type Pointer;
  PGThemedIcon = type Pointer;
  PGTlsClientConnection = type Pointer;
  PGTlsFileDatabase = type Pointer;
  PGTlsServerConnection = type Pointer;
  PGProxyResolver = type Pointer;
  PGProxy = type Pointer;
  PGVolume = type Pointer;
  PGCredentials = type Pointer;
  PGDBusMessage = type Pointer;
  PGDBusConnection = type Pointer;
  PGDBusMethodInvocation = type Pointer;
  PGDBusServer = type Pointer;
  PGDBusAuthObserver = type Pointer;
  PGDBusInterface = type Pointer;
  PGDBusObject = type Pointer;
  PGDBusObjectManager = type Pointer;
  PGTestDBus = type Pointer;
  PGSubprocess = type Pointer;
  PGSubprocessLauncher = type Pointer;

  TGAsyncReadyCallback = procedure(source_object: PGObject; res: PGAsyncResult; data: Tgpointer); cdecl;
  TGFileProgressCallback = procedure(current_num_bytes: Tgoffset; total_num_bytes: Tgoffset; data: Tgpointer); cdecl;
  TGFileReadMoreCallback = function(file_contents: pchar; file_size: Tgoffset; callback_data: Tgpointer): Tgboolean; cdecl;
  TGFileMeasureProgressCallback = procedure(reporting: Tgboolean; current_size: Tguint64; num_dirs: Tguint64; num_files: Tguint64; data: Tgpointer); cdecl;
  TGIOSchedulerJobFunc = function(job: PGIOSchedulerJob; cancellable: Pointer {PGCancellable}; data: Tgpointer): Tgboolean; cdecl;
  TGSimpleAsyncThreadFunc = procedure(res: PGSimpleAsyncResult; obj: PGObject; cancellable: Pointer {PGCancellable}); cdecl;
  TGSocketSourceFunc = function(socket: Pointer {PGSocket}; condition: TGIOCondition; data: Tgpointer): Tgboolean; cdecl;
  TGDatagramBasedSourceFunc = function(datagram_based: PGDatagramBased; condition: TGIOCondition; data: Tgpointer): Tgboolean; cdecl;

  PGInputVector = ^TGInputVector;
  TGInputVector = record
    buffer: Tgpointer;
    size: Tgsize;
  end;

  PGInputMessage = ^TGInputMessage;
  TGInputMessage = record
    address: PPointer; // ^PGSocketAddress;
    vectors: PGInputVector;
    num_vectors: Tguint;
    bytes_received: Tgsize;
    flags: Tgint;
    control_messages: PPPointer; // ^PPGSocketControlMessage;
    num_control_messages: Pguint;
  end;

  PGOutputVector = ^TGOutputVector;
  TGOutputVector = record
    buffer: Tgconstpointer;
    size: Tgsize;
  end;

  PGOutputMessage = ^TGOutputMessage;
  TGOutputMessage = record
    address: Pointer; // PGSocketAddress;
    vectors: PGOutputVector;
    num_vectors: Tguint;
    bytes_sent: Tguint;
    control_messages: PPointer; // ^PGSocketControlMessage;
    num_control_messages: Tguint;
  end;

  TGCancellableSourceFunc = function(cancellable: Pointer {PGCancellable}; data: Tgpointer): Tgboolean; cdecl;
  TGPollableSourceFunc = function(pollable_stream: PGObject; data: Tgpointer): Tgboolean; cdecl;
  TGDBusProxyTypeFunc = function(manager: Pointer {PGDBusObjectManagerClient}; object_path: Pgchar; interface_name: Pgchar; data: Tgpointer): TGType; cdecl;

  {$ENDIF read_struct}

  // === Konventiert am: 26-6-26 19:35:08 ===



  {$IFDEF read_implementation}



  {$ENDIF read_implementation}
