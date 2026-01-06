unit composite;

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

  MagickCore image composite methods.
 }
{$ifndef MAGICKCORE_COMPOSITE_H}
{$define MAGICKCORE_COMPOSITE_H}
{ These are new operators, added after the above was last sorted.
   * The list should be re-sorted only when a new library version is
   * created.
    }
type
  PCompositeOperator = ^TCompositeOperator;
  TCompositeOperator =  Longint;
  Const
    UndefinedCompositeOp = 0;
    NoCompositeOp = 1;
    ModulusAddCompositeOp = 2;
    AtopCompositeOp = 3;
    BlendCompositeOp = 4;
    BumpmapCompositeOp = 5;
    ChangeMaskCompositeOp = 6;
    ClearCompositeOp = 7;
    ColorBurnCompositeOp = 8;
    ColorDodgeCompositeOp = 9;
    ColorizeCompositeOp = 10;
    CopyBlackCompositeOp = 11;
    CopyBlueCompositeOp = 12;
    CopyCompositeOp = 13;
    CopyCyanCompositeOp = 14;
    CopyGreenCompositeOp = 15;
    CopyMagentaCompositeOp = 16;
    CopyOpacityCompositeOp = 17;
    CopyRedCompositeOp = 18;
    CopyYellowCompositeOp = 19;
    DarkenCompositeOp = 20;
    DstAtopCompositeOp = 21;
    DstCompositeOp = 22;
    DstInCompositeOp = 23;
    DstOutCompositeOp = 24;
    DstOverCompositeOp = 25;
    DifferenceCompositeOp = 26;
    DisplaceCompositeOp = 27;
    DissolveCompositeOp = 28;
    ExclusionCompositeOp = 29;
    HardLightCompositeOp = 30;
    HueCompositeOp = 31;
    InCompositeOp = 32;
    LightenCompositeOp = 33;
    LinearLightCompositeOp = 34;
    LuminizeCompositeOp = 35;
    MinusDstCompositeOp = 36;
    ModulateCompositeOp = 37;
    MultiplyCompositeOp = 38;
    OutCompositeOp = 39;
    OverCompositeOp = 40;
    OverlayCompositeOp = 41;
    PlusCompositeOp = 42;
    ReplaceCompositeOp = 43;
    SaturateCompositeOp = 44;
    ScreenCompositeOp = 45;
    SoftLightCompositeOp = 46;
    SrcAtopCompositeOp = 47;
    SrcCompositeOp = 48;
    SrcInCompositeOp = 49;
    SrcOutCompositeOp = 50;
    SrcOverCompositeOp = 51;
    ModulusSubtractCompositeOp = 52;
    ThresholdCompositeOp = 53;
    XorCompositeOp = 54;
    DivideDstCompositeOp = 55;
    DistortCompositeOp = 56;
    BlurCompositeOp = 57;
    PegtopLightCompositeOp = 58;
    VividLightCompositeOp = 59;
    PinLightCompositeOp = 60;
    LinearDodgeCompositeOp = 61;
    LinearBurnCompositeOp = 62;
    MathematicsCompositeOp = 63;
    DivideSrcCompositeOp = 64;
    MinusSrcCompositeOp = 65;
    DarkenIntensityCompositeOp = 66;
    LightenIntensityCompositeOp = 67;
    HardMixCompositeOp = 68;
    StereoCompositeOp = 69;
;
{ Deprecated (renamed) Method Names for backward compatibility
 * However the CompositeOp value has not changed, just renamed.
  }
  AddCompositeOp = ModulusAddCompositeOp;  
  SubtractCompositeOp = ModulusSubtractCompositeOp;  
  MinusCompositeOp = MinusDstCompositeOp;  
  DivideCompositeOp = DivideDstCompositeOp;  

function CompositeImage(para1:PImage; para2:TCompositeOperator; para3:PImage; para4:Tssize_t; para5:Tssize_t):TMagickBooleanType;cdecl;external libmagiccore;
function CompositeImageChannel(para1:PImage; para2:TChannelType; para3:TCompositeOperator; para4:PImage; para5:Tssize_t; 
           para6:Tssize_t):TMagickBooleanType;cdecl;external libmagiccore;
function TextureImage(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 15:03:12 ===


implementation



end.
