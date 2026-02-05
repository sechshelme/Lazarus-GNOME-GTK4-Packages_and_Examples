
unit matrix_addon;
interface

{
  Automatically converted by H2Pas 1.0.0 from matrix_addon.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    matrix_addon.h
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
PMatrix  = ^Matrix;
PPolyhedron  = ^Polyhedron;
PValue  = ^Value;
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
 * Polylib matrix addons
 * Mainly, deals with polyhedra represented in implicit form (set of
 * constraints).
 * @author Benoit Meister 
  }
{$ifndef __BM_MATRIX_ADDON_H__}
{$define __BM_MATRIX_ADDON_H__}
{$include<polylib/polylib.h>}
{$include<assert.h>}
{* Shortcut for Matrix_Print  }
{ Creates a view of the constraints of a polyhedron as a Matrix *  }

function constraintsView(P:PPolyhedron):PMatrix;cdecl;external;
{ "Frees" a view of the constraints of a polyhedron  }
procedure constraintsView_Free(M:PMatrix);cdecl;external;
{ splits a matrix of constraints M into a matrix of equalities Eqs and a
   matrix of inequalities Ineqs allocs the new matrices.  }
(* Const before declarator ignored *)
procedure split_constraints(M:PMatrix; Eqs:PPMatrix; Ineqs:PPMatrix);cdecl;external;
{ returns the dim-dimensional identity matrix  }
function Identity_Matrix(dim:dword):PMatrix;cdecl;external;
procedure Matrix_identity(dim:dword; I:PPMatrix);cdecl;external;
{ given a n x n integer transformation matrix transf, compute its inverse M/g,
 where M is a nxn integer matrix.  g is a common denominator for elements of
 (transf^-1) }
procedure mtransformation_inverse(transf:PMatrix; inv:PPMatrix; g:PValue);cdecl;external;
{ simplifies a matrix seen as a polyhedron, by dividing its rows by the gcd of
their elements.  }
procedure mpolyhedron_simplify(polyh:PMatrix);cdecl;external;
{ inflates a polyhedron (represented as a matrix) P, so that the apx of its
   Ehrhart Polynomial is an upper bound of the Ehrhart polynomial of P WARNING:
   this inflation is supposed to be applied on full-dimensional polyhedra.  }
procedure mpolyhedron_inflate(polyh:PMatrix; nb_parms:dword);cdecl;external;
{ deflates a polyhedron (represented as a matrix) P, so that the apx of its
   Ehrhart Polynomial is a lower bound of the Ehrhart polynomial of P WARNING:
   this deflation is supposed to be applied on full-dimensional polyhedra.  }
procedure mpolyhedron_deflate(polyh:PMatrix; nb_parms:dword);cdecl;external;
{ use an eliminator row to eliminate a variable in a victim row (without
changing the sign of the victim row -> important if it is an inequality).   }
procedure eliminate_var_with_constr(Eliminator:PMatrix; eliminator_row:dword; Victim:PMatrix; victim_row:dword; var_to_elim:dword);cdecl;external;
{ ----- PARTIAL MAPPINGS -----  }
{ compresses the last vars/pars of the polyhedron M expressed as a polylib
   matrix
 - adresses the full-rank compressions only
 - modfies M  }
procedure mpolyhedron_compress_last_vars(M:PMatrix; compression:PMatrix);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Constraints_compressLastVars(a,b : longint) : longint;

{ uses a set of m equalities Eqs to eliminate m variables in the polyhedron.
 Ineqs represented as a matrix eliminates the m first variables 
- assumes that Eqs allows to eliminate the m equalities 
- modifies Ineqs  }
function mpolyhedron_eliminate_first_variables(Eqs:PMatrix; Ineqs:PMatrix):dword;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Constraints_eliminateFirstVars(a,b : longint) : longint;

{* returns a contiguous submatrix of a matrix.  }
procedure Matrix_subMatrix(M:PMatrix; sr:dword; sc:dword; nbR:dword; nbC:dword; 
            sub:PPMatrix);cdecl;external;
{*
 * Cloning function. Similar to Matrix_Copy() but allocates the target matrix
 * if it is set to NULL.
  }
procedure Matrix_clone(M:PMatrix; Cl:PPMatrix);cdecl;external;
{*
 * Copies a contiguous submatrix of M1 into M2, at the indicated position.
 * M1 and M2 are assumed t be allocated already.
  }
procedure Matrix_copySubMatrix(M1:PMatrix; sr1:dword; sc1:dword; nbR:dword; nbC:dword; 
            M2:PMatrix; sr2:dword; sc2:dword);cdecl;external;
{* 
 * given a matrix M into -M
  }
procedure Matrix_oppose(M:PMatrix);cdecl;external;
{$endif}
{ __BM_MATRIX_ADDON_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Constraints_compressLastVars(a,b : longint) : longint;
begin
  Constraints_compressLastVars:=mpolyhedron_compress_last_vars(a,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Constraints_eliminateFirstVars(a,b : longint) : longint;
begin
  Constraints_eliminateFirstVars:=mpolyhedron_eliminate_first_variables(a,b);
end;


end.
