
unit ehrhart;
interface

{
  Automatically converted by H2Pas 1.0.0 from ehrhart.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ehrhart.h
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
Penode  = ^enode;
PEnumeration  = ^Enumeration;
Pevalue  = ^evalue;
PFILE  = ^FILE;
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
{$ifndef _ehrhart_H_}
{$define _ehrhart_H_}
{********************** User defines ***************************** }
{ Print all overflow warnings, or just one per domain              }
{ #define ALL_OVERFLOW_WARNINGS  }
{****************** End of user defines ************************** }
{$ifndef ALL_OVERFLOW_WARNINGS}
  var
    overflow_warning_flag : longint;cvar;external;
{$endif}

procedure count_points(pos:longint; P:PPolyhedron; context:PValue; res:PValue);cdecl;external;
procedure eadd(e1:Pevalue; res:Pevalue);cdecl;external;
function ecopy(e:Penode):Penode;cdecl;external;
procedure edot(v1:Penode; v2:Penode; res:Pevalue);cdecl;external;
function new_enode(_type:Tenode_type; size:longint; pos:longint):Penode;cdecl;external;
procedure free_evalue_refs(e:Pevalue);cdecl;external;
(* Const before type ignored *)
function Polyhedron_Enumerate(P:PPolyhedron; C:PPolyhedron; MAXRAYS:dword; pname:PPchar):PEnumeration;cdecl;external;
(* Const before type ignored *)
procedure print_enode(DST:PFILE; p:Penode; pname:PPchar);cdecl;external;
(* Const before type ignored *)
procedure print_evalue(DST:PFILE; e:Pevalue; pname:PPchar);cdecl;external;
procedure reduce_evalue(e:Pevalue);cdecl;external;
procedure Enumeration_Free(en:PEnumeration);cdecl;external;
function Ehrhart_Quick_Apx(M:PMatrix; C:PMatrix; Validity_Lattice:PPMatrix; MAXRAYS:dword):PEnumeration;cdecl;external;
function Enumeration_zero(nbParms:dword; maxRays:dword):PEnumeration;cdecl;external;
{$endif}
{ _ehrhart_H_  }

implementation


end.
