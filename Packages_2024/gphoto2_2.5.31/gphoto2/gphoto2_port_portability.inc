{$IFDEF read_interface}


const
  IOLIBS = '.';

  {$IFDEF Windows}
  libgphoto2 = 'libgphoto2.dll';  // ??????


type
  Pssize_t = ^Tssize_t;
  Tssize_t = PSizeInt;

type
  TGPPORTWINDIR = record
    handle: THANDLE;
    got_first: longint;
    search: TWIN32_FIND_DATA;
    dir: array[0..1023] of char;
    drive: array[0..31] of array[0..1] of char;
    drive_count: longint;
    drive_index: longint;
  end;

type
  Pgp_system_dir = TGPPORTWINDIR;
  Pgp_system_dirent = type Pointer;

const
  gp_system_dir_delim = '\\';
  {$ENDIF}

  {$IFDEF Linux}
type
  Pgp_system_dir = type Pointer;
  Pgp_system_dirent = type Pointer;

const
  gp_system_dir_delim = '/';
  {$ENDIF}

function gp_system_mkdir(dirname: pchar): longint; cdecl; external libgphoto2;
function gp_system_rmdir(dirname: pchar): longint; cdecl; external libgphoto2;
function gp_system_opendir(dirname: pchar): Pgp_system_dir; cdecl; external libgphoto2;
function gp_system_readdir(d: Pgp_system_dir): Pgp_system_dirent; cdecl; external libgphoto2;
function gp_system_filename(de: Pgp_system_dirent): pchar; cdecl; external libgphoto2;
function gp_system_closedir(dir: Pgp_system_dir): longint; cdecl; external libgphoto2;
function gp_system_is_file(filename: pchar): longint; cdecl; external libgphoto2;
function gp_system_is_dir(dirname: pchar): longint; cdecl; external libgphoto2;

// === Konventiert am: 17-11-25 15:47:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
