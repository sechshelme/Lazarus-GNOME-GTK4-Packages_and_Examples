unit homogenization;

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
{* homogenization.h -- Bavo Nootaert * }
{$ifndef HOMOGENIZATION_H}
{$define HOMOGENIZATTON_H}
{$include <polylib/polylib.h>}

function homogenize(P:PPolyhedron; MAXRAYS:dword):PPolyhedron;cdecl;external libpolylib;
procedure dehomogenize_evalue(ep:Pevalue; nb_param:longint);cdecl;external libpolylib;
procedure dehomogenize_enode(p:Penode; nb_param:longint);cdecl;external libpolylib;
procedure dehomogenize_enumeration(en:PEnumeration; nb_param:longint; maxRays:longint);cdecl;external libpolylib;
function dehomogenize_polyhedron(p:PPolyhedron; maxRays:longint):PPolyhedron;cdecl;external libpolylib;
{$endif}

// === Konventiert am: 5-2-26 19:35:57 ===


implementation



end.
