{$IFDEF read_interface}


function mgl_ipowc(x: Tmdual; n: longint): Tcmdual; cdecl; external libmgl;
function mgl_atoc(s: pchar; adv: longint): Tcmdual; cdecl; external libmgl;
function mgl_expi(a: Tmdual): Tcmdual; cdecl; external libmgl;

function mgl_create_datac: THADT; cdecl; external libmgl;
function mgl_create_datac_size(nx: Tclong; ny: Tclong; nz: Tclong): THADT; cdecl; external libmgl;
function mgl_create_datac_file(fname: pchar): THADT; cdecl; external libmgl;
procedure mgl_delete_datac(dat: THADT); cdecl; external libmgl;

procedure mgl_datac_rearrange(dat: THADT; mx: Tclong; my: Tclong; mz: Tclong); cdecl; external libmgl;
procedure mgl_datac_link(dat: THADT; A: Pmdual; mx: Tclong; my: Tclong; mz: Tclong); cdecl; external libmgl;
procedure mgl_datac_set_float(dat: THADT; A: Psingle; mx: Tclong; my: Tclong; mz: Tclong); cdecl; external libmgl;
procedure mgl_datac_set_double(dat: THADT; A: Pdouble; mx: Tclong; my: Tclong; mz: Tclong); cdecl; external libmgl;
procedure mgl_datac_set_complex(dat: THADT; A: Pmdual; mx: Tclong; my: Tclong; mz: Tclong); cdecl; external libmgl;
procedure mgl_datac_set(dat: THADT; a: THCDT); cdecl; external libmgl;
procedure mgl_datac_set_vector(dat: THADT; v: Pgsl_vector); cdecl; external libmgl;
procedure mgl_datac_set_matrix(dat: THADT; m: Pgsl_matrix); cdecl; external libmgl;
procedure mgl_datac_set_value(dat: THADT; v: Tmdual; i: Tclong; j: Tclong; k: Tclong); cdecl; external libmgl;
function mgl_datac_get_value(dat: THCDT; i: Tclong; j: Tclong; k: Tclong): Tcmdual; cdecl; external libmgl;
procedure mgl_datac_set_values(dat: THADT; val: pchar; nx: Tclong; ny: Tclong; nz: Tclong); cdecl; external libmgl;
function mgl_datac_tridmat(A: THCDT; B: THCDT; C: THCDT; D: THCDT; how: pchar): THADT; cdecl; external libmgl;
function mgl_datac_tridmat_(A: Puintptr_t; B: Puintptr_t; C: Puintptr_t; D: Puintptr_t; how: pchar; para6: longint): Tuintptr_t; cdecl; external libmgl;
function mgl_datac_data(dat: THADT): Pmdual; cdecl; external libmgl;
function mgl_datac_value(dat: THADT; i: Tclong; j: Tclong; k: Tclong): Pmdual; cdecl; external libmgl;
procedure mgl_datac_set_ri(dat: THADT; re: THCDT; im: THCDT); cdecl; external libmgl;
procedure mgl_datac_set_ap(dat: THADT; abs: THCDT; phi: THCDT); cdecl; external libmgl;

function mgl_datac_read(dat: THADT; fname: pchar): longint; cdecl; external libmgl;
function mgl_datac_read_mat(dat: THADT; fname: pchar; dim: Tclong): longint; cdecl; external libmgl;
function mgl_datac_read_dim(dat: THADT; fname: pchar; mx: Tclong; my: Tclong; mz: Tclong): longint; cdecl; external libmgl;
function mgl_datac_read_range(d: THADT; templ: pchar; from: double; to_: double; step: double; as_slice: longint): longint; cdecl; external libmgl;
function mgl_datac_read_all(dat: THADT; templ: pchar; as_slice: longint): longint; cdecl; external libmgl;
procedure mgl_datac_save(dat: THCDT; fname: pchar; ns: Tclong); cdecl; external libmgl;

function mgl_datac_read_hdf(d: THADT; fname: pchar; data: pchar): longint; cdecl; external libmgl;
procedure mgl_datac_save_hdf(d: THCDT; fname: pchar; data: pchar; rewrite: longint); cdecl; external libmgl;

