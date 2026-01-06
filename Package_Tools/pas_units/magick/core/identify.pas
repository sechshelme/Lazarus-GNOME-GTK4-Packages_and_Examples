unit identify;

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

  MagickCore image identify method.
 }
{$ifndef MAGICKCORE_IDENTIFY_H}
{$define MAGICKCORE_IDENTIFY_H}

function IdentifyImage(para1:PImage; para2:PFILE; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 19:23:12 ===


implementation



end.
