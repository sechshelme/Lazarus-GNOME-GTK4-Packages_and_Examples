unit decode;

interface

uses
  fp_jxl, memory_manager, types, parallel_runner, codestream_header, color_encoding;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function JxlDecoderVersion:Tuint32_t;cdecl;external libjxl;

type
  PJxlSignature = ^TJxlSignature;
  TJxlSignature =  Longint;
  Const
    JXL_SIG_NOT_ENOUGH_BYTES = 0;
    JXL_SIG_INVALID = 1;
    JXL_SIG_CODESTREAM = 2;
    JXL_SIG_CONTAINER = 3;

function JxlSignatureCheck(buf:Puint8_t; len:Tsize_t):TJxlSignature;cdecl;external libjxl;

type
  PJxlDecoder=type Pointer;

function JxlDecoderCreate(memory_manager:PJxlMemoryManager):PJxlDecoder;cdecl;external libjxl;
procedure JxlDecoderReset(dec:PJxlDecoder);cdecl;external libjxl;
procedure JxlDecoderDestroy(dec:PJxlDecoder);cdecl;external libjxl;

type
  PJxlDecoderStatus = ^TJxlDecoderStatus;
  TJxlDecoderStatus =  Longint;
  Const
    JXL_DEC_SUCCESS = 0;
    JXL_DEC_ERROR = 1;
    JXL_DEC_NEED_MORE_INPUT = 2;
    JXL_DEC_NEED_PREVIEW_OUT_BUFFER = 3;
    JXL_DEC_NEED_DC_OUT_BUFFER = 4;
    JXL_DEC_NEED_IMAGE_OUT_BUFFER = 5;
    JXL_DEC_JPEG_NEED_MORE_OUTPUT = 6;
    JXL_DEC_BOX_NEED_MORE_OUTPUT = 7;
    JXL_DEC_BASIC_INFO = $40;
    JXL_DEC_EXTENSIONS = $80;
    JXL_DEC_COLOR_ENCODING = $100;
    JXL_DEC_PREVIEW_IMAGE = $200;
    JXL_DEC_FRAME = $400;
    JXL_DEC_DC_IMAGE = $800;
    JXL_DEC_FULL_IMAGE = $1000;
    JXL_DEC_JPEG_RECONSTRUCTION = $2000;
    JXL_DEC_BOX = $4000;
    JXL_DEC_FRAME_PROGRESSION = $8000;

procedure JxlDecoderRewind(dec:PJxlDecoder);cdecl;external libjxl;
procedure JxlDecoderSkipFrames(dec:PJxlDecoder; amount:Tsize_t);cdecl;external libjxl;
function JxlDecoderSkipCurrentFrame(dec:PJxlDecoder):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderDefaultPixelFormat(dec:PJxlDecoder; format:PJxlPixelFormat):TJxlDecoderStatus;cdecl;external libjxl;deprecated;
function JxlDecoderSetParallelRunner(dec:PJxlDecoder; parallel_runner:TJxlParallelRunner; parallel_runner_opaque:pointer):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderSizeHintBasicInfo(dec:PJxlDecoder):Tsize_t;cdecl;external libjxl;
function JxlDecoderSubscribeEvents(dec:PJxlDecoder; events_wanted:longint):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderSetKeepOrientation(dec:PJxlDecoder; skip_reorientation:TJXL_BOOL):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderSetUnpremultiplyAlpha(dec:PJxlDecoder; unpremul_alpha:TJXL_BOOL):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderSetRenderSpotcolors(dec:PJxlDecoder; render_spotcolors:TJXL_BOOL):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderSetCoalescing(dec:PJxlDecoder; coalescing:TJXL_BOOL):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderProcessInput(dec:PJxlDecoder):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderSetInput(dec:PJxlDecoder; data:Puint8_t; size:Tsize_t):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderReleaseInput(dec:PJxlDecoder):Tsize_t;cdecl;external libjxl;
procedure JxlDecoderCloseInput(dec:PJxlDecoder);cdecl;external libjxl;
function JxlDecoderGetBasicInfo(dec:PJxlDecoder; info:PJxlBasicInfo):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderGetExtraChannelInfo(dec:PJxlDecoder; index:Tsize_t; info:PJxlExtraChannelInfo):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderGetExtraChannelName(dec:PJxlDecoder; index:Tsize_t; name:Pchar; size:Tsize_t):TJxlDecoderStatus;cdecl;external libjxl;

