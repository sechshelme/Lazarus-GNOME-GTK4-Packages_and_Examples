{$IFDEF read_interface}


{ ===== Double-Version ===== }
function GSL_VECTOR_REAL(zv: Pgsl_vector; i: SizeInt): double; inline;
function GSL_VECTOR_IMAG(zv: Pgsl_vector; i: SizeInt): double; inline;
function GSL_VECTOR_COMPLEX(zv: PGSL_Vector; i: SizeInt): Tgsl_complex; inline;
function GSL_COMPLEX_AT(zv: Pgsl_vector; i: SizeInt): Pgsl_complex; inline;

{ ===== Single-Version ===== }
function GSL_VECTOR_REAL_F(zv: Pgsl_vector_float; i: SizeInt): single; inline;
function GSL_VECTOR_IMAG_F(zv: Pgsl_vector_float; i: SizeInt): single; inline;
function GSL_VECTOR_COMPLEX_F(zv: Pgsl_vector_float; i: SizeInt): Tgsl_complex_float; inline;
function GSL_COMPLEX_FLOAT_AT(zv: Pgsl_vector_float; i: SizeInt): Pgsl_complex_float; inline;

{ ===== LongDouble-Version ===== }
function GSL_VECTOR_REAL_LD(zv: Pgsl_vector_long_double; i: SizeInt): extended; inline;
function GSL_VECTOR_IMAG_LD(zv: Pgsl_vector_long_double; i: SizeInt): extended; inline;
function GSL_VECTOR_COMPLEX_LD(zv: Pgsl_vector_long_double; i: SizeInt): Tgsl_complex_long_double; inline;
function GSL_COMPLEX_LONG_DOUBLE_AT(zv: Pgsl_vector_long_double; i: SizeInt): Pgsl_complex_long_double; inline;

// === Konventiert am: 18-8-25 16:38:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{ ==== Double ==== }
function GSL_VECTOR_REAL(zv: Pgsl_vector; i: SizeInt): double;
begin
  Result := zv^.data[2 * i * zv^.stride];
end;

function GSL_VECTOR_IMAG(zv: Pgsl_vector; i: SizeInt): double;
begin
  Result := zv^.data[2 * i * zv^.stride + 1];
end;

function GSL_VECTOR_COMPLEX(zv: PGSL_Vector; i: SizeInt): Tgsl_complex;
begin
  Result := Pgsl_complex(@zv^.data[2 * i * zv^.stride])^;
end;

function GSL_COMPLEX_AT(zv: Pgsl_vector; i: SizeInt): Pgsl_complex;
begin
  Result := Pgsl_complex(@zv^.data[2 * i * zv^.stride]);
end;

{ ==== Single ==== }
function GSL_VECTOR_REAL_F(zv: Pgsl_vector_float; i: SizeInt): single;
begin
  Result := zv^.data[2 * i * zv^.stride];
end;

function GSL_VECTOR_IMAG_F(zv: Pgsl_vector_float; i: SizeInt): single;
begin
  Result := zv^.data[2 * i * zv^.stride + 1];
end;

function GSL_VECTOR_COMPLEX_F(zv: Pgsl_vector_float; i: SizeInt): Tgsl_complex_float;
begin
  Result := Pgsl_complex_float(@zv^.data[2 * i * zv^.stride])^;
end;

function GSL_COMPLEX_FLOAT_AT(zv: Pgsl_vector_float; i: SizeInt): Pgsl_complex_float;
begin
  Result := Pgsl_complex_float(@zv^.data[2 * i * zv^.stride]);
end;

{ ==== LongDouble ==== }
function GSL_VECTOR_REAL_LD(zv: Pgsl_vector_long_double; i: SizeInt): extended;
begin
  Result := zv^.data[2 * i * zv^.stride];
end;

function GSL_VECTOR_IMAG_LD(zv: Pgsl_vector_long_double; i: SizeInt): extended;
begin
  Result := zv^.data[2 * i * zv^.stride + 1];
end;

function GSL_VECTOR_COMPLEX_LD(zv: Pgsl_vector_long_double; i: SizeInt): Tgsl_complex_long_double;
begin
  Result := Pgsl_complex_long_double(@zv^.data[2 * i * zv^.stride])^;
end;

function GSL_COMPLEX_LONG_DOUBLE_AT(zv: Pgsl_vector_long_double; i: SizeInt): Pgsl_complex_long_double;
begin
  Result := Pgsl_complex_long_double(@zv^.data[2 * i * zv^.stride]);
end;

{$ENDIF read_implementation}
