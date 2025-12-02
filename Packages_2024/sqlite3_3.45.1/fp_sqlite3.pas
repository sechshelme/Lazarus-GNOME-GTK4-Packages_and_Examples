unit fp_sqlite3;

interface

const
  {$IFDEF Linux}
  libsqlite = 'sqlite3';
  {$ENDIF}

  {$IFDEF Windows}
  libsqlite = 'libsqlite3-0.dll';
  {$ENDIF}

type
  {$IFDEF Linux}
  Tlong = int64;
  Tulong = uint64;
  {$ENDIF}

  {$IFDEF Windows}
  Tlong = int32;
  Tulong = uint32;
  {$ENDIF}
  Pulong = ^Tulong;
  Plong = ^Tlong;

  Tproc = procedure;

  Tva_list = Pointer; // ????

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  SQLITE_VERSION = '3.45.1';
  SQLITE_VERSION_NUMBER = 3045001;
  SQLITE_SOURCE_ID = '2024-01-30 16:01:20 e876e51a0ed5c5b3126f52e532044363a014bc594cfefa87ffb5b82257ccalt1';

var
  sqlite3_version: pchar; cvar;external libsqlite;

function sqlite3_libversion: pchar; cdecl; external libsqlite;
function sqlite3_sourceid: pchar; cdecl; external libsqlite;
function sqlite3_libversion_number: longint; cdecl; external libsqlite;

function sqlite3_compileoption_used(zOptName: pchar): longint; cdecl; external libsqlite;
function sqlite3_compileoption_get(N: longint): pchar; cdecl; external libsqlite;

function sqlite3_threadsafe: longint; cdecl; external libsqlite;

type
  Psqlite3 = type Pointer;
  PPsqlite3 = ^Psqlite3;

  Psqlite_int64 = ^Tsqlite_int64;
  Tsqlite_int64 = int64;

  Psqlite_uint64 = ^Tsqlite_uint64;
  Tsqlite_uint64 = uint64;

  Psqlite3_int64 = ^Tsqlite3_int64;
  Tsqlite3_int64 = Tsqlite_int64;

  Psqlite3_uint64 = ^Tsqlite3_uint64;
  Tsqlite3_uint64 = Tsqlite_uint64;

function sqlite3_close(para1: Psqlite3): longint; cdecl; external libsqlite;
function sqlite3_close_v2(para1: Psqlite3): longint; cdecl; external libsqlite;

type
  Tsqlite3_callback = function(para1: pointer; para2: longint; para3: PPchar; para4: PPchar): longint; cdecl;

function sqlite3_exec(para1: Psqlite3; sql: pchar; callback: Tsqlite3_callback; para4: pointer; errmsg: PPchar): longint; cdecl; external libsqlite;

const
  SQLITE_OK = 0;
  SQLITE_ERROR = 1;
  SQLITE_INTERNAL = 2;
  SQLITE_PERM = 3;
  SQLITE_ABORT = 4;
  SQLITE_BUSY = 5;
  SQLITE_LOCKED = 6;
  SQLITE_NOMEM = 7;
  SQLITE_READONLY = 8;
  SQLITE_INTERRUPT = 9;
  SQLITE_IOERR = 10;
  SQLITE_CORRUPT = 11;
  SQLITE_NOTFOUND = 12;
  SQLITE_FULL = 13;
  SQLITE_CANTOPEN = 14;
  SQLITE_PROTOCOL = 15;
  SQLITE_EMPTY = 16;
  SQLITE_SCHEMA = 17;
  SQLITE_TOOBIG = 18;
  SQLITE_CONSTRAINT = 19;
  SQLITE_MISMATCH = 20;
  SQLITE_MISUSE = 21;
  SQLITE_NOLFS = 22;
  SQLITE_AUTH = 23;
  SQLITE_FORMAT = 24;
  SQLITE_RANGE = 25;
  SQLITE_NOTADB = 26;
  SQLITE_NOTICE = 27;
  SQLITE_WARNING = 28;
  SQLITE_ROW = 100;
  SQLITE_DONE = 101;

  SQLITE_ERROR_MISSING_COLLSEQ = SQLITE_ERROR or (1 shl 8);
  SQLITE_ERROR_RETRY = SQLITE_ERROR or (2 shl 8);
  SQLITE_ERROR_SNAPSHOT = SQLITE_ERROR or (3 shl 8);
  SQLITE_IOERR_READ = SQLITE_IOERR or (1 shl 8);
  SQLITE_IOERR_SHORT_READ = SQLITE_IOERR or (2 shl 8);
  SQLITE_IOERR_WRITE = SQLITE_IOERR or (3 shl 8);
  SQLITE_IOERR_FSYNC = SQLITE_IOERR or (4 shl 8);
  SQLITE_IOERR_DIR_FSYNC = SQLITE_IOERR or (5 shl 8);
  SQLITE_IOERR_TRUNCATE = SQLITE_IOERR or (6 shl 8);
  SQLITE_IOERR_FSTAT = SQLITE_IOERR or (7 shl 8);
  SQLITE_IOERR_UNLOCK = SQLITE_IOERR or (8 shl 8);
  SQLITE_IOERR_RDLOCK = SQLITE_IOERR or (9 shl 8);
  SQLITE_IOERR_DELETE = SQLITE_IOERR or (10 shl 8);
  SQLITE_IOERR_BLOCKED = SQLITE_IOERR or (11 shl 8);
  SQLITE_IOERR_NOMEM = SQLITE_IOERR or (12 shl 8);
  SQLITE_IOERR_ACCESS = SQLITE_IOERR or (13 shl 8);
  SQLITE_IOERR_CHECKRESERVEDLOCK = SQLITE_IOERR or (14 shl 8);
  SQLITE_IOERR_LOCK = SQLITE_IOERR or (15 shl 8);
  SQLITE_IOERR_CLOSE = SQLITE_IOERR or (16 shl 8);
  SQLITE_IOERR_DIR_CLOSE = SQLITE_IOERR or (17 shl 8);
  SQLITE_IOERR_SHMOPEN = SQLITE_IOERR or (18 shl 8);
  SQLITE_IOERR_SHMSIZE = SQLITE_IOERR or (19 shl 8);
  SQLITE_IOERR_SHMLOCK = SQLITE_IOERR or (20 shl 8);
  SQLITE_IOERR_SHMMAP = SQLITE_IOERR or (21 shl 8);
  SQLITE_IOERR_SEEK = SQLITE_IOERR or (22 shl 8);
  SQLITE_IOERR_DELETE_NOENT = SQLITE_IOERR or (23 shl 8);
  SQLITE_IOERR_MMAP = SQLITE_IOERR or (24 shl 8);
  SQLITE_IOERR_GETTEMPPATH = SQLITE_IOERR or (25 shl 8);
  SQLITE_IOERR_CONVPATH = SQLITE_IOERR or (26 shl 8);
  SQLITE_IOERR_VNODE = SQLITE_IOERR or (27 shl 8);
  SQLITE_IOERR_AUTH = SQLITE_IOERR or (28 shl 8);
  SQLITE_IOERR_BEGIN_ATOMIC = SQLITE_IOERR or (29 shl 8);
  SQLITE_IOERR_COMMIT_ATOMIC = SQLITE_IOERR or (30 shl 8);
  SQLITE_IOERR_ROLLBACK_ATOMIC = SQLITE_IOERR or (31 shl 8);
  SQLITE_IOERR_DATA = SQLITE_IOERR or (32 shl 8);
  SQLITE_IOERR_CORRUPTFS = SQLITE_IOERR or (33 shl 8);
  SQLITE_IOERR_IN_PAGE = SQLITE_IOERR or (34 shl 8);
  SQLITE_LOCKED_SHAREDCACHE = SQLITE_LOCKED or (1 shl 8);
  SQLITE_LOCKED_VTAB = SQLITE_LOCKED or (2 shl 8);
  SQLITE_BUSY_RECOVERY = SQLITE_BUSY or (1 shl 8);
  SQLITE_BUSY_SNAPSHOT = SQLITE_BUSY or (2 shl 8);
  SQLITE_BUSY_TIMEOUT = SQLITE_BUSY or (3 shl 8);
  SQLITE_CANTOPEN_NOTEMPDIR = SQLITE_CANTOPEN or (1 shl 8);
  SQLITE_CANTOPEN_ISDIR = SQLITE_CANTOPEN or (2 shl 8);
  SQLITE_CANTOPEN_FULLPATH = SQLITE_CANTOPEN or (3 shl 8);
  SQLITE_CANTOPEN_CONVPATH = SQLITE_CANTOPEN or (4 shl 8);

  SQLITE_CANTOPEN_DIRTYWAL = SQLITE_CANTOPEN or (5 shl 8);
  SQLITE_CANTOPEN_SYMLINK = SQLITE_CANTOPEN or (6 shl 8);
  SQLITE_CORRUPT_VTAB = SQLITE_CORRUPT or (1 shl 8);
  SQLITE_CORRUPT_SEQUENCE = SQLITE_CORRUPT or (2 shl 8);
  SQLITE_CORRUPT_INDEX = SQLITE_CORRUPT or (3 shl 8);
  SQLITE_READONLY_RECOVERY = SQLITE_READONLY or (1 shl 8);
  SQLITE_READONLY_CANTLOCK = SQLITE_READONLY or (2 shl 8);
  SQLITE_READONLY_ROLLBACK = SQLITE_READONLY or (3 shl 8);
  SQLITE_READONLY_DBMOVED = SQLITE_READONLY or (4 shl 8);
  SQLITE_READONLY_CANTINIT = SQLITE_READONLY or (5 shl 8);
  SQLITE_READONLY_DIRECTORY = SQLITE_READONLY or (6 shl 8);
  SQLITE_ABORT_ROLLBACK = SQLITE_ABORT or (2 shl 8);
  SQLITE_CONSTRAINT_CHECK = SQLITE_CONSTRAINT or (1 shl 8);
  SQLITE_CONSTRAINT_COMMITHOOK = SQLITE_CONSTRAINT or (2 shl 8);
  SQLITE_CONSTRAINT_FOREIGNKEY = SQLITE_CONSTRAINT or (3 shl 8);
  SQLITE_CONSTRAINT_FUNCTION = SQLITE_CONSTRAINT or (4 shl 8);
  SQLITE_CONSTRAINT_NOTNULL = SQLITE_CONSTRAINT or (5 shl 8);
  SQLITE_CONSTRAINT_PRIMARYKEY = SQLITE_CONSTRAINT or (6 shl 8);
  SQLITE_CONSTRAINT_TRIGGER = SQLITE_CONSTRAINT or (7 shl 8);
  SQLITE_CONSTRAINT_UNIQUE = SQLITE_CONSTRAINT or (8 shl 8);
  SQLITE_CONSTRAINT_VTAB = SQLITE_CONSTRAINT or (9 shl 8);
  SQLITE_CONSTRAINT_ROWID = SQLITE_CONSTRAINT or (10 shl 8);
  SQLITE_CONSTRAINT_PINNED = SQLITE_CONSTRAINT or (11 shl 8);
  SQLITE_CONSTRAINT_DATATYPE = SQLITE_CONSTRAINT or (12 shl 8);
  SQLITE_NOTICE_RECOVER_WAL = SQLITE_NOTICE or (1 shl 8);
  SQLITE_NOTICE_RECOVER_ROLLBACK = SQLITE_NOTICE or (2 shl 8);
  SQLITE_NOTICE_RBU = SQLITE_NOTICE or (3 shl 8);
  SQLITE_WARNING_AUTOINDEX = SQLITE_WARNING or (1 shl 8);
  SQLITE_AUTH_USER = SQLITE_AUTH or (1 shl 8);
  SQLITE_OK_LOAD_PERMANENTLY = SQLITE_OK or (1 shl 8);
  SQLITE_OK_SYMLINK = SQLITE_OK or (2 shl 8);

  SQLITE_OPEN_READONLY = $00000001;
  SQLITE_OPEN_READWRITE = $00000002;
  SQLITE_OPEN_CREATE = $00000004;
  SQLITE_OPEN_DELETEONCLOSE = $00000008;
  SQLITE_OPEN_EXCLUSIVE = $00000010;
  SQLITE_OPEN_AUTOPROXY = $00000020;
  SQLITE_OPEN_URI = $00000040;
  SQLITE_OPEN_MEMORY = $00000080;
  SQLITE_OPEN_MAIN_DB = $00000100;
  SQLITE_OPEN_TEMP_DB = $00000200;
  SQLITE_OPEN_TRANSIENT_DB = $00000400;
  SQLITE_OPEN_MAIN_JOURNAL = $00000800;
  SQLITE_OPEN_TEMP_JOURNAL = $00001000;
  SQLITE_OPEN_SUBJOURNAL = $00002000;
  SQLITE_OPEN_SUPER_JOURNAL = $00004000;
  SQLITE_OPEN_NOMUTEX = $00008000;
  SQLITE_OPEN_FULLMUTEX = $00010000;
  SQLITE_OPEN_SHAREDCACHE = $00020000;
  SQLITE_OPEN_PRIVATECACHE = $00040000;
  SQLITE_OPEN_WAL = $00080000;
  SQLITE_OPEN_NOFOLLOW = $01000000;
  SQLITE_OPEN_EXRESCODE = $02000000;
  SQLITE_OPEN_MASTER_JOURNAL = $00004000;

  SQLITE_IOCAP_ATOMIC = $00000001;
  SQLITE_IOCAP_ATOMIC512 = $00000002;
  SQLITE_IOCAP_ATOMIC1K = $00000004;
  SQLITE_IOCAP_ATOMIC2K = $00000008;
  SQLITE_IOCAP_ATOMIC4K = $00000010;
  SQLITE_IOCAP_ATOMIC8K = $00000020;
  SQLITE_IOCAP_ATOMIC16K = $00000040;
  SQLITE_IOCAP_ATOMIC32K = $00000080;
  SQLITE_IOCAP_ATOMIC64K = $00000100;
  SQLITE_IOCAP_SAFE_APPEND = $00000200;
  SQLITE_IOCAP_SEQUENTIAL = $00000400;
  SQLITE_IOCAP_UNDELETABLE_WHEN_OPEN = $00000800;
  SQLITE_IOCAP_POWERSAFE_OVERWRITE = $00001000;
  SQLITE_IOCAP_IMMUTABLE = $00002000;
  SQLITE_IOCAP_BATCH_ATOMIC = $00004000;

  SQLITE_LOCK_NONE = 0;
  SQLITE_LOCK_SHARED = 1;
  SQLITE_LOCK_RESERVED = 2;
  SQLITE_LOCK_PENDING = 3;
  SQLITE_LOCK_EXCLUSIVE = 4;

  SQLITE_SYNC_NORMAL = $00002;
  SQLITE_SYNC_FULL = $00003;
  SQLITE_SYNC_DATAONLY = $00010;