type
  PJxlColorProfileTarget = ^TJxlColorProfileTarget;
  TJxlColorProfileTarget =  Longint;
  Const
    JXL_COLOR_PROFILE_TARGET_ORIGINAL = 0;
    JXL_COLOR_PROFILE_TARGET_DATA = 1;

function JxlDecoderGetColorAsEncodedProfile(dec:PJxlDecoder; unused_format:PJxlPixelFormat; target:TJxlColorProfileTarget; color_encoding:PJxlColorEncoding):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderGetICCProfileSize(dec:PJxlDecoder; unused_format:PJxlPixelFormat; target:TJxlColorProfileTarget; size:Psize_t):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderGetColorAsICCProfile(dec:PJxlDecoder; unused_format:PJxlPixelFormat; target:TJxlColorProfileTarget; icc_profile:Puint8_t; size:Tsize_t):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderSetPreferredColorProfile(dec:PJxlDecoder; color_encoding:PJxlColorEncoding):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderSetDesiredIntensityTarget(dec:PJxlDecoder; desired_intensity_target:single):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderPreviewOutBufferSize(dec:PJxlDecoder; format:PJxlPixelFormat; size:Psize_t):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderSetPreviewOutBuffer(dec:PJxlDecoder; format:PJxlPixelFormat; buffer:pointer; size:Tsize_t):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderGetFrameHeader(dec:PJxlDecoder; header:PJxlFrameHeader):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderGetFrameName(dec:PJxlDecoder; name:Pchar; size:Tsize_t):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderGetExtraChannelBlendInfo(dec:PJxlDecoder; index:Tsize_t; blend_info:PJxlBlendInfo):TJxlDecoderStatus;cdecl;external libjxl;
function JxlDecoderDCOutBufferSize(dec:PJxlDecoder; format:PJxlPixelFormat; size:Psize_t):TJxlDecoderStatus;cdecl;external libjxl;deprecated;
g
{*
 * Sets the buffer to write the lower resolution (8x8 sub-sampled) DC image
 * to. The size of the buffer must be at least as large as given by @ref
 * JxlDecoderDCOutBufferSize. The buffer follows the format described by
 * JxlPixelFormat. The DC image has dimensions ceil(xsize / 8) * ceil(ysize /
 * 8). The buffer is owned by the caller.
 *
 * @param dec decoder object
 * @param format format of pixels. Object owned by user and its contents are
 *     copied internally.
 * @param buffer buffer type to output the pixel data to
 * @param size size of buffer in bytes
 * @return @ref JXL_DEC_SUCCESS on success, @ref JXL_DEC_ERROR on error, such as
 *     size too small.
 *
 * @deprecated The DC feature in this form will be removed. Use @ref
 *     JxlDecoderFlushImage for progressive rendering.
  }
{xxxxxxxextern JXL_DEPRECATED  }
function JxlDecoderSetDCOutBuffer(dec:PJxlDecoder; format:PJxlPixelFormat; buffer:pointer; size:Tsize_t):TJxlDecoderStatus;cdecl;external libjxl;
{*
 * Returns the minimum size in bytes of the image output pixel buffer for the
 * given format. This is the buffer for @ref JxlDecoderSetImageOutBuffer.
 * Requires that the basic image information is available in the decoder in the
 * case of coalescing enabled (default). In case coalescing is disabled, this
 * can only be called after the @ref JXL_DEC_FRAME event occurs. In that case,
 * it will return the size required to store the possibly cropped frame (which
 * can be larger or smaller than the image dimensions).
 *
 * @param dec decoder object
 * @param format format of the pixels.
 * @param size output value, buffer size in bytes
 * @return @ref JXL_DEC_SUCCESS on success, @ref JXL_DEC_ERROR on error, such as
 *     information not available yet.
  }
