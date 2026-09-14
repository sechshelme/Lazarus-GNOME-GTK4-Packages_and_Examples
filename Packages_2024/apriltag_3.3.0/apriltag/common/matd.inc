{$IFDEF read_interface}


type
  Pmatd_t = ^Tmatd_t;
  Tmatd_t = record
    nrows: dword;
    ncols: dword;
    data: Pdouble;
  end;

const
  MATD_EPS = 1e-8;

function matd_create(rows: longint; cols: longint): Pmatd_t; cdecl; external libapriltag;
function matd_create_data(rows: longint; cols: longint; data: Pdouble): Pmatd_t; cdecl; external libapriltag;
function matd_create_dataf(rows: longint; cols: longint; data: Psingle): Pmatd_t; cdecl; external libapriltag;
function matd_identity(dim: longint): Pmatd_t; cdecl; external libapriltag;
function matd_create_scalar(v: Tdouble): Pmatd_t; cdecl; external libapriltag;
function matd_get(m: Pmatd_t; row: longint; col: longint): Tdouble; cdecl; external libapriltag;
procedure matd_put(m: Pmatd_t; row: longint; col: longint; value: Tdouble); cdecl; external libapriltag;
function matd_get_scalar(m: Pmatd_t): Tdouble; cdecl; external libapriltag;
procedure matd_put_scalar(m: Pmatd_t; value: Tdouble); cdecl; external libapriltag;
function matd_copy(m: Pmatd_t): Pmatd_t; cdecl; external libapriltag;
function matd_select(a: Pmatd_t; r0: longint; r1: longint; c0: longint; c1: longint): Pmatd_t; cdecl; external libapriltag;
procedure matd_print(m: Pmatd_t; fmt: pchar); cdecl; external libapriltag;
procedure matd_print_transpose(m: Pmatd_t; fmt: pchar); cdecl; external libapriltag;
function matd_add(a: Pmatd_t; b: Pmatd_t): Pmatd_t; cdecl; external libapriltag;
procedure matd_add_inplace(a: Pmatd_t; b: Pmatd_t); cdecl; external libapriltag;
function matd_subtract(a: Pmatd_t; b: Pmatd_t): Pmatd_t; cdecl; external libapriltag;
procedure matd_subtract_inplace(a: Pmatd_t; b: Pmatd_t); cdecl; external libapriltag;
function matd_scale(a: Pmatd_t; s: Tdouble): Pmatd_t; cdecl; external libapriltag;
procedure matd_scale_inplace(a: Pmatd_t; s: Tdouble); cdecl; external libapriltag;
function matd_multiply(a: Pmatd_t; b: Pmatd_t): Pmatd_t; cdecl; external libapriltag;
function matd_transpose(a: Pmatd_t): Pmatd_t; cdecl; external libapriltag;
function matd_det(a: Pmatd_t): Tdouble; cdecl; external libapriltag;
function matd_inverse(a: Pmatd_t): Pmatd_t; cdecl; external libapriltag;

procedure matd_set_data(m: Pmatd_t; data: PDouble);
function matd_is_scalar(a: Pmatd_t): boolean;
function matd_is_vector(a: Pmatd_t): boolean;
function matd_is_vector_len(a: Pmatd_t; len: integer): boolean;

function matd_vec_mag(a: Pmatd_t): Tdouble; cdecl; external libapriltag;
function matd_vec_dist(a: Pmatd_t; b: Pmatd_t): Tdouble; cdecl; external libapriltag;
function matd_vec_dist_n(a: Pmatd_t; b: Pmatd_t; n: longint): Tdouble; cdecl; external libapriltag;
function matd_vec_dot_product(a: Pmatd_t; b: Pmatd_t): Tdouble; cdecl; external libapriltag;
function matd_vec_normalize(a: Pmatd_t): Pmatd_t; cdecl; external libapriltag;
function matd_crossproduct(a: Pmatd_t; b: Pmatd_t): Pmatd_t; cdecl; external libapriltag;
function matd_err_inf(a: Pmatd_t; b: Pmatd_t): Tdouble; cdecl; external libapriltag;
function matd_op(expr: pchar): Pmatd_t; cdecl; varargs; external libapriltag;
procedure matd_destroy(m: Pmatd_t); cdecl; external libapriltag;