type
  Psqlite3_io_methods = ^Tsqlite3_io_methods;

  Tsqlite3_file = record
    pMethods: Psqlite3_io_methods;
  end;
  Psqlite3_file = ^Tsqlite3_file;

  Tsqlite3_io_methods = record
    iVersion: longint;
    xClose: function(para1: Psqlite3_file): longint; cdecl;
    xRead: function(para1: Psqlite3_file; para2: pointer; iAmt: longint; iOfst: Tsqlite3_int64): longint; cdecl;
    xWrite: function(para1: Psqlite3_file; para2: pointer; iAmt: longint; iOfst: Tsqlite3_int64): longint; cdecl;
    xTruncate: function(para1: Psqlite3_file; size: Tsqlite3_int64): longint; cdecl;
    xSync: function(para1: Psqlite3_file; flags: longint): longint; cdecl;
    xFileSize: function(para1: Psqlite3_file; pSize: Psqlite3_int64): longint; cdecl;
    xLock: function(para1: Psqlite3_file; para2: longint): longint; cdecl;
    xUnlock: function(para1: Psqlite3_file; para2: longint): longint; cdecl;
    xCheckReservedLock: function(para1: Psqlite3_file; pResOut: Plongint): longint; cdecl;
    xFileControl: function(para1: Psqlite3_file; op: longint; pArg: pointer): longint; cdecl;
    xSectorSize: function(para1: Psqlite3_file): longint; cdecl;
    xDeviceCharacteristics: function(para1: Psqlite3_file): longint; cdecl;
    xShmMap: function(para1: Psqlite3_file; iPg: longint; pgsz: longint; para4: longint; para5: Ppointer): longint; cdecl;
    xShmLock: function(para1: Psqlite3_file; offset: longint; n: longint; flags: longint): longint; cdecl;
    xShmBarrier: procedure(para1: Psqlite3_file); cdecl;
    xShmUnmap: function(para1: Psqlite3_file; deleteFlag: longint): longint; cdecl;
    xFetch: function(para1: Psqlite3_file; iOfst: Tsqlite3_int64; iAmt: longint; pp: Ppointer): longint; cdecl;
    xUnfetch: function(para1: Psqlite3_file; iOfst: Tsqlite3_int64; p: pointer): longint; cdecl;
  end;

const
  SQLITE_FCNTL_LOCKSTATE = 1;
  SQLITE_FCNTL_GET_LOCKPROXYFILE = 2;
  SQLITE_FCNTL_SET_LOCKPROXYFILE = 3;
  SQLITE_FCNTL_LAST_ERRNO = 4;
  SQLITE_FCNTL_SIZE_HINT = 5;
  SQLITE_FCNTL_CHUNK_SIZE = 6;
  SQLITE_FCNTL_FILE_POINTER = 7;
  SQLITE_FCNTL_SYNC_OMITTED = 8;
  SQLITE_FCNTL_WIN32_AV_RETRY = 9;
  SQLITE_FCNTL_PERSIST_WAL = 10;
  SQLITE_FCNTL_OVERWRITE = 11;
  SQLITE_FCNTL_VFSNAME = 12;
  SQLITE_FCNTL_POWERSAFE_OVERWRITE = 13;
  SQLITE_FCNTL_PRAGMA = 14;
  SQLITE_FCNTL_BUSYHANDLER = 15;
  SQLITE_FCNTL_TEMPFILENAME = 16;
  SQLITE_FCNTL_MMAP_SIZE = 18;
  SQLITE_FCNTL_TRACE = 19;
  SQLITE_FCNTL_HAS_MOVED = 20;
  SQLITE_FCNTL_SYNC = 21;
  SQLITE_FCNTL_COMMIT_PHASETWO = 22;
  SQLITE_FCNTL_WIN32_SET_HANDLE = 23;
  SQLITE_FCNTL_WAL_BLOCK = 24;
  SQLITE_FCNTL_ZIPVFS = 25;
  SQLITE_FCNTL_RBU = 26;
  SQLITE_FCNTL_VFS_POINTER = 27;
  SQLITE_FCNTL_JOURNAL_POINTER = 28;
  SQLITE_FCNTL_WIN32_GET_HANDLE = 29;
  SQLITE_FCNTL_PDB = 30;
  SQLITE_FCNTL_BEGIN_ATOMIC_WRITE = 31;
  SQLITE_FCNTL_COMMIT_ATOMIC_WRITE = 32;
  SQLITE_FCNTL_ROLLBACK_ATOMIC_WRITE = 33;
  SQLITE_FCNTL_LOCK_TIMEOUT = 34;
  SQLITE_FCNTL_DATA_VERSION = 35;
  SQLITE_FCNTL_SIZE_LIMIT = 36;
  SQLITE_FCNTL_CKPT_DONE = 37;
  SQLITE_FCNTL_RESERVE_BYTES = 38;
  SQLITE_FCNTL_CKPT_START = 39;
  SQLITE_FCNTL_EXTERNAL_READER = 40;
  SQLITE_FCNTL_CKSM_FILE = 41;
  SQLITE_FCNTL_RESET_CACHE = 42;

  SQLITE_GET_LOCKPROXYFILE = SQLITE_FCNTL_GET_LOCKPROXYFILE;
  SQLITE_SET_LOCKPROXYFILE = SQLITE_FCNTL_SET_LOCKPROXYFILE;
  SQLITE_LAST_ERRNO = SQLITE_FCNTL_LAST_ERRNO;

type
  Psqlite3_mutex = type Pointer;

  Psqlite3_filename = ^Tsqlite3_filename;
  Tsqlite3_filename = pchar;
  Tsqlite3_syscall_ptr = procedure(para1: pointer); cdecl;
  Psqlite3_vfs = ^Tsqlite3_vfs;

  Tsqlite3_vfs = record
    iVersion: longint;
    szOsFile: longint;
    mxPathname: longint;
    pNext: Psqlite3_vfs;
    zName: pchar;
    pAppData: pointer;
    xOpen: function(para1: Psqlite3_vfs; zName: Tsqlite3_filename; para3: Psqlite3_file; flags: longint; pOutFlags: Plongint): longint; cdecl;
    xDelete: function(para1: Psqlite3_vfs; zName: pchar; syncDir: longint): longint; cdecl;
    xAccess: function(para1: Psqlite3_vfs; zName: pchar; flags: longint; pResOut: Plongint): longint; cdecl;
    xFullPathname: function(para1: Psqlite3_vfs; zName: pchar; nOut: longint; zOut: pchar): longint; cdecl;
    xDlOpen: function(para1: Psqlite3_vfs; zFilename: pchar): pointer; cdecl;
    xDlError: procedure(para1: Psqlite3_vfs; nByte: longint; zErrMsg: pchar); cdecl;
    xDlSym: function(para1: Psqlite3_vfs; para2: pointer; zSymbol: pchar): Tproc; cdecl;
    xDlClose: procedure(para1: Psqlite3_vfs; para2: pointer); cdecl;
    xRandomness: function(para1: Psqlite3_vfs; nByte: longint; zOut: pchar): longint; cdecl;
    xSleep: function(para1: Psqlite3_vfs; microseconds: longint): longint; cdecl;
    xCurrentTime: function(para1: Psqlite3_vfs; para2: Pdouble): longint; cdecl;
    xGetLastError: function(para1: Psqlite3_vfs; para2: longint; para3: pchar): longint; cdecl;
    xCurrentTimeInt64: function(para1: Psqlite3_vfs; para2: Psqlite3_int64): longint; cdecl;
    xSetSystemCall: function(para1: Psqlite3_vfs; zName: pchar; para3: Tsqlite3_syscall_ptr): longint; cdecl;
    xGetSystemCall: function(para1: Psqlite3_vfs; zName: pchar): Tsqlite3_syscall_ptr; cdecl;
    xNextSystemCall: function(para1: Psqlite3_vfs; zName: pchar): pchar; cdecl;
  end;

const
  SQLITE_ACCESS_EXISTS = 0;
  SQLITE_ACCESS_READWRITE = 1;
  SQLITE_ACCESS_READ = 2;

  SQLITE_SHM_UNLOCK = 1;
  SQLITE_SHM_LOCK = 2;
  SQLITE_SHM_SHARED = 4;
  SQLITE_SHM_EXCLUSIVE = 8;
  SQLITE_SHM_NLOCK = 8;

function sqlite3_initialize: longint; cdecl; external libsqlite;
function sqlite3_shutdown: longint; cdecl; external libsqlite;
function sqlite3_os_init: longint; cdecl; external libsqlite;
function sqlite3_os_end: longint; cdecl; external libsqlite;

function sqlite3_config(para1: longint): longint; cdecl; varargs; external libsqlite;
function sqlite3_db_config(para1: Psqlite3; op: longint): longint; cdecl; varargs; external libsqlite;

type
  Tsqlite3_mem_methods = record
    xMalloc: function(para1: longint): pointer; cdecl;
    xFree: procedure(para1: pointer); cdecl;
    xRealloc: function(para1: pointer; para2: longint): pointer; cdecl;
    xSize: function(para1: pointer): longint; cdecl;
    xRoundup: function(para1: longint): longint; cdecl;
    xInit: function(para1: pointer): longint; cdecl;
    xShutdown: procedure(para1: pointer); cdecl;
    pAppData: pointer;
  end;
  Psqlite3_mem_methods = ^Tsqlite3_mem_methods;

const
  SQLITE_CONFIG_SINGLETHREAD = 1;
  SQLITE_CONFIG_MULTITHREAD = 2;
  SQLITE_CONFIG_SERIALIZED = 3;
  SQLITE_CONFIG_MALLOC = 4;
  SQLITE_CONFIG_GETMALLOC = 5;
  SQLITE_CONFIG_SCRATCH = 6;
  SQLITE_CONFIG_PAGECACHE = 7;
  SQLITE_CONFIG_HEAP = 8;
  SQLITE_CONFIG_MEMSTATUS = 9;
  SQLITE_CONFIG_MUTEX = 10;
  SQLITE_CONFIG_GETMUTEX = 11;
  SQLITE_CONFIG_LOOKASIDE = 13;
  SQLITE_CONFIG_PCACHE = 14;
  SQLITE_CONFIG_GETPCACHE = 15;
  SQLITE_CONFIG_LOG = 16;
  SQLITE_CONFIG_URI = 17;
  SQLITE_CONFIG_PCACHE2 = 18;
  SQLITE_CONFIG_GETPCACHE2 = 19;
  SQLITE_CONFIG_COVERING_INDEX_SCAN = 20;
  SQLITE_CONFIG_SQLLOG = 21;
  SQLITE_CONFIG_MMAP_SIZE = 22;
  SQLITE_CONFIG_WIN32_HEAPSIZE = 23;
  SQLITE_CONFIG_PCACHE_HDRSZ = 24;
  SQLITE_CONFIG_PMASZ = 25;
  SQLITE_CONFIG_STMTJRNL_SPILL = 26;
  SQLITE_CONFIG_SMALL_MALLOC = 27;
  SQLITE_CONFIG_SORTERREF_SIZE = 28;
  SQLITE_CONFIG_MEMDB_MAXSIZE = 29;

  SQLITE_DBCONFIG_MAINDBNAME = 1000;
  SQLITE_DBCONFIG_LOOKASIDE = 1001;
  SQLITE_DBCONFIG_ENABLE_FKEY = 1002;
  SQLITE_DBCONFIG_ENABLE_TRIGGER = 1003;
  SQLITE_DBCONFIG_ENABLE_FTS3_TOKENIZER = 1004;
  SQLITE_DBCONFIG_ENABLE_LOAD_EXTENSION = 1005;
  SQLITE_DBCONFIG_NO_CKPT_ON_CLOSE = 1006;
  SQLITE_DBCONFIG_ENABLE_QPSG = 1007;
  SQLITE_DBCONFIG_TRIGGER_EQP = 1008;
  SQLITE_DBCONFIG_RESET_DATABASE = 1009;
  SQLITE_DBCONFIG_DEFENSIVE = 1010;
  SQLITE_DBCONFIG_WRITABLE_SCHEMA = 1011;
  SQLITE_DBCONFIG_LEGACY_ALTER_TABLE = 1012;
  SQLITE_DBCONFIG_DQS_DML = 1013;
  SQLITE_DBCONFIG_DQS_DDL = 1014;
  SQLITE_DBCONFIG_ENABLE_VIEW = 1015;
  SQLITE_DBCONFIG_LEGACY_FILE_FORMAT = 1016;
  SQLITE_DBCONFIG_TRUSTED_SCHEMA = 1017;
  SQLITE_DBCONFIG_STMT_SCANSTATUS = 1018;
  SQLITE_DBCONFIG_REVERSE_SCANORDER = 1019;
  SQLITE_DBCONFIG_MAX = 1019;

