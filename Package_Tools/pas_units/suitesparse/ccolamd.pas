unit ccolamd;

interface

uses
  fp_suitesparse;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{------------------------------------------------------------------------------ }
{ CCOLAMD/Include/ccolamd.h:  constrained column approx. min. degree ordering }
{------------------------------------------------------------------------------ }
{ CCOLAMD, Copyright (c) 1996-2024, Timothy A. Davis, Sivasankaran }
{ Rajamanickam, and Stefan Larimore.  All Rights Reserved. }
{ SPDX-License-Identifier: BSD-3-clause }
{------------------------------------------------------------------------------ }
{
 *  You must include this file (ccolamd.h) in any routine that uses ccolamd,
 *  csymamd, or the related macros and definitions.
  }
{$ifndef CCOLAMD_H}
{$define CCOLAMD_H}
{$include "SuiteSparse_config.h"}
{ ==========================================================================  }
{ === CCOLAMD version ======================================================  }
{ ==========================================================================  }
{ All versions of CCOLAMD will include the following definitions.
 * As an example, to test if the version you are using is 1.3 or later:
 *
 *	if (CCOLAMD_VERSION >= CCOLAMD_VERSION_CODE (1,3)) ...
 *
 * This also works during compile-time:
 *
 *	#if CCOLAMD_VERSION >= CCOLAMD_VERSION_CODE (1,3)
 *	    printf ("This is version 1.3 or later\n") ;
 *	#else
 *	    printf ("This is an early version\n") ;
 *	#endif
  }

const
  CCOLAMD_DATE = 'Jan 20, 2024';  
  CCOLAMD_MAIN_VERSION = 3;  
  CCOLAMD_SUB_VERSION = 3;  
  CCOLAMD_SUBSUB_VERSION = 2;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function CCOLAMD_VERSION_CODE(main,sub : longint) : longint;

