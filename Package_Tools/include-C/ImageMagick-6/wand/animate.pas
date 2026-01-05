unit animate;

interface

uses
  fp_magiccore, fp_magicwand;

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

  MagickWand animate command-line methods.
 }
{$ifndef MAGICKWAND_ANIMATE_H}
{$define MAGICKWAND_ANIMATE_H}

function AnimateImageCommand(para1:PImageInfo; para2:longint; para3:PPchar; para4:PPchar; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagicwand;
{$endif}

// === Konventiert am: 5-1-26 19:39:33 ===


implementation



end.
