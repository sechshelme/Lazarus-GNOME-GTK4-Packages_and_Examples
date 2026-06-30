unit giotypes;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  //  PGAppLaunchContext = type Pointer;
  PGAppInfo = type Pointer;
  PGAsyncResult = type Pointer;
  PGAsyncInitable = type Pointer;
  //  PGBufferedInputStream = type Pointer;
  //  PGBufferedOutputStream = type Pointer;
  PGCancellable = type Pointer;  // ???
  PGCharsetConverter = type Pointer;
  PGConverter = type Pointer;
  //  PGConverterInputStream = type Pointer;
  //  PGConverterOutputStream = type Pointer;
  PGDatagramBased = type Pointer;
  //  PGDataInputStream = type Pointer;
  PGSimplePermission = type Pointer;
  PGZlibCompressor = type Pointer;
  PGZlibDecompressor = type Pointer;
  PGSimpleActionGroup = type Pointer;
  PGRemoteActionGroup = type Pointer;
  PGDBusActionGroup = type Pointer;
  PGActionMap = type Pointer;
  PGActionGroup = type Pointer;
  PGPropertyAction = type Pointer;
  PGSimpleAction = type Pointer;
  PGAction = type Pointer;
  //  PGApplication = type Pointer;
  //  PGApplicationCommandLine = type Pointer;
  //  PGSettingsBackend = type Pointer;
  //  PGSettings = type Pointer;
  //  PGPermission = type Pointer;
  //  PGMenuModel = type Pointer;
  PGNotification = type Pointer;
  PGDrive = type Pointer;
  //  PGFileEnumerator = type Pointer;
  //  PGFileMonitor = type Pointer;
  //  PGFilterInputStream = type Pointer;
  //  PGFilterOutputStream = type Pointer;
  PGFile = type Pointer;
  PPGFile = ^PGFile;
  PGFileInfo = type Pointer;
  PPGFileInfo = type PGFileInfo;
  PGFileAttributeMatcher = type Pointer;
  //  PGFileAttributeInfo = type Pointer;
  PGFileAttributeInfoList = type Pointer;
  //  PGFileInputStream = type Pointer;
  //  PGFileOutputStream = type Pointer;
  //  PGFileIOStream = type Pointer;
  //  PPGFileIOStream=type PGFileIOStream;
  PGFileIcon = type Pointer;
  PGFilenameCompleter = type Pointer;
  PGIcon = type Pointer;
  //  PGInetAddress = type Pointer;
  //  PGInetAddressMask = type Pointer;
  //  PGInetSocketAddress = type Pointer;
  //  PGNativeSocketAddress = type Pointer;
  //  PGInputStream = type Pointer;
  PGInitable = type Pointer;
  PGIOModule = type Pointer;
  PGIOExtensionPoint = type Pointer;
  PGIOExtension = type Pointer;
  PGIOSchedulerJob = type Pointer;
  PGIOStreamAdapter = type Pointer;
  PGLoadableIcon = type Pointer;
  PGBytesIcon = type Pointer;
  PGMemoryInputStream = type Pointer;
  PGMemoryOutputStream = type Pointer;
  PGMount = type Pointer;
  //  PGMountOperation = type Pointer;
  //  PGNetworkAddress = type Pointer;
  PGNetworkMonitor = type Pointer;
  //  PGNetworkService = type Pointer;
  //  PGOutputStream = type Pointer;
  //  PGIOStream = type Pointer;
  PGSimpleIOStream = type Pointer;
  PGPollableInputStream = type Pointer;
  PGPollableOutputStream = type Pointer;
  //  PGResolver = type Pointer;
  PGResource = type Pointer;
  PGSeekable = type Pointer;
  PGSimpleAsyncResult = type Pointer;
  PGSocket = type Pointer;  // ?????
  PGSocketControlMessage = type Pointer;   // ????
  PPGSocketControlMessage = ^PGSocketControlMessage;  // ????
  PPPGSocketControlMessage = ^PPGSocketControlMessage; // ????
  //  PGSocketClient = type Pointer;
  //  PGSocketConnection = type Pointer;
  //  PGSocketListener = type Pointer;
  //  PGSocketService = type Pointer;
  PGSocketAddress = type Pointer;    // ?????
  PPGSocketAddress = ^PGSocketAddress;
  //  PGSocketAddressEnumerator = type Pointer;
  PGSocketConnectable = type Pointer;
  PGSrvTarget = type Pointer;
  PGTask = type Pointer;
  //  PGTcpConnection = type Pointer;
  //  PGTcpWrapperConnection = type Pointer;
  //  PGThreadedSocketService = type Pointer;
  PGDtlsConnection = type Pointer;
  PGDtlsClientConnection = type Pointer;
  PGDtlsServerConnection = type Pointer;
  PGThemedIcon = type Pointer;
  //  PGTlsCertificate = type Pointer;
  PGTlsClientConnection = type Pointer;
  //  PGTlsConnection = type Pointer;
  PGTlsDatabase = type Pointer;
  PGTlsFileDatabase = type Pointer;
  PGTlsInteraction = type Pointer;   // ?????
  //  PGTlsPassword = type Pointer;
  PGTlsServerConnection = type Pointer;
  //  PGVfs = type Pointer;
  PGProxyResolver = type Pointer;
  PGProxy = type Pointer;
  PGProxyAddress = type Pointer;
  PGProxyAddressEnumerator = type Pointer;
  PGVolume = type Pointer;
  //  PGVolumeMonitor = type Pointer;

  TGAsyncReadyCallback = procedure(source_object: PGObject; res: PGAsyncResult; data: Tgpointer); cdecl;
  TGFileProgressCallback = procedure(current_num_bytes: Tgoffset; total_num_bytes: Tgoffset; data: Tgpointer); cdecl;
  TGFileReadMoreCallback = function(file_contents: pchar; file_size: Tgoffset; callback_data: Tgpointer): Tgboolean; cdecl;
  TGFileMeasureProgressCallback = procedure(reporting: Tgboolean; current_size: Tguint64; num_dirs: Tguint64; num_files: Tguint64; data: Tgpointer); cdecl;
  TGIOSchedulerJobFunc = function(job: PGIOSchedulerJob; cancellable: PGCancellable; data: Tgpointer): Tgboolean; cdecl;
  TGSimpleAsyncThreadFunc = procedure(res: PGSimpleAsyncResult; obj: PGObject; cancellable: PGCancellable); cdecl;
  TGSocketSourceFunc = function(socket: PGSocket; condition: TGIOCondition; data: Tgpointer): Tgboolean; cdecl;
  TGDatagramBasedSourceFunc = function(datagram_based: PGDatagramBased; condition: TGIOCondition; data: Tgpointer): Tgboolean; cdecl;

  PGInputVector = ^TGInputVector;
  TGInputVector = record
    buffer: Tgpointer;
    size: Tgsize;
  end;

  PGInputMessage = ^TGInputMessage;
  TGInputMessage = record
    address: ^PGSocketAddress;
    vectors: PGInputVector;
    num_vectors: Tguint;
    bytes_received: Tgsize;
    flags: Tgint;
    control_messages: ^PPGSocketControlMessage;
    num_control_messages: Pguint;
  end;

  PGOutputVector = ^TGOutputVector;
  TGOutputVector = record
    buffer: Tgconstpointer;
    size: Tgsize;
  end;

  PGOutputMessage = ^TGOutputMessage;
  TGOutputMessage = record
    address: PGSocketAddress;
    vectors: PGOutputVector;
    num_vectors: Tguint;
    bytes_sent: Tguint;
    control_messages: ^PGSocketControlMessage;
    num_control_messages: Tguint;
  end;

  PGCredentials = type Pointer;
  //  PGUnixCredentialsMessage = type Pointer;
  PGUnixFDList = type Pointer;
  PPGUnixFDList = ^PGUnixFDList;
  PGDBusMessage = type Pointer;
  PGDBusConnection = type Pointer;
  PGDBusProxy = type Pointer;
  PGDBusMethodInvocation = type Pointer;
  PGDBusServer = type Pointer;
  PGDBusAuthObserver = type Pointer;
  //  PGDBusErrorEntry = type Pointer;
  //  PGDBusInterfaceVTable = type Pointer;
  //  PGDBusSubtreeVTable = type Pointer;
  //  PGDBusAnnotationInfo = type Pointer;
  //  PGDBusArgInfo = type Pointer;
  //  PGDBusMethodInfo = type Pointer;
  //  PGDBusSignalInfo = type Pointer;
  //  PGDBusPropertyInfo = type Pointer;
  //  PGDBusInterfaceInfo = type Pointer;
  //  PPGDBusInterfaceInfo=^PGDBusInterfaceInfo;
  //  PGDBusNodeInfo = type Pointer;

  TGCancellableSourceFunc = function(cancellable: PGCancellable; data: Tgpointer): Tgboolean; cdecl;
  TGPollableSourceFunc = function(pollable_stream: PGObject; data: Tgpointer): Tgboolean; cdecl;

  PGDBusInterface = type Pointer;
  //  PGDBusInterfaceSkeleton = type Pointer;
  PGDBusObject = type Pointer;
  //  PGDBusObjectSkeleton = type Pointer;
  //  PGDBusObjectProxy = type Pointer;
  PGDBusObjectManager = type Pointer;
  PGDBusObjectManagerClient = type Pointer;  // ????
  //  PGDBusObjectManagerServer = type Pointer;

  TGDBusProxyTypeFunc = function(manager: PGDBusObjectManagerClient; object_path: Pgchar; interface_name: Pgchar; data: Tgpointer): TGType; cdecl;

  PGTestDBus = type Pointer;
  PGSubprocess = type Pointer;
  PGSubprocessLauncher = type Pointer;
  {$ENDIF read_struct}

  // === Konventiert am: 26-6-26 19:35:08 ===


implementation



end.
