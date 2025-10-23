{$IFDEF read_interface}


function gsl_sf_fermi_dirac_m1_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_m1(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_fermi_dirac_0_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_0(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_fermi_dirac_1_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_1(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_fermi_dirac_2_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_2(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_fermi_dirac_int_e(j: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_int(j: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_fermi_dirac_mhalf_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_mhalf(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_fermi_dirac_half_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_half(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_fermi_dirac_3half_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_3half(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_fermi_dirac_inc_0_e(x: Tdouble; b: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_inc_0(x: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
