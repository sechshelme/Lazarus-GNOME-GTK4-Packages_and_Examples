unit rlconf;

interface

uses
  fp_readline;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  DEFAULT_INPUTRC = '~/.inputrc';
  SYS_INPUTRC = '/etc/inputrc';
  RL_COMMENT_BEGIN_DEFAULT = '#';
  RL_EMACS_MODESTR_DEFAULT = '@';
  RL_EMACS_MODESTR_DEFLEN = 1;
  RL_VI_INS_MODESTR_DEFAULT = '(ins)';
  RL_VI_INS_MODESTR_DEFLEN = 5;
  RL_VI_CMD_MODESTR_DEFAULT = '(cmd)';
  RL_VI_CMD_MODESTR_DEFLEN = 5;

  // === Konventiert am: 27-8-25 16:55:24 ===


implementation



end.