type
  Pmatd_svd_t = ^Tmatd_svd_t;
  Tmatd_svd_t = record
    U: Pmatd_t;
    S: Pmatd_t;
    V: Pmatd_t;
  end;

function matd_svd(A: Pmatd_t): Tmatd_svd_t; cdecl; external libapriltag;

const
  MATD_SVD_NO_WARNINGS = 1;

function matd_svd_flags(A: Pmatd_t; flags: longint): Tmatd_svd_t; cdecl; external libapriltag;

type
  Pmatd_plu_t = ^Tmatd_plu_t;
  Tmatd_plu_t = record
    singular: longint;
    piv: Pdword;
    pivsign: longint;
    lu: Pmatd_t;
  end;

function matd_plu(a: Pmatd_t): Pmatd_plu_t; cdecl; external libapriltag;
procedure matd_plu_destroy(mlu: Pmatd_plu_t); cdecl; external libapriltag;
function matd_plu_det(lu: Pmatd_plu_t): Tdouble; cdecl; external libapriltag;
function matd_plu_p(lu: Pmatd_plu_t): Pmatd_t; cdecl; external libapriltag;
function matd_plu_l(lu: Pmatd_plu_t): Pmatd_t; cdecl; external libapriltag;
function matd_plu_u(lu: Pmatd_plu_t): Pmatd_t; cdecl; external libapriltag;
function matd_plu_solve(mlu: Pmatd_plu_t; b: Pmatd_t): Pmatd_t; cdecl; external libapriltag;
function matd_solve(A: Pmatd_t; b: Pmatd_t): Pmatd_t; cdecl; external libapriltag;

type
  Pmatd_chol_t = ^Tmatd_chol_t;
  Tmatd_chol_t = record
    is_spd: longint;
    u: Pmatd_t;
  end;

function matd_chol(A: Pmatd_t): Pmatd_chol_t; cdecl; external libapriltag;
function matd_chol_solve(chol: Pmatd_chol_t; b: Pmatd_t): Pmatd_t; cdecl; external libapriltag;
procedure matd_chol_destroy(chol: Pmatd_chol_t); cdecl; external libapriltag;
function matd_chol_inverse(a: Pmatd_t): Pmatd_t; cdecl; external libapriltag;
procedure matd_ltransposetriangle_solve(u: Pmatd_t; b: Pdouble; x: Pdouble); cdecl; external libapriltag;
procedure matd_ltriangle_solve(u: Pmatd_t; b: Pdouble; x: Pdouble); cdecl; external libapriltag;
procedure matd_utriangle_solve(u: Pmatd_t; b: Pdouble; x: Pdouble); cdecl; external libapriltag;
function matd_max(m: Pmatd_t): Tdouble; cdecl; external libapriltag;

// === Konventiert am: 12-9-26 17:22:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure matd_set_data(m: Pmatd_t; data: PDouble);
begin
  memcpy(m^.data, data, m^.nrows * m^.ncols * SizeOf(double));
end;

function matd_is_scalar(a: Pmatd_t): boolean;
begin
  if a = nil then  begin
    Halt(1);
  end;
  Result := (a^.ncols <= 1) and (a^.nrows <= 1);
end;

function matd_is_vector(a: Pmatd_t): boolean;
begin
  if a = nil then begin
    Halt(1);
  end;
  Result := (a^.ncols = 1) or (a^.nrows = 1);
end;

function matd_is_vector_len(a: Pmatd_t; len: integer): boolean;
begin
  if a = nil then begin
    Halt(1);
  end;
  Result := ((a^.ncols = 1) and (a^.nrows = DWord(len))) or
    ((a^.ncols = DWord(len)) and (a^.nrows = 1));
end;


{$ENDIF read_implementation}
