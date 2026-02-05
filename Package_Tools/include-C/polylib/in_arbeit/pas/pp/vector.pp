
unit vector;
interface

{
  Automatically converted by H2Pas 1.0.0 from vector.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vector.h
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
Plongint  = ^longint;
PValue  = ^Value;
PVector  = ^Vector;
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
{$ifndef _vector_H_ }
{$define _vector_H_}

function ConstraintSimplify(old:PValue; n:PValue; len:longint; v:PValue):longint;cdecl;external;
function value_alloc(want:longint; got:Plongint):PValue;cdecl;external;
procedure value_free(p:PValue; size:longint);cdecl;external;
procedure Factorial(n:longint; result:PValue);cdecl;external;
procedure Binomial(n:longint; p:longint; result:PValue);cdecl;external;
procedure CNP(a:longint; b:longint; result:PValue);cdecl;external;
procedure Gcd(a:TValue; b:TValue; result:PValue);cdecl;external;
function First_Non_Zero(p:PValue; length:dword):longint;cdecl;external;
function Vector_Alloc(length:dword):PVector;cdecl;external;
procedure Vector_Free(vector:PVector);cdecl;external;
(* Const before type ignored *)
procedure Vector_Print(Dst:PFILE; Format:Pchar; Vec:PVector);cdecl;external;
function Vector_Read:PVector;cdecl;external;
procedure Vector_Set(p:PValue; n:longint; length:dword);cdecl;external;
procedure Vector_Exchange(p1:PValue; p2:PValue; length:dword);cdecl;external;
procedure Vector_Copy(p1:PValue; p2:PValue; length:dword);cdecl;external;
procedure Vector_Add(p1:PValue; p2:PValue; p3:PValue; length:dword);cdecl;external;
procedure Vector_Sub(p1:PValue; p2:PValue; p3:PValue; length:dword);cdecl;external;
procedure Vector_Or(p1:PValue; p2:PValue; p3:PValue; length:dword);cdecl;external;
procedure Vector_Scale(p1:PValue; p2:PValue; lambda:TValue; length:dword);cdecl;external;
procedure Vector_AntiScale(p1:PValue; p2:PValue; lambda:TValue; length:dword);cdecl;external;
procedure Vector_Oppose(p1:PValue; p2:PValue; length:dword);cdecl;external;
procedure Inner_Product(p1:PValue; p2:PValue; length:dword; result:PValue);cdecl;external;
procedure Vector_Max(p:PValue; length:dword; result:PValue);cdecl;external;
procedure Vector_Min(p:PValue; length:dword; result:PValue);cdecl;external;
procedure Vector_Combine(p1:PValue; p2:PValue; p3:PValue; lambda:TValue; mu:TValue; 
            length:dword);cdecl;external;
function Vector_Equal(Vec1:PValue; Vec2:PValue; n:dword):longint;cdecl;external;
procedure Vector_Min_Not_Zero(p:PValue; length:dword; index:Plongint; result:PValue);cdecl;external;
procedure Vector_Gcd(p:PValue; length:dword; result:PValue);cdecl;external;
procedure Vector_Map(p1:PValue; p2:PValue; p3:PValue; length:dword; f:function (para1:TValue; para2:TValue):PValue);cdecl;external;
procedure Vector_Normalize(p:PValue; length:dword);cdecl;external;
procedure Vector_Normalize_Positive(p:PValue; length:longint; pos:longint);cdecl;external;
procedure Vector_Reduce(p:PValue; length:dword; f:procedure (para1:TValue; para2:PValue); result:PValue);cdecl;external;
procedure Vector_Sort(vector:PValue; n:dword);cdecl;external;
function Vector_IsZero(v:PValue; length:dword):longint;cdecl;external;
{$endif}
{ _vector_H_  }

implementation


end.
