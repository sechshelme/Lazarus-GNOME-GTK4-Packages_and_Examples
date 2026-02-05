unit Lattice;

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
{$ifndef _Lattice_h_}
{$define _Lattice_h_}

procedure AffineHermite(A:PLattice; H:PPLattice; U:PPMatrix);cdecl;external libpolylib;
procedure AffineSmith(A:PLattice; U:PPLattice; V:PPLattice; Diag:PPLattice);cdecl;external libpolylib;
function ChangeLatticeDimension(A:PLattice; dimension:longint):PLattice;cdecl;external libpolylib;
function EmptyLattice(dimension:longint):PLattice;cdecl;external libpolylib;
function ExtractLinearPart(A:PLattice):PLattice;cdecl;external libpolylib;
function FindHermiteBasisofDomain(A:PPolyhedron; B:PPMatrix):longint;cdecl;external libpolylib;
function Homogenise(A:PLattice; Forward:TBool):PLattice;cdecl;external libpolylib;
function intcompare(a:pointer; b:pointer):longint;cdecl;external libpolylib;
function isEmptyLattice(A:PLattice):TBool;cdecl;external libpolylib;
function isfulldim(m:PMatrix):TBool;cdecl;external libpolylib;
function IsLattice(m:PMatrix):TBool;cdecl;external libpolylib;
function isLinear(A:PLattice):TBool;cdecl;external libpolylib;
function LatticeDifference(A:PLattice; B:PLattice):PLatticeUnion;cdecl;external libpolylib;
function LatticeImage(A:PLattice; M:PMatrix):PLattice;cdecl;external libpolylib;
function LatticeIncludes(A:PLattice; B:PLattice):TBool;cdecl;external libpolylib;
function LatticeIntersection(X:PLattice; Y:PLattice):PLattice;cdecl;external libpolylib;
function LatticePreimage(L:PLattice; G:PMatrix):PLattice;cdecl;external libpolylib;
function LatticeSimplify(latlist:PLatticeUnion):PLatticeUnion;cdecl;external libpolylib;
function LatticeUnion_Alloc:PLatticeUnion;cdecl;external libpolylib;
procedure LatticeUnion_Free(Head:PLatticeUnion);cdecl;external libpolylib;
procedure PrintLatticeUnion(fp:PFILE; format:Pchar; Head:PLatticeUnion);cdecl;external libpolylib;
function sameAffinepart(A:PLattice; B:PLattice):TBool;cdecl;external libpolylib;
function sameLattice(A:PLattice; B:PLattice):TBool;cdecl;external libpolylib;
function Lattice2LatticeUnion(X:PLattice; Y:PLattice):PLatticeUnion;cdecl;external libpolylib;
{$endif}
{ _Lattice_h_  }

// === Konventiert am: 5-2-26 19:36:00 ===


implementation



end.
