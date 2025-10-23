{$IFDEF read_interface}


type
  Pgsl_mode_t = ^Tgsl_mode_t;
  Tgsl_mode_t = dword;

const
  GSL_PREC_DOUBLE = 0;
  GSL_PREC_SINGLE = 1;
  GSL_PREC_APPROX = 2;

function GSL_MODE_PREC(mt: word): word;

const
  GSL_MODE_DEFAULT = 0;

  // === Konventiert am: 21-8-25 17:23:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GSL_MODE_PREC(mt: word): word;
begin
  GSL_MODE_PREC := mt and 7;
end;


{$ENDIF read_implementation}
