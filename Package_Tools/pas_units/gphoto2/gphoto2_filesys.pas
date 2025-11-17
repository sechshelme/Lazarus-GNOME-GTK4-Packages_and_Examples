unit gphoto2_filesys;

interface

uses
  fp_glib2, fp_gphoto2, gphoto2_context, gphoto2_file, gphoto2_list;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PCameraFileInfoFields = ^TCameraFileInfoFields;
  TCameraFileInfoFields = longint;

const
  GP_FILE_INFO_NONE = 0;
  GP_FILE_INFO_TYPE = 1 shl 0;
  GP_FILE_INFO_SIZE = 1 shl 2;
  GP_FILE_INFO_WIDTH = 1 shl 3;
  GP_FILE_INFO_HEIGHT = 1 shl 4;
  GP_FILE_INFO_PERMISSIONS = 1 shl 5;
  GP_FILE_INFO_STATUS = 1 shl 6;
  GP_FILE_INFO_MTIME = 1 shl 7;
  GP_FILE_INFO_ALL = $FF;

type
  PCameraFilePermissions = ^TCameraFilePermissions;
  TCameraFilePermissions = longint;

const
  GP_FILE_PERM_NONE = 0;
  GP_FILE_PERM_READ = 1 shl 0;
  GP_FILE_PERM_DELETE = 1 shl 1;
  GP_FILE_PERM_ALL = $FF;

type
  PCameraFileStatus = ^TCameraFileStatus;
  TCameraFileStatus = longint;

const
  GP_FILE_STATUS_NOT_DOWNLOADED = 0;
  GP_FILE_STATUS_DOWNLOADED = 1;

type
  TCameraFileInfoFile = record
    fields: TCameraFileInfoFields;
    status: TCameraFileStatus;
    size: Tuint64_t;
    _type: array[0..63] of char;
    width: Tuint32_t;
    height: Tuint32_t;
    permissions: TCameraFilePermissions;
    mtime: Ttime_t;
  end;
  PCameraFileInfoFile = ^TCameraFileInfoFile;

  TCameraFileInfoPreview = record
    fields: TCameraFileInfoFields;
    status: TCameraFileStatus;
    size: Tuint64_t;
    _type: array[0..63] of char;
    width: Tuint32_t;
    height: Tuint32_t;
  end;
  PCameraFileInfoPreview = ^TCameraFileInfoPreview;

  TCameraFileInfoAudio = record
    fields: TCameraFileInfoFields;
    status: TCameraFileStatus;
    size: Tuint64_t;
    _type: array[0..63] of char;
  end;
  PCameraFileInfoAudio = ^TCameraFileInfoAudio;

  TCameraFileInfo = record
    preview: TCameraFileInfoPreview;
    file_: TCameraFileInfoFile;
    audio: TCameraFileInfoAudio;
  end;
  PCameraFileInfo = ^TCameraFileInfo;

type
  PCameraStorageInfoFields = ^TCameraStorageInfoFields;
  TCameraStorageInfoFields = longint;

const
  GP_STORAGEINFO_BASE = 1 shl 0;
  GP_STORAGEINFO_LABEL = 1 shl 1;
  GP_STORAGEINFO_DESCRIPTION = 1 shl 2;
  GP_STORAGEINFO_ACCESS = 1 shl 3;
  GP_STORAGEINFO_STORAGETYPE = 1 shl 4;
  GP_STORAGEINFO_FILESYSTEMTYPE = 1 shl 5;
  GP_STORAGEINFO_MAXCAPACITY = 1 shl 6;
  GP_STORAGEINFO_FREESPACEKBYTES = 1 shl 7;
  GP_STORAGEINFO_FREESPACEIMAGES = 1 shl 8;

type
  PCameraStorageType = ^TCameraStorageType;
  TCameraStorageType = longint;

