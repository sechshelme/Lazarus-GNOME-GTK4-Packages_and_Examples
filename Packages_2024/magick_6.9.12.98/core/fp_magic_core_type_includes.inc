  // ==== /usr/include/ImageMagick-6/magick/magick-type.h

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

type
  PClassType = ^TClassType;
  TClassType = longint;

type
  PMagickBooleanType = ^TMagickBooleanType;
  TMagickBooleanType = Boolean32;

const
  MagickFalse = Boolean32(0);
  MagickTrue = Boolean32(1);

type
  PPImage = ^PImage;
  PImage = ^TImage;

  PBlobInfo = type Pointer;

  // ==== /usr/include/ImageMagick-6/magick/semaphore.h

  PSemaphoreInfo = type Pointer;
  PPSemaphoreInfo = ^PSemaphoreInfo;

  // ==== /usr/include/ImageMagick-6/magick/pixel.h

  TDoublePixelPacket = record
    red: double;
    green: double;
    blue: double;
    opacity: double;
    index: double;
  end;
  PDoublePixelPacket = ^TDoublePixelPacket;

  TLongPixelPacket = record
    red: dword;
    green: dword;
    blue: dword;
    opacity: dword;
    index: dword;
  end;
  PLongPixelPacket = ^TLongPixelPacket;

  TMagickPixelPacket = record
    storage_class: TClassType;
    colorspace: TColorspaceType;
    matte: TMagickBooleanType;
    fuzz: double;
    depth: Tsize_t;
    red: TMagickRealType;
    green: TMagickRealType;
    blue: TMagickRealType;
    opacity: TMagickRealType;
    index: TMagickRealType;
  end;
  PMagickPixelPacket = ^TMagickPixelPacket;

  PIndexPacket = ^TIndexPacket;
  TIndexPacket = TQuantum;

  TPixelPacket = record
    blue: TQuantum;
    green: TQuantum;
    red: TQuantum;
    opacity: TQuantum;
  end;
  PPixelPacket = ^TPixelPacket;

  TQuantumPixelPacket = record
    red: TQuantum;
    green: TQuantum;
    blue: TQuantum;
    opacity: TQuantum;
    index: TQuantum;
  end;
  PQuantumPixelPacket = ^TQuantumPixelPacket;

  PCacheView = type Pointer;

  // ==== /usr/include/ImageMagick-6/magick/geometry.h

  TAffineMatrix = record
    sx: double;
    rx: double;
    ry: double;
    sy: double;
    tx: double;
    ty: double;
  end;
  PAffineMatrix = ^TAffineMatrix;

  TGeometryInfo = record
    rho: double;
    sigma: double;
    xi: double;
    psi: double;
    chi: double;
  end;
  PGeometryInfo = ^TGeometryInfo;

  TOffsetInfo = record
    x: Tssize_t;
    y: Tssize_t;
  end;
  POffsetInfo = ^TOffsetInfo;

  TRectangleInfo = record
    width: Tsize_t;
    height: Tsize_t;
    x: Tssize_t;
    y: Tssize_t;
  end;
  PRectangleInfo = ^TRectangleInfo;

  // ==== /usr/include/ImageMagick-6/magick/color.h

  PPColorInfo = ^PColorInfo;
  PColorInfo = ^TColorInfo;

  TColorInfo = record
    path: pchar;
    name: pchar;
    compliance: TComplianceType;
    color: TMagickPixelPacket;
    exempt: TMagickBooleanType;
    stealth: TMagickBooleanType;
    previous: PColorInfo;
    next: PColorInfo;
    signature: Tsize_t;
  end;

  TErrorInfo = record
    mean_error_per_pixel: double;
    normalized_mean_error: double;
    normalized_maximum_error: double;
  end;
  PErrorInfo = ^TErrorInfo;

  // ==== /usr/include/ImageMagick-6/magick/timer.h

  TTimer = record
    start: double;
    stop: double;
    total: double;
  end;
  PTimer = ^TTimer;

  TTimerInfo = record
    user: TTimer;
    elapsed: TTimer;
    state: TTimerState;
    signature: Tsize_t;
  end;
  PTimerInfo = ^TTimerInfo;

  // ==== /usr/include/ImageMagick-6/magick/monitor.h

  TMagickProgressMonitor = function(para1: pchar; para2: TMagickOffsetType; para3: TMagickSizeType; para4: pointer): TMagickBooleanType; cdecl;

  // ==== /usr/include/ImageMagick-6/magick/compress.h

  PAscii85Info = type Pointer;

  // ==== /usr/include/ImageMagick-6/magick/exception.h

  TExceptionInfo = record
    severity: TExceptionType;
    error_number: longint;
    reason: pchar;
    description: pchar;
    exceptions: pointer;
    relinquish: TMagickBooleanType;
    semaphore: PSemaphoreInfo;
    signature: Tsize_t;
  end;
  PExceptionInfo = ^TExceptionInfo;

  TErrorHandler = procedure(para1: TExceptionType; para2: pchar; para3: pchar); cdecl;
  TFatalErrorHandler = procedure(para1: TExceptionType; para2: pchar; para3: pchar); cdecl;
  TWarningHandler = procedure(para1: TExceptionType; para2: pchar; para3: pchar); cdecl;

  // ==== /usr/include/ImageMagick-6/magick/profile.h

  TProfileInfo = record
    name: pchar;
    length: Tsize_t;
    info: pbyte;
    signature: Tsize_t;
  end;
  PProfileInfo = ^TProfileInfo;

  // ==== /usr/include/ImageMagick-6/magick/stream.h

  TStreamHandler = function(para1: PImage; para2: pointer; para3: Tsize_t): Tsize_t; cdecl;

  // ==== /usr/include/ImageMagick-6/magick/image.h

  TPrimaryInfo = record
    x: double;
    y: double;
    z: double;
  end;
  PPrimaryInfo = ^TPrimaryInfo;

  TSegmentInfo = record
    x1: double;
    y1: double;
    x2: double;
    y2: double;
  end;
  PSegmentInfo = ^TSegmentInfo;
  TChromaticityInfo = record
    red_primary: TPrimaryInfo;
    green_primary: TPrimaryInfo;
    blue_primary: TPrimaryInfo;
    white_point: TPrimaryInfo;
  end;
  PChromaticityInfo = ^TChromaticityInfo;

  TImage = record
    storage_class: TClassType;
    colorspace: TColorspaceType;
    compression: TCompressionType;
    quality: Tsize_t;
    orientation: TOrientationType;
    taint: TMagickBooleanType;
    matte: TMagickBooleanType;
    columns: Tsize_t;
    rows: Tsize_t;
    depth: Tsize_t;
    colors: Tsize_t;
    colormap: PPixelPacket;
    background_color: TPixelPacket;
    border_color: TPixelPacket;
    matte_color: TPixelPacket;
    gamma: double;
    chromaticity: TChromaticityInfo;
    rendering_intent: TRenderingIntent;
    profiles: pointer;
    units: TResolutionType;
    montage: pchar;
    directory: pchar;
    geometry: pchar;
    offset: Tssize_t;
    x_resolution: double;
    y_resolution: double;
    page: TRectangleInfo;
    extract_info: TRectangleInfo;
    tile_info: TRectangleInfo;
    bias: double;
    blur: double;
    fuzz: double;
    filter: TFilterTypes;
    interlace: TInterlaceType;
    endian: TEndianType;
    gravity: TGravityType;
    compose: TCompositeOperator;
    _dispose: TDisposeType;
    clip_mask: PImage;
    scene: Tsize_t;
    delay: Tsize_t;
    ticks_per_second: Tssize_t;
    iterations: Tsize_t;
    total_colors: Tsize_t;
    start_loop: Tssize_t;
    error: TErrorInfo;
    timer: TTimerInfo;
    progress_monitor: TMagickProgressMonitor;
    client_data: pointer;
    cache: pointer;
    attributes: pointer;
    ascii85: PAscii85Info;
    blob: PBlobInfo;
    filename: array[0..(MaxTextExtent) - 1] of char;
    magick_filename: array[0..(MaxTextExtent) - 1] of char;
    magick: array[0..(MaxTextExtent) - 1] of char;
    magick_columns: Tsize_t;
    magick_rows: Tsize_t;
    exception: TExceptionInfo;
    debug: TMagickBooleanType;
    reference_count: Tssize_t;
    semaphore: PSemaphoreInfo;
    color_profile: TProfileInfo;
    iptc_profile: TProfileInfo;
    generic_profile: PProfileInfo;
    generic_profiles: Tsize_t;
    signature: Tsize_t;
    previous: PImage;
    list: PImage;
    next: PImage;
    interpolate: TInterpolatePixelMethod;
    black_point_compensation: TMagickBooleanType;
    transparent_color: TPixelPacket;
    mask: PImage;
    tile_offset: TRectangleInfo;
    properties: pointer;
    artifacts: pointer;
    _type: TImageType;
    dither: TMagickBooleanType;
    extent: TMagickSizeType;
    ping: TMagickBooleanType;
    channels: Tsize_t;
    timestamp: Ttime_t;
    intensity: TPixelIntensityMethod;
    duration: Tsize_t;
    tietz_offset: longint;
  end;

  TImageInfo = record
    compression: TCompressionType;
    orientation: TOrientationType;
    temporary: TMagickBooleanType;
    adjoin: TMagickBooleanType;
    affirm: TMagickBooleanType;
    antialias: TMagickBooleanType;
    size: pchar;
    extract: pchar;
    page: pchar;
    scenes: pchar;
    scene: Tsize_t;
    number_scenes: Tsize_t;
    depth: Tsize_t;
    interlace: TInterlaceType;
    endian: TEndianType;
    units: TResolutionType;
    quality: Tsize_t;
    sampling_factor: pchar;
    server_name: pchar;
    font: pchar;
    texture: pchar;
    density: pchar;
    pointsize: double;
    fuzz: double;
    background_color: TPixelPacket;
    border_color: TPixelPacket;
    matte_color: TPixelPacket;
    dither: TMagickBooleanType;
    monochrome: TMagickBooleanType;
    colors: Tsize_t;
    colorspace: TColorspaceType;
    _type: TImageType;
    preview_type: TPreviewType;
    group: Tssize_t;
    ping: TMagickBooleanType;
    verbose: TMagickBooleanType;
    view: pchar;
    authenticate: pchar;
    channel: TChannelType;
    attributes: PImage;
    options: pointer;
    progress_monitor: TMagickProgressMonitor;
    client_data: pointer;
    cache: pointer;
    stream: TStreamHandler;
    file_: PFILE;
    blob: pointer;
    length: Tsize_t;
    magick: array[0..(MaxTextExtent) - 1] of char;
    unique: array[0..(MaxTextExtent) - 1] of char;
    zero: array[0..(MaxTextExtent) - 1] of char;
    filename: array[0..(MaxTextExtent) - 1] of char;
    debug: TMagickBooleanType;
    tile: pchar;
    subimage: Tsize_t;
    subrange: Tsize_t;
    pen: TPixelPacket;
    signature: Tsize_t;
    virtual_pixel_method: TVirtualPixelMethod;
    transparent_color: TPixelPacket;
    profile: pointer;
    synchronize: TMagickBooleanType;
  end;
  PImageInfo = ^TImageInfo;

  // ==== /usr/include/ImageMagick-6/magick/coder.h

  PPCoderInfo = ^PCoderInfo;
  PCoderInfo = ^TCoderInfo;

  TCoderInfo = record
    path: pchar;
    magick: pchar;
    name: pchar;
    exempt: TMagickBooleanType;
    stealth: TMagickBooleanType;
    previous: PCoderInfo;
    next: PCoderInfo;
    signature: Tsize_t;
  end;

  // ==== /usr/include/ImageMagick-6/magick/configure.h

  PPConfigureInfo = ^PConfigureInfo;
  PConfigureInfo = ^TConfigureInfo;

  TConfigureInfo = record
    path: pchar;
    name: pchar;
    value: pchar;
    exempt: TMagickBooleanType;
    stealth: TMagickBooleanType;
    previous: PConfigureInfo;
    next: PConfigureInfo;
    signature: Tsize_t;
  end;

  // ==== /usr/include/ImageMagick-6/magick/decorate.h

  TFrameInfo = record
    width: Tsize_t;
    height: Tsize_t;
    x: Tssize_t;
    y: Tssize_t;
    inner_bevel: Tssize_t;
    outer_bevel: Tssize_t;
  end;
  PFrameInfo = ^TFrameInfo;

  // ==== /usr/include/ImageMagick-6/magick/delegate.h

  PPDelegateInfo = ^PDelegateInfo;
  PDelegateInfo = ^TDelegateInfo;

  TDelegateInfo = record
    path: pchar;
    decode: pchar;
    encode: pchar;
    commands: pchar;
    mode: Tssize_t;
    thread_support: TMagickBooleanType;
    spawn: TMagickBooleanType;
    stealth: TMagickBooleanType;
    previous: PDelegateInfo;
    next: PDelegateInfo;
    signature: Tsize_t;
    semaphore: PSemaphoreInfo;
  end;

  // ==== /usr/include/ImageMagick-6/magick/draw.h

  TPointInfo = record
    x: double;
    y: double;
  end;
  PPointInfo = ^TPointInfo;

  TStopInfo = record
    color: TMagickPixelPacket;
    offset: TMagickRealType;
  end;
  PStopInfo = ^TStopInfo;

  TGradientInfo = record
    _type: TGradientType;
    bounding_box: TRectangleInfo;
    gradient_vector: TSegmentInfo;
    stops: PStopInfo;
    number_stops: Tsize_t;
    spread: TSpreadMethod;
    debug: TMagickBooleanType;
    signature: Tsize_t;
    center: TPointInfo;
    radius: TMagickRealType;
    angle: TMagickRealType;
    radii: TPointInfo;
  end;
  PGradientInfo = ^TGradientInfo;

  PElementReference = ^TElementReference;

  TElementReference = record
    id: pchar;
    _type: TReferenceType;
    gradient: TGradientInfo;
    signature: Tsize_t;
    previous: PElementReference;
    next: PElementReference;
  end;

  TDrawInfo = record
    primitive: pchar;
    geometry: pchar;
    viewbox: TRectangleInfo;
    affine: TAffineMatrix;
    gravity: TGravityType;
    fill: TPixelPacket;
    stroke: TPixelPacket;
    stroke_width: double;
    gradient: TGradientInfo;
    fill_pattern: PImage;
    tile: PImage;
    stroke_pattern: PImage;
    stroke_antialias: TMagickBooleanType;
    text_antialias: TMagickBooleanType;
    fill_rule: TFillRule;
    linecap: TLineCap;
    linejoin: TLineJoin;
    miterlimit: Tsize_t;
    dash_offset: double;
    decorate: TDecorationType;
    compose: TCompositeOperator;
    text: pchar;
    face: Tsize_t;
    font: pchar;
    metrics: pchar;
    family: pchar;
    style: TStyleType;
    stretch: TStretchType;
    weight: Tsize_t;
    encoding: pchar;
    pointsize: double;
    density: pchar;
    align: TAlignType;
    undercolor: TPixelPacket;
    border_color: TPixelPacket;
    server_name: pchar;
    dash_pattern: Pdouble;
    clip_mask: pchar;
    bounds: TSegmentInfo;
    clip_units: TClipPathUnits;
    opacity: TQuantum;
    render: TMagickBooleanType;
    element_reference: TElementReference;
    debug: TMagickBooleanType;
    signature: Tsize_t;
    kerning: double;
    interword_spacing: double;
    interline_spacing: double;
    direction: TDirectionType;
    fill_opacity: double;
    stroke_opacity: double;
    clip_path: TMagickBooleanType;
    clipping_mask: PImage;
    compliance: TComplianceType;
    composite_mask: PImage;
    id: pchar;
    image_info: PImageInfo;
  end;
  PDrawInfo = ^TDrawInfo;

  TPrimitiveInfo = record
    point: TPointInfo;
    coordinates: Tsize_t;
    primitive: TPrimitiveType;
    method: TPaintMethod;
    text: pchar;
    closed_subpath: TMagickBooleanType;
  end;
  PPrimitiveInfo = ^TPrimitiveInfo;

  TTypeMetric = record
    pixels_per_em: TPointInfo;
    ascent: double;
    descent: double;
    width: double;
    height: double;
    max_advance: double;
    underline_position: double;
    underline_thickness: double;
    bounds: TSegmentInfo;
    origin: TPointInfo;
  end;
  PTypeMetric = ^TTypeMetric;

  // ==== /usr/include/ImageMagick-6/magick/feature.h

  TChannelFeatures = record
    angular_second_moment: array[0..3] of double;
    contrast: array[0..3] of double;
    correlation: array[0..3] of double;
    variance_sum_of_squares: array[0..3] of double;
    inverse_difference_moment: array[0..3] of double;
    sum_average: array[0..3] of double;
    sum_variance: array[0..3] of double;
    sum_entropy: array[0..3] of double;
    entropy: array[0..3] of double;
    difference_variance: array[0..3] of double;
    difference_entropy: array[0..3] of double;
    measure_of_correlation_1: array[0..3] of double;
    measure_of_correlation_2: array[0..3] of double;
    maximum_correlation_coefficient: array[0..3] of double;
  end;
  PChannelFeatures = ^TChannelFeatures;

  // ==== /usr/include/ImageMagick-6/magick/hashmap.h

  PHashmapInfo = type Pointer;
  PLinkedListInfo = type Pointer;

  // ==== /usr/include/ImageMagick-6/magick/histogram.h
  TColorPacket = record
    pixel: TPixelPacket;
    index: TIndexPacket;
    count: TMagickSizeType;
  end;
  PColorPacket = ^TColorPacket;

  // ==== /usr/include/ImageMagick-6/magick/image-view.h

  PImageView = type Pointer;

  TDuplexTransferImageViewMethod = function(para1: PImageView; para2: PImageView; para3: PImageView; para4: Tssize_t; para5: longint; para6: pointer): TMagickBooleanType; cdecl;
  TGetImageViewMethod = function(para1: PImageView; para2: Tssize_t; para3: longint; para4: pointer): TMagickBooleanType; cdecl;
  TSetImageViewMethod = function(para1: PImageView; para2: Tssize_t; para3: longint; para4: pointer): TMagickBooleanType; cdecl;
  TTransferImageViewMethod = function(para1: PImageView; para2: PImageView; para3: Tssize_t; para4: longint; para5: pointer): TMagickBooleanType; cdecl;
  TUpdateImageViewMethod = function(para1: PImageView; para2: Tssize_t; para3: longint; para4: pointer): TMagickBooleanType; cdecl;

  // ==== /usr/include/ImageMagick-6/magick/locale_.h

  PPLocaleInfo = ^PLocaleInfo;
  PLocaleInfo = ^TLocaleInfo;

  TLocaleInfo = record
    path: pchar;
    tag: pchar;
    message: pchar;
    stealth: TMagickBooleanType;
    previous: PLocaleInfo;
    next: PLocaleInfo;
    signature: Tsize_t;
  end;

  // ==== /usr/include/ImageMagick-6/magick/log.h

  TMagickLogMethod = procedure(para1: TLogEventType; para2: pchar); cdecl;

  PLogInfo = type Pointer;
  PPLogInfo = ^PLogInfo;

  // ==== /usr/include/ImageMagick-6/magick/magic.h

  PPMagicInfo = ^PMagicInfo;
  PMagicInfo = ^TMagicInfo;

  TMagicInfo = record
    path: pchar;
    name: pchar;
    target: pchar;
    magic: pbyte;
    length: Tsize_t;
    offset: TMagickOffsetType;
    exempt: TMagickBooleanType;
    stealth: TMagickBooleanType;
    previous: PMagicInfo;
    next: PMagicInfo;
    signature: Tsize_t;
  end;

  // ==== /usr/include/ImageMagick-6/magick/magick.h

  TDecodeImageHandler = function(para1: PImageInfo; para2: PExceptionInfo): PImage; cdecl;
  TEncodeImageHandler = function(para1: PImageInfo; para2: PImage): TMagickBooleanType; cdecl;
  TIsImageFormatHandler = function(para1: pbyte; para2: Tsize_t): TMagickBooleanType; cdecl;

  PPMagickInfo = ^PMagickInfo;
  PMagickInfo = ^TMagickInfo;

  TMagickInfo = record
    name: pchar;
    description: pchar;
    version: pchar;
    note: pchar;
    magick_module: pchar;
    image_info: PImageInfo;
    decoder: TDecodeImageHandler;
    encoder: TEncodeImageHandler;
    magick: TIsImageFormatHandler;
    client_data: pointer;
    adjoin: TMagickBooleanType;
    raw: TMagickBooleanType;
    endian_support: TMagickBooleanType;
    blob_support: TMagickBooleanType;
    seekable_stream: TMagickBooleanType;
    format_type: TMagickFormatType;
    thread_support: TMagickStatusType;
    stealth: TMagickBooleanType;
    previous: PMagickInfo;
    next: PMagickInfo;
    signature: Tsize_t;
    mime_type: pchar;
    semaphore: PSemaphoreInfo;
  end;

  // ==== /usr/include/ImageMagick-6/magick/matrix.h

  PMatrixInfo = type Pointer;

  // ==== /usr/include/ImageMagick-6/magick/memory_.h

  PMemoryInfo = type Pointer;

  PAcquireMemoryHandler = ^TAcquireMemoryHandler;
  TAcquireMemoryHandler = function(para1: Tsize_t): pointer; cdecl;

  PDestroyMemoryHandler = ^TDestroyMemoryHandler;
  TDestroyMemoryHandler = procedure(para1: pointer); cdecl;

  PResizeMemoryHandler = ^TResizeMemoryHandler;
  TResizeMemoryHandler = function(para1: pointer; para2: Tsize_t): pointer; cdecl;

  PAcquireAlignedMemoryHandler = ^TAcquireAlignedMemoryHandler;
  TAcquireAlignedMemoryHandler = function(para1: Tsize_t; para2: Tsize_t): pointer; cdecl;

  TRelinquishAlignedMemoryHandler = procedure(para1: pointer); cdecl;

  // ==== /usr/include/ImageMagick-6/magick/mime.h

  PMimeInfo = type Pointer;
  PPMimeInfo = ^PMimeInfo;

  // ==== /usr/include/ImageMagick-6/magick/module.h

  PPModuleInfo = ^PModuleInfo;
  PModuleInfo = ^TModuleInfo;

  TModuleInfo = record
    path: pchar;
    tag: pchar;
    handle: pointer;
    unregister_module: procedure; cdecl;
    register_module: function: Tsize_t; cdecl;
    timestamp: Ttime_t;
    stealth: TMagickBooleanType;
    previous: PModuleInfo;
    next: PModuleInfo;
    signature: Tsize_t;
  end;

  TImageFilterHandler = function(para1: PPImage; para2: longint; para3: PPchar; para4: PExceptionInfo): Tsize_t; cdecl;

  // ==== /usr/include/ImageMagick-6/magick/montage.h

  TMontageInfo = record
    geometry: pchar;
    tile: pchar;
    title: pchar;
    frame: pchar;
    texture: pchar;
    font: pchar;
    pointsize: double;
    border_width: Tsize_t;
    shadow: TMagickBooleanType;
    fill: TPixelPacket;
    stroke: TPixelPacket;
    background_color: TPixelPacket;
    border_color: TPixelPacket;
    matte_color: TPixelPacket;
    gravity: TGravityType;
    filename: array[0..(MaxTextExtent) - 1] of char;
    debug: TMagickBooleanType;
    signature: Tsize_t;
  end;
  PMontageInfo = ^TMontageInfo;

  // ==== /usr/include/ImageMagick-6/magick/morphology.h

  PKernelInfo = ^TKernelInfo;

  TKernelInfo = record
    _type: TKernelInfoType;
    width: Tsize_t;
    height: Tsize_t;
    x: Tssize_t;
    y: Tssize_t;
    values: Pdouble;
    minimum: double;
    maximum: double;
    negative_range: double;
    positive_range: double;
    angle: double;
    next: PKernelInfo;
    signature: Tsize_t;
  end;

  // ==== /usr/include/ImageMagick-6/magick/opencl.h

  TMagickCLEnv = type Pointer;

  // ==== /usr/include/ImageMagick-6/magick/option.h

  TOptionInfo = record
    mnemonic: pchar;
    _type: Tssize_t;
    flags: Tssize_t;
    stealth: TMagickBooleanType;
  end;
  POptionInfo = ^TOptionInfo;

  // ==== /usr/include/ImageMagick-6/magick/policy.h

  PolicyInfo = type Pointer;
  PPolicyInfo = ^PolicyInfo;
  PPPolicyInfo = ^PPolicyInfo;

  // ==== /usr/include/ImageMagick-6/magick/quantize.h

  TQuantizeInfo = record
    number_colors: Tsize_t;
    tree_depth: Tsize_t;
    dither: TMagickBooleanType;
    colorspace: TColorspaceType;
    measure_error: TMagickBooleanType;
    signature: Tsize_t;
    dither_method: TDitherMethod;
  end;
  PQuantizeInfo = ^TQuantizeInfo;

  // ==== /usr/include/ImageMagick-6/magick/quantum.h

  PQuantumInfo = type Pointer;

  // ==== /usr/include/ImageMagick-6/magick/random_.h

  PRandomInfo = type Pointer;

  // ==== /usr/include/ImageMagick-6/magick/resample.h

  PResampleFilter = type Pointer;

  // ==== /usr/include/ImageMagick-6/magick/resize.h

  PResizeFilter = type Pointer;

  // ==== /usr/include/ImageMagick-6/magick/splay-tree.h

  PSplayTreeInfo = type Pointer;

  // ==== /usr/include/ImageMagick-6/magick/statistic.h

  TChannelStatistics = record
    depth: Tsize_t;
    minima: double;
    maxima: double;
    sum: double;
    sum_squared: double;
    sum_cubed: double;
    sum_fourth_power: double;
    mean: double;
    variance: double;
    standard_deviation: double;
    kurtosis: double;
    skewness: double;
    entropy: double;
  end;
  PChannelStatistics = ^TChannelStatistics;

  TChannelMoments = record
    I: array[0..31] of double;
    centroid: TPointInfo;
    ellipse_axis: TPointInfo;
    ellipse_angle: double;
    ellipse_eccentricity: double;
    ellipse_intensity: double;
  end;
  PChannelMoments = ^TChannelMoments;

  TChannelPerceptualHash = record
    P: array[0..31] of double;
    Q: array[0..31] of double;
  end;
  PChannelPerceptualHash = ^TChannelPerceptualHash;

  // ==== /usr/include/ImageMagick-6/magick/string_.h

  TStringInfo = record
    path: array[0..(MaxTextExtent) - 1] of char;
    datum: pbyte;
    length: Tsize_t;
    signature: Tsize_t;
    name: pchar;
  end;
  PStringInfo = ^TStringInfo;

  // ==== /usr/include/ImageMagick-6/magick/threshold.h

  PThresholdMap = type Pointer;

  // ==== /usr/include/ImageMagick-6/magick/token.h

  PTokenInfo = type Pointer;

  // ==== /usr/include/ImageMagick-6/magick/type.h

  PPTypeInfo = ^PTypeInfo;
  PTypeInfo = ^TTypeInfo;

  TTypeInfo = record
    face: Tsize_t;
    path: pchar;
    name: pchar;
    description: pchar;
    family: pchar;
    style: TStyleType;
    stretch: TStretchType;
    weight: Tsize_t;
    encoding: pchar;
    foundry: pchar;
    format: pchar;
    metrics: pchar;
    glyphs: pchar;
    stealth: TMagickBooleanType;
    previous: PTypeInfo;
    next: PTypeInfo;
    signature: Tsize_t;
  end;

  // ==== /usr/include/ImageMagick-6/magick/xml-tree.h

  PXMLTreeInfo = type Pointer;

  // ==== /usr/include/ImageMagick-6/magick/deprecate.h

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

  // ==== /usr/include/ImageMagick-6/magick/image.h

const
  OpaqueOpacity = TQuantum(0);


