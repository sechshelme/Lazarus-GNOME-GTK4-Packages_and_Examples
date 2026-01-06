unit deprecate;

interface

uses
  fp_magiccore;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PMagickLayerMethod = ^TMagickLayerMethod;
  TMagickLayerMethod =  Longint;
  Const
    UndefinedMagickLayerMethod = 0;
;
type
  PExtendedSignedIntegralType = ^TExtendedSignedIntegralType;
  TExtendedSignedIntegralType = TMagickOffsetType;

  PExtendedUnsignedIntegralType = ^TExtendedUnsignedIntegralType;
  TExtendedUnsignedIntegralType = TMagickSizeType;

  PExtendedRationalType = ^TExtendedRationalType;
  TExtendedRationalType = TMagickRealType;

  TMonitorHandler = function (para1:Pchar; para2:TMagickOffsetType; para3:TMagickSizeType; para4:PExceptionInfo):TMagickBooleanType;cdecl;
{ deprecated  }

  PImageAttribute = ^TImageAttribute;
  TImageAttribute = record
      key : Pchar;
      value : Pchar;
      compression : TMagickBooleanType;
      previous : PImageAttribute;
      next : PImageAttribute;
    end;

function CloseCacheView(para1:PCacheView):PCacheView;cdecl;external libmagiccore;
function OpenCacheView(para1:PImage):PCacheView;cdecl;external libmagiccore;
function AllocateString(para1:Pchar):Pchar;cdecl;external libmagiccore;
function InterpretImageAttributes(para1:PImageInfo; para2:PImage; para3:Pchar):Pchar;cdecl;external libmagiccore;
function PostscriptGeometry(para1:Pchar):Pchar;cdecl;external libmagiccore;
function TranslateText(para1:PImageInfo; para2:PImage; para3:Pchar):Pchar;cdecl;external libmagiccore;
function GetImageAttribute(para1:PImage; para2:Pchar):PImageAttribute;cdecl;external libmagiccore;
function GetImageClippingPathAttribute(para1:PImage):PImageAttribute;cdecl;external libmagiccore;
function GetNextImageAttribute(para1:PImage):PImageAttribute;cdecl;external libmagiccore;
function AcquireCacheViewIndexes(para1:PCacheView):PIndexPacket;cdecl;external libmagiccore;
function AcquireIndexes(para1:PImage):PIndexPacket;cdecl;external libmagiccore;
function AcquirePixels(para1:PImage):PPixelPacket;cdecl;external libmagiccore;
function AcquireCacheViewPixels(para1:PCacheView; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:PExceptionInfo):PPixelPacket;cdecl;external libmagiccore;
function AcquireImagePixels(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:PExceptionInfo):PPixelPacket;cdecl;external libmagiccore;
function OpenMagickStream(para1:Pchar; para2:Pchar):PFILE;cdecl;external libmagiccore;
function AllocateImage(para1:PImageInfo):PImage;cdecl;external libmagiccore;
function AverageImages(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function ExtractSubimageFromImage(para1:PImage; para2:PImage; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function GetImageFromMagickRegistry(para1:Pchar; id:Pssize_t; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function GetImageList(para1:PImage; para2:Tssize_t; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function GetNextImage(para1:PImage):PImage;cdecl;external libmagiccore;
function GetPreviousImage(para1:PImage):PImage;cdecl;external libmagiccore;
function FlattenImages(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function MaximumImages(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function MedianFilterImage(para1:PImage; para2:Tdouble; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function ModeImage(para1:PImage; para2:Tdouble; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function MinimumImages(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function MosaicImages(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function PopImageList(para1:PPImage):PImage;cdecl;external libmagiccore;
function RadialBlurImage(para1:PImage; para2:Tdouble; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function RadialBlurImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble; para4:PExceptionInfo):PImage;cdecl;external libmagiccore;
function RecolorImage(para1:PImage; para2:Tsize_t; para3:Pdouble; para4:PExceptionInfo):PImage;cdecl;external libmagiccore;
function ReduceNoiseImage(para1:PImage; para2:Tdouble; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function ShiftImageList(para1:PPImage):PImage;cdecl;external libmagiccore;
function SpliceImageList(para1:PImage; para2:Tssize_t; para3:Tsize_t; para4:PImage; para5:PExceptionInfo):PImage;cdecl;external libmagiccore;
function ZoomImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:PExceptionInfo):PImage;cdecl;external libmagiccore;
function GetCacheViewIndexes(para1:PCacheView):PIndexPacket;cdecl;external libmagiccore;
function GetIndexes(para1:PImage):PIndexPacket;cdecl;external libmagiccore;
function ValidateColormapIndex(para1:PImage; para2:Tsize_t):TIndexPacket;cdecl;external libmagiccore;
function GetImageGeometry(para1:PImage; para2:Pchar; para3:dword; para4:PRectangleInfo):longint;cdecl;external libmagiccore;
function ParseImageGeometry(para1:Pchar; para2:Pssize_t; para3:Pssize_t; para4:Psize_t; para5:Psize_t):longint;cdecl;external libmagiccore;
function SystemCommand(para1:TMagickBooleanType; para2:TMagickBooleanType; para3:Pchar; para4:PExceptionInfo):longint;cdecl;external libmagiccore;
function AcquireOneCacheViewPixel(para1:PCacheView; para2:Tssize_t; para3:Tssize_t; para4:PPixelPacket; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function AcquireOneCacheViewVirtualPixel(para1:PCacheView; para2:TVirtualPixelMethod; para3:Tssize_t; para4:Tssize_t; para5:PPixelPacket; 
           para6:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function AffinityImage(para1:PQuantizeInfo; para2:PImage; para3:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function AffinityImages(para1:PQuantizeInfo; para2:PImage; para3:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function AllocateImageColormap(para1:PImage; para2:Tsize_t):TMagickBooleanType;cdecl;external libmagiccore;
function ClipPathImage(para1:PImage; para2:Pchar; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
function CloneImageAttributes(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function ColorFloodfillImage(para1:PImage; para2:PDrawInfo; para3:TPixelPacket; para4:Tssize_t; para5:Tssize_t; 
           para6:TPaintMethod):TMagickBooleanType;cdecl;external libmagiccore;
function ConstituteComponentGenesis:TMagickBooleanType;cdecl;external libmagiccore;
function DeleteImageAttribute(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function DeleteMagickRegistry(para1:Tssize_t):TMagickBooleanType;cdecl;external libmagiccore;
function DescribeImage(para1:PImage; para2:PFILE; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
function FormatImageAttribute(para1:PImage; para2:Pchar; para3:Pchar; args:array of const):TMagickBooleanType;cdecl;external libmagiccore;
function FormatImageAttribute(para1:PImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function FormatImageAttributeList(para1:PImage; para2:Pchar; para3:Pchar; para4:Tva_list):TMagickBooleanType;cdecl;external libmagiccore;
function FormatImagePropertyList(para1:PImage; para2:Pchar; para3:Pchar; para4:Tva_list):TMagickBooleanType;cdecl;external libmagiccore;
function FuzzyColorCompare(para1:PImage; para2:PPixelPacket; para3:PPixelPacket):TMagickBooleanType;cdecl;external libmagiccore;
function FuzzyOpacityCompare(para1:PImage; para2:PPixelPacket; para3:PPixelPacket):TMagickBooleanType;cdecl;external libmagiccore;
function InitializeModuleList(para1:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function IsMagickInstantiated:TMagickBooleanType;cdecl;external libmagiccore;
function LevelImageColors(para1:PImage; para2:TChannelType; para3:PMagickPixelPacket; para4:PMagickPixelPacket; para5:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
function LoadMimeLists(para1:Pchar; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function MagickMonitor(para1:Pchar; para2:TMagickOffsetType; para3:TMagickSizeType; para4:pointer):TMagickBooleanType;cdecl;external libmagiccore;
function MapImage(para1:PImage; para2:PImage; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
function MapImages(para1:PImage; para2:PImage; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
function MatteFloodfillImage(para1:PImage; para2:TPixelPacket; para3:TQuantum; para4:Tssize_t; para5:Tssize_t; 
           para6:TPaintMethod):TMagickBooleanType;cdecl;external libmagiccore;
function OpaqueImage(para1:PImage; para2:TPixelPacket; para3:TPixelPacket):TMagickBooleanType;cdecl;external libmagiccore;
function PaintFloodfillImage(para1:PImage; para2:TChannelType; para3:PMagickPixelPacket; para4:Tssize_t; para5:Tssize_t; 
           para6:PDrawInfo; para7:TPaintMethod):TMagickBooleanType;cdecl;external libmagiccore;
function PaintOpaqueImage(para1:PImage; para2:PMagickPixelPacket; para3:PMagickPixelPacket):TMagickBooleanType;cdecl;external libmagiccore;
function PaintOpaqueImageChannel(para1:PImage; para2:TChannelType; para3:PMagickPixelPacket; para4:PMagickPixelPacket):TMagickBooleanType;cdecl;external libmagiccore;
function PaintTransparentImage(para1:PImage; para2:PMagickPixelPacket; para3:TQuantum):TMagickBooleanType;cdecl;external libmagiccore;
function SetExceptionInfo(para1:PExceptionInfo; para2:TExceptionType):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageAttribute(para1:PImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function SyncCacheViewPixels(para1:PCacheView):TMagickBooleanType;cdecl;external libmagiccore;
function SyncImagePixels(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function TransparentImage(para1:PImage; para2:TPixelPacket; para3:TQuantum):TMagickBooleanType;cdecl;external libmagiccore;
function AcquireOneMagickPixel(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:PExceptionInfo):TMagickPixelPacket;cdecl;external libmagiccore;
function GetMonitorHandler:TMonitorHandler;cdecl;external libmagiccore;
function SetMonitorHandler(para1:TMonitorHandler):TMonitorHandler;cdecl;external libmagiccore;
function SizeBlob(image:PImage):TMagickOffsetType;cdecl;external libmagiccore;
function InterpolatePixelColor(para1:PImage; para2:PCacheView; para3:TInterpolatePixelMethod; para4:Tdouble; para5:Tdouble; 
           para6:PExceptionInfo):TMagickPixelPacket;cdecl;external libmagiccore;
function ParseSizeGeometry(para1:PImage; para2:Pchar; para3:PRectangleInfo):TMagickStatusType;cdecl;external libmagiccore;
function AcquireOnePixel(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:PExceptionInfo):TPixelPacket;cdecl;external libmagiccore;
function AcquireOneVirtualPixel(para1:PImage; para2:TVirtualPixelMethod; para3:Tssize_t; para4:Tssize_t; para5:PExceptionInfo):TPixelPacket;cdecl;external libmagiccore;
function GetCacheView(para1:PCacheView; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PPixelPacket;cdecl;external libmagiccore;
function GetCacheViewPixels(para1:PCacheView; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PPixelPacket;cdecl;external libmagiccore;
function GetImagePixels(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PPixelPacket;cdecl;external libmagiccore;
function GetOnePixel(para1:PImage; para2:Tssize_t; para3:Tssize_t):TPixelPacket;cdecl;external libmagiccore;
function GetPixels(para1:PImage):PPixelPacket;cdecl;external libmagiccore;
function SetCacheViewPixels(para1:PCacheView; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PPixelPacket;cdecl;external libmagiccore;
function SetImagePixels(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PPixelPacket;cdecl;external libmagiccore;
function InversesRGBCompandor(para1:TMagickRealType):TMagickRealType;cdecl;external libmagiccore;
function sRGBCompandor(para1:TMagickRealType):TMagickRealType;cdecl;external libmagiccore;
function GetImageListSize(para1:PImage):Tsize_t;cdecl;external libmagiccore;
function PopImagePixels(para1:PImage; para2:TQuantumType; para3:Pbyte):Tsize_t;cdecl;external libmagiccore;
function PushImagePixels(para1:PImage; para2:TQuantumType; para3:Pbyte):Tsize_t;cdecl;external libmagiccore;
function FormatMagickString(para1:Pchar; para2:Tsize_t; para3:Pchar; args:array of const):Tssize_t;cdecl;external libmagiccore;
function FormatMagickString(para1:Pchar; para2:Tsize_t; para3:Pchar):Tssize_t;cdecl;external libmagiccore;
function FormatMagickStringList(para1:Pchar; para2:Tsize_t; para3:Pchar; para4:Tva_list):Tssize_t;cdecl;external libmagiccore;
function GetImageListIndex(para1:PImage):Tssize_t;cdecl;external libmagiccore;
function SetMagickRegistry(para1:TRegistryType; para2:pointer; para3:Tsize_t; para4:PExceptionInfo):Tssize_t;cdecl;external libmagiccore;
function ChannelImage(para1:PImage; para2:TChannelType):dword;cdecl;external libmagiccore;
function ChannelThresholdImage(para1:PImage; para2:Pchar):dword;cdecl;external libmagiccore;
function DispatchImage(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:Pchar; para7:TStorageType; para8:pointer; para9:PExceptionInfo):dword;cdecl;external libmagiccore;
function FuzzyColorMatch(para1:PPixelPacket; para2:PPixelPacket; para3:Tdouble):dword;cdecl;external libmagiccore;
function GetNumberScenes(para1:PImage):dword;cdecl;external libmagiccore;
function GetMagickGeometry(para1:Pchar; para2:Pssize_t; para3:Pssize_t; para4:Psize_t; para5:Psize_t):dword;cdecl;external libmagiccore;
function IsSubimage(para1:Pchar; para2:dword):dword;cdecl;external libmagiccore;
function PushImageList(para1:PPImage; para2:PImage; para3:PExceptionInfo):dword;cdecl;external libmagiccore;
function QuantizationError(para1:PImage):dword;cdecl;external libmagiccore;
function RandomChannelThresholdImage(para1:PImage; para2:Pchar; para3:Pchar; para4:PExceptionInfo):dword;cdecl;external libmagiccore;
function SetImageList(para1:PPImage; para2:PImage; para3:Tssize_t; para4:PExceptionInfo):dword;cdecl;external libmagiccore;
function TransformColorspace(para1:PImage; para2:TColorspaceType):dword;cdecl;external libmagiccore;
function ThresholdImage(para1:PImage; para2:Tdouble):dword;cdecl;external libmagiccore;
function ThresholdImageChannel(para1:PImage; para2:Pchar):dword;cdecl;external libmagiccore;
function UnshiftImageList(para1:PPImage; para2:PImage; para3:PExceptionInfo):dword;cdecl;external libmagiccore;
function AcquireMemory(para1:Tsize_t):pointer;cdecl;external libmagiccore;
procedure AcquireSemaphoreInfo(para1:PPSemaphoreInfo);cdecl;external libmagiccore;
procedure AllocateNextImage(para1:PImageInfo; para2:PImage);cdecl;external libmagiccore;
function CloneMemory(para1:pointer; para2:pointer; para3:Tsize_t):pointer;cdecl;external libmagiccore;
procedure ConstituteComponentTerminus;cdecl;external libmagiccore;
procedure DestroyConstitute;cdecl;external libmagiccore;
procedure DestroyImageAttributes(para1:PImage);cdecl;external libmagiccore;
procedure DestroyImages(para1:PImage);cdecl;external libmagiccore;
procedure DestroyMagick;cdecl;external libmagiccore;
procedure DestroyMagickRegistry;cdecl;external libmagiccore;
function GetConfigureBlob(para1:Pchar; para2:Pchar; para3:Psize_t; para4:PExceptionInfo):pointer;cdecl;external libmagiccore;
procedure GetExceptionInfo(para1:PExceptionInfo);cdecl;external libmagiccore;
function GetMagickRegistry(para1:Tssize_t; para2:PRegistryType; para3:Psize_t; para4:PExceptionInfo):pointer;cdecl;external libmagiccore;
procedure GetTokenToken(para1:Pchar; para2:PPchar; para3:Pchar);cdecl;external libmagiccore;
procedure IdentityAffine(para1:PAffineMatrix);cdecl;external libmagiccore;
procedure LiberateMemory(para1:Ppointer);cdecl;external libmagiccore;
procedure LiberateSemaphoreInfo(para1:PPSemaphoreInfo);cdecl;external libmagiccore;
procedure FormatString(para1:Pchar; para2:Pchar; args:array of const);cdecl;external libmagiccore;
procedure FormatString(para1:Pchar; para2:Pchar);cdecl;external libmagiccore;
procedure FormatStringList(para1:Pchar; para2:Pchar; para3:Tva_list);cdecl;external libmagiccore;
procedure HSLTransform(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external libmagiccore;
procedure InitializeMagick(para1:Pchar);cdecl;external libmagiccore;
procedure MagickIncarnate(para1:Pchar);cdecl;external libmagiccore;
procedure ReacquireMemory(para1:Ppointer; para2:Tsize_t);cdecl;external libmagiccore;
procedure RelinquishSemaphoreInfo(para1:PSemaphoreInfo);cdecl;external libmagiccore;
procedure ResetImageAttributeIterator(para1:PImage);cdecl;external libmagiccore;
procedure SetCacheThreshold(para1:Tsize_t);cdecl;external libmagiccore;
procedure SetImage(para1:PImage; para2:TQuantum);cdecl;external libmagiccore;
procedure Strip(para1:Pchar);cdecl;external libmagiccore;
procedure TemporaryFilename(para1:Pchar);cdecl;external libmagiccore;
procedure TransformHSL(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external libmagiccore;
function CropImageToHBITMAP(para1:PImage; para2:PRectangleInfo; para3:PExceptionInfo):pointer;cdecl;external libmagiccore;
function ImageToHBITMAP(para1:PImage; para2:PExceptionInfo):pointer;cdecl;external libmagiccore;
{xxxxxxxxxxxxxxx
  Inline methods.
static inline double MagickEpsilonReciprocal(const double x)

  double
    sign;

  sign=x < 0.0 ? -1.0 : 1.0;
  if ((sign*x) >= MagickEpsilon)
    return(1.0/x);
  return(sign/MagickEpsilon);


static inline Quantum PixelIntensityToQuantum(
  const Image *magick_restrict image,const PixelPacket *magick_restrict pixel)

  return(ClampToQuantum(GetPixelIntensity(image,pixel)));

 }
{$endif}

// === Konventiert am: 6-1-26 14:00:57 ===


implementation



end.
