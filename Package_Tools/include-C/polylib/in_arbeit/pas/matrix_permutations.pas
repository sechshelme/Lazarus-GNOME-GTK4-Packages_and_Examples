unit matrix_permutations;

interface

uses
  fp_polylib64, types, arithmetique;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    This file is part of PolyLib.

    PolyLib is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    PolyLib is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with PolyLib.  If not, see <http://www.gnu.org/licenses/>.
 }
{*
 * Permutations on matrices
 * Matrices are seen either as transformations (mtransformation) or as
 * polyhedra (mpolyhedron or Constraints).
 * @author B. Meister
  }
{$ifndef __BM_MATRIX_PERMUTATIONS_H__}
{$define __BM_MATRIX_PERMUTATIONS_H__}
{$include<polylib/polylib.h>}
{$include<assert.h>}
{ Permutations here are vectors that give the future position for each
   variable  }
{ utility function : bit count  }

function nb_bits(x:qword):dword;cdecl;external libpolylib;
{ gives the inverse permutation vector of a permutation vector  }
function permutation_inverse(perm:Pdword; nb_elems:dword):Pdword;cdecl;external libpolylib;
{
 * Given a linear tranformation on initial variables, and a variable
 * permutation, compute the tranformation for the permuted variables.  perm is
 * a vector giving the new "position of the k^th variable, k \in [1..n] we can
 * call it a "permutation vector" if you wish transf[x][y] ->
 * permuted[permutation(x)][permutation(y)]
  }
function mtransformation_permute(transf:PMatrix; permutation:Pdword):PMatrix;cdecl;external libpolylib;
{ permutes the variables of a matrix seen as a polyhedron  }
function mpolyhedron_permute(polyh:PMatrix; permutation:Pdword):PMatrix;cdecl;external libpolylib;
{ permutes the variables of a matrix seen as a polyhedron  }
procedure Constraints_permute(C:PMatrix; perm:Pdword; Cp:PPMatrix);cdecl;external libpolylib;
{* Given a set of <i>equalities</i>, find a set of variables that can be
 * eliminated using these equalities.  The variables that we agree to eliminate
 * are in a zone of contiguous variables (or parameters).  <p>
 * Notes: 
 <ul>
 <li>brute force, surely enhanceable algorithm</li>
 <li>limited number of variables in the zone: limit = bitwidth of long long
 </ul>
 * @param Eqs the matrix of equalities.
 * @param start the rank of the first variable (inclusive) of the zone in Eqs
 * @param end the rank of the last variable (inclusive) of the zone
 * return a bitfield where bits set to one define the variables to eliminate
 }
function eliminable_vars(Eqs:PMatrix; start:dword; end:dword):qword;cdecl;external libpolylib;
{
* find a valid permutation : for a set of m equations, find m variables that
* will be put at the beginning (to be eliminated) it must be possible to
* eliminate these variables : the submatrix built with their columns must be
* full-rank.  brute force method, that tests all the combinations until finding
* one which works.  
* <b>LIMITATIONS</b> : up to x-1 variables, where the long long
* format is x-1 bits (often 64 in year 2005).  
 }
function find_a_permutation(Eqs:PMatrix; nb_parms:dword):Pdword;cdecl;external libpolylib;
{
* compute the permutation of variables and parameters, according to some
* variables to keep.  put the variables not to be kept at the beginning, then
* the parameters and finally the variables to be kept.  strongly related to the
* function compress_to_full_dim2
 }
function permutation_for_full_dim2(vars_to_keep:Pdword; nb_keep:dword; nb_vars_parms:dword; nb_parms:dword):Pdword;cdecl;external libpolylib;
{$endif}
{__BM_MATRIX_PERMUTATIONS_H__  }

// === Konventiert am: 5-2-26 19:36:09 ===


implementation



end.
