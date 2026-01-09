
unit magick_type;
interface

{
  Automatically converted by H2Pas 1.0.0 from magick_type.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    magick_type.h
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
PChannelType  = ^ChannelType;
PClassType  = ^ClassType;
PMagickAddressType  = ^MagickAddressType;
PMagickBooleanType  = ^MagickBooleanType;
PMagickDoubleType  = ^MagickDoubleType;
PMagickFloatType  = ^MagickFloatType;
PMagickOffsetType  = ^MagickOffsetType;
PMagickRealType  = ^MagickRealType;
PMagickSizeType  = ^MagickSizeType;
PQuantum  = ^Quantum;
PQuantumAny  = ^QuantumAny;
PSignedQuantum  = ^SignedQuantum;
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

  MagickCore types.
 }
{$ifndef MAGICKCORE_MAGICK_TYPE_H}
{$define MAGICKCORE_MAGICK_TYPE_H}
{$include "magick/magick-config.h"}
type
  PMagickFloatType = ^TMagickFloatType;
  TMagickFloatType = single;

  PMagickDoubleType = ^TMagickDoubleType;
  TMagickDoubleType = Tdouble;

  PSignedQuantum = ^TSignedQuantum;
  TSignedQuantum = Tssize_t;

  PQuantum = ^TQuantum;
  TQuantum = word;

  PMagickRealType = ^TMagickRealType;
  TMagickRealType = TMagickDoubleType;

  PMagickOffsetType = ^TMagickOffsetType;
  TMagickOffsetType = Tssize_t;

  PMagickSizeType = ^TMagickSizeType;
  TMagickSizeType = Tsize_t;

  PMagickAddressType = ^TMagickAddressType;
  TMagickAddressType = Tsize_t;

  PQuantumAny = ^TQuantumAny;
  TQuantumAny = TMagickOffsetType;

  PQuantumAny = ^TQuantumAny;
  TQuantumAny = TMagickSizeType;
{ deprecated  }
{
    Special purpose channel types.
   }
{ extract actual alpha channel from opacity  }
{ set alpha from  grayscale mask in RGB  }
{ channels should be modified equally  }

  PChannelType = ^TChannelType;
  TChannelType =  Longint;
  Const
    UndefinedChannel = 0;
    RedChannel = $0001;
    GrayChannel = $0001;
    CyanChannel = $0001;
    GreenChannel = $0002;
    MagentaChannel = $0002;
    BlueChannel = $0004;
    YellowChannel = $0004;
    AlphaChannel = $0008;
    OpacityChannel = $0008;
    MatteChannel = $0008;
    BlackChannel = $0020;
    IndexChannel = $0020;
    CompositeChannels = $002F;
    AllChannels = $7ffffff;
    TrueAlphaChannel = $0040;
    RGBChannels = $0080;
    GrayChannels = $0080;
    SyncChannels = $0100;
    DefaultChannels = (AllChannels or SyncChannels) and ( not (OpacityChannel));
;
type
  PClassType = ^TClassType;
  TClassType =  Longint;
  Const
    UndefinedClass = 0;
    DirectClass = 1;
    PseudoClass = 2;
;
type
  PMagickBooleanType = ^TMagickBooleanType;
  TMagickBooleanType =  Longint;
  Const
    MagickFalse = 0;
    MagickTrue = 1;
;
{
  The IsNaN test is for special floating point numbers of value Nan (not a
  number). NaN's are defined as part of the IEEE standard for floating point
  number representation, and need to be watched out for. Morphology Kernels
  often use these special numbers as neighbourhood masks.

  The special property that two NaN's are never equal, even if they are from
  the same variable allows you to test if a value is special NaN value.

  The macros are thus is only true if the value given is NaN.
 }
type
{$if defined(__cplusplus) || defined(c_plusplus)}
(* error 
}
{$endif}
{$endif}

implementation


end.
