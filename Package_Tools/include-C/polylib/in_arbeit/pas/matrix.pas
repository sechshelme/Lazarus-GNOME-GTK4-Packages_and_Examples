unit matrix;

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
{$ifndef _matrix_H_}
{$define _matrix_H_}

function Matrix_Alloc(NbRows:dword; NbColumns:dword):PMatrix;cdecl;external libpolylib;
procedure Matrix_Free(Mat:PMatrix);cdecl;external libpolylib;
procedure Matrix_Extend(Mat:PMatrix; NbRows:dword);cdecl;external libpolylib;
procedure Matrix_Print(Dst:PFILE; Format:Pchar; Mat:PMatrix);cdecl;external libpolylib;
procedure Matrix_Read_Input(Mat:PMatrix);cdecl;external libpolylib;
function Matrix_Read:PMatrix;cdecl;external libpolylib;
procedure right_hermite(A:PMatrix; Hp:PPMatrix; Up:PPMatrix; Qp:PPMatrix);cdecl;external libpolylib;
procedure left_hermite(A:PMatrix; Hp:PPMatrix; Qp:PPMatrix; Up:PPMatrix);cdecl;external libpolylib;
function MatInverse(M:PMatrix; MInv:PMatrix):longint;cdecl;external libpolylib;
procedure rat_prodmat(S:PMatrix; X:PMatrix; P:PMatrix);cdecl;external libpolylib;
procedure Matrix_Vector_Product(mat:PMatrix; p1:PValue; p2:PValue);cdecl;external libpolylib;
procedure Vector_Matrix_Product(p1:PValue; mat:PMatrix; p2:PValue);cdecl;external libpolylib;
procedure Matrix_Product(mat1:PMatrix; mat2:PMatrix; mat3:PMatrix);cdecl;external libpolylib;
function Matrix_Inverse(Mat:PMatrix; MatInv:PMatrix):longint;cdecl;external libpolylib;
{$endif}
{ _matrix_H_  }

// === Konventiert am: 5-2-26 19:36:04 ===


implementation



end.
