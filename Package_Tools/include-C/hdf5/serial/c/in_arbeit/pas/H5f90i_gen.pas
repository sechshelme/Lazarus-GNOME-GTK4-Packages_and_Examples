unit H5f90i_gen;

interface

uses
  fp_hdf5;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tc_int_1 = char;
  Tc_int_2 = smallint;
  Tc_int_4 = longint;
  Tc_int_8 = int64;
  Tc_size_t_8 = Tsize_t;
  Tc_time_t_8 = Ttime_t;
  Tc_hsize_t_8 = Thsize_t;

  Pc_int_16 = ^Tc_int_16;
  Tc_int_16 = record
    a: Tc_int_8;
    b: Tc_int_8;
  end;

  Tc_float_4 = single;
  Tc_float_8 = double;
  Tc_float_10 = Tlong_double;
  Tc_float_16 = T__float128;

  Phaddr_t_f = ^Thaddr_t_f;
  Thaddr_t_f = Tc_int_8;

  Phsize_t_f = ^Thsize_t_f;
  Thsize_t_f = Tc_hsize_t_8;

  Phssize_t_f = ^Thssize_t_f;
  Thssize_t_f = Tc_int_8;

  Poff_t_f = ^Toff_t_f;
  Toff_t_f = Tc_int_8;

  Psize_t_f = ^Tsize_t_f;
  Tsize_t_f = Tc_size_t_8;

  Ptime_t_f = ^Ttime_t_f;
  Ttime_t_f = Tc_time_t_8;

  Pint_f = ^Tint_f;
  Tint_f = Tc_int_4;

  Preal_C_FLOAT_f = ^Treal_C_FLOAT_f;
  Treal_C_FLOAT_f = Tc_float_4;

  Preal_C_DOUBLE_f = ^Treal_C_DOUBLE_f;
  Treal_C_DOUBLE_f = Tc_float_8;

  Preal_C_LONG_DOUBLE_f = ^Treal_C_LONG_DOUBLE_f;
  Treal_C_LONG_DOUBLE_f = Tc_float_10;

  Preal_C_FLOAT128_f = ^Treal_C_FLOAT128_f;
  Treal_C_FLOAT128_f = Tc_float_16;

  Phid_t_f = ^Thid_t_f;
  Thid_t_f = Tc_int_8;

  Preal_f = ^Treal_f;
  Treal_f = Tc_float_4;

  Pdouble_f = ^Tdouble_f;
  Tdouble_f = Tc_float_8;

  // === Konventiert am: 20-8-26 19:37:10 ===


implementation



end.
