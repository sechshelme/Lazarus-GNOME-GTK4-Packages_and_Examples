unit fp_physfs;

interface


const
  {$IFDEF Linux}
  libphysfs = 'physfs';
  {$ENDIF}

  {$IFDEF Windows}
  libphysfs = 'libphysfs.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PPHYSFS_uint8 = ^TPHYSFS_uint8;
  TPHYSFS_uint8 = uint8;

  PPHYSFS_sint8 = ^TPHYSFS_sint8;
  TPHYSFS_sint8 = int8;

  PPHYSFS_uint16 = ^TPHYSFS_uint16;
  TPHYSFS_uint16 = uint16;

  PPHYSFS_sint16 = ^TPHYSFS_sint16;
  TPHYSFS_sint16 = int16;

  PPHYSFS_uint32 = ^TPHYSFS_uint32;
  TPHYSFS_uint32 = uint32;

  PPHYSFS_sint32 = ^TPHYSFS_sint32;
  TPHYSFS_sint32 = int32;

  PPHYSFS_uint64 = ^TPHYSFS_uint64;
  TPHYSFS_uint64 = uint64;

  PPHYSFS_sint64 = ^TPHYSFS_sint64;
  TPHYSFS_sint64 = int64;

type
  TPHYSFS_File = record
    opaque: pointer;
  end;
  PPHYSFS_File = ^TPHYSFS_File;

type
  TPHYSFS_ArchiveInfo = record
    extension: pchar;
    description: pchar;
    author: pchar;
    url: pchar;
    supportsSymlinks: longint;
  end;
  PPHYSFS_ArchiveInfo = ^TPHYSFS_ArchiveInfo;
  PPPHYSFS_ArchiveInfo = ^PPHYSFS_ArchiveInfo;

  TPHYSFS_Version = record
    major: TPHYSFS_uint8;
    minor: TPHYSFS_uint8;
    patch: TPHYSFS_uint8;
  end;
  PPHYSFS_Version = ^TPHYSFS_Version;

const
  PHYSFS_VER_MAJOR = 3;
  PHYSFS_VER_MINOR = 0;
  PHYSFS_VER_PATCH = 2;

