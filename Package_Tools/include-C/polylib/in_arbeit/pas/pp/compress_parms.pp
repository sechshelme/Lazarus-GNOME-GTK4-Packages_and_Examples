
unit compress_parms;
interface

{
  Automatically converted by H2Pas 1.0.0 from compress_parms.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    compress_parms.h
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
Pdword  = ^dword;
PMatrix  = ^Matrix;
PPolyhedron  = ^Polyhedron;
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
 * @author B. Meister 12/2003-2006
 * LSIIT -ICPS 
 * UMR 7005 CNRS
 * Louis Pasteur University (ULP), Strasbourg, France
  }
{$ifndef __BM_COMPRESS_PARMS_H__}
{$define __BM_COMPRESS_PARMS_H__}
{$include "matrix_addon.h"}
{$include "matrix_permutations.h"}
{$include <assert.h>}
{ ----- functions applying on equalities -----  }
{* 
 * Given a system of non-redundant equalities, looks if it has an integer
 * solution in the combined space, and if yes, returns one solution.
  }

procedure Equalities_integerSolution(Eqs:PMatrix; sol:PPMatrix);cdecl;external;
{* 
 * Computes the validity lattice of a set of equalities. I.e., the lattice
 * induced on the last <tt>b</tt> variables by the equalities involving the
 * first <tt>a</tt> integer existential variables.
  }
procedure Equalities_validityLattice(Eqs:PMatrix; a:longint; vl:PPMatrix);cdecl;external;
{* 
 * Given an integer matrix B with m rows and integer m-vectors C and d,
 * computes the basis of the integer solutions to (BN+C) mod d = 0 (1).
 * This is an affine lattice (G): (N 1)^T= G(N' 1)^T, forall N' in Z^b.
 * If there is no solution, returns NULL.
 }
procedure Equalities_intModBasis(B:PMatrix; C:PMatrix; d:PMatrix; imb:PPMatrix);cdecl;external;
{ ----- functions applying on constraints -----  }
{*
 * Eliminates all the equalities in a set of constraints and returns the set of
 * constraints defining a full-dimensional polyhedron, such that there is a
 * bijection between integer points of the original polyhedron and these of the
 * resulting (projected) polyhedron).
  }
procedure Constraints_fullDimensionize(M:PPMatrix; C:PPMatrix; VL:PPMatrix; Eqs:PPMatrix; ParmEqs:PPMatrix; 
            elimVars:PPdword; elimParms:PPdword; maxRays:longint);cdecl;external;
{ extracts equalities involving only parameters  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Constraints_removeParmEqs(a,b,c,d : longint) : longint;

function Constraints_Remove_parm_eqs(M:PPMatrix; Ctxt:PPMatrix; renderSpace:longint; elimParms:PPdword):PMatrix;cdecl;external;
{*
 * Eliminates the columns corresponding to a list of eliminated parameters.
  }
procedure Constraints_removeElimCols(M:PMatrix; nbVars:dword; elimParms:Pdword; newM:PPMatrix);cdecl;external;
{ ----- function applying on a lattice -----  }
{*
 * Given a matrix that defines a full-dimensional affine lattice, returns the 
 * affine sub-lattice spanned in the k first dimensions.
 * Useful for instance when you only look for the parameters' validity lattice.
  }
procedure Lattice_extractSubLattice(lat:PMatrix; k:dword; subLat:PPMatrix);cdecl;external;
{ ----- functions applying on a polyhedron -----  }
function Polyhedron_Remove_parm_eqs(P:PPPolyhedron; C:PPPolyhedron; renderSpace:longint; elimParms:PPdword; maxRays:longint):PPolyhedron;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Polyhedron_removeParmEqs(a,b,c,d,e : longint) : longint;

{ ----- functions kept for backwards compatibility -----  }
{* 
 * given a full-row-rank nxm matrix M(made of row-vectors), 
 * computes the basis K (made of n-m column-vectors) of the integer kernel of M
 * so we have: M.K = 0
 }
function int_ker(M:PMatrix):PMatrix;cdecl;external;
{ given a matrix of m parameterized equations, compress the parameters and
 transform the variable space into a n-m space.  }
(* Const before declarator ignored *)
function full_dimensionize(M:PMatrix; nb_parms:longint; Validity_Lattice:PPMatrix):PMatrix;cdecl;external;
{ Compute the overall period of the variables I for (MI) mod |d|,
 where M is a matrix and |d| a vector
 Produce a diagonal matrix S = (s_k) where s_k is the overall period of i_k  }
function affine_periods(M:PMatrix; d:PMatrix):PMatrix;cdecl;external;
{ given a matrix B' with m rows and m-vectors C' and d, computes the 
 basis of the integer solutions to (B'N+C') mod d = 0.
returns NULL if there is no integer solution  }
function int_mod_basis(Bp:PMatrix; Cp:PMatrix; d:PMatrix):PMatrix;cdecl;external;
{ given a parameterized constraints matrix with m equalities, computes the
 compression matrix C such that there is an integer solution in the variables
 space for each value of N', with N = Cmp N' (N are the original parameters)  }
function compress_parms(E:PMatrix; nb_parms:longint):PMatrix;cdecl;external;
{$endif}
{ __BM_COMPRESS_PARMS_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Constraints_removeParmEqs(a,b,c,d : longint) : longint;
begin
  Constraints_removeParmEqs:=Constraints_Remove_parm_eqs(a,b,c,d);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Polyhedron_removeParmEqs(a,b,c,d,e : longint) : longint;
begin
  Polyhedron_removeParmEqs:=Polyhedron_Remove_parm_eqs(a,b,c,d,e);
end;


end.
