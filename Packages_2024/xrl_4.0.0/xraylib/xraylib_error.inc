{$IFDEF read_interface}


type
  Pxrl_error_code = ^Txrl_error_code;
  Txrl_error_code = longint;
const
  XRL_ERROR_MEMORY = 0;
  XRL_ERROR_INVALID_ARGUMENT = 1;
  XRL_ERROR_IO = 2;
  XRL_ERROR_TYPE = 3;
  XRL_ERROR_UNSUPPORTED = 4;
  XRL_ERROR_RUNTIME = 5;

type
  PPxrl_error = ^Pxrl_error;
  Pxrl_error = ^Txrl_error;
  Txrl_error = record
    code: Txrl_error_code;
    message: pchar;
  end;

procedure xrl_error_free(error: Pxrl_error); cdecl; external libxrl;
function xrl_error_copy(error: Pxrl_error): Pxrl_error; cdecl; external libxrl;
function xrl_error_matches(error: Pxrl_error; code: Txrl_error_code): longint; cdecl; external libxrl;
procedure xrl_propagate_error(dest: PPxrl_error; src: Pxrl_error); cdecl; external libxrl;
procedure xrl_clear_error(err: PPxrl_error); cdecl; external libxrl;

// === Konventiert am: 8-9-26 17:30:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
