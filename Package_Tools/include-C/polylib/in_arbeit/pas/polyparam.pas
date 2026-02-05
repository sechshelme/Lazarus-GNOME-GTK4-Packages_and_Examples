unit polyparam;

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
{$ifndef _polyparam_H_}
{$define _polyparam_H_}

procedure Compute_PDomains(PD:PParam_Domain; nb_domains:longint; working_space:longint);cdecl;external libpolylib;
function GenParamPolyhedron(Pol:PPolyhedron; Rays:PMatrix):PParam_Polyhedron;cdecl;external libpolylib;
procedure Param_Domain_Free(PD:PParam_Domain);cdecl;external libpolylib;
procedure Param_Polyhedron_Free(P:PParam_Polyhedron);cdecl;external libpolylib;
procedure Param_Vertices_Free(PV:PParam_Vertices);cdecl;external libpolylib;
procedure Param_Vertices_Print(DST:PFILE; PV:PParam_Vertices; param_names:PPchar);cdecl;external libpolylib;
function PDomainDifference(Pol1:PPolyhedron; Pol2:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external libpolylib;
function PDomainIntersection(Pol1:PPolyhedron; Pol2:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external libpolylib;
function Polyhedron2Param_Domain(Din:PPolyhedron; Cin:PPolyhedron; working_space:longint):PParam_Polyhedron;cdecl;external libpolylib;
function Polyhedron2Param_SimplifiedDomain(Din:PPPolyhedron; Cin:PPolyhedron; working_space:longint; CEq:PPPolyhedron; CT:PPMatrix):PParam_Polyhedron;cdecl;external libpolylib;
function Polyhedron2Param_Vertices(Din:PPolyhedron; Cin:PPolyhedron; working_space:longint):PParam_Polyhedron;cdecl;external libpolylib;
procedure Print_Domain(DST:PFILE; D:PPolyhedron; param_names:PPchar);cdecl;external libpolylib;
procedure Print_Vertex(DST:PFILE; V:PMatrix; param_names:PPchar);cdecl;external libpolylib;
function VertexCT(V:PMatrix; CT:PMatrix):PMatrix;cdecl;external libpolylib;
procedure Param_Polyhedron_Scale_Integer(PP:PParam_Polyhedron; P:PPPolyhedron; det:PValue; MaxRays:dword);cdecl;external libpolylib;
{$endif}
{ _polyparam_H_  }

// === Konventiert am: 5-2-26 19:36:17 ===


implementation



end.
