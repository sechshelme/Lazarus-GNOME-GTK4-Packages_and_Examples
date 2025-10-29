{$IFDEF read_interface}


type
  Pgsl_vector = ^Tgsl_vector;
  Tgsl_vector = pointer;

  Pgsl_matrix = ^Tgsl_matrix;
  Tgsl_matrix = pointer;

function mgl_ipow(x: double; n: longint): double; cdecl; external libmgl;
function mgl_get_time(time: pchar; fmt: pchar): double; cdecl; external libmgl;

function mgl_create_data: THMDT; cdecl; external libmgl;
function mgl_create_data_size(nx: Tclong; ny: Tclong; nz: Tclong): THMDT; cdecl; external libmgl;
function mgl_create_data_file(fname: pchar): THMDT; cdecl; external libmgl;
procedure mgl_delete_data(dat: THMDT); cdecl; external libmgl;

procedure mgl_data_rearrange(dat: THMDT; mx: Tclong; my: Tclong; mz: Tclong); cdecl; external libmgl;
procedure mgl_data_link(dat: THMDT; A: Pmreal; mx: Tclong; my: Tclong; mz: Tclong); cdecl; external libmgl;
procedure mgl_data_set_float(dat: THMDT; A: Psingle; mx: Tclong; my: Tclong; mz: Tclong); cdecl; external libmgl;
procedure mgl_data_set_double(dat: THMDT; A: Pdouble; mx: Tclong; my: Tclong; mz: Tclong); cdecl; external libmgl;
procedure mgl_data_set_float2(d: THMDT; A: PPsingle; N1: Tclong; N2: Tclong); cdecl; external libmgl;
procedure mgl_data_set_double2(d: THMDT; A: PPdouble; N1: Tclong; N2: Tclong); cdecl; external libmgl;
procedure mgl_data_set_float3(d: THMDT; A: PPPsingle; N1: Tclong; N2: Tclong; N3: Tclong); cdecl; external libmgl;
procedure mgl_data_set_double3(d: THMDT; A: PPPdouble; N1: Tclong; N2: Tclong; N3: Tclong); cdecl; external libmgl;
procedure mgl_data_set(dat: THMDT; a: THCDT); cdecl; external libmgl;
procedure mgl_data_set_vector(dat: THMDT; v: Pgsl_vector); cdecl; external libmgl;
procedure mgl_data_set_matrix(dat: THMDT; m: Pgsl_matrix); cdecl; external libmgl;
procedure mgl_data_set_value(dat: THMDT; v: Tmreal; i: Tclong; j: Tclong; k: Tclong); cdecl; external libmgl;
function mgl_data_get_value(dat: THCDT; i: Tclong; j: Tclong; k: Tclong): Tmreal; cdecl; external libmgl;
procedure mgl_data_set_values(dat: THMDT; val: pchar; nx: Tclong; ny: Tclong; nz: Tclong); cdecl; external libmgl;

function mgl_data_read_hdf(d: THMDT; fname: pchar; data: pchar): longint; cdecl; external libmgl;
function mgl_data_read(dat: THMDT; fname: pchar): longint; cdecl; external libmgl;
function mgl_data_read_mat(dat: THMDT; fname: pchar; dim: Tclong): longint; cdecl; external libmgl;
function mgl_data_read_dim(dat: THMDT; fname: pchar; mx: Tclong; my: Tclong; mz: Tclong): longint; cdecl; external libmgl;
function mgl_data_read_range(d: THMDT; templ: pchar; n1: double; n2: double; step: double; as_slice: longint): longint; cdecl; external libmgl;
function mgl_data_read_all(dat: THMDT; templ: pchar; as_slice: longint): longint; cdecl; external libmgl;
function mgl_data_read_bin(dat: THMDT; fname: pchar; _type: longint): longint; cdecl; external libmgl;
procedure mgl_data_import(dat: THMDT; fname: pchar; scheme: pchar; v1: Tmreal; v2: Tmreal); cdecl; external libmgl;
function mgl_data_scan_file(dat: THMDT; fname: pchar; templ: pchar): longint; cdecl; external libmgl;
function mgl_data_read_wfm(d: THMDT; fname: pchar; num: Tclong; step: Tclong; start: Tclong): longint; cdecl; external libmgl;
function mgl_data_read_matlab(d: THMDT; fname: pchar; data: pchar): longint; cdecl; external libmgl;

