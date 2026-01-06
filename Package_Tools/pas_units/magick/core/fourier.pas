unit fourier;

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

  MagickCore discrete Fourier transform (DFT) methods.
 }
type
  PComplexOperator = ^TComplexOperator;
  TComplexOperator =  Longint;
  Const
    UndefinedComplexOperator = 0;
    AddComplexOperator = 1;
    ConjugateComplexOperator = 2;
    DivideComplexOperator = 3;
    MagnitudePhaseComplexOperator = 4;
    MultiplyComplexOperator = 5;
    RealImaginaryComplexOperator = 6;
    SubtractComplexOperator = 7;
;

function ComplexImages(para1:PImage; para2:TComplexOperator; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function ForwardFourierTransformImage(para1:PImage; para2:TMagickBooleanType; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function InverseFourierTransformImage(para1:PImage; para2:PImage; para3:TMagickBooleanType; para4:PExceptionInfo):PImage;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 19:17:24 ===


implementation



end.
