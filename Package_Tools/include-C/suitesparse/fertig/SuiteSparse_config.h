//------------------------------------------------------------------------------
// SuiteSparse_config/SuiteSparse_config.h: common utilites for SuiteSparse
//------------------------------------------------------------------------------

// SuiteSparse_config, Copyright (c) 2012-2023, Timothy A. Davis.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3-clause

//------------------------------------------------------------------------------

// Configuration file for SuiteSparse: a Suite of Sparse matrix packages: AMD,
// COLAMD, CCOLAMD, CAMD, CHOLMOD, UMFPACK, CXSparse, SuiteSparseQR, ParU, ...

// The SuiteSparse_config.h file is configured by CMake to be specific to the
// C/C++ compiler and BLAS library being used for SuiteSparse.  The original
// file is SuiteSparse_config/SuiteSparse_config.h.in.  Do not edit the
// SuiteSparse_config.h file directly.

#ifndef SUITESPARSE_CONFIG_H
#define SUITESPARSE_CONFIG_H

#ifdef __cplusplus
extern "C"
{
#endif

//------------------------------------------------------------------------------
// SuiteSparse-wide ANSI C11 #include files
//------------------------------------------------------------------------------

#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <inttypes.h>
#include <stddef.h>
#include <limits.h>
#include <math.h>
#include <stdarg.h>
#include <ctype.h>

//------------------------------------------------------------------------------
// SuiteSparse_long is now int64_t in SuiteSparse v6.0.0 and later
//------------------------------------------------------------------------------

// The use of SuiteSparse_long is deprecated.  User applications should use
// int64_t instead.

#undef  SuiteSparse_long
#undef  SuiteSparse_long_max
#undef  SuiteSparse_long_idd
#undef  SuiteSparse_long_id

#define SuiteSparse_long int64_t
#define SuiteSparse_long_max INT64_MAX
#define SuiteSparse_long_idd PRId64

//------------------------------------------------------------------------------
// OpenMP
//------------------------------------------------------------------------------

#if defined ( _OPENMP )

    #include <omp.h>
    #define SUITESPARSE_OPENMP_MAX_THREADS       omp_get_max_threads ( )
    #define SUITESPARSE_OPENMP_GET_NUM_THREADS   omp_get_num_threads ( )
    #define SUITESPARSE_OPENMP_GET_WTIME         omp_get_wtime ( )
    #define SUITESPARSE_OPENMP_GET_THREAD_ID     omp_get_thread_num ( )

#else

    // OpenMP not available
    #define SUITESPARSE_OPENMP_MAX_THREADS       (1)
    #define SUITESPARSE_OPENMP_GET_NUM_THREADS   (1)
    #define SUITESPARSE_OPENMP_GET_WTIME         (0)
    #define SUITESPARSE_OPENMP_GET_THREAD_ID     (0)

#endif

//------------------------------------------------------------------------------
// MATLAB/Octave
//------------------------------------------------------------------------------

#if defined ( MATLAB_MEX_FILE )
#include "mex.h"
#include "matrix.h"
#endif

//------------------------------------------------------------------------------
// string and token handling macros
//------------------------------------------------------------------------------

// SUITESPARSE_STR: convert the content of x into a string "x"

//------------------------------------------------------------------------------
// determine which compiler is in use
//------------------------------------------------------------------------------

#define SUITESPARSE_COMPILER_NVCC    0
#define SUITESPARSE_COMPILER_ICX     0
#define SUITESPARSE_COMPILER_ICC     0
#define SUITESPARSE_COMPILER_CLANG   0
#define SUITESPARSE_COMPILER_GCC     0
#define SUITESPARSE_COMPILER_MSC     0
#define SUITESPARSE_COMPILER_XLC     0


//------------------------------------------------------------------------------
// malloc.h: required include file for Microsoft Visual Studio
//------------------------------------------------------------------------------

#if SUITESPARSE_COMPILER_MSC
    #include <malloc.h>
#endif

// this was formerly "extern", or "__declspec ..." for Windows.
#define SUITESPARSE_PUBLIC

//------------------------------------------------------------------------------
// determine the ANSI C version
//------------------------------------------------------------------------------

#ifdef __STDC_VERSION__
// ANSI C17: 201710L
// ANSI C11: 201112L
// ANSI C99: 199901L
// ANSI C95: 199409L
#define SUITESPARSE_STDC_VERSION __STDC_VERSION__
#else
// assume ANSI C90 / C89
#define SUITESPARSE_STDC_VERSION 199001L
#endif

//------------------------------------------------------------------------------
// handle the restrict keyword
//------------------------------------------------------------------------------

#if defined ( __cplusplus )

    // C++ does not have the "restrict" keyword
    #define SUITESPARSE_RESTRICT

#elif SUITESPARSE_COMPILER_MSC

    // MS Visual Studio
    #define SUITESPARSE_RESTRICT __restrict

#elif SUITESPARSE_COMPILER_NVCC

    // NVIDIA nvcc
    #define SUITESPARSE_RESTRICT __restrict__

#elif SUITESPARSE_STDC_VERSION >= 199901L

    // ANSI C99 or later
    #define SUITESPARSE_RESTRICT restrict

#else

    // ANSI C95 and earlier: no restrict keyword
    #define SUITESPARSE_RESTRICT

#endif

//==============================================================================
// SuiteSparse_config parameters and functions
//==============================================================================

// SuiteSparse-wide parameters are placed in a single static struct, defined
// locally in SuiteSparse_config.c.  It is not meant to be updated frequently
// by multiple threads.  Rather, if an application needs to modify
// SuiteSparse_config, it should do it once at the beginning of the
// application, before multiple threads are launched.

// The intent of these function pointers is that they not be used in your
// application directly, except to assign them to the desired user-provided
// functions.  Rather, you should use the SuiteSparse_malloc/calloc, etc
// wrappers defined below to access them.

// The SuiteSparse_config_*_get methods return the contents of the struct:
void *(*SuiteSparse_config_malloc_func_get (void)) (size_t);
void *(*SuiteSparse_config_calloc_func_get (void)) (size_t, size_t);
void *(*SuiteSparse_config_realloc_func_get (void)) (void *, size_t);
void (*SuiteSparse_config_free_func_get (void)) (void *);
int (*SuiteSparse_config_printf_func_get (void)) (const char *, ...);
double (*SuiteSparse_config_hypot_func_get (void)) (double, double);
int (*SuiteSparse_config_divcomplex_func_get (void)) (double, double, double, double, double *, double *);

// The SuiteSparse_config_*_set methods modify the contents of the struct:
void SuiteSparse_config_malloc_func_set (void *(*malloc_func) (size_t));
void SuiteSparse_config_calloc_func_set (void *(*calloc_func) (size_t, size_t));
void SuiteSparse_config_realloc_func_set (void *(*realloc_func) (void *, size_t));
void SuiteSparse_config_free_func_set (void (*free_func) (void *));
void SuiteSparse_config_printf_func_set (int (*printf_func) (const char *, ...));
void SuiteSparse_config_hypot_func_set (double (*hypot_func) (double, double));
void SuiteSparse_config_divcomplex_func_set (int (*divcomplex_func) (double, double, double, double, double *, double *));

// The SuiteSparse_config_*_func methods are wrappers that call the function
// pointers in the struct.  Note that there is no wrapper for the printf_func.
// See the SUITESPARSE_PRINTF macro instead.
void *SuiteSparse_config_malloc (size_t s) ;
void *SuiteSparse_config_calloc (size_t n, size_t s) ;
void *SuiteSparse_config_realloc (void *, size_t s) ;
void SuiteSparse_config_free (void *) ;
double SuiteSparse_config_hypot (double x, double y) ;
int SuiteSparse_config_divcomplex
(
    double xr, double xi, double yr, double yi, double *zr, double *zi
) ;

void SuiteSparse_start ( void ) ;   // called to start SuiteSparse

void SuiteSparse_finish ( void ) ;  // called to finish SuiteSparse

void *SuiteSparse_malloc    // pointer to allocated block of memory
(
    size_t nitems,          // number of items to malloc (>=1 is enforced)
    size_t size_of_item     // sizeof each item
) ;

void *SuiteSparse_calloc    // pointer to allocated block of memory
(
    size_t nitems,          // number of items to calloc (>=1 is enforced)
    size_t size_of_item     // sizeof each item
) ;

void *SuiteSparse_realloc   // pointer to reallocated block of memory, or
                            ///to original block if the realloc failed.
(
    size_t nitems_new,      // new number of items in the object
    size_t nitems_old,      // old number of items in the object
    size_t size_of_item,    // sizeof each item
    void *p,                // old object to reallocate
    int *ok                 // 1 if successful, 0 otherwise
) ;

void *SuiteSparse_free      // always returns NULL
(
    void *p                 // block to free
) ;

void SuiteSparse_tic    // start the timer
(
    double tic [2]      // output, contents undefined on input
) ;

double SuiteSparse_toc  // return time in seconds since last tic
(
    double tic [2]      // input: from last call to SuiteSparse_tic
) ;

double SuiteSparse_time  // returns current wall clock time in seconds
(
    void
) ;

// returns sqrt (x^2 + y^2), computed reliably
double SuiteSparse_hypot (double x, double y) ;

// complex division of c = a/b
int SuiteSparse_divcomplex
(
    double ar, double ai,       // real and imaginary parts of a
    double br, double bi,       // real and imaginary parts of b
    double *cr, double *ci      // real and imaginary parts of c
) ;

// determine which timer to use, if any

// SuiteSparse printf macro

//==============================================================================
// SuiteSparse version
//==============================================================================

// SuiteSparse is not a package itself, but a collection of packages, some of
// which must be used together (UMFPACK requires AMD, CHOLMOD requires AMD,
// COLAMD, CAMD, and CCOLAMD, etc).  A version number is provided here for the
// collection itself, which is also the version number of SuiteSparse_config.

int SuiteSparse_version     // returns SUITESPARSE_VERSION
(
    // output, not defined on input.  Not used if NULL.  Returns
    // the three version codes in version [0..2]:
    // version [0] is SUITESPARSE_MAIN_VERSION
    // version [1] is SUITESPARSE_SUB_VERSION
    // version [2] is SUITESPARSE_SUBSUB_VERSION
    int version [3]
) ;

#define SUITESPARSE_HAS_VERSION_FUNCTION

#define SUITESPARSE_DATE "Mar 2, 2024"
#define SUITESPARSE_MAIN_VERSION    7
#define SUITESPARSE_SUB_VERSION     6
#define SUITESPARSE_SUBSUB_VERSION  1

// version format x.y
#define SUITESPARSE_VER_CODE(main,sub) ((main) * 1000 + (sub))
#define SUITESPARSE_VERSION SUITESPARSE_VER_CODE(7, 6)

// version format x.y.z
#define SUITESPARSE__VERCODE(main,sub,patch) \
    (((main)*1000ULL + (sub))*1000ULL + (patch))
#define SUITESPARSE__VERSION SUITESPARSE__VERCODE(7,6,1)

//==============================================================================
// SuiteSparse interface to the BLAS and LAPACK libraries
//==============================================================================

// Several SuiteSparse packages rely on the BLAS/LAPACK libraries (UMFPACK
// CHOLMOD, and SPQR, and likely GraphBLAS in the future).  All of these
// packages are written in C/C++, but rely on the Fortran interface to
// BLAS/LAPACK.  SuiteSparse does not use the cblas / lapacke interfaces to
// these libraries, mainly because FindBLAS.cmake does not locate them (or at
// least does not locate their respective cblas.h and lapacke.h files).  In
// addition, the original definition of these files do not include a different
// name space for 64-bit integer versions.  Finally, Intel renames cblas.h as
// mkl_cblas.h.  As a result of these many portability issues, different
// implementations of those libraries extend them in different ways.  Thus,
// SuiteSparse simply calls the Fortran functions directly.

// However, the method for how C/C++ calling Fortran depends on the compilers
// involved.  This connection is handled by the FortranCInterface.cmake module
// of CMake.

// On typical systems (Linux with the GCC compiler for example, or on the Mac
// with clang) the Fortan name "dgemm" is called by C as "dgemm_",  Other
// systems do not append the underscore.

//------------------------------------------------------------------------------
// SUITESPARSE_FORTRAN: macros created by CMake describing how C calls Fortran
//------------------------------------------------------------------------------

// SUITESPARSE_FORTAN: for Fortran routines with no "_" in their names
// SUITESPARSE__FORTAN: for Fortran routines with "_" in their names

// The decision on which of these macros to use is based on the presence of
// underscores in the original Fortran names, not the (commonly) appended
// underscore needed for C to all the corresponding Fortran routine.

// These two macros are created by the CMake module, FortranCInterface.cmake,
// which is then used by CMake to configure this file.

// The CMAKE decision can be superceded by setting -DBLAS_NO_UNDERSCORE, so
// that "dgemm" remains "dgemm" (for MS Visual Studio for example).  Setting
// -DBLAS_UNDERSCORE changes "dgemm" to "dgemm_", the common case for Mac and
// Linux.


//------------------------------------------------------------------------------
// SUITESPARSE_BLAS_INT: the BLAS/LAPACK integer (int32_t or int64_t)
//------------------------------------------------------------------------------

// CMake 3.22 and later allow the selection of the BLAS/LAPACK integer size.
// This information is then used to configure this file with the definition of
// this integer: int32_t or int64_t.

// When compiling SuiteSparse for a MATLAB mexFunction, the MATLAB libmwblas is
// used, which is a 64-bit integer version of the BLAS.  CMake is not used to
// configure SuiteSparse in this case.  The flag -DBLAS64 can be used to ensure
// a 64-bit BLAS is used.  Likewise, -DBLAS32 ensures a 32-bit BLAS is used.

#if defined ( BLAS64 )

    // override the BLAS found by CMake, and force a 64-bit interface
    #define SUITESPARSE_BLAS_INT int64_t

#elif defined ( BLAS32 )

    // override the BLAS found by CMake, and force a 32-bit interface
    #define SUITESPARSE_BLAS_INT int32_t

#else

    // let CMake determine the size of the integer in the Fortran BLAS
    #define SUITESPARSE_BLAS_INT int32_t

#endif

// SUITESPARSE_TO_BLAS_INT: convert an integer k to a BLAS integer K and set ok
// to false if the conversion changes its value.  This is implemented as a
// macro so that can work with any type of the integer k.

//------------------------------------------------------------------------------
// SUITESPARSE_BLAS_SUFFIX: modify the name of a Fortran BLAS/LAPACK routine
//------------------------------------------------------------------------------

// OpenBLAS can be compiled by appending a suffix to each routine, so that the
// Fortan routine dgemm becomes dgemm_64, which denotes a version of dgemm with
// 64-bit integer parameters.  The Sun Performance library does the same thing,
// but without the internal underscore, as dgemm64.

// If the suffix does not contain "_", use (Sun Perf., for example):

//     cd build && cmake -DBLAS64_SUFFIX="64" ..

// If the suffix contains "_" (OpenBLAS in spack for example), use the
// following:

//     cd build && cmake -DBLAS64_SUFFIX="_64" ..

// This setting could be used by the spack packaging of SuiteSparse when linked
// with the spack-installed OpenBLAS with 64-bit integers.  See
// https://github.com/spack/spack/blob/develop/var/spack/repos/builtin/packages/suite-sparse/package.py


//------------------------------------------------------------------------------
// C names of Fortan BLAS and LAPACK functions used by SuiteSparse
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// prototypes of BLAS and SUITESPARSE_LAPACK functions
//------------------------------------------------------------------------------

// For complex functions, the (void *) parameters are actually pointers to
// arrays of complex values.  They are prototyped here as (void *) to allow
// them to be called from both C and C++.

// See https://netlib.org/blas/ and https://netlib.org/lapack/ for the
// definitions of the inputs/outputs of these functions.

// These prototypes need to be found by UMFPACK, CHOLMOD, and SPQR, and to do
// so, they need to appear in this public header to ensure the correct BLAS
// library and integer size is used.  However, these definitions should not
// (normally) be exposed to the user application.

// If a user application wishes to use these definitions, simply add

//      #define SUITESPARSE_BLAS_DEFINITIONS
//      #include "SuiteSparse_config.h"

// prior to #include'ing any SuiteSparse headers (amd.h, and so on).

#if defined ( SUITESPARSE_BLAS_DEFINITIONS )

//------------------------------------------------------------------------------
// gemv: Y = alpha*A*x + beta*Y
//------------------------------------------------------------------------------

void SUITESPARSE_BLAS_DGEMV
(
    // input:
    const char *trans,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const double *alpha,
    const double *A,
    const SUITESPARSE_BLAS_INT *lda,
    const double *X,
    const SUITESPARSE_BLAS_INT *incx,
    const double *beta,
    // input/output:
    double *Y,
    // input:
    const SUITESPARSE_BLAS_INT *incy
) ;


void SUITESPARSE_BLAS_SGEMV
(
    // input:
    const char *trans,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const float *alpha,
    const float *A,
    const SUITESPARSE_BLAS_INT *lda,
    const float *X,
    const SUITESPARSE_BLAS_INT *incx,
    const float *beta,
    // input/output:
    float *Y,
    // input:
    const SUITESPARSE_BLAS_INT *incy
) ;


void SUITESPARSE_BLAS_ZGEMV
(
    // input:
    const char *trans,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const void *alpha,
    const void *A,
    const SUITESPARSE_BLAS_INT *lda,
    const void *X,
    const SUITESPARSE_BLAS_INT *incx,
    const void *beta,
    // input/output:
    void *Y,
    // input:
    const SUITESPARSE_BLAS_INT *incy
) ;


void SUITESPARSE_BLAS_CGEMV
(
    // input:
    const char *trans,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const void *alpha,
    const void *A,
    const SUITESPARSE_BLAS_INT *lda,
    const void *X,
    const SUITESPARSE_BLAS_INT *incx,
    const void *beta,
    // input/output:
    void *Y,
    // input:
    const SUITESPARSE_BLAS_INT *incy
) ;


//------------------------------------------------------------------------------
// trsv: solve Lx=b, Ux=b, L'x=b, or U'x=b
//------------------------------------------------------------------------------

void SUITESPARSE_BLAS_DTRSV
(
    // input:
    const char *uplo,
    const char *trans,
    const char *diag,
    const SUITESPARSE_BLAS_INT *n,
    const double *A,
    const SUITESPARSE_BLAS_INT *lda,
    // input/output:
    double *X,
    // input:
    const SUITESPARSE_BLAS_INT *incx
) ;


void SUITESPARSE_BLAS_STRSV
(
    // input:
    const char *uplo,
    const char *trans,
    const char *diag,
    const SUITESPARSE_BLAS_INT *n,
    const float *A,
    const SUITESPARSE_BLAS_INT *lda,
    // input/output:
    float *X,
    // input:
    const SUITESPARSE_BLAS_INT *incx
) ;


void SUITESPARSE_BLAS_ZTRSV
(
    // input:
    const char *uplo,
    const char *trans,
    const char *diag,
    const SUITESPARSE_BLAS_INT *n,
    const void *A,
    const SUITESPARSE_BLAS_INT *lda,
    // input/output:
    void *X,
    // input:
    const SUITESPARSE_BLAS_INT *incx
) ;

void SUITESPARSE_BLAS_CTRSV
(
    // input:
    const char *uplo,
    const char *trans,
    const char *diag,
    const SUITESPARSE_BLAS_INT *n,
    const void *A,
    const SUITESPARSE_BLAS_INT *lda,
    // input/output:
    void *X,
    // input:
    const SUITESPARSE_BLAS_INT *incx
) ;


//------------------------------------------------------------------------------
// trsm: solve LX=B, UX=B, L'X=B, or U'X=B
//------------------------------------------------------------------------------

void SUITESPARSE_BLAS_DTRSM
(
    // input:
    const char *side,
    const char *uplo,
    const char *transa,
    const char *diag,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const double *alpha,
    const double *A,
    const SUITESPARSE_BLAS_INT *lda,
    // input/output:
    double *B,
    // input:
    const SUITESPARSE_BLAS_INT *ldb
) ;

void SUITESPARSE_BLAS_STRSM
(
    // input:
    const char *side,
    const char *uplo,
    const char *transa,
    const char *diag,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const float *alpha,
    const float *A,
    const SUITESPARSE_BLAS_INT *lda,
    // input/output:
    float *B,
    // input:
    const SUITESPARSE_BLAS_INT *ldb
) ;

void SUITESPARSE_BLAS_ZTRSM
(
    // input:
    const char *side,
    const char *uplo,
    const char *transa,
    const char *diag,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const void *alpha,
    const void *A,
    const SUITESPARSE_BLAS_INT *lda,
    // input/output:
    void *B,
    // input:
    const SUITESPARSE_BLAS_INT *ldb
) ;

void SUITESPARSE_BLAS_CTRSM
(
    // input:
    const char *side,
    const char *uplo,
    const char *transa,
    const char *diag,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const void *alpha,
    const void *A,
    const SUITESPARSE_BLAS_INT *lda,
    // input/output:
    void *B,
    // input:
    const SUITESPARSE_BLAS_INT *ldb
) ;


//------------------------------------------------------------------------------
// gemm: C = alpha*A*B + beta*C
//------------------------------------------------------------------------------

void SUITESPARSE_BLAS_DGEMM
(
    // input:
    const char *transa,
    const char *transb,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const double *alpha,
    const double *A,
    const SUITESPARSE_BLAS_INT *lda,
    const double *B,
    const SUITESPARSE_BLAS_INT *ldb,
    const double *beta,
    // input/output:
    double *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc
) ;


void SUITESPARSE_BLAS_SGEMM
(
    // input:
    const char *transa,
    const char *transb,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const float *alpha,
    const float *A,
    const SUITESPARSE_BLAS_INT *lda,
    const float *B,
    const SUITESPARSE_BLAS_INT *ldb,
    const float *beta,
    // input/output:
    float *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc
) ;


void SUITESPARSE_BLAS_ZGEMM
(
    // input:
    const char *transa,
    const char *transb,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const void *alpha,
    const void *A,
    const SUITESPARSE_BLAS_INT *lda,
    const void *B,
    const SUITESPARSE_BLAS_INT *ldb,
    const void *beta,
    // input/output:
    void *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc
) ;


void SUITESPARSE_BLAS_CGEMM
(
    // input:
    const char *transa,
    const char *transb,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const void *alpha,
    const void *A,
    const SUITESPARSE_BLAS_INT *lda,
    const void *B,
    const SUITESPARSE_BLAS_INT *ldb,
    const void *beta,
    // input/output:
    void *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc
) ;


//------------------------------------------------------------------------------
// syrk/herk: C = alpha*A*A' + beta*C ; or C = alpha*A'*A + beta*C
//------------------------------------------------------------------------------

void SUITESPARSE_BLAS_DSYRK
(
    // input:
    const char *uplo,
    const char *trans,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const double *alpha,
    const double *A,
    const SUITESPARSE_BLAS_INT *lda,
    const double *beta,
    // input/output:
    double *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc
) ;


void SUITESPARSE_BLAS_SSYRK
(
    // input:
    const char *uplo,
    const char *trans,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const float *alpha,
    const float *A,
    const SUITESPARSE_BLAS_INT *lda,
    const float *beta,
    // input/output:
    float *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc
) ;


void SUITESPARSE_BLAS_ZHERK
(
    // input:
    const char *uplo,
    const char *trans,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const void *alpha,
    const void *A,
    const SUITESPARSE_BLAS_INT *lda,
    const void *beta,
    // input/output:
    void *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc
) ;

void SUITESPARSE_BLAS_CHERK
(
    // input:
    const char *uplo,
    const char *trans,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const void *alpha,
    const void *A,
    const SUITESPARSE_BLAS_INT *lda,
    const void *beta,
    // input/output:
    void *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc
) ;

//------------------------------------------------------------------------------
// potrf: Cholesky factorization
//------------------------------------------------------------------------------

void SUITESPARSE_LAPACK_DPOTRF
(
    // input:
    const char *uplo,
    const SUITESPARSE_BLAS_INT *n,
    // input/output:
    double *A,
    // input:
    const SUITESPARSE_BLAS_INT *lda,
    // output:
    SUITESPARSE_BLAS_INT *info
) ;

void SUITESPARSE_LAPACK_SPOTRF
(
    // input:
    const char *uplo,
    const SUITESPARSE_BLAS_INT *n,
    // input/output:
    float *A,
    // input:
    const SUITESPARSE_BLAS_INT *lda,
    // output:
    SUITESPARSE_BLAS_INT *info
) ;

void SUITESPARSE_LAPACK_ZPOTRF
(
    // input:
    const char *uplo,
    const SUITESPARSE_BLAS_INT *n,
    // input/output:
    void *A,
    // input:
    const SUITESPARSE_BLAS_INT *lda,
    // output:
    SUITESPARSE_BLAS_INT *info
) ;

void SUITESPARSE_LAPACK_CPOTRF
(
    // input:
    const char *uplo,
    const SUITESPARSE_BLAS_INT *n,
    // input/output:
    void *A,
    // input:
    const SUITESPARSE_BLAS_INT *lda,
    // output:
    SUITESPARSE_BLAS_INT *info
) ;


//------------------------------------------------------------------------------
// scal: Y = alpha*Y
//------------------------------------------------------------------------------

void SUITESPARSE_BLAS_DSCAL
(
    // input:
    const SUITESPARSE_BLAS_INT *n,
    const double *alpha,
    // input/output:
    double *Y,
    // input:
    const SUITESPARSE_BLAS_INT *incy
) ;

void SUITESPARSE_BLAS_SSCAL
(
    // input:
    const SUITESPARSE_BLAS_INT *n,
    const float *alpha,
    // input/output:
    float *Y,
    // input:
    const SUITESPARSE_BLAS_INT *incy
) ;

void SUITESPARSE_BLAS_ZSCAL
(
    // input:
    const SUITESPARSE_BLAS_INT *n,
    const void *alpha,
    // input/output:
    void *Y,
    // input:
    const SUITESPARSE_BLAS_INT *incy
) ;

void SUITESPARSE_BLAS_CSCAL
(
    // input:
    const SUITESPARSE_BLAS_INT *n,
    const void *alpha,
    // input/output:
    void *Y,
    // input:
    const SUITESPARSE_BLAS_INT *incy
) ;


//------------------------------------------------------------------------------
// ger/geru: A = alpha*x*y' + A
//------------------------------------------------------------------------------

void SUITESPARSE_BLAS_DGER
(
    // input:
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const double *alpha,
    const double *X,
    const SUITESPARSE_BLAS_INT *incx,
    const double *Y,
    const SUITESPARSE_BLAS_INT *incy,
    // input/output:
    double *A,
    // input:
    const SUITESPARSE_BLAS_INT *lda
) ;


void SUITESPARSE_BLAS_SGER
(
    // input:
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const float *alpha,
    const float *X,
    const SUITESPARSE_BLAS_INT *incx,
    const float *Y,
    const SUITESPARSE_BLAS_INT *incy,
    // input/output:
    float *A,
    // input:
    const SUITESPARSE_BLAS_INT *lda
) ;


void SUITESPARSE_BLAS_ZGERU
(
    // input:
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const void *alpha,
    const void *X,
    const SUITESPARSE_BLAS_INT *incx,
    const void *Y,
    const SUITESPARSE_BLAS_INT *incy,
    // input/output:
    void *A,
    // input:
    const SUITESPARSE_BLAS_INT *lda
) ;


void SUITESPARSE_BLAS_CGERU
(
    // input:
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const void *alpha,
    const void *X,
    const SUITESPARSE_BLAS_INT *incx,
    const void *Y,
    const SUITESPARSE_BLAS_INT *incy,
    // input/output:
    void *A,
    // input:
    const SUITESPARSE_BLAS_INT *lda
) ;


//------------------------------------------------------------------------------
// larft: T = block Householder factor
//------------------------------------------------------------------------------

void SUITESPARSE_LAPACK_DLARFT
(
    // input:
    const char *direct,
    const char *storev,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const double *V,
    const SUITESPARSE_BLAS_INT *ldv,
    const double *Tau,
    // output:
    double *T,
    // input:
    const SUITESPARSE_BLAS_INT *ldt
) ;

void SUITESPARSE_LAPACK_SLARFT
(
    // input:
    const char *direct,
    const char *storev,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const float *V,
    const SUITESPARSE_BLAS_INT *ldv,
    const float *Tau,
    // output:
    float *T,
    // input:
    const SUITESPARSE_BLAS_INT *ldt
) ;

void SUITESPARSE_LAPACK_ZLARFT
(
    // input:
    const char *direct,
    const char *storev,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const void *V,
    const SUITESPARSE_BLAS_INT *ldv,
    const void *Tau,
    // output:
    void *T,
    // input:
    const SUITESPARSE_BLAS_INT *ldt
) ;

void SUITESPARSE_LAPACK_CLARFT
(
    // input:
    const char *direct,
    const char *storev,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const void *V,
    const SUITESPARSE_BLAS_INT *ldv,
    const void *Tau,
    // output:
    void *T,
    // input:
    const SUITESPARSE_BLAS_INT *ldt
) ;

//------------------------------------------------------------------------------
// larfb: apply block Householder reflector
//------------------------------------------------------------------------------

void SUITESPARSE_LAPACK_DLARFB
(
    // input:
    const char *side,
    const char *trans,
    const char *direct,
    const char *storev,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const double *V,
    const SUITESPARSE_BLAS_INT *ldv,
    const double *T,
    const SUITESPARSE_BLAS_INT *ldt,
    // input/output:
    double *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc,
    // workspace:
    double *Work,
    // input:
    const SUITESPARSE_BLAS_INT *ldwork
) ;

void SUITESPARSE_LAPACK_SLARFB
(
    // input:
    const char *side,
    const char *trans,
    const char *direct,
    const char *storev,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const float *V,
    const SUITESPARSE_BLAS_INT *ldv,
    const float *T,
    const SUITESPARSE_BLAS_INT *ldt,
    // input/output:
    float *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc,
    // workspace:
    float *Work,
    // input:
    const SUITESPARSE_BLAS_INT *ldwork
) ;

void SUITESPARSE_LAPACK_ZLARFB
(
    // input:
    const char *side,
    const char *trans,
    const char *direct,
    const char *storev,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const void *V,
    const SUITESPARSE_BLAS_INT *ldv,
    const void *T,
    const SUITESPARSE_BLAS_INT *ldt,
    // input/output:
    void *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc,
    // workspace:
    void *Work,
    // input:
    const SUITESPARSE_BLAS_INT *ldwork
) ;

void SUITESPARSE_LAPACK_CLARFB
(
    // input:
    const char *side,
    const char *trans,
    const char *direct,
    const char *storev,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const SUITESPARSE_BLAS_INT *k,
    const void *V,
    const SUITESPARSE_BLAS_INT *ldv,
    const void *T,
    const SUITESPARSE_BLAS_INT *ldt,
    // input/output:
    void *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc,
    // workspace:
    void *Work,
    // input:
    const SUITESPARSE_BLAS_INT *ldwork
) ;


//------------------------------------------------------------------------------
// nrm2: vector 2-norm
//------------------------------------------------------------------------------

double SUITESPARSE_BLAS_DNRM2
(
    // input:
    const SUITESPARSE_BLAS_INT *n,
    const double *X,
    const SUITESPARSE_BLAS_INT *incx
) ;


float SUITESPARSE_BLAS_SNRM2
(
    // input:
    const SUITESPARSE_BLAS_INT *n,
    const float *X,
    const SUITESPARSE_BLAS_INT *incx
) ;


double SUITESPARSE_BLAS_DZNRM2
(
    // input:
    const SUITESPARSE_BLAS_INT *n,
    const void *X,
    const SUITESPARSE_BLAS_INT *incx
) ;


float SUITESPARSE_BLAS_SCNRM2
(
    // input:
    const SUITESPARSE_BLAS_INT *n,
    const void *X,
    const SUITESPARSE_BLAS_INT *incx
) ;


//------------------------------------------------------------------------------
// larfg: generate Householder reflector
//------------------------------------------------------------------------------

void SUITESPARSE_LAPACK_DLARFG
(
    // input:
    const SUITESPARSE_BLAS_INT *n,
    // input/output:
    double *alpha,
    double *X,
    // input:
    const SUITESPARSE_BLAS_INT *incx,
    // output:
    double *tau
) ;


void SUITESPARSE_LAPACK_SLARFG
(
    // input:
    const SUITESPARSE_BLAS_INT *n,
    // input/output:
    float *alpha,
    float *X,
    // input:
    const SUITESPARSE_BLAS_INT *incx,
    // output:
    float *tau
) ;


void SUITESPARSE_LAPACK_ZLARFG
(
    // input:
    const SUITESPARSE_BLAS_INT *n,
    // input/output:
    void *alpha,
    void *X,
    // input:
    const SUITESPARSE_BLAS_INT *incx,
    // output:
    void *tau
) ;


void SUITESPARSE_LAPACK_CLARFG
(
    // input:
    const SUITESPARSE_BLAS_INT *n,
    // input/output:
    void *alpha,
    void *X,
    // input:
    const SUITESPARSE_BLAS_INT *incx,
    // output:
    void *tau
) ;


//------------------------------------------------------------------------------
// larf: apply Householder reflector
//------------------------------------------------------------------------------

void SUITESPARSE_LAPACK_DLARF
(
    // input:
    const char *side,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const double *V,
    const SUITESPARSE_BLAS_INT *incv,
    const double *tau,
    // input/output:
    double *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc,
    // workspace:
    double *Work
) ;


void SUITESPARSE_LAPACK_SLARF
(
    // input:
    const char *side,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const float *V,
    const SUITESPARSE_BLAS_INT *incv,
    const float *tau,
    // input/output:
    float *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc,
    // workspace:
    float *Work
) ;


void SUITESPARSE_LAPACK_ZLARF
(
    // input:
    const char *side,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const void *V,
    const SUITESPARSE_BLAS_INT *incv,
    const void *tau,
    // input/output:
    void *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc,
    // workspace:
    void *Work
) ;


void SUITESPARSE_LAPACK_CLARF
(
    // input:
    const char *side,
    const SUITESPARSE_BLAS_INT *m,
    const SUITESPARSE_BLAS_INT *n,
    const void *V,
    const SUITESPARSE_BLAS_INT *incv,
    const void *tau,
    // input/output:
    void *C,
    // input:
    const SUITESPARSE_BLAS_INT *ldc,
    // workspace:
    void *Work
) ;


//------------------------------------------------------------------------------
// SuiteSparse_BLAS_library: return name of BLAS library found
//------------------------------------------------------------------------------

// Returns the name of the BLAS library found by SuiteSparse_config

const char *SuiteSparse_BLAS_library ( void ) ;

//------------------------------------------------------------------------------
// SuiteSparse_BLAS_integer_size: return sizeof (SUITESPARSE_BLAS_INT)
//------------------------------------------------------------------------------

size_t SuiteSparse_BLAS_integer_size ( void ) ;

#ifdef __cplusplus
}
#endif
#endif

