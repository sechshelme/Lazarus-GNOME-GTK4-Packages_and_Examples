  // ==== /usr/include/ImageMagick-6/magick/ImageMagick.h

  // ==== /usr/include/ImageMagick-6/magick/MagickCore.h



  // ==== /usr/include/ImageMagick-6/magick/animate.h

function AnimateImages(para1: PImageInfo; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/annotate.h

function AnnotateComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function AnnotateImage(para1: PImage; para2: PDrawInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetMultilineTypeMetrics(para1: PImage; para2: PDrawInfo; para3: PTypeMetric): TMagickBooleanType; cdecl; external libmagickcore;
function GetTypeMetrics(para1: PImage; para2: PDrawInfo; para3: PTypeMetric): TMagickBooleanType; cdecl; external libmagickcore;
function FormatMagickCaption(para1: PImage; para2: PDrawInfo; para3: TMagickBooleanType; para4: PTypeMetric; para5: PPchar): Tssize_t; cdecl; external libmagickcore;
procedure AnnotateComponentTerminus; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/artifact.h

function GetNextImageArtifact(para1: PImage): pchar; cdecl; external libmagickcore;
function RemoveImageArtifact(para1: PImage; para2: pchar): pchar; cdecl; external libmagickcore;
function GetImageArtifact(para1: PImage; para2: pchar): pchar; cdecl; external libmagickcore;
function CloneImageArtifacts(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function DefineImageArtifact(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function DeleteImageArtifact(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageArtifact(para1: PImage; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
procedure DestroyImageArtifacts(para1: PImage); cdecl; external libmagickcore;
procedure ResetImageArtifactIterator(para1: PImage); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/attribute.h

function GetImageType(para1: PImage; para2: PExceptionInfo): TImageType; cdecl; external libmagickcore;
function IdentifyImageGray(para1: PImage; para2: PExceptionInfo): TImageType; cdecl; external libmagickcore;
function IdentifyImageType(para1: PImage; para2: PExceptionInfo): TImageType; cdecl; external libmagickcore;
function IdentifyImageMonochrome(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsGrayImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsMonochromeImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsOpaqueImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageChannelDepth(para1: PImage; para2: TChannelType; para3: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageDepth(para1: PImage; para2: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageType(para1: PImage; para2: TImageType): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageBoundingBox(para1: PImage; exception: PExceptionInfo): TRectangleInfo; cdecl; external libmagickcore;
function GetImageChannelDepth(para1: PImage; para2: TChannelType; para3: PExceptionInfo): Tsize_t; cdecl; external libmagickcore;
function GetImageDepth(para1: PImage; para2: PExceptionInfo): Tsize_t; cdecl; external libmagickcore;
function GetImageQuantumDepth(para1: PImage; para2: TMagickBooleanType): Tsize_t; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/blob.h

function GetBlobFileHandle(para1: PImage): PFILE; cdecl; external libmagickcore;
function BlobToImage(para1: PImageInfo; para2: pointer; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PingBlob(para1: PImageInfo; para2: pointer; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function BlobToFile(para1: pchar; para2: pointer; para3: Tsize_t; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function FileToImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function GetBlobError(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function ImageToFile(para1: PImage; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function InjectImageBlob(para1: PImageInfo; para2: PImage; para3: PImage; para4: pchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsBlobExempt(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function IsBlobSeekable(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function IsBlobTemporary(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function GetBlobSize(para1: PImage): TMagickSizeType; cdecl; external libmagickcore;
function GetBlobStreamHandler(para1: PImage): TStreamHandler; cdecl; external libmagickcore;
function FileToBlob(para1: pchar; para2: Tsize_t; para3: Psize_t; para4: PExceptionInfo): pbyte; cdecl; external libmagickcore;
function GetBlobStreamData(para1: PImage): pbyte; cdecl; external libmagickcore;
function ImageToBlob(para1: PImageInfo; para2: PImage; para3: Psize_t; para4: PExceptionInfo): pbyte; cdecl; external libmagickcore;
function ImagesToBlob(para1: PImageInfo; para2: PImage; para3: Psize_t; para4: PExceptionInfo): pbyte; cdecl; external libmagickcore;
procedure DestroyBlob(para1: PImage); cdecl; external libmagickcore;
procedure DuplicateBlob(para1: PImage; para2: PImage); cdecl; external libmagickcore;
procedure SetBlobExempt(para1: PImage; para2: TMagickBooleanType); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/cache.h

function GetImagePixelCacheType(para1: PImage): TCacheType; cdecl; external libmagickcore;
function GetPixelCacheFilename(para1: PImage): pchar; cdecl; external libmagickcore;
function GetVirtualIndexQueue(para1: PImage): PIndexPacket; cdecl; external libmagickcore;
function GetVirtualPixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PPixelPacket; cdecl; external libmagickcore;
function GetVirtualPixelQueue(para1: PImage): PPixelPacket; cdecl; external libmagickcore;
function AcquirePixelCachePixels(para1: PImage; para2: PMagickSizeType; para3: PExceptionInfo): pointer; cdecl; external libmagickcore;
function GetAuthenticIndexQueue(para1: PImage): PIndexPacket; cdecl; external libmagickcore;
function CacheComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function GetOneVirtualMagickPixel(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: PMagickPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetOneVirtualPixel(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: PPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetOneVirtualMethodPixel(para1: PImage; para2: TVirtualPixelMethod; para3: Tssize_t; para4: Tssize_t; para5: PPixelPacket;
  para6: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetOneAuthenticPixel(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: PPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function PersistPixelCache(para1: PImage; para2: pchar; para3: TMagickBooleanType; para4: PMagickOffsetType; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SyncAuthenticPixels(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageExtent(para1: PImage): TMagickSizeType; cdecl; external libmagickcore;
function GetAuthenticPixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PPixelPacket; cdecl; external libmagickcore;
function GetAuthenticPixelQueue(para1: PImage): PPixelPacket; cdecl; external libmagickcore;
function QueueAuthenticPixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PPixelPacket; cdecl; external libmagickcore;
function GetPixelCacheVirtualMethod(para1: PImage): TVirtualPixelMethod; cdecl; external libmagickcore;
function SetPixelCacheVirtualMethod(para1: PImage; para2: TVirtualPixelMethod): TVirtualPixelMethod; cdecl; external libmagickcore;
procedure CacheComponentTerminus; cdecl; external libmagickcore;
function GetPixelCachePixels(para1: PImage; para2: PMagickSizeType; para3: PExceptionInfo): pointer; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/cache-view.h

function AcquireAuthenticCacheView(para1: PImage; para2: PExceptionInfo): PCacheView; cdecl; external libmagickcore;
function AcquireCacheView(para1: PImage): PCacheView; cdecl; external libmagickcore;
function AcquireVirtualCacheView(para1: PImage; para2: PExceptionInfo): PCacheView; cdecl; external libmagickcore;
function CloneCacheView(para1: PCacheView): PCacheView; cdecl; external libmagickcore;
function DestroyCacheView(para1: PCacheView): PCacheView; cdecl; external libmagickcore;
function GetCacheViewStorageClass(para1: PCacheView): TClassType; cdecl; external libmagickcore;
function GetCacheViewColorspace(para1: PCacheView): TColorspaceType; cdecl; external libmagickcore;
function GetCacheViewVirtualIndexQueue(para1: PCacheView): PIndexPacket; cdecl; external libmagickcore;
function GetCacheViewVirtualPixels(para1: PCacheView; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PPixelPacket; cdecl; external libmagickcore;
function GetCacheViewVirtualPixelQueue(para1: PCacheView): PPixelPacket; cdecl; external libmagickcore;
function GetCacheViewException(para1: PCacheView): PExceptionInfo; cdecl; external libmagickcore;
function GetCacheViewAuthenticIndexQueue(para1: PCacheView): PIndexPacket; cdecl; external libmagickcore;
function GetOneCacheViewAuthenticPixel(magick_restrict: PCacheView; para2: Tssize_t; para3: Tssize_t; magick_restrict2: PPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetOneCacheViewVirtualMethodPixel(para1: PCacheView; para2: TVirtualPixelMethod; para3: Tssize_t; para4: Tssize_t; para5: PPixelPacket;
  para6: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetOneCacheViewVirtualPixel(magick_restrict: PCacheView; para2: Tssize_t; para3: Tssize_t; magick_restrict2: PPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetCacheViewStorageClass(para1: PCacheView; para2: TClassType): TMagickBooleanType; cdecl; external libmagickcore;
function SetCacheViewVirtualPixelMethod(magick_restrict: PCacheView; para2: TVirtualPixelMethod): TMagickBooleanType; cdecl; external libmagickcore;
function SyncCacheViewAuthenticPixels(magick_restrict: PCacheView; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetCacheViewExtent(para1: PCacheView): TMagickSizeType; cdecl; external libmagickcore;
function GetCacheViewChannels(para1: PCacheView): Tsize_t; cdecl; external libmagickcore;
function GetCacheViewAuthenticPixelQueue(para1: PCacheView): PPixelPacket; cdecl; external libmagickcore;
function GetCacheViewAuthenticPixels(para1: PCacheView; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PPixelPacket; cdecl; external libmagickcore;
function QueueCacheViewAuthenticPixels(para1: PCacheView; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PPixelPacket; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/channel.h

function CombineImages(para1: PImage; para2: TChannelType; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SeparateImage(para1: PImage; para2: TChannelType; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SeparateImages(para1: PImage; para2: TChannelType; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function GetImageAlphaChannel(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function SeparateImageChannel(para1: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageAlphaChannel(para1: PImage; para2: TAlphaChannelType): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/cipher.h

function DecipherImage(para1: PImage; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function EncipherImage(para1: PImage; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function PasskeyDecipherImage(para1: PImage; para2: PStringInfo; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function PasskeyEncipherImage(para1: PImage; para2: PStringInfo; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/client.h

function GetClientPath: pchar; cdecl; external libmagickcore;
function GetClientName: pchar; cdecl; external libmagickcore;
function SetClientName(para1: pchar): pchar; cdecl; external libmagickcore;
function SetClientPath(para1: pchar): pchar; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/coder.h

function GetCoderList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function GetCoderInfo(para1: pchar; para2: PExceptionInfo): PCoderInfo; cdecl; external libmagickcore;
function GetCoderInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPCoderInfo; cdecl; external libmagickcore;
function CoderComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function ListCoderInfo(para1: PFILE; para2: PExceptionInfo): TCoderInfo; cdecl; external libmagickcore;
procedure CoderComponentTerminus; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/color.h

function GetColorList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function GetColorInfo(para1: pchar; para2: PExceptionInfo): PColorInfo; cdecl; external libmagickcore;
function GetColorInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPColorInfo; cdecl; external libmagickcore;
function ColorComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function IsColorSimilar(para1: PImage; para2: PPixelPacket; para3: PPixelPacket): TMagickBooleanType; cdecl; external libmagickcore;
function IsImageSimilar(para1: PImage; para2: PImage; x: Pssize_t; y: Pssize_t; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsMagickColorSimilar(para1: PMagickPixelPacket; para2: PMagickPixelPacket): TMagickBooleanType; cdecl; external libmagickcore;
function IsOpacitySimilar(para1: PImage; para2: PPixelPacket; para3: PPixelPacket): TMagickBooleanType; cdecl; external libmagickcore;
function ListColorInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function QueryColorCompliance(para1: pchar; para2: TComplianceType; para3: PPixelPacket; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function QueryColorDatabase(para1: pchar; para2: PPixelPacket; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function QueryColorname(para1: PImage; para2: PPixelPacket; para3: TComplianceType; para4: pchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function QueryMagickColorCompliance(para1: pchar; para2: TComplianceType; para3: PMagickPixelPacket; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function QueryMagickColor(para1: pchar; para2: PMagickPixelPacket; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function QueryMagickColorname(para1: PImage; para2: PMagickPixelPacket; para3: TComplianceType; para4: pchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
procedure ColorComponentTerminus; cdecl; external libmagickcore;
procedure ConcatenateColorComponent(para1: PMagickPixelPacket; para2: TChannelType; para3: TComplianceType; para4: pchar); cdecl; external libmagickcore;
procedure GetColorTuple(para1: PMagickPixelPacket; para2: TMagickBooleanType; para3: pchar); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/colormap.h

function AcquireImageColormap(para1: PImage; para2: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function CycleColormapImage(para1: PImage; para2: Tssize_t): TMagickBooleanType; cdecl; external libmagickcore;
function SortColormapByIntensity(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/colorspace.h

function GetImageColorspaceType(para1: PImage; para2: PExceptionInfo): TColorspaceType; cdecl; external libmagickcore;
function RGBTransformImage(para1: PImage; para2: TColorspaceType): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageColorspace(para1: PImage; para2: TColorspaceType): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageGray(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageMonochrome(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function TransformImageColorspace(para1: PImage; para2: TColorspaceType): TMagickBooleanType; cdecl; external libmagickcore;
function TransformRGBImage(para1: PImage; para2: TColorspaceType): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/compare.h

function GetImageChannelDistortions(para1: PImage; para2: PImage; para3: TMetricType; para4: PExceptionInfo): Pdouble; cdecl; external libmagickcore;
function CompareImageChannels(para1: PImage; para2: PImage; para3: TChannelType; para4: TMetricType; para5: Pdouble;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CompareImages(para1: PImage; para2: PImage; para3: TMetricType; para4: Pdouble; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SimilarityImage(para1: PImage; para2: PImage; para3: PRectangleInfo; para4: Pdouble; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SimilarityMetricImage(para1: PImage; para2: PImage; para3: TMetricType; para4: PRectangleInfo; para5: Pdouble;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function GetImageChannelDistortion(para1: PImage; para2: PImage; para3: TChannelType; para4: TMetricType; para5: Pdouble;
  para6: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageDistortion(para1: PImage; para2: PImage; para3: TMetricType; para4: Pdouble; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsImagesEqual(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/composite.h

function CompositeImage(para1: PImage; para2: TCompositeOperator; para3: PImage; para4: Tssize_t; para5: Tssize_t): TMagickBooleanType; cdecl; external libmagickcore;
function CompositeImageChannel(para1: PImage; para2: TChannelType; para3: TCompositeOperator; para4: PImage; para5: Tssize_t;
  para6: Tssize_t): TMagickBooleanType; cdecl; external libmagickcore;
function TextureImage(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/compress.h

function HuffmanDecodeImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function HuffmanEncodeImage(para1: PImageInfo; para2: PImage; para3: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function LZWEncodeImage(para1: PImage; para2: Tsize_t; magick_restrict: pbyte): TMagickBooleanType; cdecl; external libmagickcore;
function PackbitsEncodeImage(para1: PImage; para2: Tsize_t; magick_restrict: pbyte): TMagickBooleanType; cdecl; external libmagickcore;
function ZLIBEncodeImage(para1: PImage; para2: Tsize_t; magick_restrict: pbyte): TMagickBooleanType; cdecl; external libmagickcore;
procedure Ascii85Encode(para1: PImage; para2: byte); cdecl; external libmagickcore;
procedure Ascii85Flush(para1: PImage); cdecl; external libmagickcore;
procedure Ascii85Initialize(para1: PImage); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/configure.h

function GetConfigureList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function GetConfigureOption(para1: pchar): pchar; cdecl; external libmagickcore;
function GetConfigureValue(para1: PConfigureInfo): pchar; cdecl; external libmagickcore;
function GetConfigureInfo(para1: pchar; para2: PExceptionInfo): PConfigureInfo; cdecl; external libmagickcore;
function GetConfigureInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPConfigureInfo; cdecl; external libmagickcore;
function DestroyConfigureOptions(para1: PLinkedListInfo): PLinkedListInfo; cdecl; external libmagickcore;
function GetConfigurePaths(para1: pchar; para2: PExceptionInfo): PLinkedListInfo; cdecl; external libmagickcore;
function GetConfigureOptions(para1: pchar; para2: PExceptionInfo): PLinkedListInfo; cdecl; external libmagickcore;
function ConfigureComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function ListConfigureInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
procedure ConfigureComponentTerminus; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/constitute.h

function ConstituteImage(para1: Tsize_t; para2: Tsize_t; para3: pchar; para4: TStorageType; para5: pointer;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PingImage(para1: PImageInfo; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PingImages(para1: PImageInfo; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ReadImage(para1: PImageInfo; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ReadImages(para1: PImageInfo; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ReadInlineImage(para1: PImageInfo; para2: pchar; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function WriteImage(para1: PImageInfo; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function WriteImages(para1: PImageInfo; para2: PImage; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/decorate.h

function BorderImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function FrameImage(para1: PImage; para2: PFrameInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function RaiseImage(para1: PImage; para2: PRectangleInfo; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/delegate.h

function GetDelegateCommand(para1: PImageInfo; para2: PImage; para3: pchar; para4: pchar; para5: PExceptionInfo): pchar; cdecl; external libmagickcore;
function GetDelegateList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function GetDelegateCommands(para1: PDelegateInfo): pchar; cdecl; external libmagickcore;
function GetDelegateInfo(para1: pchar; para2: pchar; exception: PExceptionInfo): PDelegateInfo; cdecl; external libmagickcore;
function GetDelegateInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPDelegateInfo; cdecl; external libmagickcore;
function ExternalDelegateCommand(para1: TMagickBooleanType; para2: TMagickBooleanType; para3: pchar; para4: pchar; para5: PExceptionInfo): longint; cdecl; external libmagickcore;
function GetDelegateMode(para1: PDelegateInfo): Tssize_t; cdecl; external libmagickcore;
function DelegateComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function GetDelegateThreadSupport(para1: PDelegateInfo): TMagickBooleanType; cdecl; external libmagickcore;
function InvokeDelegate(para1: PImageInfo; para2: PImage; para3: pchar; para4: pchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ListDelegateInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
procedure DelegateComponentTerminus; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/display.h

function DisplayImages(para1: PImageInfo; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function RemoteDisplayCommand(para1: PImageInfo; para2: pchar; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/distort.h

function AffineTransformImage(para1: PImage; para2: PAffineMatrix; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DistortImage(para1: PImage; para2: TDistortImageMethod; para3: Tsize_t; para4: Pdouble; para5: TMagickBooleanType;
  exception: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DistortResizeImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function RotateImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SparseColorImage(para1: PImage; para2: TChannelType; para3: TSparseColorMethod; para4: Tsize_t; para5: Pdouble;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/distribute-cache.h

procedure DistributePixelCacheServer(para1: longint; para2: PExceptionInfo); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/draw.h

function AcquireDrawInfo: PDrawInfo; cdecl; external libmagickcore;
function CloneDrawInfo(para1: PImageInfo; para2: PDrawInfo): PDrawInfo; cdecl; external libmagickcore;
function DestroyDrawInfo(para1: PDrawInfo): PDrawInfo; cdecl; external libmagickcore;
function DrawAffineImage(para1: PImage; para2: PImage; para3: PAffineMatrix): TMagickBooleanType; cdecl; external libmagickcore;
function DrawClipPath(para1: PImage; para2: PDrawInfo; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function DrawGradientImage(para1: PImage; para2: PDrawInfo): TMagickBooleanType; cdecl; external libmagickcore;
function DrawImage(para1: PImage; para2: PDrawInfo): TMagickBooleanType; cdecl; external libmagickcore;
function DrawPatternPath(para1: PImage; para2: PDrawInfo; para3: pchar; para4: PPImage): TMagickBooleanType; cdecl; external libmagickcore;
function DrawPrimitive(para1: PImage; para2: PDrawInfo; para3: PPrimitiveInfo): TMagickBooleanType; cdecl; external libmagickcore;
procedure GetAffineMatrix(para1: PAffineMatrix); cdecl; external libmagickcore;
procedure GetDrawInfo(para1: PImageInfo; para2: PDrawInfo); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/effect.h

function AdaptiveBlurImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function AdaptiveBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function AdaptiveSharpenImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function AdaptiveSharpenImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function BlurImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function BlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ConvolveImage(para1: PImage; para2: Tsize_t; para3: Pdouble; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ConvolveImageChannel(para1: PImage; para2: TChannelType; para3: Tsize_t; para4: Pdouble; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DespeckleImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function EdgeImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function EmbossImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function FilterImage(para1: PImage; para2: PKernelInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function FilterImageChannel(para1: PImage; para2: TChannelType; para3: PKernelInfo; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function GaussianBlurImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function GaussianBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function KuwaharaImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function KuwaharaImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function LocalContrastImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MotionBlurImage(para1: PImage; para2: double; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MotionBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PreviewImage(para1: PImage; para2: TPreviewType; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function RotationalBlurImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function RotationalBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SelectiveBlurImage(para1: PImage; para2: double; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SelectiveBlurImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ShadeImage(para1: PImage; para2: TMagickBooleanType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SharpenImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SharpenImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SpreadImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function UnsharpMaskImage(para1: PImage; para2: double; para3: double; para4: double; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function UnsharpMaskImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: double;
  para6: double; para7: PExceptionInfo): PImage; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/enhance.h

function AutoGammaImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function AutoGammaImageChannel(para1: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagickcore;
function AutoLevelImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function AutoLevelImageChannel(para1: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagickcore;
function BrightnessContrastImage(para1: PImage; para2: double; para3: double): TMagickBooleanType; cdecl; external libmagickcore;
function BrightnessContrastImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double): TMagickBooleanType; cdecl; external libmagickcore;
function ClutImage(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function ClutImageChannel(para1: PImage; para2: TChannelType; para3: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function ColorDecisionListImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ContrastImage(para1: PImage; para2: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function ContrastStretchImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ContrastStretchImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double): TMagickBooleanType; cdecl; external libmagickcore;
function EqualizeImage(image: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function EqualizeImageChannel(image: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagickcore;
function GammaImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function GammaImageChannel(para1: PImage; para2: TChannelType; para3: double): TMagickBooleanType; cdecl; external libmagickcore;
function GrayscaleImage(para1: PImage; para2: TPixelIntensityMethod): TMagickBooleanType; cdecl; external libmagickcore;
function HaldClutImage(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function HaldClutImageChannel(para1: PImage; para2: TChannelType; para3: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function LevelImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function LevelImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: double): TMagickBooleanType; cdecl; external libmagickcore;
function LevelizeImage(para1: PImage; para2: double; para3: double; para4: double): TMagickBooleanType; cdecl; external libmagickcore;
function LevelizeImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: double; para5: double): TMagickBooleanType; cdecl; external libmagickcore;
function LevelColorsImage(para1: PImage; para2: PMagickPixelPacket; para3: PMagickPixelPacket; para4: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function LevelColorsImageChannel(para1: PImage; para2: TChannelType; para3: PMagickPixelPacket; para4: PMagickPixelPacket; para5: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function LinearStretchImage(para1: PImage; para2: double; para3: double): TMagickBooleanType; cdecl; external libmagickcore;
function ModulateImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function NegateImage(para1: PImage; para2: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function NegateImageChannel(para1: PImage; para2: TChannelType; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function NormalizeImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function NormalizeImageChannel(para1: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagickcore;
function SigmoidalContrastImage(para1: PImage; para2: TMagickBooleanType; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function SigmoidalContrastImageChannel(para1: PImage; para2: TChannelType; para3: TMagickBooleanType; para4: double; para5: double): TMagickBooleanType; cdecl; external libmagickcore;
function EnhanceImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/exception.h

function GetExceptionMessage(para1: longint): pchar; cdecl; external libmagickcore;
function GetLocaleExceptionMessage(para1: TExceptionType; para2: pchar): pchar; cdecl; external libmagickcore;
function SetErrorHandler(para1: TErrorHandler): TErrorHandler; cdecl; external libmagickcore;
function AcquireExceptionInfo: PExceptionInfo; cdecl; external libmagickcore;
function CloneExceptionInfo(para1: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DestroyExceptionInfo(para1: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SetFatalErrorHandler(para1: TFatalErrorHandler): TFatalErrorHandler; cdecl; external libmagickcore;
function ThrowException(para1: PExceptionInfo; para2: TExceptionType; para3: pchar; para4: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ThrowMagickException(para1: PExceptionInfo; para2: pchar; para3: pchar; para4: Tsize_t; para5: TExceptionType;
  para6: pchar; para7: pchar): TMagickBooleanType; cdecl; varargs; external libmagickcore;
function ThrowMagickExceptionList(para1: PExceptionInfo; para2: pchar; para3: pchar; para4: Tsize_t; para5: TExceptionType;
  para6: pchar; para7: pchar; para8: Tva_list): TMagickBooleanType; cdecl; external libmagickcore;
procedure CatchException(para1: PExceptionInfo); cdecl; external libmagickcore;
procedure ClearMagickException(para1: PExceptionInfo); cdecl; external libmagickcore;
procedure InheritException(para1: PExceptionInfo; para2: PExceptionInfo); cdecl; external libmagickcore;
procedure MagickError(para1: TExceptionType; para2: pchar; para3: pchar); cdecl; external libmagickcore;
procedure MagickFatalError(para1: TExceptionType; para2: pchar; para3: pchar); cdecl; external libmagickcore;
procedure MagickWarning(para1: TExceptionType; para2: pchar; para3: pchar); cdecl; external libmagickcore;
function SetWarningHandler(para1: TWarningHandler): TWarningHandler; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/feature.h

function GetImageChannelFeatures(para1: PImage; para2: Tsize_t; para3: PExceptionInfo): PChannelFeatures; cdecl; external libmagickcore;
function CannyEdgeImage(para1: PImage; para2: double; para3: double; para4: double; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function HoughLineImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: Tsize_t; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MeanShiftImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/fourier.h

function ComplexImages(para1: PImage; para2: TComplexOperator; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ForwardFourierTransformImage(para1: PImage; para2: TMagickBooleanType; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function InverseFourierTransformImage(para1: PImage; para2: PImage; para3: TMagickBooleanType; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/fx.h

function FxImage(para1: PImage; para2: pchar; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function FxImageChannel(para1: PImage; para2: TChannelType; para3: pchar; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/gem.h

function ExpandAffine(para1: PAffineMatrix): double; cdecl; external libmagickcore;
function GenerateDifferentialNoise(para1: PRandomInfo; para2: TQuantum; para3: TNoiseType; para4: TMagickRealType): double; cdecl; external libmagickcore;
function GetOptimalKernelWidth(para1: double; para2: double): Tsize_t; cdecl; external libmagickcore;
function GetOptimalKernelWidth1D(para1: double; para2: double): Tsize_t; cdecl; external libmagickcore;
function GetOptimalKernelWidth2D(para1: double; para2: double): Tsize_t; cdecl; external libmagickcore;
procedure ConvertHCLToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertHCLpToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertHSBToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertHSIToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertHSLToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertHSVToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertHWBToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertLCHabToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertLCHuvToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertRGBToHCL(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToHCLp(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToHSB(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToHSI(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToHSL(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToHSV(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToHWB(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToLCHab(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToLCHuv(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/geometry.h

function GetPageGeometry(para1: pchar): pchar; cdecl; external libmagickcore;
function IsGeometry(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function IsSceneGeometry(para1: pchar; para2: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function GetGeometry(para1: pchar; para2: Pssize_t; para3: Pssize_t; para4: Psize_t; para5: Psize_t): TMagickStatusType; cdecl; external libmagickcore;
function ParseAbsoluteGeometry(para1: pchar; para2: PRectangleInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ParseAffineGeometry(para1: pchar; para2: PAffineMatrix; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ParseGeometry(para1: pchar; para2: PGeometryInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ParseGravityGeometry(para1: PImage; para2: pchar; para3: PRectangleInfo; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ParseMetaGeometry(para1: pchar; para2: Pssize_t; para3: Pssize_t; para4: Psize_t; para5: Psize_t): TMagickBooleanType; cdecl; external libmagickcore;
function ParsePageGeometry(para1: PImage; para2: pchar; para3: PRectangleInfo; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ParseRegionGeometry(para1: PImage; para2: pchar; para3: PRectangleInfo; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
procedure GravityAdjustGeometry(para1: Tsize_t; para2: Tsize_t; para3: TGravityType; para4: PRectangleInfo); cdecl; external libmagickcore;
function SetGeometry(para1: PImage; para2: PRectangleInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetGeometryInfo(para1: PGeometryInfo): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/hashmap.h

function DestroyHashmap(para1: PHashmapInfo): PHashmapInfo; cdecl; external libmagickcore;

type
  THashmapHashFunc = function(key: pointer): Tsize_t; cdecl;
  THashmapEqualFunc = function(left: pointer; right: pointer): TMagickBooleanType; cdecl;
  THashmapKeyDestructor = procedure(key: pointer); cdecl;
  THashmapValueDestructor = procedure(value: pointer); cdecl;

function NewHashmap(initial_size: Tsize_t; hash_key: THashmapHashFunc; equal_key: THashmapEqualFunc;
  destroy_key: THashmapKeyDestructor; destroy_value: THashmapValueDestructor): PHashmapInfo; cdecl; external libmagickcore;

type
  TLinkedListDestructor = procedure(data: pointer); cdecl;

function DestroyLinkedList(list: PLinkedListInfo; destroy: TLinkedListDestructor): PLinkedListInfo; cdecl; external libmagickcore;
function NewLinkedList(para1: Tsize_t): PLinkedListInfo; cdecl; external libmagickcore;
function AppendValueToLinkedList(para1: PLinkedListInfo; para2: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function CompareHashmapString(para1: pointer; para2: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function CompareHashmapStringInfo(para1: pointer; para2: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function InsertValueInLinkedList(para1: PLinkedListInfo; para2: Tsize_t; para3: pointer): TMagickBooleanType; cdecl; external libmagickcore;

type
  TLinkedListCompare = function(current: pointer; element: pointer): longint; cdecl;

function InsertValueInSortedLinkedList(list: PLinkedListInfo; compare: TLinkedListCompare; head: PPointer;
  element: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function IsHashmapEmpty(para1: PHashmapInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsLinkedListEmpty(para1: PLinkedListInfo): TMagickBooleanType; cdecl; external libmagickcore;
function LinkedListToArray(para1: PLinkedListInfo; para2: Ppointer): TMagickBooleanType; cdecl; external libmagickcore;
function PutEntryInHashmap(para1: PHashmapInfo; para2: pointer; para3: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function GetNumberOfElementsInLinkedList(para1: PLinkedListInfo): Tsize_t; cdecl; external libmagickcore;
function GetNumberOfEntriesInHashmap(para1: PHashmapInfo): Tsize_t; cdecl; external libmagickcore;
function HashPointerType(para1: pointer): Tsize_t; cdecl; external libmagickcore;
function HashStringType(para1: pointer): Tsize_t; cdecl; external libmagickcore;
function HashStringInfoType(para1: pointer): Tsize_t; cdecl; external libmagickcore;
procedure ClearLinkedList(list: PLinkedListInfo; destroy: TLinkedListDestructor); cdecl; external libmagickcore;
function GetLastValueInLinkedList(para1: PLinkedListInfo): pointer; cdecl; external libmagickcore;
function GetNextKeyInHashmap(para1: PHashmapInfo): pointer; cdecl; external libmagickcore;
function GetNextValueInHashmap(para1: PHashmapInfo): pointer; cdecl; external libmagickcore;
function GetNextValueInLinkedList(para1: PLinkedListInfo): pointer; cdecl; external libmagickcore;
function GetValueFromHashmap(para1: PHashmapInfo; para2: pointer): pointer; cdecl; external libmagickcore;
function GetValueFromLinkedList(para1: PLinkedListInfo; para2: Tsize_t): pointer; cdecl; external libmagickcore;
function RemoveElementByValueFromLinkedList(para1: PLinkedListInfo; para2: pointer): pointer; cdecl; external libmagickcore;
function RemoveElementFromLinkedList(para1: PLinkedListInfo; para2: Tsize_t): pointer; cdecl; external libmagickcore;
function RemoveEntryFromHashmap(para1: PHashmapInfo; para2: pointer): pointer; cdecl; external libmagickcore;
function RemoveLastElementFromLinkedList(para1: PLinkedListInfo): pointer; cdecl; external libmagickcore;
procedure ResetHashmapIterator(para1: PHashmapInfo); cdecl; external libmagickcore;
procedure ResetLinkedListIterator(para1: PLinkedListInfo); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/histogram.h

function GetImageHistogram(para1: PImage; para2: Psize_t; para3: PExceptionInfo): PColorPacket; cdecl; external libmagickcore;
function UniqueImageColors(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function IdentifyPaletteImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsHistogramImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsPaletteImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function MinMaxStretchImage(para1: PImage; para2: TChannelType; para3: double; para4: double): TMagickBooleanType; cdecl; external libmagickcore;
function GetNumberColors(para1: PImage; para2: PFILE; para3: PExceptionInfo): Tsize_t; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/identify.h

function IdentifyImage(para1: PImage; para2: PFILE; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/image.h

function CatchImageException(para1: PImage): TExceptionType; cdecl; external libmagickcore;
function GetImageInfoFile(para1: PImageInfo): PFILE; cdecl; external libmagickcore;
function AcquireImage(para1: PImageInfo): PImage; cdecl; external libmagickcore;
function AppendImages(para1: PImage; para2: TMagickBooleanType; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CloneImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: TMagickBooleanType; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DestroyImage(para1: PImage): PImage; cdecl; external libmagickcore;
function GetImageClipMask(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function GetImageMask(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function NewMagickImage(para1: PImageInfo; para2: Tsize_t; para3: Tsize_t; para4: PMagickPixelPacket): PImage; cdecl; external libmagickcore;
function ReferenceImage(para1: PImage): PImage; cdecl; external libmagickcore;
function SmushImages(para1: PImage; para2: TMagickBooleanType; para3: Tssize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function AcquireImageInfo: PImageInfo; cdecl; external libmagickcore;
function CloneImageInfo(para1: PImageInfo): PImageInfo; cdecl; external libmagickcore;
function DestroyImageInfo(para1: PImageInfo): PImageInfo; cdecl; external libmagickcore;
function ClipImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function ClipImagePath(para1: PImage; para2: pchar; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function CopyImagePixels(para1: PImage; para2: PImage; para3: PRectangleInfo; para4: POffsetInfo; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsTaintImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function IsMagickConflict(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function IsHighDynamicRangeImage(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsImageObject(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function ListMagickInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ModifyImage(para1: PPImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ResetImagePage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ResetImagePixels(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageBackgroundColor(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageClipMask(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageColor(para1: PImage; para2: PMagickPixelPacket): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageExtent(para1: PImage; para2: Tsize_t; para3: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageInfo(para1: PImageInfo; para2: dword; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageMask(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageOpacity(para1: PImage; para2: TQuantum): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageChannels(para1: PImage; para2: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageStorageClass(para1: PImage; para2: TClassType): TMagickBooleanType; cdecl; external libmagickcore;
function StripImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function SyncImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function SyncImageSettings(para1: PImageInfo; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function SyncImagesSettings(para1: PImageInfo; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function InterpretImageFilename(para1: PImageInfo; para2: PImage; para3: pchar; para4: longint; para5: pchar): Tsize_t; cdecl; external libmagickcore;
function GetImageReferenceCount(para1: PImage): Tssize_t; cdecl; external libmagickcore;
function GetImageChannels(para1: PImage): Tsize_t; cdecl; external libmagickcore;
function GetImageVirtualPixelMethod(para1: PImage): TVirtualPixelMethod; cdecl; external libmagickcore;
function SetImageVirtualPixelMethod(para1: PImage; para2: TVirtualPixelMethod): TVirtualPixelMethod; cdecl; external libmagickcore;
procedure AcquireNextImage(para1: PImageInfo; para2: PImage); cdecl; external libmagickcore;
procedure DestroyImagePixels(para1: PImage); cdecl; external libmagickcore;
procedure DisassociateImageStream(para1: PImage); cdecl; external libmagickcore;
procedure GetImageException(para1: PImage; para2: PExceptionInfo); cdecl; external libmagickcore;
procedure GetImageInfo(para1: PImageInfo); cdecl; external libmagickcore;
procedure SetImageInfoBlob(para1: PImageInfo; para2: pointer; para3: Tsize_t); cdecl; external libmagickcore;
procedure SetImageInfoFile(para1: PImageInfo; para2: PFILE); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/image-view.h

function GetImageViewException(para1: PImageView; para2: PExceptionType): pchar; cdecl; external libmagickcore;
function GetImageViewVirtualIndexes(para1: PImageView): PIndexPacket; cdecl; external libmagickcore;
function GetImageViewVirtualPixels(para1: PImageView): PPixelPacket; cdecl; external libmagickcore;
function GetImageViewImage(para1: PImageView): PImage; cdecl; external libmagickcore;
function CloneImageView(para1: PImageView): PImageView; cdecl; external libmagickcore;
function DestroyImageView(para1: PImageView): PImageView; cdecl; external libmagickcore;
function NewImageView(para1: PImage): PImageView; cdecl; external libmagickcore;
function NewImageViewRegion(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t): PImageView; cdecl; external libmagickcore;
function GetImageViewAuthenticIndexes(para1: PImageView): PIndexPacket; cdecl; external libmagickcore;
function DuplexTransferImageViewIterator(para1: PImageView; para2: PImageView; para3: PImageView; para4: TDuplexTransferImageViewMethod; para5: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageViewIterator(para1: PImageView; para2: TGetImageViewMethod; para3: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function IsImageView(para1: PImageView): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageViewIterator(para1: PImageView; para2: TSetImageViewMethod; para3: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function TransferImageViewIterator(para1: PImageView; para2: PImageView; para3: TTransferImageViewMethod; para4: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function UpdateImageViewIterator(para1: PImageView; para2: TUpdateImageViewMethod; para3: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageViewAuthenticPixels(para1: PImageView): PPixelPacket; cdecl; external libmagickcore;
function GetImageViewExtent(para1: PImageView): TRectangleInfo; cdecl; external libmagickcore;
procedure SetImageViewDescription(para1: PImageView; para2: pchar); cdecl; external libmagickcore;
procedure SetImageViewThreads(para1: PImageView; para2: Tsize_t); cdecl; external libmagickcore;


// ==== /usr/include/ImageMagick-6/magick/layer.h

function CoalesceImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DisposeImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CompareImageLayers(para1: PImage; para2: TImageLayerMethod; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DeconstructImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MergeImageLayers(para1: PImage; para2: TImageLayerMethod; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function OptimizeImageLayers(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function OptimizePlusImageLayers(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
procedure CompositeLayers(para1: PImage; para2: TCompositeOperator; para3: PImage; para4: Tssize_t; para5: Tssize_t;
  para6: PExceptionInfo); cdecl; external libmagickcore;
procedure OptimizeImageTransparency(para1: PImage; para2: PExceptionInfo); cdecl; external libmagickcore;
procedure RemoveDuplicateLayers(para1: PPImage; para2: PExceptionInfo); cdecl; external libmagickcore;
procedure RemoveZeroDelayLayers(para1: PPImage; para2: PExceptionInfo); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/list.h

function CloneImageList(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CloneImages(para1: PImage; para2: pchar; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DestroyImageList(para1: PImage): PImage; cdecl; external libmagickcore;
function DuplicateImages(para1: PImage; para2: Tsize_t; para3: pchar; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function GetFirstImageInList(para1: PImage): PImage; cdecl; external libmagickcore;
function GetImageFromList(para1: PImage; para2: Tssize_t): PImage; cdecl; external libmagickcore;
function GetLastImageInList(para1: PImage): PImage; cdecl; external libmagickcore;
function GetNextImageInList(para1: PImage): PImage; cdecl; external libmagickcore;
function GetPreviousImageInList(para1: PImage): PImage; cdecl; external libmagickcore;
function ImageListToArray(para1: PImage; para2: PExceptionInfo): PPImage; cdecl; external libmagickcore;
function NewImageList: PImage; cdecl; external libmagickcore;
function RemoveImageFromList(para1: PPImage): PImage; cdecl; external libmagickcore;
function RemoveLastImageFromList(para1: PPImage): PImage; cdecl; external libmagickcore;
function RemoveFirstImageFromList(para1: PPImage): PImage; cdecl; external libmagickcore;
function SpliceImageIntoList(para1: PPImage; para2: Tsize_t; para3: PImage): PImage; cdecl; external libmagickcore;
function SplitImageList(para1: PImage): PImage; cdecl; external libmagickcore;
function SyncNextImageInList(para1: PImage): PImage; cdecl; external libmagickcore;
function GetImageListLength(para1: PImage): Tsize_t; cdecl; external libmagickcore;
function GetImageIndexInList(para1: PImage): Tssize_t; cdecl; external libmagickcore;
procedure AppendImageToList(para1: PPImage; para2: PImage); cdecl; external libmagickcore;
procedure DeleteImageFromList(para1: PPImage); cdecl; external libmagickcore;
procedure DeleteImages(para1: PPImage; para2: pchar; para3: PExceptionInfo); cdecl; external libmagickcore;
procedure InsertImageInList(para1: PPImage; para2: PImage); cdecl; external libmagickcore;
procedure PrependImageToList(para1: PPImage; para2: PImage); cdecl; external libmagickcore;
procedure ReplaceImageInList(para1: PPImage; para2: PImage); cdecl; external libmagickcore;
procedure ReplaceImageInListReturnLast(para1: PPImage; para2: PImage); cdecl; external libmagickcore;
procedure ReverseImageList(para1: PPImage); cdecl; external libmagickcore;
procedure SyncImageList(para1: PImage); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/locale_.h

function GetLocaleList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function GetLocaleMessage(para1: pchar): pchar; cdecl; external libmagickcore;
function GetLocaleInfo_(para1: pchar; para2: PExceptionInfo): PLocaleInfo; cdecl; external libmagickcore;
function GetLocaleInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPLocaleInfo; cdecl; external libmagickcore;
function InterpretLocaleValue(magick_restrict: pchar; magick_restrict2: PPchar): double; cdecl; external libmagickcore;
function LocaleCompare(para1: pchar; para2: pchar): longint; cdecl; external libmagickcore;
function LocaleLowercase(para1: longint): longint; cdecl; external libmagickcore;
function LocaleNCompare(para1: pchar; para2: pchar; para3: Tsize_t): longint; cdecl; external libmagickcore;
function LocaleUppercase(para1: longint): longint; cdecl; external libmagickcore;
function DestroyLocaleOptions(para1: PLinkedListInfo): PLinkedListInfo; cdecl; external libmagickcore;
function GetLocaleOptions(para1: pchar; para2: PExceptionInfo): PLinkedListInfo; cdecl; external libmagickcore;
function ListLocaleInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function LocaleComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function FormatLocaleFile(para1: PFILE; magick_restrict: pchar; args: array of const): Tssize_t; cdecl; external libmagickcore;
function FormatLocaleFile(para1: PFILE; magick_restrict: pchar): Tssize_t; cdecl; external libmagickcore;
function FormatLocaleFileList(para1: PFILE; magick_restrict: pchar; para3: Tva_list): Tssize_t; cdecl; external libmagickcore;
function FormatLocaleString(magick_restrict: pchar; para2: Tsize_t; magick_restrict2: pchar; args: array of const): Tssize_t; cdecl; external libmagickcore;
function FormatLocaleString(magick_restrict: pchar; para2: Tsize_t; magick_restrict2: pchar): Tssize_t; cdecl; external libmagickcore;
function FormatLocaleStringList(magick_restrict: pchar; para2: Tsize_t; magick_restrict2: pchar; para4: Tva_list): Tssize_t; cdecl; external libmagickcore;
procedure LocaleComponentTerminus; cdecl; external libmagickcore;
procedure LocaleLower(para1: pchar); cdecl; external libmagickcore;
procedure LocaleUpper(para1: pchar); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/log.h

function GetLogInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPLogInfo; cdecl; external libmagickcore;
function GetLogList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPchar; cdecl; external libmagickcore;
function GetLogName: pchar; cdecl; external libmagickcore;
function SetLogName(para1: pchar): pchar; cdecl; external libmagickcore;
function GetLogEventMask: TLogEventType; cdecl; external libmagickcore;
function SetLogEventMask(para1: pchar): TLogEventType; cdecl; external libmagickcore;
function IsEventLogging: TMagickBooleanType; cdecl; external libmagickcore;
function ListLogInfo(para1: PFILE; para2: PExceptionInfo): char; cdecl; external libmagickcore;
function LogComponentGenesis: char; cdecl; external libmagickcore;
function LogMagickEvent(para1: TLogEventType; para2: pchar; para3: pchar; para4: Tsize_t; para5: pchar): char; cdecl; varargs; external libmagickcore;
function LogMagickEventList(para1: TLogEventType; para2: pchar; para3: pchar; para4: Tsize_t; para5: pchar;
  para6: Tva_list): char; cdecl; external libmagickcore;
procedure CloseMagickLog; cdecl; external libmagickcore;
procedure LogComponentTerminus; cdecl; external libmagickcore;
procedure SetLogFormat(para1: pchar); cdecl; external libmagickcore;
procedure SetLogMethod(para1: TMagickLogMethod); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/magic.h

function GetMagicList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function GetMagicName(para1: PMagicInfo): pchar; cdecl; external libmagickcore;
function ListMagicInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function MagicComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function GetMagicInfo(para1: pbyte; para2: Tsize_t; para3: PExceptionInfo): PMagicInfo; cdecl; external libmagickcore;
function GetMagicInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPMagicInfo; cdecl; external libmagickcore;
procedure MagicComponentTerminus; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/magick.h

function GetMagickList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function GetMagickDescription(para1: PMagickInfo): pchar; cdecl; external libmagickcore;
function GetMagickMimeType(para1: PMagickInfo): pchar; cdecl; external libmagickcore;
function GetImageDecoder(para1: PMagickInfo): TDecodeImageHandler; cdecl; external libmagickcore;
function GetImageEncoder(para1: PMagickInfo): TEncodeImageHandler; cdecl; external libmagickcore;
function GetMagickPrecision: longint; cdecl; external libmagickcore;
function SetMagickPrecision(para1: longint): longint; cdecl; external libmagickcore;
function GetImageMagick(para1: pbyte; para2: Tsize_t; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function GetMagickAdjoin(para1: PMagickInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetMagickBlobSupport(para1: PMagickInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetMagickEndianSupport(para1: PMagickInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetMagickRawSupport(para1: PMagickInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetMagickSeekableStream(para1: PMagickInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsMagickCoreInstantiated: TMagickBooleanType; cdecl; external libmagickcore;
function MagickComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function UnregisterMagickInfo(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function GetMagickInfo(para1: pchar; para2: PExceptionInfo): PMagickInfo; cdecl; external libmagickcore;
function GetMagickInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPMagickInfo; cdecl; external libmagickcore;
function RegisterMagickInfo(para1: PMagickInfo): PMagickInfo; cdecl; external libmagickcore;
function SetMagickInfo(para1: pchar): PMagickInfo; cdecl; external libmagickcore;
function GetMagickThreadSupport(para1: PMagickInfo): TMagickStatusType; cdecl; external libmagickcore;
procedure MagickComponentTerminus; cdecl; external libmagickcore;
procedure MagickCoreGenesis(para1: pchar; para2: TMagickBooleanType); cdecl; external libmagickcore;
procedure MagickCoreTerminus; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/magick-config.h

function AcquireMagickMatrix(para1: Tsize_t; para2: Tsize_t): PPdouble; cdecl; external libmagickcore;
function RelinquishMagickMatrix(para1: PPdouble; para2: Tsize_t): PPdouble; cdecl; external libmagickcore;
function MatrixToImage(para1: PMatrixInfo; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function GaussJordanElimination(para1: PPdouble; para2: PPdouble; para3: Tsize_t; para4: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function GetMatrixElement(para1: PMatrixInfo; para2: Tssize_t; para3: Tssize_t; para4: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function NullMatrix(para1: PMatrixInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetMatrixElement(para1: PMatrixInfo; para2: Tssize_t; para3: Tssize_t; para4: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function AcquireMatrixInfo(para1: Tsize_t; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PMatrixInfo; cdecl; external libmagickcore;
function DestroyMatrixInfo(para1: PMatrixInfo): PMatrixInfo; cdecl; external libmagickcore;
function GetMatrixColumns(para1: PMatrixInfo): Tsize_t; cdecl; external libmagickcore;
function GetMatrixRows(para1: PMatrixInfo): Tsize_t; cdecl; external libmagickcore;
procedure LeastSquaresAddTerms(para1: PPdouble; para2: PPdouble; para3: Pdouble; para4: Pdouble; para5: Tsize_t;
  para6: Tsize_t); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/memory_.h

function AcquireVirtualMemory(para1: Tsize_t; para2: Tsize_t): PMemoryInfo; cdecl; external libmagickcore;
function RelinquishVirtualMemory(para1: PMemoryInfo): PMemoryInfo; cdecl; external libmagickcore;
function GetMaxMemoryRequest: Tsize_t; cdecl; external libmagickcore;
function AcquireAlignedMemory(para1: Tsize_t; para2: Tsize_t): pointer; cdecl; external libmagickcore;
function AcquireMagickMemory(para1: Tsize_t): pointer; cdecl; external libmagickcore;
function AcquireCriticalMemory(para1: Tsize_t): pointer; cdecl; external libmagickcore;
function AcquireQuantumMemory(para1: Tsize_t; para2: Tsize_t): pointer; cdecl; external libmagickcore;
function CopyMagickMemory(magick_restrict: pointer; magick_restrict2: pointer; para3: Tsize_t): pointer; cdecl; external libmagickcore;
procedure DestroyMagickMemory; cdecl; external libmagickcore;
procedure GetMagickMemoryMethods(para1: PAcquireMemoryHandler; para2: PResizeMemoryHandler; para3: PDestroyMemoryHandler); cdecl; external libmagickcore;
function GetVirtualMemoryBlob(para1: PMemoryInfo): pointer; cdecl; external libmagickcore;
function RelinquishAlignedMemory(para1: pointer): pointer; cdecl; external libmagickcore;
function RelinquishMagickMemory(para1: pointer): pointer; cdecl; external libmagickcore;
function ResetMagickMemory(para1: pointer; para2: longint; para3: Tsize_t): pointer; cdecl; external libmagickcore;
function ResizeMagickMemory(para1: pointer; para2: Tsize_t): pointer; cdecl; external libmagickcore;
function ResizeQuantumMemory(para1: pointer; para2: Tsize_t; para3: Tsize_t): pointer; cdecl; external libmagickcore;
procedure SetMagickAlignedMemoryMethods(para1: TAcquireAlignedMemoryHandler; para2: TRelinquishAlignedMemoryHandler); cdecl; external libmagickcore;
procedure SetMagickMemoryMethods(para1: TAcquireMemoryHandler; para2: TResizeMemoryHandler; para3: TDestroyMemoryHandler); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/mime.h

function GetMimeList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function MagickToMime(para1: pchar): pchar; cdecl; external libmagickcore;
function GetMimeDescription(para1: PMimeInfo): pchar; cdecl; external libmagickcore;
function GetMimeType(para1: PMimeInfo): pchar; cdecl; external libmagickcore;
function ListMimeInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function MimeComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function GetMimeInfo(para1: pchar; para2: pbyte; para3: Tsize_t; para4: PExceptionInfo): PMimeInfo; cdecl; external libmagickcore;
function GetMimeInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPMimeInfo; cdecl; external libmagickcore;
procedure MimeComponentTerminus; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/module.h

function GetModuleList(para1: pchar; para2: TMagickModuleType; para3: Psize_t; para4: PExceptionInfo): PPchar; cdecl; external libmagickcore;
function GetModuleInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPModuleInfo; cdecl; external libmagickcore;
function InvokeDynamicImageFilter(para1: pchar; para2: PPImage; para3: longint; para4: PPchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ListModuleInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ModuleComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function OpenModule(para1: pchar; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function OpenModules(para1: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetModuleInfo(para1: pchar; para2: PExceptionInfo): PModuleInfo; cdecl; external libmagickcore;
procedure DestroyModuleList; cdecl; external libmagickcore;
procedure ModuleComponentTerminus; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/monitor.h

function SetImageProgress(para1: PImage; para2: pchar; para3: TMagickOffsetType; para4: TMagickSizeType): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageProgressMonitor(para1: PImage; para2: TMagickProgressMonitor; para3: pointer): TMagickProgressMonitor; cdecl; external libmagickcore;
function SetImageInfoProgressMonitor(para1: PImageInfo; para2: TMagickProgressMonitor; para3: pointer): TMagickProgressMonitor; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/montage.h

function MontageImages(para1: PImage; para2: PMontageInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MontageImageList(para1: PImageInfo; para2: PMontageInfo; para3: PImage; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CloneMontageInfo(para1: PImageInfo; para2: PMontageInfo): PMontageInfo; cdecl; external libmagickcore;
function DestroyMontageInfo(para1: PMontageInfo): PMontageInfo; cdecl; external libmagickcore;
procedure GetMontageInfo(para1: PImageInfo; para2: PMontageInfo); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/morphology.h

function AcquireKernelInfo(para1: pchar): PKernelInfo; cdecl; external libmagickcore;
function AcquireKernelBuiltIn(para1: TKernelInfoType; para2: PGeometryInfo): PKernelInfo; cdecl; external libmagickcore;
function CloneKernelInfo(para1: PKernelInfo): PKernelInfo; cdecl; external libmagickcore;
function DestroyKernelInfo(para1: PKernelInfo): PKernelInfo; cdecl; external libmagickcore;
function MorphologyImage(para1: PImage; para2: TMorphologyMethod; para3: Tssize_t; para4: PKernelInfo; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MorphologyImageChannel(para1: PImage; para2: TChannelType; para3: TMorphologyMethod; para4: Tssize_t; para5: PKernelInfo;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
procedure ScaleGeometryKernelInfo(para1: PKernelInfo; para2: pchar); cdecl; external libmagickcore;
procedure ScaleKernelInfo(para1: PKernelInfo; para2: double; para3: TGeometryFlags); cdecl; external libmagickcore;
procedure ShowKernelInfo(para1: PKernelInfo); cdecl; external libmagickcore;
procedure UnityAddKernelInfo(para1: PKernelInfo; para2: double); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/opencl.h

function GetMagickOpenCLEnvParam(para1: TMagickCLEnv; para2: TMagickOpenCLEnvParam; para3: Tsize_t; para4: pointer; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function InitImageMagickOpenCL(para1: TImageMagickOpenCLMode; para2: pointer; para3: pointer; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function InitOpenCLEnv(para1: TMagickCLEnv; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetMagickOpenCLEnvParam(para1: TMagickCLEnv; para2: TMagickOpenCLEnvParam; para3: Tsize_t; para4: pointer; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetDefaultOpenCLEnv: TMagickCLEnv; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/option.h

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

// ==== /usr/include/ImageMagick-6/magick/paint.h

function OilPaintImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function FloodfillPaintImage(para1: PImage; para2: TChannelType; para3: PDrawInfo; para4: PMagickPixelPacket; para5: Tssize_t;
  para6: Tssize_t; para7: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function GradientImage(para1: PImage; para2: TGradientType; para3: TSpreadMethod; para4: PPixelPacket; para5: PPixelPacket): TMagickBooleanType; cdecl; external libmagickcore;
function OpaquePaintImage(para1: PImage; para2: PMagickPixelPacket; para3: PMagickPixelPacket; para4: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function OpaquePaintImageChannel(para1: PImage; para2: TChannelType; para3: PMagickPixelPacket; para4: PMagickPixelPacket; para5: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function TransparentPaintImage(para1: PImage; para2: PMagickPixelPacket; para3: TQuantum; para4: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function TransparentPaintImageChroma(para1: PImage; para2: PMagickPixelPacket; para3: PMagickPixelPacket; para4: TQuantum; para5: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/pixel.h

function ExportImagePixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: pchar; para7: TStorageType; para8: pointer; para9: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ImportImagePixels(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: Tsize_t; para5: Tsize_t;
  para6: pchar; para7: TStorageType; para8: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function InterpolateMagickPixelPacket(magick_restrict: PImage; para2: PCacheView; para3: TInterpolatePixelMethod; para4: double; para5: double;
  para6: PMagickPixelPacket; para7: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function CloneMagickPixelPacket(para1: PMagickPixelPacket): PMagickPixelPacket; cdecl; external libmagickcore;
function DecodePixelGamma(para1: TMagickRealType): TMagickRealType; cdecl; external libmagickcore;
function EncodePixelGamma(para1: TMagickRealType): TMagickRealType; cdecl; external libmagickcore;
function GetMagickPixelIntensity(image: PImage; magick_restrict: PMagickPixelPacket): TMagickRealType; cdecl; external libmagickcore;
function GetPixelIntensity(image: PImage; magick_restrict: PPixelPacket): TMagickRealType; cdecl; external libmagickcore;
procedure ConformMagickPixelPacket(para1: PImage; para2: PMagickPixelPacket; para3: PMagickPixelPacket; para4: PExceptionInfo); cdecl; external libmagickcore;
procedure GetMagickPixelPacket(para1: PImage; para2: PMagickPixelPacket); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/policy.h

function GetPolicyValue(name: pchar): pchar; cdecl; external libmagickcore;
function GetPolicyList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPchar; cdecl; external libmagickcore;
function GetPolicyInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPPolicyInfo; cdecl; external libmagickcore;
function IsRightsAuthorized(para1: TPolicyDomain; para2: TPolicyRights; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ListPolicyInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function PolicyComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function SetMagickSecurityPolicy(para1: pchar; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
procedure PolicyComponentTerminus; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/prepress.h

function GetImageTotalInkDensity(image: PImage): double; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/profile.h

function GetNextImageProfile(para1: PImage): pchar; cdecl; external libmagickcore;
function GetImageProfile(para1: PImage; para2: pchar): PStringInfo; cdecl; external libmagickcore;
function CloneImageProfiles(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function DeleteImageProfile(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ProfileImage(para1: PImage; para2: pchar; para3: pointer; para4: Tsize_t; para5: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageProfile(para1: PImage; para2: pchar; para3: PStringInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SyncImageProfiles(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function RemoveImageProfile(para1: PImage; para2: pchar): PStringInfo; cdecl; external libmagickcore;
procedure DestroyImageProfiles(para1: PImage); cdecl; external libmagickcore;
procedure ResetImageProfileIterator(para1: PImage); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/property.h

function GetNextImageProperty(para1: PImage): pchar; cdecl; external libmagickcore;
function InterpretImageProperties(para1: PImageInfo; para2: PImage; para3: pchar): pchar; cdecl; external libmagickcore;
function RemoveImageProperty(para1: PImage; para2: pchar): pchar; cdecl; external libmagickcore;
function GetImageProperty(para1: PImage; para2: pchar): pchar; cdecl; external libmagickcore;
function GetMagickProperty(para1: PImageInfo; para2: PImage; para3: pchar): pchar; cdecl; external libmagickcore;
function CloneImageProperties(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function DefineImageProperty(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function DeleteImageProperty(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function FormatImageProperty(para1: PImage; para2: pchar; para3: pchar; args: array of const): TMagickBooleanType; cdecl; external libmagickcore;
function FormatImageProperty(para1: PImage; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageProperty(para1: PImage; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
procedure DestroyImageProperties(para1: PImage); cdecl; external libmagickcore;
procedure ResetImagePropertyIterator(para1: PImage); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/quantize.h

function CompressImageColormap(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageQuantizeError(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function PosterizeImage(para1: PImage; para2: Tsize_t; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function PosterizeImageChannel(para1: PImage; para2: TChannelType; para3: Tsize_t; para4: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function QuantizeImage(para1: PQuantizeInfo; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function QuantizeImages(para1: PQuantizeInfo; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function RemapImage(para1: PQuantizeInfo; para2: PImage; para3: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function RemapImages(para1: PQuantizeInfo; para2: PImage; para3: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function AcquireQuantizeInfo(para1: PImageInfo): PQuantizeInfo; cdecl; external libmagickcore;
function CloneQuantizeInfo(para1: PQuantizeInfo): PQuantizeInfo; cdecl; external libmagickcore;
function DestroyQuantizeInfo(para1: PQuantizeInfo): PQuantizeInfo; cdecl; external libmagickcore;
procedure GetQuantizeInfo(para1: PQuantizeInfo); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/quantum.h

function GetQuantumEndian(para1: PQuantumInfo): TEndianType; cdecl; external libmagickcore;
function SetQuantumDepth(para1: PImage; para2: PQuantumInfo; para3: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function SetQuantumEndian(para1: PImage; para2: PQuantumInfo; para3: TEndianType): TMagickBooleanType; cdecl; external libmagickcore;
function SetQuantumFormat(para1: PImage; para2: PQuantumInfo; para3: TQuantumFormatType): TMagickBooleanType; cdecl; external libmagickcore;
function SetQuantumPad(para1: PImage; para2: PQuantumInfo; para3: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function GetQuantumFormat(para1: PQuantumInfo): TQuantumFormatType; cdecl; external libmagickcore;
function AcquireQuantumInfo(para1: PImageInfo; para2: PImage): PQuantumInfo; cdecl; external libmagickcore;
function DestroyQuantumInfo(para1: PQuantumInfo): PQuantumInfo; cdecl; external libmagickcore;
function GetQuantumType(para1: PImage; para2: PExceptionInfo): TQuantumType; cdecl; external libmagickcore;
function ExportQuantumPixels(para1: PImage; para2: PCacheView; para3: PQuantumInfo; para4: TQuantumType; magick_restrict: pbyte;
  para6: PExceptionInfo): Tsize_t; cdecl; external libmagickcore;
function GetQuantumExtent(para1: PImage; para2: PQuantumInfo; para3: TQuantumType): Tsize_t; cdecl; external libmagickcore;
function ImportQuantumPixels(para1: PImage; para2: PCacheView; para3: PQuantumInfo; para4: TQuantumType; magick_restrict: pbyte;
  para6: PExceptionInfo): Tsize_t; cdecl; external libmagickcore;
function GetQuantumPixels(para1: PQuantumInfo): pbyte; cdecl; external libmagickcore;
procedure GetQuantumInfo(para1: PImageInfo; para2: PQuantumInfo); cdecl; external libmagickcore;
procedure SetQuantumAlphaType(para1: PQuantumInfo; para2: TQuantumAlphaType); cdecl; external libmagickcore;
procedure SetQuantumImageType(para1: PImage; para2: TQuantumType); cdecl; external libmagickcore;
procedure SetQuantumMinIsWhite(para1: PQuantumInfo; para2: TMagickBooleanType); cdecl; external libmagickcore;
procedure SetQuantumPack(para1: PQuantumInfo; para2: TMagickBooleanType); cdecl; external libmagickcore;
procedure SetQuantumQuantum(para1: PQuantumInfo; para2: Tsize_t); cdecl; external libmagickcore;
procedure SetQuantumScale(para1: PQuantumInfo; para2: double); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/random_.h

function GetRandomValue(para1: PRandomInfo): double; cdecl; external libmagickcore;
function GetPseudoRandomValue(magick_restrict: PRandomInfo): double; cdecl; external libmagickcore;
function RandomComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function AcquireRandomInfo: PRandomInfo; cdecl; external libmagickcore;
function DestroyRandomInfo(para1: PRandomInfo): PRandomInfo; cdecl; external libmagickcore;
function GetRandomKey(para1: PRandomInfo; para2: Tsize_t): PStringInfo; cdecl; external libmagickcore;
function GetRandomSecretKey(para1: PRandomInfo): dword; cdecl; external libmagickcore;
procedure RandomComponentTerminus; cdecl; external libmagickcore;
procedure SeedPseudoRandomGenerator(para1: dword); cdecl; external libmagickcore;
procedure SetRandomKey(para1: PRandomInfo; para2: Tsize_t; para3: pbyte); cdecl; external libmagickcore;
procedure SetRandomSecretKey(para1: dword); cdecl; external libmagickcore;
procedure SetRandomTrueRandom(para1: TMagickBooleanType); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/registry.h

function GetNextImageRegistry: pchar; cdecl; external libmagickcore;
function DefineImageRegistry(para1: TRegistryType; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function DeleteImageRegistry(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function RegistryComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function SetImageRegistry(para1: TRegistryType; para2: pchar; para3: pointer; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageRegistry(para1: TRegistryType; para2: pchar; para3: PExceptionInfo): pointer; cdecl; external libmagickcore;
procedure RegistryComponentTerminus; cdecl; external libmagickcore;
function RemoveImageRegistry(para1: pchar): pointer; cdecl; external libmagickcore;
procedure ResetImageRegistryIterator; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/resample.h

function ResamplePixelColor(para1: PResampleFilter; para2: double; para3: double; para4: PMagickPixelPacket): TMagickBooleanType; cdecl; external libmagickcore;
function SetResampleFilterInterpolateMethod(para1: PResampleFilter; para2: TInterpolatePixelMethod): TMagickBooleanType; cdecl; external libmagickcore;
function SetResampleFilterVirtualPixelMethod(para1: PResampleFilter; para2: TVirtualPixelMethod): TMagickBooleanType; cdecl; external libmagickcore;
function AcquireResampleFilter(para1: PImage; para2: PExceptionInfo): PResampleFilter; cdecl; external libmagickcore;
function DestroyResampleFilter(para1: PResampleFilter): PResampleFilter; cdecl; external libmagickcore;
procedure ScaleResampleFilter(para1: PResampleFilter; para2: double; para3: double; para4: double; para5: double); cdecl; external libmagickcore;
procedure SetResampleFilter(para1: PResampleFilter; para2: TFilterTypes; para3: double); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/resize.h

function AdaptiveResizeImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function InterpolativeResizeImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: TInterpolatePixelMethod; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function LiquidRescaleImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: double; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MagnifyImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MinifyImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ResampleImage(para1: PImage; para2: double; para3: double; para4: TFilterTypes; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ResizeImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: TFilterTypes; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SampleImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ScaleImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ThumbnailImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/resource_.h

function AcquireUniqueFileResource(para1: pchar): longint; cdecl; external libmagickcore;
function AcquireMagickResource(para1: TResourceType; para2: TMagickSizeType): TMagickBooleanType; cdecl; external libmagickcore;
function GetPathTemplate(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ListMagickResourceInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function RelinquishUniqueFileResource(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ResourceComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function SetMagickResourceLimit(para1: TResourceType; para2: TMagickSizeType): TMagickBooleanType; cdecl; external libmagickcore;
function GetMagickResource(para1: TResourceType): TMagickSizeType; cdecl; external libmagickcore;
function GetMagickResourceLimit(para1: TResourceType): TMagickSizeType; cdecl; external libmagickcore;
procedure AsynchronousResourceComponentTerminus; cdecl; external libmagickcore;
procedure RelinquishMagickResource(para1: TResourceType; para2: TMagickSizeType); cdecl; external libmagickcore;
procedure ResourceComponentTerminus; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/segment.h

function GetImageDynamicThreshold(para1: PImage; para2: double; para3: double; para4: PMagickPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SegmentImage(para1: PImage; para2: TColorspaceType; para3: TMagickBooleanType; para4: double; para5: double): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/semaphore.h

procedure SemaphoreComponentTerminus; cdecl; external libmagickcore;
function SemaphoreComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function AllocateSemaphoreInfo: PSemaphoreInfo; cdecl; external libmagickcore;
procedure ActivateSemaphoreInfo(para1: PPSemaphoreInfo); cdecl; external libmagickcore;
procedure DestroySemaphoreInfo(para1: PPSemaphoreInfo); cdecl; external libmagickcore;
procedure LockSemaphoreInfo(para1: PSemaphoreInfo); cdecl; external libmagickcore;
procedure UnlockSemaphoreInfo(para1: PSemaphoreInfo); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/shear.h

function DeskewImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function IntegralRotateImage(para1: PImage; para2: Tsize_t; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ShearImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ShearRotateImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/signature.h

function SignatureImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/splay-tree.h

function AddValueToSplayTree(para1: PSplayTreeInfo; para2: pointer; para3: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function DeleteNodeByValueFromSplayTree(para1: PSplayTreeInfo; para2: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function DeleteNodeFromSplayTree(para1: PSplayTreeInfo; para2: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function GetNextKeyInSplayTree(para1: PSplayTreeInfo): pointer; cdecl; external libmagickcore;
function GetNextValueInSplayTree(para1: PSplayTreeInfo): pointer; cdecl; external libmagickcore;
function GetRootValueFromSplayTree(para1: PSplayTreeInfo): pointer; cdecl; external libmagickcore;
function GetValueFromSplayTree(para1: PSplayTreeInfo; para2: pointer): pointer; cdecl; external libmagickcore;
function CompareSplayTreeString(para1: pointer; para2: pointer): longint; cdecl; external libmagickcore;
function CompareSplayTreeStringInfo(para1: pointer; para2: pointer): longint; cdecl; external libmagickcore;

type
  TSplayTreeDestructor = procedure(data: pointer); cdecl;
  TSplayTreeCompare = function(left: pointer; right: pointer): Tssize_t; cdecl;

function CloneSplayTree(map: PSplayTreeInfo; compare: TSplayTreeCompare; destroy: TSplayTreeDestructor): PSplayTreeInfo; cdecl; external libmagickcore;
function DestroySplayTree(para1: PSplayTreeInfo): PSplayTreeInfo; cdecl; external libmagickcore;

type
  TSplayTreeCompare2 = function(left: pointer; right: pointer): longint; cdecl;
  TSplayTreeDestructor2 = procedure(data: pointer); cdecl;

function NewSplayTree(compare: TSplayTreeCompare2; left_destroy: TSplayTreeDestructor2; right_destroy: TSplayTreeDestructor2): PSplayTreeInfo; cdecl; external libmagickcore;
function GetNumberOfNodesInSplayTree(para1: PSplayTreeInfo): Tsize_t; cdecl; external libmagickcore;
function RemoveNodeByValueFromSplayTree(para1: PSplayTreeInfo; para2: pointer): pointer; cdecl; external libmagickcore;
function RemoveNodeFromSplayTree(para1: PSplayTreeInfo; para2: pointer): pointer; cdecl; external libmagickcore;
procedure ResetSplayTree(para1: PSplayTreeInfo); cdecl; external libmagickcore;
procedure ResetSplayTreeIterator(para1: PSplayTreeInfo); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/static.h

function InvokeStaticImageFilter(para1: pchar; para2: PPImage; para3: longint; para4: PPchar; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function RegisterStaticModule(para1: pchar; exception: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function UnregisterStaticModule(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function RegisterAAIImage: Tsize_t; cdecl; external libmagickcore;
function RegisterARTImage: Tsize_t; cdecl; external libmagickcore;
function RegisterAVIImage: Tsize_t; cdecl; external libmagickcore;
function RegisterAVSImage: Tsize_t; cdecl; external libmagickcore;
function RegisterBIEImage: Tsize_t; cdecl; external libmagickcore;
function RegisterBGRImage: Tsize_t; cdecl; external libmagickcore;
function RegisterBMPImage: Tsize_t; cdecl; external libmagickcore;
function RegisterBRAILLEImage: Tsize_t; cdecl; external libmagickcore;
function RegisterCALSImage: Tsize_t; cdecl; external libmagickcore;
function RegisterCAPTIONImage: Tsize_t; cdecl; external libmagickcore;
function RegisterCINImage: Tsize_t; cdecl; external libmagickcore;
function RegisterCIPImage: Tsize_t; cdecl; external libmagickcore;
function RegisterCLIPImage: Tsize_t; cdecl; external libmagickcore;
function RegisterCLIPBOARDImage: Tsize_t; cdecl; external libmagickcore;
function RegisterCMYKImage: Tsize_t; cdecl; external libmagickcore;
function RegisterCUTImage: Tsize_t; cdecl; external libmagickcore;
function RegisterDCMImage: Tsize_t; cdecl; external libmagickcore;
function RegisterDCXImage: Tsize_t; cdecl; external libmagickcore;
function RegisterDDSImage: Tsize_t; cdecl; external libmagickcore;
function RegisterDEBUGImage: Tsize_t; cdecl; external libmagickcore;
function RegisterDIBImage: Tsize_t; cdecl; external libmagickcore;
function RegisterDJVUImage: Tsize_t; cdecl; external libmagickcore;
function RegisterDNGImage: Tsize_t; cdecl; external libmagickcore;
function RegisterDOTImage: Tsize_t; cdecl; external libmagickcore;
function RegisterDPSImage: Tsize_t; cdecl; external libmagickcore;
function RegisterDPXImage: Tsize_t; cdecl; external libmagickcore;
function RegisterEMFImage: Tsize_t; cdecl; external libmagickcore;
function RegisterEPDFImage: Tsize_t; cdecl; external libmagickcore;
function RegisterEPIImage: Tsize_t; cdecl; external libmagickcore;
function RegisterEPSImage: Tsize_t; cdecl; external libmagickcore;
function RegisterEPS2Image: Tsize_t; cdecl; external libmagickcore;
function RegisterEPSFImage: Tsize_t; cdecl; external libmagickcore;
function RegisterEPSIImage: Tsize_t; cdecl; external libmagickcore;
function RegisterEPTImage: Tsize_t; cdecl; external libmagickcore;
function RegisterEXRImage: Tsize_t; cdecl; external libmagickcore;
function RegisterFAXImage: Tsize_t; cdecl; external libmagickcore;
function RegisterFITSImage: Tsize_t; cdecl; external libmagickcore;
function RegisterFLIFImage: Tsize_t; cdecl; external libmagickcore;
function RegisterFPXImage: Tsize_t; cdecl; external libmagickcore;
function RegisterG3Image: Tsize_t; cdecl; external libmagickcore;
function RegisterGIFImage: Tsize_t; cdecl; external libmagickcore;
function RegisterGIF87Image: Tsize_t; cdecl; external libmagickcore;
function RegisterGRADIENTImage: Tsize_t; cdecl; external libmagickcore;
function RegisterGRANITEImage: Tsize_t; cdecl; external libmagickcore;
function RegisterGRAYImage: Tsize_t; cdecl; external libmagickcore;
function RegisterHALDImage: Tsize_t; cdecl; external libmagickcore;
function RegisterHDRImage: Tsize_t; cdecl; external libmagickcore;
function RegisterHEICImage: Tsize_t; cdecl; external libmagickcore;
function RegisterHImage: Tsize_t; cdecl; external libmagickcore;
function RegisterHISTOGRAMImage: Tsize_t; cdecl; external libmagickcore;
function RegisterHRZImage: Tsize_t; cdecl; external libmagickcore;
function RegisterHTMLImage: Tsize_t; cdecl; external libmagickcore;
function RegisterICBImage: Tsize_t; cdecl; external libmagickcore;
function RegisterICONImage: Tsize_t; cdecl; external libmagickcore;
function RegisterINFOImage: Tsize_t; cdecl; external libmagickcore;
function RegisterINLINEImage: Tsize_t; cdecl; external libmagickcore;
function RegisterIPLImage: Tsize_t; cdecl; external libmagickcore;
function RegisterJBGImage: Tsize_t; cdecl; external libmagickcore;
function RegisterJBIGImage: Tsize_t; cdecl; external libmagickcore;
function RegisterJNXImage: Tsize_t; cdecl; external libmagickcore;
function RegisterJPEGImage: Tsize_t; cdecl; external libmagickcore;
function RegisterJP2Image: Tsize_t; cdecl; external libmagickcore;
function RegisterJSONImage: Tsize_t; cdecl; external libmagickcore;
function RegisterLABELImage: Tsize_t; cdecl; external libmagickcore;
function RegisterMACImage: Tsize_t; cdecl; external libmagickcore;
function RegisterMAGICKImage: Tsize_t; cdecl; external libmagickcore;
function RegisterMAPImage: Tsize_t; cdecl; external libmagickcore;
function RegisterMASKImage: Tsize_t; cdecl; external libmagickcore;
function RegisterMATImage: Tsize_t; cdecl; external libmagickcore;
function RegisterMATTEImage: Tsize_t; cdecl; external libmagickcore;
function RegisterMETAImage: Tsize_t; cdecl; external libmagickcore;
function RegisterMIFFImage: Tsize_t; cdecl; external libmagickcore;
function RegisterMNGImage: Tsize_t; cdecl; external libmagickcore;
function RegisterMONOImage: Tsize_t; cdecl; external libmagickcore;
function RegisterMPCImage: Tsize_t; cdecl; external libmagickcore;
function RegisterMPRImage: Tsize_t; cdecl; external libmagickcore;
function RegisterMSLImage: Tsize_t; cdecl; external libmagickcore;
function RegisterMTVImage: Tsize_t; cdecl; external libmagickcore;
function RegisterMVGImage: Tsize_t; cdecl; external libmagickcore;
function RegisterNETSCAPEImage: Tsize_t; cdecl; external libmagickcore;
function RegisterNULLImage: Tsize_t; cdecl; external libmagickcore;
function RegisterP7Image: Tsize_t; cdecl; external libmagickcore;
function RegisterPBMImage: Tsize_t; cdecl; external libmagickcore;
function RegisterOTBImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPALMImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPANGOImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPATTERNImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPCDImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPCDSImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPCLImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPCTImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPCXImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPDBImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPDFImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPESImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPGXImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPICImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPICTImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPIXImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPGMImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPLASMAImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPMImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPNGImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPNMImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPPMImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPREVIEWImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPSImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPS2Image: Tsize_t; cdecl; external libmagickcore;
function RegisterPS3Image: Tsize_t; cdecl; external libmagickcore;
function RegisterPSDImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPTIFImage: Tsize_t; cdecl; external libmagickcore;
function RegisterPWPImage: Tsize_t; cdecl; external libmagickcore;
function RegisterRASImage: Tsize_t; cdecl; external libmagickcore;
function RegisterRAWImage: Tsize_t; cdecl; external libmagickcore;
function RegisterRGBImage: Tsize_t; cdecl; external libmagickcore;
function RegisterRGBAImage: Tsize_t; cdecl; external libmagickcore;
function RegisterRGFImage: Tsize_t; cdecl; external libmagickcore;
function RegisterRLAImage: Tsize_t; cdecl; external libmagickcore;
function RegisterRLEImage: Tsize_t; cdecl; external libmagickcore;
function RegisterSCRImage: Tsize_t; cdecl; external libmagickcore;
function RegisterSCREENSHOTImage: Tsize_t; cdecl; external libmagickcore;
function RegisterSCTImage: Tsize_t; cdecl; external libmagickcore;
function RegisterSFWImage: Tsize_t; cdecl; external libmagickcore;
function RegisterSGIImage: Tsize_t; cdecl; external libmagickcore;
function RegisterSHTMLImage: Tsize_t; cdecl; external libmagickcore;
function RegisterSIXELImage: Tsize_t; cdecl; external libmagickcore;
function RegisterSTEGANOImage: Tsize_t; cdecl; external libmagickcore;
function RegisterSUNImage: Tsize_t; cdecl; external libmagickcore;
function RegisterSVGImage: Tsize_t; cdecl; external libmagickcore;
function RegisterTEXTImage: Tsize_t; cdecl; external libmagickcore;
function RegisterTGAImage: Tsize_t; cdecl; external libmagickcore;
function RegisterTHUMBNAILImage: Tsize_t; cdecl; external libmagickcore;
function RegisterTIFImage: Tsize_t; cdecl; external libmagickcore;
function RegisterTIFFImage: Tsize_t; cdecl; external libmagickcore;
function RegisterTILEImage: Tsize_t; cdecl; external libmagickcore;
function RegisterTIMImage: Tsize_t; cdecl; external libmagickcore;
function RegisterTTFImage: Tsize_t; cdecl; external libmagickcore;
function RegisterTXTImage: Tsize_t; cdecl; external libmagickcore;
function RegisterUILImage: Tsize_t; cdecl; external libmagickcore;
function RegisterURLImage: Tsize_t; cdecl; external libmagickcore;
function RegisterUYVYImage: Tsize_t; cdecl; external libmagickcore;
function RegisterVDAImage: Tsize_t; cdecl; external libmagickcore;
function RegisterVICARImage: Tsize_t; cdecl; external libmagickcore;
function RegisterVIDImage: Tsize_t; cdecl; external libmagickcore;
function RegisterVIDEOImage: Tsize_t; cdecl; external libmagickcore;
function RegisterVIFFImage: Tsize_t; cdecl; external libmagickcore;
function RegisterVIPSImage: Tsize_t; cdecl; external libmagickcore;
function RegisterVSTImage: Tsize_t; cdecl; external libmagickcore;
function RegisterWBMPImage: Tsize_t; cdecl; external libmagickcore;
function RegisterWEBPImage: Tsize_t; cdecl; external libmagickcore;
function RegisterWMFImage: Tsize_t; cdecl; external libmagickcore;
function RegisterWPGImage: Tsize_t; cdecl; external libmagickcore;
function RegisterXImage: Tsize_t; cdecl; external libmagickcore;
function RegisterXBMImage: Tsize_t; cdecl; external libmagickcore;
function RegisterXCImage: Tsize_t; cdecl; external libmagickcore;
function RegisterXCFImage: Tsize_t; cdecl; external libmagickcore;
function RegisterXPMImage: Tsize_t; cdecl; external libmagickcore;
function RegisterXPSImage: Tsize_t; cdecl; external libmagickcore;
function RegisterXVImage: Tsize_t; cdecl; external libmagickcore;
function RegisterXWDImage: Tsize_t; cdecl; external libmagickcore;
function RegisterYCBCRImage: Tsize_t; cdecl; external libmagickcore;
function RegisterYUVImage: Tsize_t; cdecl; external libmagickcore;
procedure UnregisterAAIImage; cdecl; external libmagickcore;
procedure UnregisterARTImage; cdecl; external libmagickcore;
procedure UnregisterAVIImage; cdecl; external libmagickcore;
procedure UnregisterAVSImage; cdecl; external libmagickcore;
procedure UnregisterBIEImage; cdecl; external libmagickcore;
procedure UnregisterBGRImage; cdecl; external libmagickcore;
procedure UnregisterBMPImage; cdecl; external libmagickcore;
procedure UnregisterBRAILLEImage; cdecl; external libmagickcore;
procedure UnregisterCALSImage; cdecl; external libmagickcore;
procedure UnregisterCAPTIONImage; cdecl; external libmagickcore;
procedure UnregisterCINImage; cdecl; external libmagickcore;
procedure UnregisterCIPImage; cdecl; external libmagickcore;
procedure UnregisterCLIPImage; cdecl; external libmagickcore;
procedure UnregisterCLIPBOARDImage; cdecl; external libmagickcore;
procedure UnregisterCMYKImage; cdecl; external libmagickcore;
procedure UnregisterCUTImage; cdecl; external libmagickcore;
procedure UnregisterDCMImage; cdecl; external libmagickcore;
procedure UnregisterDCXImage; cdecl; external libmagickcore;
procedure UnregisterDDSImage; cdecl; external libmagickcore;
procedure UnregisterDEBUGImage; cdecl; external libmagickcore;
procedure UnregisterDIBImage; cdecl; external libmagickcore;
procedure UnregisterDJVUImage; cdecl; external libmagickcore;
procedure UnregisterDNGImage; cdecl; external libmagickcore;
procedure UnregisterDOTImage; cdecl; external libmagickcore;
procedure UnregisterDPSImage; cdecl; external libmagickcore;
procedure UnregisterDPXImage; cdecl; external libmagickcore;
procedure UnregisterEMFImage; cdecl; external libmagickcore;
procedure UnregisterEPDFImage; cdecl; external libmagickcore;
procedure UnregisterEPIImage; cdecl; external libmagickcore;
procedure UnregisterEPSImage; cdecl; external libmagickcore;
procedure UnregisterEPS2Image; cdecl; external libmagickcore;
procedure UnregisterEPSFImage; cdecl; external libmagickcore;
procedure UnregisterEPSIImage; cdecl; external libmagickcore;
procedure UnregisterEPTImage; cdecl; external libmagickcore;
procedure UnregisterEXRImage; cdecl; external libmagickcore;
procedure UnregisterFAXImage; cdecl; external libmagickcore;
procedure UnregisterFITSImage; cdecl; external libmagickcore;
procedure UnregisterFLIFImage; cdecl; external libmagickcore;
procedure UnregisterFPXImage; cdecl; external libmagickcore;
procedure UnregisterG3Image; cdecl; external libmagickcore;
procedure UnregisterGIFImage; cdecl; external libmagickcore;
procedure UnregisterGIF87Image; cdecl; external libmagickcore;
procedure UnregisterGRADIENTImage; cdecl; external libmagickcore;
procedure UnregisterGRANITEImage; cdecl; external libmagickcore;
procedure UnregisterGRAYImage; cdecl; external libmagickcore;
procedure UnregisterHALDImage; cdecl; external libmagickcore;
procedure UnregisterHDRImage; cdecl; external libmagickcore;
procedure UnregisterHEICImage; cdecl; external libmagickcore;
procedure UnregisterHImage; cdecl; external libmagickcore;
procedure UnregisterHISTOGRAMImage; cdecl; external libmagickcore;
procedure UnregisterHRZImage; cdecl; external libmagickcore;
procedure UnregisterHTMLImage; cdecl; external libmagickcore;
procedure UnregisterICBImage; cdecl; external libmagickcore;
procedure UnregisterICONImage; cdecl; external libmagickcore;
procedure UnregisterINFOImage; cdecl; external libmagickcore;
procedure UnregisterINLINEImage; cdecl; external libmagickcore;
procedure UnregisterIPLImage; cdecl; external libmagickcore;
procedure UnregisterJBGImage; cdecl; external libmagickcore;
procedure UnregisterJBIGImage; cdecl; external libmagickcore;
procedure UnregisterJNXImage; cdecl; external libmagickcore;
procedure UnregisterJPEGImage; cdecl; external libmagickcore;
procedure UnregisterJP2Image; cdecl; external libmagickcore;
procedure UnregisterJSONImage; cdecl; external libmagickcore;
procedure UnregisterLABELImage; cdecl; external libmagickcore;
procedure UnregisterLOCALEImage; cdecl; external libmagickcore;
procedure UnregisterMACImage; cdecl; external libmagickcore;
procedure UnregisterMAGICKImage; cdecl; external libmagickcore;
procedure UnregisterMAPImage; cdecl; external libmagickcore;
procedure UnregisterMASKImage; cdecl; external libmagickcore;
procedure UnregisterMATImage; cdecl; external libmagickcore;
procedure UnregisterMATTEImage; cdecl; external libmagickcore;
procedure UnregisterMETAImage; cdecl; external libmagickcore;
procedure UnregisterMIFFImage; cdecl; external libmagickcore;
procedure UnregisterMNGImage; cdecl; external libmagickcore;
procedure UnregisterMONOImage; cdecl; external libmagickcore;
procedure UnregisterMPCImage; cdecl; external libmagickcore;
procedure UnregisterMPRImage; cdecl; external libmagickcore;
procedure UnregisterMSLImage; cdecl; external libmagickcore;
procedure UnregisterMTVImage; cdecl; external libmagickcore;
procedure UnregisterMVGImage; cdecl; external libmagickcore;
procedure UnregisterNETSCAPEImage; cdecl; external libmagickcore;
procedure UnregisterNULLImage; cdecl; external libmagickcore;
procedure UnregisterP7Image; cdecl; external libmagickcore;
procedure UnregisterPBMImage; cdecl; external libmagickcore;
procedure UnregisterOTBImage; cdecl; external libmagickcore;
procedure UnregisterPALMImage; cdecl; external libmagickcore;
procedure UnregisterPANGOImage; cdecl; external libmagickcore;
procedure UnregisterPATTERNImage; cdecl; external libmagickcore;
procedure UnregisterPCDImage; cdecl; external libmagickcore;
procedure UnregisterPCDSImage; cdecl; external libmagickcore;
procedure UnregisterPCLImage; cdecl; external libmagickcore;
procedure UnregisterPCTImage; cdecl; external libmagickcore;
procedure UnregisterPCXImage; cdecl; external libmagickcore;
procedure UnregisterPDBImage; cdecl; external libmagickcore;
procedure UnregisterPDFImage; cdecl; external libmagickcore;
procedure UnregisterPESImage; cdecl; external libmagickcore;
procedure UnregisterPGXImage; cdecl; external libmagickcore;
procedure UnregisterPICImage; cdecl; external libmagickcore;
procedure UnregisterPICTImage; cdecl; external libmagickcore;
procedure UnregisterPIXImage; cdecl; external libmagickcore;
procedure UnregisterPLASMAImage; cdecl; external libmagickcore;
procedure UnregisterPGMImage; cdecl; external libmagickcore;
procedure UnregisterPMImage; cdecl; external libmagickcore;
procedure UnregisterPNGImage; cdecl; external libmagickcore;
procedure UnregisterPNMImage; cdecl; external libmagickcore;
procedure UnregisterPPMImage; cdecl; external libmagickcore;
procedure UnregisterPREVIEWImage; cdecl; external libmagickcore;
procedure UnregisterPSImage; cdecl; external libmagickcore;
procedure UnregisterPS2Image; cdecl; external libmagickcore;
procedure UnregisterPS3Image; cdecl; external libmagickcore;
procedure UnregisterPSDImage; cdecl; external libmagickcore;
procedure UnregisterPTIFImage; cdecl; external libmagickcore;
procedure UnregisterPWPImage; cdecl; external libmagickcore;
procedure UnregisterRASImage; cdecl; external libmagickcore;
procedure UnregisterRAWImage; cdecl; external libmagickcore;
procedure UnregisterRGBImage; cdecl; external libmagickcore;
procedure UnregisterRGBAImage; cdecl; external libmagickcore;
procedure UnregisterRGFImage; cdecl; external libmagickcore;
procedure UnregisterRLAImage; cdecl; external libmagickcore;
procedure UnregisterRLEImage; cdecl; external libmagickcore;
procedure UnregisterSCRImage; cdecl; external libmagickcore;
procedure UnregisterSCREENSHOTImage; cdecl; external libmagickcore;
procedure UnregisterSCTImage; cdecl; external libmagickcore;
procedure UnregisterSFWImage; cdecl; external libmagickcore;
procedure UnregisterSGIImage; cdecl; external libmagickcore;
procedure UnregisterSHTMLImage; cdecl; external libmagickcore;
procedure UnregisterSIXELImage; cdecl; external libmagickcore;
procedure UnregisterSTEGANOImage; cdecl; external libmagickcore;
procedure UnregisterSUNImage; cdecl; external libmagickcore;
procedure UnregisterSVGImage; cdecl; external libmagickcore;
procedure UnregisterTEXTImage; cdecl; external libmagickcore;
procedure UnregisterTGAImage; cdecl; external libmagickcore;
procedure UnregisterTHUMBNAILImage; cdecl; external libmagickcore;
procedure UnregisterTIFImage; cdecl; external libmagickcore;
procedure UnregisterTIFFImage; cdecl; external libmagickcore;
procedure UnregisterTILEImage; cdecl; external libmagickcore;
procedure UnregisterTIMImage; cdecl; external libmagickcore;
procedure UnregisterTTFImage; cdecl; external libmagickcore;
procedure UnregisterTXTImage; cdecl; external libmagickcore;
procedure UnregisterUILImage; cdecl; external libmagickcore;
procedure UnregisterURLImage; cdecl; external libmagickcore;
procedure UnregisterUYVYImage; cdecl; external libmagickcore;
procedure UnregisterVDAImage; cdecl; external libmagickcore;
procedure UnregisterVICARImage; cdecl; external libmagickcore;
procedure UnregisterVIDImage; cdecl; external libmagickcore;
procedure UnregisterVIDEOImage; cdecl; external libmagickcore;
procedure UnregisterVIFFImage; cdecl; external libmagickcore;
procedure UnregisterVIPSImage; cdecl; external libmagickcore;
procedure UnregisterVSTImage; cdecl; external libmagickcore;
procedure UnregisterWBMPImage; cdecl; external libmagickcore;
procedure UnregisterWEBPImage; cdecl; external libmagickcore;
procedure UnregisterWMFImage; cdecl; external libmagickcore;
procedure UnregisterWPGImage; cdecl; external libmagickcore;
procedure UnregisterXImage; cdecl; external libmagickcore;
procedure UnregisterXBMImage; cdecl; external libmagickcore;
procedure UnregisterXCImage; cdecl; external libmagickcore;
procedure UnregisterXCFImage; cdecl; external libmagickcore;
procedure UnregisterXPMImage; cdecl; external libmagickcore;
procedure UnregisterXPSImage; cdecl; external libmagickcore;
procedure UnregisterXVImage; cdecl; external libmagickcore;
procedure UnregisterXWDImage; cdecl; external libmagickcore;
procedure UnregisterYCBCRImage; cdecl; external libmagickcore;
procedure UnregisterYUVImage; cdecl; external libmagickcore;
procedure RegisterStaticModules; cdecl; external libmagickcore;
procedure UnregisterStaticModules; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/statistic.h

function GetImageChannelStatistics(para1: PImage; para2: PExceptionInfo): PChannelStatistics; cdecl; external libmagickcore;
function GetImageChannelMoments(para1: PImage; para2: PExceptionInfo): PChannelMoments; cdecl; external libmagickcore;
function GetImageChannelPerceptualHash(para1: PImage; para2: PExceptionInfo): PChannelPerceptualHash; cdecl; external libmagickcore;
function EvaluateImages(para1: PImage; para2: TMagickEvaluateOperator; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PolynomialImage(para1: PImage; para2: Tsize_t; para3: Pdouble; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PolynomialImageChannel(para1: PImage; para2: TChannelType; para3: Tsize_t; para4: Pdouble; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function StatisticImage(para1: PImage; para2: TStatisticType; para3: Tsize_t; para4: Tsize_t; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function StatisticImageChannel(para1: PImage; para2: TChannelType; para3: TStatisticType; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function EvaluateImage(para1: PImage; para2: TMagickEvaluateOperator; para3: double; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function EvaluateImageChannel(para1: PImage; para2: TChannelType; para3: TMagickEvaluateOperator; para4: double; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function FunctionImage(para1: PImage; para2: TMagickFunction; para3: Tsize_t; para4: Pdouble; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function FunctionImageChannel(para1: PImage; para2: TChannelType; para3: TMagickFunction; para4: Tsize_t; para5: Pdouble;
  para6: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageChannelEntropy(para1: PImage; para2: TChannelType; para3: Pdouble; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageChannelExtrema(para1: PImage; para2: TChannelType; para3: Psize_t; para4: Psize_t; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageChannelMean(para1: PImage; para2: TChannelType; para3: Pdouble; para4: Pdouble; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageChannelKurtosis(para1: PImage; para2: TChannelType; para3: Pdouble; para4: Pdouble; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageChannelRange(para1: PImage; para2: TChannelType; para3: Pdouble; para4: Pdouble; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageEntropy(para1: PImage; para2: Pdouble; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageExtrema(para1: PImage; para2: Psize_t; para3: Psize_t; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageMean(para1: PImage; para2: Pdouble; para3: Pdouble; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageKurtosis(para1: PImage; para2: Pdouble; para3: Pdouble; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageRange(para1: PImage; para2: Pdouble; para3: Pdouble; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/stream.h

function ReadStream(para1: PImageInfo; para2: TStreamHandler; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function WriteStream(para1: PImageInfo; para2: PImage; para3: TStreamHandler): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/string_.h

function AcquireString(para1: pchar): pchar; cdecl; external libmagickcore;
function CloneString(para1: PPchar; para2: pchar): pchar; cdecl; external libmagickcore;
function ConstantString(para1: pchar): pchar; cdecl; external libmagickcore;
function DestroyString(para1: pchar): pchar; cdecl; external libmagickcore;
function DestroyStringList(para1: PPchar): PPchar; cdecl; external libmagickcore;
function EscapeString(para1: pchar; para2: char): pchar; cdecl; external libmagickcore;
function FileToString(para1: pchar; para2: Tsize_t; para3: PExceptionInfo): pchar; cdecl; external libmagickcore;
function GetEnvironmentValue(para1: pchar): pchar; cdecl; external libmagickcore;
function SanitizeString(para1: pchar): pchar; cdecl; external libmagickcore;
function StringInfoToHexString(para1: PStringInfo): pchar; cdecl; external libmagickcore;
function StringInfoToString(para1: PStringInfo): pchar; cdecl; external libmagickcore;
function StringToArgv(para1: pchar; para2: Plongint): PPchar; cdecl; external libmagickcore;
function StringToken(para1: pchar; para2: PPchar): pchar; cdecl; external libmagickcore;
function StringToList(para1: pchar): PPchar; cdecl; external libmagickcore;
function StringToStrings(para1: pchar; para2: Psize_t): PPchar; cdecl; external libmagickcore;
function GetStringInfoName(para1: PStringInfo): pchar; cdecl; external libmagickcore;
function GetStringInfoPath(para1: PStringInfo): pchar; cdecl; external libmagickcore;
function InterpretSiPrefixValue(magick_restrict: pchar; magick_restrict2: PPchar): double; cdecl; external libmagickcore;
function StringToArrayOfDoubles(para1: pchar; para2: Pssize_t; para3: PExceptionInfo): Pdouble; cdecl; external libmagickcore;
function CompareStringInfo(para1: PStringInfo; para2: PStringInfo): longint; cdecl; external libmagickcore;
function ConcatenateString(magick_restrict: PPchar; magick_restrict2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function IsStringTrue(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function IsStringNotFalse(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function SubstituteString(para1: PPchar; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ConcatenateMagickString(magick_restrict: pchar; magick_restrict2: pchar; para3: Tsize_t): Tsize_t; cdecl; external libmagickcore;
function CopyMagickString(magick_restrict: pchar; magick_restrict2: pchar; para3: Tsize_t): Tsize_t; cdecl; external libmagickcore;
function GetStringInfoLength(para1: PStringInfo): Tsize_t; cdecl; external libmagickcore;
function FormatMagickSize(para1: TMagickSizeType; para2: TMagickBooleanType; para3: pchar): Tssize_t; cdecl; external libmagickcore;
function AcquireStringInfo(para1: Tsize_t): PStringInfo; cdecl; external libmagickcore;
function BlobToStringInfo(para1: pointer; para2: Tsize_t): PStringInfo; cdecl; external libmagickcore;
function CloneStringInfo(para1: PStringInfo): PStringInfo; cdecl; external libmagickcore;
function ConfigureFileToStringInfo(para1: pchar): PStringInfo; cdecl; external libmagickcore;
function DestroyStringInfo(para1: PStringInfo): PStringInfo; cdecl; external libmagickcore;
function FileToStringInfo(para1: pchar; para2: Tsize_t; para3: PExceptionInfo): PStringInfo; cdecl; external libmagickcore;
function SplitStringInfo(para1: PStringInfo; para2: Tsize_t): PStringInfo; cdecl; external libmagickcore;
function StringToStringInfo(para1: pchar): PStringInfo; cdecl; external libmagickcore;
function GetStringInfoDatum(para1: PStringInfo): pbyte; cdecl; external libmagickcore;
procedure ConcatenateStringInfo(para1: PStringInfo; para2: PStringInfo); cdecl; external libmagickcore;
procedure PrintStringInfo(file_: PFILE; para2: pchar; para3: PStringInfo); cdecl; external libmagickcore;
procedure ResetStringInfo(para1: PStringInfo); cdecl; external libmagickcore;
procedure SetStringInfo(para1: PStringInfo; para2: PStringInfo); cdecl; external libmagickcore;
procedure SetStringInfoDatum(para1: PStringInfo; para2: pbyte); cdecl; external libmagickcore;
procedure SetStringInfoLength(para1: PStringInfo; para2: Tsize_t); cdecl; external libmagickcore;
procedure SetStringInfoName(para1: PStringInfo; para2: pchar); cdecl; external libmagickcore;
procedure SetStringInfoPath(para1: PStringInfo; para2: pchar); cdecl; external libmagickcore;
procedure StripString(para1: pchar); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/threshold.h

function AdaptiveThresholdImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: Tssize_t; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DestroyThresholdMap(para1: PThresholdMap): PThresholdMap; cdecl; external libmagickcore;
function GetThresholdMap(para1: pchar; para2: PExceptionInfo): PThresholdMap; cdecl; external libmagickcore;
function AutoThresholdImage(para1: PImage; para2: TAutoThresholdMethod; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function BilevelImage(para1: PImage; para2: double): TMagickBooleanType; cdecl; external libmagickcore;
function BilevelImageChannel(para1: PImage; para2: TChannelType; para3: double): TMagickBooleanType; cdecl; external libmagickcore;
function BlackThresholdImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function BlackThresholdImageChannel(para1: PImage; para2: TChannelType; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function ClampImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function ClampImageChannel(para1: PImage; para2: TChannelType): TMagickBooleanType; cdecl; external libmagickcore;
function ListThresholdMaps(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function OrderedDitherImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function OrderedDitherImageChannel(para1: PImage; para2: TChannelType; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function OrderedPosterizeImage(para1: PImage; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function OrderedPosterizeImageChannel(para1: PImage; para2: TChannelType; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function PerceptibleImage(para1: PImage; para2: double): TMagickBooleanType; cdecl; external libmagickcore;
function PerceptibleImageChannel(para1: PImage; para2: TChannelType; para3: double): TMagickBooleanType; cdecl; external libmagickcore;
function RandomThresholdImage(para1: PImage; para2: pchar; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function RandomThresholdImageChannel(para1: PImage; para2: TChannelType; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function WhiteThresholdImage(para1: PImage; para2: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function WhiteThresholdImageChannel(para1: PImage; para2: TChannelType; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/timer.h

function GetElapsedTime(para1: PTimerInfo): double; cdecl; external libmagickcore;
function GetUserTime(para1: PTimerInfo): double; cdecl; external libmagickcore;
function ContinueTimer(para1: PTimerInfo): TMagickBooleanType; cdecl; external libmagickcore;
function FormatMagickTime(para1: Ttime_t; para2: Tsize_t; para3: pchar): Tssize_t; cdecl; external libmagickcore;
function AcquireTimerInfo: PTimerInfo; cdecl; external libmagickcore;
function DestroyTimerInfo(para1: PTimerInfo): PTimerInfo; cdecl; external libmagickcore;
procedure GetTimerInfo(para1: PTimerInfo); cdecl; external libmagickcore;
procedure ResetTimer(para1: PTimerInfo); cdecl; external libmagickcore;
procedure StartTimer(para1: PTimerInfo; para2: TMagickBooleanType); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/token.h

function Tokenizer(para1: PTokenInfo; para2: dword; para3: pchar; para4: Tsize_t; para5: pchar;
  para6: pchar; para7: pchar; para8: pchar; para9: char; para10: pchar;
  para11: Plongint; para12: pchar): longint; cdecl; external libmagickcore;
function GlobExpression(magick_restrict: pchar; magick_restrict2: pchar; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;
function IsGlob(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function IsMagickTrue(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function GetNextToken(magick_restrict: pchar; magick_restrict2: PPchar; para3: Tsize_t; magick_restrict3: pchar): Tsize_t; cdecl; external libmagickcore;
function AcquireTokenInfo: PTokenInfo; cdecl; external libmagickcore;
function DestroyTokenInfo(para1: PTokenInfo): PTokenInfo; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/transform.h

function AutoOrientImage(para1: PImage; para2: TOrientationType; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ChopImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ConsolidateCMYKImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CropImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CropImageToTiles(para1: PImage; para2: pchar; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ExcerptImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ExtentImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function FlipImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function FlopImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function RollImage(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ShaveImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SpliceImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function TransposeImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function TransverseImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function TrimImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function TransformImage(para1: PPImage; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function TransformImages(para1: PPImage; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/type.h

function GetTypeList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function ListTypeInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function TypeComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function GetTypeInfo(para1: pchar; para2: PExceptionInfo): PTypeInfo; cdecl; external libmagickcore;
function GetTypeInfoByFamily(para1: pchar; para2: TStyleType; para3: TStretchType; para4: Tsize_t; para5: PExceptionInfo): PTypeInfo; cdecl; external libmagickcore;
function GetTypeInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPTypeInfo; cdecl; external libmagickcore;
procedure TypeComponentTerminus; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/utility.h

function Base64Encode(para1: pbyte; para2: Tsize_t; para3: Psize_t): pchar; cdecl; external libmagickcore;
function GetPathComponents(para1: pchar; para2: Psize_t): Ppchar; cdecl; external libmagickcore;
function ListFiles(para1: pchar; para2: pchar; para3: Psize_t): Ppchar; cdecl; external libmagickcore;
function AcquireUniqueFilename(para1: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function AcquireUniqueSymbolicLink(para1: pchar; para2: pchar): char; cdecl; external libmagickcore;
function ExpandFilenames(para1: Plongint; para2: PPPchar): char; cdecl; external libmagickcore;
function GetPathAttributes(para1: pchar; para2: pointer): char; cdecl; external libmagickcore;
function GetExecutionPath(para1: pchar; para2: Tsize_t): char; cdecl; external libmagickcore;
function IsPathAccessible(para1: pchar): char; cdecl; external libmagickcore;
function MultilineCensus(para1: pchar): Tsize_t; cdecl; external libmagickcore;
function GetMagickPageSize: Tssize_t; cdecl; external libmagickcore;
function Base64Decode(para1: pchar; para2: Psize_t): pbyte; cdecl; external libmagickcore;
procedure AppendImageFormat(para1: pchar; para2: pchar); cdecl; external libmagickcore;
procedure ChopPathComponents(para1: pchar; para2: Tsize_t); cdecl; external libmagickcore;
procedure ExpandFilename(para1: pchar); cdecl; external libmagickcore;
procedure GetPathComponent(para1: pchar; para2: TPathType; para3: pchar); cdecl; external libmagickcore;
procedure MagickDelay(para1: TMagickSizeType); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/version.h

function GetMagickHomeURL: pchar; cdecl; external libmagickcore;
function GetMagickCopyright: pchar; cdecl; external libmagickcore;
function GetMagickDelegates: pchar; cdecl; external libmagickcore;
function GetMagickFeatures: pchar; cdecl; external libmagickcore;
function GetMagickLicense: pchar; cdecl; external libmagickcore;
function GetMagickPackageName: pchar; cdecl; external libmagickcore;
function GetMagickQuantumDepth(para1: Psize_t): pchar; cdecl; external libmagickcore;
function GetMagickQuantumRange(para1: Psize_t): pchar; cdecl; external libmagickcore;
function GetMagickReleaseDate: pchar; cdecl; external libmagickcore;
function GetMagickVersion(para1: Psize_t): pchar; cdecl; external libmagickcore;
procedure ListMagickVersion(para1: PFILE); cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/vision.h

function ConnectedComponentsImage(para1: PImage; para2: Tsize_t; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/visual-effects.h

function AddNoiseImage(para1: PImage; para2: TNoiseType; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function AddNoiseImageChannel(para1: PImage; para2: TChannelType; para3: TNoiseType; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function BlueShiftImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CharcoalImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ColorizeImage(para1: PImage; para2: pchar; para3: TPixelPacket; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ColorMatrixImage(para1: PImage; kernel: PKernelInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ImplodeImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MorphImages(para1: PImage; para2: Tsize_t; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PolaroidImage(para1: PImage; para2: PDrawInfo; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SepiaToneImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ShadowImage(para1: PImage; para2: double; para3: double; para4: Tssize_t; para5: Tssize_t;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SketchImage(para1: PImage; para2: double; para3: double; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SteganoImage(para1: PImage; para2: PImage; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function StereoImage(para1: PImage; para2: PImage; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function StereoAnaglyphImage(para1: PImage; para2: PImage; para3: Tssize_t; para4: Tssize_t; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SwirlImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function TintImage(para1: PImage; para2: pchar; para3: TPixelPacket; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function VignetteImage(para1: PImage; para2: double; para3: double; para4: Tssize_t; para5: Tssize_t;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function WaveImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function WaveletDenoiseImage(para1: PImage; para2: double; para3: double; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PlasmaImage(para1: PImage; para2: PSegmentInfo; para3: Tsize_t; para4: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function SolarizeImage(para1: PImage; para2: double): TMagickBooleanType; cdecl; external libmagickcore;
function SolarizeImageChannel(para1: PImage; para2: TChannelType; para3: double; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/xml-tree.h

function CanonicalXMLContent(para1: pchar; para2: TMagickBooleanType): pchar; cdecl; external libmagickcore;
function XMLTreeInfoToXML(para1: PXMLTreeInfo): pchar; cdecl; external libmagickcore;
function GetXMLTreeAttribute(para1: PXMLTreeInfo; para2: pchar): pchar; cdecl; external libmagickcore;
function GetXMLTreeContent(para1: PXMLTreeInfo): pchar; cdecl; external libmagickcore;
function GetXMLTreeProcessingInstructions(para1: PXMLTreeInfo; para2: pchar): Ppchar; cdecl; external libmagickcore;
function GetXMLTreeTag(para1: PXMLTreeInfo): pchar; cdecl; external libmagickcore;
function GetXMLTreeAttributes(para1: PXMLTreeInfo; para2: PSplayTreeInfo): TMagickBooleanType; cdecl; external libmagickcore;
function AddChildToXMLTree(para1: PXMLTreeInfo; para2: pchar; para3: Tsize_t): PXMLTreeInfo; cdecl; external libmagickcore;
function AddPathToXMLTree(para1: PXMLTreeInfo; para2: pchar; para3: Tsize_t): PXMLTreeInfo; cdecl; external libmagickcore;
function DestroyXMLTree(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagickcore;
function GetNextXMLTreeTag(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagickcore;
function GetXMLTreeChild(para1: PXMLTreeInfo; para2: pchar): PXMLTreeInfo; cdecl; external libmagickcore;
function GetXMLTreeOrdered(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagickcore;
function GetXMLTreePath(para1: PXMLTreeInfo; para2: pchar): PXMLTreeInfo; cdecl; external libmagickcore;
function GetXMLTreeSibling(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagickcore;
function InsertTagIntoXMLTree(para1: PXMLTreeInfo; para2: PXMLTreeInfo; para3: Tsize_t): PXMLTreeInfo; cdecl; external libmagickcore;
function NewXMLTree(para1: pchar; para2: PExceptionInfo): PXMLTreeInfo; cdecl; external libmagickcore;
function NewXMLTreeTag(para1: pchar): PXMLTreeInfo; cdecl; external libmagickcore;
function ParseTagFromXMLTree(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagickcore;
function PruneTagFromXMLTree(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagickcore;
function SetXMLTreeAttribute(para1: PXMLTreeInfo; para2: pchar; para3: pchar): PXMLTreeInfo; cdecl; external libmagickcore;
function SetXMLTreeContent(para1: PXMLTreeInfo; para2: pchar): PXMLTreeInfo; cdecl; external libmagickcore;

// ==== /usr/include/ImageMagick-6/magick/deprecate.h

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


