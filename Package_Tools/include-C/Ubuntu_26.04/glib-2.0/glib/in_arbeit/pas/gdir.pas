unit gdir;

interface

uses
  common_GLIB, gtypes,gerror;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGDir = type Pointer;

function g_dir_open(path: Pgchar; flags: Tguint; error: PPGError): PGDir; cdecl; external libglib2;
function g_dir_read_name(dir: PGDir): Pgchar; cdecl; external libglib2;
procedure g_dir_rewind(dir: PGDir); cdecl; external libglib2;
procedure g_dir_close(dir: PGDir); cdecl; external libglib2;
function g_dir_ref(dir: PGDir): PGDir; cdecl; external libglib2;
procedure g_dir_unref(dir: PGDir); cdecl; external libglib2;

// === Konventiert am: 22-6-26 16:17:18 ===


implementation



end.