function sqlite3_extended_result_codes(para1: Psqlite3; onoff: longint): longint; cdecl; external libsqlite;
function sqlite3_last_insert_rowid(para1: Psqlite3): Tsqlite3_int64; cdecl; external libsqlite;
procedure sqlite3_set_last_insert_rowid(para1: Psqlite3; para2: Tsqlite3_int64); cdecl; external libsqlite;
function sqlite3_changes(para1: Psqlite3): longint; cdecl; external libsqlite;
function sqlite3_changes64(para1: Psqlite3): Tsqlite3_int64; cdecl; external libsqlite;

function sqlite3_total_changes(para1: Psqlite3): longint; cdecl; external libsqlite;
function sqlite3_total_changes64(para1: Psqlite3): Tsqlite3_int64; cdecl; external libsqlite;

procedure sqlite3_interrupt(para1: Psqlite3); cdecl; external libsqlite;
function sqlite3_is_interrupted(para1: Psqlite3): longint; cdecl; external libsqlite;

function sqlite3_complete(sql: pchar): longint; cdecl; external libsqlite;
function sqlite3_complete16(sql: pointer): longint; cdecl; external libsqlite;

type
  Tbusy_handler_func = function(para1: pointer; para2: longint): longint; cdecl;

function sqlite3_busy_handler(para1: Psqlite3; para2: Tbusy_handler_func; para3: pointer): longint; cdecl; external libsqlite;
function sqlite3_busy_timeout(para1: Psqlite3; ms: longint): longint; cdecl; external libsqlite;
function sqlite3_get_table(db: Psqlite3; zSql: pchar; pazResult: PPPchar; pnRow: Plongint; pnColumn: Plongint; pzErrmsg: PPchar): longint; cdecl; external libsqlite;
procedure sqlite3_free_table(result: PPchar); cdecl; external libsqlite;

function sqlite3_mprintf(para1: pchar): pchar; cdecl; varargs; external libsqlite;
function sqlite3_vmprintf(para1: pchar; para2: Tva_list): pchar; cdecl; external libsqlite;
function sqlite3_snprintf(para1: longint; para2: pchar; para3: pchar): pchar; cdecl; varargs; external libsqlite;
function sqlite3_vsnprintf(para1: longint; para2: pchar; para3: pchar; para4: Tva_list): pchar; cdecl; external libsqlite;

function sqlite3_malloc(para1: longint): pointer; cdecl; external libsqlite;
function sqlite3_malloc64(para1: Tsqlite3_uint64): pointer; cdecl; external libsqlite;
function sqlite3_realloc(para1: pointer; para2: longint): pointer; cdecl; external libsqlite;
function sqlite3_realloc64(para1: pointer; para2: Tsqlite3_uint64): pointer; cdecl; external libsqlite;
procedure sqlite3_free(para1: pointer); cdecl; external libsqlite;
function sqlite3_msize(para1: pointer): Tsqlite3_uint64; cdecl; external libsqlite;

function sqlite3_memory_used: Tsqlite3_int64; cdecl; external libsqlite;
function sqlite3_memory_highwater(resetFlag: longint): Tsqlite3_int64; cdecl; external libsqlite;
procedure sqlite3_randomness(N: longint; P: pointer); cdecl; external libsqlite;

type
  Tset_authorizer_func = function(para1: pointer; para2: longint; para3: pchar; para4: pchar; para5: pchar; para6: pchar): longint; cdecl;

function sqlite3_set_authorizer(para1: Psqlite3; xAuth: Tset_authorizer_func; pUserData: pointer): longint; cdecl; external libsqlite;

const
  SQLITE_DENY = 1;
  SQLITE_IGNORE = 2;

  SQLITE_CREATE_INDEX = 1;
  SQLITE_CREATE_TABLE = 2;
  SQLITE_CREATE_TEMP_INDEX = 3;
  SQLITE_CREATE_TEMP_TABLE = 4;
  SQLITE_CREATE_TEMP_TRIGGER = 5;
  SQLITE_CREATE_TEMP_VIEW = 6;
  SQLITE_CREATE_TRIGGER = 7;
  SQLITE_CREATE_VIEW = 8;
  SQLITE_DELETE = 9;
  SQLITE_DROP_INDEX = 10;
  SQLITE_DROP_TABLE = 11;
  SQLITE_DROP_TEMP_INDEX = 12;
  SQLITE_DROP_TEMP_TABLE = 13;
  SQLITE_DROP_TEMP_TRIGGER = 14;
  SQLITE_DROP_TEMP_VIEW = 15;
  SQLITE_DROP_TRIGGER = 16;
  SQLITE_DROP_VIEW = 17;
  SQLITE_INSERT = 18;
  SQLITE_PRAGMA = 19;
  SQLITE_READ = 20;
  SQLITE_SELECT = 21;
  SQLITE_TRANSACTION = 22;
  SQLITE_UPDATE = 23;
  SQLITE_ATTACH = 24;
  SQLITE_DETACH = 25;
  SQLITE_ALTER_TABLE = 26;
  SQLITE_REINDEX = 27;
  SQLITE_ANALYZE = 28;
  SQLITE_CREATE_VTABLE = 29;
  SQLITE_DROP_VTABLE = 30;
  SQLITE_FUNCTION = 31;
  SQLITE_SAVEPOINT = 32;
  SQLITE_COPY = 0;
  SQLITE_RECURSIVE = 33;

type
  Ttrace_func = procedure(para1: pointer; para2: pchar); cdecl;
  Tprofile_func = procedure(para1: pointer; para2: pchar; para3: Tsqlite3_uint64); cdecl;

function sqlite3_trace(para1: Psqlite3; xTrace: Ttrace_func; para3: pointer): pointer; cdecl; external libsqlite; deprecated;
function sqlite3_profile(para1: Psqlite3; xProfile: Tprofile_func; para3: pointer): pointer; cdecl; external libsqlite; deprecated;

const
  SQLITE_TRACE_STMT = $01;
  SQLITE_TRACE_PROFILE = $02;
  SQLITE_TRACE_ROW = $04;
  SQLITE_TRACE_CLOSE = $08;

type
  Ttrace_v2_func = function(para1: dword; para2: pointer; para3: pointer; para4: pointer): longint; cdecl;
  Tprogress_handler_func = function(para1: pointer): longint; cdecl;

function sqlite3_trace_v2(para1: Psqlite3; uMask: dword; xCallback: Ttrace_v2_func; pCtx: pointer): longint; cdecl; external libsqlite;
procedure sqlite3_progress_handler(para1: Psqlite3; para2: longint; para3: Tprogress_handler_func; para4: pointer); cdecl; external libsqlite;
function sqlite3_open(filename: pchar; ppDb: PPsqlite3): longint; cdecl; external libsqlite;
function sqlite3_open16(filename: pointer; ppDb: PPsqlite3): longint; cdecl; external libsqlite;
function sqlite3_open_v2(filename: pchar; ppDb: PPsqlite3; flags: longint; zVfs: pchar): longint; cdecl; external libsqlite;

function sqlite3_uri_parameter(z: Tsqlite3_filename; zParam: pchar): pchar; cdecl; external libsqlite;
function sqlite3_uri_boolean(z: Tsqlite3_filename; zParam: pchar; bDefault: longint): longint; cdecl; external libsqlite;
function sqlite3_uri_int64(para1: Tsqlite3_filename; para2: pchar; para3: Tsqlite3_int64): Tsqlite3_int64; cdecl; external libsqlite;
function sqlite3_uri_key(z: Tsqlite3_filename; N: longint): pchar; cdecl; external libsqlite;

function sqlite3_filename_database(para1: Tsqlite3_filename): pchar; cdecl; external libsqlite;
function sqlite3_filename_journal(para1: Tsqlite3_filename): pchar; cdecl; external libsqlite;
function sqlite3_filename_wal(para1: Tsqlite3_filename): pchar; cdecl; external libsqlite;

function sqlite3_database_file_object(para1: pchar): Psqlite3_file; cdecl; external libsqlite;
function sqlite3_create_filename(zDatabase: pchar; zJournal: pchar; zWal: pchar; nParam: longint; azParam: PPchar): Tsqlite3_filename; cdecl; external libsqlite;
procedure sqlite3_free_filename(para1: Tsqlite3_filename); cdecl; external libsqlite;

function sqlite3_errcode(db: Psqlite3): longint; cdecl; external libsqlite;
function sqlite3_extended_errcode(db: Psqlite3): longint; cdecl; external libsqlite;
function sqlite3_errmsg(para1: Psqlite3): pchar; cdecl; external libsqlite;
function sqlite3_errmsg16(para1: Psqlite3): pointer; cdecl; external libsqlite;
function sqlite3_errstr(para1: longint): pchar; cdecl; external libsqlite;
function sqlite3_error_offset(db: Psqlite3): longint; cdecl; external libsqlite;

type
  Psqlite3_stmt = type Pointer;
  PPsqlite3_stmt = ^Psqlite3_stmt;

function sqlite3_limit(para1: Psqlite3; id: longint; newVal: longint): longint; cdecl; external libsqlite;

const
  SQLITE_LIMIT_LENGTH = 0;
  SQLITE_LIMIT_SQL_LENGTH = 1;
  SQLITE_LIMIT_COLUMN = 2;
  SQLITE_LIMIT_EXPR_DEPTH = 3;
  SQLITE_LIMIT_COMPOUND_SELECT = 4;
  SQLITE_LIMIT_VDBE_OP = 5;
  SQLITE_LIMIT_FUNCTION_ARG = 6;
  SQLITE_LIMIT_ATTACHED = 7;
  SQLITE_LIMIT_LIKE_PATTERN_LENGTH = 8;
  SQLITE_LIMIT_VARIABLE_NUMBER = 9;
  SQLITE_LIMIT_TRIGGER_DEPTH = 10;
  SQLITE_LIMIT_WORKER_THREADS = 11;

  SQLITE_PREPARE_PERSISTENT = $01;
  SQLITE_PREPARE_NORMALIZE = $02;
  SQLITE_PREPARE_NO_VTAB = $04;

function sqlite3_prepare(db: Psqlite3; zSql: pchar; nByte: longint; ppStmt: PPsqlite3_stmt; pzTail: PPchar): longint; cdecl; external libsqlite;
function sqlite3_prepare_v2(db: Psqlite3; zSql: pchar; nByte: longint; ppStmt: PPsqlite3_stmt; pzTail: PPchar): longint; cdecl; external libsqlite;
function sqlite3_prepare_v3(db: Psqlite3; zSql: pchar; nByte: longint; prepFlags: dword; ppStmt: PPsqlite3_stmt; pzTail: PPchar): longint; cdecl; external libsqlite;
function sqlite3_prepare16(db: Psqlite3; zSql: pointer; nByte: longint; ppStmt: PPsqlite3_stmt; pzTail: Ppointer): longint; cdecl; external libsqlite;
function sqlite3_prepare16_v2(db: Psqlite3; zSql: pointer; nByte: longint; ppStmt: PPsqlite3_stmt; pzTail: Ppointer): longint; cdecl; external libsqlite;
function sqlite3_prepare16_v3(db: Psqlite3; zSql: pointer; nByte: longint; prepFlags: dword; ppStmt: PPsqlite3_stmt; pzTail: Ppointer): longint; cdecl; external libsqlite;

function sqlite3_sql(pStmt: Psqlite3_stmt): pchar; cdecl; external libsqlite;
function sqlite3_expanded_sql(pStmt: Psqlite3_stmt): pchar; cdecl; external libsqlite;

function sqlite3_normalized_sql(pStmt: Psqlite3_stmt): pchar; cdecl; external libsqlite;
function sqlite3_stmt_readonly(pStmt: Psqlite3_stmt): longint; cdecl; external libsqlite;
function sqlite3_stmt_isexplain(pStmt: Psqlite3_stmt): longint; cdecl; external libsqlite;
function sqlite3_stmt_explain(pStmt: Psqlite3_stmt; eMode: longint): longint; cdecl; external libsqlite;
function sqlite3_stmt_busy(para1: Psqlite3_stmt): longint; cdecl; external libsqlite;

type
  Psqlite3_value = type Pointer;
  PPsqlite3_value = ^Psqlite3_value;
  Psqlite3_context = type Pointer;
  Tbind_func = procedure(para1: pointer); cdecl;

