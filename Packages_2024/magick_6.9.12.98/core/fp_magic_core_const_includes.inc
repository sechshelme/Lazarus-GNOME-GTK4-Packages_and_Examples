

// ==== /usr/include/ImageMagick-6/magick/blob.h

type
  PMapMode = ^TMapMode;
  TMapMode = longint;

const
  ReadMode = 0;
  WriteMode = 1;
  IOMode = 2;
  PersistMode = 3;

const
  MagickMaxBufferExtent = 81920;
  MagickMinBufferExtent = 16384;

  // ==== /usr/include/ImageMagick-6/magick/cache.h

type
  PCacheType = ^TCacheType;
  TCacheType = longint;

const
  UndefinedCache = 0;
  MemoryCache = 1;
  MapCache = 2;
  DiskCache = 3;
  PingCache = 4;
  DistributedCache = 5;

  // ==== /usr/include/ImageMagick-6/magick/cache-view.h

type
  PVirtualPixelMethod = ^TVirtualPixelMethod;
  TVirtualPixelMethod = longint;

const
  UndefinedVirtualPixelMethod = 0;
  BackgroundVirtualPixelMethod = 1;
  ConstantVirtualPixelMethod = 2;
  DitherVirtualPixelMethod = 3;
  EdgeVirtualPixelMethod = 4;
  MirrorVirtualPixelMethod = 5;
  RandomVirtualPixelMethod = 6;
  TileVirtualPixelMethod = 7;
  TransparentVirtualPixelMethod = 8;
  MaskVirtualPixelMethod = 9;
  BlackVirtualPixelMethod = 10;
  GrayVirtualPixelMethod = 11;
  WhiteVirtualPixelMethod = 12;
  HorizontalTileVirtualPixelMethod = 13;
  VerticalTileVirtualPixelMethod = 14;
  HorizontalTileEdgeVirtualPixelMethod = 15;
  VerticalTileEdgeVirtualPixelMethod = 16;
  CheckerTileVirtualPixelMethod = 17;

  // ==== /usr/include/ImageMagick-6/magick/color.h

type
  PComplianceType = ^TComplianceType;
  TComplianceType = longint;

const
  UndefinedCompliance = 0;
  NoCompliance = $0000;
  CSSCompliance = $0001;
  SVGCompliance = $0001;
  X11Compliance = $0002;
  XPMCompliance = $0004;
  MVGCompliance = $0008;
  AllCompliance = $7fffffff;

  // ==== /usr/include/ImageMagick-6/magick/colorspace.h

type
  PColorspaceType = ^TColorspaceType;
  TColorspaceType = longint;

const
  UndefinedColorspace = 0;
  RGBColorspace = 1;
  GRAYColorspace = 2;
  TransparentColorspace = 3;
  OHTAColorspace = 4;
  LabColorspace = 5;
  XYZColorspace = 6;
  YCbCrColorspace = 7;
  YCCColorspace = 8;
  YIQColorspace = 9;
  YPbPrColorspace = 10;
  YUVColorspace = 11;
  CMYKColorspace = 12;
  sRGBColorspace = 13;
  HSBColorspace = 14;
  HSLColorspace = 15;
  HWBColorspace = 16;
  Rec601LumaColorspace = 17;
  Rec601YCbCrColorspace = 18;
  Rec709LumaColorspace = 19;
  Rec709YCbCrColorspace = 20;
  LogColorspace = 21;
  CMYColorspace = 22;
  LuvColorspace = 23;
  HCLColorspace = 24;
  LCHColorspace = 25;
  LMSColorspace = 26;
  LCHabColorspace = 27;
  LCHuvColorspace = 28;
  scRGBColorspace = 29;
  HSIColorspace = 30;
  HSVColorspace = 31;
  HCLpColorspace = 32;
  YDbDrColorspace = 33;
  xyYColorspace = 34;
  LinearGRAYColorspace = 35;

  // ==== /usr/include/ImageMagick-6/magick/compare.h

type
  PMetricType = ^TMetricType;
  TMetricType = longint;

const
  UndefinedMetric = 0;
  AbsoluteErrorMetric = 1;
  MeanAbsoluteErrorMetric = 2;
  MeanErrorPerPixelMetric = 3;
  MeanSquaredErrorMetric = 4;
  PeakAbsoluteErrorMetric = 5;
  PeakSignalToNoiseRatioMetric = 6;
  RootMeanSquaredErrorMetric = 7;
  NormalizedCrossCorrelationErrorMetric = 8;
  FuzzErrorMetric = 9;
  UndefinedErrorMetric = 0;
  PerceptualHashErrorMetric = $ff;

  // ==== /usr/include/ImageMagick-6/magick/composite.h

type
  PCompositeOperator = ^TCompositeOperator;
  TCompositeOperator = longint;

const
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

  AddCompositeOp = ModulusAddCompositeOp;
  SubtractCompositeOp = ModulusSubtractCompositeOp;
  MinusCompositeOp = MinusDstCompositeOp;
  DivideCompositeOp = DivideDstCompositeOp;

  // ==== /usr/include/ImageMagick-6/magick/compress.h

type
  PCompressionType = ^TCompressionType;
  TCompressionType = longint;

