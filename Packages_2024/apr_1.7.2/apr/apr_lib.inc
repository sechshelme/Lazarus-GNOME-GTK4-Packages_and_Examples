{$IFDEF read_interface}


const
  HUGE_STRING_LEN = 8192;

type
  Papr_vformatter_buff_t = ^Tapr_vformatter_buff_t;
  Tapr_vformatter_buff_t = record
    curpos: pchar;
    endpos: pchar;
  end;

function apr_filepath_name_get(pathname: pchar): pchar; cdecl; external libapr;
function apr_vformatter(flush_func: Pointer; c: Papr_vformatter_buff_t; fmt: pchar; ap: Tva_list): longint; cdecl; external libapr;
function apr_password_get(prompt: pchar; pwbuf: pchar; bufsize: Papr_size_t): Tapr_status_t; cdecl; external libapr;


// === Konventiert am: 10-9-26 16:37:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