function JxlDecoderImageOutBufferSize(dec:PJxlDecoder; format:PJxlPixelFormat; size:Psize_t):TJxlDecoderStatus;cdecl;external libjxl;
{*
 * Sets the buffer to write the full resolution image to. This can be set when
 * the @ref JXL_DEC_FRAME event occurs, must be set when the @ref
 * JXL_DEC_NEED_IMAGE_OUT_BUFFER event occurs, and applies only for the
 * current frame. The size of the buffer must be at least as large as given
 * by @ref JxlDecoderImageOutBufferSize. The buffer follows the format described
 * by JxlPixelFormat. The buffer is owned by the caller.
 *
 * @param dec decoder object
 * @param format format of the pixels. Object owned by user and its contents
 *     are copied internally.
 * @param buffer buffer type to output the pixel data to
 * @param size size of buffer in bytes
 * @return @ref JXL_DEC_SUCCESS on success, @ref JXL_DEC_ERROR on error, such as
 *     size too small.
  }
function JxlDecoderSetImageOutBuffer(dec:PJxlDecoder; format:PJxlPixelFormat; buffer:pointer; size:Tsize_t):TJxlDecoderStatus;cdecl;external libjxl;
{*
 * Function type for @ref JxlDecoderSetImageOutCallback.
 *
 * The callback may be called simultaneously by different threads when using a
 * threaded parallel runner, on different pixels.
 *
 * @param opaque optional user data, as given to @ref
 *     JxlDecoderSetImageOutCallback.
 * @param x horizontal position of leftmost pixel of the pixel data.
 * @param y vertical position of the pixel data.
 * @param num_pixels amount of pixels included in the pixel data, horizontally.
 *     This is not the same as xsize of the full image, it may be smaller.
 * @param pixels pixel data as a horizontal stripe, in the format passed to @ref
 *     JxlDecoderSetImageOutCallback. The memory is not owned by the user, and
 *     is only valid during the time the callback is running.
  }