const
  UndefinedCompression = 0;
  NoCompression = 1;
  BZipCompression = 2;
  DXT1Compression = 3;
  DXT3Compression = 4;
  DXT5Compression = 5;
  FaxCompression = 6;
  Group4Compression = 7;
  JPEGCompression = 8;
  JPEG2000Compression = 9;
  LosslessJPEGCompression = 10;
  LZWCompression = 11;
  RLECompression = 12;
  ZipCompression = 13;
  ZipSCompression = 14;
  PizCompression = 15;
  Pxr24Compression = 16;
  B44Compression = 17;
  B44ACompression = 18;
  LZMACompression = 19;
  JBIG1Compression = 20;
  JBIG2Compression = 21;
  ZstdCompression = 22;
  WebPCompression = 23;

  // ==== /usr/include/ImageMagick-6/magick/constitute.h

type
  PStorageType = ^TStorageType;
  TStorageType = longint;

const
  UndefinedPixel = 0;
  CharPixel = 1;
  DoublePixel = 2;
  FloatPixel = 3;
  IntegerPixel = 4;
  LongPixel = 5;
  QuantumPixel = 6;
  ShortPixel = 7;

  // ==== /usr/include/ImageMagick-6/magick/distort.h

type
  PDistortImageMethod = ^TDistortImageMethod;
  TDistortImageMethod = longint;

const
  UndefinedDistortion = 0;
  AffineDistortion = 1;
  AffineProjectionDistortion = 2;
  ScaleRotateTranslateDistortion = 3;
  PerspectiveDistortion = 4;
  PerspectiveProjectionDistortion = 5;
  BilinearForwardDistortion = 6;
  BilinearDistortion = BilinearForwardDistortion;
  BilinearReverseDistortion = (BilinearForwardDistortion) + 1;
  PolynomialDistortion = (BilinearForwardDistortion) + 2;
  ArcDistortion = (BilinearForwardDistortion) + 3;
  PolarDistortion = (BilinearForwardDistortion) + 4;
  DePolarDistortion = (BilinearForwardDistortion) + 5;
  Cylinder2PlaneDistortion = (BilinearForwardDistortion) + 6;
  Plane2CylinderDistortion = (BilinearForwardDistortion) + 7;
  BarrelDistortion = (BilinearForwardDistortion) + 8;
  BarrelInverseDistortion = (BilinearForwardDistortion) + 9;
  ShepardsDistortion = (BilinearForwardDistortion) + 10;
  ResizeDistortion = (BilinearForwardDistortion) + 11;
  SentinelDistortion = (BilinearForwardDistortion) + 12;

type
  PSparseColorMethod = ^TSparseColorMethod;
  TSparseColorMethod = longint;

const
  UndefinedColorInterpolate = UndefinedDistortion;
  BarycentricColorInterpolate = AffineDistortion;
  BilinearColorInterpolate = BilinearReverseDistortion;
  PolynomialColorInterpolate = PolynomialDistortion;
  ShepardsColorInterpolate = ShepardsDistortion;
  VoronoiColorInterpolate = SentinelDistortion;
  InverseColorInterpolate = (SentinelDistortion) + 1;
  ManhattanColorInterpolate = (SentinelDistortion) + 2;

  // ==== /usr/include/ImageMagick-6/magick/draw.h

type
  PAlignType = ^TAlignType;
  TAlignType = longint;

const
  UndefinedAlign = 0;
  LeftAlign = 1;
  CenterAlign = 2;
  RightAlign = 3;

type
  PClipPathUnits = ^TClipPathUnits;
  TClipPathUnits = longint;

const
  UndefinedPathUnits = 0;
  UserSpace = 1;
  UserSpaceOnUse = 2;
  ObjectBoundingBox = 3;

type
  PDecorationType = ^TDecorationType;
  TDecorationType = longint;

const
  UndefinedDecoration = 0;
  NoDecoration = 1;
  UnderlineDecoration = 2;
  OverlineDecoration = 3;
  LineThroughDecoration = 4;

type
  PDirectionType = ^TDirectionType;
  TDirectionType = longint;

const
  UndefinedDirection = 0;
  RightToLeftDirection = 1;
  LeftToRightDirection = 2;
  TopToBottomDirection = 3;

type
  PFillRule = ^TFillRule;
  TFillRule = longint;

const
  UndefinedRule = 0;
  EvenOddRule = 1;
  NonZeroRule = 2;

type
  PGradientType = ^TGradientType;
  TGradientType = longint;

const
  UndefinedGradient = 0;
  LinearGradient = 1;
  RadialGradient = 2;

type
  PLineCap = ^TLineCap;
  TLineCap = longint;

const
  UndefinedCap = 0;
  ButtCap = 1;
  RoundCap = 2;
  SquareCap = 3;

type
  PLineJoin = ^TLineJoin;
  TLineJoin = longint;

const
  UndefinedJoin = 0;
  MiterJoin = 1;
  RoundJoin = 2;
  BevelJoin = 3;

type
  PPaintMethod = ^TPaintMethod;
  TPaintMethod = longint;

const
  UndefinedMethod = 0;
  PointMethod = 1;
  ReplaceMethod = 2;
  FloodfillMethod = 3;
  FillToBorderMethod = 4;
  ResetMethod = 5;

type
  PPrimitiveType = ^TPrimitiveType;
  TPrimitiveType = longint;