const
  GP_STORAGEINFO_ST_UNKNOWN = 0;
  GP_STORAGEINFO_ST_FIXED_ROM = 1;
  GP_STORAGEINFO_ST_REMOVABLE_ROM = 2;
  GP_STORAGEINFO_ST_FIXED_RAM = 3;
  GP_STORAGEINFO_ST_REMOVABLE_RAM = 4;

type
  PCameraStorageAccessType = ^TCameraStorageAccessType;
  TCameraStorageAccessType = longint;

const
  GP_STORAGEINFO_AC_READWRITE = 0;
  GP_STORAGEINFO_AC_READONLY = 1;
  GP_STORAGEINFO_AC_READONLY_WITH_DELETE = 2;

type
  PCameraStorageFilesystemType = ^TCameraStorageFilesystemType;
  TCameraStorageFilesystemType = longint;

const
  GP_STORAGEINFO_FST_UNDEFINED = 0;
  GP_STORAGEINFO_FST_GENERICFLAT = 1;
  GP_STORAGEINFO_FST_GENERICHIERARCHICAL = 2;
  GP_STORAGEINFO_FST_DCF = 3;

type
  TCameraStorageInformation = record
    fields: TCameraStorageInfoFields;
    basedir: array[0..255] of char;
    _label: array[0..255] of char;
    description: array[0..255] of char;
    _type: TCameraStorageType;
    fstype: TCameraStorageFilesystemType;
    access: TCameraStorageAccessType;
    capacitykbytes: Tuint64_t;
    freekbytes: Tuint64_t;
    freeimages: Tuint64_t;
  end;
  PCameraStorageInformation = ^TCameraStorageInformation;
  PPCameraStorageInformation = ^PCameraStorageInformation;

  PCameraFilesystem = type Pointer;
  PPCameraFilesystem = ^PCameraFilesystem;