type

  TJxlImageOutCallback = procedure (opaque:pointer; x:Tsize_t; y:Tsize_t; num_pixels:Tsize_t; pixels:pointer);cdecl;
{*
 * Initialization callback for @ref JxlDecoderSetMultithreadedImageOutCallback.
 *
 * @param init_opaque optional user data, as given to @ref
 *     JxlDecoderSetMultithreadedImageOutCallback.
 * @param num_threads maximum number of threads that will call the @c run
 *     callback concurrently.
 * @param num_pixels_per_thread maximum number of pixels that will be passed in
 *     one call to @c run.
 * @return a pointer to data that will be passed to the @c run callback, or
 *     @c NULL if initialization failed.
  }

  PJxlImageOutInitCallback = ^TJxlImageOutInitCallback;
  TJxlImageOutInitCallback = function (init_opaque:pointer; num_threads:Tsize_t; num_pixels_per_thread:Tsize_t):pointer;cdecl;
{*
 * Worker callback for @ref JxlDecoderSetMultithreadedImageOutCallback.
 *
 * @param run_opaque user data returned by the @c init callback.
 * @param thread_id number in `[0, num_threads)` identifying the thread of the
 *     current invocation of the callback.
 * @param x horizontal position of the first (leftmost) pixel of the pixel data.
 * @param y vertical position of the pixel data.
 * @param num_pixels number of pixels in the pixel data. May be less than the
 *     full @c xsize of the image, and will be at most equal to the @c
 *     num_pixels_per_thread that was passed to @c init.
 * @param pixels pixel data as a horizontal stripe, in the format passed to @ref
 *     JxlDecoderSetMultithreadedImageOutCallback. The data pointed to
 *     remains owned by the caller and is only guaranteed to outlive the current
 *     callback invocation.
  }

  TJxlImageOutRunCallback = procedure (run_opaque:pointer; thread_id:Tsize_t; x:Tsize_t; y:Tsize_t; num_pixels:Tsize_t; 
                pixels:pointer);cdecl;
{*
 * Destruction callback for @ref JxlDecoderSetMultithreadedImageOutCallback,
 * called after all invocations of the @c run callback to perform any
 * appropriate clean-up of the @c run_opaque data returned by @c init.
 *
 * @param run_opaque user data returned by the @c init callback.
  }

  TJxlImageOutDestroyCallback = procedure (run_opaque:pointer);cdecl;
{*
 * Sets pixel output callback. This is an alternative to @ref
 * JxlDecoderSetImageOutBuffer. This can be set when the @ref JXL_DEC_FRAME
 * event occurs, must be set when the @ref JXL_DEC_NEED_IMAGE_OUT_BUFFER event
 * occurs, and applies only for the current frame. Only one of @ref
 * JxlDecoderSetImageOutBuffer or @ref JxlDecoderSetImageOutCallback may be used
 * for the same frame, not both at the same time.
 *
 * The callback will be called multiple times, to receive the image
 * data in small chunks. The callback receives a horizontal stripe of pixel
 * data, 1 pixel high, xsize pixels wide, called a scanline. The xsize here is
 * not the same as the full image width, the scanline may be a partial section,
 * and xsize may differ between calls. The user can then process and/or copy the
 * partial scanline to an image buffer. The callback may be called
 * simultaneously by different threads when using a threaded parallel runner, on
 * different pixels.
 *
 * If @ref JxlDecoderFlushImage is not used, then each pixel will be visited
 * exactly once by the different callback calls, during processing with one or
 * more @ref JxlDecoderProcessInput calls. These pixels are decoded to full
 * detail, they are not part of a lower resolution or lower quality progressive
 * pass, but the final pass.
 *
 * If @ref JxlDecoderFlushImage is used, then in addition each pixel will be
 * visited zero or one times during the blocking @ref JxlDecoderFlushImage call.
 * Pixels visited as a result of @ref JxlDecoderFlushImage may represent a lower
 * resolution or lower quality intermediate progressive pass of the image. Any
 * visited pixel will be of a quality at least as good or better than previous
 * visits of this pixel. A pixel may be visited zero times if it cannot be
 * decoded yet or if it was already decoded to full precision (this behavior is
 * not guaranteed).
 *
 * @param dec decoder object
 * @param format format of the pixels. Object owned by user; its contents are
 *     copied internally.
 * @param callback the callback function receiving partial scanlines of pixel
 *     data.
 * @param opaque optional user data, which will be passed on to the callback,
 *     may be NULL.
 * @return @ref JXL_DEC_SUCCESS on success, @ref JXL_DEC_ERROR on error, such
 *     as @ref JxlDecoderSetImageOutBuffer already set.
  }

function JxlDecoderSetImageOutCallback(dec:PJxlDecoder; format:PJxlPixelFormat; callback:TJxlImageOutCallback; opaque:pointer):TJxlDecoderStatus;cdecl;external libjxl;
{* Similar to @ref JxlDecoderSetImageOutCallback except that the callback is
 * allowed an initialization phase during which it is informed of how many
 * threads will call it concurrently, and those calls are further informed of
 * which thread they are occurring in.
 *
 * @param dec decoder object
 * @param format format of the pixels. Object owned by user; its contents are
 *     copied internally.
 * @param init_callback initialization callback.
 * @param run_callback the callback function receiving partial scanlines of
 *     pixel data.
 * @param destroy_callback clean-up callback invoked after all calls to @c
 *     run_callback. May be NULL if no clean-up is necessary.
 * @param init_opaque optional user data passed to @c init_callback, may be NULL
 *     (unlike the return value from @c init_callback which may only be NULL if
 *     initialization failed).
 * @return @ref JXL_DEC_SUCCESS on success, @ref JXL_DEC_ERROR on error, such
 *     as @ref JxlDecoderSetImageOutBuffer having already been called.
  }