procedure mgl_data_create(dat: THMDT; nx: Tclong; ny: Tclong; nz: Tclong); cdecl; external libmgl;
procedure mgl_data_transpose(dat: THMDT; dim: pchar); cdecl; external libmgl;
procedure mgl_data_norm(dat: THMDT; v1: Tmreal; v2: Tmreal; sym: longint; dim: longint); cdecl; external libmgl;
procedure mgl_data_norm_slice(dat: THMDT; v1: Tmreal; v2: Tmreal; dir: char; keep_en: longint; sym: longint); cdecl; external libmgl;
procedure mgl_data_limit(dat: THMDT; v: Tmreal); cdecl; external libmgl;
procedure mgl_data_coil(dat: THMDT; v1: Tmreal; v2: Tmreal; sep: longint); cdecl; external libmgl;
procedure mgl_data_keep(dat: THMDT; how: pchar; i: Tclong; j: Tclong); cdecl; external libmgl;

function mgl_data_subdata(dat: THCDT; xx: Tclong; yy: Tclong; zz: Tclong): THMDT; cdecl; external libmgl;
function mgl_data_subdata_ext(dat: THCDT; xx: THCDT; yy: THCDT; zz: THCDT): THMDT; cdecl; external libmgl;
function mgl_data_column(dat: THCDT; eq: pchar): THMDT; cdecl; external libmgl;
function mgl_data_section(dat: THCDT; ids: THCDT; dir: char; val: Tmreal): THMDT; cdecl; external libmgl;
function mgl_data_section_val(dat: THCDT; id: Tclong; dir: char; val: Tmreal): THMDT; cdecl; external libmgl;
function mgl_data_conts(val: Tmreal; dat: THCDT): THMDT; cdecl; external libmgl;
function mgl_formula_calc(str: pchar; n: longint): THMDT; cdecl; varargs; external libmgl;

procedure mgl_data_fill(dat: THMDT; x1: Tmreal; x2: Tmreal; dir: char); cdecl; external libmgl;
procedure mgl_data_fill_eq(gr: THMGL; dat: THMDT; eq: pchar; vdat: THCDT; wdat: THCDT; opt: pchar); cdecl; external libmgl;
procedure mgl_data_refill_gs(dat: THMDT; xdat: THCDT; vdat: THCDT; x1: Tmreal; x2: Tmreal; sl: Tclong); cdecl; external libmgl;
procedure mgl_data_refill_x(dat: THMDT; xdat: THCDT; vdat: THCDT; x1: Tmreal; x2: Tmreal; sl: Tclong); cdecl; external libmgl;
procedure mgl_data_refill_xy(dat: THMDT; xdat: THCDT; ydat: THCDT; vdat: THCDT; x1: Tmreal; x2: Tmreal; y1: Tmreal; y2: Tmreal; sl: Tclong); cdecl; external libmgl;
procedure mgl_data_refill_xyz(dat: THMDT; xdat: THCDT; ydat: THCDT; zdat: THCDT; vdat: THCDT; x1: Tmreal; x2: Tmreal; y1: Tmreal; y2: Tmreal; z1: Tmreal; z2: Tmreal); cdecl; external libmgl;
procedure mgl_data_refill_gr(gr: THMGL; dat: THMDT; xdat: THCDT; ydat: THCDT; zdat: THCDT; vdat: THCDT; sl: Tclong; opt: pchar); cdecl; external libmgl;
procedure mgl_data_grid(gr: THMGL; d: THMDT; xdat: THCDT; ydat: THCDT; zdat: THCDT; opt: pchar); cdecl; external libmgl;
procedure mgl_data_grid_xy(d: THMDT; xdat: THCDT; ydat: THCDT; zdat: THCDT; x1: Tmreal; x2: Tmreal; y1: Tmreal; y2: Tmreal); cdecl; external libmgl;
procedure mgl_data_put_val(dat: THMDT; val: Tmreal; i: Tclong; j: Tclong; k: alias); cdecl; external libmgl;
procedure mgl_data_put_dat(dat: THMDT; val: THCDT; i: Tclong; j: alias; k: Tclong); cdecl; external libmgl;
procedure mgl_data_modify(dat: THMDT; eq: pchar; dim: Tclong); cdecl; external libmgl;
procedure mgl_data_modify_vw(dat: THMDT; eq: pchar; vdat: THCDT; wdat: THCDT); cdecl; external libmgl;
procedure mgl_data_squeeze(dat: THMDT; rx: Tclong; ry: Tclong; rz: Tclong; smooth: Tclong); cdecl; external libmgl;

