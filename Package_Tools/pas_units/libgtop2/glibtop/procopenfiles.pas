unit procopenfiles;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_PROC_OPEN_FILES_NUMBER = 0;
  GLIBTOP_PROC_OPEN_FILES_TOTAL = 1;
  GLIBTOP_PROC_OPEN_FILES_SIZE = 2;
  GLIBTOP_MAX_PROC_OPEN_FILES = 3;
  GLIBTOP_FILE_ENTRY_FD = 0;
  GLIBTOP_FILE_ENTRY_NAME = 1;
  GLIBTOP_FILE_ENTRY_TYPE = 2;
  GLIBTOP_FILE_ENTRY_INETSOCKET_DST_HOST = 3;
  GLIBTOP_FILE_ENTRY_INETSOCKET_DST_PORT = 4;
  GLIBTOP_MAX_OPEN_FILE_ENTRY = 5;
  GLIBTOP_OPEN_FILENAME_LEN = 215;
  GLIBTOP_OPEN_DEST_HOST_LEN = 46;

type
  Tglibtop_file_type = longint;

const
  GLIBTOP_FILE_TYPE_FILE = 1;
  GLIBTOP_FILE_TYPE_PIPE = 2;
  GLIBTOP_FILE_TYPE_INETSOCKET = 4;
  GLIBTOP_FILE_TYPE_LOCALSOCKET = 8;
  GLIBTOP_FILE_TYPE_INET6SOCKET = 16;

type
  Tglibtop_open_files_entry = record
    fd: longint;
    _type: Tguint16;
    info: record
      case longint of
        0: (sock: record
            dest_host: array[0..(GLIBTOP_OPEN_DEST_HOST_LEN + 1) - 1] of char;
            dest_port: longint;
            end);
        1: (file_: record
            name: array[0..(GLIBTOP_OPEN_FILENAME_LEN + 1) - 1] of char;
            end);
        2: (localsock: record
            name: array[0..(GLIBTOP_OPEN_FILENAME_LEN + 1) - 1] of char;
            end);
      end;
  end;
  Pglibtop_open_files_entry = ^Tglibtop_open_files_entry;

  Tglibtop_proc_open_files = record
    flags: Tguint64;
    number: Tguint64;
    total: Tguint64;
    size: Tguint64;
  end;
  Pglibtop_proc_open_files = ^Tglibtop_proc_open_files;

function glibtop_get_proc_open_files(buf: Pglibtop_proc_open_files; pid: Tpid_t): Pglibtop_open_files_entry; cdecl; external libgtop2;

function glibtop_get_proc_open_files_r(server: Pglibtop; buf: Pglibtop_proc_open_files; pid: Tpid_t): Pglibtop_open_files_entry; cdecl; external libgtop2 name 'glibtop_get_proc_open_files_s';

function glibtop_get_proc_open_files_l(server: Pglibtop; buf: Pglibtop_proc_open_files; pid: Tpid_t): Pglibtop_open_files_entry; cdecl; external libgtop2;

procedure _glibtop_init_proc_open_files_s(server: Pglibtop); cdecl; external libgtop2;
function glibtop_get_proc_open_files_s(server: Pglibtop; buf: Pglibtop_proc_open_files; pid: Tpid_t): Pglibtop_open_files_entry; cdecl; external libgtop2;

function glibtop_open_files_entry_get_type: TGType; cdecl; external libgtop2;
function glibtop_proc_open_files_get_type: TGType; cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:27 ===


implementation



end.