{ was #define dname def_expr }
function CCOLAMD_VERSION : longint; { return type might be wrong }

{ ==========================================================================  }
{ === Knob and statistics definitions ======================================  }
{ ==========================================================================  }
{ size of the knobs [ ] array.  Only knobs [0..3] are currently used.  }
const
  CCOLAMD_KNOBS = 20;  
{ number of output statistics.  Only stats [0..10] are currently used.  }
  CCOLAMD_STATS = 20;  
{ knobs [0] and stats [0]: dense row knob and output statistic.  }
  CCOLAMD_DENSE_ROW = 0;  
{ knobs [1] and stats [1]: dense column knob and output statistic.  }
  CCOLAMD_DENSE_COL = 1;  
{ knobs [2]: aggressive absorption option  }
  CCOLAMD_AGGRESSIVE = 2;  
{ knobs [3]: LU or Cholesky factorization option  }
  CCOLAMD_LU = 3;  
{ stats [2]: memory defragmentation count output statistic  }
  CCOLAMD_DEFRAG_COUNT = 2;  
{ stats [3]: ccolamd status:  zero OK, > 0 warning or notice, < 0 error  }
  CCOLAMD_STATUS = 3;  
{ stats [4..6]: error info, or info on jumbled columns  }  CCOLAMD_INFO1 = 4;  
  CCOLAMD_INFO2 = 5;  
  CCOLAMD_INFO3 = 6;  
{ stats [7]: number of originally empty rows  }
  CCOLAMD_EMPTY_ROW = 7;  
{ stats [8]: number of originally empty cols  }
  CCOLAMD_EMPTY_COL = 8;  
{ stats [9]: number of rows with entries only in dense cols  }
  CCOLAMD_NEWLY_EMPTY_ROW = 9;  
{ stats [10]: number of cols with entries only in dense rows  }
  CCOLAMD_NEWLY_EMPTY_COL = 10;  
{ error codes returned in stats [3]:  }
  CCOLAMD_OK = 0;  
  CCOLAMD_OK_BUT_JUMBLED = 1;  
  CCOLAMD_ERROR_A_not_present = -(1);  
  CCOLAMD_ERROR_p_not_present = -(2);  
  CCOLAMD_ERROR_nrow_negative = -(3);  
  CCOLAMD_ERROR_ncol_negative = -(4);  
  CCOLAMD_ERROR_nnz_negative = -(5);  
  CCOLAMD_ERROR_p0_nonzero = -(6);  
  CCOLAMD_ERROR_A_too_small = -(7);  
  CCOLAMD_ERROR_col_length_negative = -(8);  
  CCOLAMD_ERROR_row_index_out_of_bounds = -(9);  
  CCOLAMD_ERROR_out_of_memory = -(10);  
  CCOLAMD_ERROR_invalid_cmember = -(11);  
  CCOLAMD_ERROR_internal_error = -(999);  
{ ==========================================================================  }
{ === Prototypes of user-callable routines =================================  }
{ ==========================================================================  }
{ make it easy for C++ programs to include CCOLAMD  }
{ C++ extern C conditionnal removed }
{ returns recommended value of Alen,  }
{ or 0 if input arguments are erroneous  }
{ nonzeros in A  }
{ number of rows in A  }
{ number of columns in A  }

function ccolamd_recommended(nnz:longint; n_row:longint; n_col:longint):Tsize_t;cdecl;external libccolamd;
{ returns recommended value of Alen,  }
{ or 0 if input arguments are erroneous  }
{ nonzeros in A  }
{ number of rows in A  }
{ number of columns in A  }
function ccolamd_l_recommended(nnz:Tint64_t; n_row:Tint64_t; n_col:Tint64_t):Tsize_t;cdecl;external libccolamd;
{ sets default parameters  }
{ knobs argument is modified on output  }
{ parameter settings for ccolamd  }
procedure ccolamd_set_defaults(knobs:array[0..(CCOLAMD_KNOBS)-1] of Tdouble);cdecl;external libccolamd;
{ sets default parameters  }
{ knobs argument is modified on output  }
{ parameter settings for ccolamd  }
procedure ccolamd_l_set_defaults(knobs:array[0..(CCOLAMD_KNOBS)-1] of Tdouble);cdecl;external libccolamd;
{ returns (1) if successful, (0) otherwise }
{ A and p arguments are modified on output  }
{ number of rows in A  }
{ number of columns in A  }
{ size of the array A  }
{ row indices of A, of size Alen  }
{ column pointers of A, of size n_col+1  }
{ parameter settings for ccolamd  }
{ ccolamd output statistics and error codes  }
{ Constraint set of A, of size n_col  }
function ccolamd(n_row:longint; n_col:longint; Alen:longint; A:Plongint; p:Plongint; 
           knobs:array[0..(CCOLAMD_KNOBS)-1] of Tdouble; stats:array[0..(CCOLAMD_STATS)-1] of longint; cmember:Plongint):longint;cdecl;external libccolamd;
{ as ccolamd w/ int64_t integers  }
function ccolamd_l(n_row:Tint64_t; n_col:Tint64_t; Alen:Tint64_t; A:Pint64_t; p:Pint64_t; 
           knobs:array[0..(CCOLAMD_KNOBS)-1] of Tdouble; stats:array[0..(CCOLAMD_STATS)-1] of Tint64_t; cmember:Pint64_t):longint;cdecl;external libccolamd;
{ return (1) if OK, (0) otherwise  }
{ number of rows and columns of A  }
{ row indices of A  }
{ column pointers of A  }
{ output permutation, size n_col+1  }
{ parameters (uses defaults if NULL)  }
{ output statistics and error codes  }
{ pointer to calloc (ANSI C) or  }
{ mxCalloc (for MATLAB mexFunction)  }
{ pointer to free (ANSI C) or  }
{ mxFree (for MATLAB mexFunction)  }
{ Constraint set of A  }
{ 0: use both parts, >0: upper, <0: lower  }
function csymamd(n:longint; A:Plongint; p:Plongint; perm:Plongint; knobs:array[0..(CCOLAMD_KNOBS)-1] of Tdouble; 
           stats:array[0..(CCOLAMD_STATS)-1] of longint; allocate:function (para1:Tsize_t; para2:Tsize_t):pointer; release:procedure (para1:pointer); cmember:Plongint; stype:longint):longint;cdecl;external libccolamd;
{ as csymamd, w/ int64_t integers  }
function csymamd_l(n:Tint64_t; A:Pint64_t; p:Pint64_t; perm:Pint64_t; knobs:array[0..(CCOLAMD_KNOBS)-1] of Tdouble; 
           stats:array[0..(CCOLAMD_STATS)-1] of Tint64_t; allocate:function (para1:Tsize_t; para2:Tsize_t):pointer; release:procedure (para1:pointer); cmember:Pint64_t; stype:Tint64_t):longint;cdecl;external libccolamd;
procedure ccolamd_report(stats:array[0..(CCOLAMD_STATS)-1] of longint);cdecl;external libccolamd;
procedure ccolamd_l_report(stats:array[0..(CCOLAMD_STATS)-1] of Tint64_t);cdecl;external libccolamd;
procedure csymamd_report(stats:array[0..(CCOLAMD_STATS)-1] of longint);cdecl;external libccolamd;
procedure csymamd_l_report(stats:array[0..(CCOLAMD_STATS)-1] of Tint64_t);cdecl;external libccolamd;
procedure ccolamd_version(version:array[0..2] of longint);cdecl;external libccolamd;
{ ==========================================================================  }
{ === Prototypes of "expert" routines ======================================  }
{ ==========================================================================  }
{ These routines are meant to be used internally, or in a future version of
 * UMFPACK.  They appear here so that UMFPACK can use them, but they should not
 * be called directly by the user.
  }
{ A and p arguments are modified on output  }
{ number of rows in A  }
{ number of columns in A  }
{ size of the array A  }
{ row indices of A, of size Alen  }
{ column pointers of A, of size n_col+1  }
{ parameter settings for ccolamd  }
{ ccolamd output statistics and error codes  }
{ each Front_ array is of size n_col+1:  }
{ # pivot cols in each front  }
{ # of rows in each front (incl. pivot rows)  }
{ # of cols in each front (incl. pivot cols)  }
{ parent of each front  }
{ link list of pivot columns for each front  }
{ total number of frontal matrices  }
{ InFront [row] = f if row in front f  }
{ Constraint set of A  }
function ccolamd2(n_row:longint; n_col:longint; Alen:longint; A:Plongint; p:Plongint; 
           knobs:array[0..(CCOLAMD_KNOBS)-1] of Tdouble; stats:array[0..(CCOLAMD_STATS)-1] of longint; Front_npivcol:Plongint; Front_nrows:Plongint; Front_ncols:Plongint; 
           Front_parent:Plongint; Front_cols:Plongint; p_nfr:Plongint; InFront:Plongint; cmember:Plongint):longint;cdecl;external libccolamd;
{ as ccolamd2, w/ int64_t integers  }
function ccolamd2_l(n_row:Tint64_t; n_col:Tint64_t; Alen:Tint64_t; A:Pint64_t; p:Pint64_t; 
           knobs:array[0..(CCOLAMD_KNOBS)-1] of Tdouble; stats:array[0..(CCOLAMD_STATS)-1] of Tint64_t; Front_npivcol:Pint64_t; Front_nrows:Pint64_t; Front_ncols:Pint64_t; 
           Front_parent:Pint64_t; Front_cols:Pint64_t; p_nfr:Pint64_t; InFront:Pint64_t; cmember:Pint64_t):longint;cdecl;external libccolamd;
procedure ccolamd_apply_order(Front:Plongint; Order:Plongint; Temp:Plongint; nn:longint; nfr:longint);cdecl;external libccolamd;
procedure ccolamd_l_apply_order(Front:Pint64_t; Order:Pint64_t; Temp:Pint64_t; nn:Tint64_t; nfr:Tint64_t);cdecl;external libccolamd;
procedure ccolamd_fsize(nn:longint; MaxFsize:Plongint; Fnrows:Plongint; Fncols:Plongint; Parent:Plongint; 
            Npiv:Plongint);cdecl;external libccolamd;
procedure ccolamd_l_fsize(nn:Tint64_t; MaxFsize:Pint64_t; Fnrows:Pint64_t; Fncols:Pint64_t; Parent:Pint64_t; 
            Npiv:Pint64_t);cdecl;external libccolamd;
procedure ccolamd_postorder(nn:longint; Parent:Plongint; Npiv:Plongint; Fsize:Plongint; Order:Plongint; 
            Child:Plongint; Sibling:Plongint; Stack:Plongint; Front_cols:Plongint; cmember:Plongint);cdecl;external libccolamd;
procedure ccolamd_l_postorder(nn:Tint64_t; Parent:Pint64_t; Npiv:Pint64_t; Fsize:Pint64_t; Order:Pint64_t; 
            Child:Pint64_t; Sibling:Pint64_t; Stack:Pint64_t; Front_cols:Pint64_t; cmember:Pint64_t);cdecl;external libccolamd;
function ccolamd_post_tree(root:longint; k:longint; Child:Plongint; Sibling:Plongint; Order:Plongint; 
           Stack:Plongint):longint;cdecl;external libccolamd;
function ccolamd_l_post_tree(root:Tint64_t; k:Tint64_t; Child:Pint64_t; Sibling:Pint64_t; Order:Pint64_t; 
           Stack:Pint64_t):Tint64_t;cdecl;external libccolamd;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 4-11-25 19:28:27 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CCOLAMD_VERSION_CODE(main,sub : longint) : longint;
begin
  CCOLAMD_VERSION_CODE:=SUITESPARSE_VER_CODE(main,sub);
end;

{ was #define dname def_expr }
function CCOLAMD_VERSION : longint; { return type might be wrong }
  begin
    CCOLAMD_VERSION:=CCOLAMD_VERSION_CODE(3,3);
  end;


end.