function sqlite3_bind_blob(para1: Psqlite3_stmt; para2: longint; para3: pointer; n: longint; para5: Tbind_func): longint; cdecl; external libsqlite;
function sqlite3_bind_blob64(para1: Psqlite3_stmt; para2: longint; para3: pointer; para4: Tsqlite3_uint64; para5: Tbind_func): longint; cdecl; external libsqlite;
function sqlite3_bind_double(para1: Psqlite3_stmt; para2: longint; para3: double): longint; cdecl; external libsqlite;
function sqlite3_bind_int(para1: Psqlite3_stmt; para2: longint; para3: longint): longint; cdecl; external libsqlite;
function sqlite3_bind_int64(para1: Psqlite3_stmt; para2: longint; para3: Tsqlite3_int64): longint; cdecl; external libsqlite;
function sqlite3_bind_null(para1: Psqlite3_stmt; para2: longint): longint; cdecl; external libsqlite;
function sqlite3_bind_text(para1: Psqlite3_stmt; para2: longint; para3: pchar; para4: longint; para5: Tbind_func): longint; cdecl; external libsqlite;
function sqlite3_bind_text16(para1: Psqlite3_stmt; para2: longint; para3: pointer; para4: longint; para5: Tbind_func): longint; cdecl; external libsqlite;
function sqlite3_bind_text64(para1: Psqlite3_stmt; para2: longint; para3: pchar; para4: Tsqlite3_uint64; para5: Tbind_func; encoding: byte): longint; cdecl; external libsqlite;
function sqlite3_bind_value(para1: Psqlite3_stmt; para2: longint; para3: Psqlite3_value): longint; cdecl; external libsqlite;
function sqlite3_bind_pointer(para1: Psqlite3_stmt; para2: longint; para3: pointer; para4: pchar; para5: Tbind_func): longint; cdecl; external libsqlite;
function sqlite3_bind_zeroblob(para1: Psqlite3_stmt; para2: longint; n: longint): longint; cdecl; external libsqlite;
function sqlite3_bind_zeroblob64(para1: Psqlite3_stmt; para2: longint; para3: Tsqlite3_uint64): longint; cdecl; external libsqlite;
function sqlite3_bind_parameter_count(para1: Psqlite3_stmt): longint; cdecl; external libsqlite;
function sqlite3_bind_parameter_name(para1: Psqlite3_stmt; para2: longint): pchar; cdecl; external libsqlite;
function sqlite3_bind_parameter_index(para1: Psqlite3_stmt; zName: pchar): longint; cdecl; external libsqlite;
function sqlite3_clear_bindings(para1: Psqlite3_stmt): longint; cdecl; external libsqlite;

function sqlite3_column_count(pStmt: Psqlite3_stmt): longint; cdecl; external libsqlite;
function sqlite3_column_name(para1: Psqlite3_stmt; N: longint): pchar; cdecl; external libsqlite;
function sqlite3_column_name16(para1: Psqlite3_stmt; N: longint): pointer; cdecl; external libsqlite;
function sqlite3_column_database_name(para1: Psqlite3_stmt; para2: longint): pchar; cdecl; external libsqlite;
function sqlite3_column_database_name16(para1: Psqlite3_stmt; para2: longint): pointer; cdecl; external libsqlite;
function sqlite3_column_table_name(para1: Psqlite3_stmt; para2: longint): pchar; cdecl; external libsqlite;
function sqlite3_column_table_name16(para1: Psqlite3_stmt; para2: longint): pointer; cdecl; external libsqlite;
function sqlite3_column_origin_name(para1: Psqlite3_stmt; para2: longint): pchar; cdecl; external libsqlite;
function sqlite3_column_origin_name16(para1: Psqlite3_stmt; para2: longint): pointer; cdecl; external libsqlite;
function sqlite3_column_decltype(para1: Psqlite3_stmt; para2: longint): pchar; cdecl; external libsqlite;
function sqlite3_column_decltype16(para1: Psqlite3_stmt; para2: longint): pointer; cdecl; external libsqlite;

function sqlite3_step(para1: Psqlite3_stmt): longint; cdecl; external libsqlite;
function sqlite3_data_count(pStmt: Psqlite3_stmt): longint; cdecl; external libsqlite;

const
  SQLITE_INTEGER = 1;
  SQLITE_FLOAT = 2;
  SQLITE_BLOB = 4;
  SQLITE_NULL = 5;

const
  SQLITE_TEXT = 3;
  SQLITE3_TEXT = 3;

function sqlite3_column_blob(para1: Psqlite3_stmt; iCol: longint): pointer; cdecl; external libsqlite;
function sqlite3_column_double(para1: Psqlite3_stmt; iCol: longint): double; cdecl; external libsqlite;
function sqlite3_column_int(para1: Psqlite3_stmt; iCol: longint): longint; cdecl; external libsqlite;
function sqlite3_column_int64(para1: Psqlite3_stmt; iCol: longint): Tsqlite3_int64; cdecl; external libsqlite;
function sqlite3_column_text(para1: Psqlite3_stmt; iCol: longint): pbyte; cdecl; external libsqlite;
function sqlite3_column_text16(para1: Psqlite3_stmt; iCol: longint): pointer; cdecl; external libsqlite;
function sqlite3_column_value(para1: Psqlite3_stmt; iCol: longint): Psqlite3_value; cdecl; external libsqlite;
function sqlite3_column_bytes(para1: Psqlite3_stmt; iCol: longint): longint; cdecl; external libsqlite;
function sqlite3_column_bytes16(para1: Psqlite3_stmt; iCol: longint): longint; cdecl; external libsqlite;
function sqlite3_column_type(para1: Psqlite3_stmt; iCol: longint): longint; cdecl; external libsqlite;

function sqlite3_finalize(pStmt: Psqlite3_stmt): longint; cdecl; external libsqlite;
function sqlite3_reset(pStmt: Psqlite3_stmt): longint; cdecl; external libsqlite;

type
  Tcreate_function_func = procedure(para1: Psqlite3_context; para2: longint; para3: PPsqlite3_value); cdecl;
  Tcreate_function_func2 = procedure(para1: Psqlite3_context); cdecl;
  Tcreate_function_func3 = procedure(para1: pointer); cdecl;

function sqlite3_create_function(db: Psqlite3; zFunctionName: pchar; nArg: longint; eTextRep: longint; pApp: pointer;
  xFunc: Tcreate_function_func; xStep: Tcreate_function_func; xFinal: Tcreate_function_func2): longint; cdecl; external libsqlite;
function sqlite3_create_function16(db: Psqlite3; zFunctionName: pointer; nArg: longint; eTextRep: longint; pApp: pointer;
  xFunc: Tcreate_function_func; xStep: Tcreate_function_func; xFinal: Tcreate_function_func2): longint; cdecl; external libsqlite;
function sqlite3_create_function_v2(db: Psqlite3; zFunctionName: pchar; nArg: longint; eTextRep: longint; pApp: pointer;
  xFunc: Tcreate_function_func; xStep: Tcreate_function_func; xFinal: Tcreate_function_func2; xDestroy: Tcreate_function_func3): longint; cdecl; external libsqlite;
function sqlite3_create_window_function(db: Psqlite3; zFunctionName: pchar; nArg: longint; eTextRep: longint; pApp: pointer;
  xStep: Tcreate_function_func; xFinal: Tcreate_function_func2; xValue: Tcreate_function_func2; xInverse: Tcreate_function_func; xDestroy: Tcreate_function_func3): longint; cdecl; external libsqlite;

const
  SQLITE_UTF8 = 1;
  SQLITE_UTF16LE = 2;
  SQLITE_UTF16BE = 3;
  SQLITE_UTF16 = 4;
  SQLITE_ANY = 5;
  SQLITE_UTF16_ALIGNED = 8;

  SQLITE_DETERMINISTIC = $000000800;
  SQLITE_DIRECTONLY = $000080000;
  SQLITE_SUBTYPE = $000100000;
  SQLITE_INNOCUOUS = $000200000;
  SQLITE_RESULT_SUBTYPE = $001000000;

function sqlite3_aggregate_count(para1: Psqlite3_context): longint; cdecl; external libsqlite; deprecated;
function sqlite3_expired(para1: Psqlite3_stmt): longint; cdecl; external libsqlite; deprecated;
function sqlite3_transfer_bindings(para1: Psqlite3_stmt; para2: Psqlite3_stmt): longint; cdecl; external libsqlite; deprecated;
function sqlite3_global_recover: longint; cdecl; external libsqlite; deprecated;
procedure sqlite3_thread_cleanup; cdecl; external libsqlite; deprecated;

type
  Tmemory_alarm_func = procedure(para1: pointer; para2: Tsqlite3_int64; para3: longint); cdecl;

function sqlite3_memory_alarm(para1: Tmemory_alarm_func; para2: pointer; para3: Tsqlite3_int64): longint; cdecl; external libsqlite; deprecated;

function sqlite3_value_blob(para1: Psqlite3_value): pointer; cdecl; external libsqlite;
function sqlite3_value_double(para1: Psqlite3_value): double; cdecl; external libsqlite;
function sqlite3_value_int(para1: Psqlite3_value): longint; cdecl; external libsqlite;
function sqlite3_value_int64(para1: Psqlite3_value): Tsqlite3_int64; cdecl; external libsqlite;
function sqlite3_value_pointer(para1: Psqlite3_value; para2: pchar): pointer; cdecl; external libsqlite;
function sqlite3_value_text(para1: Psqlite3_value): pbyte; cdecl; external libsqlite;
function sqlite3_value_text16(para1: Psqlite3_value): pointer; cdecl; external libsqlite;
function sqlite3_value_text16le(para1: Psqlite3_value): pointer; cdecl; external libsqlite;
function sqlite3_value_text16be(para1: Psqlite3_value): pointer; cdecl; external libsqlite;
function sqlite3_value_bytes(para1: Psqlite3_value): longint; cdecl; external libsqlite;
function sqlite3_value_bytes16(para1: Psqlite3_value): longint; cdecl; external libsqlite;
function sqlite3_value_type(para1: Psqlite3_value): longint; cdecl; external libsqlite;
function sqlite3_value_numeric_type(para1: Psqlite3_value): longint; cdecl; external libsqlite;
function sqlite3_value_nochange(para1: Psqlite3_value): longint; cdecl; external libsqlite;
function sqlite3_value_frombind(para1: Psqlite3_value): longint; cdecl; external libsqlite;
function sqlite3_value_encoding(para1: Psqlite3_value): longint; cdecl; external libsqlite;
function sqlite3_value_subtype(para1: Psqlite3_value): dword; cdecl; external libsqlite;
function sqlite3_value_dup(para1: Psqlite3_value): Psqlite3_value; cdecl; external libsqlite;
procedure sqlite3_value_free(para1: Psqlite3_value); cdecl; external libsqlite;

function sqlite3_aggregate_context(para1: Psqlite3_context; nBytes: longint): pointer; cdecl; external libsqlite;
function sqlite3_user_data(para1: Psqlite3_context): pointer; cdecl; external libsqlite;
function sqlite3_context_db_handle(para1: Psqlite3_context): Psqlite3; cdecl; external libsqlite;
function sqlite3_get_auxdata(para1: Psqlite3_context; N: longint): pointer; cdecl; external libsqlite;

type
  TPointer_func = procedure(para1: pointer); cdecl;

procedure sqlite3_set_auxdata(para1: Psqlite3_context; N: longint; para3: pointer; para4: TPointer_func); cdecl; external libsqlite;

function sqlite3_get_clientdata(para1: Psqlite3; para2: pchar): pointer; cdecl; external libsqlite;
function sqlite3_set_clientdata(para1: Psqlite3; para2: pchar; para3: pointer; para4: TPointer_func): longint; cdecl; external libsqlite;

type
  Tsqlite3_destructor_type = procedure(para1: pointer); cdecl;

function SQLITE_STATIC: Tsqlite3_destructor_type;
function SQLITE_TRANSIENT: Tsqlite3_destructor_type;

procedure sqlite3_result_blob(para1: Psqlite3_context; para2: pointer; para3: longint; para4: TPointer_func); cdecl; external libsqlite;
procedure sqlite3_result_blob64(para1: Psqlite3_context; para2: pointer; para3: Tsqlite3_uint64; para4: TPointer_func); cdecl; external libsqlite;
procedure sqlite3_result_double(para1: Psqlite3_context; para2: double); cdecl; external libsqlite;
procedure sqlite3_result_error(para1: Psqlite3_context; para2: pchar; para3: longint); cdecl; external libsqlite;
procedure sqlite3_result_error16(para1: Psqlite3_context; para2: pointer; para3: longint); cdecl; external libsqlite;
procedure sqlite3_result_error_toobig(para1: Psqlite3_context); cdecl; external libsqlite;
procedure sqlite3_result_error_nomem(para1: Psqlite3_context); cdecl; external libsqlite;
procedure sqlite3_result_error_code(para1: Psqlite3_context; para2: longint); cdecl; external libsqlite;
procedure sqlite3_result_int(para1: Psqlite3_context; para2: longint); cdecl; external libsqlite;
procedure sqlite3_result_int64(para1: Psqlite3_context; para2: Tsqlite3_int64); cdecl; external libsqlite;
procedure sqlite3_result_null(para1: Psqlite3_context); cdecl; external libsqlite;
procedure sqlite3_result_text(para1: Psqlite3_context; para2: pchar; para3: longint; para4: TPointer_func); cdecl; external libsqlite;
procedure sqlite3_result_text64(para1: Psqlite3_context; para2: pchar; para3: Tsqlite3_uint64; para4: TPointer_func; encoding: byte); cdecl; external libsqlite;
procedure sqlite3_result_text16(para1: Psqlite3_context; para2: pointer; para3: longint; para4: TPointer_func); cdecl; external libsqlite;
procedure sqlite3_result_text16le(para1: Psqlite3_context; para2: pointer; para3: longint; para4: TPointer_func); cdecl; external libsqlite;
procedure sqlite3_result_text16be(para1: Psqlite3_context; para2: pointer; para3: longint; para4: TPointer_func); cdecl; external libsqlite;
procedure sqlite3_result_value(para1: Psqlite3_context; para2: Psqlite3_value); cdecl; external libsqlite;
procedure sqlite3_result_pointer(para1: Psqlite3_context; para2: pointer; para3: pchar; para4: TPointer_func); cdecl; external libsqlite;
procedure sqlite3_result_zeroblob(para1: Psqlite3_context; n: longint); cdecl; external libsqlite;
function sqlite3_result_zeroblob64(para1: Psqlite3_context; n: Tsqlite3_uint64): longint; cdecl; external libsqlite;
procedure sqlite3_result_subtype(para1: Psqlite3_context; para2: dword); cdecl; external libsqlite;

