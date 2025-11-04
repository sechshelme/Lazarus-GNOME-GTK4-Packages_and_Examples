
unit SuiteSparse_config;
interface

{
  Automatically converted by H2Pas 1.0.0 from SuiteSparse_config.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    SuiteSparse_config.h
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
Pchar  = ^char;
Pdouble  = ^double;
Plongint  = ^longint;
Psingle  = ^single;
PSUITESPARSE_BLAS_INT  = ^SUITESPARSE_BLAS_INT;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{------------------------------------------------------------------------------ }
{ SuiteSparse_config/SuiteSparse_config.h: common utilites for SuiteSparse }
{------------------------------------------------------------------------------ }
{ SuiteSparse_config, Copyright (c) 2012-2023, Timothy A. Davis. }
{ All Rights Reserved. }
{ SPDX-License-Identifier: BSD-3-clause }
{------------------------------------------------------------------------------ }
{ Configuration file for SuiteSparse: a Suite of Sparse matrix packages: AMD, }
{ COLAMD, CCOLAMD, CAMD, CHOLMOD, UMFPACK, CXSparse, SuiteSparseQR, ParU, ... }
{ The SuiteSparse_config.h file is configured by CMake to be specific to the }
{ C/C++ compiler and BLAS library being used for SuiteSparse.  The original }
{ file is SuiteSparse_config/SuiteSparse_config.h.in.  Do not edit the }
{ SuiteSparse_config.h file directly. }
{$ifndef SUITESPARSE_CONFIG_H}
{$define SUITESPARSE_CONFIG_H}
{------------------------------------------------------------------------------ }
{ SuiteSparse-wide ANSI C11 #include files }
{------------------------------------------------------------------------------ }
{$include <stdio.h>}
{$include <errno.h>}
{$include <string.h>}
{$include <stdlib.h>}
{$include <stdbool.h>}
{$include <stdint.h>}
{$include <inttypes.h>}
{$include <stddef.h>}
{$include <limits.h>}
{$include <math.h>}
{$include <stdarg.h>}
{$include <ctype.h>}
{------------------------------------------------------------------------------ }
{ SuiteSparse_long is now int64_t in SuiteSparse v6.0.0 and later }
{------------------------------------------------------------------------------ }
{ The use of SuiteSparse_long is deprecated.  User applications should use }
{ int64_t instead. }
{$undef  SuiteSparse_long}
{$undef  SuiteSparse_long_max}
{$undef  SuiteSparse_long_idd}
{$undef  SuiteSparse_long_id}

const
  SuiteSparse_long = int64_t;  
  SuiteSparse_long_max = INT64_MAX;  
  SuiteSparse_long_idd = PRId64;  
{------------------------------------------------------------------------------ }
{ OpenMP }
{------------------------------------------------------------------------------ }
{$if defined ( _OPENMP )}
{$include <omp.h>}

{ was #define dname def_expr }
function SUITESPARSE_OPENMP_MAX_THREADS : longint; { return type might be wrong }

{ was #define dname def_expr }
function SUITESPARSE_OPENMP_GET_NUM_THREADS : longint; { return type might be wrong }

{ was #define dname def_expr }
function SUITESPARSE_OPENMP_GET_WTIME : longint; { return type might be wrong }

{ was #define dname def_expr }
function SUITESPARSE_OPENMP_GET_THREAD_ID : longint; { return type might be wrong }

{$else}
{ OpenMP not available }

const
  SUITESPARSE_OPENMP_MAX_THREADS = 1;  
  SUITESPARSE_OPENMP_GET_NUM_THREADS = 1;  
  SUITESPARSE_OPENMP_GET_WTIME = 0;  
  SUITESPARSE_OPENMP_GET_THREAD_ID = 0;  
{$endif}
{------------------------------------------------------------------------------ }
{ MATLAB/Octave }
{------------------------------------------------------------------------------ }
{$if defined ( MATLAB_MEX_FILE )}
{$include "mex.h"}
{$include "matrix.h"}
{$endif}
{------------------------------------------------------------------------------ }
{ string and token handling macros }
{------------------------------------------------------------------------------ }
{ SUITESPARSE_STR: convert the content of x into a string "x" }
{------------------------------------------------------------------------------ }
{ determine which compiler is in use }
{------------------------------------------------------------------------------ }

const
  SUITESPARSE_COMPILER_NVCC = 0;  
  SUITESPARSE_COMPILER_ICX = 0;  
  SUITESPARSE_COMPILER_ICC = 0;  
  SUITESPARSE_COMPILER_CLANG = 0;  
  SUITESPARSE_COMPILER_GCC = 0;  
  SUITESPARSE_COMPILER_MSC = 0;  
  SUITESPARSE_COMPILER_XLC = 0;  
{------------------------------------------------------------------------------ }
{ malloc.h: required include file for Microsoft Visual Studio }
{------------------------------------------------------------------------------ }
{$if SUITESPARSE_COMPILER_MSC}
{$include <malloc.h>}
{$endif}
{ this was formerly "extern", or "__declspec ..." for Windows. }
{$define SUITESPARSE_PUBLIC}
{------------------------------------------------------------------------------ }
{ determine the ANSI C version }
{------------------------------------------------------------------------------ }
{$ifdef __STDC_VERSION__}
{ ANSI C17: 201710L }
{ ANSI C11: 201112L }
{ ANSI C99: 199901L }
{ ANSI C95: 199409L }

const
  SUITESPARSE_STDC_VERSION = __STDC_VERSION__;  
{$else}
{ assume ANSI C90 / C89 }

const
  SUITESPARSE_STDC_VERSION = 199001;  
{$endif}
{------------------------------------------------------------------------------ }
{ handle the restrict keyword }
{------------------------------------------------------------------------------ }
{$if defined ( __cplusplus )}
{ C++ does not have the "restrict" keyword }
{$define SUITESPARSE_RESTRICT}
(*** was #elif ****){$else SUITESPARSE_COMPILER_MSC}
{ MS Visual Studio }

const
  SUITESPARSE_RESTRICT = __restrict;  
(*** was #elif ****){$else SUITESPARSE_COMPILER_NVCC}
{ NVIDIA nvcc }

const
  SUITESPARSE_RESTRICT = __restrict__;  
(*** was #elif ****){$else SUITESPARSE_STDC_VERSION >= 199901L}
{ ANSI C99 or later }

const
  SUITESPARSE_RESTRICT = restrict;  
{$else}
{ ANSI C95 and earlier: no restrict keyword }
{$define SUITESPARSE_RESTRICT}
{$endif}
{============================================================================== }
{ SuiteSparse_config parameters and functions }
{============================================================================== }
{ SuiteSparse-wide parameters are placed in a single static struct, defined }
{ locally in SuiteSparse_config.c.  It is not meant to be updated frequently }
{ by multiple threads.  Rather, if an application needs to modify }
{ SuiteSparse_config, it should do it once at the beginning of the }
{ application, before multiple threads are launched. }
{ The intent of these function pointers is that they not be used in your }
{ application directly, except to assign them to the desired user-provided }
{ functions.  Rather, you should use the SuiteSparse_malloc/calloc, etc }
{ wrappers defined below to access them. }
{ The SuiteSparse_config_*_get methods return the contents of the struct: }

function SuiteSparse_config_malloc_func_get:function (para1:Tsize_t):pointer;cdecl;external;
function SuiteSparse_config_calloc_func_get:function (para1:Tsize_t; para2:Tsize_t):pointer;cdecl;external;
function SuiteSparse_config_realloc_func_get:function (para1:pointer; para2:Tsize_t):pointer;cdecl;external;
function SuiteSparse_config_free_func_get:procedure (para1:pointer);cdecl;external;
(* Const before type ignored *)
function SuiteSparse_config_printf_func_get:function (para1:Pchar; args:array of const):longint;cdecl;external;
function SuiteSparse_config_printf_func_get:function (para1:Pchar):longint;cdecl;external;
function SuiteSparse_config_hypot_func_get:function (para1:Tdouble; para2:Tdouble):Tdouble;cdecl;external;
function SuiteSparse_config_divcomplex_func_get:function (para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Pdouble; 
                    para6:Pdouble):longint;cdecl;external;
{ The SuiteSparse_config_*_set methods modify the contents of the struct: }
procedure SuiteSparse_config_malloc_func_set(malloc_func:function (para1:Tsize_t):pointer);cdecl;external;
procedure SuiteSparse_config_calloc_func_set(calloc_func:function (para1:Tsize_t; para2:Tsize_t):pointer);cdecl;external;
procedure SuiteSparse_config_realloc_func_set(realloc_func:function (para1:pointer; para2:Tsize_t):pointer);cdecl;external;
procedure SuiteSparse_config_free_func_set(free_func:procedure (para1:pointer));cdecl;external;
(* Const before type ignored *)
procedure SuiteSparse_config_printf_func_set(printf_func:function (para1:Pchar; args:array of const):longint);cdecl;external;
procedure SuiteSparse_config_printf_func_set(printf_func:function (para1:Pchar):longint);cdecl;external;
procedure SuiteSparse_config_hypot_func_set(hypot_func:function (para1:Tdouble; para2:Tdouble):Tdouble);cdecl;external;
procedure SuiteSparse_config_divcomplex_func_set(divcomplex_func:function (para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Pdouble; 
                       para6:Pdouble):longint);cdecl;external;
{ The SuiteSparse_config_*_func methods are wrappers that call the function }
{ pointers in the struct.  Note that there is no wrapper for the printf_func. }
{ See the SUITESPARSE_PRINTF macro instead. }
function SuiteSparse_config_malloc(s:Tsize_t):pointer;cdecl;external;
function SuiteSparse_config_calloc(n:Tsize_t; s:Tsize_t):pointer;cdecl;external;
function SuiteSparse_config_realloc(para1:pointer; s:Tsize_t):pointer;cdecl;external;
procedure SuiteSparse_config_free(para1:pointer);cdecl;external;
function SuiteSparse_config_hypot(x:Tdouble; y:Tdouble):Tdouble;cdecl;external;
function SuiteSparse_config_divcomplex(xr:Tdouble; xi:Tdouble; yr:Tdouble; yi:Tdouble; zr:Pdouble; 
           zi:Pdouble):longint;cdecl;external;
procedure SuiteSparse_start;cdecl;external;
{ called to start SuiteSparse }
procedure SuiteSparse_finish;cdecl;external;
{ called to finish SuiteSparse }
{ pointer to allocated block of memory }
{ number of items to malloc (>=1 is enforced) }
{ sizeof each item }
function SuiteSparse_malloc(nitems:Tsize_t; size_of_item:Tsize_t):pointer;cdecl;external;
{ pointer to allocated block of memory }
{ number of items to calloc (>=1 is enforced) }
{ sizeof each item }
function SuiteSparse_calloc(nitems:Tsize_t; size_of_item:Tsize_t):pointer;cdecl;external;
{ pointer to reallocated block of memory, or }
{/to original block if the realloc failed. }
{ new number of items in the object }
{ old number of items in the object }
{ sizeof each item }
{ old object to reallocate }
{ 1 if successful, 0 otherwise }
function SuiteSparse_realloc(nitems_new:Tsize_t; nitems_old:Tsize_t; size_of_item:Tsize_t; p:pointer; ok:Plongint):pointer;cdecl;external;
{ always returns NULL }
{ block to free }
function SuiteSparse_free(p:pointer):pointer;cdecl;external;
{ start the timer }
{ output, contents undefined on input }
procedure SuiteSparse_tic(tic:array[0..1] of Tdouble);cdecl;external;
{ return time in seconds since last tic }
{ input: from last call to SuiteSparse_tic }
function SuiteSparse_toc(tic:array[0..1] of Tdouble):Tdouble;cdecl;external;
{ returns current wall clock time in seconds }
function SuiteSparse_time:Tdouble;cdecl;external;
{ returns sqrt (x^2 + y^2), computed reliably }
function SuiteSparse_hypot(x:Tdouble; y:Tdouble):Tdouble;cdecl;external;
{ complex division of c = a/b }
{ real and imaginary parts of a }
{ real and imaginary parts of b }
{ real and imaginary parts of c }
function SuiteSparse_divcomplex(ar:Tdouble; ai:Tdouble; br:Tdouble; bi:Tdouble; cr:Pdouble; 
           ci:Pdouble):longint;cdecl;external;
{ determine which timer to use, if any }
{ SuiteSparse printf macro }
{============================================================================== }
{ SuiteSparse version }
{============================================================================== }
{ SuiteSparse is not a package itself, but a collection of packages, some of }
{ which must be used together (UMFPACK requires AMD, CHOLMOD requires AMD, }
{ COLAMD, CAMD, and CCOLAMD, etc).  A version number is provided here for the }
{ collection itself, which is also the version number of SuiteSparse_config. }
{ returns SUITESPARSE_VERSION }
{ output, not defined on input.  Not used if NULL.  Returns }
{ the three version codes in version [0..2]: }
{ version [0] is SUITESPARSE_MAIN_VERSION }
{ version [1] is SUITESPARSE_SUB_VERSION }
{ version [2] is SUITESPARSE_SUBSUB_VERSION }
function SuiteSparse_version(version:array[0..2] of longint):longint;cdecl;external;
{$define SUITESPARSE_HAS_VERSION_FUNCTION}
const
  SUITESPARSE_DATE = 'Mar 2, 2024';  
  SUITESPARSE_MAIN_VERSION = 7;  
  SUITESPARSE_SUB_VERSION = 6;  
  SUITESPARSE_SUBSUB_VERSION = 1;  
{ version format x.y }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function SUITESPARSE_VER_CODE(main,sub : longint) : longint;

{ was #define dname def_expr }
function SUITESPARSE_VERSION : longint; { return type might be wrong }

{ version format x.y.z }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SUITESPARSE__VERCODE(main,sub,patch : longint) : longint;

{ was #define dname def_expr }
function SUITESPARSE__VERSION : longint; { return type might be wrong }

{============================================================================== }
{ SuiteSparse interface to the BLAS and LAPACK libraries }
{============================================================================== }
{ Several SuiteSparse packages rely on the BLAS/LAPACK libraries (UMFPACK }
{ CHOLMOD, and SPQR, and likely GraphBLAS in the future).  All of these }
{ packages are written in C/C++, but rely on the Fortran interface to }
{ BLAS/LAPACK.  SuiteSparse does not use the cblas / lapacke interfaces to }
{ these libraries, mainly because FindBLAS.cmake does not locate them (or at }
{ least does not locate their respective cblas.h and lapacke.h files).  In }
{ addition, the original definition of these files do not include a different }
{ name space for 64-bit integer versions.  Finally, Intel renames cblas.h as }
{ mkl_cblas.h.  As a result of these many portability issues, different }
{ implementations of those libraries extend them in different ways.  Thus, }
{ SuiteSparse simply calls the Fortran functions directly. }
{ However, the method for how C/C++ calling Fortran depends on the compilers }
{ involved.  This connection is handled by the FortranCInterface.cmake module }
{ of CMake. }
{ On typical systems (Linux with the GCC compiler for example, or on the Mac }
{ with clang) the Fortan name "dgemm" is called by C as "dgemm_",  Other }
{ systems do not append the underscore. }
{------------------------------------------------------------------------------ }
{ SUITESPARSE_FORTRAN: macros created by CMake describing how C calls Fortran }
{------------------------------------------------------------------------------ }
{ SUITESPARSE_FORTAN: for Fortran routines with no "_" in their names }
{ SUITESPARSE__FORTAN: for Fortran routines with "_" in their names }
{ The decision on which of these macros to use is based on the presence of }
{ underscores in the original Fortran names, not the (commonly) appended }
{ underscore needed for C to all the corresponding Fortran routine. }
{ These two macros are created by the CMake module, FortranCInterface.cmake, }
{ which is then used by CMake to configure this file. }
{ The CMAKE decision can be superceded by setting -DBLAS_NO_UNDERSCORE, so }
{ that "dgemm" remains "dgemm" (for MS Visual Studio for example).  Setting }
{ -DBLAS_UNDERSCORE changes "dgemm" to "dgemm_", the common case for Mac and }
{ Linux. }
{------------------------------------------------------------------------------ }
{ SUITESPARSE_BLAS_INT: the BLAS/LAPACK integer (int32_t or int64_t) }
{------------------------------------------------------------------------------ }
{ CMake 3.22 and later allow the selection of the BLAS/LAPACK integer size. }
{ This information is then used to configure this file with the definition of }
{ this integer: int32_t or int64_t. }
{ When compiling SuiteSparse for a MATLAB mexFunction, the MATLAB libmwblas is }
{ used, which is a 64-bit integer version of the BLAS.  CMake is not used to }
{ configure SuiteSparse in this case.  The flag -DBLAS64 can be used to ensure }
{ a 64-bit BLAS is used.  Likewise, -DBLAS32 ensures a 32-bit BLAS is used. }
{$if defined ( BLAS64 )}
{ override the BLAS found by CMake, and force a 64-bit interface }

const
  SUITESPARSE_BLAS_INT = int64_t;  
(*** was #elif ****){$else defined ( BLAS32 )}
{ override the BLAS found by CMake, and force a 32-bit interface }

const
  SUITESPARSE_BLAS_INT = int32_t;  
{$else}
{ let CMake determine the size of the integer in the Fortran BLAS }

const
  SUITESPARSE_BLAS_INT = int32_t;  
{$endif}
{ SUITESPARSE_TO_BLAS_INT: convert an integer k to a BLAS integer K and set ok }
{ to false if the conversion changes its value.  This is implemented as a }
{ macro so that can work with any type of the integer k. }
{------------------------------------------------------------------------------ }
{ SUITESPARSE_BLAS_SUFFIX: modify the name of a Fortran BLAS/LAPACK routine }
{------------------------------------------------------------------------------ }
{ OpenBLAS can be compiled by appending a suffix to each routine, so that the }
{ Fortan routine dgemm becomes dgemm_64, which denotes a version of dgemm with }
{ 64-bit integer parameters.  The Sun Performance library does the same thing, }
{ but without the internal underscore, as dgemm64. }
{ If the suffix does not contain "_", use (Sun Perf., for example): }
{     cd build && cmake -DBLAS64_SUFFIX="64" .. }
{ If the suffix contains "_" (OpenBLAS in spack for example), use the }
{ following: }
{     cd build && cmake -DBLAS64_SUFFIX="_64" .. }
{ This setting could be used by the spack packaging of SuiteSparse when linked }
{ with the spack-installed OpenBLAS with 64-bit integers.  See }
{ https://github.com/spack/spack/blob/develop/var/spack/repos/builtin/packages/suite-sparse/package.py }
{------------------------------------------------------------------------------ }
{ C names of Fortan BLAS and LAPACK functions used by SuiteSparse }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{ prototypes of BLAS and SUITESPARSE_LAPACK functions }
{------------------------------------------------------------------------------ }
{ For complex functions, the (void *) parameters are actually pointers to }
{ arrays of complex values.  They are prototyped here as (void *) to allow }
{ them to be called from both C and C++. }
{ See https://netlib.org/blas/ and https://netlib.org/lapack/ for the }
{ definitions of the inputs/outputs of these functions. }
{ These prototypes need to be found by UMFPACK, CHOLMOD, and SPQR, and to do }
{ so, they need to appear in this public header to ensure the correct BLAS }
{ library and integer size is used.  However, these definitions should not }
{ (normally) be exposed to the user application. }
{ If a user application wishes to use these definitions, simply add }
{      #define SUITESPARSE_BLAS_DEFINITIONS }
{      #include "SuiteSparse_config.h" }
{ prior to #include'ing any SuiteSparse headers (amd.h, and so on). }
{$if defined ( SUITESPARSE_BLAS_DEFINITIONS )}
{------------------------------------------------------------------------------ }
{ gemv: Y = alpha*A*x + beta*Y }
{------------------------------------------------------------------------------ }
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)

procedure SUITESPARSE_BLAS_DGEMV(trans:Pchar; m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; alpha:Pdouble; A:Pdouble; 
            lda:PSUITESPARSE_BLAS_INT; X:Pdouble; incx:PSUITESPARSE_BLAS_INT; beta:Pdouble; Y:Pdouble; 
            incy:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_SGEMV(trans:Pchar; m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; alpha:Psingle; A:Psingle; 
            lda:PSUITESPARSE_BLAS_INT; X:Psingle; incx:PSUITESPARSE_BLAS_INT; beta:Psingle; Y:Psingle; 
            incy:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_ZGEMV(trans:Pchar; m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; alpha:pointer; A:pointer; 
            lda:PSUITESPARSE_BLAS_INT; X:pointer; incx:PSUITESPARSE_BLAS_INT; beta:pointer; Y:pointer; 
            incy:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_CGEMV(trans:Pchar; m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; alpha:pointer; A:pointer; 
            lda:PSUITESPARSE_BLAS_INT; X:pointer; incx:PSUITESPARSE_BLAS_INT; beta:pointer; Y:pointer; 
            incy:PSUITESPARSE_BLAS_INT);cdecl;external;
{------------------------------------------------------------------------------ }
{ trsv: solve Lx=b, Ux=b, L'x=b, or U'x=b }
{------------------------------------------------------------------------------ }
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_DTRSV(uplo:Pchar; trans:Pchar; diag:Pchar; n:PSUITESPARSE_BLAS_INT; A:Pdouble; 
            lda:PSUITESPARSE_BLAS_INT; X:Pdouble; incx:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_STRSV(uplo:Pchar; trans:Pchar; diag:Pchar; n:PSUITESPARSE_BLAS_INT; A:Psingle; 
            lda:PSUITESPARSE_BLAS_INT; X:Psingle; incx:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_ZTRSV(uplo:Pchar; trans:Pchar; diag:Pchar; n:PSUITESPARSE_BLAS_INT; A:pointer; 
            lda:PSUITESPARSE_BLAS_INT; X:pointer; incx:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_CTRSV(uplo:Pchar; trans:Pchar; diag:Pchar; n:PSUITESPARSE_BLAS_INT; A:pointer; 
            lda:PSUITESPARSE_BLAS_INT; X:pointer; incx:PSUITESPARSE_BLAS_INT);cdecl;external;
{------------------------------------------------------------------------------ }
{ trsm: solve LX=B, UX=B, L'X=B, or U'X=B }
{------------------------------------------------------------------------------ }
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_DTRSM(side:Pchar; uplo:Pchar; transa:Pchar; diag:Pchar; m:PSUITESPARSE_BLAS_INT; 
            n:PSUITESPARSE_BLAS_INT; alpha:Pdouble; A:Pdouble; lda:PSUITESPARSE_BLAS_INT; B:Pdouble; 
            ldb:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_STRSM(side:Pchar; uplo:Pchar; transa:Pchar; diag:Pchar; m:PSUITESPARSE_BLAS_INT; 
            n:PSUITESPARSE_BLAS_INT; alpha:Psingle; A:Psingle; lda:PSUITESPARSE_BLAS_INT; B:Psingle; 
            ldb:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_ZTRSM(side:Pchar; uplo:Pchar; transa:Pchar; diag:Pchar; m:PSUITESPARSE_BLAS_INT; 
            n:PSUITESPARSE_BLAS_INT; alpha:pointer; A:pointer; lda:PSUITESPARSE_BLAS_INT; B:pointer; 
            ldb:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_CTRSM(side:Pchar; uplo:Pchar; transa:Pchar; diag:Pchar; m:PSUITESPARSE_BLAS_INT; 
            n:PSUITESPARSE_BLAS_INT; alpha:pointer; A:pointer; lda:PSUITESPARSE_BLAS_INT; B:pointer; 
            ldb:PSUITESPARSE_BLAS_INT);cdecl;external;
{------------------------------------------------------------------------------ }
{ gemm: C = alpha*A*B + beta*C }
{------------------------------------------------------------------------------ }
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_DGEMM(transa:Pchar; transb:Pchar; m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; 
            alpha:Pdouble; A:Pdouble; lda:PSUITESPARSE_BLAS_INT; B:Pdouble; ldb:PSUITESPARSE_BLAS_INT; 
            beta:Pdouble; C:Pdouble; ldc:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_SGEMM(transa:Pchar; transb:Pchar; m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; 
            alpha:Psingle; A:Psingle; lda:PSUITESPARSE_BLAS_INT; B:Psingle; ldb:PSUITESPARSE_BLAS_INT; 
            beta:Psingle; C:Psingle; ldc:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_ZGEMM(transa:Pchar; transb:Pchar; m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; 
            alpha:pointer; A:pointer; lda:PSUITESPARSE_BLAS_INT; B:pointer; ldb:PSUITESPARSE_BLAS_INT; 
            beta:pointer; C:pointer; ldc:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_CGEMM(transa:Pchar; transb:Pchar; m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; 
            alpha:pointer; A:pointer; lda:PSUITESPARSE_BLAS_INT; B:pointer; ldb:PSUITESPARSE_BLAS_INT; 
            beta:pointer; C:pointer; ldc:PSUITESPARSE_BLAS_INT);cdecl;external;
{------------------------------------------------------------------------------ }
{ syrk/herk: C = alpha*A*A' + beta*C ; or C = alpha*A'*A + beta*C }
{------------------------------------------------------------------------------ }
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_DSYRK(uplo:Pchar; trans:Pchar; n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; alpha:Pdouble; 
            A:Pdouble; lda:PSUITESPARSE_BLAS_INT; beta:Pdouble; C:Pdouble; ldc:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_SSYRK(uplo:Pchar; trans:Pchar; n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; alpha:Psingle; 
            A:Psingle; lda:PSUITESPARSE_BLAS_INT; beta:Psingle; C:Psingle; ldc:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_ZHERK(uplo:Pchar; trans:Pchar; n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; alpha:pointer; 
            A:pointer; lda:PSUITESPARSE_BLAS_INT; beta:pointer; C:pointer; ldc:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_CHERK(uplo:Pchar; trans:Pchar; n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; alpha:pointer; 
            A:pointer; lda:PSUITESPARSE_BLAS_INT; beta:pointer; C:pointer; ldc:PSUITESPARSE_BLAS_INT);cdecl;external;
{------------------------------------------------------------------------------ }
{ potrf: Cholesky factorization }
{------------------------------------------------------------------------------ }
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ output: }
procedure SUITESPARSE_LAPACK_DPOTRF(uplo:Pchar; n:PSUITESPARSE_BLAS_INT; A:Pdouble; lda:PSUITESPARSE_BLAS_INT; info:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ output: }
procedure SUITESPARSE_LAPACK_SPOTRF(uplo:Pchar; n:PSUITESPARSE_BLAS_INT; A:Psingle; lda:PSUITESPARSE_BLAS_INT; info:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ output: }
procedure SUITESPARSE_LAPACK_ZPOTRF(uplo:Pchar; n:PSUITESPARSE_BLAS_INT; A:pointer; lda:PSUITESPARSE_BLAS_INT; info:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ output: }
procedure SUITESPARSE_LAPACK_CPOTRF(uplo:Pchar; n:PSUITESPARSE_BLAS_INT; A:pointer; lda:PSUITESPARSE_BLAS_INT; info:PSUITESPARSE_BLAS_INT);cdecl;external;
{------------------------------------------------------------------------------ }
{ scal: Y = alpha*Y }
{------------------------------------------------------------------------------ }
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_DSCAL(n:PSUITESPARSE_BLAS_INT; alpha:Pdouble; Y:Pdouble; incy:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_SSCAL(n:PSUITESPARSE_BLAS_INT; alpha:Psingle; Y:Psingle; incy:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_ZSCAL(n:PSUITESPARSE_BLAS_INT; alpha:pointer; Y:pointer; incy:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_CSCAL(n:PSUITESPARSE_BLAS_INT; alpha:pointer; Y:pointer; incy:PSUITESPARSE_BLAS_INT);cdecl;external;
{------------------------------------------------------------------------------ }
{ ger/geru: A = alpha*x*y' + A }
{------------------------------------------------------------------------------ }
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_DGER(m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; alpha:Pdouble; X:Pdouble; incx:PSUITESPARSE_BLAS_INT; 
            Y:Pdouble; incy:PSUITESPARSE_BLAS_INT; A:Pdouble; lda:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_SGER(m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; alpha:Psingle; X:Psingle; incx:PSUITESPARSE_BLAS_INT; 
            Y:Psingle; incy:PSUITESPARSE_BLAS_INT; A:Psingle; lda:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_ZGERU(m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; alpha:pointer; X:pointer; incx:PSUITESPARSE_BLAS_INT; 
            Y:pointer; incy:PSUITESPARSE_BLAS_INT; A:pointer; lda:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_BLAS_CGERU(m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; alpha:pointer; X:pointer; incx:PSUITESPARSE_BLAS_INT; 
            Y:pointer; incy:PSUITESPARSE_BLAS_INT; A:pointer; lda:PSUITESPARSE_BLAS_INT);cdecl;external;
{------------------------------------------------------------------------------ }
{ larft: T = block Householder factor }
{------------------------------------------------------------------------------ }
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_LAPACK_DLARFT(direct:Pchar; storev:Pchar; n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; V:Pdouble; 
            ldv:PSUITESPARSE_BLAS_INT; Tau:Pdouble; T:Pdouble; ldt:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_LAPACK_SLARFT(direct:Pchar; storev:Pchar; n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; V:Psingle; 
            ldv:PSUITESPARSE_BLAS_INT; Tau:Psingle; T:Psingle; ldt:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_LAPACK_ZLARFT(direct:Pchar; storev:Pchar; n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; V:pointer; 
            ldv:PSUITESPARSE_BLAS_INT; Tau:pointer; T:pointer; ldt:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ output: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_LAPACK_CLARFT(direct:Pchar; storev:Pchar; n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; V:pointer; 
            ldv:PSUITESPARSE_BLAS_INT; Tau:pointer; T:pointer; ldt:PSUITESPARSE_BLAS_INT);cdecl;external;
{------------------------------------------------------------------------------ }
{ larfb: apply block Householder reflector }
{------------------------------------------------------------------------------ }
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ workspace: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_LAPACK_DLARFB(side:Pchar; trans:Pchar; direct:Pchar; storev:Pchar; m:PSUITESPARSE_BLAS_INT; 
            n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; V:Pdouble; ldv:PSUITESPARSE_BLAS_INT; T:Pdouble; 
            ldt:PSUITESPARSE_BLAS_INT; C:Pdouble; ldc:PSUITESPARSE_BLAS_INT; Work:Pdouble; ldwork:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ workspace: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_LAPACK_SLARFB(side:Pchar; trans:Pchar; direct:Pchar; storev:Pchar; m:PSUITESPARSE_BLAS_INT; 
            n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; V:Psingle; ldv:PSUITESPARSE_BLAS_INT; T:Psingle; 
            ldt:PSUITESPARSE_BLAS_INT; C:Psingle; ldc:PSUITESPARSE_BLAS_INT; Work:Psingle; ldwork:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ workspace: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_LAPACK_ZLARFB(side:Pchar; trans:Pchar; direct:Pchar; storev:Pchar; m:PSUITESPARSE_BLAS_INT; 
            n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; V:pointer; ldv:PSUITESPARSE_BLAS_INT; T:pointer; 
            ldt:PSUITESPARSE_BLAS_INT; C:pointer; ldc:PSUITESPARSE_BLAS_INT; Work:pointer; ldwork:PSUITESPARSE_BLAS_INT);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ workspace: }
{ input: }
(* Const before type ignored *)
procedure SUITESPARSE_LAPACK_CLARFB(side:Pchar; trans:Pchar; direct:Pchar; storev:Pchar; m:PSUITESPARSE_BLAS_INT; 
            n:PSUITESPARSE_BLAS_INT; k:PSUITESPARSE_BLAS_INT; V:pointer; ldv:PSUITESPARSE_BLAS_INT; T:pointer; 
            ldt:PSUITESPARSE_BLAS_INT; C:pointer; ldc:PSUITESPARSE_BLAS_INT; Work:pointer; ldwork:PSUITESPARSE_BLAS_INT);cdecl;external;
{------------------------------------------------------------------------------ }
{ nrm2: vector 2-norm }
{------------------------------------------------------------------------------ }
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SUITESPARSE_BLAS_DNRM2(n:PSUITESPARSE_BLAS_INT; X:Pdouble; incx:PSUITESPARSE_BLAS_INT):Tdouble;cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SUITESPARSE_BLAS_SNRM2(n:PSUITESPARSE_BLAS_INT; X:Psingle; incx:PSUITESPARSE_BLAS_INT):single;cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SUITESPARSE_BLAS_DZNRM2(n:PSUITESPARSE_BLAS_INT; X:pointer; incx:PSUITESPARSE_BLAS_INT):Tdouble;cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SUITESPARSE_BLAS_SCNRM2(n:PSUITESPARSE_BLAS_INT; X:pointer; incx:PSUITESPARSE_BLAS_INT):single;cdecl;external;
{------------------------------------------------------------------------------ }
{ larfg: generate Householder reflector }
{------------------------------------------------------------------------------ }
{ input: }
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ output: }
procedure SUITESPARSE_LAPACK_DLARFG(n:PSUITESPARSE_BLAS_INT; alpha:Pdouble; X:Pdouble; incx:PSUITESPARSE_BLAS_INT; tau:Pdouble);cdecl;external;
{ input: }
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ output: }
procedure SUITESPARSE_LAPACK_SLARFG(n:PSUITESPARSE_BLAS_INT; alpha:Psingle; X:Psingle; incx:PSUITESPARSE_BLAS_INT; tau:Psingle);cdecl;external;
{ input: }
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ output: }
procedure SUITESPARSE_LAPACK_ZLARFG(n:PSUITESPARSE_BLAS_INT; alpha:pointer; X:pointer; incx:PSUITESPARSE_BLAS_INT; tau:pointer);cdecl;external;
{ input: }
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ output: }
procedure SUITESPARSE_LAPACK_CLARFG(n:PSUITESPARSE_BLAS_INT; alpha:pointer; X:pointer; incx:PSUITESPARSE_BLAS_INT; tau:pointer);cdecl;external;
{------------------------------------------------------------------------------ }
{ larf: apply Householder reflector }
{------------------------------------------------------------------------------ }
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ workspace: }
procedure SUITESPARSE_LAPACK_DLARF(side:Pchar; m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; V:Pdouble; incv:PSUITESPARSE_BLAS_INT; 
            tau:Pdouble; C:Pdouble; ldc:PSUITESPARSE_BLAS_INT; Work:Pdouble);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ workspace: }
procedure SUITESPARSE_LAPACK_SLARF(side:Pchar; m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; V:Psingle; incv:PSUITESPARSE_BLAS_INT; 
            tau:Psingle; C:Psingle; ldc:PSUITESPARSE_BLAS_INT; Work:Psingle);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ workspace: }
procedure SUITESPARSE_LAPACK_ZLARF(side:Pchar; m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; V:pointer; incv:PSUITESPARSE_BLAS_INT; 
            tau:pointer; C:pointer; ldc:PSUITESPARSE_BLAS_INT; Work:pointer);cdecl;external;
{ input: }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ input/output: }
{ input: }
(* Const before type ignored *)
{ workspace: }
procedure SUITESPARSE_LAPACK_CLARF(side:Pchar; m:PSUITESPARSE_BLAS_INT; n:PSUITESPARSE_BLAS_INT; V:pointer; incv:PSUITESPARSE_BLAS_INT; 
            tau:pointer; C:pointer; ldc:PSUITESPARSE_BLAS_INT; Work:pointer);cdecl;external;
{------------------------------------------------------------------------------ }
{ SuiteSparse_BLAS_library: return name of BLAS library found }
{------------------------------------------------------------------------------ }
{ Returns the name of the BLAS library found by SuiteSparse_config }
(* Const before type ignored *)
function SuiteSparse_BLAS_library:Pchar;cdecl;external;
{------------------------------------------------------------------------------ }
{ SuiteSparse_BLAS_integer_size: return sizeof (SUITESPARSE_BLAS_INT) }
{------------------------------------------------------------------------------ }
function SuiteSparse_BLAS_integer_size:Tsize_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname def_expr }
function SUITESPARSE_OPENMP_MAX_THREADS : longint; { return type might be wrong }
  begin
    SUITESPARSE_OPENMP_MAX_THREADS:=omp_get_max_threads;
  end;

{ was #define dname def_expr }
function SUITESPARSE_OPENMP_GET_NUM_THREADS : longint; { return type might be wrong }
  begin
    SUITESPARSE_OPENMP_GET_NUM_THREADS:=omp_get_num_threads;
  end;

{ was #define dname def_expr }
function SUITESPARSE_OPENMP_GET_WTIME : longint; { return type might be wrong }
  begin
    SUITESPARSE_OPENMP_GET_WTIME:=omp_get_wtime;
  end;

{ was #define dname def_expr }
function SUITESPARSE_OPENMP_GET_THREAD_ID : longint; { return type might be wrong }
  begin
    SUITESPARSE_OPENMP_GET_THREAD_ID:=omp_get_thread_num;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SUITESPARSE_VER_CODE(main,sub : longint) : longint;
begin
  SUITESPARSE_VER_CODE:=(main*1000)+sub;
end;

{ was #define dname def_expr }
function SUITESPARSE_VERSION : longint; { return type might be wrong }
  begin
    SUITESPARSE_VERSION:=SUITESPARSE_VER_CODE(7,6);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SUITESPARSE__VERCODE(main,sub,patch : longint) : longint;
begin
  SUITESPARSE__VERCODE:=(((main*1000)+sub)*1000)+patch;
end;

{ was #define dname def_expr }
function SUITESPARSE__VERSION : longint; { return type might be wrong }
  begin
    SUITESPARSE__VERSION:=SUITESPARSE__VERCODE(7,6,1);
  end;


end.
