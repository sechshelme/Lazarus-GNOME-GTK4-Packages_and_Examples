{$IFDEF read_interface}


type
  Tgsl_histogram2d = record
    nx: Tsize_t;
    ny: Tsize_t;
    xrange: Pdouble;
    yrange: Pdouble;
    bin: Pdouble;
  end;
  Pgsl_histogram2d = ^Tgsl_histogram2d;

  Tgsl_histogram2d_pdf = record
    nx: Tsize_t;
    ny: Tsize_t;
    xrange: Pdouble;
    yrange: Pdouble;
    sum: Pdouble;
  end;
  Pgsl_histogram2d_pdf = ^Tgsl_histogram2d_pdf;

function gsl_histogram2d_alloc(nx: Tsize_t; ny: Tsize_t): Pgsl_histogram2d; cdecl; external libgsl;
function gsl_histogram2d_calloc(nx: Tsize_t; ny: Tsize_t): Pgsl_histogram2d; cdecl; external libgsl;
function gsl_histogram2d_calloc_uniform(nx: Tsize_t; ny: Tsize_t; xmin: double; xmax: double; ymin: double;
  ymax: double): Pgsl_histogram2d; cdecl; external libgsl;
procedure gsl_histogram2d_free(h: Pgsl_histogram2d); cdecl; external libgsl;
function gsl_histogram2d_increment(h: Pgsl_histogram2d; x: double; y: double): longint; cdecl; external libgsl;
function gsl_histogram2d_accumulate(h: Pgsl_histogram2d; x: double; y: double; weight: double): longint; cdecl; external libgsl;
function gsl_histogram2d_find(h: Pgsl_histogram2d; x: double; y: double; i: Psize_t; j: Psize_t): longint; cdecl; external libgsl;
function gsl_histogram2d_get(h: Pgsl_histogram2d; i: Tsize_t; j: Tsize_t): double; cdecl; external libgsl;
function gsl_histogram2d_get_xrange(h: Pgsl_histogram2d; i: Tsize_t; xlower: Pdouble; xupper: Pdouble): longint; cdecl; external libgsl;
function gsl_histogram2d_get_yrange(h: Pgsl_histogram2d; j: Tsize_t; ylower: Pdouble; yupper: Pdouble): longint; cdecl; external libgsl;
function gsl_histogram2d_xmax(h: Pgsl_histogram2d): double; cdecl; external libgsl;
function gsl_histogram2d_xmin(h: Pgsl_histogram2d): double; cdecl; external libgsl;
function gsl_histogram2d_nx(h: Pgsl_histogram2d): Tsize_t; cdecl; external libgsl;
function gsl_histogram2d_ymax(h: Pgsl_histogram2d): double; cdecl; external libgsl;
function gsl_histogram2d_ymin(h: Pgsl_histogram2d): double; cdecl; external libgsl;
function gsl_histogram2d_ny(h: Pgsl_histogram2d): Tsize_t; cdecl; external libgsl;
procedure gsl_histogram2d_reset(h: Pgsl_histogram2d); cdecl; external libgsl;
function gsl_histogram2d_calloc_range(nx: Tsize_t; ny: Tsize_t; xrange: Pdouble; yrange: Pdouble): Pgsl_histogram2d; cdecl; external libgsl;
function gsl_histogram2d_set_ranges_uniform(h: Pgsl_histogram2d; xmin: double; xmax: double; ymin: double; ymax: double): longint; cdecl; external libgsl;
function gsl_histogram2d_set_ranges(h: Pgsl_histogram2d; xrange: Pdouble; xsize: Tsize_t; yrange: Pdouble; ysize: Tsize_t): longint; cdecl; external libgsl;
function gsl_histogram2d_memcpy(dest: Pgsl_histogram2d; source: Pgsl_histogram2d): longint; cdecl; external libgsl;
function gsl_histogram2d_clone(source: Pgsl_histogram2d): Pgsl_histogram2d; cdecl; external libgsl;
function gsl_histogram2d_max_val(h: Pgsl_histogram2d): double; cdecl; external libgsl;
procedure gsl_histogram2d_max_bin(h: Pgsl_histogram2d; i: Psize_t; j: Psize_t); cdecl; external libgsl;
function gsl_histogram2d_min_val(h: Pgsl_histogram2d): double; cdecl; external libgsl;
procedure gsl_histogram2d_min_bin(h: Pgsl_histogram2d; i: Psize_t; j: Psize_t); cdecl; external libgsl;
function gsl_histogram2d_xmean(h: Pgsl_histogram2d): double; cdecl; external libgsl;
function gsl_histogram2d_ymean(h: Pgsl_histogram2d): double; cdecl; external libgsl;
function gsl_histogram2d_xsigma(h: Pgsl_histogram2d): double; cdecl; external libgsl;
function gsl_histogram2d_ysigma(h: Pgsl_histogram2d): double; cdecl; external libgsl;
function gsl_histogram2d_cov(h: Pgsl_histogram2d): double; cdecl; external libgsl;
function gsl_histogram2d_sum(h: Pgsl_histogram2d): double; cdecl; external libgsl;
function gsl_histogram2d_equal_bins_p(h1: Pgsl_histogram2d; h2: Pgsl_histogram2d): longint; cdecl; external libgsl;
function gsl_histogram2d_add(h1: Pgsl_histogram2d; h2: Pgsl_histogram2d): longint; cdecl; external libgsl;
function gsl_histogram2d_sub(h1: Pgsl_histogram2d; h2: Pgsl_histogram2d): longint; cdecl; external libgsl;
function gsl_histogram2d_mul(h1: Pgsl_histogram2d; h2: Pgsl_histogram2d): longint; cdecl; external libgsl;
function gsl_histogram2d_div(h1: Pgsl_histogram2d; h2: Pgsl_histogram2d): longint; cdecl; external libgsl;
function gsl_histogram2d_scale(h: Pgsl_histogram2d; scale: double): longint; cdecl; external libgsl;
function gsl_histogram2d_shift(h: Pgsl_histogram2d; shift: double): longint; cdecl; external libgsl;
function gsl_histogram2d_fwrite(stream: PFILE; h: Pgsl_histogram2d): longint; cdecl; external libgsl;
function gsl_histogram2d_fread(stream: PFILE; h: Pgsl_histogram2d): longint; cdecl; external libgsl;
function gsl_histogram2d_fprintf(stream: PFILE; h: Pgsl_histogram2d; range_format: pchar; bin_format: pchar): longint; cdecl; external libgsl;
function gsl_histogram2d_fscanf(stream: PFILE; h: Pgsl_histogram2d): longint; cdecl; external libgsl;
function gsl_histogram2d_pdf_alloc(nx: Tsize_t; ny: Tsize_t): Pgsl_histogram2d_pdf; cdecl; external libgsl;
function gsl_histogram2d_pdf_init(p: Pgsl_histogram2d_pdf; h: Pgsl_histogram2d): longint; cdecl; external libgsl;
procedure gsl_histogram2d_pdf_free(p: Pgsl_histogram2d_pdf); cdecl; external libgsl;
function gsl_histogram2d_pdf_sample(p: Pgsl_histogram2d_pdf; r1: double; r2: double; x: Pdouble; y: Pdouble): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:09:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