type
  Tcreate_collation_func = function(para1: pointer; para2: longint; para3: pointer; para4: longint; para5: pointer): longint; cdecl;

function sqlite3_create_collation(para1: Psqlite3; zName: pchar; eTextRep: longint; pArg: pointer; xCompare: Tcreate_collation_func): longint; cdecl; external libsqlite;
function sqlite3_create_collation_v2(para1: Psqlite3; zName: pchar; eTextRep: longint; pArg: pointer; xCompare: Tcreate_collation_func;
  xDestroy: TPointer_func): longint; cdecl; external libsqlite;
function sqlite3_create_collation16(para1: Psqlite3; zName: pointer; eTextRep: longint; pArg: pointer; xCompare: Tcreate_collation_func): longint; cdecl; external libsqlite;

type
  Tcollation_needed_func = procedure(para1: pointer; para2: Psqlite3; eTextRep: longint; para4: pchar); cdecl;
  Tcollation_needed_func2 = procedure(para1: pointer; para2: Psqlite3; eTextRep: longint; para4: Pointer); cdecl;

function sqlite3_collation_needed(para1: Psqlite3; para2: pointer; para3: Tcollation_needed_func): longint; cdecl; external libsqlite;
function sqlite3_collation_needed16(para1: Psqlite3; para2: pointer; para3: Tcollation_needed_func2): longint; cdecl; external libsqlite;

procedure sqlite3_activate_cerod(zPassPhrase: pchar); cdecl; external libsqlite;

function sqlite3_sleep(para1: longint): longint; cdecl; external libsqlite;

var
  sqlite3_temp_directory: pchar; cvar;external libsqlite;
  sqlite3_data_directory: pchar; cvar;external libsqlite;

function sqlite3_win32_set_directory(_type: Tulong; zValue: pointer): longint; cdecl; external libsqlite;
function sqlite3_win32_set_directory8(_type: Tulong; zValue: pchar): longint; cdecl; external libsqlite;
function sqlite3_win32_set_directory16(_type: Tulong; zValue: pointer): longint; cdecl; external libsqlite;

const
  SQLITE_WIN32_DATA_DIRECTORY_TYPE = 1;
  SQLITE_WIN32_TEMP_DIRECTORY_TYPE = 2;

function sqlite3_get_autocommit(para1: Psqlite3): longint; cdecl; external libsqlite;
function sqlite3_db_handle(para1: Psqlite3_stmt): Psqlite3; cdecl; external libsqlite;
function sqlite3_db_name(db: Psqlite3; N: longint): pchar; cdecl; external libsqlite;
function sqlite3_db_filename(db: Psqlite3; zDbName: pchar): Tsqlite3_filename; cdecl; external libsqlite;
function sqlite3_db_readonly(db: Psqlite3; zDbName: pchar): longint; cdecl; external libsqlite;
function sqlite3_txn_state(para1: Psqlite3; zSchema: pchar): longint; cdecl; external libsqlite;

const
  SQLITE_TXN_NONE = 0;
  SQLITE_TXN_READ = 1;
  SQLITE_TXN_WRITE = 2;

function sqlite3_next_stmt(pDb: Psqlite3; pStmt: Psqlite3_stmt): Psqlite3_stmt; cdecl; external libsqlite;

type
  Tcommit_hook_func = function(para1: pointer): longint; cdecl;
  Trollback_hook = procedure(para1: pointer); cdecl;
  Tautovacuum_pages_func = function(para1: pointer; para2: pchar; para3: dword; para4: dword; para5: dword): dword; cdecl;

function sqlite3_commit_hook(para1: Psqlite3; para2: Tcommit_hook_func; para3: pointer): pointer; cdecl; external libsqlite;
function sqlite3_rollback_hook(para1: Psqlite3; para2: Trollback_hook; para3: pointer): pointer; cdecl; external libsqlite;

function sqlite3_autovacuum_pages(db: Psqlite3; para2: Tautovacuum_pages_func; para3: pointer; para4: Trollback_hook): longint; cdecl; external libsqlite;

type
  Tupdate_hook_func = procedure(para1: pointer; para2: longint; para3: pchar; para4: pchar; para5: Tsqlite3_int64); cdecl;

function sqlite3_update_hook(para1: Psqlite3; para2: Tupdate_hook_func; para3: pointer): pointer; cdecl; external libsqlite;
function sqlite3_enable_shared_cache(para1: longint): longint; cdecl; external libsqlite;
function sqlite3_release_memory(para1: longint): longint; cdecl; external libsqlite;
function sqlite3_db_release_memory(para1: Psqlite3): longint; cdecl; external libsqlite;
function sqlite3_soft_heap_limit64(N: Tsqlite3_int64): Tsqlite3_int64; cdecl; external libsqlite;
function sqlite3_hard_heap_limit64(N: Tsqlite3_int64): Tsqlite3_int64; cdecl; external libsqlite;
procedure sqlite3_soft_heap_limit(N: longint); cdecl; external libsqlite; deprecated;
function sqlite3_table_column_metadata(db: Psqlite3; zDbName: pchar; zTableName: pchar; zColumnName: pchar; pzDataType: PPchar;
  pzCollSeq: PPchar; pNotNull: Plongint; pPrimaryKey: Plongint; pAutoinc: Plongint): longint; cdecl; external libsqlite;
function sqlite3_load_extension(db: Psqlite3; zFile: pchar; zProc: pchar; pzErrMsg: PPchar): longint; cdecl; external libsqlite;
function sqlite3_enable_load_extension(db: Psqlite3; onoff: longint): longint; cdecl; external libsqlite;
function sqlite3_auto_extension(xEntryPoint: Tproc): longint; cdecl; external libsqlite;
function sqlite3_cancel_auto_extension(xEntryPoint: Tproc): longint; cdecl; external libsqlite;
procedure sqlite3_reset_auto_extension; cdecl; external libsqlite;

type
  Psqlite3_vtab = type Pointer;
  PPsqlite3_vtab = ^Psqlite3_vtab;
  Psqlite3_vtab_cursor = type Pointer;
  PPsqlite3_vtab_cursor = ^Psqlite3_vtab_cursor;

  TxFind_func = procedure(para1: Psqlite3_context; para2: longint; para3: PPsqlite3_value); cdecl;

  Psqlite3_index_info = ^Tsqlite3_index_info;

  Tsqlite3_module = record
    iVersion: longint;
    xCreate: function(para1: Psqlite3; pAux: pointer; argc: longint; argv: PPchar; ppVTab: PPsqlite3_vtab;
      para6: PPchar): longint; cdecl;
    xConnect: function(para1: Psqlite3; pAux: pointer; argc: longint; argv: PPchar; ppVTab: PPsqlite3_vtab;
      para6: PPchar): longint; cdecl;
    xBestIndex: function(pVTab: Psqlite3_vtab; para2: Psqlite3_index_info): longint; cdecl;
    xDisconnect: function(pVTab: Psqlite3_vtab): longint; cdecl;
    xDestroy: function(pVTab: Psqlite3_vtab): longint; cdecl;
    xOpen: function(pVTab: Psqlite3_vtab; ppCursor: PPsqlite3_vtab_cursor): longint; cdecl;
    xClose: function(para1: Psqlite3_vtab_cursor): longint; cdecl;
    xFilter: function(para1: Psqlite3_vtab_cursor; idxNum: longint; idxStr: pchar; argc: longint; argv: PPsqlite3_value): longint; cdecl;
    xNext: function(para1: Psqlite3_vtab_cursor): longint; cdecl;
    xEof: function(para1: Psqlite3_vtab_cursor): longint; cdecl;
    xColumn: function(para1: Psqlite3_vtab_cursor; para2: Psqlite3_context; para3: longint): longint; cdecl;
    xRowid: function(para1: Psqlite3_vtab_cursor; pRowid: Psqlite3_int64): longint; cdecl;
    xUpdate: function(para1: Psqlite3_vtab; para2: longint; para3: PPsqlite3_value; para4: Psqlite3_int64): longint; cdecl;
    xBegin: function(pVTab: Psqlite3_vtab): longint; cdecl;
    xSync: function(pVTab: Psqlite3_vtab): longint; cdecl;
    xCommit: function(pVTab: Psqlite3_vtab): longint; cdecl;
    xRollback: function(pVTab: Psqlite3_vtab): longint; cdecl;
    xFindFunction: function(pVtab: Psqlite3_vtab; nArg: longint; zName: pchar; pxFunc: TxFind_func; ppArg: Ppointer): longint; cdecl;
    xRename: function(pVtab: Psqlite3_vtab; zNew: pchar): longint; cdecl;
    xSavepoint: function(pVTab: Psqlite3_vtab; para2: longint): longint; cdecl;
    xRelease: function(pVTab: Psqlite3_vtab; para2: longint): longint; cdecl;
    xRollbackTo: function(pVTab: Psqlite3_vtab; para2: longint): longint; cdecl;
    xShadowName: function(para1: pchar): longint; cdecl;
    xIntegrity: function(pVTab: Psqlite3_vtab; zSchema: pchar; zTabName: pchar; mFlags: longint; pzErr: PPchar): longint; cdecl;
  end;
  Psqlite3_module = ^Tsqlite3_module;

  PSQLite3IndexConstraint = ^TSQLite3IndexConstraint;

  TSQLite3IndexConstraint = record
    iColumn: integer;
    op: uint8;
    usable: uint8;
    iTermOffset: integer;
  end;

  PSQLite3IndexOrderBy = ^TSQLite3IndexOrderBy;

  TSQLite3IndexOrderBy = record
    iColumn: integer;
    desc: uint8;
  end;

  PSQLite3IndexConstraintUsage = ^TSQLite3IndexConstraintUsage;

  TSQLite3IndexConstraintUsage = record
    argvIndex: integer;
    omit: uint8;
  end;

  Tsqlite3_index_info = record
    nConstraint: longint;
    aConstraint: PSQLite3IndexConstraint;
    nOrderBy: longint;
    aOrderBy: PSQLite3IndexOrderBy;
    aConstraintUsage: PSQLite3IndexConstraintUsage;
    idxNum: longint;
    idxStr: pchar;
    needToFreeIdxStr: longint;
    orderByConsumed: longint;
    estimatedCost: double;
    estimatedRows: Tsqlite3_int64;
    idxFlags: longint;
    colUsed: Tsqlite3_uint64;
  end;

  Tsqlite3_vtab = record
    pModule: Psqlite3_module;
    nRef: longint;
    zErrMsg: pchar;
  end;

  Tsqlite3_vtab_cursor = record
    pVtab: Psqlite3_vtab;
  end;

const
  SQLITE_INDEX_SCAN_UNIQUE = 1;
  SQLITE_INDEX_CONSTRAINT_EQ = 2;
  SQLITE_INDEX_CONSTRAINT_GT = 4;
  SQLITE_INDEX_CONSTRAINT_LE = 8;
  SQLITE_INDEX_CONSTRAINT_LT = 16;
  SQLITE_INDEX_CONSTRAINT_GE = 32;
  SQLITE_INDEX_CONSTRAINT_MATCH = 64;
  SQLITE_INDEX_CONSTRAINT_LIKE = 65;
  SQLITE_INDEX_CONSTRAINT_GLOB = 66;
  SQLITE_INDEX_CONSTRAINT_REGEXP = 67;
  SQLITE_INDEX_CONSTRAINT_NE = 68;
  SQLITE_INDEX_CONSTRAINT_ISNOT = 69;
  SQLITE_INDEX_CONSTRAINT_ISNOTNULL = 70;
  SQLITE_INDEX_CONSTRAINT_ISNULL = 71;
  SQLITE_INDEX_CONSTRAINT_IS = 72;
  SQLITE_INDEX_CONSTRAINT_LIMIT = 73;
  SQLITE_INDEX_CONSTRAINT_OFFSET = 74;
  SQLITE_INDEX_CONSTRAINT_FUNCTION = 150;

function sqlite3_create_module(db: Psqlite3; zName: pchar; p: Psqlite3_module; pClientData: pointer): longint; cdecl; external libsqlite;
function sqlite3_create_module_v2(db: Psqlite3; zName: pchar; p: Psqlite3_module; pClientData: pointer; xDestroy: TPointer_func): longint; cdecl; external libsqlite;
function sqlite3_drop_modules(db: Psqlite3; azKeep: PPchar): longint; cdecl; external libsqlite;

function sqlite3_declare_vtab(para1: Psqlite3; zSQL: pchar): longint; cdecl; external libsqlite;
function sqlite3_overload_function(para1: Psqlite3; zFuncName: pchar; nArg: longint): longint; cdecl; external libsqlite;

type
  Psqlite3_blob = type Pointer;
  PPsqlite3_blob = ^Psqlite3_blob;

