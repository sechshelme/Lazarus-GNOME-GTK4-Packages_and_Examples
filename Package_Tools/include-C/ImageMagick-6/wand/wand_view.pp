
unit wand_view;
interface

{
  Automatically converted by H2Pas 1.0.0 from wand_view.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    wand_view.h
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
PExceptionType  = ^ExceptionType;
PMagickWand  = ^MagickWand;
PPixelWand  = ^PixelWand;
PWandView  = ^WandView;
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

  MagickWand wand view methods.
 }
{$ifndef MAGICKWAND_WAND_VIEW_H}
{$define MAGICKWAND_WAND_VIEW_H}
type
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TDuplexTransferWandViewMethod = function (para1:PWandView; para2:PWandView; para3:PWandView; para4:Tssize_t; para5:longint; 
               para6:pointer):TMagickBooleanType;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TGetWandViewMethod = function (para1:PWandView; para2:Tssize_t; para3:longint; para4:pointer):TMagickBooleanType;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  TSetWandViewMethod = function (para1:PWandView; para2:Tssize_t; para3:longint; para4:pointer):TMagickBooleanType;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TTransferWandViewMethod = function (para1:PWandView; para2:PWandView; para3:Tssize_t; para4:longint; para5:pointer):TMagickBooleanType;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  TUpdateWandViewMethod = function (para1:PWandView; para2:Tssize_t; para3:longint; para4:pointer):TMagickBooleanType;cdecl;
(* Const before type ignored *)

function GetWandViewException(para1:PWandView; para2:PExceptionType):Pchar;cdecl;external;
function DuplexTransferWandViewIterator(para1:PWandView; para2:PWandView; para3:PWandView; para4:TDuplexTransferWandViewMethod; para5:pointer):TMagickBooleanType;cdecl;external;
function GetWandViewIterator(para1:PWandView; para2:TGetWandViewMethod; para3:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsWandView(para1:PWandView):TMagickBooleanType;cdecl;external;
function SetWandViewIterator(para1:PWandView; para2:TSetWandViewMethod; para3:pointer):TMagickBooleanType;cdecl;external;
function TransferWandViewIterator(para1:PWandView; para2:PWandView; para3:TTransferWandViewMethod; para4:pointer):TMagickBooleanType;cdecl;external;
function UpdateWandViewIterator(para1:PWandView; para2:TUpdateWandViewMethod; para3:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetWandViewWand(para1:PWandView):PMagickWand;cdecl;external;
(* Const before type ignored *)
function GetWandViewPixels(para1:PWandView):^PPixelWand;cdecl;external;
(* Const before type ignored *)
function GetWandViewExtent(para1:PWandView):TRectangleInfo;cdecl;external;
(* Const before type ignored *)
procedure SetWandViewDescription(para1:PWandView; para2:Pchar);cdecl;external;
(* Const before type ignored *)
procedure SetWandViewThreads(para1:PWandView; para2:Tsize_t);cdecl;external;
(* Const before type ignored *)
function CloneWandView(para1:PWandView):PWandView;cdecl;external;
function DestroyWandView(para1:PWandView):PWandView;cdecl;external;
function NewWandView(para1:PMagickWand):PWandView;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function NewWandViewExtent(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PWandView;cdecl;external;
{$endif}

implementation


end.
