{$IFDEF read_interface}


type
  PCommandOption = ^TCommandOption;
  TCommandOption = longint;

const
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

type
  PValidateType = ^TValidateType;
  TValidateType = longint;

const
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

type
  TOptionInfo = record
    mnemonic: pchar;
    _type: Tssize_t;
    flags: Tssize_t;
    stealth: TMagickBooleanType;
  end;
  POptionInfo = ^TOptionInfo;

type
  PCommandOptionFlags = ^TCommandOptionFlags;
  TCommandOptionFlags = longint;

const
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

function GetCommandOptions(para1: TCommandOption): PPchar; cdecl; external libmagickcore;
function GetNextImageOption(para1: PImageInfo): pchar; cdecl; external libmagickcore;
function RemoveImageOption(para1: PImageInfo; para2: pchar): pchar; cdecl; external libmagickcore;
function CommandOptionToMnemonic(para1: TCommandOption; para2: Tssize_t): pchar; cdecl; external libmagickcore;
function GetImageOption(para1: PImageInfo; para2: pchar): pchar; cdecl; external libmagickcore;
function CloneImageOptions(para1: PImageInfo; para2: PImageInfo): TMagickBooleanType; cdecl; external libmagickcore;
function DefineImageOption(para1: PImageInfo; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function DeleteImageOption(para1: PImageInfo; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function IsCommandOption(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function IsOptionMember(para1: pchar; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ListCommandOptions(para1: PFILE; para2: TCommandOption; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageOption(para1: PImageInfo; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function GetCommandOptionFlags(para1: TCommandOption; para2: TMagickBooleanType; para3: pchar): Tssize_t; cdecl; external libmagickcore;
function ParseChannelOption(para1: pchar): Tssize_t; cdecl; external libmagickcore;
function ParseCommandOption(para1: TCommandOption; para2: TMagickBooleanType; para3: pchar): Tssize_t; cdecl; external libmagickcore;
procedure DestroyImageOptions(para1: PImageInfo); cdecl; external libmagickcore;
procedure ResetImageOptions(para1: PImageInfo); cdecl; external libmagickcore;
procedure ResetImageOptionIterator(para1: PImageInfo); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 14:40:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