procedure mgl_datac_create(dat: THADT; nx: Tclong; ny: Tclong; nz: Tclong); cdecl; external libmgl;
procedure mgl_datac_transpose(dat: THADT; dim: pchar); cdecl; external libmgl;
function mgl_datac_subdata(dat: THCDT; xx: longint; yy: longint; zz: longint): THADT; cdecl; external libmgl;
function mgl_datac_subdata_ext(dat: THCDT; xx: THCDT; yy: THCDT; zz: THCDT): THADT; cdecl; external libmgl;
function mgl_datac_column(dat: THCDT; eq: pchar): THADT; cdecl; external libmgl;
function mgl_datac_trace(d: THCDT): THADT; cdecl; external libmgl;
function mgl_datac_resize(dat: THCDT; mx: Tclong; my: Tclong; mz: Tclong): THADT; cdecl; external libmgl;
function mgl_datac_resize_box(dat: THCDT; mx: Tclong; my: Tclong; mz: Tclong; x1: Tmreal; x2: Tmreal; y1: Tmreal; y2: Tmreal; z1: Tmreal; z2: Tmreal): THADT; cdecl; external libmgl;
function mgl_datac_momentum(dat: THCDT; dir: char; how: pchar): THADT; cdecl; external libmgl;
function mgl_datac_evaluate(dat: THCDT; idat: THCDT; jdat: THCDT; kdat: THCDT; norm: longint): THADT; cdecl; external libmgl;
function mgl_datac_sum(dat: THCDT; dir: pchar): THADT; cdecl; external libmgl;
function mgl_datac_combine(dat1: THCDT; dat2: THCDT): THADT; cdecl; external libmgl;
function mgl_datac_section(dat: THCDT; ids: THCDT; dir: char; val: Tmreal): THADT; cdecl; external libmgl;
function mgl_datac_section_val(dat: THCDT; id: Tclong; dir: char; val: Tmreal): THADT; cdecl; external libmgl;
function mgl_formula_calc_c(str: pchar; n: Tclong): THADT; cdecl; varargs; external libmgl;

procedure mgl_datac_fill(dat: THADT; x1: Tmdual; x2: Tmdual; dir: char); cdecl; external libmgl;
procedure mgl_datac_fill_eq(gr: THMGL; dat: THADT; eq: pchar; vdat: THCDT; wdat: THCDT; opt: pchar); cdecl; external libmgl;
procedure mgl_datac_refill_gs(dat: THADT; xdat: THCDT; vdat: THCDT; x1: Tmreal; x2: Tmreal; sl: Tclong); cdecl; external libmgl;
procedure mgl_datac_refill_x(dat: THADT; xdat: THCDT; vdat: THCDT; x1: Tmreal; x2: Tmreal; sl: Tclong); cdecl; external libmgl;
procedure mgl_datac_refill_xy(dat: THADT; xdat: THCDT; ydat: THCDT; vdat: THCDT; x1: Tmreal; x2: Tmreal; y1: Tmreal; y2: Tmreal; sl: Tclong); cdecl; external libmgl;
procedure mgl_datac_refill_xyz(dat: THADT; xdat: THCDT; ydat: THCDT; zdat: THCDT; vdat: THCDT; x1: Tmreal; x2: Tmreal; y1: Tmreal; y2: Tmreal; z1: Tmreal; z2: Tmreal); cdecl; external libmgl;
procedure mgl_datac_refill_gr(gr: THMGL; dat: THADT; xdat: THCDT; ydat: THCDT; zdat: THCDT; vdat: THCDT; sl: Tclong; opt: pchar); cdecl; external libmgl;

procedure mgl_datac_modify(dat: THADT; eq: pchar; dim: Tclong); cdecl; external libmgl;
procedure mgl_datac_modify_vw(dat: THADT; eq: pchar; vdat: THCDT; wdat: THCDT); cdecl; external libmgl;

procedure mgl_datac_limit(dat: THADT; v: Tmreal); cdecl; external libmgl;
procedure mgl_datac_keep(dat: THADT; how: pchar; i: longint; j: longint); cdecl; external libmgl;

procedure mgl_datac_put_val(dat: THADT; val: Tmdual; i: Tclong; j: Tclong; k: Tclong); cdecl; external libmgl;
procedure mgl_datac_put_dat(dat: THADT; val: THCDT; i: Tclong; j: Tclong; k: Tclong); cdecl; external libmgl;

procedure mgl_datac_squeeze(dat: THADT; rx: Tclong; ry: Tclong; rz: Tclong; smooth: longint); cdecl; external libmgl;
procedure mgl_datac_extend(dat: THADT; n1: Tclong; n2: Tclong); cdecl; external libmgl;
procedure mgl_datac_insert(dat: THADT; dir: char; at: Tclong; num: Tclong); cdecl; external libmgl;
procedure mgl_datac_delete(dat: THADT; dir: char; at: Tclong; num: Tclong); cdecl; external libmgl;
procedure mgl_datac_join(dat: THADT; d: THCDT); cdecl; external libmgl;

