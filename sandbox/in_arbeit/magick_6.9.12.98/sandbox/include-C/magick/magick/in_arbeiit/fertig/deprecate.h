typedef enum
{
  UndefinedMagickLayerMethod
} MagickLayerMethod;

typedef MagickOffsetType ExtendedSignedIntegralType;
typedef MagickSizeType ExtendedUnsignedIntegralType;
typedef MagickRealType ExtendedRationalType;
typedef struct _ViewInfo ViewInfo;

typedef MagickBooleanType
  (*MonitorHandler)(const char *,const MagickOffsetType,const MagickSizeType,
    ExceptionInfo *);

typedef struct _ImageAttribute
{
  char
    *key,
    *value;

  MagickBooleanType
    compression;

  struct _ImageAttribute
    *previous,
    *next;  /* deprecated */
} ImageAttribute;

extern  CacheView
  *CloseCacheView(CacheView *) ;
extern  CacheView
  *OpenCacheView(const Image *) ;

extern  char
  *AllocateString(const char *) ;
extern  char
  *InterpretImageAttributes(const ImageInfo *,Image *,const char *) ;
extern  char
  *PostscriptGeometry(const char *) ;
extern  char
  *TranslateText(const ImageInfo *,Image *,const char *)     ;

extern  const ImageAttribute
  *GetImageAttribute(const Image *,const char *) ;
extern  const ImageAttribute
  *GetImageClippingPathAttribute(Image *) ;
extern  const ImageAttribute
  *GetNextImageAttribute(const Image *) ;

extern  const IndexPacket
  *AcquireCacheViewIndexes(const CacheView *) ;
extern  const IndexPacket
  *AcquireIndexes(const Image *) ;

extern  const PixelPacket
  *AcquirePixels(const Image *) ;
extern  const PixelPacket
  *AcquireCacheViewPixels(const CacheView *,const ssize_t,const ssize_t,
    const size_t,const size_t,ExceptionInfo *);
extern  const PixelPacket
  *AcquireImagePixels(const Image *,const ssize_t,const ssize_t,const size_t,    const size_t,ExceptionInfo *) ;

extern  FILE
  *OpenMagickStream(const char *,const char *);

extern  Image
  *AllocateImage(const ImageInfo *) ;
extern  Image
  *AverageImages(const Image *,ExceptionInfo *) ;
extern  Image
  *ExtractSubimageFromImage(Image *,const Image *,ExceptionInfo *) ;
extern  Image
  *GetImageFromMagickRegistry(const char *,ssize_t *id,ExceptionInfo *) ;
extern  Image
  *GetImageList(const Image *,const ssize_t,ExceptionInfo *) ;
extern  Image
  *GetNextImage(const Image *) ;
extern  Image
  *GetPreviousImage(const Image *) ;
extern  Image
  *FlattenImages(Image *,ExceptionInfo *) ;
extern  Image
  *MaximumImages(const Image *,ExceptionInfo *) ;
extern  Image
  *MedianFilterImage(const Image *,const double,ExceptionInfo *) ;
extern  Image
  *ModeImage(const Image *,const double,ExceptionInfo *) ;
extern  Image
  *MinimumImages(const Image *,ExceptionInfo *) ;
extern  Image
  *MosaicImages(Image *,ExceptionInfo *) ;
extern  Image
  *PopImageList(Image **) ;
extern  Image
  *RadialBlurImage(const Image *,const double,ExceptionInfo *) ;
extern  Image
  *RadialBlurImageChannel(const Image *,const ChannelType,const double,    ExceptionInfo *) ;
extern  Image
  *RecolorImage(const Image *,const size_t,const double *,ExceptionInfo *) ;
extern  Image
  *ReduceNoiseImage(const Image *,const double,ExceptionInfo *) ;
extern  Image
  *ShiftImageList(Image **) ;
extern  Image
  *SpliceImageList(Image *,const ssize_t,const size_t,const Image *,  ExceptionInfo *) ;
