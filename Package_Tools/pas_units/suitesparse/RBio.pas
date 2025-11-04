unit RBio;

interface

uses
  fp_suitesparse;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{------------------------------------------------------------------------------ }
{ RBio/Include/RBio.h: include file for RBio }
{------------------------------------------------------------------------------ }
{ RBio, Copyright (c) 2009-2023, Timothy A. Davis.  All Rights Reserved. }
{ SPDX-License-Identifier: GPL-2.0+ }
{------------------------------------------------------------------------------ }
{$ifndef _RBIO_H}
{$define _RBIO_H}
{ --------------------------------------------------------------------------  }
{ large file I/O support  }
{ --------------------------------------------------------------------------  }
{ Definitions required for large file I/O, which must come before any other
 * #includes.  These are not used if -DNLARGEFILE is defined at compile time.
 * Large file support may not be portable across all platforms and compilers;
 * if you encounter an error here, compile your code with -DNLARGEFILE.  In
 * particular, you must use -DNLARGEFILE for MATLAB 6.5 or earlier (which does
 * not have the io64.h include file).   See also CHOLMOD/Include/cholmod_io64.h.
  }
{ skip all of this if NLARGEFILE is defined at the compiler command line  }
{$ifndef NLARGEFILE}
{$if defined(MATLAB_MEX_FILE) || defined(MATHWORKS)}
{ RBio is being compiled as a MATLAB mexFunction, or for use in MATLAB  }
{$include "io64.h"}
{$else}
{ RBio is being compiled in a stand-alone library  }
{$undef  _LARGEFILE64_SOURCE}
{$define _LARGEFILE64_SOURCE}
{$undef  _FILE_OFFSET_BITS}

const
  _FILE_OFFSET_BITS = 64;  
{$endif}
{$endif}
{ --------------------------------------------------------------------------  }
{ include files  }
{ --------------------------------------------------------------------------  }
{$include "SuiteSparse_config.h"}
{ --------------------------------------------------------------------------  }
{ error codes  }
{ --------------------------------------------------------------------------  }
{ matrix is OK  }

const
  RBIO_OK = 0;  
{ data structure errors  }
{ column pointers are invalid  }
  RBIO_CP_INVALID = -(1);  
{ row indices are out of range  }
  RBIO_ROW_INVALID = -(2);  
{ duplicate entry  }
  RBIO_DUPLICATE = -(3);  
{ entries in upper tri part of sym matrix  }
  RBIO_EXTRANEOUS = -(4);  
{ matrix type (RUA, etc) invalid  }
  RBIO_TYPE_INVALID = -(5);  
{ matrix dimensions invalid  }
  RBIO_DIM_INVALID = -(6);  
{ matrix contains unsorted columns  }
  RBIO_JUMBLED = -(7);  
{ input arguments invalid  }
  RBIO_ARG_ERROR = -(8);  
{ out of memory  }
  RBIO_OUT_OF_MEMORY = -(9);  
{ mkind is invalid  }
  RBIO_MKIND_INVALID = -(10);  
{ finite-element form unsupported  }
  RBIO_UNSUPPORTED = -(11);  
{ I/O errors  }
{ I/O error: header  }
  RBIO_HEADER_IOERROR = -(91);  
{ I/O error: column pointers  }
  RBIO_CP_IOERROR = -(92);  
{ I/O error: row indices  }
  RBIO_ROW_IOERROR = -(93);  
{ I/O error: numerical values  }
  RBIO_VALUE_IOERROR = -(94);  
{ I/O error: cannot read/write the file  }
  RBIO_FILE_IOERROR = -(95);  
  RBIO_DATE = 'Jan 10, 2024';  
  RBIO_MAIN_VERSION = 4;  
  RBIO_SUB_VERSION = 3;  
  RBIO_SUBSUB_VERSION = 1;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function RBIO_VER_CODE(main,sub : longint) : longint;

