unit alpha;

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
{$ifndef _alpha_h_}
{$define _alpha_h_}

function GaussSimplify(M:PMatrix; M2:PMatrix):longint;cdecl;external libpolylib;
function PolyhedronLTQ(P1:PPolyhedron; P2:PPolyhedron; INDEX:longint; PDIM:longint; MAXRAYS:longint):longint;cdecl;external libpolylib;
function PolyhedronTSort(L:PPPolyhedron; n:dword; index:dword; pdim:dword; time:Plongint; 
           pvect:Plongint; MAXRAYS:dword):longint;cdecl;external libpolylib;
function Polyhedron_Not_Empty(P:PPolyhedron; C:PPolyhedron; MAXRAYS:longint):longint;cdecl;external libpolylib;
{$endif}
{ _alpha_h_  }

// === Konventiert am: 5-2-26 19:35:34 ===


implementation



end.
