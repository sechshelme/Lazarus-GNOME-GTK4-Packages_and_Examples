
unit image_view;
interface

{
  Automatically converted by H2Pas 1.0.0 from image_view.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    image_view.h
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
PImage  = ^Image;
PImageView  = ^ImageView;
PIndexPacket  = ^IndexPacket;
PPixelPacket  = ^PixelPacket;
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

  MagickCore image view methods.
 }
{$ifndef MAGICKCORE_IMAGE_VIEW_H}
{$define MAGICKCORE_IMAGE_VIEW_H}
type
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TDuplexTransferImageViewMethod = function (para1:PImageView; para2:PImageView; para3:PImageView; para4:Tssize_t; para5:longint; 
               para6:pointer):TMagickBooleanType;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TGetImageViewMethod = function (para1:PImageView; para2:Tssize_t; para3:longint; para4:pointer):TMagickBooleanType;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  TSetImageViewMethod = function (para1:PImageView; para2:Tssize_t; para3:longint; para4:pointer):TMagickBooleanType;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TTransferImageViewMethod = function (para1:PImageView; para2:PImageView; para3:Tssize_t; para4:longint; para5:pointer):TMagickBooleanType;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  TUpdateImageViewMethod = function (para1:PImageView; para2:Tssize_t; para3:longint; para4:pointer):TMagickBooleanType;cdecl;
(* Const before type ignored *)

function GetImageViewException(para1:PImageView; para2:PExceptionType):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetImageViewVirtualIndexes(para1:PImageView):PIndexPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetImageViewVirtualPixels(para1:PImageView):PPixelPacket;cdecl;external;
(* Const before type ignored *)
function GetImageViewImage(para1:PImageView):PImage;cdecl;external;
(* Const before type ignored *)
function CloneImageView(para1:PImageView):PImageView;cdecl;external;
function DestroyImageView(para1:PImageView):PImageView;cdecl;external;
function NewImageView(para1:PImage):PImageView;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function NewImageViewRegion(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PImageView;cdecl;external;
(* Const before type ignored *)
function GetImageViewAuthenticIndexes(para1:PImageView):PIndexPacket;cdecl;external;
function DuplexTransferImageViewIterator(para1:PImageView; para2:PImageView; para3:PImageView; para4:TDuplexTransferImageViewMethod; para5:pointer):TMagickBooleanType;cdecl;external;
function GetImageViewIterator(para1:PImageView; para2:TGetImageViewMethod; para3:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsImageView(para1:PImageView):TMagickBooleanType;cdecl;external;
function SetImageViewIterator(para1:PImageView; para2:TSetImageViewMethod; para3:pointer):TMagickBooleanType;cdecl;external;
function TransferImageViewIterator(para1:PImageView; para2:PImageView; para3:TTransferImageViewMethod; para4:pointer):TMagickBooleanType;cdecl;external;
function UpdateImageViewIterator(para1:PImageView; para2:TUpdateImageViewMethod; para3:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetImageViewAuthenticPixels(para1:PImageView):PPixelPacket;cdecl;external;
(* Const before type ignored *)
function GetImageViewExtent(para1:PImageView):TRectangleInfo;cdecl;external;
(* Const before type ignored *)
procedure SetImageViewDescription(para1:PImageView; para2:Pchar);cdecl;external;
(* Const before type ignored *)
procedure SetImageViewThreads(para1:PImageView; para2:Tsize_t);cdecl;external;
{$endif}

implementation


end.
