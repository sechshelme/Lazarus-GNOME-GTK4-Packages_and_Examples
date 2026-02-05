
unit polyparam;
interface

{
  Automatically converted by H2Pas 1.0.0 from polyparam.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    polyparam.h
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
PMatrix  = ^Matrix;
PParam_Domain  = ^Param_Domain;
PParam_Polyhedron  = ^Param_Polyhedron;
PParam_Vertices  = ^Param_Vertices;
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
{$ifndef _polyparam_H_}
{$define _polyparam_H_}

procedure Compute_PDomains(PD:PParam_Domain; nb_domains:longint; working_space:longint);cdecl;external;
function GenParamPolyhedron(Pol:PPolyhedron; Rays:PMatrix):PParam_Polyhedron;cdecl;external;
procedure Param_Domain_Free(PD:PParam_Domain);cdecl;external;
procedure Param_Polyhedron_Free(P:PParam_Polyhedron);cdecl;external;
procedure Param_Vertices_Free(PV:PParam_Vertices);cdecl;external;
(* Const before type ignored *)
procedure Param_Vertices_Print(DST:PFILE; PV:PParam_Vertices; param_names:PPchar);cdecl;external;
function PDomainDifference(Pol1:PPolyhedron; Pol2:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external;
function PDomainIntersection(Pol1:PPolyhedron; Pol2:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external;
function Polyhedron2Param_Domain(Din:PPolyhedron; Cin:PPolyhedron; working_space:longint):PParam_Polyhedron;cdecl;external;
function Polyhedron2Param_SimplifiedDomain(Din:PPPolyhedron; Cin:PPolyhedron; working_space:longint; CEq:PPPolyhedron; CT:PPMatrix):PParam_Polyhedron;cdecl;external;
function Polyhedron2Param_Vertices(Din:PPolyhedron; Cin:PPolyhedron; working_space:longint):PParam_Polyhedron;cdecl;external;
(* Const before type ignored *)
procedure Print_Domain(DST:PFILE; D:PPolyhedron; param_names:PPchar);cdecl;external;
(* Const before type ignored *)
procedure Print_Vertex(DST:PFILE; V:PMatrix; param_names:PPchar);cdecl;external;
function VertexCT(V:PMatrix; CT:PMatrix):PMatrix;cdecl;external;
procedure Param_Polyhedron_Scale_Integer(PP:PParam_Polyhedron; P:PPPolyhedron; det:PValue; MaxRays:dword);cdecl;external;
{$endif}
{ _polyparam_H_  }

implementation


end.