function mgl_data_ifs_2d(A: THCDT; n: Tclong; skip: Tclong): THMDT; cdecl; external libmgl;
function mgl_data_ifs_3d(A: THCDT; n: Tclong; skip: Tclong): THMDT; cdecl; external libmgl;
function mgl_data_ifs_file(fname: pchar; name: pchar; n: Tclong; skip: Tclong): THMDT; cdecl; external libmgl;

const
  mglFlame2d_linear = 0;
  mglFlame2d_sinusoidal = 1;
  mglFlame2d_spherical = 2;
  mglFlame2d_swirl = 3;
  mglFlame2d_horseshoe = 4;
  mglFlame2d_polar = 5;
  mglFlame2d_handkerchief = 6;
  mglFlame2d_heart = 7;
  mglFlame2d_disc = 8;
  mglFlame2d_spiral = 9;
  mglFlame2d_hyperbolic = 10;
  mglFlame2d_diamond = 11;
  mglFlame2d_ex = 12;
  mglFlame2d_julia = 13;
  mglFlame2d_bent = 14;
  mglFlame2d_waves = 15;
  mglFlame2d_fisheye = 16;
  mglFlame2d_popcorn = 17;
  mglFlame2d_exponential = 18;
  mglFlame2d_power = 19;
  mglFlame2d_cosine = 20;
  mglFlame2d_rings = 21;
  mglFlame2d_fan = 22;
  mglFlame2d_blob = 23;
  mglFlame2d_pdj = 24;
  mglFlame2d_fan2 = 25;
  mglFlame2d_rings2 = 26;
  mglFlame2d_eyefish = 27;
  mglFlame2d_bubble = 28;
  mglFlame2d_cylinder = 29;
  mglFlame2d_perspective = 30;
  mglFlame2d_noise = 31;
  mglFlame2d_juliaN = 32;
  mglFlame2d_juliaScope = 33;
  mglFlame2d_blur = 34;
  mglFlame2d_gaussian = 35;
  mglFlame2d_radialBlur = 36;
  mglFlame2d_pie = 37;
  mglFlame2d_ngon = 38;
  mglFlame2d_curl = 39;
  mglFlame2d_rectangles = 40;
  mglFlame2d_arch = 41;
  mglFlame2d_tangent = 42;
  mglFlame2d_square = 43;
  mglFlame2d_blade = 44;
  mglFlame2d_secant = 45;
  mglFlame2d_rays = 46;
  mglFlame2d_twintrian = 47;
  mglFlame2d_cross = 48;
  mglFlame2d_disc2 = 49;
  mglFlame2d_supershape = 50;
  mglFlame2d_flower = 51;
  mglFlame2d_conic = 52;
  mglFlame2d_parabola = 53;
  mglFlame2d_bent2 = 54;
  mglFlame2d_bipolar = 55;
  mglFlame2d_boarders = 56;
  mglFlame2d_butterfly = 57;
  mglFlame2d_cell = 58;
  mglFlame2d_cpow = 59;
  mglFlame2d_curve = 60;
  mglFlame2d_edisc = 61;
  mglFlame2d_elliptic = 62;
  mglFlame2d_escher = 63;
  mglFlame2d_foci = 64;
  mglFlame2d_lazySusan = 65;
  mglFlame2d_loonie = 66;
  mglFlame2d_preBlur = 67;
  mglFlame2d_modulus = 68;
  mglFlame2d_oscope = 69;
  mglFlame2d_polar2 = 70;
  mglFlame2d_popcorn2 = 71;
  mglFlame2d_scry = 72;
  mglFlame2d_separation = 73;
  mglFlame2d_split = 74;
  mglFlame2d_splits = 75;
  mglFlame2d_stripes = 76;
  mglFlame2d_wedge = 77;
  mglFlame2d_wedgeJulia = 78;
  mglFlame2d_wedgeSph = 79;
  mglFlame2d_whorl = 80;
  mglFlame2d_waves2 = 81;
  mglFlame2d_exp = 82;
  mglFlame2d_log = 83;
  mglFlame2d_sin = 84;
  mglFlame2d_cos = 85;
  mglFlame2d_tan = 86;
  mglFlame2d_sec = 87;
  mglFlame2d_csc = 88;
  mglFlame2d_cot = 89;
  mglFlame2d_sinh = 90;
  mglFlame2d_cosh = 91;
  mglFlame2d_tanh = 92;
  mglFlame2d_sech = 93;
  mglFlame2d_csch = 94;
  mglFlame2d_coth = 95;
  mglFlame2d_auger = 96;
  mglFlame2d_flux = 97;
  mglFlame2dLAST = 98;