function gp_filesystem_new(fs: PPCameraFilesystem): longint; cdecl; external libgphoto2;
function gp_filesystem_free(fs: PCameraFilesystem): longint; cdecl; external libgphoto2;
function gp_filesystem_append(fs: PCameraFilesystem; folder: pchar; filename: pchar; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_set_info_noop(fs: PCameraFilesystem; folder: pchar; filename: pchar; info: TCameraFileInfo; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_set_info_dirty(fs: PCameraFilesystem; folder: pchar; filename: pchar; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_set_file_noop(fs: PCameraFilesystem; folder: pchar; filename: pchar; _type: TCameraFileType; file_: PCameraFile;
  context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_delete_file_noop(fs: PCameraFilesystem; folder: pchar; filename: pchar; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_reset(fs: PCameraFilesystem): longint; cdecl; external libgphoto2;
function gp_filesystem_count(fs: PCameraFilesystem; folder: pchar; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_name(fs: PCameraFilesystem; folder: pchar; filenumber: longint; filename: PPchar; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_get_folder(fs: PCameraFilesystem; filename: pchar; folder: PPchar; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_number(fs: PCameraFilesystem; folder: pchar; filename: pchar; context: PGPContext): longint; cdecl; external libgphoto2;

type
  TCameraFilesystemListFunc = function(fs: PCameraFilesystem; folder: pchar; list: PCameraList; data: pointer; context: PGPContext): longint; cdecl;

function gp_filesystem_list_files(fs: PCameraFilesystem; folder: pchar; list: PCameraList; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_list_folders(fs: PCameraFilesystem; folder: pchar; list: PCameraList; context: PGPContext): longint; cdecl; external libgphoto2;

type
  TCameraFilesystemSetInfoFunc = function(fs: PCameraFilesystem; folder: pchar; filename: pchar; info: TCameraFileInfo; data: pointer; context: PGPContext): longint; cdecl;
  TCameraFilesystemGetInfoFunc = function(fs: PCameraFilesystem; folder: pchar; filename: pchar; info: PCameraFileInfo; data: pointer; context: PGPContext): longint; cdecl;

function gp_filesystem_get_info(fs: PCameraFilesystem; folder: pchar; filename: pchar; info: PCameraFileInfo; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_set_info(fs: PCameraFilesystem; folder: pchar; filename: pchar; info: TCameraFileInfo; context: PGPContext): longint; cdecl; external libgphoto2;

type
  TCameraFilesystemGetFileFunc = function(fs: PCameraFilesystem; folder: pchar; filename: pchar; _type: TCameraFileType; file_: PCameraFile; data: pointer; context: PGPContext): longint; cdecl;
  TCameraFilesystemReadFileFunc = function(fs: PCameraFilesystem; folder: pchar; filename: pchar; _type: TCameraFileType; offset: Tuint64_t; buf: pchar; size: Puint64_t; data: pointer; context: PGPContext): longint; cdecl;
  TCameraFilesystemDeleteFileFunc = function(fs: PCameraFilesystem; folder: pchar; filename: pchar; data: pointer; context: PGPContext): longint; cdecl;

function gp_filesystem_get_file(fs: PCameraFilesystem; folder: pchar; filename: pchar; _type: TCameraFileType; file_: PCameraFile;
  context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_read_file(fs: PCameraFilesystem; folder: pchar; filename: pchar; _type: TCameraFileType; offset: Tuint64_t;
  buf: pchar; size: Puint64_t; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_delete_file(fs: PCameraFilesystem; folder: pchar; filename: pchar; context: PGPContext): longint; cdecl; external libgphoto2;

type
  TCameraFilesystemPutFileFunc = function(fs: PCameraFilesystem; folder: pchar; filename: pchar; _type: TCameraFileType; file_: PCameraFile; data: pointer; context: PGPContext): longint; cdecl;
  TCameraFilesystemDeleteAllFunc = function(fs: PCameraFilesystem; folder: pchar; data: pointer; context: PGPContext): longint; cdecl;
  TCameraFilesystemDirFunc = function(fs: PCameraFilesystem; folder: pchar; name: pchar; data: pointer; context: PGPContext): longint; cdecl;
  TCameraFilesystemStorageInfoFunc = function(fs: PCameraFilesystem; para2: PPCameraStorageInformation; nrofstorageinformations: Plongint; data: pointer; context: PGPContext): longint; cdecl;

function gp_filesystem_get_storageinfo(fs: PCameraFilesystem; para2: PPCameraStorageInformation; nrofstorageinformations: Plongint; context: PGPContext): longint; cdecl; external libgphoto2;

type
  TCameraFilesystemFuncs = record
    file_list_func: TCameraFilesystemListFunc;
    folder_list_func: TCameraFilesystemListFunc;
    put_file_func: TCameraFilesystemPutFileFunc;
    delete_all_func: TCameraFilesystemDeleteAllFunc;
    get_info_func: TCameraFilesystemGetInfoFunc;
    set_info_func: TCameraFilesystemSetInfoFunc;
    make_dir_func: TCameraFilesystemDirFunc;
    remove_dir_func: TCameraFilesystemDirFunc;
    get_file_func: TCameraFilesystemGetFileFunc;
    read_file_func: TCameraFilesystemReadFileFunc;
    del_file_func: TCameraFilesystemDeleteFileFunc;
    storage_info_func: TCameraFilesystemStorageInfoFunc;
    unused: array[0..30] of pointer;
  end;
  PCameraFilesystemFuncs = ^TCameraFilesystemFuncs;

function gp_filesystem_set_funcs(fs: PCameraFilesystem; funcs: PCameraFilesystemFuncs; data: pointer): longint; cdecl; external libgphoto2;
function gp_filesystem_put_file(fs: PCameraFilesystem; folder: pchar; filename: pchar; _type: TCameraFileType; file_: PCameraFile; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_delete_all(fs: PCameraFilesystem; folder: pchar; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_make_dir(fs: PCameraFilesystem; folder: pchar; name: pchar; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_remove_dir(fs: PCameraFilesystem; folder: pchar; name: pchar; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_filesystem_dump(fs: PCameraFilesystem): longint; cdecl; external libgphoto2;

// === Konventiert am: 17-11-25 15:46:52 ===


implementation



end.