function sqlite3_blob_open(para1: Psqlite3; zDb: pchar; zTable: pchar; zColumn: pchar; iRow: Tsqlite3_int64;
  flags: longint; ppBlob: PPsqlite3_blob): longint; cdecl; external libsqlite;
function sqlite3_blob_reopen(para1: Psqlite3_blob; para2: Tsqlite3_int64): longint; cdecl; external libsqlite;
function sqlite3_blob_close(para1: Psqlite3_blob): longint; cdecl; external libsqlite;
function sqlite3_blob_bytes(para1: Psqlite3_blob): longint; cdecl; external libsqlite;
function sqlite3_blob_read(para1: Psqlite3_blob; Z: pointer; N: longint; iOffset: longint): longint; cdecl; external libsqlite;
function sqlite3_blob_write(para1: Psqlite3_blob; z: pointer; n: longint; iOffset: longint): longint; cdecl; external libsqlite;
function sqlite3_vfs_find(zVfsName: pchar): Psqlite3_vfs; cdecl; external libsqlite;
function sqlite3_vfs_register(para1: Psqlite3_vfs; makeDflt: longint): longint; cdecl; external libsqlite;
function sqlite3_vfs_unregister(para1: Psqlite3_vfs): longint; cdecl; external libsqlite;

function sqlite3_mutex_alloc(para1: longint): Psqlite3_mutex; cdecl; external libsqlite;
procedure sqlite3_mutex_free(para1: Psqlite3_mutex); cdecl; external libsqlite;
procedure sqlite3_mutex_enter(para1: Psqlite3_mutex); cdecl; external libsqlite;
function sqlite3_mutex_try(para1: Psqlite3_mutex): longint; cdecl; external libsqlite;
procedure sqlite3_mutex_leave(para1: Psqlite3_mutex); cdecl; external libsqlite;

type
  Tsqlite3_mutex_methods = record
    xMutexInit: function: longint; cdecl;
    xMutexEnd: function: longint; cdecl;
    xMutexAlloc: function(para1: longint): Psqlite3_mutex; cdecl;
    xMutexFree: procedure(para1: Psqlite3_mutex); cdecl;
    xMutexEnter: procedure(para1: Psqlite3_mutex); cdecl;
    xMutexTry: function(para1: Psqlite3_mutex): longint; cdecl;
    xMutexLeave: procedure(para1: Psqlite3_mutex); cdecl;
    xMutexHeld: function(para1: Psqlite3_mutex): longint; cdecl;
    xMutexNotheld: function(para1: Psqlite3_mutex): longint; cdecl;
  end;
  Psqlite3_mutex_methods = ^Tsqlite3_mutex_methods;

function sqlite3_mutex_held(para1: Psqlite3_mutex): longint; cdecl; external libsqlite;
function sqlite3_mutex_notheld(para1: Psqlite3_mutex): longint; cdecl; external libsqlite;

const
  SQLITE_MUTEX_FAST = 0;
  SQLITE_MUTEX_RECURSIVE = 1;
  SQLITE_MUTEX_STATIC_MAIN = 2;
  SQLITE_MUTEX_STATIC_MEM = 3;
  SQLITE_MUTEX_STATIC_MEM2 = 4;
  SQLITE_MUTEX_STATIC_OPEN = 4;
  SQLITE_MUTEX_STATIC_PRNG = 5;
  SQLITE_MUTEX_STATIC_LRU = 6;
  SQLITE_MUTEX_STATIC_LRU2 = 7;
  SQLITE_MUTEX_STATIC_PMEM = 7;
  SQLITE_MUTEX_STATIC_APP1 = 8;
  SQLITE_MUTEX_STATIC_APP2 = 9;
  SQLITE_MUTEX_STATIC_APP3 = 10;
  SQLITE_MUTEX_STATIC_VFS1 = 11;
  SQLITE_MUTEX_STATIC_VFS2 = 12;
  SQLITE_MUTEX_STATIC_VFS3 = 13;
  SQLITE_MUTEX_STATIC_MASTER = 2;

function sqlite3_db_mutex(para1: Psqlite3): Psqlite3_mutex; cdecl; external libsqlite;
function sqlite3_file_control(para1: Psqlite3; zDbName: pchar; op: longint; para4: pointer): longint; cdecl; external libsqlite;
function sqlite3_test_control(op: longint): longint; cdecl; varargs; external libsqlite;

const
  SQLITE_TESTCTRL_FIRST = 5;
  SQLITE_TESTCTRL_PRNG_SAVE = 5;
  SQLITE_TESTCTRL_PRNG_RESTORE = 6;
  SQLITE_TESTCTRL_PRNG_RESET = 7;
  SQLITE_TESTCTRL_FK_NO_ACTION = 7;
  SQLITE_TESTCTRL_BITVEC_TEST = 8;
  SQLITE_TESTCTRL_FAULT_INSTALL = 9;
  SQLITE_TESTCTRL_BENIGN_MALLOC_HOOKS = 10;
  SQLITE_TESTCTRL_PENDING_BYTE = 11;
  SQLITE_TESTCTRL_ASSERT = 12;
  SQLITE_TESTCTRL_ALWAYS = 13;
  SQLITE_TESTCTRL_RESERVE = 14;
  SQLITE_TESTCTRL_JSON_SELFCHECK = 14;
  SQLITE_TESTCTRL_OPTIMIZATIONS = 15;
  SQLITE_TESTCTRL_ISKEYWORD = 16;
  SQLITE_TESTCTRL_SCRATCHMALLOC = 17;
  SQLITE_TESTCTRL_INTERNAL_FUNCTIONS = 17;
  SQLITE_TESTCTRL_LOCALTIME_FAULT = 18;
  SQLITE_TESTCTRL_EXPLAIN_STMT = 19;
  SQLITE_TESTCTRL_ONCE_RESET_THRESHOLD = 19;
  SQLITE_TESTCTRL_NEVER_CORRUPT = 20;
  SQLITE_TESTCTRL_VDBE_COVERAGE = 21;
  SQLITE_TESTCTRL_BYTEORDER = 22;
  SQLITE_TESTCTRL_ISINIT = 23;
  SQLITE_TESTCTRL_SORTER_MMAP = 24;
  SQLITE_TESTCTRL_IMPOSTER = 25;
  SQLITE_TESTCTRL_PARSER_COVERAGE = 26;
  SQLITE_TESTCTRL_RESULT_INTREAL = 27;
  SQLITE_TESTCTRL_PRNG_SEED = 28;
  SQLITE_TESTCTRL_EXTRA_SCHEMA_CHECKS = 29;
  SQLITE_TESTCTRL_SEEK_COUNT = 30;
  SQLITE_TESTCTRL_TRACEFLAGS = 31;
  SQLITE_TESTCTRL_TUNE = 32;
  SQLITE_TESTCTRL_LOGEST = 33;
  SQLITE_TESTCTRL_USELONGDOUBLE = 34;
  SQLITE_TESTCTRL_LAST = 34;

function sqlite3_keyword_count: longint; cdecl; external libsqlite;
function sqlite3_keyword_name(para1: longint; para2: PPchar; para3: Plongint): longint; cdecl; external libsqlite;
function sqlite3_keyword_check(para1: pchar; para2: longint): longint; cdecl; external libsqlite;

type
  Psqlite3_str = type Pointer;

function sqlite3_str_new(para1: Psqlite3): Psqlite3_str; cdecl; external libsqlite;
function sqlite3_str_finish(para1: Psqlite3_str): pchar; cdecl; external libsqlite;
procedure sqlite3_str_appendf(para1: Psqlite3_str; zFormat: pchar); cdecl; varargs; external libsqlite;
procedure sqlite3_str_vappendf(para1: Psqlite3_str; zFormat: pchar; para3: Tva_list); cdecl; external libsqlite;
procedure sqlite3_str_append(para1: Psqlite3_str; zIn: pchar; N: longint); cdecl; external libsqlite;
procedure sqlite3_str_appendall(para1: Psqlite3_str; zIn: pchar); cdecl; external libsqlite;
procedure sqlite3_str_appendchar(para1: Psqlite3_str; N: longint; C: char); cdecl; external libsqlite;
procedure sqlite3_str_reset(para1: Psqlite3_str); cdecl; external libsqlite;
function sqlite3_str_errcode(para1: Psqlite3_str): longint; cdecl; external libsqlite;
function sqlite3_str_length(para1: Psqlite3_str): longint; cdecl; external libsqlite;
function sqlite3_str_value(para1: Psqlite3_str): pchar; cdecl; external libsqlite;

function sqlite3_status(op: longint; pCurrent: Plongint; pHighwater: Plongint; resetFlag: longint): longint; cdecl; external libsqlite;
function sqlite3_status64(op: longint; pCurrent: Psqlite3_int64; pHighwater: Psqlite3_int64; resetFlag: longint): longint; cdecl; external libsqlite;

const
  SQLITE_STATUS_MEMORY_USED = 0;
  SQLITE_STATUS_PAGECACHE_USED = 1;
  SQLITE_STATUS_PAGECACHE_OVERFLOW = 2;
  SQLITE_STATUS_SCRATCH_USED = 3;
  SQLITE_STATUS_SCRATCH_OVERFLOW = 4;
  SQLITE_STATUS_MALLOC_SIZE = 5;
  SQLITE_STATUS_PARSER_STACK = 6;
  SQLITE_STATUS_PAGECACHE_SIZE = 7;
  SQLITE_STATUS_SCRATCH_SIZE = 8;
  SQLITE_STATUS_MALLOC_COUNT = 9;

function sqlite3_db_status(para1: Psqlite3; op: longint; pCur: Plongint; pHiwtr: Plongint; resetFlg: longint): longint; cdecl; external libsqlite;

const
  SQLITE_DBSTATUS_LOOKASIDE_USED = 0;
  SQLITE_DBSTATUS_CACHE_USED = 1;
  SQLITE_DBSTATUS_SCHEMA_USED = 2;
  SQLITE_DBSTATUS_STMT_USED = 3;
  SQLITE_DBSTATUS_LOOKASIDE_HIT = 4;
  SQLITE_DBSTATUS_LOOKASIDE_MISS_SIZE = 5;
  SQLITE_DBSTATUS_LOOKASIDE_MISS_FULL = 6;
  SQLITE_DBSTATUS_CACHE_HIT = 7;
  SQLITE_DBSTATUS_CACHE_MISS = 8;
  SQLITE_DBSTATUS_CACHE_WRITE = 9;
  SQLITE_DBSTATUS_DEFERRED_FKS = 10;
  SQLITE_DBSTATUS_CACHE_USED_SHARED = 11;
  SQLITE_DBSTATUS_CACHE_SPILL = 12;
  SQLITE_DBSTATUS_MAX = 12;

function sqlite3_stmt_status(para1: Psqlite3_stmt; op: longint; resetFlg: longint): longint; cdecl; external libsqlite;

const
  SQLITE_STMTSTATUS_FULLSCAN_STEP = 1;
  SQLITE_STMTSTATUS_SORT = 2;
  SQLITE_STMTSTATUS_AUTOINDEX = 3;
  SQLITE_STMTSTATUS_VM_STEP = 4;
  SQLITE_STMTSTATUS_REPREPARE = 5;
  SQLITE_STMTSTATUS_RUN = 6;
  SQLITE_STMTSTATUS_FILTER_MISS = 7;
  SQLITE_STMTSTATUS_FILTER_HIT = 8;
  SQLITE_STMTSTATUS_MEMUSED = 99;

type
  Psqlite3_pcache = type Pointer;

  Tsqlite3_pcache_page = record
    pBuf: pointer;
    pExtra: pointer;
  end;
  Psqlite3_pcache_page = ^Tsqlite3_pcache_page;

  Tsqlite3_pcache_methods2 = record
    iVersion: longint;
    pArg: pointer;
    xInit: function(para1: pointer): longint; cdecl;
    xShutdown: procedure(para1: pointer); cdecl;
    xCreate: function(szPage: longint; szExtra: longint; bPurgeable: longint): Psqlite3_pcache; cdecl;
    xCachesize: procedure(para1: Psqlite3_pcache; nCachesize: longint); cdecl;
    xPagecount: function(para1: Psqlite3_pcache): longint; cdecl;
    xFetch: function(para1: Psqlite3_pcache; key: dword; createFlag: longint): Psqlite3_pcache_page; cdecl;
    xUnpin: procedure(para1: Psqlite3_pcache; para2: Psqlite3_pcache_page; discard: longint); cdecl;
    xRekey: procedure(para1: Psqlite3_pcache; para2: Psqlite3_pcache_page; oldKey: dword; newKey: dword); cdecl;
    xTruncate: procedure(para1: Psqlite3_pcache; iLimit: dword); cdecl;
    xDestroy: procedure(para1: Psqlite3_pcache); cdecl;
    xShrink: procedure(para1: Psqlite3_pcache); cdecl;
  end;
  Psqlite3_pcache_methods2 = ^Tsqlite3_pcache_methods2;

  Tsqlite3_pcache_methods = record
    pArg: pointer;
    xInit: function(para1: pointer): longint; cdecl;
    xShutdown: procedure(para1: pointer); cdecl;
    xCreate: function(szPage: longint; bPurgeable: longint): Psqlite3_pcache; cdecl;
    xCachesize: procedure(para1: Psqlite3_pcache; nCachesize: longint); cdecl;
    xPagecount: function(para1: Psqlite3_pcache): longint; cdecl;
    xFetch: function(para1: Psqlite3_pcache; key: dword; createFlag: longint): pointer; cdecl;
    xUnpin: procedure(para1: Psqlite3_pcache; para2: pointer; discard: longint); cdecl;
    xRekey: procedure(para1: Psqlite3_pcache; para2: pointer; oldKey: dword; newKey: dword); cdecl;
    xTruncate: procedure(para1: Psqlite3_pcache; iLimit: dword); cdecl;
    xDestroy: procedure(para1: Psqlite3_pcache); cdecl;
  end;
  Psqlite3_pcache_methods = ^Tsqlite3_pcache_methods;

  Psqlite3_backup = type Pointer;

