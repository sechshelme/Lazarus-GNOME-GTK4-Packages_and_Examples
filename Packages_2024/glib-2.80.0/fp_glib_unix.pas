unit fp_glib_unix;

interface

uses
  ctypes,
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$IFDEF linux}
function g_unix_error_quark: TGQuark; cdecl; external libglib2;
function g_unix_open_pipe(fds: Pgint; flags: Tgint; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_unix_set_fd_nonblocking(fd: Tgint; nonblock: Tgboolean; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_unix_signal_source_new(signum: Tgint): PGSource; cdecl; external libglib2;
function g_unix_signal_add_full(priority: Tgint; signum: Tgint; handler: TGSourceFunc; user_data: Tgpointer; notify: TGDestroyNotify): Tguint; cdecl; external libglib2;
function g_unix_signal_add(signum: Tgint; handler: TGSourceFunc; user_data: Tgpointer): Tguint; cdecl; external libglib2;

type
  TGUnixFDSourceFunc = function(fd: Tgint; condition: TGIOCondition; user_data: Tgpointer): Tgboolean; cdecl;

function g_unix_fd_source_new(fd: Tgint; condition: TGIOCondition): PGSource; cdecl; external libglib2;
function g_unix_fd_add_full(priority: Tgint; fd: Tgint; condition: TGIOCondition; _function: TGUnixFDSourceFunc; user_data: Tgpointer;
  notify: TGDestroyNotify): Tguint; cdecl; external libglib2;
function g_unix_fd_add(fd: Tgint; condition: TGIOCondition; _function: TGUnixFDSourceFunc; user_data: Tgpointer): Tguint; cdecl; external libglib2;
function g_unix_get_passwd_entry(user_name: Pgchar; error: PPGError): Ppasswd; cdecl; external libglib2;

type
  TGUnixPipe = record
    fds: array[0..1] of longint;
  end;
  PGUnixPipe = ^TGUnixPipe;

  PGUnixPipeEnd = ^TGUnixPipeEnd;
  TGUnixPipeEnd = longint;

const
  G_UNIX_PIPE_END_READ = 0;
  G_UNIX_PIPE_END_WRITE = 1;

function g_closefrom(lowfd: longint): longint; cdecl; external libglib2;
function g_fdwalk_set_cloexec(lowfd: longint): longint; cdecl; external libglib2;


function g_unix_pipe_open(pipe: PGUnixPipe; flags: integer; error: PPGError): Tgboolean;
function g_unix_pipe_get(pipe: PGUnixPipe; end_: TGUnixPipeEnd): integer;
function g_unix_pipe_steal(pipe: PGUnixPipe; end_: TGUnixPipeEnd): integer;
function g_unix_pipe_close(pipe: PGUnixPipe; end_: TGUnixPipeEnd; error: PPGError): Tgboolean;
procedure g_unix_pipe_clear(pipe: PGUnixPipe);

function G_UNIX_ERROR: longint;
{$ENDIF}


// === Konventiert am: 8-11-24 13:58:51 ===


implementation

{$IFDEF linux}
function g_unix_pipe_open(pipe: PGUnixPipe; flags: integer; error: PPGError): Tgboolean;
begin
  Result := g_unix_open_pipe(pipe^.fds, flags, error);
end;

function g_unix_pipe_get(pipe: PGUnixPipe; end_: TGUnixPipeEnd): integer;
begin
  Result := pipe^.fds[end_];
end;

function g_unix_pipe_steal(pipe: PGUnixPipe; end_: TGUnixPipeEnd): integer;
begin
  Result := g_steal_fd(@pipe^.fds[end_]);
end;

function g_unix_pipe_close(pipe: PGUnixPipe; end_: TGUnixPipeEnd;
  error: PPGError): Tgboolean;
begin
  Result := g_clear_fd(@pipe^.fds[end_], error);
end;

procedure g_unix_pipe_clear(pipe: PGUnixPipe);
var
  errsv: cint;
begin
  //errsv := errno;
  //
  //if not g_unix_pipe_close(pipe, G_UNIX_PIPE_END_READ, nil) then begin
  //  // Handle the error if needed
  //end;
  //
  //if not g_unix_pipe_close(pipe, G_UNIX_PIPE_END_WRITE, nil) then begin
  //  // Handle the error if needed
  //end;
  //
  //errno := errsv;
end;

function G_UNIX_ERROR: longint;
begin
  G_UNIX_ERROR := g_unix_error_quark;
end;
{$ENDIF}

end.
