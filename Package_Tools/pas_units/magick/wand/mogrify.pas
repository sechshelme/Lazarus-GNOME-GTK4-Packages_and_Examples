unit mogrify;

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

  MagickWand mogrify command-line method.
 }
{$ifndef MAGICKWAND_MOGRIFY_H}
{$define MAGICKWAND_MOGRIFY_H}
type

  TMagickCommand = function (para1:PImageInfo; para2:longint; para3:PPchar; para4:PPchar; para5:PExceptionInfo):TMagickBooleanType;cdecl;

function MagickCommandGenesis(para1:PImageInfo; para2:TMagickCommand; para3:longint; para4:PPchar; para5:PPchar; 
           para6:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickwand;
function MogrifyImage(para1:PImageInfo; para2:longint; para3:PPchar; para4:PPImage; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickwand;
function MogrifyImageCommand(para1:PImageInfo; para2:longint; para3:PPchar; para4:PPchar; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickwand;
function MogrifyImageInfo(para1:PImageInfo; para2:longint; para3:PPchar; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickwand;
function MogrifyImageList(para1:PImageInfo; para2:longint; para3:PPchar; para4:PPImage; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickwand;
function MogrifyImages(para1:PImageInfo; para2:TMagickBooleanType; para3:longint; para4:PPchar; para5:PPImage; 
           para6:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickwand;
{$endif}

// === Konventiert am: 5-1-26 19:40:09 ===


implementation



end.
