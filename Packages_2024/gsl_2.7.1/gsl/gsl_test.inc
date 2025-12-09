{$IFDEF read_interface}



procedure gsl_test(status: longint; test_description: pchar); cdecl; varargs; external libgsl;
procedure gsl_test_rel(result: double; expected: double; relative_error: double; test_description: pchar); cdecl; varargs; external libgsl;
procedure gsl_test_abs(result: double; expected: double; absolute_error: double; test_description: pchar); cdecl; varargs; external libgsl;
procedure gsl_test_factor(result: double; expected: double; factor: double; test_description: pchar); cdecl; varargs; external libgsl;
procedure gsl_test_int(result: longint; expected: longint; test_description: pchar); cdecl; varargs; external libgsl;
procedure gsl_test_str(result: pchar; expected: pchar; test_description: pchar); cdecl; varargs; external libgsl;
procedure gsl_test_verbose(verbose: longint); cdecl; external libgsl;
function gsl_test_summary: longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:41:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
