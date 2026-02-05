unit polyhedron;

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
{$ifndef _polyhedron_H_}
{$define _polyhedron_H_}

procedure Polyhedron_Compute_Dual(P:PPolyhedron);cdecl;external libpolylib;
function DomainConstraintSimplify(P:PPolyhedron; MaxRays:dword):PPolyhedron;cdecl;external libpolylib;
function AddConstraints(Con:PValue; NbConstraints:dword; Pol:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external libpolylib;
function AddPolyToDomain(Pol:PPolyhedron; PolDomain:PPolyhedron):PPolyhedron;cdecl;external libpolylib;
function AddRays(Ray2:PValue; NbRay2:dword; Pol1:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external libpolylib;
function align_context(Pol:PPolyhedron; align_dimension:longint; NbMaxRays:longint):PPolyhedron;cdecl;external libpolylib;
function Constraints2Polyhedron(Constraints:PMatrix; NbMaxRays:dword):PPolyhedron;cdecl;external libpolylib;
function Disjoint_Domain(Pol:PPolyhedron; flag:longint; NbMaxRays:dword):PPolyhedron;cdecl;external libpolylib;
function DomainAddConstraints(Pol:PPolyhedron; Mat:PMatrix; NbMaxRays:dword):PPolyhedron;cdecl;external libpolylib;
function DomainAddRays(Pol:PPolyhedron; Ray:PMatrix; NbMaxConstrs:dword):PPolyhedron;cdecl;external libpolylib;
function DomainConvex(Pol:PPolyhedron; NbMaxConstrs:dword):PPolyhedron;cdecl;external libpolylib;
function DomainCost(Pol:PPolyhedron; Cost:PValue):PInterval;cdecl;external libpolylib;
function DomainDifference(Pol1:PPolyhedron; Pol2:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external libpolylib;
function DomainImage(Pol:PPolyhedron; Func:PMatrix; NbMaxConstrs:dword):PPolyhedron;cdecl;external libpolylib;
function DomainIntersection(Pol1:PPolyhedron; Pol2:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external libpolylib;
function DomainPreimage(Pol:PPolyhedron; Func:PMatrix; NbMaxRays:dword):PPolyhedron;cdecl;external libpolylib;
function DomainSimplify(Pol1:PPolyhedron; Pol2:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external libpolylib;
function Stras_DomainSimplify(Pol1:PPolyhedron; Pol2:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external libpolylib;
function DomainUnion(Pol1:PPolyhedron; Pol2:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external libpolylib;
function Domain_Copy(Pol:PPolyhedron):PPolyhedron;cdecl;external libpolylib;
procedure Domain_Free(Pol:PPolyhedron);cdecl;external libpolylib;
procedure Domain_PrintConstraints(Dst:PFILE; Format:Pchar; Pol:PPolyhedron);cdecl;external libpolylib;
function Empty_Polyhedron(Dimension:dword):PPolyhedron;cdecl;external libpolylib;
function Gauss(Mat:PMatrix; NbEq:longint; Dimension:longint):longint;cdecl;external libpolylib;
function lower_upper_bounds(pos:longint; P:PPolyhedron; context:PValue; LBp:PValue; UBp:PValue):longint;cdecl;external libpolylib;
function Polyhedron2Constraints(Pol:PPolyhedron):PMatrix;cdecl;external libpolylib;
function Polyhedron2Rays(Pol:PPolyhedron):PMatrix;cdecl;external libpolylib;
function PolyhedronIncludes(Pol1:PPolyhedron; Pol2:PPolyhedron):longint;cdecl;external libpolylib;
function Polyhedron_Alloc(Dimension:dword; NbConstraints:dword; NbRays:dword):PPolyhedron;cdecl;external libpolylib;
function Polyhedron_Copy(Pol:PPolyhedron):PPolyhedron;cdecl;external libpolylib;
procedure Polyhedron_Free(Pol:PPolyhedron);cdecl;external libpolylib;
function Polyhedron_Image(Pol:PPolyhedron; Func:PMatrix; NbMaxConstrs:dword):PPolyhedron;cdecl;external libpolylib;
function Polyhedron_Preimage(Pol:PPolyhedron; Func:PMatrix; NbMaxRays:dword):PPolyhedron;cdecl;external libpolylib;
procedure Polyhedron_Print(Dst:PFILE; Format:Pchar; Pol:PPolyhedron);cdecl;external libpolylib;
procedure Polyhedron_PrintConstraints(Dst:PFILE; Format:Pchar; Pol:PPolyhedron);cdecl;external libpolylib;
function Polyhedron_Scan(D:PPolyhedron; C:PPolyhedron; MAXRAYS:dword):PPolyhedron;cdecl;external libpolylib;
procedure PolyPrint(Pol:PPolyhedron);cdecl;external libpolylib;
function Rays2Polyhedron(Ray:PMatrix; NbMaxConstrs:dword):PPolyhedron;cdecl;external libpolylib;
function SubConstraint(Con:PValue; Pol:PPolyhedron; NbMaxRays:dword; Pass:longint):PPolyhedron;cdecl;external libpolylib;
function Universe_Polyhedron(Dimension:dword):PPolyhedron;cdecl;external libpolylib;
{$endif}
{ _polyhedron_H_  }

// === Konventiert am: 5-2-26 19:36:15 ===


implementation



end.
