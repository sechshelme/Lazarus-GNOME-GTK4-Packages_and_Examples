
unit layer;
interface

{
  Automatically converted by H2Pas 1.0.0 from layer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    layer.h
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
PDisposeType  = ^DisposeType;
PExceptionInfo  = ^ExceptionInfo;
PImage  = ^Image;
PImageLayerMethod  = ^ImageLayerMethod;
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

  MagickCore image layer methods.
 }
{$ifndef MAGICKCORE_LAYER_H}
{$define MAGICKCORE_LAYER_H}
type
  PDisposeType = ^TDisposeType;
  TDisposeType =  Longint;
  Const
    UnrecognizedDispose = 0;
    UndefinedDispose = 0;
    NoneDispose = 1;
    BackgroundDispose = 2;
    PreviousDispose = 3;
;
type
  PImageLayerMethod = ^TImageLayerMethod;
  TImageLayerMethod =  Longint;
  Const
    UndefinedLayer = 0;
    CoalesceLayer = 1;
    CompareAnyLayer = 2;
    CompareClearLayer = 3;
    CompareOverlayLayer = 4;
    DisposeLayer = 5;
    OptimizeLayer = 6;
    OptimizeImageLayer = 7;
    OptimizePlusLayer = 8;
    OptimizeTransLayer = 9;
    RemoveDupsLayer = 10;
    RemoveZeroLayer = 11;
    CompositeLayer = 12;
    MergeLayer = 13;
    FlattenLayer = 14;
    MosaicLayer = 15;
    TrimBoundsLayer = 16;
;
(* Const before type ignored *)

function CoalesceImages(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function DisposeImages(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CompareImageLayers(para1:PImage; para2:TImageLayerMethod; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function DeconstructImages(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function MergeImageLayers(para1:PImage; para2:TImageLayerMethod; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function OptimizeImageLayers(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function OptimizePlusImageLayers(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure CompositeLayers(para1:PImage; para2:TCompositeOperator; para3:PImage; para4:Tssize_t; para5:Tssize_t; 
            para6:PExceptionInfo);cdecl;external;
(* Const before type ignored *)
procedure OptimizeImageTransparency(para1:PImage; para2:PExceptionInfo);cdecl;external;
procedure RemoveDuplicateLayers(para1:PPImage; para2:PExceptionInfo);cdecl;external;
procedure RemoveZeroDelayLayers(para1:PPImage; para2:PExceptionInfo);cdecl;external;

implementation


end.