procedure PHYSFS_getLinkedVersion(ver: PPHYSFS_Version); cdecl; external libphysfs;
function PHYSFS_init(argv0: pchar): longint; cdecl; external libphysfs;
function PHYSFS_deinit: longint; cdecl; external libphysfs;
function PHYSFS_supportedArchiveTypes: PPPHYSFS_ArchiveInfo; cdecl; external libphysfs;
procedure PHYSFS_freeList(listVar: pointer); cdecl; external libphysfs;
function PHYSFS_getLastError: pchar; cdecl; external libphysfs; deprecated;
function PHYSFS_getDirSeparator: pchar; cdecl; external libphysfs;
procedure PHYSFS_permitSymbolicLinks(allow: longint); cdecl; external libphysfs;
function PHYSFS_getCdRomDirs: PPchar; cdecl; external libphysfs;
function PHYSFS_getBaseDir: pchar; cdecl; external libphysfs;
function PHYSFS_getUserDir: pchar; cdecl; external libphysfs; deprecated;
function PHYSFS_getWriteDir: pchar; cdecl; external libphysfs;
function PHYSFS_setWriteDir(newDir: pchar): longint; cdecl; external libphysfs;
function PHYSFS_addToSearchPath(newDir: pchar; appendToPath: longint): longint; cdecl; external libphysfs; deprecated;
function PHYSFS_removeFromSearchPath(oldDir: pchar): longint; cdecl; external libphysfs; deprecated;
function PHYSFS_getSearchPath: PPchar; cdecl; external libphysfs;
function PHYSFS_setSaneConfig(organization: pchar; appName: pchar; archiveExt: pchar; includeCdRoms: longint; archivesFirst: longint): longint; cdecl; external libphysfs;
function PHYSFS_mkdir(dirName: pchar): longint; cdecl; external libphysfs;
function PHYSFS_delete(filename: pchar): longint; cdecl; external libphysfs;
function PHYSFS_getRealDir(filename: pchar): pchar; cdecl; external libphysfs;
function PHYSFS_enumerateFiles(dir: pchar): PPchar; cdecl; external libphysfs;
function PHYSFS_exists(fname: pchar): longint; cdecl; external libphysfs;
function PHYSFS_isDirectory(fname: pchar): longint; cdecl; external libphysfs; deprecated;
function PHYSFS_isSymbolicLink(fname: pchar): longint; cdecl; external libphysfs; deprecated;
function PHYSFS_getLastModTime(filename: pchar): TPHYSFS_sint64; cdecl; external libphysfs; deprecated;
function PHYSFS_openWrite(filename: pchar): PPHYSFS_File; cdecl; external libphysfs;
function PHYSFS_openAppend(filename: pchar): PPHYSFS_File; cdecl; external libphysfs;
function PHYSFS_openRead(filename: pchar): PPHYSFS_File; cdecl; external libphysfs;
function PHYSFS_close(handle: PPHYSFS_File): longint; cdecl; external libphysfs;
function PHYSFS_read(handle: PPHYSFS_File; buffer: pointer; objSize: TPHYSFS_uint32; objCount: TPHYSFS_uint32): TPHYSFS_sint64; cdecl; external libphysfs; deprecated;
function PHYSFS_write(handle: PPHYSFS_File; buffer: pointer; objSize: TPHYSFS_uint32; objCount: TPHYSFS_uint32): TPHYSFS_sint64; cdecl; external libphysfs; deprecated;
function PHYSFS_eof(handle: PPHYSFS_File): longint; cdecl; external libphysfs;
function PHYSFS_tell(handle: PPHYSFS_File): TPHYSFS_sint64; cdecl; external libphysfs;
function PHYSFS_seek(handle: PPHYSFS_File; pos: TPHYSFS_uint64): longint; cdecl; external libphysfs;
function PHYSFS_fileLength(handle: PPHYSFS_File): TPHYSFS_sint64; cdecl; external libphysfs;
function PHYSFS_setBuffer(handle: PPHYSFS_File; bufsize: TPHYSFS_uint64): longint; cdecl; external libphysfs;
function PHYSFS_flush(handle: PPHYSFS_File): longint; cdecl; external libphysfs;
function PHYSFS_swapSLE16(val: TPHYSFS_sint16): TPHYSFS_sint16; cdecl; external libphysfs;
function PHYSFS_swapULE16(val: TPHYSFS_uint16): TPHYSFS_uint16; cdecl; external libphysfs;
function PHYSFS_swapSLE32(val: TPHYSFS_sint32): TPHYSFS_sint32; cdecl; external libphysfs;
function PHYSFS_swapULE32(val: TPHYSFS_uint32): TPHYSFS_uint32; cdecl; external libphysfs;
function PHYSFS_swapSLE64(val: TPHYSFS_sint64): TPHYSFS_sint64; cdecl; external libphysfs;
function PHYSFS_swapULE64(val: TPHYSFS_uint64): TPHYSFS_uint64; cdecl; external libphysfs;
function PHYSFS_swapSBE16(val: TPHYSFS_sint16): TPHYSFS_sint16; cdecl; external libphysfs;
function PHYSFS_swapUBE16(val: TPHYSFS_uint16): TPHYSFS_uint16; cdecl; external libphysfs;
function PHYSFS_swapSBE32(val: TPHYSFS_sint32): TPHYSFS_sint32; cdecl; external libphysfs;
function PHYSFS_swapUBE32(val: TPHYSFS_uint32): TPHYSFS_uint32; cdecl; external libphysfs;
function PHYSFS_swapSBE64(val: TPHYSFS_sint64): TPHYSFS_sint64; cdecl; external libphysfs;
function PHYSFS_swapUBE64(val: TPHYSFS_uint64): TPHYSFS_uint64; cdecl; external libphysfs;
function PHYSFS_readSLE16(file_: PPHYSFS_File; val: PPHYSFS_sint16): longint; cdecl; external libphysfs;
function PHYSFS_readULE16(file_: PPHYSFS_File; val: PPHYSFS_uint16): longint; cdecl; external libphysfs;
function PHYSFS_readSBE16(file_: PPHYSFS_File; val: PPHYSFS_sint16): longint; cdecl; external libphysfs;
function PHYSFS_readUBE16(file_: PPHYSFS_File; val: PPHYSFS_uint16): longint; cdecl; external libphysfs;
function PHYSFS_readSLE32(file_: PPHYSFS_File; val: PPHYSFS_sint32): longint; cdecl; external libphysfs;
function PHYSFS_readULE32(file_: PPHYSFS_File; val: PPHYSFS_uint32): longint; cdecl; external libphysfs;
function PHYSFS_readSBE32(file_: PPHYSFS_File; val: PPHYSFS_sint32): longint; cdecl; external libphysfs;
function PHYSFS_readUBE32(file_: PPHYSFS_File; val: PPHYSFS_uint32): longint; cdecl; external libphysfs;
function PHYSFS_readSLE64(file_: PPHYSFS_File; val: PPHYSFS_sint64): longint; cdecl; external libphysfs;
function PHYSFS_readULE64(file_: PPHYSFS_File; val: PPHYSFS_uint64): longint; cdecl; external libphysfs;
function PHYSFS_readSBE64(file_: PPHYSFS_File; val: PPHYSFS_sint64): longint; cdecl; external libphysfs;
function PHYSFS_readUBE64(file_: PPHYSFS_File; val: PPHYSFS_uint64): longint; cdecl; external libphysfs;
function PHYSFS_writeSLE16(file_: PPHYSFS_File; val: TPHYSFS_sint16): longint; cdecl; external libphysfs;
function PHYSFS_writeULE16(file_: PPHYSFS_File; val: TPHYSFS_uint16): longint; cdecl; external libphysfs;
function PHYSFS_writeSBE16(file_: PPHYSFS_File; val: TPHYSFS_sint16): longint; cdecl; external libphysfs;
function PHYSFS_writeUBE16(file_: PPHYSFS_File; val: TPHYSFS_uint16): longint; cdecl; external libphysfs;
function PHYSFS_writeSLE32(file_: PPHYSFS_File; val: TPHYSFS_sint32): longint; cdecl; external libphysfs;
function PHYSFS_writeULE32(file_: PPHYSFS_File; val: TPHYSFS_uint32): longint; cdecl; external libphysfs;
function PHYSFS_writeSBE32(file_: PPHYSFS_File; val: TPHYSFS_sint32): longint; cdecl; external libphysfs;
function PHYSFS_writeUBE32(file_: PPHYSFS_File; val: TPHYSFS_uint32): longint; cdecl; external libphysfs;
function PHYSFS_writeSLE64(file_: PPHYSFS_File; val: TPHYSFS_sint64): longint; cdecl; external libphysfs;
function PHYSFS_writeULE64(file_: PPHYSFS_File; val: TPHYSFS_uint64): longint; cdecl; external libphysfs;
function PHYSFS_writeSBE64(file_: PPHYSFS_File; val: TPHYSFS_sint64): longint; cdecl; external libphysfs;
function PHYSFS_writeUBE64(file_: PPHYSFS_File; val: TPHYSFS_uint64): longint; cdecl; external libphysfs;
function PHYSFS_isInit: longint; cdecl; external libphysfs;
function PHYSFS_symbolicLinksPermitted: longint; cdecl; external libphysfs;