function mgl_data_flame_2d(A: THCDT; F: THCDT; n: Tclong; skip: Tclong): THMDT; cdecl; external libmgl;
function mgl_data_detect(d: THCDT; lvl: Tmreal; dj: Tmreal; di: Tmreal; min_len: Tmreal): THMDT; cdecl; external libmgl;
function mgl_data_tridmat(A: THCDT; B: THCDT; C: THCDT; D: THCDT; how: pchar): THMDT; cdecl; external libmgl;
function mgl_data_value(dat: THMDT; i: Tclong; j: Tclong; k: Tclong): Pmreal; cdecl; external libmgl;
function mgl_data_data(dat: THMDT): Pmreal; cdecl; external libmgl;
function mgl_data_get_nx(d: THCDT): Tclong; cdecl; external libmgl;
function mgl_data_get_ny(d: THCDT): Tclong; cdecl; external libmgl;
function mgl_data_get_nz(d: THCDT): Tclong; cdecl; external libmgl;
function mgl_data_combine(dat1: THCDT; dat2: THCDT): THMDT; cdecl; external libmgl;
procedure mgl_data_extend(dat: THMDT; n1: Tclong; n2: Tclong); cdecl; external libmgl;
procedure mgl_data_insert(dat: THMDT; dir: char; at: Tclong; num: Tclong); cdecl; external libmgl;
procedure mgl_data_delete(dat: THMDT; dir: char; at: Tclong; num: Tclong); cdecl; external libmgl;
procedure mgl_data_join(dat: THMDT; d: THCDT); cdecl; external libmgl;
procedure mgl_data_smooth(d: THMDT; dirs: pchar; delta: Tmreal); cdecl; external libmgl;
function mgl_data_sum(dat: THCDT; dir: pchar): THMDT; cdecl; external libmgl;
function mgl_data_first_dir(dat: THCDT; dir: pchar; val: double): THMDT; cdecl; external libmgl;
function mgl_data_last_dir(dat: THCDT; dir: pchar; val: double): THMDT; cdecl; external libmgl;
function mgl_data_max_dir(dat: THCDT; dir: pchar): THMDT; cdecl; external libmgl;
function mgl_data_min_dir(dat: THCDT; dir: pchar): THMDT; cdecl; external libmgl;
function mgl_data_minmax(dat: THCDT): THMDT; cdecl; external libmgl;
function mgl_data_connect(a: THCDT; b: THCDT): THMDT; cdecl; external libmgl;
procedure mgl_data_connect_r(a: THMDT; b: THMDT); cdecl; external libmgl;
procedure mgl_data_cumsum(dat: THMDT; dir: pchar); cdecl; external libmgl;
procedure mgl_data_integral(dat: THMDT; dir: pchar); cdecl; external libmgl;
procedure mgl_data_diff(dat: THMDT; dir: pchar); cdecl; external libmgl;
procedure mgl_data_diff_par(dat: THMDT; v1: THCDT; v2: THCDT; v3: THCDT); cdecl; external libmgl;
procedure mgl_data_diff2(dat: THMDT; dir: pchar); cdecl; external libmgl;
procedure mgl_data_swap(dat: THMDT; dir: pchar); cdecl; external libmgl;
procedure mgl_data_roll(dat: THMDT; dir: char; num: Tclong); cdecl; external libmgl;
procedure mgl_data_mirror(dat: THMDT; dir: pchar); cdecl; external libmgl;
procedure mgl_data_sort(dat: THMDT; idx: Tclong; idy: Tclong); cdecl; external libmgl;
procedure mgl_data_dilate(dat: THMDT; val: Tmreal; step: Tclong); cdecl; external libmgl;
procedure mgl_data_erode(dat: THMDT; val: Tmreal; step: Tclong); cdecl; external libmgl;
procedure mgl_data_hankel(dat: THMDT; dir: pchar); cdecl; external libmgl;
procedure mgl_data_sinfft(dat: THMDT; dir: pchar); cdecl; external libmgl;
procedure mgl_data_cosfft(dat: THMDT; dir: pchar); cdecl; external libmgl;
procedure mgl_data_fill_sample(dat: THMDT; how: pchar); cdecl; external libmgl;
function mgl_data_correl(dat1: THCDT; dat2: THCDT; dir: pchar): THMDT; cdecl; external libmgl;
procedure mgl_data_wavelet(dat: THMDT; how: pchar; k: longint); cdecl; external libmgl;

