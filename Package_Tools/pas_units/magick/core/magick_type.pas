unit magick_type;

interface

uses
  fp_magiccore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PMagickFloatType = ^TMagickFloatType;
  TMagickFloatType = single;

  PMagickDoubleType = ^TMagickDoubleType;
  TMagickDoubleType = double;

  PSignedQuantum = ^TSignedQuantum;
  TSignedQuantum = int16;

  PQuantum = ^TQuantum;
  TQuantum = uint16;

  PMagickRealType = ^TMagickRealType;
  TMagickRealType = TMagickDoubleType;

  PMagickOffsetType = ^TMagickOffsetType;
  TMagickOffsetType = Tssize_t;

  PMagickSizeType = ^TMagickSizeType;
  TMagickSizeType = Tsize_t;

  PMagickAddressType = ^TMagickAddressType;
  TMagickAddressType = Tsize_t;

  PQuantumAny = ^TQuantumAny;
  TQuantumAny = TMagickSizeType;

type
  PChannelType = ^TChannelType;
  TChannelType = longint;

const
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
  DefaultChannels = (AllChannels or SyncChannels) and (not (OpacityChannel));

type
  PClassType = ^TClassType;
  TClassType = longint;

const
  UndefinedClass = 0;
  DirectClass = 1;
  PseudoClass = 2;

type
  PMagickBooleanType = ^TMagickBooleanType;
  TMagickBooleanType = Boolean32;

const
  MagickFalse = 0;
  MagickTrue = 1;

type
  PBlobInfo = type Pointer;
  PExceptionInfo = type Pointer;
  PImage = type Pointer;
  PImageInfo = type Pointer;

  // === Konventiert am: 6-1-26 14:27:10 ===


implementation



end.
