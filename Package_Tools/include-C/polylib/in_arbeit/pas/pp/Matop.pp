
unit Matop;
interface

{
  Automatically converted by H2Pas 1.0.0 from Matop.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Matop.h
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
PMatrix  = ^Matrix;
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
{$ifndef _Matop_h_}
{$define _Matop_h_}
{ computes c = lcm(a,b) using Gcd(a,b,&c)  }

procedure Lcm3(a:TValue; b:TValue; c:PValue);cdecl;external;
function AddANullColumn(M:PMatrix):PMatrix;cdecl;external;
function AddANullRow(M:PMatrix):PMatrix;cdecl;external;
procedure ExchangeColumns(M:PMatrix; Column1:longint; Column2:longint);cdecl;external;
procedure ExchangeRows(M:PMatrix; Row1:longint; Row2:longint);cdecl;external;
function findHermiteBasis(M:PMatrix; Result:PPMatrix):longint;cdecl;external;
function Identity(size:dword):PMatrix;cdecl;external;
function isinHnf(A:PMatrix):TBool;cdecl;external;
function isIntegral(A:PMatrix):TBool;cdecl;external;
function Lcm(i:TValue; j:TValue):PValue;cdecl;external;
(* Const before declarator ignored *)
function Matrix_Copy(Src:PMatrix):PMatrix;cdecl;external;
procedure PutColumnFirst(X:PMatrix; Columnnumber:longint);cdecl;external;
procedure PutColumnLast(X:PMatrix; Columnnumber:longint);cdecl;external;
procedure PutRowFirst(X:PMatrix; Rownumber:longint);cdecl;external;
procedure PutRowLast(X:PMatrix; Rownumber:longint);cdecl;external;
function RemoveNColumns(M:PMatrix; FirstColumnnumber:longint; NumColumns:longint):PMatrix;cdecl;external;
function RemoveColumn(M:PMatrix; Columnnumber:longint):PMatrix;cdecl;external;
function RemoveRow(M:PMatrix; Rownumber:longint):PMatrix;cdecl;external;
function Transpose(A:PMatrix):PMatrix;cdecl;external;
{$endif}
{ _Matop_h_  }

implementation


end.
