{$IFDEF read_interface}


type
  Tlapack_int = Tint32_t;
  Plapack_int = ^Tlapack_int;

  Tlapack_logical = Tlapack_int;
  Plapack_logical = ^Tlapack_logical;

type
  Tlapack_complex_float = record
    real: single;
    imag: single;
  end;
  Plapack_complex_float = ^Tlapack_complex_float;

  Tlapack_complex_double = record
    real: double;
    imag: double;
  end;
  Plapack_complex_double = ^Tlapack_complex_double;


function lapack_complex_float_real(z: Tlapack_complex_float): single;
function lapack_complex_float_imag(z: Tlapack_complex_float): single;

function lapack_complex_double_real(z: Tlapack_complex_double): double;
function lapack_complex_double_imag(z: Tlapack_complex_double): double;

function LAPACK_malloc(__size: Tsize_t): pointer; cdecl; external libc name 'malloc';
procedure LAPACK_free(__ptr: pointer); cdecl; external libc name 'free';

// =======================================

type // /usr/include/lapack.h
  TLAPACK_S_SELECT2 = function(para1: Psingle; para2: Psingle): Tlapack_logical; cdecl;
  TLAPACK_S_SELECT3 = function(para1: Psingle; para2: Psingle; para3: Psingle): Tlapack_logical; cdecl;
  TLAPACK_D_SELECT2 = function(para1: Pdouble; para2: Pdouble): Tlapack_logical; cdecl;
  TLAPACK_D_SELECT3 = function(para1: Pdouble; para2: Pdouble; para3: Pdouble): Tlapack_logical; cdecl;
  TLAPACK_C_SELECT1 = function(para1: Plapack_complex_float): Tlapack_logical; cdecl;
  TLAPACK_C_SELECT2 = function(para1: Plapack_complex_float; para2: Plapack_complex_float): Tlapack_logical; cdecl;
  TLAPACK_Z_SELECT1 = function(para1: Plapack_complex_double): Tlapack_logical; cdecl;
  TLAPACK_Z_SELECT2 = function(para1: Plapack_complex_double; para2: Plapack_complex_double): Tlapack_logical; cdecl;




  // === Konventiert am: 8-11-25 16:33:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function lapack_complex_float_real(z: Tlapack_complex_float): single;
begin
  lapack_complex_float_real := z.real;
end;

function lapack_complex_float_imag(z: Tlapack_complex_float): single;
begin
  lapack_complex_float_imag := z.imag;
end;

function lapack_complex_double_real(z: Tlapack_complex_double): double;
begin
  lapack_complex_double_real := z.real;
end;

function lapack_complex_double_imag(z: Tlapack_complex_double): double;
begin
  lapack_complex_double_imag := z.imag;
end;

{$ENDIF read_implementation}