const
  UndefinedPrimitive = 0;
  PointPrimitive = 1;
  LinePrimitive = 2;
  RectanglePrimitive = 3;
  RoundRectanglePrimitive = 4;
  ArcPrimitive = 5;
  EllipsePrimitive = 6;
  CirclePrimitive = 7;
  PolylinePrimitive = 8;
  PolygonPrimitive = 9;
  BezierPrimitive = 10;
  ColorPrimitive = 11;
  MattePrimitive = 12;
  TextPrimitive = 13;
  ImagePrimitive = 14;
  PathPrimitive = 15;

type
  PReferenceType = ^TReferenceType;
  TReferenceType = longint;

const
  UndefinedReference = 0;
  GradientReference = 1;

type
  PSpreadMethod = ^TSpreadMethod;
  TSpreadMethod = longint;

const
  UndefinedSpread = 0;
  PadSpread = 1;
  ReflectSpread = 2;
  RepeatSpread = 3;

  // ==== /usr/include/ImageMagick-6/magick/effect.h

type
  PPreviewType = ^TPreviewType;
  TPreviewType = longint;

const
  UndefinedPreview = 0;
  RotatePreview = 1;
  ShearPreview = 2;
  RollPreview = 3;
  HuePreview = 4;
  SaturationPreview = 5;
  BrightnessPreview = 6;
  GammaPreview = 7;
  SpiffPreview = 8;
  DullPreview = 9;
  GrayscalePreview = 10;
  QuantizePreview = 11;
  DespecklePreview = 12;
  ReduceNoisePreview = 13;
  AddNoisePreview = 14;
  SharpenPreview = 15;
  BlurPreview = 16;
  ThresholdPreview = 17;
  EdgeDetectPreview = 18;
  SpreadPreview = 19;
  SolarizePreview = 20;
  ShadePreview = 21;
  RaisePreview = 22;
  SegmentPreview = 23;
  SwirlPreview = 24;
  ImplodePreview = 25;
  WavePreview = 26;
  OilPaintPreview = 27;
  CharcoalDrawingPreview = 28;
  JPEGPreview = 29;

  // ==== /usr/include/ImageMagick-6/magick/exception.h

type
  PExceptionType = ^TExceptionType;
  TExceptionType = longint;

const
  UndefinedException = 0;
  WarningException = 300;
  ResourceLimitWarning = 300;
  TypeWarning = 305;
  OptionWarning = 310;
  DelegateWarning = 315;
  MissingDelegateWarning = 320;
  CorruptImageWarning = 325;
  FileOpenWarning = 330;
  BlobWarning = 335;
  StreamWarning = 340;
  CacheWarning = 345;
  CoderWarning = 350;
  FilterWarning = 352;
  ModuleWarning = 355;
  DrawWarning = 360;
  ImageWarning = 365;
  WandWarning = 370;
  RandomWarning = 375;
  XServerWarning = 380;
  MonitorWarning = 385;
  RegistryWarning = 390;
  ConfigureWarning = 395;
  PolicyWarning = 399;
  ErrorException = 400;
  ResourceLimitError = 400;
  TypeError = 405;
  OptionError = 410;
  DelegateError = 415;
  MissingDelegateError = 420;
  CorruptImageError = 425;
  FileOpenError = 430;
  BlobError = 435;
  StreamError = 440;
  CacheError = 445;
  CoderError = 450;
  FilterError = 452;
  ModuleError = 455;
  DrawError = 460;
  ImageError = 465;
  WandError = 470;
  RandomError = 475;
  XServerError = 480;
  MonitorError = 485;
  RegistryError = 490;
  ConfigureError = 495;
  PolicyError = 499;
  FatalErrorException = 700;
  ResourceLimitFatalError = 700;
  TypeFatalError = 705;
  OptionFatalError = 710;
  DelegateFatalError = 715;
  MissingDelegateFatalError = 720;
  CorruptImageFatalError = 725;
  FileOpenFatalError = 730;
  BlobFatalError = 735;
  StreamFatalError = 740;
  CacheFatalError = 745;
  CoderFatalError = 750;
  FilterFatalError = 752;
  ModuleFatalError = 755;
  DrawFatalError = 760;
  ImageFatalError = 765;
  WandFatalError = 770;
  RandomFatalError = 775;
  XServerFatalError = 780;
  MonitorFatalError = 785;
  RegistryFatalError = 790;
  ConfigureFatalError = 795;
  PolicyFatalError = 799;

  // ==== /usr/include/ImageMagick-6/magick/fourier.h

type
  PComplexOperator = ^TComplexOperator;
  TComplexOperator = longint;

const
  UndefinedComplexOperator = 0;
  AddComplexOperator = 1;
  ConjugateComplexOperator = 2;
  DivideComplexOperator = 3;
  MagnitudePhaseComplexOperator = 4;
  MultiplyComplexOperator = 5;
  RealImaginaryComplexOperator = 6;
  SubtractComplexOperator = 7;

  // ==== /usr/include/ImageMagick-6/magick/geometry.h

type
  PGeometryFlags = ^TGeometryFlags;
  TGeometryFlags = longint;