type
  TPHYSFS_Allocator = record
    Init: function: longint; cdecl;
    Deinit: procedure; cdecl;
    Malloc: function(para1: TPHYSFS_uint64): pointer; cdecl;
    Realloc: function(para1: pointer; para2: TPHYSFS_uint64): pointer; cdecl;
    Free: procedure(para1: pointer); cdecl;
  end;
  PPHYSFS_Allocator = ^TPHYSFS_Allocator;

function PHYSFS_setAllocator(allocator: PPHYSFS_Allocator): longint; cdecl; external libphysfs;
function PHYSFS_mount(newDir: pchar; mountPoint: pchar; appendToPath: longint): longint; cdecl; external libphysfs;
function PHYSFS_getMountPoint(dir: pchar): pchar; cdecl; external libphysfs;

type
  TPHYSFS_StringCallback = procedure(data: pointer; str: pchar); cdecl;
  TPHYSFS_EnumFilesCallback = procedure(data: pointer; origdir: pchar; fname: pchar); cdecl;

procedure PHYSFS_getCdRomDirsCallback(c: TPHYSFS_StringCallback; d: pointer); cdecl; external libphysfs;
procedure PHYSFS_getSearchPathCallback(c: TPHYSFS_StringCallback; d: pointer); cdecl; external libphysfs;
procedure PHYSFS_enumerateFilesCallback(dir: pchar; c: TPHYSFS_EnumFilesCallback; d: pointer); cdecl; external libphysfs; deprecated;
procedure PHYSFS_utf8FromUcs4(src: PPHYSFS_uint32; dst: pchar; len: TPHYSFS_uint64); cdecl; external libphysfs;
procedure PHYSFS_utf8ToUcs4(src: pchar; dst: PPHYSFS_uint32; len: TPHYSFS_uint64); cdecl; external libphysfs;
procedure PHYSFS_utf8FromUcs2(src: PPHYSFS_uint16; dst: pchar; len: TPHYSFS_uint64); cdecl; external libphysfs;
procedure PHYSFS_utf8ToUcs2(src: pchar; dst: PPHYSFS_uint16; len: TPHYSFS_uint64); cdecl; external libphysfs;
procedure PHYSFS_utf8FromLatin1(src: pchar; dst: pchar; len: TPHYSFS_uint64); cdecl; external libphysfs;
function PHYSFS_caseFold(from: TPHYSFS_uint32; to_: PPHYSFS_uint32): longint; cdecl; external libphysfs;
function PHYSFS_utf8stricmp(str1: pchar; str2: pchar): longint; cdecl; external libphysfs;
function PHYSFS_utf16stricmp(str1: PPHYSFS_uint16; str2: PPHYSFS_uint16): longint; cdecl; external libphysfs;
function PHYSFS_ucs4stricmp(str1: PPHYSFS_uint32; str2: PPHYSFS_uint32): longint; cdecl; external libphysfs;

