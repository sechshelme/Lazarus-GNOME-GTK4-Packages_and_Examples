unit Zpolyhedron;

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
{$ifndef _Zpolyhedron_h_}
{$define _Zpolyhedron_h_}

procedure CanonicalForm(Zpol:PZPolyhedron; Result:PPZPolyhedron; Basis:PPMatrix);cdecl;external libpolylib;
function EmptyZPolyhedron(dimension:longint):PZPolyhedron;cdecl;external libpolylib;
function IntegraliseLattice(A:PZPolyhedron):PZPolyhedron;cdecl;external libpolylib;
function isEmptyZPolyhedron(Zpol:PZPolyhedron):TBool;cdecl;external libpolylib;
function ZDomainDifference(A:PZPolyhedron; B:PZPolyhedron):PZPolyhedron;cdecl;external libpolylib;
function ZDomainImage(A:PZPolyhedron; Func:PMatrix):PZPolyhedron;cdecl;external libpolylib;
function ZDomainIncludes(A:PZPolyhedron; B:PZPolyhedron):TBool;cdecl;external libpolylib;
function ZDomainIntersection(A:PZPolyhedron; B:PZPolyhedron):PZPolyhedron;cdecl;external libpolylib;
function ZDomainPreimage(A:PZPolyhedron; Func:PMatrix):PZPolyhedron;cdecl;external libpolylib;
procedure ZDomainPrint(fp:PFILE; format:Pchar; A:PZPolyhedron);cdecl;external libpolylib;
function ZDomainSimplify(ZDom:PZPolyhedron):PZPolyhedron;cdecl;external libpolylib;
function ZDomainUnion(A:PZPolyhedron; B:PZPolyhedron):PZPolyhedron;cdecl;external libpolylib;
function ZDomain_Copy(Head:PZPolyhedron):PZPolyhedron;cdecl;external libpolylib;
procedure ZDomain_Free(Head:PZPolyhedron);cdecl;external libpolylib;
function ZPolyhedronIncludes(A:PZPolyhedron; B:PZPolyhedron):TBool;cdecl;external libpolylib;
function ZPolyhedron_Alloc(Lat:PLattice; Poly:PPolyhedron):PZPolyhedron;cdecl;external libpolylib;
function SplitZpolyhedron(ZPol:PZPolyhedron; B:PLattice):PZPolyhedron;cdecl;external libpolylib;
{$endif}
{ _Zpolyhedron_h_  }

// === Konventiert am: 5-2-26 19:36:29 ===


implementation



end.
