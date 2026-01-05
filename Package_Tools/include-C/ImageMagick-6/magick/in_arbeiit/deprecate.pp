
unit deprecate;
interface

{
  Automatically converted by H2Pas 1.0.0 from deprecate.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    deprecate.h
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
PAffineMatrix  = ^AffineMatrix;
Pbyte  = ^byte;
PCacheView  = ^CacheView;
Pchar  = ^char;
Pdouble  = ^double;
PDrawInfo  = ^DrawInfo;
PExceptionInfo  = ^ExceptionInfo;
PExtendedRationalType  = ^ExtendedRationalType;
PExtendedSignedIntegralType  = ^ExtendedSignedIntegralType;
PExtendedUnsignedIntegralType  = ^ExtendedUnsignedIntegralType;
PFILE  = ^FILE;
PImage  = ^Image;
PImageAttribute  = ^ImageAttribute;
PImageInfo  = ^ImageInfo;
PIndexPacket  = ^IndexPacket;
PMagickLayerMethod  = ^MagickLayerMethod;
PMagickPixelPacket  = ^MagickPixelPacket;
PPixelPacket  = ^PixelPacket;
PQuantizeInfo  = ^QuantizeInfo;
PQuantum  = ^Quantum;
PRectangleInfo  = ^RectangleInfo;
PRegistryType  = ^RegistryType;
PSemaphoreInfo  = ^SemaphoreInfo;
Psize_t  = ^size_t;
Pssize_t  = ^ssize_t;
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
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

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

function CloseCacheView(para1:PCacheView):PCacheView;cdecl;external;
(* Const before type ignored *)
function OpenCacheView(para1:PImage):PCacheView;cdecl;external;
(* Const before type ignored *)
function AllocateString(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function InterpretImageAttributes(para1:PImageInfo; para2:PImage; para3:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function PostscriptGeometry(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TranslateText(para1:PImageInfo; para2:PImage; para3:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetImageAttribute(para1:PImage; para2:Pchar):PImageAttribute;cdecl;external;
(* Const before type ignored *)
function GetImageClippingPathAttribute(para1:PImage):PImageAttribute;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetNextImageAttribute(para1:PImage):PImageAttribute;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function AcquireCacheViewIndexes(para1:PCacheView):PIndexPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function AcquireIndexes(para1:PImage):PIndexPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function AcquirePixels(para1:PImage):PPixelPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function AcquireCacheViewPixels(para1:PCacheView; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:PExceptionInfo):PPixelPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function AcquireImagePixels(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:PExceptionInfo):PPixelPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function OpenMagickStream(para1:Pchar; para2:Pchar):PFILE;cdecl;external;
(* Const before type ignored *)
function AllocateImage(para1:PImageInfo):PImage;cdecl;external;
(* Const before type ignored *)
function AverageImages(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function ExtractSubimageFromImage(para1:PImage; para2:PImage; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function GetImageFromMagickRegistry(para1:Pchar; id:Pssize_t; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetImageList(para1:PImage; para2:Tssize_t; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function GetNextImage(para1:PImage):PImage;cdecl;external;
(* Const before type ignored *)
function GetPreviousImage(para1:PImage):PImage;cdecl;external;
function FlattenImages(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function MaximumImages(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MedianFilterImage(para1:PImage; para2:Tdouble; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ModeImage(para1:PImage; para2:Tdouble; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function MinimumImages(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
function MosaicImages(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
function PopImageList(para1:PPImage):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function RadialBlurImage(para1:PImage; para2:Tdouble; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function RadialBlurImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function RecolorImage(para1:PImage; para2:Tsize_t; para3:Pdouble; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ReduceNoiseImage(para1:PImage; para2:Tdouble; para3:PExceptionInfo):PImage;cdecl;external;
function ShiftImageList(para1:PPImage):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SpliceImageList(para1:PImage; para2:Tssize_t; para3:Tsize_t; para4:PImage; para5:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ZoomImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:PExceptionInfo):PImage;cdecl;external;
function GetCacheViewIndexes(para1:PCacheView):PIndexPacket;cdecl;external;
(* Const before type ignored *)
function GetIndexes(para1:PImage):PIndexPacket;cdecl;external;
(* Const before type ignored *)
function ValidateColormapIndex(para1:PImage; para2:Tsize_t):TIndexPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetImageGeometry(para1:PImage; para2:Pchar; para3:dword; para4:PRectangleInfo):longint;cdecl;external;
(* Const before type ignored *)
function ParseImageGeometry(para1:Pchar; para2:Pssize_t; para3:Pssize_t; para4:Psize_t; para5:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SystemCommand(para1:TMagickBooleanType; para2:TMagickBooleanType; para3:Pchar; para4:PExceptionInfo):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function AcquireOneCacheViewPixel(para1:PCacheView; para2:Tssize_t; para3:Tssize_t; para4:PPixelPacket; para5:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function AcquireOneCacheViewVirtualPixel(para1:PCacheView; para2:TVirtualPixelMethod; para3:Tssize_t; para4:Tssize_t; para5:PPixelPacket; 
           para6:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function AffinityImage(para1:PQuantizeInfo; para2:PImage; para3:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function AffinityImages(para1:PQuantizeInfo; para2:PImage; para3:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function AllocateImageColormap(para1:PImage; para2:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ClipPathImage(para1:PImage; para2:Pchar; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function CloneImageAttributes(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ColorFloodfillImage(para1:PImage; para2:PDrawInfo; para3:TPixelPacket; para4:Tssize_t; para5:Tssize_t; 
           para6:TPaintMethod):TMagickBooleanType;cdecl;external;
function ConstituteComponentGenesis:TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DeleteImageAttribute(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DeleteMagickRegistry(para1:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DescribeImage(para1:PImage; para2:PFILE; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function FormatImageAttribute(para1:PImage; para2:Pchar; para3:Pchar; args:array of const):TMagickBooleanType;cdecl;external;
function FormatImageAttribute(para1:PImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function FormatImageAttributeList(para1:PImage; para2:Pchar; para3:Pchar; para4:Tva_list):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function FormatImagePropertyList(para1:PImage; para2:Pchar; para3:Pchar; para4:Tva_list):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function FuzzyColorCompare(para1:PImage; para2:PPixelPacket; para3:PPixelPacket):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function FuzzyOpacityCompare(para1:PImage; para2:PPixelPacket; para3:PPixelPacket):TMagickBooleanType;cdecl;external;
function InitializeModuleList(para1:PExceptionInfo):TMagickBooleanType;cdecl;external;
function IsMagickInstantiated:TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function LevelImageColors(para1:PImage; para2:TChannelType; para3:PMagickPixelPacket; para4:PMagickPixelPacket; para5:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function LoadMimeLists(para1:Pchar; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickMonitor(para1:Pchar; para2:TMagickOffsetType; para3:TMagickSizeType; para4:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MapImage(para1:PImage; para2:PImage; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MapImages(para1:PImage; para2:PImage; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MatteFloodfillImage(para1:PImage; para2:TPixelPacket; para3:TQuantum; para4:Tssize_t; para5:Tssize_t; 
           para6:TPaintMethod):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function OpaqueImage(para1:PImage; para2:TPixelPacket; para3:TPixelPacket):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function PaintFloodfillImage(para1:PImage; para2:TChannelType; para3:PMagickPixelPacket; para4:Tssize_t; para5:Tssize_t; 
           para6:PDrawInfo; para7:TPaintMethod):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function PaintOpaqueImage(para1:PImage; para2:PMagickPixelPacket; para3:PMagickPixelPacket):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function PaintOpaqueImageChannel(para1:PImage; para2:TChannelType; para3:PMagickPixelPacket; para4:PMagickPixelPacket):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function PaintTransparentImage(para1:PImage; para2:PMagickPixelPacket; para3:TQuantum):TMagickBooleanType;cdecl;external;
function SetExceptionInfo(para1:PExceptionInfo; para2:TExceptionType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SetImageAttribute(para1:PImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external;
function SyncCacheViewPixels(para1:PCacheView):TMagickBooleanType;cdecl;external;
function SyncImagePixels(para1:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TransparentImage(para1:PImage; para2:TPixelPacket; para3:TQuantum):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function AcquireOneMagickPixel(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:PExceptionInfo):TMagickPixelPacket;cdecl;external;
function GetMonitorHandler:TMonitorHandler;cdecl;external;
function SetMonitorHandler(para1:TMonitorHandler):TMonitorHandler;cdecl;external;
function SizeBlob(image:PImage):TMagickOffsetType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function InterpolatePixelColor(para1:PImage; para2:PCacheView; para3:TInterpolatePixelMethod; para4:Tdouble; para5:Tdouble; 
           para6:PExceptionInfo):TMagickPixelPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ParseSizeGeometry(para1:PImage; para2:Pchar; para3:PRectangleInfo):TMagickStatusType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function AcquireOnePixel(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:PExceptionInfo):TPixelPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function AcquireOneVirtualPixel(para1:PImage; para2:TVirtualPixelMethod; para3:Tssize_t; para4:Tssize_t; para5:PExceptionInfo):TPixelPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetCacheView(para1:PCacheView; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PPixelPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetCacheViewPixels(para1:PCacheView; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PPixelPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetImagePixels(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PPixelPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetOnePixel(para1:PImage; para2:Tssize_t; para3:Tssize_t):TPixelPacket;cdecl;external;
(* Const before type ignored *)
function GetPixels(para1:PImage):PPixelPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SetCacheViewPixels(para1:PCacheView; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PPixelPacket;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SetImagePixels(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PPixelPacket;cdecl;external;
(* Const before type ignored *)
function InversesRGBCompandor(para1:TMagickRealType):TMagickRealType;cdecl;external;
(* Const before type ignored *)
function sRGBCompandor(para1:TMagickRealType):TMagickRealType;cdecl;external;
(* Const before type ignored *)
function GetImageListSize(para1:PImage):Tsize_t;cdecl;external;
(* Const before type ignored *)
function PopImagePixels(para1:PImage; para2:TQuantumType; para3:Pbyte):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function PushImagePixels(para1:PImage; para2:TQuantumType; para3:Pbyte):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function FormatMagickString(para1:Pchar; para2:Tsize_t; para3:Pchar; args:array of const):Tssize_t;cdecl;external;
function FormatMagickString(para1:Pchar; para2:Tsize_t; para3:Pchar):Tssize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function FormatMagickStringList(para1:Pchar; para2:Tsize_t; para3:Pchar; para4:Tva_list):Tssize_t;cdecl;external;
(* Const before type ignored *)
function GetImageListIndex(para1:PImage):Tssize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SetMagickRegistry(para1:TRegistryType; para2:pointer; para3:Tsize_t; para4:PExceptionInfo):Tssize_t;cdecl;external;
(* Const before type ignored *)
function ChannelImage(para1:PImage; para2:TChannelType):dword;cdecl;external;
(* Const before type ignored *)
function ChannelThresholdImage(para1:PImage; para2:Pchar):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function DispatchImage(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:Pchar; para7:TStorageType; para8:pointer; para9:PExceptionInfo):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function FuzzyColorMatch(para1:PPixelPacket; para2:PPixelPacket; para3:Tdouble):dword;cdecl;external;
(* Const before type ignored *)
function GetNumberScenes(para1:PImage):dword;cdecl;external;
(* Const before type ignored *)
function GetMagickGeometry(para1:Pchar; para2:Pssize_t; para3:Pssize_t; para4:Psize_t; para5:Psize_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function IsSubimage(para1:Pchar; para2:dword):dword;cdecl;external;
(* Const before type ignored *)
function PushImageList(para1:PPImage; para2:PImage; para3:PExceptionInfo):dword;cdecl;external;
function QuantizationError(para1:PImage):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function RandomChannelThresholdImage(para1:PImage; para2:Pchar; para3:Pchar; para4:PExceptionInfo):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SetImageList(para1:PPImage; para2:PImage; para3:Tssize_t; para4:PExceptionInfo):dword;cdecl;external;
(* Const before type ignored *)
function TransformColorspace(para1:PImage; para2:TColorspaceType):dword;cdecl;external;
(* Const before type ignored *)
function ThresholdImage(para1:PImage; para2:Tdouble):dword;cdecl;external;
(* Const before type ignored *)
function ThresholdImageChannel(para1:PImage; para2:Pchar):dword;cdecl;external;
(* Const before type ignored *)
function UnshiftImageList(para1:PPImage; para2:PImage; para3:PExceptionInfo):dword;cdecl;external;
(* Const before type ignored *)
function AcquireMemory(para1:Tsize_t):pointer;cdecl;external;
procedure AcquireSemaphoreInfo(para1:PPSemaphoreInfo);cdecl;external;
(* Const before type ignored *)
procedure AllocateNextImage(para1:PImageInfo; para2:PImage);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CloneMemory(para1:pointer; para2:pointer; para3:Tsize_t):pointer;cdecl;external;
procedure ConstituteComponentTerminus;cdecl;external;
procedure DestroyConstitute;cdecl;external;
procedure DestroyImageAttributes(para1:PImage);cdecl;external;
procedure DestroyImages(para1:PImage);cdecl;external;
procedure DestroyMagick;cdecl;external;
procedure DestroyMagickRegistry;cdecl;external;
(* Const before type ignored *)
function GetConfigureBlob(para1:Pchar; para2:Pchar; para3:Psize_t; para4:PExceptionInfo):pointer;cdecl;external;
procedure GetExceptionInfo(para1:PExceptionInfo);cdecl;external;
(* Const before type ignored *)
function GetMagickRegistry(para1:Tssize_t; para2:PRegistryType; para3:Psize_t; para4:PExceptionInfo):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure GetTokenToken(para1:Pchar; para2:PPchar; para3:Pchar);cdecl;external;
procedure IdentityAffine(para1:PAffineMatrix);cdecl;external;
procedure LiberateMemory(para1:Ppointer);cdecl;external;
procedure LiberateSemaphoreInfo(para1:PPSemaphoreInfo);cdecl;external;
(* Const before type ignored *)
procedure FormatString(para1:Pchar; para2:Pchar; args:array of const);cdecl;external;
procedure FormatString(para1:Pchar; para2:Pchar);cdecl;external;
(* Const before type ignored *)
procedure FormatStringList(para1:Pchar; para2:Pchar; para3:Tva_list);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure HSLTransform(para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:PQuantum; para5:PQuantum; 
            para6:PQuantum);cdecl;external;
(* Const before type ignored *)
procedure InitializeMagick(para1:Pchar);cdecl;external;
(* Const before type ignored *)
procedure MagickIncarnate(para1:Pchar);cdecl;external;
(* Const before type ignored *)
procedure ReacquireMemory(para1:Ppointer; para2:Tsize_t);cdecl;external;
procedure RelinquishSemaphoreInfo(para1:PSemaphoreInfo);cdecl;external;
(* Const before type ignored *)
procedure ResetImageAttributeIterator(para1:PImage);cdecl;external;
(* Const before type ignored *)
procedure SetCacheThreshold(para1:Tsize_t);cdecl;external;
(* Const before type ignored *)
procedure SetImage(para1:PImage; para2:TQuantum);cdecl;external;
procedure Strip(para1:Pchar);cdecl;external;
procedure TemporaryFilename(para1:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure TransformHSL(para1:TQuantum; para2:TQuantum; para3:TQuantum; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external;
(* Const before type ignored *)
function CropImageToHBITMAP(para1:PImage; para2:PRectangleInfo; para3:PExceptionInfo):pointer;cdecl;external;
function ImageToHBITMAP(para1:PImage; para2:PExceptionInfo):pointer;cdecl;external;
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

implementation


end.
