
{$IFDEF read_interface}

type
  TGStatBuf=Tstat;
  PGStatBuf=^TGStatBuf;

function g_access(filename:Pgchar; mode:longint):longint;cdecl;external libglib2;
function g_chdir(path:Pgchar):longint;cdecl;external libglib2;
function g_unlink(filename:Pgchar):longint;cdecl;external libglib2;
function g_rmdir(filename:Pgchar):longint;cdecl;external libglib2;

function g_chmod(filename:Pgchar; mode:longint):longint;cdecl;external libglib2;
function g_open(filename:Pgchar; flags:longint; mode:longint):longint;cdecl;external libglib2;
function g_creat(filename:Pgchar; mode:longint):longint;cdecl;external libglib2;
function g_rename(oldfilename:Pgchar; newfilename:Pgchar):longint;cdecl;external libglib2;
function g_mkdir(filename:Pgchar; mode:longint):longint;cdecl;external libglib2;
function g_stat(filename:Pgchar; buf:PGStatBuf):longint;cdecl;external libglib2;
function g_lstat(filename:Pgchar; buf:PGStatBuf):longint;cdecl;external libglib2;
function g_remove(filename:Pgchar):longint;cdecl;external libglib2;
function g_fopen(filename:Pgchar; mode:Pgchar):PFILE;cdecl;external libglib2;
function g_freopen(filename:Pgchar; mode:Pgchar; stream:PFILE):PFILE;cdecl;external libglib2;
function g_fsync(fd:Tgint):Tgint;cdecl;external libglib2;
type
  Tutimbuf = record
  end;
  Putimbuf = ^Tutimbuf;

function g_utime(filename:Pgchar; utb:Putimbuf):longint;cdecl;external libglib2;
function g_close(fd:Tgint; error:PPGError):Tgboolean;cdecl;external libglib2;

function g_clear_fd(fd_ptr: pcint;  error: PPGError): Boolean;


// === Konventiert am: 10-8-24 19:22:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function g_clear_fd(fd_ptr: pcint; error: PPGError): Boolean;
var
  fd: integer;
begin
  fd := fd_ptr^;
  fd_ptr^ := -1;
  if fd < 0 then begin
    Exit(True);
  end;
  Result := g_close(fd, error);
end;

{$ENDIF read_implementation}
