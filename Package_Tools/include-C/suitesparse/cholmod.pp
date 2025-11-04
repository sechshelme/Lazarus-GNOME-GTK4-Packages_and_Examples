
unit cholmod;
interface

{
  Automatically converted by H2Pas 1.0.0 from cholmod.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cholmod.h
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
Pcholmod_common  = ^cholmod_common;
Pcholmod_common_struct  = ^cholmod_common_struct;
Pcholmod_dense  = ^cholmod_dense;
Pcholmod_dense_struct  = ^cholmod_dense_struct;
Pcholmod_descendant_score_t  = ^cholmod_descendant_score_t;
Pcholmod_factor  = ^cholmod_factor;
Pcholmod_factor_struct  = ^cholmod_factor_struct;
Pcholmod_gpu_pointers  = ^cholmod_gpu_pointers;
Pcholmod_sparse  = ^cholmod_sparse;
Pcholmod_sparse_struct  = ^cholmod_sparse_struct;
Pcholmod_triplet  = ^cholmod_triplet;
Pcholmod_triplet_struct  = ^cholmod_triplet_struct;
PdescendantScore  = ^descendantScore;
Pdouble  = ^double;
PFILE  = ^FILE;
Pint32_t  = ^int32_t;
Pint64_t  = ^int64_t;
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{------------------------------------------------------------------------------ }
{ CHOLMOD/Include/cholmod.h: include file for CHOLMOD }
{------------------------------------------------------------------------------ }
{ CHOLMOD/Include/cholmod.h.  Copyright (C) 2005-2023, Timothy A. Davis. }
{ All Rights Reserved. }
{ Each Module of CHOLMOD has its own license, and a shared cholmod.h file. }
{ CHOLMOD/Check:      SPDX-License-Identifier: LGPL-2.1+ }
{ CHOLMOD/Cholesky:   SPDX-License-Identifier: LGPL-2.1+ }
{ CHOLMOD/Utility:    SPDX-License-Identifier: LGPL-2.1+ }
{ CHOLMOD/Partition:  SPDX-License-Identifier: LGPL-2.1+ }
{ CHOLMOD/Demo:       SPDX-License-Identifier: GPL-2.0+ }
{ CHOLMOD/GPU:        SPDX-License-Identifier: GPL-2.0+ }
{ CHOLMOD/MATLAB:     SPDX-License-Identifier: GPL-2.0+ }
{ CHOLMOD/MatrixOps:  SPDX-License-Identifier: GPL-2.0+ }
{ CHOLMOD/Modify:     SPDX-License-Identifier: GPL-2.0+ }
{ CHOLMOD/Supernodal: SPDX-License-Identifier: GPL-2.0+ }
{ CHOLMOD/Tcov:       SPDX-License-Identifier: GPL-2.0+ }
{------------------------------------------------------------------------------ }
{ CHOLMOD consists of a set of Modules, each with their own Copyright and }
{ license: either LGPL-2.1+ or GPL-2.0+.  This cholmod.h file includes }
{ definitions of the CHOLMOD API for all Modules, and this cholmod.h file }
{ itself is provided to you with a permissive license (Apache-2.0).  You are }
{ permitted to provide the hooks for an optional interface to CHOLMOD in a }
{ non-GPL/non-LGPL code, without requiring you to agree to the GPL/LGPL }
{ license of the Modules, as long as you don't use the *.c files in the }
{ relevant Modules.  The Modules themselves can only be functional if their }
{ GPL or LGPL licenses are used, or if you obtain a different license from the }
{ respective copyright holders. }
{ }
{ For the files in CHOLMOD/Include: }
{ CHOLMOD/Include/cholmod.h            SPDX-License-Identifier: Apache-2.0 }
{ CHOLMOD/Include/cholmod_internal.h   SPDX-License-Identifier: Apache-2.0 }
{ CHOLMOD/Include/cholmod_template.h   SPDX-License-Identifier: Apache-2.0 }
{ CHOLMOD/Include/cholmod_types.h      SPDX-License-Identifier: Apache-2.0 }
{ }
{ The Modify Module is co-authored by William W. Hager. }
{ }
{ Acknowledgements:  this work was supported in part by the National Science }
{ Foundation (NFS CCR-0203270 and DMS-9803599), and a grant from Sandia }
{ National Laboratories (Dept. of Energy) which supported the development of }
{ CHOLMOD's Partition Module. }
{ ----------------------------------------------------------------------------- }
{$ifndef CHOLMOD_H}
{$define CHOLMOD_H}
{------------------------------------------------------------------------------ }
{ CHOLMOD conventions }
{------------------------------------------------------------------------------ }
{ Each routine in CHOLMOD follows the following conventions: }
{ }
{ Naming convention: }
{ ------------------ }
{ }
{  All routine names, data types, and CHOLMOD library files use the cholmod_ }
{  prefix.  All macros and other #define's use the CHOLMOD prefix. }
{ }
{ Return value: }
{ ------------- }
{ }
{  Most CHOLMOD routines return an int (TRUE (1) if successful, or FALSE }
{      (0) otherwise.  An int32_t, int64_t, double, or float return value }
{      is >= 0 if successful, or -1 otherwise.  A size_t return value }
{      is > 0 if successful, or 0 otherwise. }
{ }
{      If a routine returns a pointer, it is a pointer to a newly allocated }
{      object or NULL if a failure occured, with one exception.  cholmod_free }
{      always returns NULL. }
{ }
{ "Common" parameter: }
{ ------------------ }
{ }
{  The last parameter in all CHOLMOD routines is a pointer to the CHOLMOD }
{  "Common" object.  This contains control parameters, statistics, and }
{  workspace used between calls to CHOLMOD.  It is always an input/output }
{  parameter. }
{ }
{ Input, Output, and Input/Output parameters: }
{ ------------------------------------------- }
{ }
{  Input parameters are listed first.  They are not modified by CHOLMOD. }
{ }
{  Input/output are listed next.  They must be defined on input, and }
{  are modified on output. }
{ }
{  Output parameters are listed next.  If they are pointers, they must }
{  point to allocated space on input, but their contents are not defined }
{  on input. }
{ }
{  Workspace parameters appear next.  They are used in only two routines }
{  in the Supernodal module. }
{ }
{  The cholmod_common *Common parameter always appears as the last }
{  parameter.  It is always an input/output parameter. }
{------------------------------------------------------------------------------ }
{ CHOLMOD matrix formats }
{------------------------------------------------------------------------------ }
{ A CHOLMOD sparse, dense, or triplet matrix A, or a sparse factorization L }
{ can hold numeric values of 8 different types, according to its A->xtype and }
{ A->dtype parameters (or L->xtype and L->dtype for a sparse factor object). }
{ These values are held in the A->x array, and also A->z for "zomplex" }
{ matrices. }
{ }
{  A->xtype:   the matrix is real, complex, "zomplex", or pattern-only. }
{ }
{      (0): CHOLMOD_PATTERN:   A->x and A->z are NULL.  The matrix has no }
{                              numerical values.  Only the pattern is stored. }
{ }
{      (1): CHOLMOD_REAL:      The matrix is real, and the values are held in }
{                              A->x, whose size (in terms of double or float }
{                              values) is given by A->nzmax.  The kth value in }
{                              the matrix is held in A->x [k]. }
{ }
{      (2): CHOLMOD_COMPLEX:   The matrix is complex, with interleaved real and }
{                              imaginary parts.  The kth value in the matrix }
{                              is held in A->x [2*k] and A->x [2*k+1], where }
{                              A->x can hold up to 2*A->nzmax values. }
{ }
{      (3): CHOLMOD_ZOMPLEX:   The matrix is complex, with separate array for }
{                              the real and imaginary parts.  The kth value in }
{                              the matrix is held in A->x [k] and A->z [k], }
{                              where A->x and A->z can hold up to A->nzmax }
{                              values each. }
{ A->xtype values: }

const
  CHOLMOD_PATTERN = 0;  
  CHOLMOD_REAL = 1;  
  CHOLMOD_COMPLEX = 2;  
  CHOLMOD_ZOMPLEX = 3;  
{  A->dtype:   this parameter determines the type of values in A->x (and A->z }
{              if zomplex). }
{ }
{      (0) CHOLMOD_DOUBLE:     A->x (and A->z for zomplex matrices) is double. }
{                              If A is real, A->x has a size of A->nzmax * }
{                              sizeof (double).  If A is complex, A->x has }
{                              size A->nzmax * 2 * sizeof (double).  If }
{                              zomplex, both A->x and A->z have size A->nzmax }
{                              * sizeof (double). }
{ }
{      (4) CHOLMOD_SINGLE:     A->x (and A->z for zomplex matrices) is float. }
{                              If A is real, A->x has a size of A->nzmax * }
{                              sizeof (float).  If A is complex, A->x has size }
{                              A->nzmax * 2 * sizeof (float).  If zomplex, }
{                              both A->x and A->z have size A->nzmax * sizeof }
{                              (float).  This feature is new to CHOLMOD v5. }
{ }
{ A->dtype values: }
  CHOLMOD_DOUBLE = 0;  
  CHOLMOD_SINGLE = 4;  
{ Unless stated otherwise, the xtype and dtypes of all inputs to a method must }
{ be the same. }
{ }
{ Many methods accept an xdtype parameter, which is simply xtype + dtype, }
{ combining the two parameters into a single number handling all 8 cases: }
{ }
{      (0) CHOLMOD_DOUBLE + CHOLMOD_PATTERN    a pattern-only matrix }
{      (1) CHOLMOD_DOUBLE + CHOLMOD_REAL       a double real matrix }
{      (2) CHOLMOD_DOUBLE + CHOLMOD_COMPLEX    a double complex matrix }
{      (3) CHOLMOD_DOUBLE + CHOLMOD_ZOMPLEX    a double zomplex matrix }
{      (4) CHOLMOD_SINGLE + CHOLMOD_PATTERN    a pattern-only matrix }
{      (5) CHOLMOD_SINGLE + CHOLMOD_REAL       a float real matrix }
{      (6) CHOLMOD_SINGLE + CHOLMOD_COMPLEX    a float complex matrix }
{      (7) CHOLMOD_SINGLE + CHOLMOD_ZOMPLEX    a float zomplex matrix }
{ }
{ This approach was selected for backward compatibility with CHOLMOD v4 and }
{ earlier, where only the first four values were supported, and where the }
{ parameter was called "xtype" instead of "xdtype".  Several function names }
{ reflect the older parameter name (cholmod_*_xtype), but they have not been }
{ renamed "_xdtype", for backward compatibility. }
{ }
{ A CHOLMOD sparse or triplet matrix A can held in three symmetry formats }
{ according to its A->stype parameter.  Dense matrices do not have this }
{ parameter and are always treated as unsymmetric.  A sparse factor object L }
{ is always held in lower triangular form, with no entries ever held in the }
{ strictly upper triangular part. }
{ }
{      0:  the matrix is unsymmetric with both lower and upper parts stored. }
{ }
{      <0: the matrix is symmetric, with just the lower triangular part and }
{          diagonal stored.  Any entries in the upper part are ignored. }
{ }
{      >0: the matrix is symmetric, with just the upper triangular part stored }
{          and diagonal.  Any entries in the upper part are ignored. }
{ }
{ If a sparse or triplet matrix A is complex or zomplex, most methods treat }
{ the matrix as Hermitian, where A(i,j) is the complex conjugate of A(j,i), }
{ when i is not equal to j.  Some methods can also interpret the matrix as }
{ complex symmetric, where A(i,j) == A(j,i) when i != j.  This is not }
{ determined by the matrix itself, but by a "mode" parameter of the function. }
{ This mode parameter also determines if the values of any matrix are to be }
{ ignored entirely, in which case only the pattern is operated on.  Any output }
{ matrix will have an xtype of CHOLMOD_PATTERN. }
{ }
{ The valid mode values are given below, except that many methods do not }
{ handle the negative cases.  Values below the range accepted by the method }
{ are treated as its lowest accepted value, and values above the range }
{ accepted by the method are treated as its highest accepted value. }
{ }
{  mode = 2:   the numerical values of a real, complex, or zomplex matrix are }
{              handled.  If the matrix is complex or zomplex, an entry A(i,j) }
{              that not stored (or in the ignored part) is treated as the }
{              complex conjugate of A (j,i).  Use this mode to treat a }
{              complex or zomplex matrix as Hermitian. }
{ }
{  mode = 1:   the numerical values of a real, complex, or zomplex matrix are }
{              handled.  If the matrix is complex or zomplex, an entry A(i,j) }
{              that not stored (or in the ignored part) is treated as equal A }
{              (j,i).  Use this mode to treat a complex or zomplex matrix as }
{              complex symmetric. }
{ }
{  mode = 0:   the numerical values are ignored.  Any output matrix will have }
{              an xtype of CHOLMOD_PATTERN.  This mode allows inputs to have }
{              different dtypes. }
{ }
{  mode = -1:  the same as mode = 0, except that the diagonal entries are }
{              ignored, and do not appear in any output matrix. }
{ }
{  mode = -2:  the same as mode = -1, except that the output matrix is given an }
{              additional slack space so that it can hold about 50% more }
{              entries.  This mode is documented here but it is primarily }
{              meant for internal use, for CHOLMOD's interface to the AMD, }
{              CAMD, COLAMD, and CCOLAMD ordering methods. }
{ }
{ The integer arrays in all objects are either int32 or int64, as determined }
{ by A->type.  This integer type must be identical for all inputs, and must }
{ also match both the function name (cholmod_method for int32, or }
{ cholmod_l_method for int64) and the Common->itype as defined when CHOLMOD }
{ was initialized (via cholmod_start for int32, or cholmod_l_start for int64). }
{ itype values: }
{ int32, for cholmod_* methods (no _l_)  }
  CHOLMOD_INT = 0;  
{ int64, for cholmod_l_* methods         }
  CHOLMOD_LONG = 2;  
{------------------------------------------------------------------------------ }
{ version control }
{------------------------------------------------------------------------------ }
  CHOLMOD_DATE = 'Jan 20, 2024';  
  CHOLMOD_MAIN_VERSION = 5;  
  CHOLMOD_SUB_VERSION = 2;  
  CHOLMOD_SUBSUB_VERSION = 0;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function CHOLMOD_VER_CODE(main,sub : longint) : longint;

{ was #define dname def_expr }
function CHOLMOD_VERSION : longint; { return type might be wrong }

{$define CHOLMOD_HAS_VERSION_FUNCTION}
{//xxxxxxxxx        #define CHOLMOD_CUBLAS_HANDLE void * }
{        #define CHOLMOD_CUDASTREAM    void * }
{        #define CHOLMOD_CUDAEVENT     void * }
{ C++ extern C conditionnal removed }
{ returns CHOLMOD_VERSION, defined above }
{ if version is not NULL, then cholmod_version returns its contents as: }
{ version [0] = CHOLMOD_MAIN_VERSION }
{ version [1] = CHOLMOD_SUB_VERSION }
{ version [2] = CHOLMOD_SUBSUB_VERSION }
function cholmod_version(version:array[0..2] of longint):longint;cdecl;external;
function cholmod_l_version(version:array[0..2] of longint):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{------------------------------------------------------------------------------ }
{ Large file support }
{------------------------------------------------------------------------------ }
{ CHOLMOD assumes large file support.  If problems occur, compile with }
{ -DNLARGEFILE }
{ Definitions required for large file I/O, which must come before any other }
{ #includes.  These are not used if -DNLARGEFILE is defined at compile time. }
{ Large file support may not be portable across all platforms and compilers; }
{ if you encounter an error here, compile your code with -DNLARGEFILE.  In }
{ particular, you must use -DNLARGEFILE for MATLAB 6.5 or earlier (which does }
{ not have the io64.h include file). }
{ skip all of this if NLARGEFILE is defined at the compiler command line }
{$ifndef NLARGEFILE}
{$if defined(MATLAB_MEX_FILE) || defined(MATHWORKS)}
{ CHOLMOD compiled as a MATLAB mexFunction, or for use in MATLAB }
{$include "io64.h"}
{$else}
{ CHOLMOD is being compiled in a stand-alone library }
{$undef  _LARGEFILE64_SOURCE}
{$define _LARGEFILE64_SOURCE}
{$undef  _FILE_OFFSET_BITS}

const
  _FILE_OFFSET_BITS = 64;  
{$endif}
{$endif}
{------------------------------------------------------------------------------ }
{ SuiteSparse_config: definitions for all SuiteSparse packages }
{------------------------------------------------------------------------------ }
{$include "SuiteSparse_config.h"}
{------------------------------------------------------------------------------ }
{ CHOLMOD configuration }
{------------------------------------------------------------------------------ }
{ You do not have to edit any CHOLMOD files to compile and install CHOLMOD. }
{ However, if you do not use all of CHOLMOD's modules, you need to compile }
{ with the appropriate flag, or edit this file to add the appropriate #define. }
{ }
{ Compiler flags for CHOLMOD }
{ }
{ -DNCHECK         do not include the Check module. }
{ -DNCHOLESKY      do not include the Cholesky module. }
{ -DNPARTITION     do not include the Partition module. }
{ -DNCAMD          do not include the interfaces to CAMD, }
{                  CCOLAMD, CSYMAND in Partition module. }
{ -DNMATRIXOPS     do not include the MatrixOps module. }
{ -DNMODIFY        do not include the Modify module. }
{ -DNSUPERNODAL    do not include the Supernodal module. }
{ }
{ -DNPRINT         do not print anything }
{ }
{ The Utility Module is always included in the CHOLMOD library. }
{ Use the compiler flag, or uncomment the definition(s), if you want to use }
{ one or more non-default installation options: }
{      #define NCHECK }
{      #define NCHOLESKY }
{      #define NCAMD }
{      #define NPARTITION }
{      #define NMATRIXOPS }
{      #define NMODIFY }
{      #define NSUPERNODAL }
{      #define NPRINT }
{      #define NGPL }
{ The NGPL option disables the MatrixOps, Modify, and Supernodal modules.  The }
{  existence of this #define here, and its use in these 3 modules, does not }
{  affect the license itself; see CHOLMOD/Doc/License.txt for your actual }
{  license. }
{$ifdef NGPL}
{$undef  NMATRIXOPS}
{$define NMATRIXOPS}
{$undef  NMODIFY}
{$define NMODIFY}
{$undef  NSUPERNODAL}
{$define NSUPERNODAL}
{$endif}
{============================================================================== }
{ CHOLMOD:Utility Module }
{============================================================================== }
{ the CHOLMOD:Utility Module is always required }
{$if 1}
{------------------------------------------------------------------------------ }
{ CUDA BLAS }
{------------------------------------------------------------------------------ }
{ Define buffering parameters for GPU processing }
{$ifndef SUITESPARSE_GPU_EXTERN_ON}
{$ifdef CHOLMOD_HAS_CUDA}
{$include <cublas_v2.h>}
{$endif}
{$endif}

const
  CHOLMOD_DEVICE_SUPERNODE_BUFFERS = 6;  
  CHOLMOD_HOST_SUPERNODE_BUFFERS = 8;  
  CHOLMOD_DEVICE_STREAMS = 2;  
{------------------------------------------------------------------------------ }
{ CHOLMOD objects }
{------------------------------------------------------------------------------ }
{ CHOLMOD object enums }
{ parameters, statistics, and workspace  }
  CHOLMOD_COMMON = 0;  
{ a sparse matrix in CSC form (and variants)  }
  CHOLMOD_SPARSE = 1;  
{ a sparse factorization  }
  CHOLMOD_FACTOR = 2;  
{ a dense matrix in column-oriented form  }
  CHOLMOD_DENSE = 3;  
{ a sparse matrix in triplet form  }
  CHOLMOD_TRIPLET = 4;  
{------------------------------------------------------------------------------ }
{ CHOLMOD Common object }
{------------------------------------------------------------------------------ }
{ C++ extern C conditionnal removed }
{ always use simplicial method          }
  CHOLMOD_SIMPLICIAL = 0;  
{ auto select simplicial vs supernodal  }
  CHOLMOD_AUTO = 1;  
{ always use supernoda method           }
  CHOLMOD_SUPERNODAL = 2;  
{ no preordering                    }
  CHOLMOD_NATURAL = 0;  
{ user-provided permutation         }
  CHOLMOD_GIVEN = 1;  
{ AMD: approximate minimum degree   }
  CHOLMOD_AMD = 2;  
{ METIS: mested dissection          }
  CHOLMOD_METIS = 3;  
{ CHOLMOD's nested dissection       }
  CHOLMOD_NESDIS = 4;  
{ AMD for A, COLAMD for AA' or A'A  }
  CHOLMOD_COLAMD = 5;  
{ natural then postordered          }
  CHOLMOD_POSTORDERED = 6;  
{ max # of methods in Common->method  }
  CHOLMOD_MAXMETHODS = 9;  
  CHOLMOD_OK = 0;  
{ module not installed           }
  CHOLMOD_NOT_INSTALLED = -(1);  
{ malloc/calloc/realloc failed   }
  CHOLMOD_OUT_OF_MEMORY = -(2);  
{ integer overflow               }
  CHOLMOD_TOO_LARGE = -(3);  
{ input invalid                  }
  CHOLMOD_INVALID = -(4);  
{ CUDA error                     }
  CHOLMOD_GPU_PROBLEM = -(5);  
{ matrix not positive definite   }
  CHOLMOD_NOT_POSDEF = 1;  
{ diagonal entry very small      }
  CHOLMOD_DSMALL = 2;  
{-------------------------------------------------------------------------- }
{ primary parameters for factorization and update/downdate }
{-------------------------------------------------------------------------- }
{ Bounds the diagonal entries of D for LDL' }
{ factorization and update/downdate/rowadd.  Entries outside this }
{ bound are replaced with dbound.  Default: 0.  dbound is used for }
{ double precision factorization only.  See sbound for single }
{ precision factorization. }
{ default: 1.2 }
{ default: 1.2 }
{ default: 5 }
{ Initial space for simplicial factorization is max(grow0,1) times the }
{ required space.  If space is exhausted, L is grown by max(grow0,1.2) }
{ times the required space.  grow1 and grow2 control how each column }
{ of L can grow in an update/downdate; if space runs out, then }
{ grow1*(required space) + grow2 is allocated. }
{ maximum rank for update/downdate.  Valid values are }
{ 2, 4, and 8.  Default is 8.  If a larger update/downdate is done, it }
{ is done in steps of maxrank. }
{ default: 40 }
{ default: CHOLMOD_AUTO. }
{ Controls supernodal vs simplicial factorization.  If }
{ Common->supernodal is CHOLMOD_SIMPLICIAL, a simplicial factorization }
{ is always done; if CHOLMOD_SUPERNODAL, a supernodal factorization is }
{ always done.  If CHOLMOD_AUTO, then a simplicial factorization is }
{ down if flops/nnz(L) < Common->supernodal_switch. }
{ if true, other final_* parameters are ignored, }
{ except for final_pack and the factors are left as-is when done. }
{ Default: true. }
{ if true, leave factor in supernodal form. }
{ if false, convert to simplicial.  Default: true. }
{ if true, simplicial factors are converted to LL', }
{ otherwise left as LDL.  Default: false. }
{ if true, the factorize are allocated with exactly }
{ the space required.  Set this to false if you expect future }
{ updates/downdates (giving a little extra space for future growth), }
{ Default: true. }
{ if true, columns are sorted when done, by }
{ ascending row index.  Default: true. }
{ if true, a supernodal factorization converted }
{ to simplicial is reanalyzed, to remove zeros added for relaxed }
{ amalgamation.  Default: false. }
{ The zrelax and nrelax parameters control relaxed supernodal }
{ amalgamation,  If ns is the # of columns in two adjacent supernodes, }
{ and z is the fraction of zeros in the two supernodes if merged, then }
{ the two supernodes are merged if any of the 5 following condition }
{ are true: }
{ }
{      no new zero entries added if the two supernodes are merged }
{      (ns <= nrelax [0]) }
{      (ns <= nrelax [1] && z < zrelax [0]) }
{      (ns <= nrelax [2] && z < zrelax [1]) }
{      (z < zrelax [2]) }
{ }
{ With the defaults, the rules become: }
{ }
{      no new zero entries added if the two supernodes are merged }
{      (ns <=  4) }
{      (ns <= 16 && z < 0.8) }
{      (ns <= 48 && z < 0.1) }
{      (z < 0.05) }
{ if true, and a complex system is solved, }
{ X is returned as zomplex (with two arrays, one for the real part }
{ and one for the imaginary part).  If false, then X is returned as }
{ a single array with interleaved real and imaginary parts. }
{ Default: false. }
{ if true, then a preference is given for holding }
{ a symmetric matrix by just its upper triangular form.  This gives }
{ the best performance by the CHOLMOD analysis and factorization }
{ methods.  Only used by cholmod_read.  Default: true. }
{ if true, a supernodal factorization }
{ returns immediately if it finds the matrix is not positive definite. }
{ If false, the failed supernode is refactorized, up to but not }
{ including the failed column (required by MATLAB). }
{ if true, cholmod_read_triplet converts a symmetric }
{ pattern-only matrix to a real matrix with all values set to 1. }
{ if false, diagonal entries A(k,k) are set to one plus the # of }
{ entries in row/column k, and off-diagonals are set to -1. }
{ Default: false. }
{-------------------------------------------------------------------------- }
{ printing and error handling options }
{-------------------------------------------------------------------------- }
{ print level.  Default is 3. }
{ if true, print 16 digits, otherwise 5. Default: false. }
{ if true, ignore errors (CHOLMOD is assumed to be inside }
{ a try/catch block.  No error messages are printed and the }
{ error_handler function is not called.  Default: false. }
(* Const before type ignored *)
(* Const before type ignored *)
{ User error handling routine; default is NULL. }
{ This function is called if an error occurs, with parameters: }
{ status: the Common->status result. }
{ file: filename where the error occurred. }
{ line: line number where the error occurred. }
{ message: a string that describes the error. }
{-------------------------------------------------------------------------- }
{ ordering options }
{-------------------------------------------------------------------------- }
{ CHOLMOD can try many ordering options and then pick the best result it }
{ finds.  The default is to use one or two orderings: the user's }
{ permutation (if given), and AMD. }
{ Common->nmethods is the number of methods to try.  If the }
{ Common->method array is left unmodified, the methods are: }
{ (0) given (skipped if no user permutation) }
{ (1) amd }
{ (2) metis }
{ (3) nesdis with defaults (CHOLMOD's nested dissection, based on METIS) }
{ (4) natural }
{ (5) nesdis: stop at subgraphs of 20000 nodes }
{ (6) nesdis: stop at subgraphs of 4 nodes, do not use CAMD }
{ (7) nesdis: no pruning on of dense rows/cols }
{ (8) colamd }
{ To use all 9 of the above methods, set Common->nmethods to 9.  The }
{ analysis will take a long time, but that might be worth it if the }
{ ordering will be reused many many times. }
{ Common->nmethods and Common->methods can be revised to use a different }
{ set of orderings.  For example, to use just a single method }
{ (AMD with a weighted postordering): }
{ }
{      Common->nmethods = 1 ; }
{      Common->method [0].ordering = CHOLMOD_AMD ; }
{      Common->postorder = TRUE ; }
{ }
{ }
{ Number of methods to try, default is 0. }
{ The value of 0 is a special case, and tells CHOLMOD to use the user }
{ permutation (if not NULL) and then AMD.  Next, if fl is lnz are the }
{ flop counts and number of nonzeros in L as found by AMD, then the }
{ this ordering is used if fl/lnz < 500 or lnz/anz < 5, where anz is }
{ the number of entries in A.  If this condition fails, METIS is tried }
{ as well. }
{ }
{ Otherwise, if Common->nmethods > 0, then the methods defined by }
{ Common->method [0 ... Common->nmethods-1] are used. }
{ The current method being tried in the analysis. }
{ The selected method: Common->method [Common->selected] }
{ The Common->method parameter is an array of structs that defines up }
{ to 9 methods: }
{---------------------------------------------------------------------- }
{ statistics from the ordering }
{---------------------------------------------------------------------- }
{ number of nonzeros in L }
{ Cholesky flop count for this ordering (each }
{ multiply and each add counted once (doesn't count complex }
{ flops). }
{---------------------------------------------------------------------- }
{ ordering parameters: }
{---------------------------------------------------------------------- }
{ dense row/col control.  Default: 10. }
{ Rows/cols with more than max (prune_dense*sqrt(n),16) are }
{ removed prior to orderingm and placed last.  If negative, }
{ only completely dense rows/cols are removed.  Removing these }
{ rows/cols with many entries can speed up the ordering, but }
{ removing too many can reduce the ordering quality. }
{ }
{ For AMD, SYMAMD, and CSYMAMD, this is the only dense row/col }
{ parameter.  For COLAMD and CCOLAMD, this parameter controls }
{ how dense columns are handled. }
{ dense row control for COLAMD and CCOLAMD. }
{ Default -1.  When computing the Cholesky factorization of AA' }
{ rows with more than max(prune_dense2*sqrt(n),16) entries }
{ are removed prior to ordering.  If negative, only completely }
{ dense rows are removed. }
{ for CHOLMOD's nesdis method. Default 1. }
{ A node separator with nsep nodes is discarded if }
{ nsep >= nd_oksep*n. }
{ unused, for future expansion }
{ for CHOLMOD's nesdis method. Default 200. }
{ Subgraphs with fewer than nd_small nodes are not partitioned. }
{ unused, for future expansion }
{ if true, AMD, COLAMD, SYMAMD, CCOLAMD, and }
{ CSYMAMD perform aggresive absorption.  Default: true }
{ Default: false.  If the CHOLMOD analysis/ }
{ ordering methods are used as an ordering method for an LU }
{ factorization, then set this to true.  For use in a Cholesky }
{ factorization by CHOLMOD itself, never set this to true. }
{ if true, then the graph and subgraphs are }
{ compressed before partitioning them in CHOLMOD's nesdis }
{ method.  Default: true. }
{ if 1, then CHOLMOD's nesdis is followed by }
{ CAMD.  If 2: followed by CSYMAMD.  If nd_small is very small, }
{ then use 0, which skips CAMD or CSYMAMD.  Default: 1. }
{ CHOLMOD's nesdis can partition a graph and then }
{ find that the subgraphs are unconnected.  If true, each of these }
{ components is partitioned separately.  If false, the whole }
{ subgraph is partitioned.  Default: false. }
{ ordering method to use: }
{ unused, for future expansion }
{ if true, CHOLMOD performs a weighted postordering }
{ after its fill-reducing ordering, which improves supernodal }
{ amalgamation.  Has no effect on flop count or nnz(L). }
{ Default: true. }
{  If false, then the default ordering strategy }
{ when Common->nmethods is zero is to try the user's permutation }
{ if given, then AMD, and then METIS if the AMD ordering results in }
{ a lot of fill-in.  If true, then nesdis is used instead of METIS. }
{ Default: false. }
{-------------------------------------------------------------------------- }
{ METIS workarounds }
{-------------------------------------------------------------------------- }
{ These workarounds were put into place for METIS 4.0.1.  They are safe }
{ to use with METIS 5.1.0, but they might not longer be necessary. }
{ default: 0.  If METIS terminates your }
{ program when it runs out of memory, try 2, or higher. }
{ default: 0.66 }
{ default: 3000 }
{ If a matrix has n > metis_nswitch and a density (nnz(A)/n^2) > }
{ metis_dswitch, then METIS is not used. }
{-------------------------------------------------------------------------- }
{ workspace }
{-------------------------------------------------------------------------- }
{ This workspace is kept in the CHOLMOD Common object.  cholmod_start }
{ sets these arrays to NULL, and cholmod_finish frees them. }
{ Flag has size nrow, Head has size nrow+1 }
{ Flag is cleared if Flag [0..nrow-1] < mark. }
{ size of Iwork, in Ints (int32 or int64). }
{ This is at most 6*nrow + ncol. }
{ size of Xwork, in bytes. }
{ NOTE: in CHOLMOD v4 and earlier, this variable was called xworksize, }
{ and was in terms of # of doubles, not # of bytes. }
{ size nrow.  If this is "cleared" then }
{ Flag [i] < mark for all i = 0:nrow-1.  Flag is kept cleared between }
{ calls to CHOLMOD. }
{ size nrow+1.  If Head [i] = EMPTY (-1) then that }
{ entry is "cleared".  Head is kept cleared between calls to CHOLMOD. }
{ a double or float array.  It has size nrow for most }
{ routines, or 2*nrow if complex matrices are being handled. }
{ It has size 2*nrow for cholmod_rowadd/rowdel, and maxrank*nrow for }
{ cholmod_updown, where maxrank is 2, 4, or 8.  Xwork is kept all }
{ zero between calls to CHOLMOD. }
{ size iworksize integers (int32's or int64's). }
{ Uninitialized integer workspace, of size at most 6*nrow+ncol. }
{ cholmod_start (for int32's) sets this to CHOLMOD_INT, }
{ and cholmod_l_start sets this to CHOLMOD_LONG.  It defines the }
{ integer sizes for th Flag, Head, and Iwork arrays, and also }
{ defines the integers for all objects created by CHOLMOD. }
{ The itype of the Common object must match the function name }
{ and all objects passed to it. }
{ unused: for future expansion }
{ an internal flag, usually false. }
{ This is set true to disable any reallocation of the workspace }
{ in the Common object. }
{-------------------------------------------------------------------------- }
{ statistics }
{-------------------------------------------------------------------------- }
{ status code (0: ok, negative: error, pos: warning) }
{ Common->status for error handling: 0 is ok, negative is a fatal }
{ error, and positive is a warning }
{ flop count from last analysis }
{ nnz(L) from last analysis }
{ in last analysis: nnz(tril(A)) or nnz(triu(A)) if A }
{ symmetric, or tril(A*A') if A is unsymmetric. }
{ flop count from last update/downdate/rowadd/rowdel, }
{ not included the flops to revise the solution to Lx=b, }
{ if that was performed. }
{ # of malloc'd objects not yet freed }
{ peak memory usage in bytes }
{ current memory usage in bytes }
{ # of column reallocations }
{ # of factor reallocations due to col. reallocs }
{ # of times diagonal modified by dbound }
{ flop count of cholmod_rowfac }
{ flop count to compute A(:,f)*A(:,f)' }
{ true if last analysis used nesdis or METIS. }
{ true if no integer overflow has occured when trying to }
{ call the BLAS.  The typical BLAS library uses 32-bit integers for }
{ its input parameters, even on a 64-bit platform.  CHOLMOD uses int64 }
{ in its cholmod_l_* methods, and these must be typecast to the BLAS }
{ integer.  If integer overflow occurs, this is set false. }
{-------------------------------------------------------------------------- }
{ SuiteSparseQR control parameters and statistics }
{-------------------------------------------------------------------------- }
{ SPQR uses the CHOLMOD Common object for its control and statistics. }
{ These parameters are not used by CHOLMOD itself. }
{ control parameters: }
{ task size is >= max (total flops / grain) }
{ task size is >= small }
{ controls stack realloc method }
{ number of TBB threads, 0 = auto }
{ statistics: }
{ flop count for SPQR }
{ analysis time in seconds for SPQR }
{ factorize time in seconds for SPQR }
{ backsolve time in seconds }
{ upper bound on flop count }
{ tolerance used }
{ Frobenius norm of dropped entries }
{-------------------------------------------------------------------------- }
{ Revised for CHOLMOD v5.0 }
{-------------------------------------------------------------------------- }
{ was size 10 in CHOLMOD v4.2; reduced to 8 in CHOLMOD v5: }
{ other statistics }
{-------------------------------------------------------------------------- }
{ Added for CHOLMOD v5.0 }
{-------------------------------------------------------------------------- }
{ These terms have been added to the CHOLMOD Common struct for v5.0, and }
{ on most systems they will total 16 bytes.  The preceding term, }
{ SPQR_istat, was reduced by 16 bytes, since those last 2 entries were }
{ unused in CHOLMOD v4.2.  As a result, the Common struct in v5.0 has the }
{ same size as v4.0, and all entries would normally be in the same offset, }
{ as well.  This mitigates any changes between v4.0 and v5.0, and may make }
{ it easier to upgrade from v4 to v5. }
{ # of times diagonal modified by sbound. }
{ This ought to be int64_t, but ndbounds_hit was double in }
{ v4 (see above), so nsbounds_hit is made the same type }
{ for consistency. }
{ Same as dbound, }
{ but for single precision factorization. }
{ for future expansion }
{-------------------------------------------------------------------------- }
{ GPU configuration and statistics }
{-------------------------------------------------------------------------- }
{ 1 if GPU is requested for CHOLMOD }
{ 0 if GPU is not requested for CHOLMOD }
{ -1 if the use of the GPU is in CHOLMOD controled by the }
{ CHOLMOD_USE_GPU environment variable. }
{ GPU control for CHOLMOD }
{ GPU control for CHOLMOD }
{ for SPQR: }
{ Amount of memory in bytes on the GPU }
{ Time taken by GPU kernels }
{ Number of flops performed by the GPU }
{ Number of GPU kernel launches }
{ they are (void *) if CUDA is not in use: }
{ a set of streams for general use }
{ pointer to single allocation of device memory }
{ pointer to single alloc of pinned mem }
{ time syrk started }
{ run times of the different parts of CHOLMOD (GPU and CPU): }
{ number of times the BLAS are called on the CPU and the GPU: }
{ chunksize for computing # of OpenMP threads to use. }
{ Given nwork work to do, # of threads is }
{ max (1, min (floor (work / chunk), nthreads_max)) }
{ max # of OpenMP threads to use in CHOLMOD. }
{ Defaults to SUITESPARSE_OPENMP_MAX_THREADS. }
{$ifdef BLAS_DUMP}
{ only used if CHOLMOD is compiled with -DBLAS_DUMP }
{$endif}
type
  Pcholmod_common_struct = ^Tcholmod_common_struct;
  Tcholmod_common_struct = record
      dbound : Tdouble;
      grow0 : Tdouble;
      grow1 : Tdouble;
      grow2 : Tsize_t;
      maxrank : Tsize_t;
      supernodal_switch : Tdouble;
      supernodal : longint;
      final_asis : longint;
      final_super : longint;
      final_ll : longint;
      final_pack : longint;
      final_monotonic : longint;
      final_resymbol : longint;
      zrelax : array[0..2] of Tdouble;
      nrelax : array[0..2] of Tsize_t;
      prefer_zomplex : longint;
      prefer_upper : longint;
      quick_return_if_not_posdef : longint;
      prefer_binary : longint;
      print : longint;
      precise : longint;
      try_catch : longint;
      error_handler : procedure (status:longint; file:Pchar; line:longint; message:Pchar);cdecl;
      nmethods : longint;
      current : longint;
      selected : longint;
      method : array[0..(CHOLMOD_MAXMETHODS+1)-1] of record
          lnz : Tdouble;
          fl : Tdouble;
          prune_dense : Tdouble;
          prune_dense2 : Tdouble;
          nd_oksep : Tdouble;
          other_1 : array[0..3] of Tdouble;
          nd_small : Tsize_t;
          other_2 : array[0..3] of Tdouble;
          aggressive : longint;
          order_for_lu : longint;
          nd_compress : longint;
          nd_camd : longint;
          nd_components : longint;
          ordering : longint;
          other_3 : array[0..3] of Tsize_t;
        end;
      postorder : longint;
      default_nesdis : longint;
      metis_memory : Tdouble;
      metis_dswitch : Tdouble;
      metis_nswitch : Tsize_t;
      nrow : Tsize_t;
      mark : Tint64_t;
      iworksize : Tsize_t;
      xworkbytes : Tsize_t;
      Flag : pointer;
      Head : pointer;
      Xwork : pointer;
      Iwork : pointer;
      itype : longint;
      other_5 : longint;
      no_workspace_reallocate : longint;
      status : longint;
      fl : Tdouble;
      lnz : Tdouble;
      anz : Tdouble;
      modfl : Tdouble;
      malloc_count : Tsize_t;
      memory_usage : Tsize_t;
      memory_inuse : Tsize_t;
      nrealloc_col : Tdouble;
      nrealloc_factor : Tdouble;
      ndbounds_hit : Tdouble;
      rowfacfl : Tdouble;
      aatfl : Tdouble;
      called_nd : longint;
      blas_ok : longint;
      SPQR_grain : Tdouble;
      SPQR_small : Tdouble;
      SPQR_shrink : longint;
      SPQR_nthreads : longint;
      SPQR_flopcount : Tdouble;
      SPQR_analyze_time : Tdouble;
      SPQR_factorize_time : Tdouble;
      SPQR_solve_time : Tdouble;
      SPQR_flopcount_bound : Tdouble;
      SPQR_tol_used : Tdouble;
      SPQR_norm_E_fro : Tdouble;
      SPQR_istat : array[0..7] of Tint64_t;
      nsbounds_hit : Tdouble;
      sbound : single;
      other_6 : single;
      useGPU : longint;
      maxGpuMemBytes : Tsize_t;
      maxGpuMemFraction : Tdouble;
      gpuMemorySize : Tsize_t;
      gpuKernelTime : Tdouble;
      gpuFlops : Tint64_t;
      gpuNumKernelLaunches : longint;
      cublasHandle : TCHOLMOD_CUBLAS_HANDLE;
      gpuStream : array[0..(CHOLMOD_HOST_SUPERNODE_BUFFERS)-1] of TCHOLMOD_CUDASTREAM;
      cublasEventPotrf : array[0..2] of TCHOLMOD_CUDAEVENT;
      updateCKernelsComplete : TCHOLMOD_CUDAEVENT;
      updateCBuffersFree : array[0..(CHOLMOD_HOST_SUPERNODE_BUFFERS)-1] of TCHOLMOD_CUDAEVENT;
      dev_mempool : pointer;
      dev_mempool_size : Tsize_t;
      host_pinned_mempool : pointer;
      host_pinned_mempool_size : Tsize_t;
      devBuffSize : Tsize_t;
      ibuffer : longint;
      syrkStart : Tdouble;
      cholmod_cpu_gemm_time : Tdouble;
      cholmod_cpu_syrk_time : Tdouble;
      cholmod_cpu_trsm_time : Tdouble;
      cholmod_cpu_potrf_time : Tdouble;
      cholmod_gpu_gemm_time : Tdouble;
      cholmod_gpu_syrk_time : Tdouble;
      cholmod_gpu_trsm_time : Tdouble;
      cholmod_gpu_potrf_time : Tdouble;
      cholmod_assemble_time : Tdouble;
      cholmod_assemble_time2 : Tdouble;
      cholmod_cpu_gemm_calls : Tsize_t;
      cholmod_cpu_syrk_calls : Tsize_t;
      cholmod_cpu_trsm_calls : Tsize_t;
      cholmod_cpu_potrf_calls : Tsize_t;
      cholmod_gpu_gemm_calls : Tsize_t;
      cholmod_gpu_syrk_calls : Tsize_t;
      cholmod_gpu_trsm_calls : Tsize_t;
      cholmod_gpu_potrf_calls : Tsize_t;
      chunk : Tdouble;
      nthreads_max : longint;
      blas_dump : PFILE;
    end;
  Tcholmod_common = Tcholmod_common_struct;
  Pcholmod_common = ^Tcholmod_common;
{ size_t BLAS statistcs in Common: }

const
  CHOLMOD_CPU_GEMM_CALLS = cholmod_cpu_gemm_calls;  
  CHOLMOD_CPU_SYRK_CALLS = cholmod_cpu_syrk_calls;  
  CHOLMOD_CPU_TRSM_CALLS = cholmod_cpu_trsm_calls;  
  CHOLMOD_CPU_POTRF_CALLS = cholmod_cpu_potrf_calls;  
  CHOLMOD_GPU_GEMM_CALLS = cholmod_gpu_gemm_calls;  
  CHOLMOD_GPU_SYRK_CALLS = cholmod_gpu_syrk_calls;  
  CHOLMOD_GPU_TRSM_CALLS = cholmod_gpu_trsm_calls;  
  CHOLMOD_GPU_POTRF_CALLS = cholmod_gpu_potrf_calls;  
{ double BLAS statistics in Common: }
  CHOLMOD_CPU_GEMM_TIME = cholmod_cpu_gemm_time;  
  CHOLMOD_CPU_SYRK_TIME = cholmod_cpu_syrk_time;  
  CHOLMOD_CPU_TRSM_TIME = cholmod_cpu_trsm_time;  
  CHOLMOD_CPU_POTRF_TIME = cholmod_cpu_potrf_time;  
  CHOLMOD_GPU_GEMM_TIME = cholmod_gpu_gemm_time;  
  CHOLMOD_GPU_SYRK_TIME = cholmod_gpu_syrk_time;  
  CHOLMOD_GPU_TRSM_TIME = cholmod_gpu_trsm_time;  
  CHOLMOD_GPU_POTRF_TIME = cholmod_gpu_potrf_time;  
  CHOLMOD_ASSEMBLE_TIME = cholmod_assemble_time;  
  CHOLMOD_ASSEMBLE_TIME2 = cholmod_assemble_time2;  
{------------------------------------------------------------------------------ }
{ cholmod_start:  first call to CHOLMOD }
{------------------------------------------------------------------------------ }

function cholmod_start(Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_start(para1:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_finish:  last call to CHOLMOD }
{------------------------------------------------------------------------------ }
function cholmod_finish(Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_finish(para1:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_defaults: set default parameters }
{------------------------------------------------------------------------------ }
function cholmod_defaults(Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_defaults(para1:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_maxrank:  return valid maximum rank for update/downdate }
{------------------------------------------------------------------------------ }
{ return validated Common->maxrank }
{ input: }
{ # of rows of L and A }
function cholmod_maxrank(n:Tsize_t; Common:Pcholmod_common):Tsize_t;cdecl;external;
function cholmod_l_maxrank(para1:Tsize_t; para2:Pcholmod_common):Tsize_t;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_allocate_work: allocate workspace in Common }
{------------------------------------------------------------------------------ }
{ This method always allocates Xwork as double, for backward compatibility }
{ with CHOLMOD v4 and earlier.  See cholmod_alloc_work for CHOLMOD v5. }
{ input: }
{ size of Common->Flag (nrow int32's) }
{ and Common->Head (nrow+1 int32's) }
{ size of Common->Iwork (# of int32's) }
{ size of Common->Xwork (# of double's) }
function cholmod_allocate_work(nrow:Tsize_t; iworksize:Tsize_t; xworksize:Tsize_t; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_allocate_work(para1:Tsize_t; para2:Tsize_t; para3:Tsize_t; para4:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_alloc_work: allocate workspace in Common }
{------------------------------------------------------------------------------ }
{ Added for CHOLMOD v5: allocates Xwork as either double or single. }
{ input: }
{ size of Common->Flag (nrow int32's) }
{ and Common->Head (nrow+1 int32's) }
{ size of Common->Iwork (# of int32's) }
{ size of Common->Xwork (# of entries) }
{ CHOLMOD_DOUBLE or CHOLMOD_SINGLE }
function cholmod_alloc_work(nrow:Tsize_t; iworksize:Tsize_t; xworksize:Tsize_t; dtype:longint; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_alloc_work(para1:Tsize_t; para2:Tsize_t; para3:Tsize_t; para4:longint; para5:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_free_work:  free workspace in Common }
{------------------------------------------------------------------------------ }
function cholmod_free_work(Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_free_work(para1:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_clear_flag:  clear Flag workspace in Common }
{------------------------------------------------------------------------------ }
function cholmod_clear_flag(Common:Pcholmod_common):Tint64_t;cdecl;external;
function cholmod_l_clear_flag(para1:Pcholmod_common):Tint64_t;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_error:  called when CHOLMOD encounters an error }
{------------------------------------------------------------------------------ }
{ input: }
{ Common->status }
(* Const before type ignored *)
{ source file where error occurred }
{ line number where error occurred }
(* Const before type ignored *)
{ error message to print }
function cholmod_error(status:longint; file:Pchar; line:longint; message:Pchar; Common:Pcholmod_common):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cholmod_l_error(para1:longint; para2:Pchar; para3:longint; para4:Pchar; para5:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_dbound and cholmod_sbound:  for internal use in CHOLMOD only }
{------------------------------------------------------------------------------ }
{ These were once documented functions but no are no longer meant to be used }
{ by the user application.  They remain here for backward compatibility. }
function cholmod_dbound(para1:Tdouble; para2:Pcholmod_common):Tdouble;cdecl;external;
function cholmod_l_dbound(para1:Tdouble; para2:Pcholmod_common):Tdouble;cdecl;external;
function cholmod_sbound(para1:single; para2:Pcholmod_common):single;cdecl;external;
function cholmod_l_sbound(para1:single; para2:Pcholmod_common):single;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_hypot:  compute sqrt (x*x + y*y) accurately }
{------------------------------------------------------------------------------ }
function cholmod_hypot(x:Tdouble; y:Tdouble):Tdouble;cdecl;external;
function cholmod_l_hypot(para1:Tdouble; para2:Tdouble):Tdouble;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_divcomplex:  complex division, c = a/b }
{------------------------------------------------------------------------------ }
{ return 1 if divide-by-zero, 0 if OK }
{ input: }
{ a (real, imaginary) }
{ b (real, imaginary) }
{ c (real, imaginary) }
function cholmod_divcomplex(ar:Tdouble; ai:Tdouble; br:Tdouble; bi:Tdouble; cr:Pdouble; 
           ci:Pdouble):longint;cdecl;external;
function cholmod_l_divcomplex(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Pdouble; 
           para6:Pdouble):longint;cdecl;external;
{============================================================================== }
{ cholmod_sparse: a sparse matrix in compressed-column (CSC) form }
{============================================================================== }
{ # of rows of the matrix }
{ # of colums of the matrix }
{ max # of entries that can be held in the matrix }
{ int32_t or int64_t arrays: }
{ A->p [0..ncol], column "pointers" of the CSC matrix }
{ A->i [0..nzmax-1], the row indices }
{ for unpacked matrices only: }
{ A->nz [0..ncol-1], is the # of nonzeros in each col. }
{ This is NULL for a "packed" matrix (conventional CSC). }
{ For a packed matrix, the jth column is held in A->i and A->x in }
{ postions A->p [j] to A->p [j+1]-1, with no gaps between columns. }
{ For an "unpacked" matrix, there can be gaps between columns, so }
{ the jth columns appears in positions A-p [j] to }
{ A->p [j] + A->nz [j] - 1. }
{ double or float arrays: }
{ size nzmax or 2*nzmax, or NULL }
{ size nzmax, or NULL }
{ A->stype defines what parts of the matrix is held: }
{ 0:  the matrix is unsymmetric with both lower and upper parts stored. }
{ >0: the matrix is square and symmetric, with just the upper }
{     triangular part stored. }
{ <0: the matrix is square and symmetric, with just the lower }
{     triangular part stored. }
{ A->itype defines the integers used for A->p, A->i, and A->nz. }
{ if CHOLMOD_INT, these arrays are all of type int32_t. }
{ if CHOLMOD_LONG, these arrays are all of type int64_t. }
{ pattern, real, complex, or zomplex }
{ x and z are double or single }
{ true if columns are sorted, false otherwise }
{ true if packed (A->nz ignored), false if unpacked }
type
  Pcholmod_sparse_struct = ^Tcholmod_sparse_struct;
  Tcholmod_sparse_struct = record
      nrow : Tsize_t;
      ncol : Tsize_t;
      nzmax : Tsize_t;
      p : pointer;
      i : pointer;
      nz : pointer;
      x : pointer;
      z : pointer;
      stype : longint;
      itype : longint;
      xtype : longint;
      dtype : longint;
      sorted : longint;
      packed : longint;
    end;
  Tcholmod_sparse = Tcholmod_sparse_struct;
  Pcholmod_sparse = ^Tcholmod_sparse;
{------------------------------------------------------------------------------ }
{ cholmod_allocate_sparse:  allocate a sparse matrix }
{------------------------------------------------------------------------------ }
{ input: }
{ # of rows }
{ # of columns }
{ max # of entries the matrix can hold }
{ true if columns are sorted }
{ true if A is be packed (A->nz NULL), false if unpacked }
{ the stype of the matrix (unsym, tril, or triu) }
{ xtype + dtype of the matrix: }
{ (CHOLMOD_DOUBLE, _SINGLE) + }
{ (CHOLMOD_PATTERN, _REAL, _COMPLEX, or _ZOMPLEX) }

function cholmod_allocate_sparse(nrow:Tsize_t; ncol:Tsize_t; nzmax:Tsize_t; sorted:longint; packed:longint; 
           stype:longint; xdtype:longint; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_allocate_sparse(para1:Tsize_t; para2:Tsize_t; para3:Tsize_t; para4:longint; para5:longint; 
           para6:longint; para7:longint; para8:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_free_sparse:  free a sparse matrix }
{------------------------------------------------------------------------------ }
{ input/output: }
{ handle of sparse matrix to free }
function cholmod_free_sparse(A:PPcholmod_sparse; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_free_sparse(para1:PPcholmod_sparse; para2:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_reallocate_sparse: change max # of entries in a sparse matrix }
{------------------------------------------------------------------------------ }
{ input: }
{ new max # of nonzeros the sparse matrix can hold }
{ input/output: }
{ sparse matrix to reallocate }
function cholmod_reallocate_sparse(nznew:Tsize_t; A:Pcholmod_sparse; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_reallocate_sparse(para1:Tsize_t; para2:Pcholmod_sparse; para3:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_nnz: # of entries in a sparse matrix }
{------------------------------------------------------------------------------ }
{ return # of entries in the sparse matrix }
{ input: }
{ sparse matrix to query }
function cholmod_nnz(A:Pcholmod_sparse; Common:Pcholmod_common):Tint64_t;cdecl;external;
function cholmod_l_nnz(para1:Pcholmod_sparse; para2:Pcholmod_common):Tint64_t;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_speye:  sparse identity matrix (possibly rectangular) }
{------------------------------------------------------------------------------ }
{ input: }
{ # of rows }
{ # of columns }
{ xtype + dtype of the matrix: }
{ (CHOLMOD_DOUBLE, _SINGLE) + }
{ (CHOLMOD_PATTERN, _REAL, _COMPLEX, or _ZOMPLEX) }
function cholmod_speye(nrow:Tsize_t; ncol:Tsize_t; xdtype:longint; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_speye(para1:Tsize_t; para2:Tsize_t; para3:longint; para4:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_spzeros: sparse matrix with no entries }
{------------------------------------------------------------------------------ }
{ Identical to cholmod_allocate_sparse, with packed = true, sorted = true, }
{ and stype = 0. }
{ return a sparse matrix with no entries }
{ input: }
{ # of rows }
{ # of columns }
{ max # of entries the matrix can hold }
{ xtype + dtype of the matrix: }
{ (CHOLMOD_DOUBLE, _SINGLE) + }
{ (CHOLMOD_PATTERN, _REAL, _COMPLEX, or _ZOMPLEX) }
function cholmod_spzeros(nrow:Tsize_t; ncol:Tsize_t; nzmax:Tsize_t; xdtype:longint; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_spzeros(para1:Tsize_t; para2:Tsize_t; para3:Tsize_t; para4:longint; para5:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_transpose: transpose a sparse matrix }
{------------------------------------------------------------------------------ }
{ return new sparse matrix C }
{ input: }
{ input matrix }
{ 2: numerical (conj) }
{ 1: numerical (non-conj.) }
{ 0: pattern (with diag) }
function cholmod_transpose(A:Pcholmod_sparse; mode:longint; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_transpose(para1:Pcholmod_sparse; para2:longint; para3:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_transpose_unsym:  transpose an unsymmetric sparse matrix }
{------------------------------------------------------------------------------ }
{ Compute C = A', A (:,f)', or A (p,f)', where A is unsymmetric and C is }
{ already allocated.  See cholmod_transpose for a routine with a simpler }
{ interface. }
{ input: }
{ input matrix }
{ 2: numerical (conj) }
{ 1: numerical (non-conj.), }
{ 0: pattern (with diag) }
{ permutation for C=A(p,f)', or NULL }
{ a list of column indices in range 0:A->ncol-1 }
{ # of entries in fset }
{ input/output: }
{ output matrix, must be allocated on input }
function cholmod_transpose_unsym(A:Pcholmod_sparse; mode:longint; Perm:Pint32_t; fset:Pint32_t; fsize:Tsize_t; 
           C:Pcholmod_sparse; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_transpose_unsym(para1:Pcholmod_sparse; para2:longint; para3:Pint64_t; para4:Pint64_t; para5:Tsize_t; 
           para6:Pcholmod_sparse; para7:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_transpose_sym:  symmetric permuted transpose }
{------------------------------------------------------------------------------ }
{ C = A' or C = A(p,p)' where A and C are both symmetric and C is already }
{ allocated.  See cholmod_transpose or cholmod_ptranspose for a routine with }
{ a simpler interface. }
{ input: }
{ input matrix }
{ 2: numerical (conj) }
{ 1: numerical (non-conj.), }
{ 0: pattern (with diag) }
{ permutation for C=A(p,p)', or NULL }
{ input/output: }
{ output matrix, must be allocated on input }
function cholmod_transpose_sym(A:Pcholmod_sparse; mode:longint; Perm:Pint32_t; C:Pcholmod_sparse; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_transpose_sym(para1:Pcholmod_sparse; para2:longint; para3:Pint64_t; para4:Pcholmod_sparse; para5:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_ptranspose: C = A', A(:,f)', A(p,p)', or A(p,f)' }
{------------------------------------------------------------------------------ }
{ return new sparse matrix C }
{ input: }
{ input matrix }
{ 2: numerical (conj) }
{ 1: numerical (non-conj.) }
{ 0: pattern (with diag) }
{ permutation for C=A(p,f)', or NULL }
{ a list of column indices in range 0:A->ncol-1 }
{ # of entries in fset }
function cholmod_ptranspose(A:Pcholmod_sparse; mode:longint; Perm:Pint32_t; fset:Pint32_t; fsize:Tsize_t; 
           Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_ptranspose(para1:Pcholmod_sparse; para2:longint; para3:Pint64_t; para4:Pint64_t; para5:Tsize_t; 
           para6:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_sort: sort the indices of a sparse matrix }
{------------------------------------------------------------------------------ }
{ input/output: }
{ input/output matrix to sort }
function cholmod_sort(A:Pcholmod_sparse; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_sort(para1:Pcholmod_sparse; para2:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_band_nnz: # of entries within a band of a sparse matrix }
{------------------------------------------------------------------------------ }
{ return # of entries in a band (-1 if error) }
{ input: }
{ matrix to examine }
{ count entries in k1:k2 diagonals }
{ if true, exclude any diagonal entries }
function cholmod_band_nnz(A:Pcholmod_sparse; k1:Tint64_t; k2:Tint64_t; ignore_diag:Tbool; Common:Pcholmod_common):Tint64_t;cdecl;external;
function cholmod_l_band_nnz(para1:Pcholmod_sparse; para2:Tint64_t; para3:Tint64_t; para4:Tbool; para5:Pcholmod_common):Tint64_t;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_band:  C = tril (triu (A,k1), k2) }
{------------------------------------------------------------------------------ }
{ return a new matrix C }
{ input: }
{ input matrix }
{ count entries in k1:k2 diagonals }
{ >0: numerical, 0: pattern, <0: pattern (no diag) }
function cholmod_band(A:Pcholmod_sparse; k1:Tint64_t; k2:Tint64_t; mode:longint; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_band(para1:Pcholmod_sparse; para2:Tint64_t; para3:Tint64_t; para4:longint; para5:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_band_inplace:  A = tril (triu (A,k1), k2) }
{------------------------------------------------------------------------------ }
{ input: }
{ count entries in k1:k2 diagonals }
{ >0: numerical, 0: pattern, <0: pattern (no diag) }
{ input/output: }
{ input/output matrix }
function cholmod_band_inplace(k1:Tint64_t; k2:Tint64_t; mode:longint; A:Pcholmod_sparse; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_band_inplace(para1:Tint64_t; para2:Tint64_t; para3:longint; para4:Pcholmod_sparse; para5:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_aat: C = A*A' or A(:,f)*A(:,f)' }
{------------------------------------------------------------------------------ }
{ return sparse matrix C }
{ input: }
{ input matrix }
{ a list of column indices in range 0:A->ncol-1 }
{ # of entries in fset }
{ 2: numerical (conj) }
{ 1: numerical (non-conj.), }
{ 0: pattern (with diag) }
{ -1: pattern (remove diag), }
{ -2: pattern (remove diag; add ~50% extra space in C) }
function cholmod_aat(A:Pcholmod_sparse; fset:Pint32_t; fsize:Tsize_t; mode:longint; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_aat(para1:Pcholmod_sparse; para2:Pint64_t; para3:Tsize_t; para4:longint; para5:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_copy_sparse:  C = A, create an exact copy of a sparse matrix }
{------------------------------------------------------------------------------ }
{ Creates an exact copy of a sparse matrix.  For making a copy with a change }
{ of stype and/or copying the pattern of a numerical matrix, see cholmod_copy. }
{ For changing the xtype and/or dtype, see cholmod_sparse_xtype. }
{ return new sparse matrix }
{ input: }
{ sparse matrix to copy }
function cholmod_copy_sparse(A:Pcholmod_sparse; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_copy_sparse(para1:Pcholmod_sparse; para2:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_copy:  C = A, with possible change of stype }
{------------------------------------------------------------------------------ }
{ return new sparse matrix }
{ input: }
{ input matrix, not modified }
{ stype of C }
{ 2: numerical (conj) }
{ 1: numerical (non-conj.) }
{ 0: pattern (with diag) }
{ -1: pattern (remove diag) }
{ -2: pattern (remove diag; add ~50% extra space in C) }
function cholmod_copy(A:Pcholmod_sparse; stype:longint; mode:longint; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_copy(para1:Pcholmod_sparse; para2:longint; para3:longint; para4:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_add: C = alpha*A + beta*B }
{------------------------------------------------------------------------------ }
{ return C = alpha*A + beta*B }
{ input: }
{ input matrix }
{ input matrix }
{ scale factor for A (two entires used if complex) }
{ scale factor for A (two entires used if complex) }
{ 2: numerical (conj) if A and/or B are symmetric, }
{ 1: numerical (non-conj.) if A and/or B are symmetric. }
{ 0: pattern }
{ ignored; C is now always returned as sorted }
function cholmod_add(A:Pcholmod_sparse; B:Pcholmod_sparse; alpha:array[0..1] of Tdouble; beta:array[0..1] of Tdouble; mode:longint; 
           sorted:longint; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_add(para1:Pcholmod_sparse; para2:Pcholmod_sparse; para3:Pdouble; para4:Pdouble; para5:longint; 
           para6:longint; para7:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_sparse_xtype: change the xtype and/or dtype of a sparse matrix }
{------------------------------------------------------------------------------ }
{ input: }
{ requested xtype and dtype }
{ input/output: }
{ sparse matrix to change }
function cholmod_sparse_xtype(to_xdtype:longint; A:Pcholmod_sparse; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_sparse_xtype(para1:longint; para2:Pcholmod_sparse; para3:Pcholmod_common):longint;cdecl;external;
{============================================================================== }
{ cholmod_factor: symbolic or numeric factorization (simplicial or supernodal) }
{============================================================================== }
{ L is n-by-n }
{ If the factorization failed because of numerical issues }
{ (the matrix being factorized is found to be singular or not positive }
{ definte), then L->minor is the column at which it failed.  L->minor }
{ = n means the factorization was successful. }
{-------------------------------------------------------------------------- }
{ symbolic ordering and analysis }
{-------------------------------------------------------------------------- }
{ int32/int64, size n, fill-reducing ordering }
{ int32/int64, size n, # entries in each column of L }
{ int32/int64, size n, created by cholmod_solve2; }
{ containing the inverse of L->Perm }
{-------------------------------------------------------------------------- }
{ simplicial factorization (not supernodal) }
{-------------------------------------------------------------------------- }
{ The row indices of L(:,j) are held in L->i [L->p [j] ... L->p [j] + }
{ L->nz [j] - 1].  The numeical values of L(:,j) are held in the same }
{ positions in L->x (and L->z if L is zomplex).  L->next and L->prev hold }
{ a link list of columns of L, that tracks the order they appear in the }
{ arrays L->i, L->x, and L->z.  The head and tail of the list is n+1 and }
{ n, respectively. }
{ # of entries that L->i, L->x, and L->z can hold }
{ int32/int64, size n+1, column pointers }
{ int32/int64, size nzmax, row indices }
{ float/double, size nzmax or 2*nzmax, numerical values }
{ float/double, size nzmax or empty, imaginary values }
{ int32/int64, size ncol, # of entries in each column }
{ int32/int64, size n+2 }
{ int32/int64, size n+2 }
{-------------------------------------------------------------------------- }
{ supernodal factorization (not simplicial) }
{-------------------------------------------------------------------------- }
{ L->x is shared with the simplicial structure above.  L->z is not used }
{ for the supernodal case since a supernodal factor cannot be zomplex. }
{ # of supernodes }
{ # of integers in L->s }
{ # of entries in L->x }
{ size of largest update matrix }
{ max # of rows in supernodes, excl. triangular part }
{ the following are int32/int64 and are size nsuper+1: }
{ first column in each supernode }
{ index into L->s for integer part of a supernode }
{ index into L->x for numeric part of a supernode }
{ int32/int64, of size ssize: }
{ integer part of supernodes }
{-------------------------------------------------------------------------- }
{ type of the factorization }
{-------------------------------------------------------------------------- }
{ the fill-reducing method used (CHOLMOD_NATURAL, }
{ CHOLMOD_GIVEN, CHOLMOD_AMD, CHOLMOD_METIS, CHOLMOD_NESDIS, }
{ CHOLMOD_COLAMD, or CHOLMOD_POSTORDERED). }
{ true: an LL' factorization; false: LDL' instead }
{ true: supernodal; false: simplicial }
{ true: columns appear in order 0 to n-1 in L, for a }
{ simplicial factorization only }
{ Two boolean values above (is_ll, is_super) and L->xtype (pattern or }
{ otherwise, define eight types of factorizations, but only 6 are used: }
{ If L->xtype is CHOLMOD_PATTERN, then L is a symbolic factor: }
{ }
{ simplicial LDL': (is_ll false, is_super false).  Nothing is present }
{      except Perm and ColCount. }
{ }
{ simplicial LL': (is_ll true, is_super false).  Identical to the }
{      simplicial LDL', except for the is_ll flag. }
{ }
{ supernodal LL': (is_ll true, is_super true).  A supernodal symbolic }
{      factorization.  The simplicial symbolic information is present }
{      (Perm and ColCount), as is all of the supernodal factorization }
{      except for the numerical values (x and z). }
{ }
{ If L->xtype is CHOLMOD_REAL, CHOLMOD_COMPLEX, or CHOLMOD_ZOMPLEX, }
{ then L is a numeric factor: }
{ }
{ simplicial LDL':  (is_ll false, is_super false).  Stored in compressed }
{      column form, using the simplicial components above (nzmax, p, i, }
{      x, z, nz, next, and prev).  The unit diagonal of L is not stored, }
{      and D is stored in its place.  There are no supernodes. }
{ }
{ simplicial LL': (is_ll true, is_super false).  Uses the same storage }
{      scheme as the simplicial LDL', except that D does not appear. }
{      The first entry of each column of L is the diagonal entry of }
{      that column of L. }
{ }
{ supernodal LL': (is_ll true, is_super true).  A supernodal factor, }
{      using the supernodal components described above (nsuper, ssize, }
{      xsize, maxcsize, maxesize, super, pi, px, s, x, and z). }
{      A supernodal factorization is never zomplex. }
{ integer type for L->Perm, L->ColCount, L->p, L->i, L->nz, }
{ L->next, L->prev, L->super, L->pi, L->px, and L->s. }
{ These are all int32 if L->itype is CHOLMOD_INT, or all int64 }
{ if L->itype is CHOLMOD_LONG. }
{ pattern, real, complex, or zomplex }
{ x and z are double or single }
{ if true, symbolic factorization allows for use of the GPU }
type
  Pcholmod_factor_struct = ^Tcholmod_factor_struct;
  Tcholmod_factor_struct = record
      n : Tsize_t;
      minor : Tsize_t;
      Perm : pointer;
      ColCount : pointer;
      IPerm : pointer;
      nzmax : Tsize_t;
      p : pointer;
      i : pointer;
      x : pointer;
      z : pointer;
      nz : pointer;
      next : pointer;
      prev : pointer;
      nsuper : Tsize_t;
      ssize : Tsize_t;
      xsize : Tsize_t;
      maxcsize : Tsize_t;
      maxesize : Tsize_t;
      super : pointer;
      pi : pointer;
      px : pointer;
      s : pointer;
      ordering : longint;
      is_ll : longint;
      is_super : longint;
      is_monotonic : longint;
      itype : longint;
      xtype : longint;
      dtype : longint;
      useGPU : longint;
    end;
  Tcholmod_factor = Tcholmod_factor_struct;
  Pcholmod_factor = ^Tcholmod_factor;
{------------------------------------------------------------------------------ }
{ cholmod_allocate_factor: allocate a numerical factor }
{------------------------------------------------------------------------------ }
{ L is returned as double precision }
{ return the new factor L }
{ input: }
{ L is factorization of an n-by-n matrix }

function cholmod_allocate_factor(n:Tsize_t; Common:Pcholmod_common):Pcholmod_factor;cdecl;external;
function cholmod_l_allocate_factor(para1:Tsize_t; para2:Pcholmod_common):Pcholmod_factor;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_alloc_factor: allocate a numerical factor (double or single) }
{------------------------------------------------------------------------------ }
{ return the new factor L }
{ input: }
{ L is factorization of an n-by-n matrix }
{ CHOLMOD_SINGLE or CHOLMOD_DOUBLE }
function cholmod_alloc_factor(n:Tsize_t; dtype:longint; Common:Pcholmod_common):Pcholmod_factor;cdecl;external;
function cholmod_l_alloc_factor(para1:Tsize_t; para2:longint; para3:Pcholmod_common):Pcholmod_factor;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_free_factor:  free a factor }
{------------------------------------------------------------------------------ }
{ input/output: }
{ handle of sparse factorization to free }
function cholmod_free_factor(L:PPcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_free_factor(para1:PPcholmod_factor; para2:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_reallocate_factor:  change the # entries in a factor }
{------------------------------------------------------------------------------ }
{ input: }
{ new max # of nonzeros the factor matrix can hold }
{ input/output: }
{ factor to reallocate }
function cholmod_reallocate_factor(nznew:Tsize_t; L:Pcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_reallocate_factor(para1:Tsize_t; para2:Pcholmod_factor; para3:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_change_factor:  change the type of factor (e.g., LDL' to LL') }
{------------------------------------------------------------------------------ }
{ input: }
{ CHOLMOD_PATTERN, _REAL, _COMPLEX, or _ZOMPLEX; }
{ L->dtype remains unchanged. }
{ if true: convert to LL'; else to LDL' }
{ if true: convert to supernodal; else to simplicial }
{ if true: pack simplicial columns; else: do not pack }
{ if true, put simplicial columns in order }
{ input/output: }
{ factor to change. }
function cholmod_change_factor(to_xtype:longint; to_ll:longint; to_super:longint; to_packed:longint; to_monotonic:longint; 
           L:Pcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_change_factor(para1:longint; para2:longint; para3:longint; para4:longint; para5:longint; 
           para6:Pcholmod_factor; para7:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_pack_factor:  pack a factor }
{------------------------------------------------------------------------------ }
{ Removes all slack space from all columns in a factor. }
{ input/output: }
{ factor to pack }
function cholmod_pack_factor(L:Pcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_pack_factor(para1:Pcholmod_factor; para2:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_reallocate_column:  reallocate a single column L(:,j) }
{------------------------------------------------------------------------------ }
{ input: }
{ reallocate L(:,j) }
{ space in L(:,j) for this # of entries }
{ input/output: }
{ L factor modified, L(:,j) resized }
function cholmod_reallocate_column(j:Tsize_t; need:Tsize_t; L:Pcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_reallocate_column(para1:Tsize_t; para2:Tsize_t; para3:Pcholmod_factor; para4:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_factor_to_sparse:  create a sparse matrix copy of a factor }
{------------------------------------------------------------------------------ }
{ return a new sparse matrix }
{ input/output: }
{ input: factor to convert; output: L is converted }
{ to a simplicial symbolic factor }
function cholmod_factor_to_sparse(L:Pcholmod_factor; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_factor_to_sparse(para1:Pcholmod_factor; para2:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_copy_factor:  create a copy of a factor }
{------------------------------------------------------------------------------ }
{ return a copy of the factor }
{ input: }
{ factor to copy (not modified) }
function cholmod_copy_factor(L:Pcholmod_factor; Common:Pcholmod_common):Pcholmod_factor;cdecl;external;
function cholmod_l_copy_factor(para1:Pcholmod_factor; para2:Pcholmod_common):Pcholmod_factor;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_factor_xtype: change the xtype and/or dtype of a factor }
{------------------------------------------------------------------------------ }
{ input: }
{ requested xtype and dtype }
{ input/output: }
{ factor to change }
function cholmod_factor_xtype(to_xdtype:longint; L:Pcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_factor_xtype(para1:longint; para2:Pcholmod_factor; para3:Pcholmod_common):longint;cdecl;external;
{============================================================================== }
{ cholmod_dense: a dense matrix, held by column }
{============================================================================== }
{ the matrix is nrow-by-ncol }
{ maximum number of entries in the matrix }
{ leading dimension (d >= nrow must hold) }
{ size nzmax or 2*nzmax, if present }
{ size nzmax, if present }
{ pattern, real, complex, or zomplex }
{ x and z double or single }
type
  Pcholmod_dense_struct = ^Tcholmod_dense_struct;
  Tcholmod_dense_struct = record
      nrow : Tsize_t;
      ncol : Tsize_t;
      nzmax : Tsize_t;
      d : Tsize_t;
      x : pointer;
      z : pointer;
      xtype : longint;
      dtype : longint;
    end;
  Tcholmod_dense = Tcholmod_dense_struct;
  Pcholmod_dense = ^Tcholmod_dense;
{------------------------------------------------------------------------------ }
{ cholmod_allocate_dense: allocate a dense matrix (contents not initialized) }
{------------------------------------------------------------------------------ }
{ input: }
{ # of rows }
{ # of columns }
{ leading dimension }
{ xtype + dtype of the matrix: }
{ (CHOLMOD_DOUBLE, _SINGLE) + }
{ (CHOLMOD_REAL, _COMPLEX, or _ZOMPLEX) }

function cholmod_allocate_dense(nrow:Tsize_t; ncol:Tsize_t; d:Tsize_t; xdtype:longint; Common:Pcholmod_common):Pcholmod_dense;cdecl;external;
function cholmod_l_allocate_dense(para1:Tsize_t; para2:Tsize_t; para3:Tsize_t; para4:longint; para5:Pcholmod_common):Pcholmod_dense;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_zeros: allocate a dense matrix and set it to zero }
{------------------------------------------------------------------------------ }
{ input: }
{ # of rows }
{ # of columns }
{ xtype + dtype of the matrix: }
{ (CHOLMOD_DOUBLE, _SINGLE) + }
{ (CHOLMOD_REAL, _COMPLEX, or _ZOMPLEX) }
function cholmod_zeros(nrow:Tsize_t; ncol:Tsize_t; xdtype:longint; Common:Pcholmod_common):Pcholmod_dense;cdecl;external;
function cholmod_l_zeros(para1:Tsize_t; para2:Tsize_t; para3:longint; para4:Pcholmod_common):Pcholmod_dense;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_ones: allocate a dense matrix of all 1's }
{------------------------------------------------------------------------------ }
{ input: }
{ # of rows }
{ # of columns }
{ xtype + dtype of the matrix: }
{ (CHOLMOD_DOUBLE, _SINGLE) + }
{ (_REAL, _COMPLEX, or _ZOMPLEX) }
function cholmod_ones(nrow:Tsize_t; ncol:Tsize_t; xdtype:longint; Common:Pcholmod_common):Pcholmod_dense;cdecl;external;
function cholmod_l_ones(para1:Tsize_t; para2:Tsize_t; para3:longint; para4:Pcholmod_common):Pcholmod_dense;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_eye: allocate a dense identity matrix }
{------------------------------------------------------------------------------ }
{ return a dense identity matrix }
{ input: }
{ # of rows }
{ # of columns }
{ xtype + dtype of the matrix: }
{ (CHOLMOD_DOUBLE, _SINGLE) + }
{ (_REAL, _COMPLEX, or _ZOMPLEX) }
function cholmod_eye(nrow:Tsize_t; ncol:Tsize_t; xdtype:longint; Common:Pcholmod_common):Pcholmod_dense;cdecl;external;
function cholmod_l_eye(para1:Tsize_t; para2:Tsize_t; para3:longint; para4:Pcholmod_common):Pcholmod_dense;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_free_dense:  free a dense matrix }
{------------------------------------------------------------------------------ }
{ input/output: }
{ handle of dense matrix to free }
function cholmod_free_dense(X:PPcholmod_dense; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_free_dense(para1:PPcholmod_dense; para2:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_ensure_dense:  ensure a dense matrix has a given size and type }
{------------------------------------------------------------------------------ }
{ input/output: }
{ matrix to resize as needed (*X may be NULL) }
{ input: }
{ # of rows }
{ # of columns }
{ leading dimension }
{ xtype + dtype of the matrix: }
{ (CHOLMOD_DOUBLE, _SINGLE) + }
{ (CHOLMOD_REAL, _COMPLEX, or _ZOMPLEX) }
function cholmod_ensure_dense(X:PPcholmod_dense; nrow:Tsize_t; ncol:Tsize_t; d:Tsize_t; xdtype:longint; 
           Common:Pcholmod_common):Pcholmod_dense;cdecl;external;
function cholmod_l_ensure_dense(para1:PPcholmod_dense; para2:Tsize_t; para3:Tsize_t; para4:Tsize_t; para5:longint; 
           para6:Pcholmod_common):Pcholmod_dense;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_sparse_to_dense:  create a dense matrix copy of a sparse matrix }
{------------------------------------------------------------------------------ }
{ return a dense matrix }
{ input: }
{ input matrix }
function cholmod_sparse_to_dense(A:Pcholmod_sparse; Common:Pcholmod_common):Pcholmod_dense;cdecl;external;
function cholmod_l_sparse_to_dense(para1:Pcholmod_sparse; para2:Pcholmod_common):Pcholmod_dense;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_dense_nnz: count # of nonzeros in a dense matrix }
{------------------------------------------------------------------------------ }
{ return # of entries in the dense matrix }
{ input: }
{ input matrix }
function cholmod_dense_nnz(X:Pcholmod_dense; Common:Pcholmod_common):Tint64_t;cdecl;external;
function cholmod_l_dense_nnz(para1:Pcholmod_dense; para2:Pcholmod_common):Tint64_t;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_dense_to_sparse:  create a sparse matrix copy of a dense matrix }
{------------------------------------------------------------------------------ }
{ return a sparse matrix C }
{ input: }
{ input matrix }
{ 1: copy the values }
{ 0: C is pattern }
function cholmod_dense_to_sparse(X:Pcholmod_dense; mode:longint; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_dense_to_sparse(para1:Pcholmod_dense; para2:longint; para3:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_copy_dense:  create a copy of a dense matrix }
{------------------------------------------------------------------------------ }
{ returns new dense matrix }
{ input: }
{ input dense matrix }
function cholmod_copy_dense(X:Pcholmod_dense; Common:Pcholmod_common):Pcholmod_dense;cdecl;external;
function cholmod_l_copy_dense(para1:Pcholmod_dense; para2:Pcholmod_common):Pcholmod_dense;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_copy_dense2:  copy a dense matrix (pre-allocated) }
{------------------------------------------------------------------------------ }
{ input: }
{ input dense matrix }
{ input/output: }
{ output dense matrix (already allocated on input) }
function cholmod_copy_dense2(X:Pcholmod_dense; Y:Pcholmod_dense; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_copy_dense2(para1:Pcholmod_dense; para2:Pcholmod_dense; para3:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_dense_xtype: change the xtype and/or dtype of a dense matrix }
{------------------------------------------------------------------------------ }
{ input: }
{ requested xtype and dtype }
{ input/output: }
{ dense matrix to change }
function cholmod_dense_xtype(to_xdtype:longint; X:Pcholmod_dense; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_dense_xtype(para1:longint; para2:Pcholmod_dense; para3:Pcholmod_common):longint;cdecl;external;
{============================================================================= }
{ cholmod_triplet: a sparse matrix in triplet form }
{============================================================================= }
{ # of rows of the matrix }
{ # of colums of the matrix }
{ max # of entries that can be held in the matrix }
{ current # of entries can be held in the matrix }
{ int32 or int64 arrays (depending on T->itype) }
{ i [0..nzmax-1], the row indices }
{ j [0..nzmax-1], the column indices }
{ double or float arrays: }
{ size nzmax or 2*nzmax, or NULL }
{ size nzmax, or NULL }
{ T->stype defines what parts of the matrix is held: }
{ 0:  the matrix is unsymmetric with both lower and upper parts stored. }
{ >0: the matrix is square and symmetric, where entries in the lower }
{      triangular part are transposed and placed in the upper }
{      triangular part of A if T is converted into a sparse matrix A. }
{ <0: the matrix is square and symmetric, where entries in the upper }
{      triangular part are transposed and placed in the lower }
{      triangular part of A if T is converted into a sparse matrix A. }
{ }
{ Note that A->stype (for a sparse matrix) and T->stype (for a }
{ triplet matrix) are handled differently.  In a triplet matrix T, }
{ no entry is ever ignored.  For a sparse matrix A, if A->stype < 0 }
{ or A->stype > 0, then entries not in the correct triangular part }
{ are ignored. }
{ T->itype defines the integers used for T->i and T->j. }
{ if CHOLMOD_INT, these arrays are all of type int32_t. }
{ if CHOLMOD_LONG, these arrays are all of type int64_t. }
{ pattern, real, complex, or zomplex }
{ x and z are double or single }
type
  Pcholmod_triplet_struct = ^Tcholmod_triplet_struct;
  Tcholmod_triplet_struct = record
      nrow : Tsize_t;
      ncol : Tsize_t;
      nzmax : Tsize_t;
      nnz : Tsize_t;
      i : pointer;
      j : pointer;
      x : pointer;
      z : pointer;
      stype : longint;
      itype : longint;
      xtype : longint;
      dtype : longint;
    end;
  Tcholmod_triplet = Tcholmod_triplet_struct;
  Pcholmod_triplet = ^Tcholmod_triplet;
{------------------------------------------------------------------------------ }
{ cholmod_allocate_triplet: allocate a triplet matrix }
{------------------------------------------------------------------------------ }
{ return triplet matrix T }
{ input: }
{ # of rows }
{ # of columns }
{ max # of entries the matrix can hold }
{ the stype of the matrix (unsym, tril, or triu) }
{ xtype + dtype of the matrix: }
{ (CHOLMOD_DOUBLE, _SINGLE) + }
{ (CHOLMOD_PATTERN, _REAL, _COMPLEX, or _ZOMPLEX) }

function cholmod_allocate_triplet(nrow:Tsize_t; ncol:Tsize_t; nzmax:Tsize_t; stype:longint; xdtype:longint; 
           Common:Pcholmod_common):Pcholmod_triplet;cdecl;external;
function cholmod_l_allocate_triplet(para1:Tsize_t; para2:Tsize_t; para3:Tsize_t; para4:longint; para5:longint; 
           para6:Pcholmod_common):Pcholmod_triplet;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_free_triplet: free a triplet matrix }
{------------------------------------------------------------------------------ }
{ input/output: }
{ handle of triplet matrix to free }
function cholmod_free_triplet(T:PPcholmod_triplet; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_free_triplet(para1:PPcholmod_triplet; para2:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_reallocate_triplet: change max # of entries in a triplet matrix }
{------------------------------------------------------------------------------ }
{ input: }
{ new max # of nonzeros the triplet matrix can hold }
{ input/output: }
{ triplet matrix to reallocate }
function cholmod_reallocate_triplet(nznew:Tsize_t; T:Pcholmod_triplet; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_reallocate_triplet(para1:Tsize_t; para2:Pcholmod_triplet; para3:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_sparse_to_triplet:  create a triplet matrix copy of a sparse matrix }
{------------------------------------------------------------------------------ }
{ input: }
{ matrix to copy into triplet form T }
function cholmod_sparse_to_triplet(A:Pcholmod_sparse; Common:Pcholmod_common):Pcholmod_triplet;cdecl;external;
function cholmod_l_sparse_to_triplet(para1:Pcholmod_sparse; para2:Pcholmod_common):Pcholmod_triplet;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_triplet_to_sparse: create a sparse matrix from of triplet matrix }
{------------------------------------------------------------------------------ }
{ return sparse matrix A }
{ input: }
{ input triplet matrix }
{ allocate space for max(nzmax,nnz(A)) entries }
function cholmod_triplet_to_sparse(T:Pcholmod_triplet; nzmax:Tsize_t; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_triplet_to_sparse(para1:Pcholmod_triplet; para2:Tsize_t; para3:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_copy_triplet: copy a triplet matrix }
{------------------------------------------------------------------------------ }
{ return new triplet matrix }
{ input: }
{ triplet matrix to copy }
function cholmod_copy_triplet(T:Pcholmod_triplet; Common:Pcholmod_common):Pcholmod_triplet;cdecl;external;
function cholmod_l_copy_triplet(para1:Pcholmod_triplet; para2:Pcholmod_common):Pcholmod_triplet;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_triplet_xtype: change the xtype and/or dtype of a triplet matrix }
{------------------------------------------------------------------------------ }
{ input: }
{ requested xtype and dtype }
{ input/output: }
{ triplet matrix to change }
function cholmod_triplet_xtype(to_xdtype:longint; T:Pcholmod_triplet; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_triplet_xtype(para1:longint; para2:Pcholmod_triplet; para3:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ memory allocation: malloc/calloc/realloc/free }
{------------------------------------------------------------------------------ }
{ These methods act like malloc/calloc/realloc/free, with some differences. }
{ They are simple wrappers around the memory management functions in }
{ SuiteSparse_config.  cholmod_malloc and cholmod_calloc have the same }
{ signature, unlike malloc and calloc.  If cholmod_free is given a NULL }
{ pointer, it safely does nothing.  cholmod_free must be passed the size of }
{ the object being freed, but that is just to keep track of memory usage }
{ statistics. cholmod_realloc does not return NULL if it fails; instead, it }
{ returns the pointer to the unmodified block of memory. }
{ return pointer to newly allocated memory }
{ input: }
{ number of items }
{ size of each item }
function cholmod_malloc(n:Tsize_t; size:Tsize_t; Common:Pcholmod_common):pointer;cdecl;external;
function cholmod_l_malloc(para1:Tsize_t; para2:Tsize_t; para3:Pcholmod_common):pointer;cdecl;external;
{ return pointer to newly allocated memory }
{ input: }
{ number of items }
{ size of each item }
function cholmod_calloc(n:Tsize_t; size:Tsize_t; Common:Pcholmod_common):pointer;cdecl;external;
function cholmod_l_calloc(para1:Tsize_t; para2:Tsize_t; para3:Pcholmod_common):pointer;cdecl;external;
{ returns NULL to simplify its usage }
{ input: }
{ number of items }
{ size of each item }
{ input/output: }
{ memory to free }
function cholmod_free(n:Tsize_t; size:Tsize_t; p:pointer; Common:Pcholmod_common):pointer;cdecl;external;
function cholmod_l_free(para1:Tsize_t; para2:Tsize_t; para3:pointer; para4:Pcholmod_common):pointer;cdecl;external;
{ return newly reallocated block of memory }
{ input: }
{ # of items in newly reallocate memory }
{ size of each item }
{ input/output: }
{ pointer to memory to reallocate (may be NULL) }
{ # of items in p on input; nnew on output if success }
function cholmod_realloc(nnew:Tsize_t; size:Tsize_t; p:pointer; n:Psize_t; Common:Pcholmod_common):pointer;cdecl;external;
function cholmod_l_realloc(para1:Tsize_t; para2:Tsize_t; para3:pointer; para4:Psize_t; para5:Pcholmod_common):pointer;cdecl;external;
{ returns true if successful, false otherwise }
{ input: }
{ # of items in newly reallocate memory }
{ 0: do not allocate I_block or J_block, 1: just I_block, }
{ 2: both I_block and J_block }
{ xtype + dtype of the matrix: }
{ (CHOLMOD_DOUBLE, _SINGLE) + }
{ (CHOLMOD_PATTERN, _REAL, _COMPLEX, or _ZOMPLEX) }
{ input/output: }
{ integer block of memory (int32_t or int64_t) }
{ integer block of memory (int32_t or int64_t) }
{ real or complex, double or single, block }
{ zomplex only: double or single block }
{ current size of I_block, J_block, X_block, and/or Z_block }
{ on input,  changed to nnew on output, if successful }
function cholmod_realloc_multiple(nnew:Tsize_t; nint:longint; xdtype:longint; I_block:Ppointer; J_block:Ppointer; 
           X_block:Ppointer; Z_block:Ppointer; n:Psize_t; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_realloc_multiple(para1:Tsize_t; para2:longint; para3:longint; para4:Ppointer; para5:Ppointer; 
           para6:Ppointer; para7:Ppointer; para8:Psize_t; para9:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ numerical comparisons }
{------------------------------------------------------------------------------ }
{ These macros were different on Windows for older versions of CHOLMOD. }
{ They are no longer needed but are kept for backward compatibility. }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CHOLMOD_IS_NAN(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CHOLMOD_IS_ZERO(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CHOLMOD_IS_NONZERO(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CHOLMOD_IS_LT_ZERO(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CHOLMOD_IS_GT_ZERO(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CHOLMOD_IS_LE_ZERO(x : longint) : longint;

{$endif}
{============================================================================== }
{ CHOLMOD:Check Module }
{============================================================================== }
{$ifndef NCHECK}
{ Routines that check and print the 5 basic data types in CHOLMOD, and 3 kinds }
{ of integer vectors (subset, perm, and parent), and read in matrices from a }
{ file: }
{ }
{ cholmod_check_common     check/print the Common object }
{ cholmod_print_common }
{ }
{ cholmod_check_sparse     check/print a sparse matrix in column-oriented form }
{ cholmod_print_sparse }
{ }
{ cholmod_check_dense      check/print a dense matrix }
{ cholmod_print_dense }
{ }
{ cholmod_check_factor     check/print a Cholesky factorization }
{ cholmod_print_factor }
{ }
{ cholmod_check_triplet    check/print a sparse matrix in triplet form }
{ cholmod_print_triplet }
{ }
{ cholmod_check_subset     check/print a subset (integer vector in given range) }
{ cholmod_print_subset }
{ }
{ cholmod_check_perm       check/print a permutation (an integer vector) }
{ cholmod_print_perm }
{ }
{ cholmod_check_parent     check/print an elimination tree (an integer vector) }
{ cholmod_print_parent }
{ }
{ cholmod_read_triplet     read a matrix in triplet form (any Matrix Market }
{                          "coordinate" format, or a generic triplet format). }
{ }
{ cholmod_read_sparse      read a matrix in sparse form (same file format as }
{                          cholmod_read_triplet). }
{ }
{ cholmod_read_dense       read a dense matrix (any Matrix Market "array" }
{                          format, or a generic dense format). }
{ }
{ cholmod_write_sparse     write a sparse matrix to a Matrix Market file. }
{ }
{ cholmod_write_dense      write a dense matrix to a Matrix Market file. }
{ }
{ cholmod_print_common and cholmod_check_common are the only two routines that }
{ you may call after calling cholmod_finish. }
{ }
{ Requires the Utility module.  Not required by any CHOLMOD module, except when }
{ debugging is enabled (in which case all modules require the Check module). }
{ }
{ See cholmod_read.c for a description of the file formats supported by the }
{ cholmod_read_* routines. }
{------------------------------------------------------------------------------ }
{ cholmod_check_common:  check the Common object }
{------------------------------------------------------------------------------ }

function cholmod_check_common(Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_check_common(para1:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_print_common:  print the Common object }
{------------------------------------------------------------------------------ }
{ input: }
(* Const before type ignored *)
{ printed name of Common object }
function cholmod_print_common(name:Pchar; Common:Pcholmod_common):longint;cdecl;external;
(* Const before type ignored *)
function cholmod_l_print_common(para1:Pchar; para2:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_gpu_stats:  print the GPU / CPU statistics }
{------------------------------------------------------------------------------ }
function cholmod_gpu_stats(para1:Pcholmod_common):longint;cdecl;external;
function cholmod_l_gpu_stats(para1:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_check_sparse:  check a sparse matrix }
{------------------------------------------------------------------------------ }
{ input: }
{ sparse matrix to check }
function cholmod_check_sparse(A:Pcholmod_sparse; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_check_sparse(para1:Pcholmod_sparse; para2:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_print_sparse }
{------------------------------------------------------------------------------ }
{ input: }
{ sparse matrix to print }
(* Const before type ignored *)
{ printed name of sparse matrix }
function cholmod_print_sparse(A:Pcholmod_sparse; name:Pchar; Common:Pcholmod_common):longint;cdecl;external;
(* Const before type ignored *)
function cholmod_l_print_sparse(para1:Pcholmod_sparse; para2:Pchar; para3:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_check_dense:  check a dense matrix }
{------------------------------------------------------------------------------ }
{ input: }
{ dense matrix to check }
function cholmod_check_dense(X:Pcholmod_dense; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_check_dense(para1:Pcholmod_dense; para2:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_print_dense:  print a dense matrix }
{------------------------------------------------------------------------------ }
{ input: }
{ dense matrix to print }
(* Const before type ignored *)
{ printed name of dense matrix }
function cholmod_print_dense(X:Pcholmod_dense; name:Pchar; Common:Pcholmod_common):longint;cdecl;external;
(* Const before type ignored *)
function cholmod_l_print_dense(para1:Pcholmod_dense; para2:Pchar; para3:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_check_factor:  check a factor }
{------------------------------------------------------------------------------ }
{ input: }
{ factor to check }
function cholmod_check_factor(L:Pcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_check_factor(para1:Pcholmod_factor; para2:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_print_factor:  print a factor }
{------------------------------------------------------------------------------ }
{ input: }
{ factor to print }
(* Const before type ignored *)
{ printed name of factor }
function cholmod_print_factor(L:Pcholmod_factor; name:Pchar; Common:Pcholmod_common):longint;cdecl;external;
(* Const before type ignored *)
function cholmod_l_print_factor(para1:Pcholmod_factor; para2:Pchar; para3:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_check_triplet:  check a sparse matrix in triplet form }
{------------------------------------------------------------------------------ }
{ input: }
{ triplet matrix to check }
function cholmod_check_triplet(T:Pcholmod_triplet; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_check_triplet(para1:Pcholmod_triplet; para2:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_print_triplet:  print a triplet matrix }
{------------------------------------------------------------------------------ }
{ input: }
{ triplet matrix to print }
(* Const before type ignored *)
{ printed name of triplet matrix }
function cholmod_print_triplet(T:Pcholmod_triplet; name:Pchar; Common:Pcholmod_common):longint;cdecl;external;
(* Const before type ignored *)
function cholmod_l_print_triplet(para1:Pcholmod_triplet; para2:Pchar; para3:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_check_subset:  check a subset }
{------------------------------------------------------------------------------ }
{ input: }
{ Set [0:len-1] is a subset of 0:n-1.  Duplicates OK }
{ size of Set (an integer array) }
{ 0:n-1 is valid range }
function cholmod_check_subset(Set:Pint32_t; len:Tint64_t; n:Tsize_t; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_check_subset(para1:Pint64_t; para2:Tint64_t; para3:Tsize_t; para4:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_print_subset:  print a subset }
{------------------------------------------------------------------------------ }
{ input: }
{ Set [0:len-1] is a subset of 0:n-1.  Duplicates OK }
{ size of Set (an integer array) }
{ 0:n-1 is valid range }
(* Const before type ignored *)
{ printed name of Set }
function cholmod_print_subset(Set:Pint32_t; len:Tint64_t; n:Tsize_t; name:Pchar; Common:Pcholmod_common):longint;cdecl;external;
(* Const before type ignored *)
function cholmod_l_print_subset(para1:Pint64_t; para2:Tint64_t; para3:Tsize_t; para4:Pchar; para5:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_check_perm:  check a permutation }
{------------------------------------------------------------------------------ }
{ input: }
{ Perm [0:len-1] is a permutation of subset of 0:n-1 }
{ size of Perm (an integer array) }
{ 0:n-1 is valid range }
function cholmod_check_perm(Perm:Pint32_t; len:Tsize_t; n:Tsize_t; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_check_perm(para1:Pint64_t; para2:Tsize_t; para3:Tsize_t; para4:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_print_perm:  print a permutation vector }
{------------------------------------------------------------------------------ }
{ input: }
{ Perm [0:len-1] is a permutation of subset of 0:n-1 }
{ size of Perm (an integer array) }
{ 0:n-1 is valid range }
(* Const before type ignored *)
{ printed name of Perm }
function cholmod_print_perm(Perm:Pint32_t; len:Tsize_t; n:Tsize_t; name:Pchar; Common:Pcholmod_common):longint;cdecl;external;
(* Const before type ignored *)
function cholmod_l_print_perm(para1:Pint64_t; para2:Tsize_t; para3:Tsize_t; para4:Pchar; para5:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_check_parent:  check an elimination tree }
{------------------------------------------------------------------------------ }
{ input: }
{ Parent [0:n-1] is an elimination tree }
{ size of Parent }
function cholmod_check_parent(Parent:Pint32_t; n:Tsize_t; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_check_parent(para1:Pint64_t; para2:Tsize_t; para3:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_print_parent }
{------------------------------------------------------------------------------ }
{ input: }
{ Parent [0:n-1] is an elimination tree }
{ size of Parent }
(* Const before type ignored *)
{ printed name of Parent }
function cholmod_print_parent(Parent:Pint32_t; n:Tsize_t; name:Pchar; Common:Pcholmod_common):longint;cdecl;external;
(* Const before type ignored *)
function cholmod_l_print_parent(para1:Pint64_t; para2:Tsize_t; para3:Pchar; para4:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_read_sparse: read a sparse matrix from a file (double only) }
{------------------------------------------------------------------------------ }
{ return sparse matrix (double) }
{ input: }
{ file to read from, must already be open }
function cholmod_read_sparse(f:PFILE; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_read_sparse(para1:PFILE; para2:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_read_sparse2: read a sparse matrix from a file (float or double) }
{------------------------------------------------------------------------------ }
{ return sparse matrix (double/single) }
{ input: }
{ file to read from, must already be open }
{ CHOLMOD_DOUBLE or CHOLMOD_SINGLE }
function cholmod_read_sparse2(f:PFILE; dtype:longint; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_read_sparse2(para1:PFILE; para2:longint; para3:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_read_triplet: read a triplet matrix from a file (double only) }
{------------------------------------------------------------------------------ }
{ return triplet matrix (double) }
{ input: }
{ file to read from, must already be open }
function cholmod_read_triplet(f:PFILE; Common:Pcholmod_common):Pcholmod_triplet;cdecl;external;
function cholmod_l_read_triplet(para1:PFILE; para2:Pcholmod_common):Pcholmod_triplet;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_read_triplet: read a triplet matrix from a file (float or double) }
{------------------------------------------------------------------------------ }
{ return triplet matrix (double/single) }
{ input: }
{ file to read from, must already be open }
{ CHOLMOD_DOUBLE or CHOLMOD_SINGLE }
function cholmod_read_triplet2(f:PFILE; dtype:longint; Common:Pcholmod_common):Pcholmod_triplet;cdecl;external;
function cholmod_l_read_triplet2(para1:PFILE; para2:longint; para3:Pcholmod_common):Pcholmod_triplet;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_read_dense: read a dense matrix from a file (double only) }
{------------------------------------------------------------------------------ }
{ return dense matrix (double) }
{ input: }
{ file to read from, must already be open }
function cholmod_read_dense(f:PFILE; Common:Pcholmod_common):Pcholmod_dense;cdecl;external;
function cholmod_l_read_dense(para1:PFILE; para2:Pcholmod_common):Pcholmod_dense;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_read_dense2: read a dense matrix from a file (float or double) }
{------------------------------------------------------------------------------ }
{ return dense matrix (double/single) }
{ input: }
{ file to read from, must already be open }
{ CHOLMOD_DOUBLE or CHOLMOD_SINGLE }
function cholmod_read_dense2(f:PFILE; dtype:longint; Common:Pcholmod_common):Pcholmod_dense;cdecl;external;
function cholmod_l_read_dense2(para1:PFILE; para2:longint; para3:Pcholmod_common):Pcholmod_dense;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_read_matrix: read a sparse or dense matrix from a file (double only) }
{------------------------------------------------------------------------------ }
{ return sparse/triplet/double matrix (double) }
{ input: }
{ file to read from, must already be open }
{ If 0, a sparse matrix is always return as a }
{ cholmod_triplet form.  It can have any stype }
{ (symmetric-lower, unsymmetric, or symmetric-upper). }
{ If 1, a sparse matrix is returned as an unsymmetric }
{ cholmod_sparse form (A->stype == 0), with both upper and }
{ lower triangular parts present.  This is what the MATLAB }
{ mread mexFunction does, since MATLAB does not have an }
{ stype. }
{ If 2, a sparse matrix is returned with an stype of 0 or }
{ 1 (unsymmetric, or symmetric with upper part stored). }
{ This argument has no effect for dense matrices. }
{ output: }
{ CHOLMOD_TRIPLET, CHOLMOD_SPARSE or CHOLMOD_DENSE }
function cholmod_read_matrix(f:PFILE; prefer:longint; mtype:Plongint; Common:Pcholmod_common):pointer;cdecl;external;
function cholmod_l_read_matrix(para1:PFILE; para2:longint; para3:Plongint; para4:Pcholmod_common):pointer;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_read_matrix2: read a sparse or dense matrix (float or double) }
{------------------------------------------------------------------------------ }
{ sparse/triplet/double matrix (double/single) }
{ input: }
{ file to read from, must already be open }
{ see cholmod_read_matrix }
{ CHOLMOD_DOUBLE or CHOLMOD_SINGLE }
{ output: }
{ CHOLMOD_TRIPLET, CHOLMOD_SPARSE or CHOLMOD_DENSE }
function cholmod_read_matrix2(f:PFILE; prefer:longint; dtype:longint; mtype:Plongint; Common:Pcholmod_common):pointer;cdecl;external;
function cholmod_l_read_matrix2(para1:PFILE; para2:longint; para3:longint; para4:Plongint; para5:Pcholmod_common):pointer;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_write_sparse: write a sparse matrix to a file }
{------------------------------------------------------------------------------ }
{ return values of cholmod_symmetry and cholmod_write: }
const
  CHOLMOD_MM_RECTANGULAR = 1;  
  CHOLMOD_MM_UNSYMMETRIC = 2;  
  CHOLMOD_MM_SYMMETRIC = 3;  
  CHOLMOD_MM_HERMITIAN = 4;  
  CHOLMOD_MM_SKEW_SYMMETRIC = 5;  
  CHOLMOD_MM_SYMMETRIC_POSDIAG = 6;  
  CHOLMOD_MM_HERMITIAN_POSDIAG = 7;  
{ see above, or -1 on error }
{ input: }
{ file to write to, must already be open }
{ matrix to print }
{ optional matrix with pattern of explicit zeros }
(* Const before type ignored *)
{ optional filename of comments to include }

function cholmod_write_sparse(f:PFILE; A:Pcholmod_sparse; Z:Pcholmod_sparse; comments:Pchar; Common:Pcholmod_common):longint;cdecl;external;
(* Const before type ignored *)
function cholmod_l_write_sparse(para1:PFILE; para2:Pcholmod_sparse; para3:Pcholmod_sparse; c:Pchar; para5:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_write_dense: write a dense matrix to a file }
{------------------------------------------------------------------------------ }
{ CHOLMOD_MM_UNSYMMETRIC or _RECTANGULAR, or }
{ -1 on error }
{ input: }
{ file to write to, must already be open }
{ matrix to print }
(* Const before type ignored *)
{ optional filename of comments to include }
function cholmod_write_dense(f:PFILE; X:Pcholmod_dense; comments:Pchar; Common:Pcholmod_common):longint;cdecl;external;
(* Const before type ignored *)
function cholmod_l_write_dense(para1:PFILE; para2:Pcholmod_dense; para3:Pchar; para4:Pcholmod_common):longint;cdecl;external;
{$endif}
{============================================================================== }
{ CHOLMOD:Cholesky Module }
{============================================================================== }
{$ifndef NCHOLESKY}
{ Sparse Cholesky routines: analysis, factorization, and solve. }
{ }
{ The primary routines are all that a user requires to order, analyze, and }
{ factorize a sparse symmetric positive definite matrix A (or A*A'), and }
{ to solve Ax=b (or A*A'x=b).  The primary routines rely on the secondary }
{ routines, the CHOLMOD Utility module, and the AMD and COLAMD packages.  They }
{ make optional use of the CHOLMOD Supernodal and Partition modules, the }
{ METIS package, and the CCOLAMD package. }
{ }
{ Primary routines: }
{ ----------------- }
{ }
{ cholmod_analyze              order and analyze (simplicial or supernodal) }
{ cholmod_factorize            simplicial or supernodal Cholesky factorization }
{ cholmod_solve                solve a linear system (simplicial or supernodal) }
{ cholmod_solve2               like cholmod_solve, but reuse workspace }
{ cholmod_spsolve              solve a linear system (sparse x and b) }
{ }
{ Secondary routines: }
{ ------------------ }
{ }
{ cholmod_analyze_p            analyze, with user-provided permutation or f set }
{ cholmod_factorize_p          factorize, with user-provided permutation or f }
{ cholmod_analyze_ordering     analyze a fill-reducing ordering }
{ cholmod_etree                find the elimination tree }
{ cholmod_rowcolcounts         compute the row/column counts of L }
{ cholmod_amd                  order using AMD }
{ cholmod_colamd               order using COLAMD }
{ cholmod_rowfac               incremental simplicial factorization }
{ cholmod_rowfac_mask          rowfac, specific to LPDASA }
{ cholmod_rowfac_mask2         rowfac, specific to LPDASA }
{ cholmod_row_subtree          find the nonzero pattern of a row of L }
{ cholmod_resymbol             recompute the symbolic pattern of L }
{ cholmod_resymbol_noperm      recompute the symbolic pattern of L, no L->Perm }
{ cholmod_postorder            postorder a tree }
{ }
{ Requires the Utility module, and two packages: AMD and COLAMD. }
{ Optionally uses the Supernodal and Partition modules. }
{ Required by the Partition module. }
{------------------------------------------------------------------------------ }
{ cholmod_analyze:  order and analyze (simplicial or supernodal) }
{------------------------------------------------------------------------------ }
{ Orders and analyzes A, AA', PAP', or PAA'P' and returns a symbolic factor }
{ that can later be passed to cholmod_factorize. }
{ returns symbolic factor L }
{ input: }
{ matrix to order and analyze }

function cholmod_analyze(A:Pcholmod_sparse; Common:Pcholmod_common):Pcholmod_factor;cdecl;external;
function cholmod_l_analyze(para1:Pcholmod_sparse; para2:Pcholmod_common):Pcholmod_factor;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_analyze_p:  analyze, with user-provided permutation or f set }
{------------------------------------------------------------------------------ }
{ Orders and analyzes A, AA', PAP', PAA'P', FF', or PFF'P and returns a }
{ symbolic factor that can later be passed to cholmod_factorize, where }
{ F = A(:,fset) if fset is not NULL and A->stype is zero. }
{ UserPerm is tried if non-NULL. }
{ returns symbolic factor L }
{ input: }
{ matrix to order and analyze }
{ user-provided permutation, size A->nrow }
{ subset of 0:(A->ncol)-1 }
{ size of fset }
function cholmod_analyze_p(A:Pcholmod_sparse; UserPerm:Pint32_t; fset:Pint32_t; fsize:Tsize_t; Common:Pcholmod_common):Pcholmod_factor;cdecl;external;
function cholmod_l_analyze_p(para1:Pcholmod_sparse; para2:Pint64_t; para3:Pint64_t; para4:Tsize_t; para5:Pcholmod_common):Pcholmod_factor;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_analyze_p2:  analyze for sparse Cholesky or sparse QR }
{------------------------------------------------------------------------------ }
{ This is normally not need by the user application. }
{ input: }
{ FOR_SPQR     (0): for SPQR but not GPU-accelerated }
{ FOR_CHOLESKY (1): for Cholesky (GPU or not) }
{ FOR_SPQRGPU  (2): for SPQR with GPU acceleration }
{ matrix to order and analyze }
{ user-provided permutation, size A->nrow }
{ subset of 0:(A->ncol)-1 }
{ size of fset }
function cholmod_analyze_p2(for_whom:longint; A:Pcholmod_sparse; UserPerm:Pint32_t; fset:Pint32_t; fsize:Tsize_t; 
           Common:Pcholmod_common):Pcholmod_factor;cdecl;external;
function cholmod_l_analyze_p2(para1:longint; para2:Pcholmod_sparse; para3:Pint64_t; para4:Pint64_t; para5:Tsize_t; 
           para6:Pcholmod_common):Pcholmod_factor;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_factorize:  simplicial or supernodal Cholesky factorization }
{------------------------------------------------------------------------------ }
{ Factorizes PAP' (or PAA'P' if A->stype is 0), using a factor obtained }
{ from cholmod_analyze.  The analysis can be re-used simply by calling this }
{ routine a second time with another matrix.  A must have the same nonzero }
{ pattern as that passed to cholmod_analyze. }
{ simplicial or superodal Cholesky factorization }
{ input: }
{ matrix to factorize }
{ input/output: }
{ resulting factorization }
function cholmod_factorize(A:Pcholmod_sparse; L:Pcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_factorize(para1:Pcholmod_sparse; para2:Pcholmod_factor; para3:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_factorize_p:  factorize, with user-provided permutation or fset }
{------------------------------------------------------------------------------ }
{ Same as cholmod_factorize, but with more options. }
{ input: }
{ matrix to factorize }
{ factorize beta*I+A or beta*I+A'*A }
{ subset of 0:(A->ncol)-1 }
{ size of fset }
{ input/output: }
{ resulting factorization }
function cholmod_factorize_p(A:Pcholmod_sparse; beta:array[0..1] of Tdouble; fset:Pint32_t; fsize:Tsize_t; L:Pcholmod_factor; 
           Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_factorize_p(para1:Pcholmod_sparse; para2:Pdouble; para3:Pint64_t; para4:Tsize_t; para5:Pcholmod_factor; 
           para6:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_solve:  solve a linear system (simplicial or supernodal) }
{------------------------------------------------------------------------------ }
{ Solves one of many linear systems with a dense right-hand-side, using the }
{ factorization from cholmod_factorize (or as modified by any other CHOLMOD }
{ routine).  D is identity for LL' factorizations. }
{ solve Ax=b     }
const
  CHOLMOD_A = 0;  
{ solve LDL'x=b  }
  CHOLMOD_LDLt = 1;  
{ solve LDx=b    }
  CHOLMOD_LD = 2;  
{ solve DL'x=b   }
  CHOLMOD_DLt = 3;  
{ solve Lx=b     }
  CHOLMOD_L = 4;  
{ solve L'x=b    }
  CHOLMOD_Lt = 5;  
{ solve Dx=b     }
  CHOLMOD_D = 6;  
{ permute x=Px   }
  CHOLMOD_P = 7;  
{ permute x=P'x  }
  CHOLMOD_Pt = 8;  
{ returns the solution X }
{ input: }
{ system to solve }
{ factorization to use }
{ right-hand-side }

function cholmod_solve(sys:longint; L:Pcholmod_factor; B:Pcholmod_dense; Common:Pcholmod_common):Pcholmod_dense;cdecl;external;
function cholmod_l_solve(para1:longint; para2:Pcholmod_factor; para3:Pcholmod_dense; para4:Pcholmod_common):Pcholmod_dense;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_solve2:  like cholmod_solve, but with reusable workspace }
{------------------------------------------------------------------------------ }
{ returns TRUE on success, FALSE on failure }
{ input: }
{ system to solve }
{ factorization to use }
{ right-hand-side }
{ output: }
{ solution, allocated if need be }
{ workspace: }
{ workspace, or NULL }
{ workspace, or NULL }
function cholmod_solve2(sys:longint; L:Pcholmod_factor; B:Pcholmod_dense; Bset:Pcholmod_sparse; X_Handle:PPcholmod_dense; 
           Xset_Handle:PPcholmod_sparse; Y_Handle:PPcholmod_dense; E_Handle:PPcholmod_dense; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_solve2(para1:longint; para2:Pcholmod_factor; para3:Pcholmod_dense; para4:Pcholmod_sparse; para5:PPcholmod_dense; 
           para6:PPcholmod_sparse; para7:PPcholmod_dense; para8:PPcholmod_dense; para9:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_spsolve:  solve a linear system with a sparse right-hand-side }
{------------------------------------------------------------------------------ }
{ returns the sparse solution X }
{ input: }
{ system to solve }
{ factorization to use }
{ right-hand-side }
function cholmod_spsolve(sys:longint; L:Pcholmod_factor; B:Pcholmod_sparse; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_spsolve(para1:longint; para2:Pcholmod_factor; para3:Pcholmod_sparse; para4:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_etree: find the elimination tree of A or A'*A }
{------------------------------------------------------------------------------ }
{ input: }
{ output: }
{ size ncol.  Parent [j] = p if p is the parent of j }
function cholmod_etree(A:Pcholmod_sparse; Parent:Pint32_t; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_etree(para1:Pcholmod_sparse; para2:Pint64_t; para3:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_rowcolcounts: compute the row/column counts of L }
{------------------------------------------------------------------------------ }
{ input: }
{ matrix to analyze }
{ subset of 0:(A->ncol)-1 }
{ size of fset }
{ size nrow.  Parent [i] = p if p is the parent of i }
{ size nrow.  Post [k] = i if i is the kth node in }
{ the postordered etree. }
{ output: }
{ size nrow. RowCount [i] = # entries in the ith }
{ row of L, including the diagonal. }
{ size nrow. ColCount [i] = # entries in the ith }
{ column of L, including the diagonal. }
{ size nrow.  First [i] = k is the least }
{ postordering of any descendant of i. }
{ size nrow.  Level [i] is the length of the path }
{ from i to the root, with Level [root] = 0. }
function cholmod_rowcolcounts(A:Pcholmod_sparse; fset:Pint32_t; fsize:Tsize_t; Parent:Pint32_t; Post:Pint32_t; 
           RowCount:Pint32_t; ColCount:Pint32_t; First:Pint32_t; Level:Pint32_t; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_rowcolcounts(para1:Pcholmod_sparse; para2:Pint64_t; para3:Tsize_t; para4:Pint64_t; para5:Pint64_t; 
           para6:Pint64_t; para7:Pint64_t; para8:Pint64_t; para9:Pint64_t; para10:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_analyze_ordering:  analyze a fill-reducing ordering }
{------------------------------------------------------------------------------ }
{ input: }
{ matrix to analyze }
{ ordering method used }
{ size n, fill-reducing permutation to analyze }
{ subset of 0:(A->ncol)-1 }
{ size of fset }
{ output: }
{ size n, elimination tree }
{ size n, postordering of elimination tree }
{ size n, nnz in each column of L }
{ workspace: }
{ size n workspace for cholmod_postorder }
{ size n workspace for cholmod_postorder }
function cholmod_analyze_ordering(A:Pcholmod_sparse; ordering:longint; Perm:Pint32_t; fset:Pint32_t; fsize:Tsize_t; 
           Parent:Pint32_t; Post:Pint32_t; ColCount:Pint32_t; First:Pint32_t; Level:Pint32_t; 
           Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_analyze_ordering(para1:Pcholmod_sparse; para2:longint; para3:Pint64_t; para4:Pint64_t; para5:Tsize_t; 
           para6:Pint64_t; para7:Pint64_t; para8:Pint64_t; para9:Pint64_t; para10:Pint64_t; 
           para11:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_amd:  order using AMD }
{------------------------------------------------------------------------------ }
{ Finds a permutation P to reduce fill-in in the factorization of P*A*P' }
{ or P*A*A'P' }
{ input: }
{ matrix to order }
{ subset of 0:(A->ncol)-1 }
{ size of fset }
{ output: }
{ size A->nrow, output permutation }
function cholmod_amd(A:Pcholmod_sparse; fset:Pint32_t; fsize:Tsize_t; Perm:Pint32_t; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_amd(para1:Pcholmod_sparse; para2:Pint64_t; para3:Tsize_t; para4:Pint64_t; para5:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_colamd:  order using COLAMD }
{------------------------------------------------------------------------------ }
{ Finds a permutation P to reduce fill-in in the factorization of P*A*A'*P'. }
{ Orders F*F' where F = A (:,fset) if fset is not NULL }
{ input: }
{ matrix to order }
{ subset of 0:(A->ncol)-1 }
{ size of fset }
{ if TRUE, follow with a coletree postorder }
{ output: }
{ size A->nrow, output permutation }
function cholmod_colamd(A:Pcholmod_sparse; fset:Pint32_t; fsize:Tsize_t; postorder:longint; Perm:Pint32_t; 
           Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_colamd(para1:Pcholmod_sparse; para2:Pint64_t; para3:Tsize_t; para4:longint; para5:Pint64_t; 
           para6:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_rowfac:  incremental simplicial factorization }
{------------------------------------------------------------------------------ }
{ Partial or complete simplicial factorization.  Rows and columns kstart:kend-1 }
{ of L and D must be initially equal to rows/columns kstart:kend-1 of the }
{ identity matrix.   Row k can only be factorized if all descendants of node }
{ k in the elimination tree have been factorized. }
{ input: }
{ matrix to factorize }
{ used for A*A' case only. F=A' or A(:,f)' }
{ factorize beta*I+A or beta*I+AA' }
{ first row to factorize }
{ last row to factorize is kend-1 }
{ input/output: }
function cholmod_rowfac(A:Pcholmod_sparse; F:Pcholmod_sparse; beta:array[0..1] of Tdouble; kstart:Tsize_t; kend:Tsize_t; 
           L:Pcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_rowfac(para1:Pcholmod_sparse; para2:Pcholmod_sparse; para3:Pdouble; para4:Tsize_t; para5:Tsize_t; 
           para6:Pcholmod_factor; para7:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_rowfac_mask:  incremental simplicial factorization }
{------------------------------------------------------------------------------ }
{ cholmod_rowfac_mask and cholmod_rowfac_mask2 are version of cholmod_rowfac }
{ that are specific to LPDASA.  It is unlikely to be needed by any other }
{ application, and is not documented in the CHOLMOD User Guide. }
{ input: }
{ matrix to factorize }
{ used for A*A' case only. F=A' or A(:,f)' }
{ factorize beta*I+A or beta*I+AA' }
{ first row to factorize }
{ last row to factorize is kend-1 }
{ size A->nrow. if mask[i] >= 0 row i is set to zero }
{ size A->nrow. link list of rows to compute }
{ input/output: }
function cholmod_rowfac_mask(A:Pcholmod_sparse; F:Pcholmod_sparse; beta:array[0..1] of Tdouble; kstart:Tsize_t; kend:Tsize_t; 
           mask:Pint32_t; RLinkUp:Pint32_t; L:Pcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_rowfac_mask(para1:Pcholmod_sparse; para2:Pcholmod_sparse; para3:Pdouble; para4:Tsize_t; para5:Tsize_t; 
           para6:Pint64_t; para7:Pint64_t; para8:Pcholmod_factor; para9:Pcholmod_common):longint;cdecl;external;
{ input: }
{ matrix to factorize }
{ used for A*A' case only. F=A' or A(:,f)' }
{ factorize beta*I+A or beta*I+AA' }
{ first row to factorize }
{ last row to factorize is kend-1 }
{ size A->nrow. if mask[i] >= maskmark row i is set }
{ to zero }
{ for mask [i] test }
{ size A->nrow. link list of rows to compute }
{ input/output: }
function cholmod_rowfac_mask2(A:Pcholmod_sparse; F:Pcholmod_sparse; beta:array[0..1] of Tdouble; kstart:Tsize_t; kend:Tsize_t; 
           mask:Pint32_t; maskmark:Tint32_t; RLinkUp:Pint32_t; L:Pcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_rowfac_mask2(para1:Pcholmod_sparse; para2:Pcholmod_sparse; para3:Pdouble; para4:Tsize_t; para5:Tsize_t; 
           para6:Pint64_t; para7:Tint64_t; para8:Pint64_t; para9:Pcholmod_factor; para10:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_row_subtree:  find the nonzero pattern of a row of L }
{------------------------------------------------------------------------------ }
{ Find the nonzero pattern of x for the system Lx=b where L = (0:k-1,0:k-1) }
{ and b = kth column of A or A*A' (rows 0 to k-1 only) }
{ input: }
{ matrix to analyze }
{ used for A*A' case only. F=A' or A(:,f)' }
{ row k of L }
{ elimination tree }
{ output: }
{ pattern of L(k,:), 1-by-n with R->nzmax >= n }
function cholmod_row_subtree(A:Pcholmod_sparse; F:Pcholmod_sparse; krow:Tsize_t; Parent:Pint32_t; R:Pcholmod_sparse; 
           Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_row_subtree(para1:Pcholmod_sparse; para2:Pcholmod_sparse; para3:Tsize_t; para4:Pint64_t; para5:Pcholmod_sparse; 
           para6:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_lsolve_pattern: find the nonzero pattern of y=L\b }
{------------------------------------------------------------------------------ }
{ input: }
{ sparse right-hand-side (a single sparse column) }
{ the factor L from which parent(i) is derived }
{ output: }
{ pattern of Y=L\B, n-by-1 with Y->nzmax >= n }
function cholmod_lsolve_pattern(B:Pcholmod_sparse; L:Pcholmod_factor; Yset:Pcholmod_sparse; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_lsolve_pattern(para1:Pcholmod_sparse; para2:Pcholmod_factor; para3:Pcholmod_sparse; para4:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_row_lsubtree:  find the nonzero pattern of a row of L }
{------------------------------------------------------------------------------ }
{ Identical to cholmod_row_subtree, except that it finds the elimination tree }
{ from L itself. }
{ input: }
{ matrix to analyze }
{ nonzero pattern of kth row of A', not required }
{ for the symmetric case.  Need not be sorted. }
{ size of Fi }
{ row k of L }
{ the factor L from which parent(i) is derived }
{ output: }
{ pattern of L(k,:), n-by-1 with R->nzmax >= n }
function cholmod_row_lsubtree(A:Pcholmod_sparse; Fi:Pint32_t; fnz:Tsize_t; krow:Tsize_t; L:Pcholmod_factor; 
           R:Pcholmod_sparse; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_row_lsubtree(para1:Pcholmod_sparse; para2:Pint64_t; para3:Tsize_t; para4:Tsize_t; para5:Pcholmod_factor; 
           para6:Pcholmod_sparse; para7:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_resymbol:  recompute the symbolic pattern of L }
{------------------------------------------------------------------------------ }
{ Remove entries from L that are not in the factorization of P*A*P', P*A*A'*P', }
{ or P*F*F'*P' (depending on A->stype and whether fset is NULL or not). }
{ }
{ cholmod_resymbol is the same as cholmod_resymbol_noperm, except that it }
{ first permutes A according to L->Perm.  A can be upper/lower/unsymmetric, }
{ in contrast to cholmod_resymbol_noperm (which can be lower or unsym). }
{ recompute symbolic pattern of L }
{ input: }
{ matrix to analyze }
{ subset of 0:(A->ncol)-1 }
{ size of fset }
{ if TRUE, pack the columns of L }
{ input/output: }
{ factorization, entries pruned on output }
function cholmod_resymbol(A:Pcholmod_sparse; fset:Plongint; fsize:Tsize_t; pack:longint; L:Pcholmod_factor; 
           Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_resymbol(para1:Pcholmod_sparse; para2:Pint64_t; para3:Tsize_t; para4:longint; para5:Pcholmod_factor; 
           para6:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_resymbol_noperm:  recompute the symbolic pattern of L, no L->Perm }
{------------------------------------------------------------------------------ }
{ Remove entries from L that are not in the factorization of A, A*A', }
{ or F*F' (depending on A->stype and whether fset is NULL or not). }
{ input: }
{ matrix to analyze }
{ subset of 0:(A->ncol)-1 }
{ size of fset }
{ if TRUE, pack the columns of L }
{ input/output: }
{ factorization, entries pruned on output }
function cholmod_resymbol_noperm(A:Pcholmod_sparse; fset:Pint32_t; fsize:Tsize_t; pack:longint; L:Pcholmod_factor; 
           Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_resymbol_noperm(para1:Pcholmod_sparse; para2:Pint64_t; para3:Tsize_t; para4:longint; para5:Pcholmod_factor; 
           para6:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_rcond:  compute rough estimate of reciprocal of condition number }
{------------------------------------------------------------------------------ }
{ return rcond estimate }
{ input: }
{ factorization to query; not modified }
function cholmod_rcond(L:Pcholmod_factor; Common:Pcholmod_common):Tdouble;cdecl;external;
function cholmod_l_rcond(para1:Pcholmod_factor; para2:Pcholmod_common):Tdouble;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_postorder: Compute the postorder of a tree }
{------------------------------------------------------------------------------ }
{ return # of nodes postordered }
{ input: }
{ size n. Parent [j] = p if p is the parent of j }
{ size n, optional. Weight [j] is weight of node j }
{ output: }
{ size n. Post [k] = j is kth in postordered tree }
function cholmod_postorder(Parent:Pint32_t; n:Tsize_t; Weight:Pint32_t; Post:Pint32_t; Common:Pcholmod_common):Tint32_t;cdecl;external;
function cholmod_l_postorder(para1:Pint64_t; para2:Tsize_t; para3:Pint64_t; para4:Pint64_t; para5:Pcholmod_common):Tint64_t;cdecl;external;
{$endif}
{============================================================================== }
{ CHOLMOD:MatrixOps Module }
{============================================================================== }
{$ifndef NMATRIXOPS}
{ Basic operations on sparse and dense matrices. }
{ }
{ cholmod_drop             A = entries in A with abs. value >= tol }
{ cholmod_norm_dense       s = norm (X), 1-norm, inf-norm, or 2-norm }
{ cholmod_norm_sparse      s = norm (A), 1-norm or inf-norm }
{ cholmod_horzcat          C = [A,B] }
{ cholmod_scale            A = diag(s)*A, A*diag(s), s*A or diag(s)*A*diag(s) }
{ cholmod_sdmult           Y = alpha*(A*X) + beta*Y or alpha*(A'*X) + beta*Y }
{ cholmod_ssmult           C = A*B }
{ cholmod_submatrix        C = A (i,j), where i and j are arbitrary vectors }
{ cholmod_vertcat          C = [A ; B] }
{ }
{ A, B, C: sparse matrices (cholmod_sparse) }
{ X, Y: dense matrices (cholmod_dense) }
{ s: scalar or vector }
{ }
{ Requires the Utility module.  Not required by any other CHOLMOD module. }
{------------------------------------------------------------------------------ }
{ cholmod_drop:  drop entries with small absolute value }
{------------------------------------------------------------------------------ }
{ input: }
{ keep entries with absolute value > tol }
{ input/output: }
{ matrix to drop entries from }

function cholmod_drop(tol:Tdouble; A:Pcholmod_sparse; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_drop(para1:Tdouble; para2:Pcholmod_sparse; para3:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_norm_dense:  s = norm (X), 1-norm, inf-norm, or 2-norm }
{------------------------------------------------------------------------------ }
{ returns norm (X) }
{ input: }
{ matrix to compute the norm of }
{ type of norm: 0: inf. norm, 1: 1-norm, 2: 2-norm }
function cholmod_norm_dense(X:Pcholmod_dense; norm:longint; Common:Pcholmod_common):Tdouble;cdecl;external;
function cholmod_l_norm_dense(para1:Pcholmod_dense; para2:longint; para3:Pcholmod_common):Tdouble;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_norm_sparse:  s = norm (A), 1-norm or inf-norm }
{------------------------------------------------------------------------------ }
{ returns norm (A) }
{ input: }
{ matrix to compute the norm of }
{ type of norm: 0: inf. norm, 1: 1-norm }
function cholmod_norm_sparse(A:Pcholmod_sparse; norm:longint; Common:Pcholmod_common):Tdouble;cdecl;external;
function cholmod_l_norm_sparse(para1:Pcholmod_sparse; para2:longint; para3:Pcholmod_common):Tdouble;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_horzcat:  C = [A,B] }
{------------------------------------------------------------------------------ }
{ C is returned as an unsymmetric matrix with C->stype of zero.  If A and/or }
{ B are symmetric, they are converted first to unsymmetric, and the conversion }
{ is governed by the mode input parameter. }
{ returns C = [A B] }
{ input: }
{ left matrix to concatenate }
{ right matrix to concatenate }
{ 2: numerical (conj) if A and/or B are symmetric, }
{ 1: numerical (non-conj.) if A and/or B are symmetric. }
{ 0: pattern }
function cholmod_horzcat(A:Pcholmod_sparse; B:Pcholmod_sparse; mode:longint; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_horzcat(para1:Pcholmod_sparse; para2:Pcholmod_sparse; para3:longint; para4:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_scale:  A = diag(s)*A, A*diag(s), s*A or diag(s)*A*diag(s) }
{------------------------------------------------------------------------------ }
{ scaling modes, selected by the scale input parameter: }
{ A = s*A                }
const
  CHOLMOD_SCALAR = 0;  
{ A = diag(s)*A          }
  CHOLMOD_ROW = 1;  
{ A = A*diag(s)          }
  CHOLMOD_COL = 2;  
{ A = diag(s)*A*diag(s)  }
  CHOLMOD_SYM = 3;  
{ input: }
{ scale factors (scalar or vector) }
{ type of scaling to compute }
{ input/output: }
{ matrix to scale }

function cholmod_scale(S:Pcholmod_dense; scale:longint; A:Pcholmod_sparse; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_scale(para1:Pcholmod_dense; para2:longint; para3:Pcholmod_sparse; para4:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_sdmult:  Y = alpha*(A*X) + beta*Y or alpha*(A'*X) + beta*Y }
{------------------------------------------------------------------------------ }
{ Sparse matrix times dense matrix }
{ input: }
{ sparse matrix to multiply }
{ use A if 0, otherwise use A' }
{ scale factor for A }
{ scale factor for Y }
{ dense matrix to multiply }
{ input/output: }
{ resulting dense matrix }
function cholmod_sdmult(A:Pcholmod_sparse; transpose:longint; alpha:array[0..1] of Tdouble; beta:array[0..1] of Tdouble; X:Pcholmod_dense; 
           Y:Pcholmod_dense; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_sdmult(para1:Pcholmod_sparse; para2:longint; para3:Pdouble; para4:Pdouble; para5:Pcholmod_dense; 
           Y:Pcholmod_dense; para7:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_ssmult:  C = A*B }
{------------------------------------------------------------------------------ }
{ Sparse matrix times sparse matrix. }
{ If A and/or B are symmetric, they are converted first to unsymmetric, and }
{ the conversion is governed by the mode input parameter. }
{ return C=A*B }
{ input: }
{ left matrix to multiply }
{ right matrix to multiply }
{ requested stype of C }
{ 2: numerical (conj) if A and/or B are symmetric, }
{ 1: numerical (non-conj.) if A and/or B are symmetric. }
{ 0: pattern }
{ if TRUE then return C with sorted columns }
function cholmod_ssmult(A:Pcholmod_sparse; B:Pcholmod_sparse; stype:longint; mode:longint; sorted:longint; 
           Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_ssmult(para1:Pcholmod_sparse; para2:Pcholmod_sparse; para3:longint; para4:longint; para5:longint; 
           para6:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_submatrix:  C = A (r,c), where i and j are arbitrary vectors }
{------------------------------------------------------------------------------ }
{ rsize < 0 denotes ":" in MATLAB notation, or more precisely 0:(A->nrow)-1. }
{ In this case, r can be NULL.  An rsize of zero, or r = NULL and rsize >= 0, }
{ denotes "[ ]" in MATLAB notation (the empty set). }
{ Similar rules hold for csize. }
{ C is returned as an unsymmetric matrix with C->stype of zero.  If A and/or }
{ B are symmetric, they are converted first to unsymmetric, and the conversion }
{ is governed by the mode input parameter. }
{ return C = A (rset,cset) }
{ input: }
{ matrix to subreference }
{ set of row indices, duplicates OK }
{ size of rset, or -1 for ":" }
{ set of column indices, duplicates OK }
{ size of cset, or -1 for ":" }
{ 2: numerical (conj) if A and/or B are symmetric, }
{ 1: numerical (non-conj.) if A and/or B are symmetric. }
{ 0: pattern }
{ if TRUE then return C with sorted columns }
function cholmod_submatrix(A:Pcholmod_sparse; rset:Pint32_t; rsize:Tint64_t; cset:Pint32_t; csize:Tint64_t; 
           mode:longint; sorted:longint; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_submatrix(para1:Pcholmod_sparse; para2:Pint64_t; para3:Tint64_t; para4:Pint64_t; para5:Tint64_t; 
           para6:longint; para7:longint; para8:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_vertcat:  C = [A ; B] }
{------------------------------------------------------------------------------ }
{ C is returned as an unsymmetric matrix with C->stype of zero.  If A and/or }
{ B are symmetric, they are converted first to unsymmetric, and the conversion }
{ is governed by the mode input parameter. }
{ returns C = [A ; B] }
{ input: }
{ top matrix to concatenate }
{ bottom matrix to concatenate }
{ 2: numerical (conj) if A and/or B are symmetric, }
{ 1: numerical (non-conj.) if A and/or B are symmetric }
{ 0: pattern }
function cholmod_vertcat(A:Pcholmod_sparse; B:Pcholmod_sparse; mode:longint; Common:Pcholmod_common):Pcholmod_sparse;cdecl;external;
function cholmod_l_vertcat(para1:Pcholmod_sparse; para2:Pcholmod_sparse; para3:longint; para4:Pcholmod_common):Pcholmod_sparse;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_symmetry: determine if a sparse matrix is symmetric }
{------------------------------------------------------------------------------ }
{ return values of cholmod_symmetry and cholmod_write: }
{ #define CHOLMOD_MM_RECTANGULAR       1 }
{ #define CHOLMOD_MM_UNSYMMETRIC       2 }
{ #define CHOLMOD_MM_SYMMETRIC         3 }
{ #define CHOLMOD_MM_HERMITIAN         4 }
{ #define CHOLMOD_MM_SKEW_SYMMETRIC    5 }
{ #define CHOLMOD_MM_SYMMETRIC_POSDIAG 6 }
{ #define CHOLMOD_MM_HERMITIAN_POSDIAG 7 }
{ returns the matrix symmetry (see above) }
{ input: }
{ option 0, 1, or 2 }
{ output: }
{ # of matched numerical entries }
{ # of matched entries in pattern }
{ # of off diagonal entries }
{ # of diagonal entries }
function cholmod_symmetry(A:Pcholmod_sparse; option:longint; xmatched:Pint32_t; pmatched:Pint32_t; nzoffdiag:Pint32_t; 
           nzdiag:Pint32_t; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_symmetry(para1:Pcholmod_sparse; para2:longint; para3:Pint64_t; para4:Pint64_t; para5:Pint64_t; 
           para6:Pint64_t; para7:Pcholmod_common):longint;cdecl;external;
{$endif}
{============================================================================== }
{ CHOLMOD:Modify Module }
{============================================================================== }
{$ifndef NMODIFY}
{------------------------------------------------------------------------------ }
{ CHOLMOD:Modify Module. Copyright (C) 2005-2023, Timothy A. Davis and William }
{ W. Hager.  http://www.suitesparse.com }
{------------------------------------------------------------------------------ }
{ Sparse Cholesky modification routines: update / downdate / rowadd / rowdel. }
{ Can also modify a corresponding solution to Lx=b when L is modified.  This }
{ module is most useful when applied on a Cholesky factorization computed by }
{ the Cholesky module, but it does not actually require the Cholesky module. }
{ The Utility module can create an identity Cholesky factorization (LDL' where }
{ L=D=I) that can then by modified by these routines. }
{ }
{ Primary routines: }
{ ----------------- }
{ }
{ cholmod_updown           multiple rank update/downdate }
{ cholmod_rowadd           add a row to an LDL' factorization }
{ cholmod_rowdel           delete a row from an LDL' factorization }
{ }
{ Secondary routines: }
{ ------------------- }
{ }
{ cholmod_updown_solve     update/downdate, and modify solution to Lx=b }
{ cholmod_updown_mark      update/downdate, and modify solution to partial Lx=b }
{ cholmod_updown_mask      update/downdate for LPDASA }
{ cholmod_updown_mask2     update/downdate for LPDASA }
{ cholmod_rowadd_solve     add a row, and update solution to Lx=b }
{ cholmod_rowadd_mark      add a row, and update solution to partial Lx=b }
{ cholmod_rowdel_solve     delete a row, and downdate Lx=b }
{ cholmod_rowdel_mark      delete a row, and downdate solution to partial Lx=b }
{ }
{ Requires the Utility module.  Not required by any other CHOLMOD module. }
{------------------------------------------------------------------------------ }
{ cholmod_updown:  multiple rank update/downdate }
{------------------------------------------------------------------------------ }
{ Compute the new LDL' factorization of LDL'+CC' (an update) or LDL'-CC' }
{ (a downdate).  The factor object L need not be an LDL' factorization; it }
{ is converted to one if it isn't. }
{ update/downdate }
{ input: }
{ TRUE for update, FALSE for downdate }
{ the incoming sparse update }
{ input/output: }
{ factor to modify }

function cholmod_updown(update:longint; C:Pcholmod_sparse; L:Pcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_updown(para1:longint; para2:Pcholmod_sparse; para3:Pcholmod_factor; para4:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_updown_solve:  update/downdate, and modify solution to Lx=b }
{------------------------------------------------------------------------------ }
{ Does the same as cholmod_updown, except that it also updates/downdates the }
{ solution to Lx=b+DeltaB.  x and b must be n-by-1 dense matrices.  b is not }
{ need as input to this routine, but a sparse change to b is (DeltaB).  Only }
{ entries in DeltaB corresponding to columns modified in L are accessed; the }
{ rest must be zero. }
{ input: }
{ TRUE for update, FALSE for downdate }
{ the incoming sparse update }
{ input/output: }
{ factor to modify }
{ solution to Lx=b (size n-by-1) }
{ change in b, zero on output }
function cholmod_updown_solve(update:longint; C:Pcholmod_sparse; L:Pcholmod_factor; X:Pcholmod_dense; DeltaB:Pcholmod_dense; 
           Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_updown_solve(para1:longint; para2:Pcholmod_sparse; para3:Pcholmod_factor; para4:Pcholmod_dense; para5:Pcholmod_dense; 
           para6:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_updown_mark:  update/downdate, and modify solution to partial Lx=b }
{------------------------------------------------------------------------------ }
{ Does the same as cholmod_updown_solve, except only part of L is used in }
{ the update/downdate of the solution to Lx=b.  This routine is an "expert" }
{ routine.  It is meant for use in LPDASA only.  See cholmod_updown.c for }
{ a description of colmark. }
{ input: }
{ TRUE for update, FALSE for downdate }
{ the incoming sparse update }
{ array of size n.  See cholmod_updown.c for details }
{ input/output: }
{ factor to modify }
{ solution to Lx=b (size n-by-1) }
{ change in b, zero on output }
function cholmod_updown_mark(update:longint; C:Pcholmod_sparse; colmark:Pint32_t; L:Pcholmod_factor; X:Pcholmod_dense; 
           DeltaB:Pcholmod_dense; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_updown_mark(para1:longint; para2:Pcholmod_sparse; para3:Pint64_t; para4:Pcholmod_factor; para5:Pcholmod_dense; 
           para6:Pcholmod_dense; para7:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_updown_mask:  update/downdate, for LPDASA }
{------------------------------------------------------------------------------ }
{ Does the same as cholmod_updown_mark, except has an additional "mask" }
{ argument.  This routine is an "expert" routine.  It is meant for use in }
{ LPDASA only.  See cholmod_updown.c for a description of mask. }
{ input: }
{ TRUE for update, FALSE for downdate }
{ the incoming sparse update }
{ array of size n.  See cholmod_updown.c for details }
{ size n }
{ input/output: }
{ factor to modify }
{ solution to Lx=b (size n-by-1) }
{ change in b, zero on output }
function cholmod_updown_mask(update:longint; C:Pcholmod_sparse; colmark:Pint32_t; mask:Pint32_t; L:Pcholmod_factor; 
           X:Pcholmod_dense; DeltaB:Pcholmod_dense; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_updown_mask(para1:longint; para2:Pcholmod_sparse; para3:Pint64_t; para4:Pint64_t; para5:Pcholmod_factor; 
           para6:Pcholmod_dense; para7:Pcholmod_dense; para8:Pcholmod_common):longint;cdecl;external;
{ input: }
{ TRUE for update, FALSE for downdate }
{ the incoming sparse update }
{ array of size n.  See cholmod_updown.c for details }
{ size n }
{ input/output: }
{ factor to modify }
{ solution to Lx=b (size n-by-1) }
{ change in b, zero on output }
function cholmod_updown_mask2(update:longint; C:Pcholmod_sparse; colmark:Pint32_t; mask:Pint32_t; maskmark:Tint32_t; 
           L:Pcholmod_factor; X:Pcholmod_dense; DeltaB:Pcholmod_dense; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_updown_mask2(para1:longint; para2:Pcholmod_sparse; para3:Pint64_t; para4:Pint64_t; para5:Tint64_t; 
           para6:Pcholmod_factor; para7:Pcholmod_dense; para8:Pcholmod_dense; para9:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_rowadd:  add a row to an LDL' factorization (a rank-2 update) }
{------------------------------------------------------------------------------ }
{ cholmod_rowadd adds a row to the LDL' factorization.  It computes the kth }
{ row and kth column of L, and then updates the submatrix L (k+1:n,k+1:n) }
{ accordingly.  The kth row and column of L must originally be equal to the }
{ kth row and column of the identity matrix.  The kth row/column of L is }
{ computed as the factorization of the kth row/column of the matrix to }
{ factorize, which is provided as a single n-by-1 sparse matrix R. }
{ add a row to an LDL' factorization }
{ input: }
{ row/column index to add }
{ row/column of matrix to factorize (n-by-1) }
{ input/output: }
{ factor to modify }
function cholmod_rowadd(k:Tsize_t; R:Pcholmod_sparse; L:Pcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_rowadd(para1:Tsize_t; para2:Pcholmod_sparse; para3:Pcholmod_factor; para4:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_rowadd_solve:  add a row, and update solution to Lx=b }
{------------------------------------------------------------------------------ }
{ Does the same as cholmod_rowadd, and also updates the solution to Lx=b }
{ See cholmod_updown for a description of how Lx=b is updated.  There is on }
{ additional parameter:  bk specifies the new kth entry of b. }
{ input: }
{ row/column index to add }
{ row/column of matrix to factorize (n-by-1) }
{ kth entry of the right-hand-side b }
{ input/output: }
{ factor to modify }
{ solution to Lx=b (size n-by-1) }
{ change in b, zero on output }
function cholmod_rowadd_solve(k:Tsize_t; R:Pcholmod_sparse; bk:array[0..1] of Tdouble; L:Pcholmod_factor; X:Pcholmod_dense; 
           DeltaB:Pcholmod_dense; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_rowadd_solve(para1:Tsize_t; para2:Pcholmod_sparse; para3:Pdouble; para4:Pcholmod_factor; para5:Pcholmod_dense; 
           para6:Pcholmod_dense; para7:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_rowadd_mark:  add a row, and update solution to partial Lx=b }
{------------------------------------------------------------------------------ }
{ Does the same as cholmod_rowadd_solve, except only part of L is used in }
{ the update/downdate of the solution to Lx=b.  This routine is an "expert" }
{ routine.  It is meant for use in LPDASA only. }
{ input: }
{ row/column index to add }
{ row/column of matrix to factorize (n-by-1) }
{ kth entry of the right hand side, b }
{ int32_t array of size 1.  See cholmod_updown.c }
{ input/output: }
{ factor to modify }
{ solution to Lx=b (size n-by-1) }
{ change in b, zero on output }
function cholmod_rowadd_mark(k:Tsize_t; R:Pcholmod_sparse; bk:array[0..1] of Tdouble; colmark:Pint32_t; L:Pcholmod_factor; 
           X:Pcholmod_dense; DeltaB:Pcholmod_dense; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_rowadd_mark(para1:Tsize_t; para2:Pcholmod_sparse; para3:Pdouble; para4:Pint64_t; para5:Pcholmod_factor; 
           para6:Pcholmod_dense; para7:Pcholmod_dense; para8:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_rowdel:  delete a row from an LDL' factorization (a rank-2 update) }
{------------------------------------------------------------------------------ }
{ Sets the kth row and column of L to be the kth row and column of the identity }
{ matrix, and updates L(k+1:n,k+1:n) accordingly.   To reduce the running time, }
{ the caller can optionally provide the nonzero pattern (or an upper bound) of }
{ kth row of L, as the sparse n-by-1 vector R.  Provide R as NULL if you want }
{ CHOLMOD to determine this itself, which is easier for the caller, but takes }
{ a little more time. }
{ delete a rw from an LDL' factorization }
{ input: }
{ row/column index to delete }
{ NULL, or the nonzero pattern of kth row of L }
{ input/output: }
{ factor to modify }
function cholmod_rowdel(k:Tsize_t; R:Pcholmod_sparse; L:Pcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_rowdel(para1:Tsize_t; para2:Pcholmod_sparse; para3:Pcholmod_factor; para4:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_rowdel_solve:  delete a row, and downdate Lx=b }
{------------------------------------------------------------------------------ }
{ Does the same as cholmod_rowdel, but also downdates the solution to Lx=b. }
{ When row/column k of A is "deleted" from the system A*y=b, this can induce }
{ a change to x, in addition to changes arising when L and b are modified. }
{ If this is the case, the kth entry of y is required as input (yk). }
{ input: }
{ row/column index to delete }
{ NULL, or the nonzero pattern of kth row of L }
{ kth entry in the solution to A*y=b }
{ input/output: }
{ factor to modify }
{ solution to Lx=b (size n-by-1) }
{ change in b, zero on output }
function cholmod_rowdel_solve(k:Tsize_t; R:Pcholmod_sparse; yk:array[0..1] of Tdouble; L:Pcholmod_factor; X:Pcholmod_dense; 
           DeltaB:Pcholmod_dense; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_rowdel_solve(para1:Tsize_t; para2:Pcholmod_sparse; para3:Pdouble; para4:Pcholmod_factor; para5:Pcholmod_dense; 
           para6:Pcholmod_dense; para7:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_rowdel_mark:  delete a row, and downdate solution to partial Lx=b }
{------------------------------------------------------------------------------ }
{ Does the same as cholmod_rowdel_solve, except only part of L is used in }
{ the update/downdate of the solution to Lx=b.  This routine is an "expert" }
{ routine.  It is meant for use in LPDASA only. }
{ input: }
{ row/column index to delete }
{ NULL, or the nonzero pattern of kth row of L }
{ kth entry in the solution to A*y=b }
{ int32_t array of size 1.  See cholmod_updown.c }
{ input/output: }
{ factor to modify }
{ solution to Lx=b (size n-by-1) }
{ change in b, zero on output }
function cholmod_rowdel_mark(k:Tsize_t; R:Pcholmod_sparse; yk:array[0..1] of Tdouble; colmark:Pint32_t; L:Pcholmod_factor; 
           X:Pcholmod_dense; DeltaB:Pcholmod_dense; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_rowdel_mark(para1:Tsize_t; para2:Pcholmod_sparse; para3:Pdouble; para4:Pint64_t; para5:Pcholmod_factor; 
           para6:Pcholmod_dense; para7:Pcholmod_dense; para8:Pcholmod_common):longint;cdecl;external;
{$endif}
{============================================================================== }
{ CHOLMOD:Partition Module (CAMD, CCOLAMD, and CSYMAMD) }
{============================================================================== }
{------------------------------------------------------------------------------ }
{ CHOLMOD/Partition: }
{ Copyright (C) 2005-2023, Univ. of Florida.  Author: Timothy A. Davis }
{------------------------------------------------------------------------------ }
{ CHOLMOD Partition module, interface to CAMD, CCOLAMD, CSYMAMD, and METIS, }
{ and graph partitioning and graph-partition-based orderings.  Includes an }
{ interface to CCOLAMD and CSYMAMD, constrained minimum degree ordering }
{ methods which order a matrix following constraints determined via nested }
{ dissection. }
{ }
{ These functions do not require METIS.  They are installed unless NCAMD }
{ is defined: }
{ cholmod_ccolamd      interface to CCOLAMD ordering }
{ cholmod_csymamd      interface to CSYMAMD ordering }
{ cholmod_camd         interface to CAMD ordering }
{ }
{ These functions require METIS: }
{ cholmod_nested_dissection    CHOLMOD nested dissection ordering }
{ cholmod_metis                METIS nested dissection ordering (METIS_NodeND) }
{ cholmod_bisect               graph partitioner (currently based on METIS) }
{ cholmod_metis_bisector       direct interface to METIS_ComputeVertexSeparator }
{ }
{ Requires the Utility and Cholesky modules, and three packages: METIS, CAMD, }
{ and CCOLAMD.  Optionally used by the Cholesky module. }
{$ifndef NCAMD}
{------------------------------------------------------------------------------ }
{ cholmod_ccolamd }
{------------------------------------------------------------------------------ }
{ Order AA' or A(:,f)*A(:,f)' using CCOLAMD. }
{ input: }
{ matrix to order }
{ subset of 0:(A->ncol)-1 }
{ size of fset }
{ size A->nrow.  Cmember [i] = c if row i is in the }
{ constraint set c.  c must be >= 0.  The # of }
{ constraint sets is max (Cmember) + 1.  If Cmember is }
{ NULL, then it is interpretted as Cmember [i] = 0 for }
{ all i. }
{ output: }
{ size A->nrow, output permutation }

function cholmod_ccolamd(A:Pcholmod_sparse; fset:Pint32_t; fsize:Tsize_t; Cmember:Pint32_t; Perm:Pint32_t; 
           Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_ccolamd(para1:Pcholmod_sparse; para2:Pint64_t; para3:Tsize_t; para4:Pint64_t; para5:Pint64_t; 
           para6:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_csymamd }
{------------------------------------------------------------------------------ }
{ Order A using CSYMAMD. }
{ input: }
{ matrix to order }
{ output: }
{ size nrow.  see cholmod_ccolamd.c for description }
{ size A->nrow, output permutation }
function cholmod_csymamd(A:Pcholmod_sparse; Cmember:Pint32_t; Perm:Pint32_t; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_csymamd(para1:Pcholmod_sparse; para2:Pint64_t; para3:Pint64_t; para4:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_camd: order A using CAMD }
{------------------------------------------------------------------------------ }
{ input: }
{ matrix to order }
{ subset of 0:(A->ncol)-1 }
{ size of fset }
{ size nrow.  see cholmod_ccolamd.c for description. }
{ output: }
{ size A->nrow, output permutation }
function cholmod_camd(A:Pcholmod_sparse; fset:Pint32_t; fsize:Tsize_t; Cmember:Pint32_t; Perm:Pint32_t; 
           Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_camd(para1:Pcholmod_sparse; para2:Pint64_t; para3:Tsize_t; para4:Pint64_t; para5:Pint64_t; 
           para6:Pcholmod_common):longint;cdecl;external;
{$endif}
{------------------------------------------------------------------------------ }
{ CHOLMOD:Partition Module (graph partition methods) }
{------------------------------------------------------------------------------ }
{ These routines still exist if CHOLMOD is compiled with -DNPARTITION, }
{ but they return Common->status = CHOLMOD_NOT_INSTALLED in that case. }
{$if 1}
{------------------------------------------------------------------------------ }
{ cholmod_nested_dissection }
{------------------------------------------------------------------------------ }
{ Order A, AA', or A(:,f)*A(:,f)' using CHOLMOD's nested dissection method }
{ (METIS's node bisector applied recursively to compute the separator tree }
{ and constraint sets, followed by CCOLAMD using the constraints).  Usually }
{ finds better orderings than METIS_NodeND, but takes longer. }
{ returns # of components, or -1 if error }
{ input: }
{ matrix to order }
{ subset of 0:(A->ncol)-1 }
{ size of fset }
{ output: }
{ size A->nrow, output permutation }
{ size A->nrow.  On output, CParent [c] is the parent }
{ of component c, or EMPTY if c is a root, and where }
{ c is in the range 0 to # of components minus 1 }
{ size A->nrow.  Cmember [j] = c if node j of A is }
{ in component c }

function cholmod_nested_dissection(A:Pcholmod_sparse; fset:Pint32_t; fsize:Tsize_t; Perm:Pint32_t; CParent:Pint32_t; 
           Cmember:Pint32_t; Common:Pcholmod_common):Tint64_t;cdecl;external;
function cholmod_l_nested_dissection(para1:Pcholmod_sparse; para2:Pint64_t; para3:Tsize_t; para4:Pint64_t; para5:Pint64_t; 
           para6:Pint64_t; para7:Pcholmod_common):Tint64_t;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_metis }
{------------------------------------------------------------------------------ }
{ Order A, AA', or A(:,f)*A(:,f)' using METIS_NodeND. }
{ input: }
{ matrix to order }
{ subset of 0:(A->ncol)-1 }
{ size of fset }
{ if TRUE, follow with etree or coletree postorder }
{ output: }
{ size A->nrow, output permutation }
function cholmod_metis(A:Pcholmod_sparse; fset:Pint32_t; fsize:Tsize_t; postorder:longint; Perm:Pint32_t; 
           Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_metis(para1:Pcholmod_sparse; para2:Pint64_t; para3:Tsize_t; para4:longint; para5:Pint64_t; 
           para6:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_bisect }
{------------------------------------------------------------------------------ }
{ Finds a node bisector of A, A*A', A(:,f)*A(:,f)'. }
{ returns # of nodes in separator }
{ input: }
{ matrix to bisect }
{ subset of 0:(A->ncol)-1 }
{ size of fset }
{ if TRUE, compress the graph first }
{ output: }
{ size A->nrow.  Node i is in the left graph if }
{ Partition [i] = 0, the right graph if 1, and in the }
{ separator if 2. }
function cholmod_bisect(A:Pcholmod_sparse; fset:Pint32_t; fsize:Tsize_t; compress:longint; Partition:Pint32_t; 
           Common:Pcholmod_common):Tint64_t;cdecl;external;
function cholmod_l_bisect(para1:Pcholmod_sparse; para2:Pint64_t; para3:Tsize_t; para4:longint; para5:Pint64_t; 
           para6:Pcholmod_common):Tint64_t;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_metis_bisector }
{------------------------------------------------------------------------------ }
{ Find a set of nodes that bisects the graph of A or AA' (direct interface }
{ to METIS_ComputeVertexSeperator). }
{ returns separator size }
{ input: }
{ matrix to bisect }
{ size A->nrow, node weights, can be NULL, }
{ which means the graph is unweighted. }
{ size nz, edge weights (silently ignored). }
{ This option was available with METIS 4, but not }
{ in METIS 5.  This argument is now unused, but }
{ it remains for backward compatibilty, so as not }
{ to change the API for cholmod_metis_bisector. }
{ output: }
{ size A->nrow }
function cholmod_metis_bisector(A:Pcholmod_sparse; Anw:Pint32_t; Aew:Pint32_t; Partition:Pint32_t; Common:Pcholmod_common):Tint64_t;cdecl;external;
function cholmod_l_metis_bisector(para1:Pcholmod_sparse; para2:Pint64_t; para3:Pint64_t; para4:Pint64_t; para5:Pcholmod_common):Tint64_t;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_collapse_septree }
{------------------------------------------------------------------------------ }
{ Collapse nodes in a separator tree. }
{ input: }
{ # of nodes in the graph }
{ # of nodes in the separator tree (must be <= n) }
{ collapse if #sep >= nd_oksep * #nodes in subtree }
{ collapse if #nodes in subtree < nd_small }
{ output: }
{ size ncomponents; from cholmod_nested_dissection }
{ size n; from cholmod_nested_dissection }
function cholmod_collapse_septree(n:Tsize_t; ncomponents:Tsize_t; nd_oksep:Tdouble; nd_small:Tsize_t; CParent:Pint32_t; 
           Cmember:Pint32_t; Common:Pcholmod_common):Tint64_t;cdecl;external;
function cholmod_l_collapse_septree(para1:Tsize_t; para2:Tsize_t; para3:Tdouble; para4:Tsize_t; para5:Pint64_t; 
           para6:Pint64_t; para7:Pcholmod_common):Tint64_t;cdecl;external;
{$endif}
{============================================================================== }
{ CHOLMOD:Supernodal Module }
{============================================================================== }
{$ifndef NSUPERNODAL}
{ Supernodal analysis, factorization, and solve.  The simplest way to use }
{ these routines is via the Cholesky module.  It does not provide any }
{ fill-reducing orderings, but does accept the orderings computed by the }
{ Cholesky module.  It does not require the Cholesky module itself, however. }
{ }
{ Primary routines: }
{ ----------------- }
{ cholmod_super_symbolic       supernodal symbolic analysis }
{ cholmod_super_numeric        supernodal numeric factorization }
{ cholmod_super_lsolve         supernodal Lx=b solve }
{ cholmod_super_ltsolve        supernodal L'x=b solve }
{ }
{ Prototypes for the BLAS and LAPACK routines that CHOLMOD uses are listed }
{ below, including how they are used in CHOLMOD.  Only the double methods are }
{ listed, but CHOLMOD also uses the corresponding single, single complex, and }
{ double complex routines. }
{ }
{ BLAS routines: }
{ -------------- }
{ dtrsv    solve Lx=b or L'x=b, L non-unit diagonal, x and b stride-1 }
{ dtrsm    solve LX=B or L'X=b, L non-unit diagonal }
{ dgemv    y=y-A*x or y=y-A'*x (x and y stride-1) }
{ dgemm    C=A*B', C=C-A*B, or C=C-A'*B }
{ dsyrk    C=tril(A*A'), zherk for the double complex case }
{ }
{ LAPACK routines: }
{ ---------------- }
{ dpotrf   LAPACK: A=chol(tril(A)) }
{ }
{ Requires the Utility module, and two external packages: LAPACK and the BLAS. }
{ Optionally used by the Cholesky module. }
{------------------------------------------------------------------------------ }
{ cholmod_super_symbolic }
{------------------------------------------------------------------------------ }
{ Analyzes A, AA', or A(:,f)*A(:,f)' in preparation for a supernodal numeric }
{ factorization.  The user need not call this directly; cholmod_analyze is }
{ a "simple" wrapper for this routine. }
{ input: }
{ matrix to analyze }
{ F = A' or A(:,f)' }
{ elimination tree }
{ input/output: }
{ simplicial symbolic on input, }
{ supernodal symbolic on output }

function cholmod_super_symbolic(A:Pcholmod_sparse; F:Pcholmod_sparse; Parent:Pint32_t; L:Pcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_super_symbolic(para1:Pcholmod_sparse; para2:Pcholmod_sparse; para3:Pint64_t; para4:Pcholmod_factor; para5:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_super_symbolic2 }
{------------------------------------------------------------------------------ }
{ Analyze for supernodal Cholesky or multifrontal QR }
const
  CHOLMOD_ANALYZE_FOR_SPQR = 0;  
  CHOLMOD_ANALYZE_FOR_CHOLESKY = 1;  
  CHOLMOD_ANALYZE_FOR_SPQRGPU = 2;  
{ input: }
{ FOR_SPQR     (0): for SPQR but not GPU-accelerated }
{ FOR_CHOLESKY (1): for Cholesky (GPU or not) }
{ FOR_SPQRGPU  (2): for SPQR with GPU acceleration }
{ matrix to analyze }
{ F = A' or A(:,f)' }
{ elimination tree }
{ input/output: }
{ simplicial symbolic on input, }
{ supernodal symbolic on output }

function cholmod_super_symbolic2(for_whom:longint; A:Pcholmod_sparse; F:Pcholmod_sparse; Parent:Pint32_t; L:Pcholmod_factor; 
           Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_super_symbolic2(para1:longint; para2:Pcholmod_sparse; para3:Pcholmod_sparse; para4:Pint64_t; para5:Pcholmod_factor; 
           para6:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_super_numeric }
{------------------------------------------------------------------------------ }
{ Computes the numeric LL' factorization of A, AA', or A(:,f)*A(:,f)' using }
{ a BLAS-based supernodal method.  The user need not call this directly; }
{ cholmod_factorize is a "simple" wrapper for this routine. }
{ input: }
{ matrix to factorize }
{ F = A' or A(:,f)' }
{ beta*I is added to diagonal of matrix to factorize }
{ input/output: }
{ factorization }
function cholmod_super_numeric(A:Pcholmod_sparse; F:Pcholmod_sparse; beta:array[0..1] of Tdouble; L:Pcholmod_factor; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_super_numeric(para1:Pcholmod_sparse; para2:Pcholmod_sparse; para3:Pdouble; para4:Pcholmod_factor; para5:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_super_lsolve }
{------------------------------------------------------------------------------ }
{ Solve Lx=b where L is from a supernodal numeric factorization.  The user }
{ need not call this routine directly.  cholmod_solve is a "simple" wrapper }
{ for this routine. }
{ input: }
{ factor to use for the forward solve }
{ input/output: }
{ b on input, solution to Lx=b on output }
{ workspace: }
{ workspace of size nrhs*(L->maxesize) }
function cholmod_super_lsolve(L:Pcholmod_factor; X:Pcholmod_dense; E:Pcholmod_dense; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_super_lsolve(para1:Pcholmod_factor; para2:Pcholmod_dense; para3:Pcholmod_dense; para4:Pcholmod_common):longint;cdecl;external;
{------------------------------------------------------------------------------ }
{ cholmod_super_ltsolve }
{------------------------------------------------------------------------------ }
{ Solve L'x=b where L is from a supernodal numeric factorization.  The user }
{ need not call this routine directly.  cholmod_solve is a "simple" wrapper }
{ for this routine. }
{ input: }
{ factor to use for the backsolve }
{ input/output: }
{ b on input, solution to L'x=b on output }
{ workspace: }
{ workspace of size nrhs*(L->maxesize) }
function cholmod_super_ltsolve(L:Pcholmod_factor; X:Pcholmod_dense; E:Pcholmod_dense; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_super_ltsolve(para1:Pcholmod_factor; para2:Pcholmod_dense; para3:Pcholmod_dense; para4:Pcholmod_common):longint;cdecl;external;
{$endif}
{ C++ end of extern C conditionnal removed }
{============================================================================== }
{ CHOLMOD:SupernodalGPU Module }
{============================================================================== }
{------------------------------------------------------------------------------ }
{ cholmod_score_comp: for sorting descendant supernodes with qsort }
{------------------------------------------------------------------------------ }
{ C++ extern C conditionnal removed }
type
  Pcholmod_descendant_score_t = ^Tcholmod_descendant_score_t;
  Tcholmod_descendant_score_t = record
      score : Tdouble;
      d : Tint64_t;
    end;
  TdescendantScore = Tcholmod_descendant_score_t;
  PdescendantScore = ^TdescendantScore;

function cholmod_score_comp(i:Pcholmod_descendant_score_t; j:Pcholmod_descendant_score_t):longint;cdecl;external;
function cholmod_l_score_comp(i:Pcholmod_descendant_score_t; j:Pcholmod_descendant_score_t):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{------------------------------------------------------------------------------ }
{ remainder of SupernodalGPU Module }
{------------------------------------------------------------------------------ }
{$ifdef CHOLMOD_HAS_CUDA}
{$include "omp.h"}
{$include <fenv.h>}
{$ifndef SUITESPARSE_GPU_EXTERN_ON}
{$include <cuda.h>}
{$include <cuda_runtime.h>}
{$endif}
{ CHOLMOD_GPU_PRINTF: for printing GPU debug error messages }
{ #define CHOLMOD_GPU_PRINTF(args) printf args }
{#define CHOLMOD_GPU_PRINTF(args) }
{ define supernode requirements for processing on GPU }
{ required descendant rows  }

const
  CHOLMOD_ND_ROW_LIMIT = 256;  
{ required descendnat cols  }
  CHOLMOD_ND_COL_LIMIT = 32;  
{ required cols for POTRF & TRSM on GPU  }
  CHOLMOD_POTRF_LIMIT = 512;  
{ # of host supernodes to perform before checking for free pinned buffers }
  CHOLMOD_GPU_SKIP = 3;  
{#define CHOLMOD_HANDLE_CUDA_ERROR(e,s) if (e) ERROR(CHOLMOD_GPU_PROBLEM,s); }
{ C++ extern C conditionnal removed }
type
  Pcholmod_gpu_pointers = ^Tcholmod_gpu_pointers;
  Tcholmod_gpu_pointers = record
      h_Lx : array[0..(CHOLMOD_HOST_SUPERNODE_BUFFERS)-1] of Pdouble;
      d_Lx : array[0..(CHOLMOD_DEVICE_STREAMS)-1] of Pdouble;
      d_C : Pdouble;
      d_A : array[0..(CHOLMOD_DEVICE_STREAMS)-1] of Pdouble;
      d_Ls : pointer;
      d_Map : pointer;
      d_RelativeMap : pointer;
    end;
{ GPU memory size available, 1 if no GPU }

function cholmod_gpu_memorysize(total_mem:Psize_t; available_mem:Psize_t; Common:Pcholmod_common):longint;cdecl;external;
{ GPU memory size available, 1 if no GPU }
function cholmod_l_gpu_memorysize(total_mem:Psize_t; available_mem:Psize_t; Common:Pcholmod_common):longint;cdecl;external;
function cholmod_gpu_probe(Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_gpu_probe(Common:Pcholmod_common):longint;cdecl;external;
function cholmod_gpu_deallocate(Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_gpu_deallocate(Common:Pcholmod_common):longint;cdecl;external;
function cholmod_gpu_start(Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_gpu_start(Common:Pcholmod_common):longint;cdecl;external;
procedure cholmod_gpu_end(Common:Pcholmod_common);cdecl;external;
procedure cholmod_l_gpu_end(Common:Pcholmod_common);cdecl;external;
function cholmod_gpu_allocate(Common:Pcholmod_common):longint;cdecl;external;
function cholmod_l_gpu_allocate(Common:Pcholmod_common):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CHOLMOD_VER_CODE(main,sub : longint) : longint;
begin
  CHOLMOD_VER_CODE:=SUITESPARSE_VER_CODE(main,sub);
end;

{ was #define dname def_expr }
function CHOLMOD_VERSION : longint; { return type might be wrong }
  begin
    CHOLMOD_VERSION:=CHOLMOD_VER_CODE(5,2);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CHOLMOD_IS_NAN(x : longint) : longint;
begin
  CHOLMOD_IS_NAN:=isnan(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CHOLMOD_IS_ZERO(x : longint) : longint;
begin
  CHOLMOD_IS_ZERO:=x=0.0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CHOLMOD_IS_NONZERO(x : longint) : longint;
begin
  CHOLMOD_IS_NONZERO:=x<>0.0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CHOLMOD_IS_LT_ZERO(x : longint) : longint;
begin
  CHOLMOD_IS_LT_ZERO:=x<0.0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CHOLMOD_IS_GT_ZERO(x : longint) : longint;
begin
  CHOLMOD_IS_GT_ZERO:=x>0.0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CHOLMOD_IS_LE_ZERO(x : longint) : longint;
begin
  CHOLMOD_IS_LE_ZERO:=x<=0.0;
end;


end.
