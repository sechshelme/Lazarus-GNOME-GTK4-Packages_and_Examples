unit gphoto2_file;

interface

uses
  fp_glib2, fp_gphoto2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GP_MIME_TXT = 'text/plain';
  GP_MIME_WAV = 'audio/wav';
  GP_MIME_RAW = 'image/x-raw';
  GP_MIME_PNG = 'image/png';
  GP_MIME_PGM = 'image/x-portable-graymap';
  GP_MIME_PPM = 'image/x-portable-pixmap';
  GP_MIME_PNM = 'image/x-portable-anymap';
  GP_MIME_JPEG = 'image/jpeg';
  GP_MIME_TIFF = 'image/tiff';
  GP_MIME_BMP = 'image/bmp';
  GP_MIME_QUICKTIME = 'video/quicktime';
  GP_MIME_AVI = 'video/x-msvideo';
  GP_MIME_CRW = 'image/x-canon-raw';
  GP_MIME_CR2 = 'image/x-canon-cr2';
  GP_MIME_CR3 = 'image/x-canon-cr3';
  GP_MIME_NEF = 'image/x-nikon-nef';
  GP_MIME_UNKNOWN = 'application/octet-stream';
  GP_MIME_EXIF = 'application/x-exif';
  GP_MIME_MP3 = 'audio/mpeg';
  GP_MIME_OGG = 'application/ogg';
  GP_MIME_WMA = 'audio/x-wma';
  GP_MIME_ASF = 'audio/x-asf';
  GP_MIME_MPEG = 'video/mpeg';
  GP_MIME_AVCHD = 'video/mp2t';
  GP_MIME_RW2 = 'image/x-panasonic-raw2';
  GP_MIME_ARW = 'image/x-sony-arw';

type
  PCameraFileType = ^TCameraFileType;
  TCameraFileType = longint;

const
  GP_FILE_TYPE_PREVIEW = 0;
  GP_FILE_TYPE_NORMAL = 1;
  GP_FILE_TYPE_RAW = 2;
  GP_FILE_TYPE_AUDIO = 3;
  GP_FILE_TYPE_EXIF = 4;
  GP_FILE_TYPE_METADATA = 5;

type
  PCameraFileAccessType = ^TCameraFileAccessType;
  TCameraFileAccessType = longint;

const
  GP_FILE_ACCESSTYPE_MEMORY = 0;
  GP_FILE_ACCESSTYPE_FD = 1;
  GP_FILE_ACCESSTYPE_HANDLER = 2;

type
  TCameraFileHandler = record
    size: function(priv: pointer; size: Puint64_t): longint; cdecl;
    read: function(priv: pointer; data: pbyte; len: Puint64_t): longint; cdecl;
    write: function(priv: pointer; data: pbyte; len: Puint64_t): longint; cdecl;
  end;
  PCameraFileHandler = ^TCameraFileHandler;

  PCameraFile = type Pointer;
  PPCameraFile = ^PCameraFile;

function gp_file_new(file_: PPCameraFile): longint; cdecl; external libgphoto2;
function gp_file_new_from_fd(file_: PPCameraFile; fd: longint): longint; cdecl; external libgphoto2;
function gp_file_new_from_handler(file_: PPCameraFile; handler: PCameraFileHandler; priv: pointer): longint; cdecl; external libgphoto2;
function gp_file_ref(file_: PCameraFile): longint; cdecl; external libgphoto2;
function gp_file_unref(file_: PCameraFile): longint; cdecl; external libgphoto2;
function gp_file_free(file_: PCameraFile): longint; cdecl; external libgphoto2;
function gp_file_set_name(file_: PCameraFile; name: pchar): longint; cdecl; external libgphoto2;
function gp_file_get_name(file_: PCameraFile; name: PPchar): longint; cdecl; external libgphoto2;
function gp_file_set_mime_type(file_: PCameraFile; mime_type: pchar): longint; cdecl; external libgphoto2;
function gp_file_get_mime_type(file_: PCameraFile; mime_type: PPchar): longint; cdecl; external libgphoto2;
function gp_file_set_mtime(file_: PCameraFile; mtime: Ttime_t): longint; cdecl; external libgphoto2;
function gp_file_get_mtime(file_: PCameraFile; mtime: Ptime_t): longint; cdecl; external libgphoto2;
function gp_file_detect_mime_type(file_: PCameraFile): longint; cdecl; external libgphoto2;
function gp_file_adjust_name_for_mime_type(file_: PCameraFile): longint; cdecl; external libgphoto2;
function gp_file_get_name_by_type(file_: PCameraFile; basename: pchar; _type: TCameraFileType; newname: PPchar): longint; cdecl; external libgphoto2;
function gp_file_set_data_and_size(para1: PCameraFile; data: pchar; size: dword): longint; cdecl; external libgphoto2;
function gp_file_get_data_and_size(para1: PCameraFile; data: PPchar; size: Pdword): longint; cdecl; external libgphoto2;
function gp_file_open(file_: PCameraFile; filename: pchar): longint; cdecl; external libgphoto2;
function gp_file_save(file_: PCameraFile; filename: pchar): longint; cdecl; external libgphoto2;
function gp_file_clean(file_: PCameraFile): longint; cdecl; external libgphoto2;
function gp_file_copy(destination: PCameraFile; source: PCameraFile): longint; cdecl; external libgphoto2;
function gp_file_append(para1: PCameraFile; data: pchar; size: dword): longint; cdecl; external libgphoto2;
function gp_file_slurp(para1: PCameraFile; data: pchar; size: Tsize_t; readlen: Psize_t): longint; cdecl; external libgphoto2;

// === Konventiert am: 17-11-25 15:46:49 ===


implementation



end.