function sqlite3_backup_init(pDest: Psqlite3; zDestName: pchar; pSource: Psqlite3; zSourceName: pchar): Psqlite3_backup; cdecl; external libsqlite;
function sqlite3_backup_step(p: Psqlite3_backup; nPage: longint): longint; cdecl; external libsqlite;
function sqlite3_backup_finish(p: Psqlite3_backup): longint; cdecl; external libsqlite;
function sqlite3_backup_remaining(p: Psqlite3_backup): longint; cdecl; external libsqlite;
function sqlite3_backup_pagecount(p: Psqlite3_backup): longint; cdecl; external libsqlite;

type
  Tunlock_notify_func = procedure(apArg: Ppointer; nArg: longint); cdecl;

function sqlite3_unlock_notify(pBlocked: Psqlite3; xNotify: Tunlock_notify_func; pNotifyArg: pointer): longint; cdecl; external libsqlite;

function sqlite3_stricmp(para1: pchar; para2: pchar): longint; cdecl; external libsqlite;
function sqlite3_strnicmp(para1: pchar; para2: pchar; para3: longint): longint; cdecl; external libsqlite;
function sqlite3_strglob(zGlob: pchar; zStr: pchar): longint; cdecl; external libsqlite;
function sqlite3_strlike(zGlob: pchar; zStr: pchar; cEsc: dword): longint; cdecl; external libsqlite;
procedure sqlite3_log(iErrCode: longint; zFormat: pchar); cdecl; varargs; external libsqlite;

type
  Twal_hook_func = function(para1: pointer; para2: Psqlite3; para3: pchar; para4: longint): longint; cdecl;

function sqlite3_wal_hook(para1: Psqlite3; para2: Twal_hook_func; para3: pointer): pointer; cdecl; external libsqlite;
function sqlite3_wal_autocheckpoint(db: Psqlite3; N: longint): longint; cdecl; external libsqlite;
function sqlite3_wal_checkpoint(db: Psqlite3; zDb: pchar): longint; cdecl; external libsqlite;
function sqlite3_wal_checkpoint_v2(db: Psqlite3; zDb: pchar; eMode: longint; pnLog: Plongint; pnCkpt: Plongint): longint; cdecl; external libsqlite;

const
  SQLITE_CHECKPOINT_PASSIVE = 0;
  SQLITE_CHECKPOINT_FULL = 1;
  SQLITE_CHECKPOINT_RESTART = 2;
  SQLITE_CHECKPOINT_TRUNCATE = 3;

function sqlite3_vtab_config(para1: Psqlite3; op: longint): longint; cdecl; varargs; external libsqlite;

const
  SQLITE_VTAB_CONSTRAINT_SUPPORT = 1;
  SQLITE_VTAB_INNOCUOUS = 2;
  SQLITE_VTAB_DIRECTONLY = 3;
  SQLITE_VTAB_USES_ALL_SCHEMAS = 4;

function sqlite3_vtab_on_conflict(para1: Psqlite3): longint; cdecl; external libsqlite;
function sqlite3_vtab_nochange(para1: Psqlite3_context): longint; cdecl; external libsqlite;
function sqlite3_vtab_collation(para1: Psqlite3_index_info; para2: longint): pchar; cdecl; external libsqlite;
function sqlite3_vtab_distinct(para1: Psqlite3_index_info): longint; cdecl; external libsqlite;
function sqlite3_vtab_in(para1: Psqlite3_index_info; iCons: longint; bHandle: longint): longint; cdecl; external libsqlite;
function sqlite3_vtab_in_first(pVal: Psqlite3_value; ppOut: PPsqlite3_value): longint; cdecl; external libsqlite;
function sqlite3_vtab_in_next(pVal: Psqlite3_value; ppOut: PPsqlite3_value): longint; cdecl; external libsqlite;
function sqlite3_vtab_rhs_value(para1: Psqlite3_index_info; para2: longint; ppVal: PPsqlite3_value): longint; cdecl; external libsqlite;

const
  SQLITE_ROLLBACK = 1;
  SQLITE_FAIL = 3;
  SQLITE_REPLACE = 5;

  SQLITE_SCANSTAT_NLOOP = 0;
  SQLITE_SCANSTAT_NVISIT = 1;
  SQLITE_SCANSTAT_EST = 2;
  SQLITE_SCANSTAT_NAME = 3;
  SQLITE_SCANSTAT_EXPLAIN = 4;
  SQLITE_SCANSTAT_SELECTID = 5;
  SQLITE_SCANSTAT_PARENTID = 6;
  SQLITE_SCANSTAT_NCYCLE = 7;

function sqlite3_stmt_scanstatus(pStmt: Psqlite3_stmt; idx: longint; iScanStatusOp: longint; pOut: pointer): longint; cdecl; external libsqlite;
function sqlite3_stmt_scanstatus_v2(pStmt: Psqlite3_stmt; idx: longint; iScanStatusOp: longint; flags: longint; pOut: pointer): longint; cdecl; external libsqlite;

const
  SQLITE_SCANSTAT_COMPLEX = $0001;

procedure sqlite3_stmt_scanstatus_reset(para1: Psqlite3_stmt); cdecl; external libsqlite;
function sqlite3_db_cacheflush(para1: Psqlite3): longint; cdecl; external libsqlite;

type
  Tpreupdate_hook_func = procedure(pCtx: pointer; db: Psqlite3; op: longint; zDb: pchar; zName: pchar;
    iKey1: Tsqlite3_int64; iKey2: Tsqlite3_int64); cdecl;

function sqlite3_preupdate_hook(db: Psqlite3; xPreUpdate: Tpreupdate_hook_func; para3: pointer): pointer; cdecl; external libsqlite;
function sqlite3_preupdate_old(para1: Psqlite3; para2: longint; para3: PPsqlite3_value): longint; cdecl; external libsqlite;
function sqlite3_preupdate_count(para1: Psqlite3): longint; cdecl; external libsqlite;
function sqlite3_preupdate_depth(para1: Psqlite3): longint; cdecl; external libsqlite;
function sqlite3_preupdate_new(para1: Psqlite3; para2: longint; para3: PPsqlite3_value): longint; cdecl; external libsqlite;
function sqlite3_preupdate_blobwrite(para1: Psqlite3): longint; cdecl; external libsqlite;

function sqlite3_system_errno(para1: Psqlite3): longint; cdecl; external libsqlite;

type
  Tsqlite3_snapshot = record
    hidden: array[0..47] of byte;
  end;
  Psqlite3_snapshot = ^Tsqlite3_snapshot;
  PPsqlite3_snapshot = ^Psqlite3_snapshot;

function sqlite3_snapshot_get(db: Psqlite3; zSchema: pchar; ppSnapshot: PPsqlite3_snapshot): longint; cdecl; external libsqlite;
function sqlite3_snapshot_open(db: Psqlite3; zSchema: pchar; pSnapshot: Psqlite3_snapshot): longint; cdecl; external libsqlite;
procedure sqlite3_snapshot_free(para1: Psqlite3_snapshot); cdecl; external libsqlite;
function sqlite3_snapshot_cmp(p1: Psqlite3_snapshot; p2: Psqlite3_snapshot): longint; cdecl; external libsqlite;
function sqlite3_snapshot_recover(db: Psqlite3; zDb: pchar): longint; cdecl; external libsqlite;

function sqlite3_serialize(db: Psqlite3; zSchema: pchar; piSize: Psqlite3_int64; mFlags: dword): pbyte; cdecl; external libsqlite;

const
  SQLITE_SERIALIZE_NOCOPY = $001;

function sqlite3_deserialize(db: Psqlite3; zSchema: pchar; pData: pbyte; szDb: Tsqlite3_int64; szBuf: Tsqlite3_int64;
  mFlags: dword): longint; cdecl; external libsqlite;

const
  SQLITE_DESERIALIZE_FREEONCLOSE = 1;
  SQLITE_DESERIALIZE_RESIZEABLE = 2;
  SQLITE_DESERIALIZE_READONLY = 4;

const
  SQLITE_WASI = 1;
  SQLITE_OMIT_WAL = 1;
  SQLITE_THREADSAFE = 0;

type
  Psqlite3_rtree_dbl = ^Tsqlite3_rtree_dbl;
  Tsqlite3_rtree_dbl = double;

type
  Tsqlite3_rtree_geometry = record
    pContext: pointer;
    nParam: longint;
    aParam: Psqlite3_rtree_dbl;
    pUser: pointer;
    xDelUser: procedure(para1: pointer); cdecl;
  end;
  Psqlite3_rtree_geometry = ^Tsqlite3_rtree_geometry;

type
  Psqlite3_rtree_query_info = ^Tsqlite3_rtree_query_info;

  Tsqlite3_rtree_query_info = record
    pContext: pointer;
    nParam: longint;
    aParam: Psqlite3_rtree_dbl;
    pUser: pointer;
    xDelUser: procedure(para1: pointer); cdecl;
    aCoord: Psqlite3_rtree_dbl;
    anQueue: Pdword;
    nCoord: longint;
    iLevel: longint;
    mxLevel: longint;
    iRowid: Tsqlite3_int64;
    rParentScore: Tsqlite3_rtree_dbl;
    eParentWithin: longint;
    eWithin: longint;
    rScore: Tsqlite3_rtree_dbl;
    apSqlParam: ^Psqlite3_value;
  end;

  Trtree_geometry_func = function(para1: Psqlite3_rtree_geometry; para2: longint; para3: Psqlite3_rtree_dbl; para4: Plongint): longint; cdecl;
  Trtree_query_func = function(para1: Psqlite3_rtree_query_info): longint; cdecl;

function sqlite3_rtree_geometry_callback(db: Psqlite3; zGeom: pchar; xGeom: Trtree_geometry_func; pContext: pointer): longint; cdecl; external libsqlite;
function sqlite3_rtree_query_callback(db: Psqlite3; zQueryFunc: pchar; xQueryFunc: Trtree_query_func; pContext: pointer; xDestructor: TPointer_func): longint; cdecl; external libsqlite;

const
  NOT_WITHIN = 0;
  PARTLY_WITHIN = 1;
  FULLY_WITHIN = 2;

type
  Psqlite3_session = type Pointer;
  PPsqlite3_session = ^Psqlite3_session;
  Psqlite3_changeset_iter = type Pointer;
  PPsqlite3_changeset_iter = ^Psqlite3_changeset_iter;

function sqlite3session_create(db: Psqlite3; zDb: pchar; ppSession: PPsqlite3_session): longint; cdecl; external libsqlite;
procedure sqlite3session_delete(pSession: Psqlite3_session); cdecl; external libsqlite;
function sqlite3session_object_config(para1: Psqlite3_session; op: longint; pArg: pointer): longint; cdecl; external libsqlite;

const
  SQLITE_SESSION_OBJCONFIG_SIZE = 1;
  SQLITE_SESSION_OBJCONFIG_ROWID = 2;

function sqlite3session_enable(pSession: Psqlite3_session; bEnable: longint): longint; cdecl; external libsqlite;
function sqlite3session_indirect(pSession: Psqlite3_session; bIndirect: longint): longint; cdecl; external libsqlite;
function sqlite3session_attach(pSession: Psqlite3_session; zTab: pchar): longint; cdecl; external libsqlite;

type
  Ttable_filter_func = function(pCtx: pointer; zTab: pchar): longint;

procedure sqlite3session_table_filter(pSession: Psqlite3_session; xFilter: Ttable_filter_func; pCtx: pointer); cdecl; external libsqlite;
function sqlite3session_changeset(pSession: Psqlite3_session; pnChangeset: Plongint; ppChangeset: Ppointer): longint; cdecl; external libsqlite;
function sqlite3session_changeset_size(pSession: Psqlite3_session): Tsqlite3_int64; cdecl; external libsqlite;
function sqlite3session_diff(pSession: Psqlite3_session; zFromDb: pchar; zTbl: pchar; pzErrMsg: PPchar): longint; cdecl; external libsqlite;
function sqlite3session_patchset(pSession: Psqlite3_session; pnPatchset: Plongint; ppPatchset: Ppointer): longint; cdecl; external libsqlite;
function sqlite3session_isempty(pSession: Psqlite3_session): longint; cdecl; external libsqlite;
function sqlite3session_memory_used(pSession: Psqlite3_session): Tsqlite3_int64; cdecl; external libsqlite;

function sqlite3changeset_start(pp: PPsqlite3_changeset_iter; nChangeset: longint; pChangeset: pointer): longint; cdecl; external libsqlite;
function sqlite3changeset_start_v2(pp: PPsqlite3_changeset_iter; nChangeset: longint; pChangeset: pointer; flags: longint): longint; cdecl; external libsqlite;

const
  SQLITE_CHANGESETSTART_INVERT = $0002;

