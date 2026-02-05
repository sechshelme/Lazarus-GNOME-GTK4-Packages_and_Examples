unit Matop;

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
{$ifndef _Matop_h_}
{$define _Matop_h_}
{ computes c = lcm(a,b) using Gcd(a,b,&c)  }

procedure Lcm3(a:TValue; b:TValue; c:PValue);cdecl;external libpolylib;
function AddANullColumn(M:PMatrix):PMatrix;cdecl;external libpolylib;
function AddANullRow(M:PMatrix):PMatrix;cdecl;external libpolylib;
procedure ExchangeColumns(M:PMatrix; Column1:longint; Column2:longint);cdecl;external libpolylib;
procedure ExchangeRows(M:PMatrix; Row1:longint; Row2:longint);cdecl;external libpolylib;
function findHermiteBasis(M:PMatrix; Result:PPMatrix):longint;cdecl;external libpolylib;
function Identity(size:dword):PMatrix;cdecl;external libpolylib;
function isinHnf(A:PMatrix):TBool;cdecl;external libpolylib;
function isIntegral(A:PMatrix):TBool;cdecl;external libpolylib;
function Lcm(i:TValue; j:TValue):PValue;cdecl;external libpolylib;
function Matrix_Copy(Src:PMatrix):PMatrix;cdecl;external libpolylib;
procedure PutColumnFirst(X:PMatrix; Columnnumber:longint);cdecl;external libpolylib;
procedure PutColumnLast(X:PMatrix; Columnnumber:longint);cdecl;external libpolylib;
procedure PutRowFirst(X:PMatrix; Rownumber:longint);cdecl;external libpolylib;
procedure PutRowLast(X:PMatrix; Rownumber:longint);cdecl;external libpolylib;
function RemoveNColumns(M:PMatrix; FirstColumnnumber:longint; NumColumns:longint):PMatrix;cdecl;external libpolylib;
function RemoveColumn(M:PMatrix; Columnnumber:longint):PMatrix;cdecl;external libpolylib;
function RemoveRow(M:PMatrix; Rownumber:longint):PMatrix;cdecl;external libpolylib;
function Transpose(A:PMatrix):PMatrix;cdecl;external libpolylib;
{$endif}
{ _Matop_h_  }

// === Konventiert am: 5-2-26 19:36:02 ===


implementation



end.