const
  NoValue = $0000;
  XValue = $0001;
  XiValue = $0001;
  YValue = $0002;
  PsiValue = $0002;
  WidthValue = $0004;
  RhoValue = $0004;
  HeightValue = $0008;
  SigmaValue = $0008;
  ChiValue = $0010;
  XiNegative = $0020;
  XNegative = $0020;
  PsiNegative = $0040;
  YNegative = $0040;
  ChiNegative = $0080;
  PercentValue = $1000;
  AspectValue = $2000;
  NormalizeValue = $2000;
  LessValue = $4000;
  GreaterValue = $8000;
  MinimumValue = $10000;
  CorrelateNormalizeValue = $10000;
  AreaValue = $20000;
  DecimalValue = $40000;
  SeparatorValue = $80000;
  AspectRatioValue = $100000;
  AlphaValue = $200000;
  AllValues = $7fffffff;

type
  PGravityType = ^TGravityType;
  TGravityType = longint;

const
  UndefinedGravity = 0;
  ForgetGravity = 0;
  NorthWestGravity = 1;
  NorthGravity = 2;
  NorthEastGravity = 3;
  WestGravity = 4;
  CenterGravity = 5;
  EastGravity = 6;
  SouthWestGravity = 7;
  SouthGravity = 8;
  SouthEastGravity = 9;
  StaticGravity = 10;

  // ==== /usr/include/ImageMagick-6/magick/hashmap.h

const
  SmallHashmapSize = 17;
  MediumHashmapSize = 509;
  LargeHashmapSize = 8191;
  HugeHashmapSize = 131071;

  // ==== /usr/include/ImageMagick-6/magick/image.h

type
  PTransmitType = ^TTransmitType;
  TTransmitType = longint;

const
  UndefinedTransmitType = 0;
  FileTransmitType = 1;
  BlobTransmitType = 2;
  StreamTransmitType = 3;
  ImageTransmitType = 4;

type
  PAlphaChannelType = ^TAlphaChannelType;
  TAlphaChannelType = longint;

const
  UndefinedAlphaChannel = 0;
  ActivateAlphaChannel = 1;
  BackgroundAlphaChannel = 2;
  CopyAlphaChannel = 3;
  DeactivateAlphaChannel = 4;
  ExtractAlphaChannel = 5;
  OpaqueAlphaChannel = 6;
  ResetAlphaChannel = 7;
  SetAlphaChannel = 8;
  ShapeAlphaChannel = 9;
  TransparentAlphaChannel = 10;
  FlattenAlphaChannel = 11;
  RemoveAlphaChannel = 12;
  AssociateAlphaChannel = 13;
  DisassociateAlphaChannel = 14;

type
  PImageType = ^TImageType;
  TImageType = longint;

const
  UndefinedType = 0;
  BilevelType = 1;
  GrayscaleType = 2;
  GrayscaleMatteType = 3;
  PaletteType = 4;
  PaletteMatteType = 5;
  TrueColorType = 6;
  TrueColorMatteType = 7;
  ColorSeparationType = 8;
  ColorSeparationMatteType = 9;
  OptimizeType = 10;
  PaletteBilevelMatteType = 11;

type
  PInterlaceType = ^TInterlaceType;
  TInterlaceType = longint;

const
  UndefinedInterlace = 0;
  NoInterlace = 1;
  LineInterlace = 2;
  PlaneInterlace = 3;
  PartitionInterlace = 4;
  GIFInterlace = 5;
  JPEGInterlace = 6;
  PNGInterlace = 7;

type
  POrientationType = ^TOrientationType;
  TOrientationType = longint;

const
  UndefinedOrientation = 0;
  TopLeftOrientation = 1;
  TopRightOrientation = 2;
  BottomRightOrientation = 3;
  BottomLeftOrientation = 4;
  LeftTopOrientation = 5;
  RightTopOrientation = 6;
  RightBottomOrientation = 7;
  LeftBottomOrientation = 8;

type
  PResolutionType = ^TResolutionType;
  TResolutionType = longint;

const
  UndefinedResolution = 0;
  PixelsPerInchResolution = 1;
  PixelsPerCentimeterResolution = 2;

  // ==== /usr/include/ImageMagick-6/magick/layer.h

type
  PDisposeType = ^TDisposeType;
  TDisposeType = longint;

const
  UnrecognizedDispose = 0;
  UndefinedDispose = 0;
  NoneDispose = 1;
  BackgroundDispose = 2;
  PreviousDispose = 3;

type
  PImageLayerMethod = ^TImageLayerMethod;
  TImageLayerMethod = longint;

const
  UndefinedLayer = 0;
  CoalesceLayer = 1;
  CompareAnyLayer = 2;
  CompareClearLayer = 3;
  CompareOverlayLayer = 4;
  DisposeLayer = 5;
  OptimizeLayer = 6;
  OptimizeImageLayer = 7;
  OptimizePlusLayer = 8;
  OptimizeTransLayer = 9;
  RemoveDupsLayer = 10;
  RemoveZeroLayer = 11;
  CompositeLayer = 12;
  MergeLayer = 13;
  FlattenLayer = 14;
  MosaicLayer = 15;
  TrimBoundsLayer = 16;

  // ==== /usr/include/ImageMagick-6/magick/log.h

const
  MagickLogFilename = 'log.xml';