function JxlDecoderSetMultithreadedImageOutCallback(dec:PJxlDecoder; format:PJxlPixelFormat; init_callback:TJxlImageOutInitCallback; run_callback:TJxlImageOutRunCallback; destroy_callback:TJxlImageOutDestroyCallback; 
           init_opaque:pointer):TJxlDecoderStatus;cdecl;external libjxl;
{*
 * Returns the minimum size in bytes of an extra channel pixel buffer for the
 * given format. This is the buffer for @ref JxlDecoderSetExtraChannelBuffer.
 * Requires the basic image information is available in the decoder.
 *
 * @param dec decoder object
 * @param format format of the pixels. The num_channels value is ignored and is
 *     always treated to be 1.
 * @param size output value, buffer size in bytes
 * @param index which extra channel to get, matching the index used in @ref
 *     JxlDecoderGetExtraChannelInfo. Must be smaller than num_extra_channels in
 *     the associated JxlBasicInfo.
 * @return @ref JXL_DEC_SUCCESS on success, @ref JXL_DEC_ERROR on error, such as
 *     information not available yet or invalid index.
  }
function JxlDecoderExtraChannelBufferSize(dec:PJxlDecoder; format:PJxlPixelFormat; size:Psize_t; index:Tuint32_t):TJxlDecoderStatus;cdecl;external libjxl;
{*
 * Sets the buffer to write an extra channel to. This can be set when
 * the @ref JXL_DEC_FRAME or @ref JXL_DEC_NEED_IMAGE_OUT_BUFFER event occurs,
 * and applies only for the current frame. The size of the buffer must be at
 * least as large as given by @ref JxlDecoderExtraChannelBufferSize. The buffer
 * follows the format described by JxlPixelFormat, but where num_channels is 1.
 * The buffer is owned by the caller. The amount of extra channels is given by
 * the num_extra_channels field in the associated JxlBasicInfo, and the
 * information of individual extra channels can be queried with @ref
 * JxlDecoderGetExtraChannelInfo. To get multiple extra channels, this function
 * must be called multiple times, once for each wanted index. Not all images
 * have extra channels. The alpha channel is an extra channel and can be gotten
 * as part of the color channels when using an RGBA pixel buffer with @ref
 * JxlDecoderSetImageOutBuffer, but additionally also can be gotten
 * separately as extra channel. The color channels themselves cannot be gotten
 * this way.
 *
 *
 * @param dec decoder object
 * @param format format of the pixels. Object owned by user and its contents
 *     are copied internally. The num_channels value is ignored and is always
 *     treated to be 1.
 * @param buffer buffer type to output the pixel data to
 * @param size size of buffer in bytes
 * @param index which extra channel to get, matching the index used in @ref
 *     JxlDecoderGetExtraChannelInfo. Must be smaller than num_extra_channels in
 *     the associated JxlBasicInfo.
 * @return @ref JXL_DEC_SUCCESS on success, @ref JXL_DEC_ERROR on error, such as
 *     size too small or invalid index.
  }
function JxlDecoderSetExtraChannelBuffer(dec:PJxlDecoder; format:PJxlPixelFormat; buffer:pointer; size:Tsize_t; index:Tuint32_t):TJxlDecoderStatus;cdecl;external libjxl;
{*
 * Sets output buffer for reconstructed JPEG codestream.
 *
 * The data is owned by the caller and may be used by the decoder until @ref
 * JxlDecoderReleaseJPEGBuffer is called or the decoder is destroyed or
 * reset so must be kept alive until then.
 *
 * If a JPEG buffer was set before and released with @ref
 * JxlDecoderReleaseJPEGBuffer, bytes that the decoder has already output
 * should not be included, only the remaining bytes output must be set.
 *
 * @param dec decoder object
 * @param data pointer to next bytes to write to
 * @param size amount of bytes available starting from data
 * @return @ref JXL_DEC_ERROR if output buffer was already set and @ref
 *     JxlDecoderReleaseJPEGBuffer was not called on it, @ref JXL_DEC_SUCCESS
 *     otherwise
  }