extern  Image
  *ZoomImage(const Image *,const size_t,const size_t,ExceptionInfo *)  ;

extern  IndexPacket
  *GetCacheViewIndexes(CacheView *) ;
extern  IndexPacket
  *GetIndexes(const Image *) ;
extern  IndexPacket
  ValidateColormapIndex(Image *,const size_t) ;

extern  int
  GetImageGeometry(Image *,const char *,const unsigned int,RectangleInfo *) ;
extern  int
  ParseImageGeometry(const char *,ssize_t *,ssize_t *,size_t *,size_t *) ;
extern  int
  SystemCommand(const MagickBooleanType,const MagickBooleanType,const char *,    ExceptionInfo *) ;

extern  MagickBooleanType
  AcquireOneCacheViewPixel(const CacheView *,const ssize_t,const ssize_t,   PixelPacket *,ExceptionInfo *) ;
extern  MagickBooleanType
  AcquireOneCacheViewVirtualPixel(const CacheView *,const VirtualPixelMethod,   const ssize_t,const ssize_t,PixelPacket *,ExceptionInfo *) ;
extern  MagickBooleanType
  AffinityImage(const QuantizeInfo *,Image *,const Image *) ;
extern  MagickBooleanType
  AffinityImages(const QuantizeInfo *,Image *,const Image *) ;
extern  MagickBooleanType
  AllocateImageColormap(Image *,const size_t) ;
extern  MagickBooleanType
  ClipPathImage(Image *,const char *,const MagickBooleanType) ;
extern  MagickBooleanType
  CloneImageAttributes(Image *,const Image *) ;
extern  MagickBooleanType
  ColorFloodfillImage(Image *,const DrawInfo *,const PixelPacket,const ssize_t, const ssize_t,const PaintMethod) ;
extern  MagickBooleanType
  ConstituteComponentGenesis(void) ;
extern  MagickBooleanType
  DeleteImageAttribute(Image *,const char *) ;
extern  MagickBooleanType
  DeleteMagickRegistry(const ssize_t) ;
extern  MagickBooleanType
  DescribeImage(Image *,FILE *,const MagickBooleanType) ;
extern  MagickBooleanType
  FormatImageAttribute(Image *,const char *,const char *,...) ;
extern  MagickBooleanType
  FormatImageAttributeList(Image *,const char *,const char *,va_list) ;
extern  MagickBooleanType
  FormatImagePropertyList(Image *,const char *,const char *,va_list) ;
extern  MagickBooleanType
  FuzzyColorCompare(const Image *,const PixelPacket *,const PixelPacket *) ;
extern  MagickBooleanType
  FuzzyOpacityCompare(const Image *,const PixelPacket *,const PixelPacket *) ;
extern  MagickBooleanType
  InitializeModuleList(ExceptionInfo *) ;
extern  MagickBooleanType
  IsMagickInstantiated(void) ;
extern  MagickBooleanType
  LevelImageColors(Image *,const ChannelType,const MagickPixelPacket *,  const MagickPixelPacket *, const MagickBooleanType) ;
extern  MagickBooleanType
  LoadMimeLists(const char *,ExceptionInfo *) ;
extern  MagickBooleanType
  MagickMonitor(const char *,const MagickOffsetType,const MagickSizeType, void *) ;
extern  MagickBooleanType
  MapImage(Image *,const Image *,const MagickBooleanType) ;
extern  MagickBooleanType
  MapImages(Image *,const Image *,const MagickBooleanType) ;
extern  MagickBooleanType
  MatteFloodfillImage(Image *,const PixelPacket,const Quantum,const ssize_t,  const ssize_t,const PaintMethod) ;
extern  MagickBooleanType
  OpaqueImage(Image *,const PixelPacket,const PixelPacket) ;
extern  MagickBooleanType
  PaintFloodfillImage(Image *,const ChannelType,const MagickPixelPacket *,const ssize_t,const ssize_t,const DrawInfo *,const PaintMethod) ;
