
unit monitor;
interface

{
  Automatically converted by H2Pas 1.0.0 from monitor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    monitor.h
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
PImage  = ^Image;
PImageInfo  = ^ImageInfo;
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

  MagickCore progress monitor methods.
 }
{$ifndef MAGICKCORE_MONITOR_H}
{$define MAGICKCORE_MONITOR_H}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type

  TMagickProgressMonitor = function (para1:Pchar; para2:TMagickOffsetType; para3:TMagickSizeType; para4:pointer):TMagickBooleanType;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function SetImageProgress(para1:PImage; para2:Pchar; para3:TMagickOffsetType; para4:TMagickSizeType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function SetImageProgressMonitor(para1:PImage; para2:TMagickProgressMonitor; para3:pointer):TMagickProgressMonitor;cdecl;external;
(* Const before type ignored *)
function SetImageInfoProgressMonitor(para1:PImageInfo; para2:TMagickProgressMonitor; para3:pointer):TMagickProgressMonitor;cdecl;external;
{xxxxxxxxxxxxxxxxxxxxxx
static inline MagickBooleanType QuantumTick(const MagickOffsetType offset,
  const MagickSizeType span)

  if (span <= 100)
    return(MagickTrue);
  if (offset == (MagickOffsetType) (span-1))
    return(MagickTrue);
  if ((offset % (MagickOffsetType) (span/100)) == 0)
    return(MagickTrue);
  return(MagickFalse);

 }

implementation


end.
