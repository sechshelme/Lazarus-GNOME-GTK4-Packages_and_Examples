
unit Lattice;
interface

{
  Automatically converted by H2Pas 1.0.0 from Lattice.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Lattice.h
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
PFILE  = ^FILE;
PLattice  = ^Lattice;
PLatticeUnion  = ^LatticeUnion;
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
{$ifndef _Lattice_h_}
{$define _Lattice_h_}

procedure AffineHermite(A:PLattice; H:PPLattice; U:PPMatrix);cdecl;external;
procedure AffineSmith(A:PLattice; U:PPLattice; V:PPLattice; Diag:PPLattice);cdecl;external;
function ChangeLatticeDimension(A:PLattice; dimension:longint):PLattice;cdecl;external;
function EmptyLattice(dimension:longint):PLattice;cdecl;external;
function ExtractLinearPart(A:PLattice):PLattice;cdecl;external;
function FindHermiteBasisofDomain(A:PPolyhedron; B:PPMatrix):longint;cdecl;external;
function Homogenise(A:PLattice; Forward:TBool):PLattice;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function intcompare(a:pointer; b:pointer):longint;cdecl;external;
function isEmptyLattice(A:PLattice):TBool;cdecl;external;
function isfulldim(m:PMatrix):TBool;cdecl;external;
function IsLattice(m:PMatrix):TBool;cdecl;external;
function isLinear(A:PLattice):TBool;cdecl;external;
function LatticeDifference(A:PLattice; B:PLattice):PLatticeUnion;cdecl;external;
function LatticeImage(A:PLattice; M:PMatrix):PLattice;cdecl;external;
function LatticeIncludes(A:PLattice; B:PLattice):TBool;cdecl;external;
function LatticeIntersection(X:PLattice; Y:PLattice):PLattice;cdecl;external;
function LatticePreimage(L:PLattice; G:PMatrix):PLattice;cdecl;external;
function LatticeSimplify(latlist:PLatticeUnion):PLatticeUnion;cdecl;external;
function LatticeUnion_Alloc:PLatticeUnion;cdecl;external;
procedure LatticeUnion_Free(Head:PLatticeUnion);cdecl;external;
procedure PrintLatticeUnion(fp:PFILE; format:Pchar; Head:PLatticeUnion);cdecl;external;
function sameAffinepart(A:PLattice; B:PLattice):TBool;cdecl;external;
function sameLattice(A:PLattice; B:PLattice):TBool;cdecl;external;
function Lattice2LatticeUnion(X:PLattice; Y:PLattice):PLatticeUnion;cdecl;external;
{$endif}
{ _Lattice_h_  }

implementation


end.
