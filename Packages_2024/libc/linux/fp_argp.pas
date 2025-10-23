unit fp_argp;

interface

uses
  clib, fp_errno;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/argp.h

type
  Perror_t = ^Terror_t;
  Terror_t = longint;

type
  Targp_option = record
    name: pchar;
    key: longint;
    arg: pchar;
    flags: longint;
    doc: pchar;
    group: longint;
  end;
  Pargp_option = ^Targp_option;

const
  OPTION_ARG_OPTIONAL = $1;
  OPTION_HIDDEN = $2;
  OPTION_ALIAS = $4;
  OPTION_DOC = $8;
  OPTION_NO_USAGE = $10;

const
  ARGP_ERR_UNKNOWN = E2BIG;
  ARGP_KEY_ARG = 0;
  ARGP_KEY_ARGS = $1000006;
  ARGP_KEY_END = $1000001;
  ARGP_KEY_NO_ARGS = $1000002;
  ARGP_KEY_INIT = $1000003;
  ARGP_KEY_FINI = $1000007;
  ARGP_KEY_SUCCESS = $1000004;
  ARGP_KEY_ERROR = $1000005;

type
  Pargp = ^Targp;
  Pargp_child = ^Targp_child;
  Pargp_state = ^Targp_state;

  Targp_parser_t = function(__key: longint; __arg: pchar; __state: Pargp_state): Terror_t; cdecl;

  Targp = record
    options: Pargp_option;
    parser: Targp_parser_t;
    args_doc: pchar;
    doc: pchar;
    children: Pargp_child;
    help_filter: function(__key: longint; __text: pchar; __input: pointer): pchar; cdecl;
    argp_domain: pchar;
  end;

  Targp_child = record
    argp: Pargp;
    flags: longint;
    header: pchar;
    group: longint;
  end;

  Targp_state = record
    root_argp: Pargp;
    argc: longint;
    argv: ^pchar;
    next: longint;
    flags: dword;
    arg_num: dword;
    quoted: longint;
    input: pointer;
    child_inputs: ^pointer;
    hook: pointer;
    name: pchar;
    err_stream: PFILE;
    out_stream: PFILE;
    pstate: pointer;
  end;

const
  ARGP_KEY_HELP_PRE_DOC = $2000001;
  ARGP_KEY_HELP_POST_DOC = $2000002;
  ARGP_KEY_HELP_HEADER = $2000003;
  ARGP_KEY_HELP_EXTRA = $2000004;
  ARGP_KEY_HELP_DUP_ARGS_NOTE = $2000005;
  ARGP_KEY_HELP_ARGS_DOC = $2000006;

const
  ARGP_PARSE_ARGV0 = $01;
  ARGP_NO_ERRS = $02;
  ARGP_NO_ARGS = $04;
  ARGP_IN_ORDER = $08;
  ARGP_NO_HELP = $10;
  ARGP_NO_EXIT = $20;
  ARGP_LONG_ONLY = $40;
  ARGP_SILENT = (ARGP_NO_EXIT or ARGP_NO_ERRS) or ARGP_NO_HELP;

function argp_parse(__argp: Pargp; __argc: longint; __argv: PPchar; __flags: dword; __arg_index: Plongint; __input: pointer): Terror_t; cdecl; external libc;

var
  argp_program_version: pchar; cvar;external libc;
  argp_program_version_hook: procedure(__stream: PFILE; __state: Pargp_state); cvar;external libc;
  argp_program_bug_address: pchar; cvar;external libc;
  argp_err_exit_status: Terror_t; cvar;external libc;

const
  ARGP_HELP_USAGE = $01;
  ARGP_HELP_SHORT_USAGE = $02;
  ARGP_HELP_SEE = $04;
  ARGP_HELP_LONG = $08;
  ARGP_HELP_PRE_DOC = $10;
  ARGP_HELP_POST_DOC = $20;
  ARGP_HELP_DOC = ARGP_HELP_PRE_DOC or ARGP_HELP_POST_DOC;
  ARGP_HELP_BUG_ADDR = $40;
  ARGP_HELP_LONG_ONLY = $80;
  ARGP_HELP_EXIT_ERR = $100;
  ARGP_HELP_EXIT_OK = $200;
  ARGP_HELP_STD_ERR = ARGP_HELP_SEE or ARGP_HELP_EXIT_ERR;
  ARGP_HELP_STD_USAGE = (ARGP_HELP_SHORT_USAGE or ARGP_HELP_SEE) or ARGP_HELP_EXIT_ERR;
  ARGP_HELP_STD_HELP = (((ARGP_HELP_SHORT_USAGE or ARGP_HELP_LONG) or ARGP_HELP_EXIT_OK) or ARGP_HELP_DOC) or ARGP_HELP_BUG_ADDR;

procedure argp_help(__argp: Pargp; __stream: PFILE; __flags: dword; __name: pchar); cdecl; external libc;
procedure argp_state_help(__state: Pargp_state; __stream: PFILE; __flags: dword); cdecl; external libc;
procedure argp_usage(__state: Pargp_state); cdecl; external libc;
procedure argp_error(__state: Pargp_state; __fmt: pchar); cdecl; varargs; external libc;
procedure argp_failure(__state: Pargp_state; __status: longint; __errnum: longint; __fmt: pchar); cdecl; varargs; external libc;


// === Konventiert am: 4-8-25 16:34:07 ===


implementation



end.
