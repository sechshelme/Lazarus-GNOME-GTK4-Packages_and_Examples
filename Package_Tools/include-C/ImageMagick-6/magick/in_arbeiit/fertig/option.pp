
unit option;
interface

{
  Automatically converted by H2Pas 1.0.0 from option.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    option.h
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
PCommandOption  = ^CommandOption;
PCommandOptionFlags  = ^CommandOptionFlags;
PExceptionInfo  = ^ExceptionInfo;
PFILE  = ^FILE;
PImageInfo  = ^ImageInfo;
POptionInfo  = ^OptionInfo;
PValidateType  = ^ValidateType;
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

  MagickCore option methods.
 }
{$ifndef MAGICKCORE_OPTION_H}
{$define MAGICKCORE_OPTION_H}
type
  PCommandOption = ^TCommandOption;
  TCommandOption =  Longint;
  Const
    MagickUndefinedOptions = -(1);
    MagickAlignOptions = 0;
    MagickAlphaOptions = 1;
    MagickBooleanOptions = 2;
    MagickCacheOptions = 3;
    MagickChannelOptions = 4;
    MagickClassOptions = 5;
    MagickClipPathOptions = 6;
    MagickCoderOptions = 7;
    MagickColorOptions = 8;
    MagickColorspaceOptions = 9;
    MagickCommandOptions = 10;
    MagickComposeOptions = 11;
    MagickCompressOptions = 12;
    MagickConfigureOptions = 13;
    MagickDataTypeOptions = 14;
    MagickDebugOptions = 15;
    MagickDecorateOptions = 16;
    MagickDelegateOptions = 17;
    MagickDirectionOptions = 18;
    MagickDisposeOptions = 19;
    MagickDistortOptions = 20;
    MagickDitherOptions = 21;
    MagickEndianOptions = 22;
    MagickEvaluateOptions = 23;
    MagickFillRuleOptions = 24;
    MagickFilterOptions = 25;
    MagickFontOptions = 26;
    MagickFontsOptions = 27;
    MagickFormatOptions = 28;
    MagickFunctionOptions = 29;
    MagickGravityOptions = 30;
    MagickIntentOptions = 31;
    MagickInterlaceOptions = 32;
    MagickInterpolateOptions = 33;
    MagickKernelOptions = 34;
    MagickLayerOptions = 35;
    MagickLineCapOptions = 36;
    MagickLineJoinOptions = 37;
    MagickListOptions = 38;
    MagickLocaleOptions = 39;
    MagickLogEventOptions = 40;
    MagickLogOptions = 41;
    MagickMagicOptions = 42;
    MagickMethodOptions = 43;
    MagickMetricOptions = 44;
    MagickMimeOptions = 45;
    MagickModeOptions = 46;
    MagickModuleOptions = 47;
    MagickMorphologyOptions = 48;
    MagickNoiseOptions = 49;
    MagickOrientationOptions = 50;
    MagickPixelIntensityOptions = 51;
    MagickPolicyOptions = 52;
    MagickPolicyDomainOptions = 53;
    MagickPolicyRightsOptions = 54;
    MagickPreviewOptions = 55;
    MagickPrimitiveOptions = 56;
    MagickQuantumFormatOptions = 57;
    MagickResolutionOptions = 58;
    MagickResourceOptions = 59;
    MagickSparseColorOptions = 60;
    MagickStatisticOptions = 61;
    MagickStorageOptions = 62;
    MagickStretchOptions = 63;
    MagickStyleOptions = 64;
    MagickThresholdOptions = 65;
    MagickTypeOptions = 66;
    MagickValidateOptions = 67;
    MagickVirtualPixelOptions = 68;
    MagickComplexOptions = 69;
    MagickIntensityOptions = 70;
    MagickGradientOptions = 71;
    MagickWeightOptions = 72;
    MagickComplianceOptions = 73;
    MagickAutoThresholdOptions = 74;
    MagickPagesizeOptions = 75;
;
type
  PValidateType = ^TValidateType;
  TValidateType =  Longint;
  Const
    UndefinedValidate = 0;
    NoValidate = $00000;
    ColorspaceValidate = $00001;
    CompareValidate = $00002;
    CompositeValidate = $00004;
    ConvertValidate = $00008;
    FormatsDiskValidate = $00010;
    FormatsMapValidate = $00020;
    FormatsMemoryValidate = $00040;
    IdentifyValidate = $00080;
    ImportExportValidate = $00100;
    MontageValidate = $00200;
    StreamValidate = $00400;
    AllValidate = $7fffffff;
;
(* Const before type ignored *)
type
  POptionInfo = ^TOptionInfo;
  TOptionInfo = record
      mnemonic : Pchar;
      _type : Tssize_t;
      flags : Tssize_t;
      stealth : TMagickBooleanType;
    end;
{
  Flags to describe classes of image processing options.
 }
{ Option sequence firing point  }
{ Sets ImageInfo, no image needed  }
{ Sets DrawInfo, no image needed  }
{ Sets QuantizeInfo, no image needed  }
{ Sets Global Option, no image needed  }
{ Simple Image processing operator  }
{ Multi-Image List processing operator  }
{ Specially handled Operator Option  }
{ Genesis Command Wrapper Option   }
{ Option not used by Convert  }
{ Deprecate option, give warning  }

  PCommandOptionFlags = ^TCommandOptionFlags;
  TCommandOptionFlags =  Longint;
  Const
    UndefinedOptionFlag = $0000;
    FireOptionFlag = $0001;
    ImageInfoOptionFlag = $0002;
    DrawInfoOptionFlag = $0004;
    QuantizeInfoOptionFlag = $0008;
    GlobalOptionFlag = $0010;
    SimpleOperatorOptionFlag = $0100;
    ListOperatorOptionFlag = $0200;
    SpecialOperatorOptionFlag = $0400;
    GenesisOptionFlag = $0400;
    NonConvertOptionFlag = $4000;
    DeprecateOptionFlag = $8000;
;
(* Const before type ignored *)

function GetCommandOptions(para1:TCommandOption):^Pchar;cdecl;external;
(* Const before type ignored *)
function GetNextImageOption(para1:PImageInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function RemoveImageOption(para1:PImageInfo; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CommandOptionToMnemonic(para1:TCommandOption; para2:Tssize_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetImageOption(para1:PImageInfo; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function CloneImageOptions(para1:PImageInfo; para2:PImageInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DefineImageOption(para1:PImageInfo; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DeleteImageOption(para1:PImageInfo; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsCommandOption(para1:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function IsOptionMember(para1:Pchar; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function ListCommandOptions(para1:PFILE; para2:TCommandOption; para3:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SetImageOption(para1:PImageInfo; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetCommandOptionFlags(para1:TCommandOption; para2:TMagickBooleanType; para3:Pchar):Tssize_t;cdecl;external;
(* Const before type ignored *)
function ParseChannelOption(para1:Pchar):Tssize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ParseCommandOption(para1:TCommandOption; para2:TMagickBooleanType; para3:Pchar):Tssize_t;cdecl;external;
procedure DestroyImageOptions(para1:PImageInfo);cdecl;external;
(* Const before type ignored *)
procedure ResetImageOptions(para1:PImageInfo);cdecl;external;
(* Const before type ignored *)
procedure ResetImageOptionIterator(para1:PImageInfo);cdecl;external;
{$endif}

implementation


end.