type
  PLogEventType = ^TLogEventType;
  TLogEventType = longint;

const
  UndefinedEvents = 0;
  NoEvents = $00000;
  TraceEvent = $00001;
  AnnotateEvent = $00002;
  BlobEvent = $00004;
  CacheEvent = $00008;
  CoderEvent = $00010;
  ConfigureEvent = $00020;
  DeprecateEvent = $00040;
  DrawEvent = $00080;
  ExceptionEvent = $00100;
  ImageEvent = $00200;
  LocaleEvent = $00400;
  ModuleEvent = $00800;
  PolicyEvent = $01000;
  ResourceEvent = $02000;
  TransformEvent = $04000;
  UserEvent = $09000;
  WandEvent = $10000;
  X11Event = $20000;
  AccelerateEvent = $40000;
  AllEvents = $7fffffff;

  // ==== /usr/include/ImageMagick-6/magick/magick.h

type
  PMagickFormatType = ^TMagickFormatType;
  TMagickFormatType = longint;

const
  UndefinedFormatType = 0;
  ImplicitFormatType = 1;
  ExplicitFormatType = 2;

type
  PMagickThreadSupport = ^TMagickThreadSupport;
  TMagickThreadSupport = longint;

const
  NoThreadSupport = $0000;
  DecoderThreadSupport = $0001;
  EncoderThreadSupport = $0002;

  // ==== /usr/include/ImageMagick-6/magick/magick-config.h

  {$ifdef windows}
const
  MAGICKCORE_DIR_SEPARATOR_CHAR = '\\';
  MAGICKCORE_DIR_SEPARATOR = '\\';
  MAGICKCORE_PATH_SEPARATOR_CHAR = ';';
  MAGICKCORE_PATH_SEPARATOR = ';';
  {$endif}

  {$ifdef linux}
const
  MAGICKCORE_DIR_SEPARATOR_CHAR = '/';
  MAGICKCORE_DIR_SEPARATOR = '/';
  MAGICKCORE_PATH_SEPARATOR_CHAR = ':';
  MAGICKCORE_PATH_SEPARATOR = ':';
  {$endif}

  // ==== /usr/include/ImageMagick-6/magick/MagickCore.h



  // ==== /usr/include/ImageMagick-6/magick/magick-type.h

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

const
  UndefinedClass = 0;
  DirectClass = 1;
  PseudoClass = 2;

  // ==== /usr/include/ImageMagick-6/magick/method-attribute.h

const
  MagickCoreSignature = $abacadab;
  MagickSignature = MagickCoreSignature;

const
  MaxTextExtent = 4096;
  MagickTimeExtent = 26;

  // ==== /usr/include/ImageMagick-6/magick/module.h

type
  PMagickModuleType = ^TMagickModuleType;
  TMagickModuleType = longint;

const
  MagickImageCoderModule = 0;
  MagickImageFilterModule = 1;

  // ==== /usr/include/ImageMagick-6/magick/montage.h

type
  PMontageMode = ^TMontageMode;
  TMontageMode = longint;

const
  UndefinedMode = 0;
  FrameMode = 1;
  UnframeMode = 2;
  ConcatenateMode = 3;

  // ==== /usr/include/ImageMagick-6/magick/morphology.h

type
  PKernelInfoType = ^TKernelInfoType;
  TKernelInfoType = longint;

const
  UndefinedKernel = 0;
  UnityKernel = 1;
  GaussianKernel = 2;
  DoGKernel = 3;
  LoGKernel = 4;
  BlurKernel = 5;
  CometKernel = 6;
  LaplacianKernel = 7;
  SobelKernel = 8;
  FreiChenKernel = 9;
  RobertsKernel = 10;
  PrewittKernel = 11;
  CompassKernel = 12;
  KirschKernel = 13;
  DiamondKernel = 14;
  SquareKernel = 15;
  RectangleKernel = 16;
  OctagonKernel = 17;
  DiskKernel = 18;
  PlusKernel = 19;
  CrossKernel = 20;
  RingKernel = 21;
  PeaksKernel = 22;
  EdgesKernel = 23;
  CornersKernel = 24;
  DiagonalsKernel = 25;
  LineEndsKernel = 26;
  LineJunctionsKernel = 27;
  RidgesKernel = 28;
  ConvexHullKernel = 29;
  ThinSEKernel = 30;
  SkeletonKernel = 31;
  ChebyshevKernel = 32;
  ManhattanKernel = 33;
  OctagonalKernel = 34;
  EuclideanKernel = 35;
  UserDefinedKernel = 36;
  BinomialKernel = 37;

type
  PMorphologyMethod = ^TMorphologyMethod;
  TMorphologyMethod = longint;

const
  UndefinedMorphology = 0;
  ConvolveMorphology = 1;
  CorrelateMorphology = 2;
  ErodeMorphology = 3;
  DilateMorphology = 4;
  ErodeIntensityMorphology = 5;
  DilateIntensityMorphology = 6;
  DistanceMorphology = 7;
  OpenMorphology = 8;
  CloseMorphology = 9;
  OpenIntensityMorphology = 10;
  CloseIntensityMorphology = 11;
  SmoothMorphology = 12;
  EdgeInMorphology = 13;
  EdgeOutMorphology = 14;
  EdgeMorphology = 15;
  TopHatMorphology = 16;
  BottomHatMorphology = 17;
  HitAndMissMorphology = 18;
  ThinningMorphology = 19;
  ThickenMorphology = 20;
  VoronoiMorphology = 21;
  IterativeDistanceMorphology = 22;

  // ==== /usr/include/ImageMagick-6/magick/opencl.h

