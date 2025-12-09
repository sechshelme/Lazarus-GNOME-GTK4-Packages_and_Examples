{$IFDEF read_interface}


function gsl_sf_fermi_dirac_m1_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_m1(x: double): double; cdecl; external libgsl;
function gsl_sf_fermi_dirac_0_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_0(x: double): double; cdecl; external libgsl;
function gsl_sf_fermi_dirac_1_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_1(x: double): double; cdecl; external libgsl;
function gsl_sf_fermi_dirac_2_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_2(x: double): double; cdecl; external libgsl;
function gsl_sf_fermi_dirac_int_e(j: longint; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_int(j: longint; x: double): double; cdecl; external libgsl;
function gsl_sf_fermi_dirac_mhalf_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_mhalf(x: double): double; cdecl; external libgsl;
function gsl_sf_fermi_dirac_half_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_half(x: double): double; cdecl; external libgsl;
function gsl_sf_fermi_dirac_3half_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_3half(x: double): double; cdecl; external libgsl;
function gsl_sf_fermi_dirac_inc_0_e(x: double; b: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fermi_dirac_inc_0(x: double; b: double): double; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
