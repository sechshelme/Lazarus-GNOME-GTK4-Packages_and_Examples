unit deprecate;

interface

uses
  fp_magiccore, magick_type, cache_view, pixel, geometry, quantize, draw, exception, quantum, registry, constitute, colorspace, semaphore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PMagickLayerMethod = ^TMagickLayerMethod;
  TMagickLayerMethod = longint;

const
  UndefinedMagickLayerMethod = 0;

type
  PExtendedSignedIntegralType = ^TExtendedSignedIntegralType;
  TExtendedSignedIntegralType = TMagickOffsetType;

  PExtendedUnsignedIntegralType = ^TExtendedUnsignedIntegralType;
  TExtendedUnsignedIntegralType = TMagickSizeType;

  PExtendedRationalType = ^TExtendedRationalType;
  TExtendedRationalType = TMagickRealType;

  TMonitorHandler = function(para1: pchar; para2: TMagickOffsetType; para3: TMagickSizeType; para4: PExceptionInfo): TMagickBooleanType; cdecl;

  PImageAttribute = ^TImageAttribute;

  TImageAttribute = record
    key: pchar;
    value: pchar;
    compression: TMagickBooleanType;
    previous: PImageAttribute;
    next: PImageAttribute;
  end;

function CloseCacheView(para1: PCacheView): PCacheView; cdecl; external libmagickcore; deprecated;
function OpenCacheView(para1: PImage): PCacheView; cdecl; external libmagickcore; deprecated;
function AllocateString(para1: pchar): pchar; cdecl; external libmagickcore; deprecated;
function InterpretImageAttributes(para1: PImageInfo; para2: PImage; para3: pchar): pchar; cdecl; external libmagickcore; deprecated;
function PostscriptGeometry(para1: pchar): pchar; cdecl; external libmagickcore; deprecated;
function TranslateText(para1: PImageInfo; para2: PImage; para3: pchar): pchar; cdecl; external libmagickcore; deprecated;
function GetImageAttribute(para1: PImage; para2: pchar): PImageAttribute; cdecl; external libmagickcore; deprecated;
function GetImageClippingPathAttribute(para1: PImage): PImageAttribute; cdecl; external libmagickcore; deprecated;
function GetNextImageAttribute(para1: PImage): PImageAttribute; cdecl; external libmagickcore; deprecated;
function AcquireCacheViewIndexes(para1: PCacheView): PIndexPacket; cdecl; external libmagickcore; deprecated;
function AcquireIndexes(para1: PImage): PIndexPacket; cdecl; external libmagickcore; deprecated;
function AcquirePixels(para1: PImage): PPixelPacket; cdecl; external libmagickcore; deprecated;
function AcquireCacheViewPixels(para1: PCacheView; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t; para6: PExceptionInfo): PPixelPacket; cdecl; external libmagickcore; deprecated;
function AcquireImagePixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t; para6: PExceptionInfo): PPixelPacket; cdecl; external libmagickcore; deprecated;
function OpenMagickStream(para1: pchar; para2: pchar): PFILE; cdecl; external libmagickcore; deprecated;
function AllocateImage(para1: PImageInfo): PImage; cdecl; external libmagickcore; deprecated;
function AverageImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function ExtractSubimageFromImage(para1: PImage; para2: PImage; para3: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function GetImageFromMagickRegistry(para1: pchar; id: Pssize_t; para3: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function GetImageList(para1: PImage; para2: Tssize_t; para3: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function GetNextImage(para1: PImage): PImage; cdecl; external libmagickcore; deprecated;
function GetPreviousImage(para1: PImage): PImage; cdecl; external libmagickcore; deprecated;
function FlattenImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function MaximumImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function MedianFilterImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function ModeImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function MinimumImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function MosaicImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function PopImageList(para1: PPImage): PImage; cdecl; external libmagickcore; deprecated;
function RadialBlurImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function RadialBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function RecolorImage(para1: PImage; para2: Tsize_t; para3: Pdouble; para4: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function ReduceNoiseImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function ShiftImageList(para1: PPImage): PImage; cdecl; external libmagickcore; deprecated;
function SpliceImageList(para1: PImage; para2: Tssize_t; para3: Tsize_t; para4: PImage; para5: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function ZoomImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore; deprecated;
function GetCacheViewIndexes(para1: PCacheView): PIndexPacket; cdecl; external libmagickcore; deprecated;
function GetIndexes(para1: PImage): PIndexPacket; cdecl; external libmagickcore; deprecated;
function ValidateColormapIndex(para1: PImage; para2: Tsize_t): TIndexPacket; cdecl; external libmagickcore; deprecated;
function GetImageGeometry(para1: PImage; para2: pchar; para3: dword; para4: PRectangleInfo): longint; cdecl; external libmagickcore; deprecated;
function ParseImageGeometry(para1: pchar; para2: Pssize_t; para3: Pssize_t; para4: Psize_t; para5: Psize_t): longint; cdecl; external libmagickcore; deprecated;
function SystemCommand(para1: TMagickBooleanType; para2: TMagickBooleanType; para3: pchar; para4: PExceptionInfo): longint; cdecl; external libmagickcore; deprecated;
function AcquireOneCacheViewPixel(para1: PCacheView; para2: Tssize_t; para3: Tssize_t; para4: PPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function AcquireOneCacheViewVirtualPixel(para1: PCacheView; para2: TVirtualPixelMethod; para3: Tssize_t; para4: Tssize_t; para5: PPixelPacket; para6: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function AffinityImage(para1: PQuantizeInfo; para2: PImage; para3: PImage): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function AffinityImages(para1: PQuantizeInfo; para2: PImage; para3: PImage): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function AllocateImageColormap(para1: PImage; para2: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function ClipPathImage(para1: PImage; para2: pchar; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function CloneImageAttributes(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function ColorFloodfillImage(para1: PImage; para2: PDrawInfo; para3: TPixelPacket; para4: Tssize_t; para5: Tssize_t; para6: TPaintMethod): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function ConstituteComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function DeleteImageAttribute(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function DeleteMagickRegistry(para1: Tssize_t): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function DescribeImage(para1: PImage; para2: PFILE; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function FormatImageAttribute(para1: PImage; para2: pchar; para3: pchar; args: array of const): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function FormatImageAttribute(para1: PImage; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function FormatImageAttributeList(para1: PImage; para2: pchar; para3: pchar; para4: Tva_list): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function FormatImagePropertyList(para1: PImage; para2: pchar; para3: pchar; para4: Tva_list): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function FuzzyColorCompare(para1: PImage; para2: PPixelPacket; para3: PPixelPacket): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function FuzzyOpacityCompare(para1: PImage; para2: PPixelPacket; para3: PPixelPacket): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function InitializeModuleList(para1: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function IsMagickInstantiated: TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function LevelImageColors(para1: PImage; para2: TChannelType; para3: PMagickPixelPacket; para4: PMagickPixelPacket; para5: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function LoadMimeLists(para1: pchar; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function MagickMonitor(para1: pchar; para2: TMagickOffsetType; para3: TMagickSizeType; para4: pointer): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function MapImage(para1: PImage; para2: PImage; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function MapImages(para1: PImage; para2: PImage; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function MatteFloodfillImage(para1: PImage; para2: TPixelPacket; para3: TQuantum; para4: Tssize_t; para5: Tssize_t; para6: TPaintMethod): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function OpaqueImage(para1: PImage; para2: TPixelPacket; para3: TPixelPacket): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function PaintFloodfillImage(para1: PImage; para2: TChannelType; para3: PMagickPixelPacket; para4: Tssize_t; para5: Tssize_t; para6: PDrawInfo; para7: TPaintMethod): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function PaintOpaqueImage(para1: PImage; para2: PMagickPixelPacket; para3: PMagickPixelPacket): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function PaintOpaqueImageChannel(para1: PImage; para2: TChannelType; para3: PMagickPixelPacket; para4: PMagickPixelPacket): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function PaintTransparentImage(para1: PImage; para2: PMagickPixelPacket; para3: TQuantum): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function SetExceptionInfo(para1: PExceptionInfo; para2: TExceptionType): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function SetImageAttribute(para1: PImage; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function SyncCacheViewPixels(para1: PCacheView): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function SyncImagePixels(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function TransparentImage(para1: PImage; para2: TPixelPacket; para3: TQuantum): TMagickBooleanType; cdecl; external libmagickcore; deprecated;
function AcquireOneMagickPixel(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: PExceptionInfo): TMagickPixelPacket; cdecl; external libmagickcore; deprecated;
function GetMonitorHandler: TMonitorHandler; cdecl; external libmagickcore; deprecated;
function SetMonitorHandler(para1: TMonitorHandler): TMonitorHandler; cdecl; external libmagickcore; deprecated;
function SizeBlob(image: PImage): TMagickOffsetType; cdecl; external libmagickcore; deprecated;
function InterpolatePixelColor(para1: PImage; para2: PCacheView; para3: TInterpolatePixelMethod; para4: double; para5: double; para6: PExceptionInfo): TMagickPixelPacket; cdecl; external libmagickcore; deprecated;
function ParseSizeGeometry(para1: PImage; para2: pchar; para3: PRectangleInfo): TMagickStatusType; cdecl; external libmagickcore; deprecated;
function AcquireOnePixel(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: PExceptionInfo): TPixelPacket; cdecl; external libmagickcore; deprecated;
function AcquireOneVirtualPixel(para1: PImage; para2: TVirtualPixelMethod; para3: Tssize_t; para4: Tssize_t; para5: PExceptionInfo): TPixelPacket; cdecl; external libmagickcore; deprecated;
function GetCacheView(para1: PCacheView; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t): PPixelPacket; cdecl; external libmagickcore; deprecated;
function GetCacheViewPixels(para1: PCacheView; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t): PPixelPacket; cdecl; external libmagickcore; deprecated;
function GetImagePixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t): PPixelPacket; cdecl; external libmagickcore; deprecated;
function GetOnePixel(para1: PImage; para2: Tssize_t; para3: Tssize_t): TPixelPacket; cdecl; external libmagickcore; deprecated;
function GetPixels(para1: PImage): PPixelPacket; cdecl; external libmagickcore; deprecated;
function SetCacheViewPixels(para1: PCacheView; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t): PPixelPacket; cdecl; external libmagickcore; deprecated;
function SetImagePixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t): PPixelPacket; cdecl; external libmagickcore; deprecated;
function InversesRGBCompandor(para1: TMagickRealType): TMagickRealType; cdecl; external libmagickcore; deprecated;
function sRGBCompandor(para1: TMagickRealType): TMagickRealType; cdecl; external libmagickcore; deprecated;
function GetImageListSize(para1: PImage): Tsize_t; cdecl; external libmagickcore; deprecated;
function PopImagePixels(para1: PImage; para2: TQuantumType; para3: pbyte): Tsize_t; cdecl; external libmagickcore; deprecated;
function PushImagePixels(para1: PImage; para2: TQuantumType; para3: pbyte): Tsize_t; cdecl; external libmagickcore; deprecated;
function FormatMagickString(para1: pchar; para2: Tsize_t; para3: pchar; args: array of const): Tssize_t; cdecl; external libmagickcore; deprecated;
function FormatMagickString(para1: pchar; para2: Tsize_t; para3: pchar): Tssize_t; cdecl; external libmagickcore; deprecated;
function FormatMagickStringList(para1: pchar; para2: Tsize_t; para3: pchar; para4: Tva_list): Tssize_t; cdecl; external libmagickcore; deprecated;
function GetImageListIndex(para1: PImage): Tssize_t; cdecl; external libmagickcore; deprecated;
function SetMagickRegistry(para1: TRegistryType; para2: pointer; para3: Tsize_t; para4: PExceptionInfo): Tssize_t; cdecl; external libmagickcore; deprecated;
function ChannelImage(para1: PImage; para2: TChannelType): dword; cdecl; external libmagickcore; deprecated;
function ChannelThresholdImage(para1: PImage; para2: pchar): dword; cdecl; external libmagickcore; deprecated;
function DispatchImage(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t; para6: pchar; para7: TStorageType; para8: pointer; para9: PExceptionInfo): dword; cdecl; external libmagickcore; deprecated;
function FuzzyColorMatch(para1: PPixelPacket; para2: PPixelPacket; para3: double): dword; cdecl; external libmagickcore; deprecated;
function GetNumberScenes(para1: PImage): dword; cdecl; external libmagickcore; deprecated;
function GetMagickGeometry(para1: pchar; para2: Pssize_t; para3: Pssize_t; para4: Psize_t; para5: Psize_t): dword; cdecl; external libmagickcore; deprecated;
function IsSubimage(para1: pchar; para2: dword): dword; cdecl; external libmagickcore; deprecated;
function PushImageList(para1: PPImage; para2: PImage; para3: PExceptionInfo): dword; cdecl; external libmagickcore; deprecated;
function QuantizationError(para1: PImage): dword; cdecl; external libmagickcore; deprecated;
function RandomChannelThresholdImage(para1: PImage; para2: pchar; para3: pchar; para4: PExceptionInfo): dword; cdecl; external libmagickcore; deprecated;
function SetImageList(para1: PPImage; para2: PImage; para3: Tssize_t; para4: PExceptionInfo): dword; cdecl; external libmagickcore; deprecated;
function TransformColorspace(para1: PImage; para2: TColorspaceType): dword; cdecl; external libmagickcore; deprecated;
function ThresholdImage(para1: PImage; para2: double): dword; cdecl; external libmagickcore; deprecated;
function ThresholdImageChannel(para1: PImage; para2: pchar): dword; cdecl; external libmagickcore; deprecated;
function UnshiftImageList(para1: PPImage; para2: PImage; para3: PExceptionInfo): dword; cdecl; external libmagickcore; deprecated;
function AcquireMemory(para1: Tsize_t): pointer; cdecl; external libmagickcore; deprecated;
procedure AcquireSemaphoreInfo(para1: PPSemaphoreInfo); cdecl; external libmagickcore; deprecated;
procedure AllocateNextImage(para1: PImageInfo; para2: PImage); cdecl; external libmagickcore; deprecated;
function CloneMemory(para1: pointer; para2: pointer; para3: Tsize_t): pointer; cdecl; external libmagickcore; deprecated;
procedure ConstituteComponentTerminus; cdecl; external libmagickcore; deprecated;
procedure DestroyConstitute; cdecl; external libmagickcore; deprecated;
procedure DestroyImageAttributes(para1: PImage); cdecl; external libmagickcore; deprecated;
procedure DestroyImages(para1: PImage); cdecl; external libmagickcore; deprecated;
procedure DestroyMagick; cdecl; external libmagickcore; deprecated;
procedure DestroyMagickRegistry; cdecl; external libmagickcore; deprecated;
function GetConfigureBlob(para1: pchar; para2: pchar; para3: Psize_t; para4: PExceptionInfo): pointer; cdecl; external libmagickcore; deprecated;
procedure GetExceptionInfo(para1: PExceptionInfo); cdecl; external libmagickcore; deprecated;
function GetMagickRegistry(para1: Tssize_t; para2: PRegistryType; para3: Psize_t; para4: PExceptionInfo): pointer; cdecl; external libmagickcore; deprecated;
procedure GetTokenToken(para1: pchar; para2: PPchar; para3: pchar); cdecl; external libmagickcore; deprecated;
procedure IdentityAffine(para1: PAffineMatrix); cdecl; external libmagickcore; deprecated;
procedure LiberateMemory(para1: Ppointer); cdecl; external libmagickcore; deprecated;
procedure LiberateSemaphoreInfo(para1: PPSemaphoreInfo); cdecl; external libmagickcore; deprecated;
procedure FormatString(para1: pchar; para2: pchar; args: array of const); cdecl; external libmagickcore; deprecated;
procedure FormatString(para1: pchar; para2: pchar); cdecl; external libmagickcore; deprecated;
procedure FormatStringList(para1: pchar; para2: pchar; para3: Tva_list); cdecl; external libmagickcore; deprecated;
procedure HSLTransform(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum; para6: PQuantum); cdecl; external libmagickcore; deprecated;
procedure InitializeMagick(para1: pchar); cdecl; external libmagickcore; deprecated;
procedure MagickIncarnate(para1: pchar); cdecl; external libmagickcore; deprecated;
procedure ReacquireMemory(para1: Ppointer; para2: Tsize_t); cdecl; external libmagickcore; deprecated;
procedure RelinquishSemaphoreInfo(para1: PSemaphoreInfo); cdecl; external libmagickcore; deprecated;
procedure ResetImageAttributeIterator(para1: PImage); cdecl; external libmagickcore; deprecated;
procedure SetCacheThreshold(para1: Tsize_t); cdecl; external libmagickcore; deprecated;
procedure SetImage(para1: PImage; para2: TQuantum); cdecl; external libmagickcore; deprecated;
procedure Strip(para1: pchar); cdecl; external libmagickcore; deprecated;
procedure TemporaryFilename(para1: pchar); cdecl; external libmagickcore; deprecated;
procedure TransformHSL(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble; para6: Pdouble); cdecl; external libmagickcore; deprecated;
function CropImageToHBITMAP(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): pointer; cdecl; external libmagickcore; deprecated;
function ImageToHBITMAP(para1: PImage; para2: PExceptionInfo): pointer; cdecl; external libmagickcore; deprecated;

// === Konventiert am: 6-1-26 14:00:57 ===


implementation



end.
