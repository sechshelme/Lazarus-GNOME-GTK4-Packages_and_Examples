
unit registry;
interface

{
  Automatically converted by H2Pas 1.0.0 from registry.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    registry.h
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
PExceptionInfo  = ^ExceptionInfo;
PRegistryType  = ^RegistryType;
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

  MagickCore registry methods.
 }
{$ifndef MAGICKCORE_REGISTRY_H}
{$define MAGICKCORE_REGISTRY_H}
type
  PRegistryType = ^TRegistryType;
  TRegistryType =  Longint;
  Const
    UndefinedRegistryType = 0;
    ImageRegistryType = 1;
    ImageInfoRegistryType = 2;
    StringRegistryType = 3;
;

function GetNextImageRegistry:Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function DefineImageRegistry(para1:TRegistryType; para2:Pchar; para3:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DeleteImageRegistry(para1:Pchar):TMagickBooleanType;cdecl;external;
function RegistryComponentGenesis:TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SetImageRegistry(para1:TRegistryType; para2:Pchar; para3:pointer; para4:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetImageRegistry(para1:TRegistryType; para2:Pchar; para3:PExceptionInfo):pointer;cdecl;external;
procedure RegistryComponentTerminus;cdecl;external;
(* Const before type ignored *)
function RemoveImageRegistry(para1:Pchar):pointer;cdecl;external;
procedure ResetImageRegistryIterator;cdecl;external;

implementation


end.