function JxlDecoderSetJPEGBuffer(dec:PJxlDecoder; data:Puint8_t; size:Tsize_t):TJxlDecoderStatus;cdecl;external libjxl;
{*
 * Releases buffer which was provided with @ref JxlDecoderSetJPEGBuffer.
 *
 * Calling @ref JxlDecoderReleaseJPEGBuffer is required whenever
 * a buffer is already set and a new buffer needs to be added with @ref
 * JxlDecoderSetJPEGBuffer, but is not required before @ref
 * JxlDecoderDestroy or @ref JxlDecoderReset.
 *
 * Calling @ref JxlDecoderReleaseJPEGBuffer when no buffer is set is
 * not an error and returns 0.
 *
 * @param dec decoder object
 * @return the amount of bytes the decoder has not yet written to of the data
 *     set by @ref JxlDecoderSetJPEGBuffer, or 0 if no buffer is set or @ref
 *     JxlDecoderReleaseJPEGBuffer was already called.
  }
function JxlDecoderReleaseJPEGBuffer(dec:PJxlDecoder):Tsize_t;cdecl;external libjxl;
{*
 * Sets output buffer for box output codestream.
 *
 * The data is owned by the caller and may be used by the decoder until @ref
 * JxlDecoderReleaseBoxBuffer is called or the decoder is destroyed or
 * reset so must be kept alive until then.
 *
 * If for the current box a box buffer was set before and released with @ref
 * JxlDecoderReleaseBoxBuffer, bytes that the decoder has already output
 * should not be included, only the remaining bytes output must be set.
 *
 * The @ref JxlDecoderReleaseBoxBuffer must be used at the next @ref JXL_DEC_BOX
 * event or final @ref JXL_DEC_SUCCESS event to compute the size of the output
 * box bytes.
 *
 * @param dec decoder object
 * @param data pointer to next bytes to write to
 * @param size amount of bytes available starting from data
 * @return @ref JXL_DEC_ERROR if output buffer was already set and @ref
 *     JxlDecoderReleaseBoxBuffer was not called on it, @ref JXL_DEC_SUCCESS
 *     otherwise
  }
function JxlDecoderSetBoxBuffer(dec:PJxlDecoder; data:Puint8_t; size:Tsize_t):TJxlDecoderStatus;cdecl;external libjxl;
{*
 * Releases buffer which was provided with @ref JxlDecoderSetBoxBuffer.
 *
 * Calling @ref JxlDecoderReleaseBoxBuffer is required whenever
 * a buffer is already set and a new buffer needs to be added with @ref
 * JxlDecoderSetBoxBuffer, but is not required before @ref
 * JxlDecoderDestroy or @ref JxlDecoderReset.
 *
 * Calling @ref JxlDecoderReleaseBoxBuffer when no buffer is set is
 * not an error and returns 0.
 *
 * @param dec decoder object
 * @return the amount of bytes the decoder has not yet written to of the data
 *     set by @ref JxlDecoderSetBoxBuffer, or 0 if no buffer is set or @ref
 *     JxlDecoderReleaseBoxBuffer was already called.
  }
function JxlDecoderReleaseBoxBuffer(dec:PJxlDecoder):Tsize_t;cdecl;external libjxl;
{*
 * Configures whether to get boxes in raw mode or in decompressed mode. In raw
 * mode, boxes are output as their bytes appear in the container file, which may
 * be decompressed, or compressed if their type is "brob". In decompressed mode,
 * "brob" boxes are decompressed with Brotli before outputting them. The size of
 * the decompressed stream is not known before the decompression has already
 * finished.
 *
 * The default mode is raw. This setting can only be changed before decoding, or
 * directly after a @ref JXL_DEC_BOX event, and is remembered until the decoder
 * is reset or destroyed.
 *
 * Enabling decompressed mode requires Brotli support from the library.
 *
 * @param dec decoder object
 * @param decompress JXL_TRUE to transparently decompress, JXL_FALSE to get
 *     boxes in raw mode.
 * @return @ref JXL_DEC_ERROR if decompressed mode is set and Brotli is not
 *     available, @ref JXL_DEC_SUCCESS otherwise.
  }