{ was #define dname def_expr }
function RBIO_VERSION : longint; { return type might be wrong }

{ --------------------------------------------------------------------------  }
{ user-callable functions  }
{ --------------------------------------------------------------------------  }
{
    RBread:         read a Rutherford/Boeing matrix from a file
    RBwrite:        write a matrix to a file in R/B format

    RBkind:         determine the matrix type (RUA, RSA, etc)
    RBreadraw:      read the raw contents of a R/B file

    RBget_entry:    get a single numerical value from a matrix
    RBput_entry:    put a single numerical value into a matrix

    RBmalloc:       malloc-wrapper for RBio
    RBfree:         free-wrapper for RBio
    RBok:           test the validity of a sparse matrix

    Each function comes in two versions: one with int32_t integers, the other
    with int64_t integers.  The default type is int64_t.  Functions for int32_t
    integers have the _i suffix appended to their names.
 }
{ C++ extern C conditionnal removed }
{ 0: OK, < 0: error, > 0: warning  }
{ input  }
{ A is nrow-by-ncol  }
{ Ap [0...ncol]: column pointers  }
{ Ai [0...nnz-1]: row indices  }
{ Ax [0...nnz-1]: real values.  Az holds imaginary part  }
{ if real, Az is NULL. if complex, Az is non-NULL  }
{ 0:R, 1:P: 2:Csplit, 3:I, 4:Cmerged  }
{ output  }
{ 0:R, 1:P: 2:Csplit, 3:I, 4:Cmerged  }
{ r: -1 (rectangular), u: 0 (unsymmetric), s: 1 symmetric,
                       h: 2 (Hermitian), z: 3 (skew symmetric)  }
{ rua, psa, rra, cha, etc  }
{ smallest value  }
{ largest value  }
{ workspace: allocated internally if NULL  }
{ workspace of size ncol+1, undefined on input and output }
function RBkind_i(nrow:Tint32_t; ncol:Tint32_t; Ap:Pint32_t; Ai:Pint32_t; Ax:Pdouble; 
           Az:Pdouble; mkind_in:Tint32_t; mkind:Pint32_t; skind:Pint32_t; mtype:array[0..3] of char; 
           xmin:Pdouble; xmax:Pdouble; cp:Pint32_t):longint;cdecl;external libxxxxx;
function RBkind(nrow:Tint64_t; ncol:Tint64_t; Ap:Pint64_t; Ai:Pint64_t; Ax:Pdouble; 
           Az:Pdouble; mkind_in:Tint64_t; mkind:Pint64_t; skind:Pint64_t; mtype:array[0..3] of char; 
           xmin:Pdouble; xmax:Pdouble; cp:Pint64_t):longint;cdecl;external libxxxxx;
{ 0: OK, < 0: error, > 0: warning  }
{ input  }
{ file to read from  }
{ if true, construct upper part for sym. matrices  }
{ 0: do nothing, 1: prune zeros, 2: extract zeros  }
{ output  }
{ RUA, RSA, PUA, PSA, RRA, etc  }
{ A is nrow-by-ncol  }
{ R: 0, P: 1, C: 2, I: 3  }
{ R: -1, U: 0, S: 1, H: 2, Z: 3  }
{ Ai array has size asize*sizeof(double)  }
{ number of explicit zeros removed from A  }
{ output: these are malloc'ed below and must be freed by the caller  }
{ column pointers of A  }
{ row indices of A  }
{ real values (ignored if NULL) of A  }
{ imaginary values (ignored if NULL) of A  }
{ column pointers of Z  }
{ row indices of Z  }
function RBread_i(filename:Pchar; build_upper:Tint32_t; zero_handling:Tint32_t; title:array[0..72] of char; key:array[0..8] of char; 
           mtype:array[0..3] of char; nrow:Pint32_t; ncol:Pint32_t; mkind:Pint32_t; skind:Pint32_t; 
           asize:Pint32_t; znz:Pint32_t; Ap:PPint32_t; Ai:PPint32_t; Ax:PPdouble; 
           Az:PPdouble; Zp:PPint32_t; Zi:PPint32_t):longint;cdecl;external libxxxxx;
function RBread(filename:Pchar; build_upper:Tint64_t; zero_handling:Tint64_t; title:array[0..72] of char; key:array[0..8] of char; 
           mtype:array[0..3] of char; nrow:Pint64_t; ncol:Pint64_t; mkind:Pint64_t; skind:Pint64_t; 
           asize:Pint64_t; znz:Pint64_t; Ap:PPint64_t; Ai:PPint64_t; Ax:PPdouble; 
           Az:PPdouble; Zp:PPint64_t; Zi:PPint64_t):longint;cdecl;external libxxxxx;
{ 0: OK, < 0: error, > 0: warning  }
{ input  }
{ file to read from  }
{ output  }
{ RUA, RSA, PUA, PSA, RRA, etc  }
{ A is nrow-by-ncol  }
{ size of Ai  }
{ 0:R, 1:P: 2:Csplit, 3:I, 4:Cmerged  }
{ R: -1, U: 0, S: 1, H: 2, Z: 3  }
{ 0:__A, 1:__E  }
{ size of Ax  }
{ output: these are malloc'ed below and must be freed by the caller  }
{ size ncol+1, column pointers of A  }
{ size nnz, row indices of A  }
{ size xsize, numerical values of A  }
function RBreadraw_i(filename:Pchar; title:array[0..72] of char; key:array[0..8] of char; mtype:array[0..3] of char; nrow:Pint32_t; 
           ncol:Pint32_t; nnz:Pint32_t; nelnz:Pint32_t; mkind:Pint32_t; skind:Pint32_t; 
           fem:Pint32_t; xsize:Pint32_t; p_Ap:PPint32_t; p_Ai:PPint32_t; p_Ax:PPdouble):longint;cdecl;external libxxxxx;
function RBreadraw(filename:Pchar; title:array[0..72] of char; key:array[0..8] of char; mtype:array[0..3] of char; nrow:Pint64_t; 
           ncol:Pint64_t; nnz:Pint64_t; nelnz:Pint64_t; mkind:Pint64_t; skind:Pint64_t; 
           fem:Pint64_t; xsize:Pint64_t; p_Ap:PPint64_t; p_Ai:PPint64_t; p_Ax:PPdouble):longint;cdecl;external libxxxxx;
{ 0:OK, < 0: error, > 0: warning  }
{ input  }
{ filename to write to (stdout if NULL)  }
{ title (72 char max), may be NULL  }
{ key (8 char max), may be NULL  }
{ A is nrow-by-ncol  }
{ size ncol+1, column pointers  }
{ size anz=Ap[ncol], row indices (sorted)  }
{ size anz or 2*anz, numerical values (binary if NULL)  }
{ size anz, imaginary part (real if NULL)  }
{ size ncol+1, column pointers for Z (or NULL)  }
{ size znz=Zp[ncol], row indices for Z (or NULL)  }
{ 0:R, 1:P: 2:Csplit, 3:I, 4:Cmerged  }
{ output  }
{ matrix type (RUA, RSA, etc), may be NULL  }
function RBwrite_i(filename:Pchar; title:Pchar; key:Pchar; nrow:Tint32_t; ncol:Tint32_t; 
           Ap:Pint32_t; Ai:Pint32_t; Ax:Pdouble; Az:Pdouble; Zp:Pint32_t; 
           Zi:Pint32_t; mkind_in:Tint32_t; mtype:array[0..3] of char):longint;cdecl;external libxxxxx;
function RBwrite(filename:Pchar; title:Pchar; key:Pchar; nrow:Tint64_t; ncol:Tint64_t; 
           Ap:Pint64_t; Ai:Pint64_t; Ax:Pdouble; Az:Pdouble; Zp:Pint64_t; 
           Zi:Pint64_t; mkind_in:Tint64_t; mtype:array[0..3] of char):longint;cdecl;external libxxxxx;
{ R: 0, P: 1, C: 2, I: 3  }
{ real part, or both if merged-complex  }
{ imaginary part if split-complex  }
{ index of the entry  }
{ real part  }
{ imaginary part  }
procedure RBget_entry_i(mkind:Tint32_t; Ax:Pdouble; Az:Pdouble; p:Tint32_t; xr:Pdouble; 
            xz:Pdouble);cdecl;external libxxxxx;
procedure RBget_entry(mkind:Tint64_t; Ax:Pdouble; Az:Pdouble; p:Tint64_t; xr:Pdouble; 
            xz:Pdouble);cdecl;external libxxxxx;
{ R: 0, P: 1, C: 2, I: 3  }
{ real part, or both if merged-complex  }
{ imaginary part if split-complex  }
{ index of the entry  }
{ real part  }
{ imaginary part  }
procedure RBput_entry_i(mkind:Tint32_t; Ax:Pdouble; Az:Pdouble; p:Tint32_t; xr:Tdouble; 
            xz:Tdouble);cdecl;external libxxxxx;
procedure RBput_entry(mkind:Tint64_t; Ax:Pdouble; Az:Pdouble; p:Tint64_t; xr:Tdouble; 
            xz:Tdouble);cdecl;external libxxxxx;
{ 0:OK, < 0: error, > 0: warning  }
{ inputs, not modified  }
{ number of rows  }
{ number of columns  }
{ max # of entries  }
{ size ncol+1, column pointers  }
{ size nz = Ap [ncol], row indices  }
{ real part, or both if merged-complex  }
{ imaginary part for split-complex  }
{ logical matrices (useful for MATLAB caller only)  }
{ 0:real, 1:logical/pattern, 2:split-complex, 3:integer,
                           4:merged-complex  }
{ outputs, not defined on input  }
{ # of jumbled row indices (-1 if not computed)  }
{ number of explicit zeros (-1 if not computed)  }
function RBok_i(nrow:Tint32_t; ncol:Tint32_t; nzmax:Tint32_t; Ap:Pint32_t; Ai:Pint32_t; 
           Ax:Pdouble; Az:Pdouble; As:Pchar; mkind:Tint32_t; p_njumbled:Pint32_t; 
           p_nzeros:Pint32_t):longint;cdecl;external libxxxxx;
function RBok(nrow:Tint64_t; ncol:Tint64_t; nzmax:Tint64_t; Ap:Pint64_t; Ai:Pint64_t; 
           Ax:Pdouble; Az:Pdouble; As:Pchar; mkind:Tint64_t; p_njumbled:Pint64_t; 
           p_nzeros:Pint64_t):longint;cdecl;external libxxxxx;
{$ifdef MATLAB_MEX_FILE}
procedure RBerror(status:longint);cdecl;external libxxxxx;
{ only for MATLAB mexFunctions  }
{$endif}

procedure RBio_version(version:array[0..2] of longint);cdecl;external libxxxxx;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 4-11-25 19:29:22 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function RBIO_VER_CODE(main,sub : longint) : longint;
begin
  RBIO_VER_CODE:=SUITESPARSE_VER_CODE(main,sub);
end;

{ was #define dname def_expr }
function RBIO_VERSION : longint; { return type might be wrong }
  begin
    RBIO_VERSION:=RBIO_VER_CODE(4,3);
  end;


end.
