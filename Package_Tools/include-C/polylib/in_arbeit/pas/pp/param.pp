
unit param;
interface

{
  Automatically converted by H2Pas 1.0.0 from param.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    param.h
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
{$ifndef _param_H_}
{$define _param_H_}
(* Const before type ignored *)

function Read_ParamNames(in:PFILE; m:longint):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure Free_ParamNames(params:PPchar; m:longint);cdecl;external;
{$endif}
{ _param_H_  }

implementation


end.
