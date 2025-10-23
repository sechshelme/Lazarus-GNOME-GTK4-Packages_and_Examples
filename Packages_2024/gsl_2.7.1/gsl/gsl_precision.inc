{$IFDEF read_interface}


type
  Pgsl_prec_t = ^Tgsl_prec_t;
  Tgsl_prec_t = dword;

const
  _GSL_PREC_T_NUM = 3;

var
  gsl_prec_eps: Pdouble; cvar;external libgsl;
  gsl_prec_sqrt_eps: Pdouble; cvar;external libgsl;
  gsl_prec_root3_eps: Pdouble; cvar;external libgsl;
  gsl_prec_root4_eps: Pdouble; cvar;external libgsl;
  gsl_prec_root5_eps: Pdouble; cvar;external libgsl;
  gsl_prec_root6_eps: Pdouble; cvar;external libgsl;

  // === Konventiert am: 22-8-25 13:19:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
