
unit matrix;
interface

{
  Automatically converted by H2Pas 1.0.0 from matrix.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    matrix.h
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
Pdouble  = ^double;
PExceptionInfo  = ^ExceptionInfo;
PImage  = ^Image;
PMatrixInfo  = ^MatrixInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
  Copyright 1999 ImageMagick Studio LLC, a non-profit organization
  dedicated to making software imaging solutions freely available.
  
  You may not use this file except in compliance with the License.  You may
  obtain a copy of the License at
  
    https://imagemagick.org/script/license.php
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  MagickCore matrix methods.
 }
{$ifndef MAGICKCORE_MATRIX_H}
{$define MAGICKCORE_MATRIX_H}
type
(* Const before type ignored *)
(* Const before type ignored *)

function AcquireMagickMatrix(para1:Tsize_t; para2:Tsize_t):^Pdouble;cdecl;external;
(* Const before type ignored *)
function RelinquishMagickMatrix(para1:PPdouble; para2:Tsize_t):^Pdouble;cdecl;external;
(* Const before type ignored *)
function MatrixToImage(para1:PMatrixInfo; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GaussJordanElimination(para1:PPdouble; para2:PPdouble; para3:Tsize_t; para4:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetMatrixElement(para1:PMatrixInfo; para2:Tssize_t; para3:Tssize_t; para4:pointer):TMagickBooleanType;cdecl;external;
function NullMatrix(para1:PMatrixInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SetMatrixElement(para1:PMatrixInfo; para2:Tssize_t; para3:Tssize_t; para4:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function AcquireMatrixInfo(para1:Tsize_t; para2:Tsize_t; para3:Tsize_t; para4:PExceptionInfo):PMatrixInfo;cdecl;external;
function DestroyMatrixInfo(para1:PMatrixInfo):PMatrixInfo;cdecl;external;
(* Const before type ignored *)
function GetMatrixColumns(para1:PMatrixInfo):Tsize_t;cdecl;external;
(* Const before type ignored *)
function GetMatrixRows(para1:PMatrixInfo):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure LeastSquaresAddTerms(para1:PPdouble; para2:PPdouble; para3:Pdouble; para4:Pdouble; para5:Tsize_t; 
            para6:Tsize_t);cdecl;external;

implementation


end.