type
  PPHYSFS_EnumerateCallbackResult = ^TPHYSFS_EnumerateCallbackResult;
  TPHYSFS_EnumerateCallbackResult = longint;

const
  PHYSFS_ENUM_ERROR = -(1);
  PHYSFS_ENUM_STOP = 0;
  PHYSFS_ENUM_OK = 1;

type
  TPHYSFS_EnumerateCallback = function(data: pointer; origdir: pchar; fname: pchar): TPHYSFS_EnumerateCallbackResult; cdecl;

function PHYSFS_enumerate(dir: pchar; c: TPHYSFS_EnumerateCallback; d: pointer): longint; cdecl; external libphysfs;
function PHYSFS_unmount(oldDir: pchar): longint; cdecl; external libphysfs;
function PHYSFS_getAllocator: PPHYSFS_Allocator; cdecl; external libphysfs;

type
  PPHYSFS_FileType = ^TPHYSFS_FileType;
  TPHYSFS_FileType = longint;

const
  PHYSFS_FILETYPE_REGULAR = 0;
  PHYSFS_FILETYPE_DIRECTORY = 1;
  PHYSFS_FILETYPE_SYMLINK = 2;
  PHYSFS_FILETYPE_OTHER = 3;

type
  TPHYSFS_Stat = record
    filesize: TPHYSFS_sint64;
    modtime: TPHYSFS_sint64;
    createtime: TPHYSFS_sint64;
    accesstime: TPHYSFS_sint64;
    filetype: TPHYSFS_FileType;
    readonly: longint;
  end;
  PPHYSFS_Stat = ^TPHYSFS_Stat;

function PHYSFS_stat(fname: pchar; stat: PPHYSFS_Stat): longint; cdecl; external libphysfs;
procedure PHYSFS_utf8FromUtf16(src: PPHYSFS_uint16; dst: pchar; len: TPHYSFS_uint64); cdecl; external libphysfs;
procedure PHYSFS_utf8ToUtf16(src: pchar; dst: PPHYSFS_uint16; len: TPHYSFS_uint64); cdecl; external libphysfs;
function PHYSFS_readBytes(handle: PPHYSFS_File; buffer: pointer; len: TPHYSFS_uint64): TPHYSFS_sint64; cdecl; external libphysfs;
function PHYSFS_writeBytes(handle: PPHYSFS_File; buffer: pointer; len: TPHYSFS_uint64): TPHYSFS_sint64; cdecl; external libphysfs;

type
  PPHYSFS_Io = ^TPHYSFS_Io;

  TPHYSFS_Io = record
    version: TPHYSFS_uint32;
    opaque: pointer;
    read: function(io: PPHYSFS_Io; buf: pointer; len: TPHYSFS_uint64): TPHYSFS_sint64; cdecl;
    write: function(io: PPHYSFS_Io; buffer: pointer; len: TPHYSFS_uint64): TPHYSFS_sint64; cdecl;
    seek: function(io: PPHYSFS_Io; offset: TPHYSFS_uint64): longint; cdecl;
    tell: function(io: PPHYSFS_Io): TPHYSFS_sint64; cdecl;
    length: function(io: PPHYSFS_Io): TPHYSFS_sint64; cdecl;
    duplicate: function(io: PPHYSFS_Io): PPHYSFS_Io; cdecl;
    flush: function(io: PPHYSFS_Io): longint; cdecl;
    destroy: procedure(io: PPHYSFS_Io); cdecl;
  end;

  mountMemoryfunc = procedure(para1: pointer); cdecl;

