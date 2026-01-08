{$IFDEF read_interface}

type
  TMagickStatusType = uint32;
  PMagickStatusType = ^TMagickStatusType;

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
  QuantumRange = 65535;

const
  MagickEpsilon = 1.0e-12;
  MagickMaximumValue = 1.79769313486231570E+308;
  MagickMinimumValue = 2.22507385850720140E-308;
  QuantumScale = 1.0 / QuantumRange;

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
  MagickFalse = Boolean32(0);
  MagickTrue = Boolean32(1);

type
  PBlobInfo = type Pointer;
  PExceptionInfo = type Pointer;
  PImage = type Pointer;
  PPImage = ^PImage;
  PImageInfo = type Pointer;

  // === Konventiert am: 6-1-26 14:27:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