type
  PMagickOpenCLProgram = ^TMagickOpenCLProgram;
  TMagickOpenCLProgram = longint;

const
  MAGICK_OPENCL_ACCELERATE = 0;
  MAGICK_OPENCL_NUM_PROGRAMS = 1;

type
  PImageMagickOpenCLMode = ^TImageMagickOpenCLMode;
  TImageMagickOpenCLMode = longint;

const
  MAGICK_OPENCL_OFF = 0;
  MAGICK_OPENCL_DEVICE_SELECT_AUTO = 1;
  MAGICK_OPENCL_DEVICE_SELECT_USER = 2;
  MAGICK_OPENCL_DEVICE_SELECT_AUTO_CLEAR_CACHE = 3;

type
  PMagickOpenCLEnvParam = ^TMagickOpenCLEnvParam;
  TMagickOpenCLEnvParam = longint;

const
  MAGICK_OPENCL_ENV_PARAM_DEVICE = 0;
  MAGICK_OPENCL_ENV_PARAM_OPENCL_DISABLED = 1;
  MAGICK_OPENCL_ENV_PARAM_OPENCL_INITIALIZED = 2;
  MAGICK_OPENCL_ENV_PARAM_PROGRAM_CACHE_DISABLED = 3;
  MAGICK_OPENCL_ENV_PARAM_REGENERATE_PROFILE = 4;
  MAGICK_OPENCL_ENV_PARAM_PLATFORM_VENDOR = 5;
  MAGICK_OPENCL_ENV_PARAM_DEVICE_NAME = 6;

  // ==== /usr/include/ImageMagick-6/magick/option.h

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

  // ==== /usr/include/ImageMagick-6/magick/pixel.h

type
  PInterpolatePixelMethod = ^TInterpolatePixelMethod;
  TInterpolatePixelMethod = longint;

const
  UndefinedInterpolatePixel = 0;
  AverageInterpolatePixel = 1;
  BicubicInterpolatePixel = 2;
  BilinearInterpolatePixel = 3;
  FilterInterpolatePixel = 4;
  IntegerInterpolatePixel = 5;
  MeshInterpolatePixel = 6;
  NearestNeighborInterpolatePixel = 7;
  SplineInterpolatePixel = 8;
  Average9InterpolatePixel = 9;
  Average16InterpolatePixel = 10;
  BlendInterpolatePixel = 11;
  BackgroundInterpolatePixel = 12;
  CatromInterpolatePixel = 13;

type
  PPixelComponent = ^TPixelComponent;
  TPixelComponent = longint;

const
  PixelRed = 0;
  PixelCyan = 0;
  PixelGray = 0;
  PixelY = 0;
  PixelGreen = 1;
  PixelMagenta = 1;
  PixelCb = 1;
  PixelBlue = 2;
  PixelYellow = 2;
  PixelCr = 2;
  PixelAlpha = 3;
  PixelBlack = 4;
  PixelIndex = 4;
  MaskPixelComponent = 5;

type
  PPixelIntensityMethod = ^TPixelIntensityMethod;
  TPixelIntensityMethod = longint;

const
  UndefinedPixelIntensityMethod = 0;
  AveragePixelIntensityMethod = 1;
  BrightnessPixelIntensityMethod = 2;
  LightnessPixelIntensityMethod = 3;
  Rec601LumaPixelIntensityMethod = 4;
  Rec601LuminancePixelIntensityMethod = 5;
  Rec709LumaPixelIntensityMethod = 6;
  Rec709LuminancePixelIntensityMethod = 7;
  RMSPixelIntensityMethod = 8;
  MSPixelIntensityMethod = 9;

  // ==== /usr/include/ImageMagick-6/magick/policy.h

type
  PPolicyDomain = ^TPolicyDomain;
  TPolicyDomain = longint;

const
  UndefinedPolicyDomain = 0;
  CoderPolicyDomain = 1;
  DelegatePolicyDomain = 2;
  FilterPolicyDomain = 3;
  PathPolicyDomain = 4;
  ResourcePolicyDomain = 5;
  SystemPolicyDomain = 6;
  CachePolicyDomain = 7;
  ModulePolicyDomain = 8;

type
  PPolicyRights = ^TPolicyRights;
  TPolicyRights = longint;

const
  UndefinedPolicyRights = $00;
  NoPolicyRights = $00;
  ReadPolicyRights = $01;
  WritePolicyRights = $02;
  ExecutePolicyRights = $04;
  AllPolicyRights = $ff;

  // ==== /usr/include/ImageMagick-6/magick/profile.h

type
  PRenderingIntent = ^TRenderingIntent;
  TRenderingIntent = longint;

const
  UndefinedIntent = 0;
  SaturationIntent = 1;
  PerceptualIntent = 2;
  AbsoluteIntent = 3;
  RelativeIntent = 4;

  // ==== /usr/include/ImageMagick-6/magick/quantize.h

