unit registry;

interface

uses
  fp_magiccore;

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

function GetNextImageRegistry:Pchar;cdecl;external libmagiccore;
function DefineImageRegistry(para1:TRegistryType; para2:Pchar; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function DeleteImageRegistry(para1:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function RegistryComponentGenesis:TMagickBooleanType;cdecl;external libmagiccore;
function SetImageRegistry(para1:TRegistryType; para2:Pchar; para3:pointer; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetImageRegistry(para1:TRegistryType; para2:Pchar; para3:PExceptionInfo):pointer;cdecl;external libmagiccore;
procedure RegistryComponentTerminus;cdecl;external libmagiccore;
function RemoveImageRegistry(para1:Pchar):pointer;cdecl;external libmagiccore;
procedure ResetImageRegistryIterator;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 17:40:11 ===


implementation



end.