function mgl_fft_alloc(n: Tclong; space: Ppointer; nthr: Tclong): pointer; cdecl; external libmgl;
function mgl_fft_alloc_thr(n: Tclong): pointer; cdecl; external libmgl;
procedure mgl_fft_free(wt: pointer; ws: Ppointer; nthr: Tclong); cdecl; external libmgl;
procedure mgl_fft_free_thr(wt: pointer); cdecl; external libmgl;
procedure mgl_fft(x: Pdouble; s: Tclong; n: Tclong; wt: pointer; ws: pointer; inv: longint); cdecl; external libmgl;
procedure mgl_clear_fft; cdecl; external libmgl;

function mgl_data_spline(dat: THCDT; x: Tmreal; y: Tmreal; z: Tmreal): Tmreal; cdecl; external libmgl;
function mgl_data_spline_ext(dat: THCDT; x: Tmreal; y: Tmreal; z: Tmreal; dx: Pmreal; dy: Pmreal; dz: Pmreal): Tmreal; cdecl; external libmgl;
function mgl_gspline_init(x: THCDT; v: THCDT): THMDT; cdecl; external libmgl;
function mgl_gspline(coef: THCDT; dx: Tmreal; d1: Pmreal; d2: Pmreal): Tmreal; cdecl; external libmgl;
function mgl_data_solve_1d(dat: THCDT; val: Tmreal; spl: longint; i0: Tclong): Tmreal; cdecl; external libmgl;
function mgl_data_solve(dat: THCDT; val: Tmreal; dir: char; i0: THCDT; norm: longint): THMDT; cdecl; external libmgl;
function mgl_data_trace(d: THCDT): THMDT; cdecl; external libmgl;
function mgl_data_resize(dat: THCDT; mx: Tclong; my: Tclong; mz: Tclong): THMDT; cdecl; external libmgl;
function mgl_data_resize_box(dat: THCDT; mx: Tclong; my: Tclong; mz: Tclong; x1: Tmreal; x2: Tmreal; y1: Tmreal; y2: Tmreal; z1: Tmreal; z2: Tmreal): THMDT; cdecl; external libmgl;
function mgl_data_hist(dat: THCDT; n: Tclong; v1: Tmreal; v2: Tmreal; nsub: Tclong): THMDT; cdecl; external libmgl;
function mgl_data_hist_w(dat: THCDT; weight: THCDT; n: Tclong; v1: Tmreal; v2: Tmreal; nsub: Tclong): THMDT; cdecl; external libmgl;
function mgl_data_momentum(dat: THCDT; dir: char; how: pchar): THMDT; cdecl; external libmgl;
function mgl_data_pulse(dat: THCDT; dir: char): THMDT; cdecl; external libmgl;
function mgl_data_evaluate(dat: THCDT; idat: THCDT; jdat: THCDT; kdat: THCDT; norm: longint): THMDT; cdecl; external libmgl;
procedure mgl_data_envelop(dat: THMDT; dir: char); cdecl; external libmgl;
procedure mgl_data_sew(dat: THMDT; dirs: pchar; da: Tmreal); cdecl; external libmgl;
procedure mgl_data_crop(dat: THMDT; n1: Tclong; n2: Tclong; dir: char); cdecl; external libmgl;
procedure mgl_data_crop_opt(dat: THMDT; how: pchar); cdecl; external libmgl;
procedure mgl_data_clean(dat: THMDT; id: Tclong); cdecl; external libmgl;
procedure mgl_data_mul_dat(dat: THMDT; d: THCDT); cdecl; external libmgl;
procedure mgl_data_div_dat(dat: THMDT; d: THCDT); cdecl; external libmgl;
procedure mgl_data_add_dat(dat: THMDT; d: THCDT); cdecl; external libmgl;
procedure mgl_data_sub_dat(dat: THMDT; d: THCDT); cdecl; external libmgl;
procedure mgl_data_mul_num(dat: THMDT; d: Tmreal); cdecl; external libmgl;
procedure mgl_data_div_num(dat: THMDT; d: Tmreal); cdecl; external libmgl;
procedure mgl_data_add_num(dat: THMDT; d: Tmreal); cdecl; external libmgl;
procedure mgl_data_sub_num(dat: THMDT; d: Tmreal); cdecl; external libmgl;