type
  PDitherMethod = ^TDitherMethod;
  TDitherMethod = longint;

const
  UndefinedDitherMethod = 0;
  NoDitherMethod = 1;
  RiemersmaDitherMethod = 2;
  FloydSteinbergDitherMethod = 3;

  // ==== /usr/include/ImageMagick-6/magick/quantum.h

type
  PEndianType = ^TEndianType;
  TEndianType = longint;

const
  UndefinedEndian = 0;
  LSBEndian = 1;
  MSBEndian = 2;

type
  PQuantumAlphaType = ^TQuantumAlphaType;
  TQuantumAlphaType = longint;

const
  UndefinedQuantumAlpha = 0;
  AssociatedQuantumAlpha = 1;
  DisassociatedQuantumAlpha = 2;

type
  PQuantumFormatType = ^TQuantumFormatType;
  TQuantumFormatType = longint;

const
  UndefinedQuantumFormat = 0;
  FloatingPointQuantumFormat = 1;
  SignedQuantumFormat = 2;
  UnsignedQuantumFormat = 3;

type
  PQuantumType = ^TQuantumType;
  TQuantumType = longint;

const
  UndefinedQuantum = 0;
  AlphaQuantum = 1;
  BlackQuantum = 2;
  BlueQuantum = 3;
  CMYKAQuantum = 4;
  CMYKQuantum = 5;
  CyanQuantum = 6;
  GrayAlphaQuantum = 7;
  GrayQuantum = 8;
  GreenQuantum = 9;
  IndexAlphaQuantum = 10;
  IndexQuantum = 11;
  MagentaQuantum = 12;
  OpacityQuantum = 13;
  RedQuantum = 14;
  RGBAQuantum = 15;
  BGRAQuantum = 16;
  RGBOQuantum = 17;
  RGBQuantum = 18;
  YellowQuantum = 19;
  GrayPadQuantum = 20;
  RGBPadQuantum = 21;
  CbYCrYQuantum = 22;
  CbYCrQuantum = 23;
  CbYCrAQuantum = 24;
  CMYKOQuantum = 25;
  BGRQuantum = 26;
  BGROQuantum = 27;

  // ==== /usr/include/ImageMagick-6/magick/registry.h

type
  PRegistryType = ^TRegistryType;
  TRegistryType = longint;

const
  UndefinedRegistryType = 0;
  ImageRegistryType = 1;
  ImageInfoRegistryType = 2;
  StringRegistryType = 3;

  // ==== /usr/include/ImageMagick-6/magick/resample.h

type
  PFilterTypes = ^TFilterTypes;
  TFilterTypes = longint;

const
  UndefinedFilter = 0;
  PointFilter = 1;
  BoxFilter = 2;
  TriangleFilter = 3;
  HermiteFilter = 4;
  HanningFilter = 5;
  HammingFilter = 6;
  BlackmanFilter = 7;
  GaussianFilter = 8;
  QuadraticFilter = 9;
  CubicFilter = 10;
  CatromFilter = 11;
  MitchellFilter = 12;
  JincFilter = 13;
  SincFilter = 14;
  SincFastFilter = 15;
  KaiserFilter = 16;
  WelshFilter = 17;
  ParzenFilter = 18;
  BohmanFilter = 19;
  BartlettFilter = 20;
  LagrangeFilter = 21;
  LanczosFilter = 22;
  LanczosSharpFilter = 23;
  Lanczos2Filter = 24;
  Lanczos2SharpFilter = 25;
  RobidouxFilter = 26;
  RobidouxSharpFilter = 27;
  CosineFilter = 28;
  SplineFilter = 29;
  LanczosRadiusFilter = 30;
  SentinelFilter = 31;

  BesselFilter = JincFilter;

  // ==== /usr/include/ImageMagick-6/magick/resource_.h

type
  PResourceType = ^TResourceType;
  TResourceType = longint;

const
  UndefinedResource = 0;
  AreaResource = 1;
  DiskResource = 2;
  FileResource = 3;
  MapResource = 4;
  MemoryResource = 5;
  ThreadResource = 6;
  TimeResource = 7;
  ThrottleResource = 8;
  WidthResource = 9;
  HeightResource = 10;
  ListLengthResource = 11;

  // ==== /usr/include/ImageMagick-6/magick/statistic.h

const
  MaximumNumberOfImageMoments = 8;
  MaximumNumberOfPerceptualHashes = 7;

type
  PMagickEvaluateOperator = ^TMagickEvaluateOperator;
  TMagickEvaluateOperator = longint;