function sqlite3changeset_next(pIter: Psqlite3_changeset_iter): longint; cdecl; external libsqlite;
function sqlite3changeset_op(pIter: Psqlite3_changeset_iter; pzTab: PPchar; pnCol: Plongint; pOp: Plongint; pbIndirect: Plongint): longint; cdecl; external libsqlite;
function sqlite3changeset_pk(pIter: Psqlite3_changeset_iter; pabPK: PPbyte; pnCol: Plongint): longint; cdecl; external libsqlite;
function sqlite3changeset_old(pIter: Psqlite3_changeset_iter; iVal: longint; ppValue: PPsqlite3_value): longint; cdecl; external libsqlite;
function sqlite3changeset_new(pIter: Psqlite3_changeset_iter; iVal: longint; ppValue: PPsqlite3_value): longint; cdecl; external libsqlite;
function sqlite3changeset_conflict(pIter: Psqlite3_changeset_iter; iVal: longint; ppValue: PPsqlite3_value): longint; cdecl; external libsqlite;
function sqlite3changeset_fk_conflicts(pIter: Psqlite3_changeset_iter; pnOut: Plongint): longint; cdecl; external libsqlite;
function sqlite3changeset_finalize(pIter: Psqlite3_changeset_iter): longint; cdecl; external libsqlite;
function sqlite3changeset_invert(nIn: longint; pIn: pointer; pnOut: Plongint; ppOut: Ppointer): longint; cdecl; external libsqlite;
function sqlite3changeset_concat(nA: longint; pA: pointer; nB: longint; pB: pointer; pnOut: Plongint; ppOut: Ppointer): longint; cdecl; external libsqlite;
function sqlite3changeset_upgrade(db: Psqlite3; zDb: pchar; nIn: longint; pIn: pointer; pnOut: Plongint; ppOut: Ppointer): longint; cdecl; external libsqlite;

type
  Psqlite3_changegroup = type Pointer;
  PPsqlite3_changegroup = ^Psqlite3_changegroup;

function sqlite3changegroup_new(pp: PPsqlite3_changegroup): longint; cdecl; external libsqlite;
function sqlite3changegroup_schema(para1: Psqlite3_changegroup; para2: Psqlite3; zDb: pchar): longint; cdecl; external libsqlite;
function sqlite3changegroup_add(para1: Psqlite3_changegroup; nData: longint; pData: pointer): longint; cdecl; external libsqlite;
function sqlite3changegroup_output(para1: Psqlite3_changegroup; pnData: Plongint; ppData: Ppointer): longint; cdecl; external libsqlite;
procedure sqlite3changegroup_delete(para1: Psqlite3_changegroup); cdecl; external libsqlite;

type
  Tchangeset_apply_func = function(pCtx: pointer; zTab: pchar): longint; cdecl;
  Tchangeset_apply_func2 = function(pCtx: pointer; eConflict: longint; p: Psqlite3_changeset_iter): longint; cdecl;

function sqlite3changeset_apply(db: Psqlite3; nChangeset: longint; pChangeset: pointer; xFilter: Tchangeset_apply_func; xConflict: Tchangeset_apply_func2;
  pCtx: pointer): longint; cdecl; external libsqlite;
function sqlite3changeset_apply_v2(db: Psqlite3; nChangeset: longint; pChangeset: pointer; xFilter: Tchangeset_apply_func; xConflict: Tchangeset_apply_func2;
  pCtx: pointer; ppRebase: Ppointer; pnRebase: Plongint; flags: longint): longint; cdecl; external libsqlite;

const
  SQLITE_CHANGESETAPPLY_NOSAVEPOINT = $0001;
  SQLITE_CHANGESETAPPLY_INVERT = $0002;
  SQLITE_CHANGESETAPPLY_IGNORENOOP = $0004;
  SQLITE_CHANGESETAPPLY_FKNOACTION = $0008;

  SQLITE_CHANGESET_DATA = 1;
  SQLITE_CHANGESET_NOTFOUND = 2;
  SQLITE_CHANGESET_CONFLICT = 3;
  SQLITE_CHANGESET_CONSTRAINT = 4;
  SQLITE_CHANGESET_FOREIGN_KEY = 5;

  SQLITE_CHANGESET_OMIT = 0;
  SQLITE_CHANGESET_REPLACE = 1;
  SQLITE_CHANGESET_ABORT = 2;

type
  Psqlite3_rebaser = type Pointer;
  PPsqlite3_rebaser = ^Psqlite3_rebaser;

function sqlite3rebaser_create(ppNew: PPsqlite3_rebaser): longint; cdecl; external libsqlite;
function sqlite3rebaser_configure(para1: Psqlite3_rebaser; nRebase: longint; pRebase: pointer): longint; cdecl; external libsqlite;
function sqlite3rebaser_rebase(para1: Psqlite3_rebaser; nIn: longint; pIn: pointer; pnOut: Plongint; ppOut: Ppointer): longint; cdecl; external libsqlite;
procedure sqlite3rebaser_delete(p: Psqlite3_rebaser); cdecl; external libsqlite;

type
  Tchangeset_apply_func3 = function(pIn: pointer; pData: pointer; pnData: Plongint): longint; cdecl;
  Tchangeset_apply_func4 = function(pCtx: pointer; zTab: pchar): longint; cdecl;
  Tchangeset_apply_func5 = function(pCtx: pointer; eConflict: longint; p: Psqlite3_changeset_iter): longint; cdecl;
  Tchangeset_apply_func6 = function(pOut: pointer; pData: pointer; nData: longint): longint; cdecl;

function sqlite3changeset_apply_strm(db: Psqlite3; xInput: Tchangeset_apply_func3; pIn: pointer; xFilter: Tchangeset_apply_func4; xConflict: Tchangeset_apply_func5;
  pCtx: pointer): longint; cdecl; external libsqlite;
function sqlite3changeset_apply_v2_strm(db: Psqlite3; xInput: Tchangeset_apply_func3; pIn: pointer; xFilter: Tchangeset_apply_func4; xConflict: Tchangeset_apply_func5;
  pCtx: pointer; ppRebase: Ppointer; pnRebase: Plongint; flags: longint): longint; cdecl; external libsqlite;
function sqlite3changeset_concat_strm(xInputA: Tchangeset_apply_func3; pInA: pointer; xInputB: Tchangeset_apply_func3; pInB: pointer; xOutput: Tchangeset_apply_func6;
  pOut: pointer): longint; cdecl; external libsqlite;
function sqlite3changeset_invert_strm(xInput: Tchangeset_apply_func3; pIn: pointer; xOutput: Tchangeset_apply_func6; pOut: pointer): longint; cdecl; external libsqlite;
function sqlite3changeset_start_strm(pp: PPsqlite3_changeset_iter; xInput: Tchangeset_apply_func3; pIn: pointer): longint; cdecl; external libsqlite;
function sqlite3changeset_start_v2_strm(pp: PPsqlite3_changeset_iter; xInput: Tchangeset_apply_func3; pIn: pointer; flags: longint): longint; cdecl; external libsqlite;
function sqlite3session_changeset_strm(pSession: Psqlite3_session; xOutput: Tchangeset_apply_func6; pOut: pointer): longint; cdecl; external libsqlite;
function sqlite3session_patchset_strm(pSession: Psqlite3_session; xOutput: Tchangeset_apply_func6; pOut: pointer): longint; cdecl; external libsqlite;
function sqlite3changegroup_add_strm(para1: Psqlite3_changegroup; xInput: Tchangeset_apply_func3; pIn: pointer): longint; cdecl; external libsqlite;
function sqlite3changegroup_output_strm(para1: Psqlite3_changegroup; xOutput: Tchangeset_apply_func6; pOut: pointer): longint; cdecl; external libsqlite;
function sqlite3rebaser_rebase_strm(pRebaser: Psqlite3_rebaser; xInput: Tchangeset_apply_func3; pIn: pointer; xOutput: Tchangeset_apply_func6; pOut: pointer): longint; cdecl; external libsqlite;
function sqlite3session_config(op: longint; pArg: pointer): longint; cdecl; external libsqlite;

const
  SQLITE_SESSION_CONFIG_STRMSIZE = 1;

type
  PFts5Context = type Pointer;

  TFts5PhraseIter = record
    a: pbyte;
    b: pbyte;
  end;
  PFts5PhraseIter = ^TFts5PhraseIter;

  PFts5ExtensionApi = ^TFts5ExtensionApi;
  TTokenize_func = function(para1: pointer; para2: longint; para3: pchar; para4: longint; para5: longint; para6: longint): longint; cdecl;
  TQueryPhrase_func = function(para1: PFts5ExtensionApi; para2: PFts5Context; para3: pointer): longint; cdecl;

  TFts5ExtensionApi = record
    iVersion: longint;
    xUserData: function(para1: PFts5Context): pointer; cdecl;
    xColumnCount: function(para1: PFts5Context): longint; cdecl;
    xRowCount: function(para1: PFts5Context; pnRow: Psqlite3_int64): longint; cdecl;
    xColumnTotalSize: function(para1: PFts5Context; iCol: longint; pnToken: Psqlite3_int64): longint; cdecl;
    xTokenize: function(para1: PFts5Context; pText: pchar; nText: longint; pCtx: pointer; xToken: TTokenize_func): longint; cdecl;
    xPhraseCount: function(para1: PFts5Context): longint; cdecl;
    xPhraseSize: function(para1: PFts5Context; iPhrase: longint): longint; cdecl;
    xInstCount: function(para1: PFts5Context; pnInst: Plongint): longint; cdecl;
    xInst: function(para1: PFts5Context; iIdx: longint; piPhrase: Plongint; piCol: Plongint; piOff: Plongint): longint; cdecl;
    xRowid: function(para1: PFts5Context): Tsqlite3_int64; cdecl;
    xColumnText: function(para1: PFts5Context; iCol: longint; pz: PPchar; pn: Plongint): longint; cdecl;
    xColumnSize: function(para1: PFts5Context; iCol: longint; pnToken: Plongint): longint; cdecl;
    xQueryPhrase: function(para1: PFts5Context; iPhrase: longint; pUserData: pointer; para4: TQueryPhrase_func): longint; cdecl;
    xSetAuxdata: function(para1: PFts5Context; pAux: pointer; xDelete: TPointer_func): longint; cdecl;
    xGetAuxdata: function(para1: PFts5Context; bClear: longint): pointer; cdecl;
    xPhraseFirst: function(para1: PFts5Context; iPhrase: longint; para3: PFts5PhraseIter; para4: Plongint; para5: Plongint): longint; cdecl;
    xPhraseNext: procedure(para1: PFts5Context; para2: PFts5PhraseIter; piCol: Plongint; piOff: Plongint); cdecl;
    xPhraseFirstColumn: function(para1: PFts5Context; iPhrase: longint; para3: PFts5PhraseIter; para4: Plongint): longint; cdecl;
    xPhraseNextColumn: procedure(para1: PFts5Context; para2: PFts5PhraseIter; piCol: Plongint); cdecl;
    xQueryToken: function(para1: PFts5Context; iPhrase: longint; iToken: longint; ppToken: PPchar; pnToken: Plongint): longint; cdecl;
    xInstToken: function(para1: PFts5Context; iIdx: longint; iToken: longint; para4: PPchar; para5: Plongint): longint; cdecl;
  end;

  PFts5Tokenizer = type Pointer;
  PPFts5Tokenizer = ^PFts5Tokenizer;

  Tfts5_extension_function = procedure(pApi: PFts5ExtensionApi; pFts: PFts5Context; pCtx: Psqlite3_context; nVal: longint; apVal: PPsqlite3_value); cdecl;
  TxToken_func = function(pCtx: pointer; tflags: longint; pToken: pchar; nToken: longint; iStart: longint; iEnd: longint): longint; cdecl;

  Tfts5_tokenizer = record
    xCreate: function(para1: pointer; azArg: PPchar; nArg: longint; ppOut: PPFts5Tokenizer): longint; cdecl;
    xDelete: procedure(para1: PFts5Tokenizer); cdecl;
    xTokenize: function(para1: PFts5Tokenizer; pCtx: pointer; flags: longint; pText: pchar; nText: longint;
      xToken: TxToken_func): longint; cdecl;
  end;
  Pfts5_tokenizer = ^Tfts5_tokenizer;

const
  FTS5_TOKENIZE_QUERY = $0001;
  FTS5_TOKENIZE_PREFIX = $0002;
  FTS5_TOKENIZE_DOCUMENT = $0004;
  FTS5_TOKENIZE_AUX = $0008;

  FTS5_TOKEN_COLOCATED = $0001;

type
  Pfts5_api = ^Tfts5_api;

  Tfts5_api = record
    iVersion: longint;
    xCreateTokenizer: function(pApi: Pfts5_api; zName: pchar; pUserData: pointer; pTokenizer: Pfts5_tokenizer; xDestroy: TPointer_func): longint; cdecl;
    xFindTokenizer: function(pApi: Pfts5_api; zName: pchar; ppUserData: Ppointer; pTokenizer: Pfts5_tokenizer): longint; cdecl;
    xCreateFunction: function(pApi: Pfts5_api; zName: pchar; pUserData: pointer; xFunction: Tfts5_extension_function; xDestroy: TPointer_func): longint; cdecl;
  end;


implementation



function SQLITE_STATIC: Tsqlite3_destructor_type;
begin
  SQLITE_STATIC := Tsqlite3_destructor_type(0);
end;

function SQLITE_TRANSIENT: Tsqlite3_destructor_type;
begin
  SQLITE_TRANSIENT := Tsqlite3_destructor_type(-(1));
end;


end.
