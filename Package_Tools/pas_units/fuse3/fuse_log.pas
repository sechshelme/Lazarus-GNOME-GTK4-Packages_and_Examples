unit fuse_log;

interface

uses
  fp_fuse;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tfuse_log_level = longint;

const
  FUSE_LOG_EMERG = 0;
  FUSE_LOG_ALERT = 1;
  FUSE_LOG_CRIT = 2;
  FUSE_LOG_ERR = 3;
  FUSE_LOG_WARNING = 4;
  FUSE_LOG_NOTICE = 5;
  FUSE_LOG_INFO = 6;
  FUSE_LOG_DEBUG = 7;

type
  Tfuse_log_func_t = procedure(level: Tfuse_log_level; fmt: pchar; ap: Tva_list); cdecl;

procedure fuse_set_log_func(func: Tfuse_log_func_t); cdecl; external libfuse3;
procedure fuse_log(level: Tfuse_log_level; fmt: pchar; args: array of const); cdecl; external libfuse3;
procedure fuse_log(level: Tfuse_log_level; fmt: pchar); cdecl; external libfuse3;

// === Konventiert am: 31-8-25 17:01:38 ===


implementation



end.