procedure mgl_datac_smooth(d: THADT; dirs: pchar; delta: Tmreal); cdecl; external libmgl;
procedure mgl_datac_cumsum(dat: THADT; dir: pchar); cdecl; external libmgl;
procedure mgl_datac_integral(dat: THADT; dir: pchar); cdecl; external libmgl;
procedure mgl_datac_diff(dat: THADT; dir: pchar); cdecl; external libmgl;
procedure mgl_datac_diff_par(dat: THADT; v1: THCDT; v2: THCDT; v3: THCDT); cdecl; external libmgl;
procedure mgl_datac_diff2(dat: THADT; dir: pchar); cdecl; external libmgl;
procedure mgl_datac_swap(dat: THADT; dir: pchar); cdecl; external libmgl;
procedure mgl_datac_roll(dat: THADT; dir: char; num: Tclong); cdecl; external libmgl;
procedure mgl_datac_mirror(dat: THADT; dir: pchar); cdecl; external libmgl;
procedure mgl_datac_crop(dat: THADT; n1: Tclong; n2: Tclong; dir: char); cdecl; external libmgl;
procedure mgl_datac_crop_opt(dat: THADT; how: pchar); cdecl; external libmgl;
procedure mgl_datac_mul_dat(dat: THADT; d: THCDT); cdecl; external libmgl;
procedure mgl_datac_div_dat(dat: THADT; d: THCDT); cdecl; external libmgl;
procedure mgl_datac_add_dat(dat: THADT; d: THCDT); cdecl; external libmgl;
procedure mgl_datac_sub_dat(dat: THADT; d: THCDT); cdecl; external libmgl;
procedure mgl_datac_mul_num(dat: THADT; d: Tmdual); cdecl; external libmgl;
procedure mgl_datac_div_num(dat: THADT; d: Tmdual); cdecl; external libmgl;
procedure mgl_datac_add_num(dat: THADT; d: Tmdual); cdecl; external libmgl;
procedure mgl_datac_sub_num(dat: THADT; d: Tmdual); cdecl; external libmgl;
procedure mgl_datac_hankel(dat: THADT; dir: pchar); cdecl; external libmgl;
procedure mgl_datac_sinfft(dat: THADT; dir: pchar); cdecl; external libmgl;
procedure mgl_datac_cosfft(dat: THADT; dir: pchar); cdecl; external libmgl;
procedure mgl_datac_fft(dat: THADT; dir: pchar); cdecl; external libmgl;
function mgl_datac_correl(dat1: THCDT; dat2: THCDT; dir: pchar): THADT; cdecl; external libmgl;
procedure mgl_datac_diffr(dat: THADT; how: pchar; q: Tmreal); cdecl; external libmgl;
procedure mgl_datac_wavelet(dat: THADT; how: pchar; k: longint); cdecl; external libmgl;
procedure mgl_datac_envelop(dat: THADT; dir: char); cdecl; external libmgl;
function mgl_datac_real(dat: THCDT): THMDT; cdecl; external libmgl;
function mgl_datac_imag(dat: THCDT): THMDT; cdecl; external libmgl;
function mgl_datac_abs(dat: THCDT): THMDT; cdecl; external libmgl;
function mgl_datac_arg(dat: THCDT): THMDT; cdecl; external libmgl;
function mgl_datac_norm(dat: THCDT): THMDT; cdecl; external libmgl;
function mgl_datac_linear(d: THCDT; x: Tmreal; y: Tmreal; z: Tmreal): Tcmdual; cdecl; external libmgl;
function mgl_datac_linear_ext(d: THCDT; x: Tmreal; y: Tmreal; z: Tmreal; dx: Pmdual; dy: Pmdual; dz: Pmdual): Tcmdual; cdecl; external libmgl;
function mgl_datac_spline(dat: THCDT; x: Tmreal; y: Tmreal; z: Tmreal): Tcmdual; cdecl; external libmgl;
function mgl_datac_spline_ext(dat: THCDT; x: Tmreal; y: Tmreal; z: Tmreal; dx: Pmdual;
  dy: Pmdual; dz: Pmdual): Tcmdual; cdecl; external libmgl;
function mgl_gsplinec_init(x: THCDT; v: THCDT): THADT; cdecl; external libmgl;
function mgl_gsplinec(coef: THCDT; dx: Tmreal; d1: Pmdual; d2: Pmdual): Tcmdual; cdecl; external libmgl;
function mgl_find_roots_txt_c(func: pchar; vars: pchar; ini: THCDT): THADT; cdecl; external libmgl;

// === Konventiert am: 26-6-25 19:45:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
