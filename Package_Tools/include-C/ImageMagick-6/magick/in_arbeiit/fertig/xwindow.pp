
unit xwindow;
interface

{
  Automatically converted by H2Pas 1.0.0 from xwindow.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xwindow.h
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
PImage  = ^Image;
PImageInfo  = ^ImageInfo;
PXImportInfo  = ^XImportInfo;
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

  MagickCore X11 window methods.
 }
{$ifndef MAGICKCORE_XWINDOW_H}
{$define MAGICKCORE_XWINDOW_H}
type
  PXImportInfo = ^TXImportInfo;
  TXImportInfo = record
      frame : TMagickBooleanType;
      borders : TMagickBooleanType;
      screen : TMagickBooleanType;
      descend : TMagickBooleanType;
      silent : TMagickBooleanType;
    end;
(* Const before type ignored *)

function XImportImage(para1:PImageInfo; para2:PXImportInfo):PImage;cdecl;external;
procedure XGetImportInfo(para1:PXImportInfo);cdecl;external;

implementation


end.
