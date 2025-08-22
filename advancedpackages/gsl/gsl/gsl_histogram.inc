{$IFDEF read_interface}


type
  Tgsl_histogram = record
    n: Tsize_t;
    range: Pdouble;
    bin: Pdouble;
  end;
  Pgsl_histogram = ^Tgsl_histogram;

  Tgsl_histogram_pdf = record
    n: Tsize_t;
    range: Pdouble;
    sum: Pdouble;
  end;
  Pgsl_histogram_pdf = ^Tgsl_histogram_pdf;

function gsl_histogram_alloc(n: Tsize_t): Pgsl_histogram; cdecl; external libgsl;
function gsl_histogram_calloc(n: Tsize_t): Pgsl_histogram; cdecl; external libgsl;
function gsl_histogram_calloc_uniform(n: Tsize_t; xmin: Tdouble; xmax: Tdouble): Pgsl_histogram; cdecl; external libgsl;
procedure gsl_histogram_free(h: Pgsl_histogram); cdecl; external libgsl;
function gsl_histogram_increment(h: Pgsl_histogram; x: Tdouble): longint; cdecl; external libgsl;
function gsl_histogram_accumulate(h: Pgsl_histogram; x: Tdouble; weight: Tdouble): longint; cdecl; external libgsl;
function gsl_histogram_find(h: Pgsl_histogram; x: Tdouble; i: Psize_t): longint; cdecl; external libgsl;
function gsl_histogram_get(h: Pgsl_histogram; i: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_histogram_get_range(h: Pgsl_histogram; i: Tsize_t; lower: Pdouble; upper: Pdouble): longint; cdecl; external libgsl;
function gsl_histogram_max(h: Pgsl_histogram): Tdouble; cdecl; external libgsl;
function gsl_histogram_min(h: Pgsl_histogram): Tdouble; cdecl; external libgsl;
function gsl_histogram_bins(h: Pgsl_histogram): Tsize_t; cdecl; external libgsl;
procedure gsl_histogram_reset(h: Pgsl_histogram); cdecl; external libgsl;
function gsl_histogram_calloc_range(n: Tsize_t; range: Pdouble): Pgsl_histogram; cdecl; external libgsl;
function gsl_histogram_set_ranges(h: Pgsl_histogram; range: Pdouble; size: Tsize_t): longint; cdecl; external libgsl;
function gsl_histogram_set_ranges_uniform(h: Pgsl_histogram; xmin: Tdouble; xmax: Tdouble): longint; cdecl; external libgsl;
function gsl_histogram_memcpy(dest: Pgsl_histogram; source: Pgsl_histogram): longint; cdecl; external libgsl;
function gsl_histogram_clone(source: Pgsl_histogram): Pgsl_histogram; cdecl; external libgsl;
function gsl_histogram_max_val(h: Pgsl_histogram): Tdouble; cdecl; external libgsl;
function gsl_histogram_max_bin(h: Pgsl_histogram): Tsize_t; cdecl; external libgsl;
function gsl_histogram_min_val(h: Pgsl_histogram): Tdouble; cdecl; external libgsl;
function gsl_histogram_min_bin(h: Pgsl_histogram): Tsize_t; cdecl; external libgsl;
function gsl_histogram_equal_bins_p(h1: Pgsl_histogram; h2: Pgsl_histogram): longint; cdecl; external libgsl;
function gsl_histogram_add(h1: Pgsl_histogram; h2: Pgsl_histogram): longint; cdecl; external libgsl;
function gsl_histogram_sub(h1: Pgsl_histogram; h2: Pgsl_histogram): longint; cdecl; external libgsl;
function gsl_histogram_mul(h1: Pgsl_histogram; h2: Pgsl_histogram): longint; cdecl; external libgsl;
function gsl_histogram_div(h1: Pgsl_histogram; h2: Pgsl_histogram): longint; cdecl; external libgsl;
function gsl_histogram_scale(h: Pgsl_histogram; scale: Tdouble): longint; cdecl; external libgsl;
function gsl_histogram_shift(h: Pgsl_histogram; shift: Tdouble): longint; cdecl; external libgsl;
function gsl_histogram_sigma(h: Pgsl_histogram): Tdouble; cdecl; external libgsl;
function gsl_histogram_mean(h: Pgsl_histogram): Tdouble; cdecl; external libgsl;
function gsl_histogram_sum(h: Pgsl_histogram): Tdouble; cdecl; external libgsl;
function gsl_histogram_fwrite(stream: PFILE; h: Pgsl_histogram): longint; cdecl; external libgsl;
function gsl_histogram_fread(stream: PFILE; h: Pgsl_histogram): longint; cdecl; external libgsl;
function gsl_histogram_fprintf(stream: PFILE; h: Pgsl_histogram; range_format: pchar; bin_format: pchar): longint; cdecl; external libgsl;
function gsl_histogram_fscanf(stream: PFILE; h: Pgsl_histogram): longint; cdecl; external libgsl;
function gsl_histogram_pdf_alloc(n: Tsize_t): Pgsl_histogram_pdf; cdecl; external libgsl;
function gsl_histogram_pdf_init(p: Pgsl_histogram_pdf; h: Pgsl_histogram): longint; cdecl; external libgsl;
procedure gsl_histogram_pdf_free(p: Pgsl_histogram_pdf); cdecl; external libgsl;
function gsl_histogram_pdf_sample(p: Pgsl_histogram_pdf; r: Tdouble): Tdouble; cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:09:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
