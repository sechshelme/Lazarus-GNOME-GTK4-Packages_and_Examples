{$IFDEF read_interface}


type
  Tpamc_handle_s = record
  end;
  Ppamc_handle_s = ^Tpamc_handle_s;

  Ppamc_handle_t = ^Tpamc_handle_t;
  Tpamc_handle_t = Ppamc_handle_s;

  Tpamc_bp_s = record
    length: uint32;
    control: uint8;
  end;
  Tpamc_bp_t = ^Tpamc_bp_s;
  Ppamc_bp_t = ^Tpamc_bp_t;

function pamc_start: Tpamc_handle_t; cdecl; external libpamc;
function pamc_end(pch: Ppamc_handle_t): longint; cdecl; external libpamc;
function pamc_load(pch: Tpamc_handle_t; agent_id: pchar): longint; cdecl; external libpamc;
function pamc_converse(pch: Tpamc_handle_t; prompt_p: Ppamc_bp_t): longint; cdecl; external libpamc;
function pamc_disable(pch: Tpamc_handle_t; agent_id: pchar): longint; cdecl; external libpamc;
function pamc_list_agents(pch: Tpamc_handle_t): PPchar; cdecl; external libpamc;

const
  PAM_BPC_FALSE = 0;
  PAM_BPC_TRUE = 1;
  PAM_BPC_OK = $01;
  PAM_BPC_SELECT = $02;
  PAM_BPC_DONE = $03;
  PAM_BPC_FAIL = $04;
  PAM_BPC_GETENV = $41;
  PAM_BPC_PUTENV = $42;
  PAM_BPC_TEXT = $43;
  PAM_BPC_ERROR = $44;
  PAM_BPC_PROMPT = $45;
  PAM_BPC_PASS = $46;

  // === Konventiert am: 13-7-25 15:31:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
