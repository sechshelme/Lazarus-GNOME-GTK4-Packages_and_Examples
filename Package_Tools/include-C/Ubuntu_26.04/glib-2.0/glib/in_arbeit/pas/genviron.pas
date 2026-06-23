unit genviron;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function g_getenv(variable: Pgchar): Pgchar; cdecl; external libglib2;
function g_setenv(variable: Pgchar; value: Pgchar; overwrite: Tgboolean): Tgboolean; cdecl; external libglib2;
procedure g_unsetenv(variable: Pgchar); cdecl; external libglib2;
function g_listenv: PPgchar; cdecl; external libglib2;
function g_get_environ: PPgchar; cdecl; external libglib2;
function g_environ_getenv(envp: PPgchar; variable: Pgchar): Pgchar; cdecl; external libglib2;
function g_environ_setenv(envp: PPgchar; variable: Pgchar; value: Pgchar; overwrite: Tgboolean): PPgchar; cdecl; external libglib2;
function g_environ_unsetenv(envp: PPgchar; variable: Pgchar): PPgchar; cdecl; external libglib2;

// === Konventiert am: 22-6-26 16:17:20 ===


implementation



end.
