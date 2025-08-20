unit gsl_spmatrix;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef __GSL_SPMATRIX_H__}
{$define __GSL_SPMATRIX_H__}
{ coordinate/triplet representation  }
{ compressed sparse column  }
{ compressed sparse row  }
type
  Txxxxx =  Longint;
  Const
    GSL_SPMATRIX_COO = 0;
    GSL_SPMATRIX_CSC = 1;
    GSL_SPMATRIX_CSR = 2;
    GSL_SPMATRIX_TRIPLET = GSL_SPMATRIX_COO;
    GSL_SPMATRIX_CCS = GSL_SPMATRIX_CSC;
    GSL_SPMATRIX_CRS = GSL_SPMATRIX_CSR;

{ memory pool for binary tree node allocation  }
{ pointer to memory block, of size n*tree_node_size  }
{ pointer to next available slot  }
type
  Pgsl_spmatrix_pool_node = ^Tgsl_spmatrix_pool_node;
  Tgsl_spmatrix_pool_node = record
      next : Pgsl_spmatrix_pool_node;
      block_ptr : pointer;
      free_slot : Pbyte;
    end;

  Tgsl_spmatrix_pool_node = Tgsl_spmatrix_pool;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GSL_SPMATRIX_ISCOO(m : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_SPMATRIX_ISCSC(m : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_SPMATRIX_ISCSR(m : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_SPMATRIX_ISTRIPLET(m : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_SPMATRIX_ISCCS(m : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_SPMATRIX_ISCRS(m : longint) : longint;

{ allow size of matrix to grow as elements are added  }
const
  GSL_SPMATRIX_FLG_GROW = 1 shl 0;  
{ sparsity pattern is fixed  }
  GSL_SPMATRIX_FLG_FIXED = 1 shl 1;  
{ compare matrix entries (ia,ja) and (ib,jb) - sort by rows first, then by columns  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GSL_SPMATRIX_COMPARE_ROWCOL(m,ia,ja,ib,jb : longint) : longint;

{ common/utility functions  }
procedure gsl_spmatrix_cumsum(n:Tsize_t; c:Plongint);cdecl;external libgsl;
{$include <gsl/gsl_spmatrix_complex_long_double.h>}
{$include <gsl/gsl_spmatrix_complex_double.h>}
{$include <gsl/gsl_spmatrix_complex_float.h>}
{$include <gsl/gsl_spmatrix_long_double.h>}
{$include <gsl/gsl_spmatrix_double.h>}
{$include <gsl/gsl_spmatrix_float.h>}
{$include <gsl/gsl_spmatrix_ulong.h>}
{$include <gsl/gsl_spmatrix_long.h>}
{$include <gsl/gsl_spmatrix_uint.h>}
{$include <gsl/gsl_spmatrix_int.h>}
{$include <gsl/gsl_spmatrix_ushort.h>}
{$include <gsl/gsl_spmatrix_short.h>}
{$include <gsl/gsl_spmatrix_uchar.h>}
{$include <gsl/gsl_spmatrix_char.h>}
{$endif}
{ __GSL_SPMATRIX_H__  }

// === Konventiert am: 20-8-25 17:32:48 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_SPMATRIX_ISCOO(m : longint) : longint;
begin
  GSL_SPMATRIX_ISCOO:=(m^.sptype)=GSL_SPMATRIX_COO;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_SPMATRIX_ISCSC(m : longint) : longint;
begin
  GSL_SPMATRIX_ISCSC:=(m^.sptype)=GSL_SPMATRIX_CSC;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_SPMATRIX_ISCSR(m : longint) : longint;
begin
  GSL_SPMATRIX_ISCSR:=(m^.sptype)=GSL_SPMATRIX_CSR;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_SPMATRIX_ISTRIPLET(m : longint) : longint;
begin
  GSL_SPMATRIX_ISTRIPLET:=GSL_SPMATRIX_ISCOO(m);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_SPMATRIX_ISCCS(m : longint) : longint;
begin
  GSL_SPMATRIX_ISCCS:=GSL_SPMATRIX_ISCSC(m);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_SPMATRIX_ISCRS(m : longint) : longint;
begin
  GSL_SPMATRIX_ISCRS:=GSL_SPMATRIX_ISCSR(m);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_SPMATRIX_COMPARE_ROWCOL(m,ia,ja,ib,jb : longint) : longint;
var
   if_local1, if_local2, if_local3 : longint;
(* result types are not known *)
begin
  if jb then
    if_local1:=-(1)
  else
    if_local1:=ja>jb;
  if ib then
    if_local2:=1
  else
    if_local2:=ja<(if_local1);
  if ib then
    if_local3:=-(1)
  else
    if_local3:=ia>(if_local2);
  GSL_SPMATRIX_COMPARE_ROWCOL:=ia<(if_local3);
end;


end.