extern  MagickBooleanType
  PaintOpaqueImage(Image *,const MagickPixelPacket *,const MagickPixelPacket *) ;
extern  MagickBooleanType
  PaintOpaqueImageChannel(Image *,const ChannelType,const MagickPixelPacket *, const MagickPixelPacket *) ;
extern  MagickBooleanType
  PaintTransparentImage(Image *,const MagickPixelPacket *,const Quantum) ;
extern  MagickBooleanType
  SetExceptionInfo(ExceptionInfo *,ExceptionType) ;
extern  MagickBooleanType
  SetImageAttribute(Image *,const char *,const char *) ;
extern  MagickBooleanType
  SyncCacheViewPixels(CacheView *) ; 
extern  MagickBooleanType
  SyncImagePixels(Image *) ;
extern  MagickBooleanType
  TransparentImage(Image *,const PixelPacket,const Quantum)    ;

extern  MagickPixelPacket
  AcquireOneMagickPixel(const Image *,const ssize_t,const ssize_t,    ExceptionInfo *) ;

extern  MonitorHandler
  GetMonitorHandler(void) ;
extern  MonitorHandler
  SetMonitorHandler(MonitorHandler) ;

extern  MagickOffsetType
  SizeBlob(Image *image) ;

extern  MagickPixelPacket
  InterpolatePixelColor(const Image *,CacheView *,const InterpolatePixelMethod,    const double,const double,ExceptionInfo *) ;

extern  MagickStatusType
  ParseSizeGeometry(const Image *,const char *,RectangleInfo *)    ;

extern  PixelPacket
  AcquireOnePixel(const Image *,const ssize_t,const ssize_t,ExceptionInfo *)  ;
extern  PixelPacket
  AcquireOneVirtualPixel(const Image *,const VirtualPixelMethod,const ssize_t,const ssize_t,ExceptionInfo *) ;
extern  PixelPacket
  *GetCacheView(CacheView *,const ssize_t,const ssize_t,const size_t, const size_t) ;
extern  PixelPacket
  *GetCacheViewPixels(CacheView *,const ssize_t,const ssize_t,const size_t, const size_t) ;
extern  PixelPacket
  *GetImagePixels(Image *,const ssize_t,const ssize_t,const size_t, const size_t) ;
extern  PixelPacket
  GetOnePixel(Image *,const ssize_t,const ssize_t) ;
extern  PixelPacket
  *GetPixels(const Image *) ; 
extern  PixelPacket
  *SetCacheViewPixels(CacheView *,const ssize_t,const ssize_t,const size_t, const size_t) ;
extern  PixelPacket
  *SetImagePixels(Image *,const ssize_t,const ssize_t,const size_t,  const size_t) ;

extern  MagickRealType
  InversesRGBCompandor(const MagickRealType) ;
extern  MagickRealType
  sRGBCompandor(const MagickRealType) ;

extern  size_t
  GetImageListSize(const Image *) ;
extern  size_t
  PopImagePixels(Image *,const QuantumType,unsigned char *);
extern  size_t
  PushImagePixels(Image *,const QuantumType,const unsigned char *)    ;

extern  ssize_t
  FormatMagickString(char *,const size_t,const char *,...) ;
extern  ssize_t
  FormatMagickStringList(char *,const size_t,const char *,va_list) ;
extern  ssize_t
  GetImageListIndex(const Image *) ;
extern  ssize_t
  SetMagickRegistry(const RegistryType,const void *,const size_t,  ExceptionInfo *) ;

extern  unsigned int
  ChannelImage(Image *,const ChannelType) ;
extern  unsigned int
  ChannelThresholdImage(Image *,const char *) ;
extern  unsigned int
  DispatchImage(const Image *,const ssize_t,const ssize_t,const size_t,  const size_t,const char *,const StorageType,void *,ExceptionInfo *) ;
