unit gsl_sf_mathieu;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_mathieu.h
 * 
 * Copyright (C) 2002 Lowell Johnson
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  }
{ Author:  L. Johnson  }
{$ifndef __GSL_SF_MATHIEU_H__}
{$define __GSL_SF_MATHIEU_H__}
{$include <gsl/gsl_sf_result.h>}
{$include <gsl/gsl_eigen.h>}

const
  GSL_SF_MATHIEU_COEFF = 100;  
{ allow for caching of results: not implemented yet  }
{ allow for caching of results: not implemented yet  }
type
  Pgsl_sf_mathieu_workspace = ^Tgsl_sf_mathieu_workspace;
  Tgsl_sf_mathieu_workspace = record
      size : Tsize_t;
      even_order : Tsize_t;
      odd_order : Tsize_t;
      extra_values : longint;
      qa : Tdouble;
      qb : Tdouble;
      aa : Pdouble;
      bb : Pdouble;
      dd : Pdouble;
      ee : Pdouble;
      tt : Pdouble;
      e2 : Pdouble;
      zz : Pdouble;
      eval : Pgsl_vector;
      evec : Pgsl_matrix;
      wmat : Pgsl_eigen_symmv_workspace;
    end;
{ Compute an array of characteristic (eigen) values from the recurrence
   matrices for the Mathieu equations.  }

function gsl_sf_mathieu_a_array(order_min:longint; order_max:longint; qq:Tdouble; work:Pgsl_sf_mathieu_workspace; result_array:Pdouble):longint;cdecl;external libgsl;
function gsl_sf_mathieu_b_array(order_min:longint; order_max:longint; qq:Tdouble; work:Pgsl_sf_mathieu_workspace; result_array:Pdouble):longint;cdecl;external libgsl;
{ Compute the characteristic value for a Mathieu function of order n and
   type ntype.  }
function gsl_sf_mathieu_a_e(order:longint; qq:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_mathieu_a(order:longint; qq:Tdouble):Tdouble;cdecl;external libgsl;
function gsl_sf_mathieu_b_e(order:longint; qq:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_mathieu_b(order:longint; qq:Tdouble):Tdouble;cdecl;external libgsl;
{ Compute the Fourier coefficients for a Mathieu function.  }
function gsl_sf_mathieu_a_coeff(order:longint; qq:Tdouble; aa:Tdouble; coeff:Pdouble):longint;cdecl;external libgsl;
function gsl_sf_mathieu_b_coeff(order:longint; qq:Tdouble; aa:Tdouble; coeff:Pdouble):longint;cdecl;external libgsl;
{ Allocate computational storage space for eigenvalue solution.  }
function gsl_sf_mathieu_alloc(nn:Tsize_t; qq:Tdouble):Pgsl_sf_mathieu_workspace;cdecl;external libgsl;
procedure gsl_sf_mathieu_free(workspace:Pgsl_sf_mathieu_workspace);cdecl;external libgsl;
{ Compute an angular Mathieu function.  }
function gsl_sf_mathieu_ce_e(order:longint; qq:Tdouble; zz:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_mathieu_ce(order:longint; qq:Tdouble; zz:Tdouble):Tdouble;cdecl;external libgsl;
function gsl_sf_mathieu_se_e(order:longint; qq:Tdouble; zz:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_mathieu_se(order:longint; qq:Tdouble; zz:Tdouble):Tdouble;cdecl;external libgsl;
function gsl_sf_mathieu_ce_array(nmin:longint; nmax:longint; qq:Tdouble; zz:Tdouble; work:Pgsl_sf_mathieu_workspace; 
           result_array:Pdouble):longint;cdecl;external libgsl;
function gsl_sf_mathieu_se_array(nmin:longint; nmax:longint; qq:Tdouble; zz:Tdouble; work:Pgsl_sf_mathieu_workspace; 
           result_array:Pdouble):longint;cdecl;external libgsl;
{ Compute a radial Mathieu function.  }
function gsl_sf_mathieu_Mc_e(kind:longint; order:longint; qq:Tdouble; zz:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_mathieu_Mc(kind:longint; order:longint; qq:Tdouble; zz:Tdouble):Tdouble;cdecl;external libgsl;
function gsl_sf_mathieu_Ms_e(kind:longint; order:longint; qq:Tdouble; zz:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_mathieu_Ms(kind:longint; order:longint; qq:Tdouble; zz:Tdouble):Tdouble;cdecl;external libgsl;
function gsl_sf_mathieu_Mc_array(kind:longint; nmin:longint; nmax:longint; qq:Tdouble; zz:Tdouble; 
           work:Pgsl_sf_mathieu_workspace; result_array:Pdouble):longint;cdecl;external libgsl;
function gsl_sf_mathieu_Ms_array(kind:longint; nmin:longint; nmax:longint; qq:Tdouble; zz:Tdouble; 
           work:Pgsl_sf_mathieu_workspace; result_array:Pdouble):longint;cdecl;external libgsl;
{$endif}
{ !__GSL_SF_MATHIEU_H__  }

// === Konventiert am: 22-8-25 13:58:44 ===


implementation



end.