function PHYSFS_mountIo(io: PPHYSFS_Io; newDir: pchar; mountPoint: pchar; appendToPath: longint): longint; cdecl; external libphysfs;
function PHYSFS_mountMemory(buf: pointer; len: TPHYSFS_uint64; del: mountMemoryfunc; newDir: pchar; mountPoint: pchar; appendToPath: longint): longint; cdecl; external libphysfs;
function PHYSFS_mountHandle(file_: PPHYSFS_File; newDir: pchar; mountPoint: pchar; appendToPath: longint): longint; cdecl; external libphysfs;

type
  PPHYSFS_ErrorCode = ^TPHYSFS_ErrorCode;
  TPHYSFS_ErrorCode = longint;

const
  PHYSFS_ERR_OK = 0;
  PHYSFS_ERR_OTHER_ERROR = 1;
  PHYSFS_ERR_OUT_OF_MEMORY = 2;
  PHYSFS_ERR_NOT_INITIALIZED = 3;
  PHYSFS_ERR_IS_INITIALIZED = 4;
  PHYSFS_ERR_ARGV0_IS_NULL = 5;
  PHYSFS_ERR_UNSUPPORTED = 6;
  PHYSFS_ERR_PAST_EOF = 7;
  PHYSFS_ERR_FILES_STILL_OPEN = 8;
  PHYSFS_ERR_INVALID_ARGUMENT = 9;
  PHYSFS_ERR_NOT_MOUNTED = 10;
  PHYSFS_ERR_NOT_FOUND = 11;
  PHYSFS_ERR_SYMLINK_FORBIDDEN = 12;
  PHYSFS_ERR_NO_WRITE_DIR = 13;
  PHYSFS_ERR_OPEN_FOR_READING = 14;
  PHYSFS_ERR_OPEN_FOR_WRITING = 15;
  PHYSFS_ERR_NOT_A_FILE = 16;
  PHYSFS_ERR_READ_ONLY = 17;
  PHYSFS_ERR_CORRUPT = 18;
  PHYSFS_ERR_SYMLINK_LOOP = 19;
  PHYSFS_ERR_IO = 20;
  PHYSFS_ERR_PERMISSION = 21;
  PHYSFS_ERR_NO_SPACE = 22;
  PHYSFS_ERR_BAD_FILENAME = 23;
  PHYSFS_ERR_BUSY = 24;
  PHYSFS_ERR_DIR_NOT_EMPTY = 25;
  PHYSFS_ERR_OS_ERROR = 26;
  PHYSFS_ERR_DUPLICATE = 27;
  PHYSFS_ERR_BAD_PASSWORD = 28;
  PHYSFS_ERR_APP_CALLBACK = 29;

function PHYSFS_getLastErrorCode: TPHYSFS_ErrorCode; cdecl; external libphysfs;
function PHYSFS_getErrorByCode(code: TPHYSFS_ErrorCode): pchar; cdecl; external libphysfs;
procedure PHYSFS_setErrorCode(code: TPHYSFS_ErrorCode); cdecl; external libphysfs;
function PHYSFS_getPrefDir(org: pchar; app: pchar): pchar; cdecl; external libphysfs;

type
  TPHYSFS_Archiver = record
    version: TPHYSFS_uint32;
    info: TPHYSFS_ArchiveInfo;
    openArchive: function(io: PPHYSFS_Io; name: pchar; forWrite: longint; claimed: Plongint): pointer; cdecl;
    enumerate: function(opaque: pointer; dirname: pchar; cb: TPHYSFS_EnumerateCallback; origdir: pchar; callbackdata: pointer): TPHYSFS_EnumerateCallbackResult; cdecl;
    openRead: function(opaque: pointer; fnm: pchar): PPHYSFS_Io; cdecl;
    openWrite: function(opaque: pointer; filename: pchar): PPHYSFS_Io; cdecl;
    openAppend: function(opaque: pointer; filename: pchar): PPHYSFS_Io; cdecl;
    remove: function(opaque: pointer; filename: pchar): longint; cdecl;
    mkdir: function(opaque: pointer; filename: pchar): longint; cdecl;
    stat: function(opaque: pointer; fn: pchar; stat: PPHYSFS_Stat): longint; cdecl;
    closeArchive: procedure(opaque: pointer); cdecl;
  end;
  PPHYSFS_Archiver = ^TPHYSFS_Archiver;

function PHYSFS_registerArchiver(archiver: PPHYSFS_Archiver): longint; cdecl; external libphysfs;
function PHYSFS_deregisterArchiver(ext: pchar): longint; cdecl; external libphysfs;

// === Konventiert am: 2-5-26 15:53:26 ===


implementation



end.
