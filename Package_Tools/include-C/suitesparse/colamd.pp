
unit colamd;
interface

{
  Automatically converted by H2Pas 1.0.0 from colamd.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    colamd.h
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
Pint32_t  = ^int32_t;
Pint64_t  = ^int64_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{------------------------------------------------------------------------------ }
{ COLAMD/Include/colamd.h: include file for COLAMD }
{------------------------------------------------------------------------------ }
{ COLAMD, Copyright (c) 1998-2024, Timothy A. Davis and Stefan Larimore, }
{ All Rights Reserved. }
{ SPDX-License-Identifier: BSD-3-clause }
{------------------------------------------------------------------------------ }
{ COLAMD / SYMAMD include file

    You must include this file (colamd.h) in any routine that uses colamd,
    symamd, or the related macros and definitions.

    Authors:

        The authors of the code itself are Stefan I. Larimore and Timothy A.
        Davis (DrTimothyAldenDavis@gmail.com).  The algorithm was
        developed in collaboration with John Gilbert, Xerox PARC, and Esmond
        Ng, Oak Ridge National Laboratory.

    Acknowledgements:

        This work was supported by the National Science Foundation, under
        grants DMS-9504974 and DMS-9803599.

    Availability:

        The colamd/symamd library is available at http://www.suitesparse.com
        This file is required by the colamd.c, colamdmex.c, and symamdmex.c
        files, and by any C code that calls the routines whose prototypes are
        listed below, or that uses the colamd/symamd definitions listed below.

 }
{$ifndef COLAMD_H}
{$define COLAMD_H}
{ ==========================================================================  }
{ === Include files ========================================================  }
{ ==========================================================================  }
{$include "SuiteSparse_config.h"}
{ ==========================================================================  }
{ === COLAMD version =======================================================  }
{ ==========================================================================  }
{ COLAMD Version 2.4 and later will include the following definitions.
 * As an example, to test if the version you are using is 2.4 or later:
 *
 * #ifdef COLAMD_VERSION
 *     if (COLAMD_VERSION >= COLAMD_VERSION_CODE (2,4)) ...
 * #endif
 *
 * This also works during compile-time:
 *
 *  #if defined(COLAMD_VERSION) && (COLAMD_VERSION >= COLAMD_VERSION_CODE (2,4))
 *    printf ("This is version 2.4 or later\n") ;
 *  #else
 *    printf ("This is an early version\n") ;
 *  #endif
 *
 * Versions 2.3 and earlier of COLAMD do not include a #define'd version number.
  }

const
  COLAMD_DATE = 'Jan 20, 2024';  
  COLAMD_MAIN_VERSION = 3;  
  COLAMD_SUB_VERSION = 3;  
  COLAMD_SUBSUB_VERSION = 2;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function COLAMD_VERSION_CODE(main,sub : longint) : longint;

{ was #define dname def_expr }
function COLAMD_VERSION : longint; { return type might be wrong }

{ ==========================================================================  }
{ === Knob and statistics definitions ======================================  }
{ ==========================================================================  }
{ size of the knobs [ ] array.  Only knobs [0..1] are currently used.  }
const
  COLAMD_KNOBS = 20;  
{ number of output statistics.  Only stats [0..6] are currently used.  }
  COLAMD_STATS = 20;  
{ knobs [0] and stats [0]: dense row knob and output statistic.  }
  COLAMD_DENSE_ROW = 0;  
{ knobs [1] and stats [1]: dense column knob and output statistic.  }
  COLAMD_DENSE_COL = 1;  
{ knobs [2]: aggressive absorption  }
  COLAMD_AGGRESSIVE = 2;  
{ stats [2]: memory defragmentation count output statistic  }
  COLAMD_DEFRAG_COUNT = 2;  
{ stats [3]: colamd status:  zero OK, > 0 warning or notice, < 0 error  }
  COLAMD_STATUS = 3;  
{ stats [4..6]: error info, or info on jumbled columns  }  COLAMD_INFO1 = 4;  
  COLAMD_INFO2 = 5;  
  COLAMD_INFO3 = 6;  
{ error codes returned in stats [3]:  }
  COLAMD_OK = 0;  
  COLAMD_OK_BUT_JUMBLED = 1;  
  COLAMD_ERROR_A_not_present = -(1);  
  COLAMD_ERROR_p_not_present = -(2);  
  COLAMD_ERROR_nrow_negative = -(3);  
  COLAMD_ERROR_ncol_negative = -(4);  
  COLAMD_ERROR_nnz_negative = -(5);  
  COLAMD_ERROR_p0_nonzero = -(6);  
  COLAMD_ERROR_A_too_small = -(7);  
  COLAMD_ERROR_col_length_negative = -(8);  
  COLAMD_ERROR_row_index_out_of_bounds = -(9);  
  COLAMD_ERROR_out_of_memory = -(10);  
  COLAMD_ERROR_internal_error = -(999);  
{ ==========================================================================  }
{ === Prototypes of user-callable routines =================================  }
{ ==========================================================================  }
{ make it easy for C++ programs to include COLAMD  }
{ C++ extern C conditionnal removed }
{ returns recommended value of Alen,  }
{ or 0 if input arguments are erroneous  }
{ nonzeros in A  }
{ number of rows in A  }
{ number of columns in A  }

function colamd_recommended(nnz:Tint32_t; n_row:Tint32_t; n_col:Tint32_t):Tsize_t;cdecl;external;
{ returns recommended value of Alen,  }
{ or 0 if input arguments are erroneous  }
{ nonzeros in A  }
{ number of rows in A  }
{ number of columns in A  }
function colamd_l_recommended(nnz:Tint64_t; n_row:Tint64_t; n_col:Tint64_t):Tsize_t;cdecl;external;
{ sets default parameters  }
{ knobs argument is modified on output  }
{ parameter settings for colamd  }
procedure colamd_set_defaults(knobs:array[0..(COLAMD_KNOBS)-1] of Tdouble);cdecl;external;
{ sets default parameters  }
{ knobs argument is modified on output  }
{ parameter settings for colamd  }
procedure colamd_l_set_defaults(knobs:array[0..(COLAMD_KNOBS)-1] of Tdouble);cdecl;external;
{ returns (1) if successful, (0) otherwise }
{ A and p arguments are modified on output  }
{ number of rows in A  }
{ number of columns in A  }
{ size of the array A  }
{ row indices of A, of size Alen  }
{ column pointers of A, of size n_col+1  }
{ parameter settings for colamd  }
{ colamd output stats and error codes  }
function colamd(n_row:Tint32_t; n_col:Tint32_t; Alen:Tint32_t; A:Pint32_t; p:Pint32_t; 
           knobs:array[0..(COLAMD_KNOBS)-1] of Tdouble; stats:array[0..(COLAMD_STATS)-1] of Tint32_t):longint;cdecl;external;
{ returns (1) if successful, (0) otherwise }
{ A and p arguments are modified on output  }
{ number of rows in A  }
{ number of columns in A  }
{ size of the array A  }
{ row indices of A, of size Alen  }
{ column pointers of A, of size n_col+1  }
{ parameter settings for colamd  }
{ colamd output stats and error codes  }
function colamd_l(n_row:Tint64_t; n_col:Tint64_t; Alen:Tint64_t; A:Pint64_t; p:Pint64_t; 
           knobs:array[0..(COLAMD_KNOBS)-1] of Tdouble; stats:array[0..(COLAMD_STATS)-1] of Tint64_t):longint;cdecl;external;
{ return (1) if OK, (0) otherwise  }
{ number of rows and columns of A  }
{ row indices of A  }
{ column pointers of A  }
{ output permutation, size n_col+1  }
{ parameters (uses defaults if NULL)  }
{ output stats and error codes  }
{ pointer to calloc (ANSI C) or  }
{ mxCalloc (for MATLAB mexFunction)  }
{ pointer to free (ANSI C) or  }
{ mxFree (for MATLAB mexFunction)  }
function symamd(n:Tint32_t; A:Pint32_t; p:Pint32_t; perm:Pint32_t; knobs:array[0..(COLAMD_KNOBS)-1] of Tdouble; 
           stats:array[0..(COLAMD_STATS)-1] of Tint32_t; allocate:function (para1:Tsize_t; para2:Tsize_t):pointer; release:procedure (para1:pointer)):longint;cdecl;external;
{ return (1) if OK, (0) otherwise  }
{ number of rows and columns of A  }
{ row indices of A  }
{ column pointers of A  }
{ output permutation, size n_col+1  }
{ parameters (uses defaults if NULL)  }
{ output stats and error codes  }
{ pointer to calloc (ANSI C) or  }
{ mxCalloc (for MATLAB mexFunction)  }
{ pointer to free (ANSI C) or  }
{ mxFree (for MATLAB mexFunction)  }
function symamd_l(n:Tint64_t; A:Pint64_t; p:Pint64_t; perm:Pint64_t; knobs:array[0..(COLAMD_KNOBS)-1] of Tdouble; 
           stats:array[0..(COLAMD_STATS)-1] of Tint64_t; allocate:function (para1:Tsize_t; para2:Tsize_t):pointer; release:procedure (para1:pointer)):longint;cdecl;external;
procedure colamd_report(stats:array[0..(COLAMD_STATS)-1] of Tint32_t);cdecl;external;
procedure colamd_l_report(stats:array[0..(COLAMD_STATS)-1] of Tint64_t);cdecl;external;
procedure symamd_report(stats:array[0..(COLAMD_STATS)-1] of Tint32_t);cdecl;external;
procedure symamd_l_report(stats:array[0..(COLAMD_STATS)-1] of Tint64_t);cdecl;external;
procedure colamd_version(version:array[0..2] of longint);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ COLAMD_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function COLAMD_VERSION_CODE(main,sub : longint) : longint;
begin
  COLAMD_VERSION_CODE:=SUITESPARSE_VER_CODE(main,sub);
end;

{ was #define dname def_expr }
function COLAMD_VERSION : longint; { return type might be wrong }
  begin
    COLAMD_VERSION:=COLAMD_VERSION_CODE(3,3);
  end;


end.
