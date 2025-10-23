{$IFDEF read_interface}


type
  Tgsl_ntuple = record
    file_: PFILE;
    ntuple_data: pointer;
    size: Tsize_t;
  end;
  Pgsl_ntuple = ^Tgsl_ntuple;

  Tgsl_ntuple_select_fn = record
    _function: function(ntuple_data: pointer; params: pointer): longint; cdecl;
    params: pointer;
  end;
  Pgsl_ntuple_select_fn = ^Tgsl_ntuple_select_fn;

  Tgsl_ntuple_value_fn = record
    _function: function(ntuple_data: pointer; params: pointer): Tdouble; cdecl;
    params: pointer;
  end;
  Pgsl_ntuple_value_fn = ^Tgsl_ntuple_value_fn;

function gsl_ntuple_open(filename: pchar; ntuple_data: pointer; size: Tsize_t): Pgsl_ntuple; cdecl; external libgsl;
function gsl_ntuple_create(filename: pchar; ntuple_data: pointer; size: Tsize_t): Pgsl_ntuple; cdecl; external libgsl;
function gsl_ntuple_write(ntuple: Pgsl_ntuple): longint; cdecl; external libgsl;
function gsl_ntuple_read(ntuple: Pgsl_ntuple): longint; cdecl; external libgsl;
function gsl_ntuple_bookdata(ntuple: Pgsl_ntuple): longint; cdecl; external libgsl;
function gsl_ntuple_project(h: Pgsl_histogram; ntuple: Pgsl_ntuple; value_func: Pgsl_ntuple_value_fn; select_func: Pgsl_ntuple_select_fn): longint; cdecl; external libgsl;
function gsl_ntuple_close(ntuple: Pgsl_ntuple): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:19:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