function mgl_transform_a(am: THCDT; ph: THCDT; tr: pchar): THMDT; cdecl; external libmgl;
function mgl_transform(re: THCDT; im: THCDT; tr: pchar): THMDT; cdecl; external libmgl;
procedure mgl_data_fourier(re: THMDT; im: THMDT; dir: pchar); cdecl; external libmgl;
function mgl_data_stfa(re: THCDT; im: THCDT; dn: Tclong; dir: char): THMDT; cdecl; external libmgl;
function mgl_triangulation_3d(x: THCDT; y: THCDT; z: THCDT): THMDT; cdecl; external libmgl;
function mgl_triangulation_2d(x: THCDT; y: THCDT): THMDT; cdecl; external libmgl;

type
  Troot_func = function(val: Tmreal; par: pointer): Tmreal; cdecl;
  Troots_func = procedure(x: Pmreal; f: Pmreal; par: pointer); cdecl;

function mgl_find_root(func: Troot_func; ini: Tmreal; par: pointer): Tmreal; cdecl; external libmgl;
function mgl_find_root_txt(func: pchar; ini: Tmreal; var_id: char): Tmreal; cdecl; external libmgl;
function mgl_data_roots(func: pchar; ini: THCDT; var_id: char): THMDT; cdecl; external libmgl;
function mgl_find_roots_txt(func: pchar; vars: pchar; ini: THCDT): THMDT; cdecl; external libmgl;
function mgl_find_roots(n: Tsize_t; func: Troots_func; x0: Pmreal; par: pointer): longint; cdecl; external libmgl;

function mgl_rnd_integer(lo: Tclong; hi: Tclong): Tmreal; cdecl; external libmgl;
function mgl_rnd_uniform(lo: Tmreal; hi: Tmreal): Tmreal; cdecl; external libmgl;
function mgl_rnd_bernoulli(p: Tmreal): Tmreal; cdecl; external libmgl;
function mgl_rnd_binomial(trials: Tclong; p: Tmreal): longint; cdecl; external libmgl;
function mgl_rnd_gaussian(mu: Tmreal; sigma: Tmreal): Tmreal; cdecl; external libmgl;
function mgl_rnd_exponential(lambda: Tmreal): Tmreal; cdecl; external libmgl;
function mgl_rnd_discrete(A: THCDT): Tclong; cdecl; external libmgl;

procedure mgl_data_rnd_integer(d: THMDT; lo: Tclong; hi: Tclong); cdecl; external libmgl;
procedure mgl_data_rnd_uniform(d: THMDT; lo: Tmreal; hi: Tmreal); cdecl; external libmgl;
procedure mgl_data_rnd_bernoulli(d: THMDT; p: Tmreal); cdecl; external libmgl;
procedure mgl_data_rnd_binomial(d: THMDT; trials: Tclong; p: Tmreal); cdecl; external libmgl;
procedure mgl_data_rnd_gaussian(d: THMDT; mu: Tmreal; sigma: Tmreal); cdecl; external libmgl;
procedure mgl_data_rnd_exponential(d: THMDT; lambda: Tmreal); cdecl; external libmgl;
procedure mgl_data_rnd_discrete(d: THMDT; A: THCDT); cdecl; external libmgl;
procedure mgl_shuffle(d: THMDT; dir: char); cdecl; external libmgl;
procedure mgl_data_brownian(d: THMDT; y1: Tmreal; y2: Tmreal; sigma: Tmreal; alpha: Tmreal); cdecl; external libmgl;
procedure mgl_data_brownian_(d: Puintptr_t; y1: Pdouble; y2: Pdouble; sigma: Pdouble; alpha: Pdouble); cdecl; external libmgl;

// === Konventiert am: 26-6-25 19:46:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