const
  UndefinedEvaluateOperator = 0;
  AddEvaluateOperator = 1;
  AndEvaluateOperator = 2;
  DivideEvaluateOperator = 3;
  LeftShiftEvaluateOperator = 4;
  MaxEvaluateOperator = 5;
  MinEvaluateOperator = 6;
  MultiplyEvaluateOperator = 7;
  OrEvaluateOperator = 8;
  RightShiftEvaluateOperator = 9;
  SetEvaluateOperator = 10;
  SubtractEvaluateOperator = 11;
  XorEvaluateOperator = 12;
  PowEvaluateOperator = 13;
  LogEvaluateOperator = 14;
  ThresholdEvaluateOperator = 15;
  ThresholdBlackEvaluateOperator = 16;
  ThresholdWhiteEvaluateOperator = 17;
  GaussianNoiseEvaluateOperator = 18;
  ImpulseNoiseEvaluateOperator = 19;
  LaplacianNoiseEvaluateOperator = 20;
  MultiplicativeNoiseEvaluateOperator = 21;
  PoissonNoiseEvaluateOperator = 22;
  UniformNoiseEvaluateOperator = 23;
  CosineEvaluateOperator = 24;
  SineEvaluateOperator = 25;
  AddModulusEvaluateOperator = 26;
  MeanEvaluateOperator = 27;
  AbsEvaluateOperator = 28;
  ExponentialEvaluateOperator = 29;
  MedianEvaluateOperator = 30;
  SumEvaluateOperator = 31;
  RootMeanSquareEvaluateOperator = 32;
  InverseLogEvaluateOperator = 33;

type
  PMagickFunction = ^TMagickFunction;
  TMagickFunction = longint;

const
  UndefinedFunction = 0;
  PolynomialFunction = 1;
  SinusoidFunction = 2;
  ArcsinFunction = 3;
  ArctanFunction = 4;

type
  PStatisticType = ^TStatisticType;
  TStatisticType = longint;

const
  UndefinedStatistic = 0;
  GradientStatistic = 1;
  MaximumStatistic = 2;
  MeanStatistic = 3;
  MedianStatistic = 4;
  MinimumStatistic = 5;
  ModeStatistic = 6;
  NonpeakStatistic = 7;
  StandardDeviationStatistic = 8;
  RootMeanSquareStatistic = 9;

  // ==== /usr/include/ImageMagick-6/magick/threshold.h

type
  PAutoThresholdMethod = ^TAutoThresholdMethod;
  TAutoThresholdMethod = longint;

const
  UndefinedThresholdMethod = 0;
  KapurThresholdMethod = 1;
  OTSUThresholdMethod = 2;
  TriangleThresholdMethod = 3;

  // ==== /usr/include/ImageMagick-6/magick/timer.h

type
  PTimerState = ^TTimerState;
  TTimerState = longint;

const
  UndefinedTimerState = 0;
  StoppedTimerState = 1;
  RunningTimerState = 2;

  // ==== /usr/include/ImageMagick-6/magick/type.h

type
  PStretchType = ^TStretchType;
  TStretchType = longint;

const
  UndefinedStretch = 0;
  NormalStretch = 1;
  UltraCondensedStretch = 2;
  ExtraCondensedStretch = 3;
  CondensedStretch = 4;
  SemiCondensedStretch = 5;
  SemiExpandedStretch = 6;
  ExpandedStretch = 7;
  ExtraExpandedStretch = 8;
  UltraExpandedStretch = 9;
  AnyStretch = 10;

type
  PStyleType = ^TStyleType;
  TStyleType = longint;

const
  UndefinedStyle = 0;
  NormalStyle = 1;
  ItalicStyle = 2;
  ObliqueStyle = 3;
  AnyStyle = 4;
  BoldStyle = 5;

  // ==== /usr/include/ImageMagick-6/magick/utility.h

type
  PPathType = ^TPathType;
  TPathType = longint;

const
  UndefinedPath = 0;
  MagickPath = 1;
  RootPath = 2;
  HeadPath = 3;
  TailPath = 4;
  BasePath = 5;
  ExtensionPath = 6;
  SubimagePath = 7;
  CanonicalPath = 8;
  SubcanonicalPath = 9;
  BasePathSansCompressExtension = 10;

  // ==== /usr/include/ImageMagick-6/magick/version.h

const
  MagickPackageName = 'ImageMagick';
  MagickCopyright = '(C) 1999 ImageMagick Studio LLC';
  MagickLibVersion = $69C;
  MagickLibVersionText = '6.9.12';
  MagickLibAddendum = '-98';
  MagickLibInterface = 7;
  MagickLibMinInterface = 7;
  MagickPlatform = 'x86_64';
  MagickppLibVersionText = '6.9.12';
  MagickppLibAddendum = '-98';
  MagickppLibInterface = 9;
  MagickppLibMinInterface = 9;
  MagickGitRevision = '18038';
  MagickReleaseDate = '2024-03-31';
  MagickHomeURL = 'file:///usr/share/doc/imagemagick-6-common/html/index.html';
  MagickAuthoritativeLicense = 'https://imagemagick.org/script/license.php';
  MagickAuthoritativeURL = 'https://legacy.imagemagick.org';

const
  MagickQuantumDepth = 'Q16';
  MagickQuantumRange = '65535';

const
  MagickHDRISupport = '';

  // ==== /usr/include/ImageMagick-6/magick/visual-effects.h

type
  PNoiseType = ^TNoiseType;
  TNoiseType = longint;

const
  UndefinedNoise = 0;
  UniformNoise = 1;
  GaussianNoise = 2;
  MultiplicativeGaussianNoise = 3;
  ImpulseNoise = 4;
  LaplacianNoise = 5;
  PoissonNoise = 6;
  RandomNoise = 7;

  // ==== /usr/include/ImageMagick-6/magick/deprecate.h

type
  PMagickLayerMethod = ^TMagickLayerMethod;
  TMagickLayerMethod = longint;

const
  UndefinedMagickLayerMethod = 0;


