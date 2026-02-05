
unit alpha;
interface

{
  Automatically converted by H2Pas 1.0.0 from alpha.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    alpha.h
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
Plongint  = ^longint;
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
{$ifndef _alpha_h_}
{$define _alpha_h_}

function GaussSimplify(M:PMatrix; M2:PMatrix):longint;cdecl;external;
function PolyhedronLTQ(P1:PPolyhedron; P2:PPolyhedron; INDEX:longint; PDIM:longint; MAXRAYS:longint):longint;cdecl;external;
function PolyhedronTSort(L:PPPolyhedron; n:dword; index:dword; pdim:dword; time:Plongint; 
           pvect:Plongint; MAXRAYS:dword):longint;cdecl;external;
function Polyhedron_Not_Empty(P:PPolyhedron; C:PPolyhedron; MAXRAYS:longint):longint;cdecl;external;
{$endif}
{ _alpha_h_  }

implementation


end.
