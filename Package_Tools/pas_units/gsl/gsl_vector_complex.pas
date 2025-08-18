unit gsl_vector_complex;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//
//function GSL_VECTOR_REAL(z,i : longint) : longint;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function GSL_VECTOR_IMAG(z,i : longint) : longint;
//
//{ xxxxxxxxxxxx #define GSL_VECTOR_COMPLEX(zv, i) (*GSL_COMPLEX_AT((zv),(i))) }
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function GSL_COMPLEX_AT(zv,i : longint) : Pgsl_complex;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function GSL_COMPLEX_FLOAT_AT(zv,i : longint) : Pgsl_complex_float;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function GSL_COMPLEX_LONG_DOUBLE_AT(zv,i : longint) : Pgsl_complex_long_double;


// === Konventiert am: 18-8-25 16:38:38 ===


implementation


//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function GSL_VECTOR_REAL(z,i : longint) : longint;
//begin
//  GSL_VECTOR_REAL:=z^.(data[(2*i)*(z^.stride)]);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function GSL_VECTOR_IMAG(z,i : longint) : longint;
//begin
//  GSL_VECTOR_IMAG:=z^.(data[((2*i)*(z^.stride))+1]);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function GSL_COMPLEX_AT(zv,i : longint) : Pgsl_complex;
//begin
//  GSL_COMPLEX_AT:=Pgsl_complex(@(zv^.(data[(2*i)*(zv^.stride)])));
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function GSL_COMPLEX_FLOAT_AT(zv,i : longint) : Pgsl_complex_float;
//begin
//  GSL_COMPLEX_FLOAT_AT:=Pgsl_complex_float(@(zv^.(data[(2*i)*(zv^.stride)])));
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function GSL_COMPLEX_LONG_DOUBLE_AT(zv,i : longint) : Pgsl_complex_long_double;
//begin
//  GSL_COMPLEX_LONG_DOUBLE_AT:=Pgsl_complex_long_double(@(zv^.(data[(2*i)*(zv^.stride)])));
//end;


end.
