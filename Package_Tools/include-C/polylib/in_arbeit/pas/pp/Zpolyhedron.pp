
unit Zpolyhedron;
interface

{
  Automatically converted by H2Pas 1.0.0 from Zpolyhedron.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Zpolyhedron.h
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
PMatrix  = ^Matrix;
PPolyhedron  = ^Polyhedron;
PZPolyhedron  = ^ZPolyhedron;
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
{$ifndef _Zpolyhedron_h_}
{$define _Zpolyhedron_h_}

procedure CanonicalForm(Zpol:PZPolyhedron; Result:PPZPolyhedron; Basis:PPMatrix);cdecl;external;
function EmptyZPolyhedron(dimension:longint):PZPolyhedron;cdecl;external;
function IntegraliseLattice(A:PZPolyhedron):PZPolyhedron;cdecl;external;
function isEmptyZPolyhedron(Zpol:PZPolyhedron):TBool;cdecl;external;
function ZDomainDifference(A:PZPolyhedron; B:PZPolyhedron):PZPolyhedron;cdecl;external;
function ZDomainImage(A:PZPolyhedron; Func:PMatrix):PZPolyhedron;cdecl;external;
function ZDomainIncludes(A:PZPolyhedron; B:PZPolyhedron):TBool;cdecl;external;
function ZDomainIntersection(A:PZPolyhedron; B:PZPolyhedron):PZPolyhedron;cdecl;external;
function ZDomainPreimage(A:PZPolyhedron; Func:PMatrix):PZPolyhedron;cdecl;external;
(* Const before type ignored *)
procedure ZDomainPrint(fp:PFILE; format:Pchar; A:PZPolyhedron);cdecl;external;
function ZDomainSimplify(ZDom:PZPolyhedron):PZPolyhedron;cdecl;external;
function ZDomainUnion(A:PZPolyhedron; B:PZPolyhedron):PZPolyhedron;cdecl;external;
function ZDomain_Copy(Head:PZPolyhedron):PZPolyhedron;cdecl;external;
procedure ZDomain_Free(Head:PZPolyhedron);cdecl;external;
function ZPolyhedronIncludes(A:PZPolyhedron; B:PZPolyhedron):TBool;cdecl;external;
function ZPolyhedron_Alloc(Lat:PLattice; Poly:PPolyhedron):PZPolyhedron;cdecl;external;
function SplitZpolyhedron(ZPol:PZPolyhedron; B:PLattice):PZPolyhedron;cdecl;external;
{$endif}
{ _Zpolyhedron_h_  }

implementation


end.