function JxlDecoderSetDecompressBoxes(dec:PJxlDecoder; decompress:TJXL_BOOL):TJxlDecoderStatus;cdecl;external libjxl;
{*
 * Outputs the type of the current box, after a @ref JXL_DEC_BOX event occured,
 * as 4 characters without null termination character. In case of a compressed
 * "brob" box, this will return "brob" if the decompressed argument is
 * JXL_FALSE, or the underlying box type if the decompressed argument is
 * JXL_TRUE.
 *
 * The following box types are currently described in ISO/IEC 18181-2:
 *  - "Exif": a box with EXIF metadata.  Starts with a 4-byte tiff header offset
 *    (big-endian uint32) that indicates the start of the actual EXIF data
 *    (which starts with a tiff header). Usually the offset will be zero and the
 *    EXIF data starts immediately after the offset field. The Exif orientation
 *    should be ignored by applications; the JPEG XL codestream orientation
 *    takes precedence and libjxl will by default apply the correct orientation
 *    automatically (see @ref JxlDecoderSetKeepOrientation).
 *  - "xml ": a box with XML data, in particular XMP metadata.
 *  - "jumb": a JUMBF superbox (JPEG Universal Metadata Box Format, ISO/IEC
 *    19566-5).
 *  - "JXL ": mandatory signature box, must come first, 12 bytes long including
 *    the box header
 *  - "ftyp": a second mandatory signature box, must come second, 20 bytes long
 *    including the box header
 *  - "jxll": a JXL level box. This indicates if the codestream is level 5 or
 *    level 10 compatible. If not present, it is level 5. Level 10 allows more
 *    features such as very high image resolution and bit-depths above 16 bits
 *    per channel. Added automatically by the encoder when
 *    JxlEncoderSetCodestreamLevel is used
 *  - "jxlc": a box with the image codestream, in case the codestream is not
 *    split across multiple boxes. The codestream contains the JPEG XL image
 *    itself, including the basic info such as image dimensions, ICC color
 *    profile, and all the pixel data of all the image frames.
 *  - "jxlp": a codestream box in case it is split across multiple boxes.
 *    The contents are the same as in case of a jxlc box, when concatenated.
 *  - "brob": a Brotli-compressed box, which otherwise represents an existing
 *    type of box such as Exif or "xml ". When @ref JxlDecoderSetDecompressBoxes
 *    is set to JXL_TRUE, these boxes will be transparently decompressed by the
 *    decoder.
 *  - "jxli": frame index box, can list the keyframes in case of a JPEG XL
 *    animation allowing the decoder to jump to individual frames more
 *    efficiently.
 *  - "jbrd": JPEG reconstruction box, contains the information required to
 *    byte-for-byte losslessly recontruct a JPEG-1 image. The JPEG DCT
 *    coefficients (pixel content) themselves as well as the ICC profile are
 *    encoded in the JXL codestream (jxlc or jxlp) itself. EXIF, XMP and JUMBF
 *    metadata is encoded in the corresponding boxes. The jbrd box itself
 *    contains information such as the remaining app markers of the JPEG-1 file
 *    and everything else required to fit the information together into the
 *    exact original JPEG file.
 *
 * Other application-specific boxes can exist. Their typename should not begin
 * with "jxl" or "JXL" or conflict with other existing typenames.
 *
 * The signature, jxl* and jbrd boxes are processed by the decoder and would
 * typically be ignored by applications. The typical way to use this function is
 * to check if an encountered box contains metadata that the application is
 * interested in (e.g. EXIF or XMP metadata), in order to conditionally set a
 * box buffer.
 *
 * @param dec decoder object
 * @param type buffer to copy the type into
 * @param decompressed which box type to get: JXL_FALSE to get the raw box type,
 *     which can be "brob", JXL_TRUE, get the underlying box type.
 * @return @ref JXL_DEC_SUCCESS if the value is available, @ref JXL_DEC_ERROR if
 *     not, for example the JXL file does not use the container format.
  }