extern  unsigned int
  FuzzyColorMatch(const PixelPacket *,const PixelPacket *,const double) ;
extern  unsigned int
  GetNumberScenes(const Image *) ;
extern  unsigned int
  GetMagickGeometry(const char *,ssize_t *,ssize_t *,size_t *,size_t *) ;
extern  unsigned int
  IsSubimage(const char *,const unsigned int) ;
extern  unsigned int
  PushImageList(Image **,const Image *,ExceptionInfo *) ;
extern  unsigned int
  QuantizationError(Image *) ;
extern  unsigned int
  RandomChannelThresholdImage(Image *,const char *,const char *, ExceptionInfo *) ;
extern  unsigned int
  SetImageList(Image **,const Image *,const ssize_t,ExceptionInfo *) ;
extern  unsigned int
  TransformColorspace(Image *,const ColorspaceType) ;
extern  unsigned int
  ThresholdImage(Image *,const double) ;
extern  unsigned int
  ThresholdImageChannel(Image *,const char *) ;
extern  unsigned int
  UnshiftImageList(Image **,const Image *,ExceptionInfo *) ;

extern  void
  *AcquireMemory(const size_t) ;
extern  void
  AcquireSemaphoreInfo(SemaphoreInfo **) ;
extern  void
  AllocateNextImage(const ImageInfo *,Image *) ;
extern  void
  *CloneMemory(void *,const void *,const size_t) ;
extern  void
  ConstituteComponentTerminus(void) ;
extern  void
  DestroyConstitute(void) ;
extern  void
  DestroyImageAttributes(Image *) ;
extern  void
  DestroyImages(Image *) ;
extern  void
  DestroyMagick(void) ;
extern  void
  DestroyMagickRegistry(void) ;
extern  void
  *GetConfigureBlob(const char *,char *,size_t *,ExceptionInfo *) ;
extern  void
  GetExceptionInfo(ExceptionInfo *) ;
extern  void
  *GetMagickRegistry(const ssize_t,RegistryType *,size_t *,ExceptionInfo *) ;
extern  void
  GetTokenToken(const char *,const char **,char *) ;
extern  void
  IdentityAffine(AffineMatrix *) ;
extern  void
  LiberateMemory(void **) ;
extern  void
  LiberateSemaphoreInfo(SemaphoreInfo **) ;
extern  void
  FormatString(char *,const char *,...) ;
extern  void
  FormatStringList(char *,const char *,va_list) ;
extern  void
  HSLTransform(const double,const double,const double,Quantum *,Quantum *,  Quantum *) ;
extern  void
  InitializeMagick(const char *) ;
extern  void
  MagickIncarnate(const char *) ;
extern  void
  ReacquireMemory(void **,const size_t) ;
extern  void
  RelinquishSemaphoreInfo(SemaphoreInfo *) ;
extern  void
  ResetImageAttributeIterator(const Image *) ;
extern  void
  SetCacheThreshold(const size_t) ;
extern  void
  SetImage(Image *,const Quantum) ;
extern  void
  Strip(char *) ;
extern  void
  TemporaryFilename(char *) ; 
extern  void
  TransformHSL(const Quantum,const Quantum,const Quantum,double *,double *, double *) ;

extern  void
  *CropImageToHBITMAP(Image *,const RectangleInfo *,ExceptionInfo *) ;
extern  void
  *ImageToHBITMAP(Image *,ExceptionInfo *);

/*xxxxxxxxxxxxxxx
  Inline methods.
static inline double MagickEpsilonReciprocal(const double x)
{
  double
    sign;

  sign=x < 0.0 ? -1.0 : 1.0;
  if ((sign*x) >= MagickEpsilon)
    return(1.0/x);
  return(sign/MagickEpsilon);
}

static inline Quantum PixelIntensityToQuantum(
  const Image *magick_restrict image,const PixelPacket *magick_restrict pixel)
{
  return(ClampToQuantum(GetPixelIntensity(image,pixel)));
}
*/

#endif
