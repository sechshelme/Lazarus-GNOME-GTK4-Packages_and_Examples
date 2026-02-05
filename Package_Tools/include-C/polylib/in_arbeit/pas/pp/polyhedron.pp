
unit polyhedron;
interface

{
  Automatically converted by H2Pas 1.0.0 from polyhedron.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    polyhedron.h
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
PInterval  = ^Interval;
PMatrix  = ^Matrix;
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
{$ifndef _polyhedron_H_}
{$define _polyhedron_H_}

procedure Polyhedron_Compute_Dual(P:PPolyhedron);cdecl;external;
function DomainConstraintSimplify(P:PPolyhedron; MaxRays:dword):PPolyhedron;cdecl;external;
function AddConstraints(Con:PValue; NbConstraints:dword; Pol:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external;
function AddPolyToDomain(Pol:PPolyhedron; PolDomain:PPolyhedron):PPolyhedron;cdecl;external;
function AddRays(Ray2:PValue; NbRay2:dword; Pol1:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external;
function align_context(Pol:PPolyhedron; align_dimension:longint; NbMaxRays:longint):PPolyhedron;cdecl;external;
function Constraints2Polyhedron(Constraints:PMatrix; NbMaxRays:dword):PPolyhedron;cdecl;external;
function Disjoint_Domain(Pol:PPolyhedron; flag:longint; NbMaxRays:dword):PPolyhedron;cdecl;external;
function DomainAddConstraints(Pol:PPolyhedron; Mat:PMatrix; NbMaxRays:dword):PPolyhedron;cdecl;external;
function DomainAddRays(Pol:PPolyhedron; Ray:PMatrix; NbMaxConstrs:dword):PPolyhedron;cdecl;external;
function DomainConvex(Pol:PPolyhedron; NbMaxConstrs:dword):PPolyhedron;cdecl;external;
function DomainCost(Pol:PPolyhedron; Cost:PValue):PInterval;cdecl;external;
function DomainDifference(Pol1:PPolyhedron; Pol2:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external;
function DomainImage(Pol:PPolyhedron; Func:PMatrix; NbMaxConstrs:dword):PPolyhedron;cdecl;external;
function DomainIntersection(Pol1:PPolyhedron; Pol2:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external;
function DomainPreimage(Pol:PPolyhedron; Func:PMatrix; NbMaxRays:dword):PPolyhedron;cdecl;external;
function DomainSimplify(Pol1:PPolyhedron; Pol2:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external;
function Stras_DomainSimplify(Pol1:PPolyhedron; Pol2:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external;
function DomainUnion(Pol1:PPolyhedron; Pol2:PPolyhedron; NbMaxRays:dword):PPolyhedron;cdecl;external;
function Domain_Copy(Pol:PPolyhedron):PPolyhedron;cdecl;external;
procedure Domain_Free(Pol:PPolyhedron);cdecl;external;
(* Const before type ignored *)
procedure Domain_PrintConstraints(Dst:PFILE; Format:Pchar; Pol:PPolyhedron);cdecl;external;
function Empty_Polyhedron(Dimension:dword):PPolyhedron;cdecl;external;
function Gauss(Mat:PMatrix; NbEq:longint; Dimension:longint):longint;cdecl;external;
function lower_upper_bounds(pos:longint; P:PPolyhedron; context:PValue; LBp:PValue; UBp:PValue):longint;cdecl;external;
function Polyhedron2Constraints(Pol:PPolyhedron):PMatrix;cdecl;external;
function Polyhedron2Rays(Pol:PPolyhedron):PMatrix;cdecl;external;
function PolyhedronIncludes(Pol1:PPolyhedron; Pol2:PPolyhedron):longint;cdecl;external;
function Polyhedron_Alloc(Dimension:dword; NbConstraints:dword; NbRays:dword):PPolyhedron;cdecl;external;
function Polyhedron_Copy(Pol:PPolyhedron):PPolyhedron;cdecl;external;
procedure Polyhedron_Free(Pol:PPolyhedron);cdecl;external;
function Polyhedron_Image(Pol:PPolyhedron; Func:PMatrix; NbMaxConstrs:dword):PPolyhedron;cdecl;external;
function Polyhedron_Preimage(Pol:PPolyhedron; Func:PMatrix; NbMaxRays:dword):PPolyhedron;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure Polyhedron_Print(Dst:PFILE; Format:Pchar; Pol:PPolyhedron);cdecl;external;
(* Const before type ignored *)
procedure Polyhedron_PrintConstraints(Dst:PFILE; Format:Pchar; Pol:PPolyhedron);cdecl;external;
function Polyhedron_Scan(D:PPolyhedron; C:PPolyhedron; MAXRAYS:dword):PPolyhedron;cdecl;external;
procedure PolyPrint(Pol:PPolyhedron);cdecl;external;
function Rays2Polyhedron(Ray:PMatrix; NbMaxConstrs:dword):PPolyhedron;cdecl;external;
function SubConstraint(Con:PValue; Pol:PPolyhedron; NbMaxRays:dword; Pass:longint):PPolyhedron;cdecl;external;
function Universe_Polyhedron(Dimension:dword):PPolyhedron;cdecl;external;
{$endif}
{ _polyhedron_H_  }

implementation


end.
