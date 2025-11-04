
unit ParU_C;
interface

{
  Automatically converted by H2Pas 1.0.0 from ParU_C.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ParU_C.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pcholmod_sparse  = ^cholmod_sparse;
Pdouble  = ^double;
Pint64_t  = ^int64_t;
PParU_C_Control  = ^ParU_C_Control;
PParU_C_Control_struct  = ^ParU_C_Control_struct;
PParU_C_Numeric  = ^ParU_C_Numeric;
PParU_C_Numeric_struct  = ^ParU_C_Numeric_struct;
PParU_C_Symbolic  = ^ParU_C_Symbolic;
PParU_C_Symbolic_struct  = ^ParU_C_Symbolic_struct;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ ============================================================================/ }
{ ======================= ParU_C.h ===========================================/ }
{ ============================================================================/ }
{ ParU, Copyright (c) 2023, Mohsen Aznaveh and Timothy A. Davis, }
{ All Rights Reserved. }
{ SPDX-License-Identifier: GNU GPL 3.0 }
{------------------------------------------------------------------------------ }
{$ifndef PARU_C_H}
{$define PARU_C_H}
{$include <stdint.h>}
{$include "ParU_definitions.h"}
{ ============================================================================= }
{ ========================= ParU_C_Control ==================================== }
{ ============================================================================= }
{ Just like ParU_Control in the C++ interface.  The only difference is the }
{ initialization which is handled in the C interface, ParU_C_Init_Control. }
{ chunk size for memset and memcpy }
{ Symbolic controls }
{ symmetric or unsymmetric }
{filter singletons if true }
{ symbolic analysis tries that each front have more pivot columns }
{ than this threshold }
{ Numeric controls }
{ if 1 matrix will be scaled using max_row }
{ width of panel for dense factorizaiton }
{ the same strategy umfpack used }
{ tolerance for accepting sparse pivots }
{ tolerance for accepting symmetric pivots }
{ dgemms with sizes less than trivial doesn't call BLAS }
{ dgemms bigger than worthwhile are tasked }
{ trsm bigger than worthwhile are tasked }
{ It will be initialized with omp_max_threads }
{ if the user do not provide a smaller number }
type
  PParU_C_Control_struct = ^TParU_C_Control_struct;
  TParU_C_Control_struct = record
      mem_chunk : Tint64_t;
      umfpack_ordering : Tint64_t;
      umfpack_strategy : Tint64_t;
      umfpack_default_singleton : Tint64_t;
      relaxed_amalgamation_threshold : Tint64_t;
      scale : Tint64_t;
      panel_width : Tint64_t;
      paru_strategy : Tint64_t;
      piv_toler : Tdouble;
      diag_toler : Tdouble;
      trivial : Tint64_t;
      worthwhile_dgemm : Tint64_t;
      worthwhile_trsm : Tint64_t;
      paru_max_threads : Tint32_t;
    end;
  TParU_C_Control = TParU_C_Control_struct;
  PParU_C_Control = ^TParU_C_Control;
{ ========================================================================= }
{ ========================= ParU_C_Symbolic =============================== }
{ ========================================================================= }
{ just a carrier for the C++ data structure }
{ or Q? }

  PParU_C_Symbolic_struct = ^TParU_C_Symbolic_struct;
  TParU_C_Symbolic_struct = record
      m : Tint64_t;
      n : Tint64_t;
      anz : Tint64_t;
      Qfill : Pint64_t;
      sym_handle : pointer;
    end;
  TParU_C_Symbolic = TParU_C_Symbolic_struct;
  PParU_C_Symbolic = ^TParU_C_Symbolic;
{ ========================================================================= }
{ ========================= ParU_C_Numeric ================================ }
{ ========================================================================= }
{ just a carrier for the C++ data structure }
{ or P? }

  PParU_C_Numeric_struct = ^TParU_C_Numeric_struct;
  TParU_C_Numeric_struct = record
      rcond : Tdouble;
      Pfin : Pint64_t;
      Rs : Pdouble;
      num_handle : pointer;
    end;
  TParU_C_Numeric = TParU_C_Numeric_struct;
  PParU_C_Numeric = ^TParU_C_Numeric;
{ C++ extern C conditionnal removed }
{------------------------------------------------------------------------------ }
{ ParU_Version:  }
{------------------------------------------------------------------------------ }
{ return the version }

function ParU_C_Version(ver:array[0..2] of longint; date:array[0..127] of char):TParU_Ret;cdecl;external;
{------------------------------------------------------------------------------ }
{ ParU_C_Init_Control }
{------------------------------------------------------------------------------ }
{ Initialize C data structure }
function ParU_C_Init_Control(Control_C:PParU_C_Control):TParU_Ret;cdecl;external;
{------------------------------------------------------------------------------ }
{ ParU_C_Analyze: Symbolic analysis is done in this routine. UMFPACK is called }
{ here and after that some more speciallized symbolic computation is done for }
{ ParU. ParU_Analyze can be called once and can be used for different }
{ ParU_Factorize calls.  }
{------------------------------------------------------------------------------ }
{ input: }
{ input matrix to analyze ... }
{ output: }
{ output, symbolic analysis }
{ control: }
function ParU_C_Analyze(A:Pcholmod_sparse; Sym_handle:PPParU_C_Symbolic; Control:PParU_C_Control):TParU_Ret;cdecl;external;
{------------------------------------------------------------------------------ }
{ ParU_C_Factorize: Numeric factorization is done in this routine. Scaling and }
{ making Sx matrix, computing factors and permutations is here. }
{ ParU_C_Symbolic structure is computed ParU_Analyze and is an input in this }
{ routine. }
{------------------------------------------------------------------------------ }
{ input: }
{ output: }
{ control: }
function ParU_C_Factorize(A:Pcholmod_sparse; Sym:PParU_C_Symbolic; Num_handle:PPParU_C_Numeric; Control:PParU_C_Control):TParU_Ret;cdecl;external;
{------------------------------------------------------------------------------ }
{--------------------- Solve routines ----------------------------------------- }
{------------------------------------------------------------------------------ }
{ In all the solve routines Num structure must come with the same Sym struct }
{ that comes from ParU_Factorize }
{-------- Ax = b (x is overwritten on b)--------------------------------------- }
{ input: }
{ input/output: }
{ vector of size m-by-1 }
{ control: }
function ParU_C_Solve_Axx(Sym:PParU_C_Symbolic; Num:PParU_C_Numeric; b:Pdouble; Control:PParU_C_Control):TParU_Ret;cdecl;external;
{-------- Ax = b -------------------------------------------------------------- }
{ input: }
{ vector of size m-by-1 }
{ output }
{ vector of size m-by-1 }
{ control: }
function ParU_C_Solve_Axb(Sym:PParU_C_Symbolic; Num:PParU_C_Numeric; b:Pdouble; x:Pdouble; Control:PParU_C_Control):TParU_Ret;cdecl;external;
{-------- AX = B  (X is overwritten on B, multiple rhs)------------------------ }
{ input }
{ input/output: }
{ m(num_rows of A) x nrhs }
{ control: }
function ParU_C_Solve_AXX(Sym:PParU_C_Symbolic; Num:PParU_C_Numeric; nrhs:Tint64_t; B:Pdouble; Control:PParU_C_Control):TParU_Ret;cdecl;external;
{-------- AX = B  (multiple rhs)----------------------------------------------- }
{ input }
{ m(num_rows of A) x nrhs }
{ output: }
{ m(num_rows of A) x nrhs }
{ control: }
function ParU_C_Solve_AXB(Sym:PParU_C_Symbolic; Num:PParU_C_Numeric; nrhs:Tint64_t; B:Pdouble; X:Pdouble; 
           Control:PParU_C_Control):TParU_Ret;cdecl;external;
{ FIXME: add Lsolve, perms etc }
{------------------------------------------------------------------------------ }
{-------------- computing residual -------------------------------------------- }
{------------------------------------------------------------------------------ }
{ The user provide both x and b }
{ resid = norm1(b-A*x) / (norm1(A) * norm1 (x)) }
{ inputs: }
{ output: }
{ control: }
function ParU_C_Residual_bAx(A:Pcholmod_sparse; x:Pdouble; b:Pdouble; m:Tint64_t; resid:Pdouble; 
           anorm:Pdouble; xnorm:Pdouble; Control:PParU_C_Control):TParU_Ret;cdecl;external;
{ resid = norm1(B-A*X) / (norm1(A) * norm1 (X)) }
{ (multiple rhs) }
{ inputs: }
{ output: }
{ control: }
function ParU_C_Residual_BAX(A:Pcholmod_sparse; X:Pdouble; B:Pdouble; m:Tint64_t; nrhs:Tint64_t; 
           resid:Pdouble; anorm:Pdouble; xnorm:Pdouble; Control:PParU_C_Control):TParU_Ret;cdecl;external;
{------------------------------------------------------------------------------ }
{------------ Free routines---------------------------------------------------- }
{------------------------------------------------------------------------------ }
function ParU_C_Freenum(Num_handle:PPParU_C_Numeric; Control:PParU_C_Control):TParU_Ret;cdecl;external;
function ParU_C_Freesym(Sym_handle:PPParU_C_Symbolic; Control:PParU_C_Control):TParU_Ret;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{PARU_C_H }

implementation


end.