function JxlDecoderGetBoxType(dec:PJxlDecoder; _type:TJxlBoxType; decompressed:TJXL_BOOL):TJxlDecoderStatus;cdecl;external libjxl;
{*
 * Returns the size of a box as it appears in the container file, after the @ref
 * JXL_DEC_BOX event. For a non-compressed box, this is the size of the
 * contents, excluding the 4 bytes indicating the box type. For a compressed
 * "brob" box, this is the size of the compressed box contents plus the
 * additional 4 byte indicating the underlying box type, but excluding the 4
 * bytes indicating "brob". This function gives the size of the data that will
 * be written in the output buffer when getting boxes in the default raw
 * compressed mode. When @ref JxlDecoderSetDecompressBoxes is enabled, the
 * return value of function does not change, and the decompressed size is not
 * known before it has already been decompressed and output.
 *
 * @param dec decoder object
 * @param size raw size of the box in bytes
 * @return @ref JXL_DEC_ERROR if no box size is available, @ref JXL_DEC_SUCCESS
 *     otherwise.
  }
function JxlDecoderGetBoxSizeRaw(dec:PJxlDecoder; size:Puint64_t):TJxlDecoderStatus;cdecl;external libjxl;
{*
 * Configures at which progressive steps in frame decoding these @ref
 * JXL_DEC_FRAME_PROGRESSION event occurs. The default value for the level
 * of detail if this function is never called is `kDC`.
 *
 * @param dec decoder object
 * @param detail at which level of detail to trigger @ref
 *     JXL_DEC_FRAME_PROGRESSION
 * @return @ref JXL_DEC_SUCCESS on success, @ref JXL_DEC_ERROR on error, such as
 *     an invalid value for the progressive detail.
  }
function JxlDecoderSetProgressiveDetail(dec:PJxlDecoder; detail:TJxlProgressiveDetail):TJxlDecoderStatus;cdecl;external libjxl;
{*
 * Returns the intended downsampling ratio for the progressive frame produced
 * by @ref JxlDecoderFlushImage after the latest @ref JXL_DEC_FRAME_PROGRESSION
 * event.
 *
 * @param dec decoder object
 * @return The intended downsampling ratio, can be 1, 2, 4 or 8.
  }
function JxlDecoderGetIntendedDownsamplingRatio(dec:PJxlDecoder):Tsize_t;cdecl;external libjxl;
{*
 * Outputs progressive step towards the decoded image so far when only partial
 * input was received. If the flush was successful, the buffer set with @ref
 * JxlDecoderSetImageOutBuffer will contain partial image data.
 *
 * Can be called when @ref JxlDecoderProcessInput returns @ref
 * JXL_DEC_NEED_MORE_INPUT, after the @ref JXL_DEC_FRAME event already occurred
 * and before the @ref JXL_DEC_FULL_IMAGE event occurred for a frame.
 *
 * @param dec decoder object
 * @return @ref JXL_DEC_SUCCESS if image data was flushed to the output buffer,
 *     or @ref JXL_DEC_ERROR when no flush was done, e.g. if not enough image
 *     data was available yet even for flush, or no output buffer was set yet.
 *     This error is not fatal, it only indicates no flushed image is available
 *     right now. Regular decoding can still be performed.
  }
function JxlDecoderFlushImage(dec:PJxlDecoder):TJxlDecoderStatus;cdecl;external libjxl;
{* @ }

// === Konventiert am: 14-8-26 19:29:06 ===


implementation



end.
