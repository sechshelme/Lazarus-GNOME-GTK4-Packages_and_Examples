unit cipher;

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

  MagickCore cipher methods.
 }
{$ifndef MAGICKCORE_CIPHER_H}
{$define MAGICKCORE_CIPHER_H}

function DecipherImage(para1:PImage; para2:Pchar; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function EncipherImage(para1:PImage; para2:Pchar; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function PasskeyDecipherImage(para1:PImage; para2:PStringInfo; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function PasskeyEncipherImage(para1:PImage; para2:PStringInfo; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 19:17:20 ===


implementation



end.
