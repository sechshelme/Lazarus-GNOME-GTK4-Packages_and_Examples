unit fp_thorvg_capi;

interface

const
  {$IFDEF Linux}
  libthorvg = 'thorvg';
  {$ENDIF}

  {$IFDEF Windows}
  libthorvg = 'libthorvg-1.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  TVG_VERSION_MAJOR = 1;
  TVG_VERSION_MINOR = 0;
  TVG_VERSION_MICRO = 2;

type
  PTvg_Canvas = ^TTvg_Canvas;
  TTvg_Canvas = PTvg_Canvas;
{*
 * @brief A structure representing a graphical element.
 *
 * @warning The TvgPaint objects cannot be shared between Canvases.
  }

  PTvg_Paint = ^TTvg_Paint;
  TTvg_Paint = PTvg_Paint;
{*
 * @brief A structure representing a gradient fill of a Tvg_Paint object.
  }

  PTvg_Gradient = ^TTvg_Gradient;
  TTvg_Gradient = PTvg_Gradient;
{*
 * @brief A structure representing an object that enables to save a Tvg_Paint object into a file.
  }

  PTvg_Saver = ^TTvg_Saver;
  TTvg_Saver = PTvg_Saver;
{*
 * @brief A structure representing an animation controller object.
  }

  PTvg_Animation = ^TTvg_Animation;
  TTvg_Animation = PTvg_Animation;
{*
 * @brief A structure representing an object that enables iterating through a scene's descendents.
  }

  PTvg_Accessor = ^TTvg_Accessor;
  TTvg_Accessor = PTvg_Accessor;
{*
 * @brief Enumeration specifying the result from the APIs.
 *
 * All ThorVG APIs could potentially return one of the values in the list.
 * Please note that some APIs may additionally specify the reasons that trigger their return values.
 *
  }
{/< The value returned in case of a correct request execution. }
{/< The value returned in the event of a problem with the arguments given to the API - e.g. empty paths or null pointers. }
{/< The value returned in case the request cannot be processed - e.g. asking for properties of an object, which does not exist. }
{/< The value returned in case of unsuccessful memory allocation. }
{/< The value returned in the event of bad memory handling - e.g. failing in pointer releasing or casting }
{/< The value returned in case of choosing unsupported engine features(options). }
{/< The value returned in all other cases. }

  PTvg_Result = ^TTvg_Result;
  TTvg_Result =  Longint;
  Const
    TVG_RESULT_SUCCESS = 0;
    TVG_RESULT_INVALID_ARGUMENT = 1;
    TVG_RESULT_INSUFFICIENT_CONDITION = 2;
    TVG_RESULT_FAILED_ALLOCATION = 3;
    TVG_RESULT_MEMORY_CORRUPTION = 4;
    TVG_RESULT_NOT_SUPPORTED = 5;
    TVG_RESULT_UNKNOWN = 255;
;
{*
 * @brief A data structure representing a point in two-dimensional space.
  }
type
  PTvg_Point = ^TTvg_Point;
  TTvg_Point = record
      x : single;
      y : single;
    end;
{*
 * @brief A data structure representing a three-dimensional matrix.
 *
 * The elements e11, e12, e21 and e22 represent the rotation matrix, including the scaling factor.
 * The elements e13 and e23 determine the translation of the object along the x and y-axis, respectively.
 * The elements e31 and e32 are set to 0, e33 is set to 1.
  }

  PTvg_Matrix = ^TTvg_Matrix;
  TTvg_Matrix = record
      e11 : single;
      e12 : single;
      e13 : single;
      e21 : single;
      e22 : single;
      e23 : single;
      e31 : single;
      e32 : single;
      e33 : single;
    end;
{*
 * @brief Enumeration specifying the methods of combining the 8-bit color channels into 32-bit color.
 *
 * @ingroup ThorVGCapi_Canvas
  }
{/< The channels are joined in the order: alpha, blue, green, red. Colors are alpha-premultiplied. }
{/< The channels are joined in the order: alpha, red, green, blue. Colors are alpha-premultiplied. }
{/< The channels are joined in the order: alpha, blue, green, red. Colors are un-alpha-premultiplied. (since 0.13) }
{/< The channels are joined in the order: alpha, red, green, blue. Colors are un-alpha-premultiplied. (since 0.13) }
{/< Unknown channel data. This is reserved for an initial ColorSpace value. (since 1.0) }

  PTvg_Colorspace = ^TTvg_Colorspace;
  TTvg_Colorspace =  Longint;
  Const
    TVG_COLORSPACE_ABGR8888 = 0;
    TVG_COLORSPACE_ARGB8888 = 1;
    TVG_COLORSPACE_ABGR8888S = 2;
    TVG_COLORSPACE_ARGB8888S = 3;
    TVG_COLORSPACE_UNKNOWN = 255;
;
{*
 * @brief Enumeration to specify rendering engine behavior.
 *
 * @note The availability or behavior of @c TVG_ENGINE_OPTION_SMART_RENDER may vary depending on platform or backend support.
 *       It attempts to optimize rendering performance by updating only the regions  of the canvas that have
 *       changed between frames (partial redraw). This can be highly effective in scenarios  where most of the
 *       canvas remains static and only small portions are updated—such as simple animations or GUI interactions.
 *       However, in complex scenes where a large portion of the canvas changes frequently (e.g., full-screen animations
 *       or heavy object movements), the overhead of tracking changes and managing update regions may outweigh the benefits,
 *       resulting in decreased performance compared to the default rendering mode. Thus, it is recommended to benchmark
 *       both modes in your specific use case to determine the optimal setting.
 *
 * @ingroup ThorVGCapi_Initializer
 *
 * @since 1.0
  }
{*< No engine options are enabled. This may be used to explicitly disable all optional behaviors.  }
{*< Uses the default rendering mode.  }
{*< Enables automatic partial (smart) rendering optimizations.  }
type
  PTvg_Engine_Option = ^TTvg_Engine_Option;
  TTvg_Engine_Option =  Longint;
  Const
    TVG_ENGINE_OPTION_NONE = 0;
    TVG_ENGINE_OPTION_DEFAULT = 1 shl 0;
    TVG_ENGINE_OPTION_SMART_RENDER = 1 shl 1;
;
{*
 * @brief Enumeration indicating the method used in the masking of two objects - the target and the source.
 *
 * @ingroup ThorVGCapi_Paint
  }
{/< No Masking is applied. }
{/< Alpha Masking using the masking target's pixels as an alpha value. }
{/< Alpha Masking using the complement to the masking target's pixels as an alpha value. }
{/< Alpha Masking using the grayscale (0.2126R + 0.7152G + 0.0722*B) of the masking target's pixels. @since 0.9 }
{/< Alpha Masking using the grayscale (0.2126R + 0.7152G + 0.0722*B) of the complement to the masking target's pixels. @since 0.11 }
{/< Combines the target and source objects pixels using target alpha. (T * TA) + (S * (255 - TA)) @since 1.0 }
{/< Subtracts the source color from the target color while considering their respective target alpha. (T * TA) - (S * (255 - TA)) @since 1.0 }
{/< Computes the result by taking the minimum value between the target alpha and the source alpha and multiplies it with the target color. (T * min(TA, SA)) @since 1.0 }
{/< Calculates the absolute difference between the target color and the source color multiplied by the complement of the target alpha. abs(T - S * (255 - TA)) @since 1.0 }
{/< Where multiple masks intersect, the highest transparency value is used. @since 1.0 }
{/< Where multiple masks intersect, the lowest transparency value is used. @since 1.0 }
type
  PTvg_Mask_Method = ^TTvg_Mask_Method;
  TTvg_Mask_Method =  Longint;
  Const
    TVG_MASK_METHOD_NONE = 0;
    TVG_MASK_METHOD_ALPHA = 1;
    TVG_MASK_METHOD_INVERSE_ALPHA = 2;
    TVG_MASK_METHOD_LUMA = 3;
    TVG_MASK_METHOD_INVERSE_LUMA = 4;
    TVG_MASK_METHOD_ADD = 5;
    TVG_MASK_METHOD_SUBTRACT = 6;
    TVG_MASK_METHOD_INTERSECT = 7;
    TVG_MASK_METHOD_DIFFERENCE = 8;
    TVG_MASK_METHOD_LIGHTEN = 9;
    TVG_MASK_METHOD_DARKEN = 10;
;
{*
 * @brief Enumeration indicates the method used for blending paint. Please refer to the respective formulas for each method.
 *
 * @ingroup ThorVGCapi_Paint
 *
 * @since 0.15
  }
{/< Perform the alpha blending(default). S if (Sa == 255), otherwise (Sa * S) + (255 - Sa) * D }
{/< Takes the RGB channel values from 0 to 255 of each pixel in the top layer and multiples them with the values for the corresponding pixel from the bottom layer. (S * D) }
{/< The values of the pixels in the two layers are inverted, multiplied, and then inverted again. (S + D) - (S * D) }
{/< Combines Multiply and Screen blend modes. (2 * S * D) if (2 * D < Da), otherwise (Sa * Da) - 2 * (Da - S) * (Sa - D) }
{/< Creates a pixel that retains the smallest components of the top and bottom layer pixels. min(S, D) }
{/< Only has the opposite action of Darken Only. max(S, D) }
{/< Divides the bottom layer by the inverted top layer. D / (255 - S) }
{/< Divides the inverted bottom layer by the top layer, and then inverts the result. 255 - (255 - D) / S }
{/< The same as Overlay but with the color roles reversed. (2 * S * D) if (S < Sa), otherwise (Sa * Da) - 2 * (Da - S) * (Sa - D) }
{/< The same as Overlay but with applying pure black or white does not result in pure black or white. (1 - 2 * S) * (D ^ 2) + (2 * S * D) }
{/< Subtracts the bottom layer from the top layer or the other way around, to always get a non-negative value. (S - D) if (S > D), otherwise (D - S) }
{/< The result is twice the product of the top and bottom layers, subtracted from their sum. s + d - (2 * s * d) }
{/< Combine with HSL(Sh + Ds + Dl) then convert it to RGB. }
{/< Combine with HSL(Dh + Ss + Dl) then convert it to RGB. }
{/< Combine with HSL(Sh + Ss + Dl) then convert it to RGB. }
{/< Combine with HSL(Dh + Ds + Sl) then convert it to RGB. }
{/< Simply adds pixel values of one layer with the other. (S + D) }
{/< Used for intermediate composition. @since 1.0 }
type
  PTvg_Blend_Method = ^TTvg_Blend_Method;
  TTvg_Blend_Method =  Longint;
  Const
    TVG_BLEND_METHOD_NORMAL = 0;
    TVG_BLEND_METHOD_MULTIPLY = 1;
    TVG_BLEND_METHOD_SCREEN = 2;
    TVG_BLEND_METHOD_OVERLAY = 3;
    TVG_BLEND_METHOD_DARKEN = 4;
    TVG_BLEND_METHOD_LIGHTEN = 5;
    TVG_BLEND_METHOD_COLORDODGE = 6;
    TVG_BLEND_METHOD_COLORBURN = 7;
    TVG_BLEND_METHOD_HARDLIGHT = 8;
    TVG_BLEND_METHOD_SOFTLIGHT = 9;
    TVG_BLEND_METHOD_DIFFERENCE = 10;
    TVG_BLEND_METHOD_EXCLUSION = 11;
    TVG_BLEND_METHOD_HUE = 12;
    TVG_BLEND_METHOD_SATURATION = 13;
    TVG_BLEND_METHOD_COLOR = 14;
    TVG_BLEND_METHOD_LUMINOSITY = 15;
    TVG_BLEND_METHOD_ADD = 16;
    TVG_BLEND_METHOD_COMPOSITION = 255;
;
{*
 * @brief Enumeration indicating the ThorVG object type value.
 *
 * ThorVG's drawing objects can return object type values, allowing you to identify the specific type of each object.
 *
 * @ingroup ThorVGCapi_Paint
 *
 * @see tvg_paint_get_type()
 * @see tvg_gradient_get_type()
 *
 * @since 1.0
  }
{/< Undefined type. }
{/< A shape type paint. }
{/< A scene type paint. }
{/< A picture type paint. }
{/< A text type paint. }
{/< A linear gradient type. }
{/< A radial gradient type. }
type
  PTvg_Type = ^TTvg_Type;
  TTvg_Type =  Longint;
  Const
    TVG_TYPE_UNDEF = 0;
    TVG_TYPE_SHAPE = 1;
    TVG_TYPE_SCENE = 2;
    TVG_TYPE_PICTURE = 3;
    TVG_TYPE_TEXT = 4;
    TVG_TYPE_LINEAR_GRAD = 10;
    TVG_TYPE_RADIAL_GRAD = 11;
;
{*
 * @addtogroup ThorVGCapi_Shape
 * \
  }
{*
 * @brief Enumeration specifying the values of the path commands accepted by ThorVG.
  }
type
  PTvg_Path_Command = ^TTvg_Path_Command;
  TTvg_Path_Command = Tuint8_t;
{/< Ends the current sub-path and connects it with its initial point - corresponds to Z command in the svg path commands. }
{/< Sets a new initial point of the sub-path and a new current point - corresponds to M command in the svg path commands. }
{/< Draws a line from the current point to the given point and sets a new value of the current point - corresponds to L command in the svg path commands. }
{/< Draws a cubic Bezier curve from the current point to the given point using two given control points and sets a new value of the current point - corresponds to C command in the svg path commands. }
  Txxxxxx =  Longint;
  Const
    TVG_PATH_COMMAND_CLOSE = 0;
    TVG_PATH_COMMAND_MOVE_TO = 1;
    TVG_PATH_COMMAND_LINE_TO = 2;
    TVG_PATH_COMMAND_CUBIC_TO = 3;

{*
 * @brief Enumeration determining the ending type of a stroke in the open sub-paths.
  }
{/< The stroke ends exactly at each of the two endpoints of a sub-path. For zero length sub-paths no stroke is rendered. }
{/< The stroke is extended in both endpoints of a sub-path by a half circle, with a radius equal to the half of a stroke width. For zero length sub-paths a full circle is rendered. }
{/< The stroke is extended in both endpoints of a sub-path by a rectangle, with the width equal to the stroke width and the length equal to the half of the stroke width. For zero length sub-paths the square is rendered with the size of the stroke width. }
type
  PTvg_Stroke_Cap = ^TTvg_Stroke_Cap;
  TTvg_Stroke_Cap =  Longint;
  Const
    TVG_STROKE_CAP_BUTT = 0;
    TVG_STROKE_CAP_ROUND = 1;
    TVG_STROKE_CAP_SQUARE = 2;
;
{*
 * @brief Enumeration specifying how to fill the area outside the gradient bounds.
  }
{/< The outer corner of the joined path segments is spiked. The spike is created by extension beyond the join point of the outer edges of the stroke until they intersect. In case the extension goes beyond the limit, the join style is converted to the Bevel style. }
{/< The outer corner of the joined path segments is rounded. The circular region is centered at the join point. }
{/< The outer corner of the joined path segments is bevelled at the join point. The triangular region of the corner is enclosed by a straight line between the outer corners of each stroke. }
type
  PTvg_Stroke_Join = ^TTvg_Stroke_Join;
  TTvg_Stroke_Join =  Longint;
  Const
    TVG_STROKE_JOIN_MITER = 0;
    TVG_STROKE_JOIN_ROUND = 1;
    TVG_STROKE_JOIN_BEVEL = 2;
;
{*
 * @brief Enumeration specifying how to fill the area outside the gradient bounds.
  }
{/< The remaining area is filled with the closest stop color. }
{/< The gradient pattern is reflected outside the gradient area until the expected region is filled. }
{/< The gradient pattern is repeated continuously beyond the gradient area until the expected region is filled. }
type
  PTvg_Stroke_Fill = ^TTvg_Stroke_Fill;
  TTvg_Stroke_Fill =  Longint;
  Const
    TVG_STROKE_FILL_PAD = 0;
    TVG_STROKE_FILL_REFLECT = 1;
    TVG_STROKE_FILL_REPEAT = 2;
;
{*
 * @brief Enumeration specifying the algorithm used to establish which parts of the shape are treated as the inside of the shape.
  }
{/< A line from the point to a location outside the shape is drawn. The intersections of the line with the path segment of the shape are counted. Starting from zero, if the path segment of the shape crosses the line clockwise, one is added, otherwise one is subtracted. If the resulting sum is non zero, the point is inside the shape. }
{/< A line from the point to a location outside the shape is drawn and its intersections with the path segments of the shape are counted. If the number of intersections is an odd number, the point is inside the shape. }
type
  PTvg_Fill_Rule = ^TTvg_Fill_Rule;
  TTvg_Fill_Rule =  Longint;
  Const
    TVG_FILL_RULE_NON_ZERO = 0;
    TVG_FILL_RULE_EVEN_ODD = 1;
;
{* \  }{ end addtogroup ThorVGCapi_Shape }
{*
 * @addtogroup ThorVGCapi_Gradient
 * \
  }
{*
 * @brief A data structure storing the information about the color and its relative position inside the gradient bounds.
  }
{*< The relative position of the color.  }
{*< The red color channel value in the range [0 ~ 255].  }
{*< The green color channel value in the range [0 ~ 255].  }
{*< The blue color channel value in the range [0 ~ 255].  }
{*< The alpha channel value in the range [0 ~ 255], where 0 is completely transparent and 255 is opaque.  }
type
  PTvg_Color_Stop = ^TTvg_Color_Stop;
  TTvg_Color_Stop = record
      offset : single;
      r : Tuint8_t;
      g : Tuint8_t;
      b : Tuint8_t;
      a : Tuint8_t;
    end;
{* \  }{ end addtogroup ThorVGCapi_Gradient }
{*
 * @addtogroup ThorVGCapi_Text
 * \
  }
{*
 * @brief A data structure storing the information about the color and its relative position inside the gradient bounds.
  }
{/< Do not wrap text. Text is rendered on a single line and may overflow the bounding area. }
{/< Wrap at the character level. If a word cannot fit, it is broken into individual characters to fit the line. }
{/< Wrap at the word level. Words that do not fit are moved to the next line. }
{/< Smart choose wrapping method: word wrap first, falling back to character wrap if a word does not fit. }
{/< Truncate overflowing text and append an ellipsis ("...") at the end. Typically used for single-line labels. }
{/< Reserved. No Support. }

  PTvg_Text_Wrap = ^TTvg_Text_Wrap;
  TTvg_Text_Wrap =  Longint;
  Const
    TVG_TEXT_WRAP_NONE = 0;
    TVG_TEXT_WRAP_CHARACTER = 1;
    TVG_TEXT_WRAP_WORD = 2;
    TVG_TEXT_WRAP_SMART = 3;
    TVG_TEXT_WRAP_ELLIPSIS = 4;
    TVG_TEXT_WRAP_HYPHENATION = 5;
;
{* \  }{ end addtogroup ThorVGCapi_Text }
{*
 * @addtogroup ThorVGCapi_Picture
 * \
  }
{*
 * @brief Defines the image filtering method used during image scaling or transformation.
 *
 * @note Experimental API
  }
{/< Smooth interpolation using surrounding pixels for higher quality. }
{/< Fast filtering using nearest-neighbor sampling. }
type
  PTvg_Filter_Method = ^TTvg_Filter_Method;
  TTvg_Filter_Method =  Longint;
  Const
    TVG_FILTER_METHOD_BILINEAR = 0;
    TVG_FILTER_METHOD_NEAREST = 1;
;
{*
 * @brief Describes the font metrics of a text object.
 *
 * Provides the basic vertical layout metrics used for text rendering,
 * such as ascent, descent, and line spacing (linegap).
 *
 * @see tvg_text_get_text_metrics()
 * @note Experimental API
  }
{/< Distance from the baseline to the top of the highest glyph (usually positive). }
{/< Distance from the baseline to the bottom of the lowest glyph (usually negative, as in TTF). }
{/< Additional spacing recommended between lines (leading). }
{/< The total vertical advance between lines of text: ascent - descent + linegap (i.e., ascent + |descent| + linegap when descent is negative). }
type
  PTvg_Text_Metrics = ^TTvg_Text_Metrics;
  TTvg_Text_Metrics = record
      ascent : single;
      descent : single;
      linegap : single;
      advance : single;
    end;
{*
 * @brief Describes the layout metrics of a glyph.
 *
 * Provides the basic layout metrics used for positioning an individual glyph,
 * including its advance along the baseline direction, bearing relative to the
 * inline axis origin, and its bounding box in local glyph space.
 *
 * The advance value represents the distance the pen position moves along the
 * baseline (inline direction), regardless of whether the text is laid out
 * horizontally or vertically.
 *
 * The bounding box is defined in the glyph’s local coordinate space and is
 * independent of any layout direction or transformation.
 *
 * @see tvg_text_get_glyph_metrics()
 * @note Experimental API
  }
{/< The advance distance along the baseline (inline) direction. }
{/< The bearing from the origin to the glyph’s visible bound along the inline-start direction. }
{/< The minimum point of the glyph bounding box in local space. }
{/< The maximum point of the glyph bounding box in local space. }

  PTvg_Glyph_Metrics = ^TTvg_Glyph_Metrics;
  TTvg_Glyph_Metrics = record
      advance : single;
      bearing : single;
      min : TTvg_Point;
      max : TTvg_Point;
    end;
{*
 * @brief Callback function type for resolving external assets.
 *
 * This callback is invoked when a Picture requires an external asset
 * (such as an image or font resource). Implementations should load the asset
 * into the given @p paint object.
 *
 * @param[in] paint The target paint object where the resolved asset will be loaded.
 * @param[in] src   The source path, identifier, or URI of the asset to be resolved.
 * @param[in] data  User-provided custom data passed to the callback for context.
 *
 * @return @c true if the asset was successfully resolved and loaded into @p paint, otherwise @c false.
 *
 * @see tvg_picture_set_asset_resolver()
 *
 * @note Experimental API
  }

  TTvg_Picture_Asset_Resolver = function (paint:TTvg_Paint; src:Pchar; data:pointer):Tbool;cdecl;
{* \  }{ end addtogroup ThorVGCapi_Picture }
{*
 * @defgroup ThorVGCapi_Initializer Initializer
 * @brief A module enabling initialization and termination of the TVG engines.
 *
 * \
  }
{********************************************************************** }
{ Engine API                                                            }
{********************************************************************** }
{*
 * @brief Initializes the ThorVG engine.
 *
 * ThorVG requires an active runtime environment to operate.
 * Internally, it utilizes a task scheduler to efficiently parallelize rendering operations.
 * You can specify the number of worker threads using the @p threads parameter.
 * During initialization, ThorVG will spawn the specified number of threads.
 *
 * @param[in] threads The number of worker threads to create. A value of zero indicates that only the main thread will be used.
 *
 * @note The initializer uses internal reference counting to track multiple calls.
 *       The number of threads is fixed on the first call to tvg_engine_init() and cannot be changed in subsequent calls.
 * @see tvg_engine_term()
  }

function tvg_engine_init(threads:dword):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Terminates the ThorVG engine.
 *
 * Cleans up resources and stops any internal threads initialized by tvg_engine_init().
 *
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION Returned if there is nothing to terminate (e.g., tvg_engine_init() was not called).
 *
 * @note The initializer maintains a reference count for safe repeated use. Only the final call to tvg_engine_term() will fully shut down the engine.
 * @see tvg_engine_init()
  }
function tvg_engine_term:TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Retrieves the version of the TVG engine.
 *
 * @param[out] major A major version number.
 * @param[out] minor A minor version number.
 * @param[out] micro A micro version number.
 * @param[out] version The version of the engine in the format major.minor.micro, or a @p nullptr in case of an internal error.
 *
 * @retval TVG_RESULT_SUCCESS.
 *
 * @since 0.15
  }
function tvg_engine_version(major:Puint32_t; minor:Puint32_t; micro:Puint32_t; version:PPchar):TTvg_Result;cdecl;external libthorvg;
{* \  }{ end defgroup ThorVGCapi_Initializer }
{*
 * @defgroup ThorVGCapi_Canvas Canvas
 * @brief A module for managing and drawing graphical elements.
 *
 * A canvas is an entity responsible for drawing the target. It sets up the drawing engine and the buffer, which can be drawn on the screen. It also manages given Paint objects.
 *
 * @note A Canvas behavior depends on the raster engine though the final content of the buffer is expected to be identical.
 * @warning The Paint objects belonging to one Canvas can't be shared among multiple Canvases.
 * \
  }
{*
 * @defgroup ThorVGCapi_SwCanvas SwCanvas
 * @ingroup ThorVGCapi_Canvas
 *
 * @brief A module for rendering the graphical elements using the software engine.
 *
 * \
  }
{********************************************************************** }
{ SwCanvas API                                                          }
{********************************************************************** }
{*
 * @brief Creates a new Software Canvas object with optional rendering engine settings.
 *
 * This method generates a software canvas instance that can be used for drawing vector graphics.
 * It accepts an optional parameter @p op to choose between different rendering engine behaviors.
 *
 * @param[in] op The rendering engine option.
 *
 * @return A new Tvg_Canvas object.
 *
 * @see enum Tvg_Engine_Option
  }
function tvg_swcanvas_create(op:TTvg_Engine_Option):TTvg_Canvas;cdecl;external libthorvg;
{*
 * @brief Sets the buffer used in the rasterization process and defines the used colorspace.
 *
 * For optimisation reasons TVG does not allocate memory for the output buffer on its own.
 * The buffer of a desirable size should be allocated and owned by the caller.
 *
 * @param[in] canvas The Tvg_Canvas object managing the @p buffer.
 * @param[in] buffer A pointer to the allocated memory block of the size @p stride x @p h.
 * @param[in] stride The stride of the raster image - in most cases same value as @p w.
 * @param[in] w The width of the raster image.
 * @param[in] h The height of the raster image.
 * @param[in] cs The colorspace value defining the way the 32-bits colors should be read/written.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENTS An invalid canvas or buffer pointer passed or one of the @p stride, @p w or @p h being zero.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION if the canvas is performing rendering. Please ensure the canvas is synced.
 * @retval TVG_RESULT_NOT_SUPPORTED The software engine is not supported.
 *
 * @warning Do not access @p buffer during tvg_canvas_draw() - tvg_canvas_sync(). It should not be accessed while the engine is writing on it.
 *
 * @see Tvg_Colorspace
  }
function tvg_swcanvas_set_target(canvas:TTvg_Canvas; buffer:Puint32_t; stride:Tuint32_t; w:Tuint32_t; h:Tuint32_t; 
           cs:TTvg_Colorspace):TTvg_Result;cdecl;external libthorvg;
{* \  }{ end defgroup ThorVGCapi_SwCanvas }
{*
 * @defgroup ThorVGCapi_GlCanvas SwCanvas
 * @ingroup ThorVGCapi_Canvas
 *
 * @brief A module for rendering the graphical elements using the opengl engine.
 *
 * \
  }
{********************************************************************** }
{ GlCanvas API                                                          }
{********************************************************************** }
{*
 * @brief Creates a new OpenGL/ES Canvas object with optional rendering engine settings.
 *
 * This method generates a OpenGL/ES canvas instance that can be used for drawing vector graphics.
 * It accepts an optional parameter @p op to choose between different rendering engine behaviors.
 *
 * @param[in] op The rendering engine option.
 *
 * @return A new Tvg_Canvas object.
 *
 * @note Currently, it does not support @c TVG_ENGINE_OPTION_SMART_RENDER. The request will be ignored.
 *
 * @see enum Tvg_Engine_Option
 *
 * @since 1.0
  }
function tvg_glcanvas_create(op:TTvg_Engine_Option):TTvg_Canvas;cdecl;external libthorvg;
{*
 * @brief Sets the drawing target for rasterization.
 *
 * This function specifies the drawing target where the rasterization will occur. It can target
 * a specific framebuffer object (FBO) or the main surface.
 *
 * @param[in] display The platform-specific display handle (EGLDisplay for EGL). Set @c nullptr for other systems.
 * @param[in] surface The platform-specific surface handle (EGLSurface for EGL, HDC for WGL). Set @c nullptr for other systems.
 * @param[in] context The OpenGL context to be used for rendering on this canvas.
 * @param[in] id The GL target ID, usually indicating the FBO ID. A value of @c 0 specifies the main surface.
 * @param[in] w The width (in pixels) of the raster image.
 * @param[in] h The height (in pixels) of the raster image.
 * @param[in] cs Specifies how the pixel values should be interpreted. Currently, it only allows @c TVG_COLORSPACE_ABGR8888S as @c GL_RGBA8.
 *
 * @note If @p display and @p surface are not provided, the ThorVG GL engine assumes that
 *       the appropriate OpenGL context is already current and will not attempt to bind a new one.
 *
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION If the canvas is currently rendering.
 *         Ensure that @ref tvg_canvas_sync() has been called before setting a new target.
 * @retval TVG_RESULT_NOT_SUPPORTED In case the gl engine is not supported.
 *
 * @see tvg_canvas_sync()
 *
 * @since 1.0
  }
function tvg_glcanvas_set_target(canvas:TTvg_Canvas; display:pointer; surface:pointer; context:pointer; id:Tint32_t; 
           w:Tuint32_t; h:Tuint32_t; cs:TTvg_Colorspace):TTvg_Result;cdecl;external libthorvg;
{* \  }{ end defgroup ThorVGCapi_GlCanvas }
{*
 * @defgroup ThorVGCapi_WgCanvas WgCanvas
 * @ingroup ThorVGCapi_Canvas
 *
 * @brief A module for rendering the graphical elements using the webgpu engine.
 *
 * \
  }
{********************************************************************** }
{ WgCanvas API                                                          }
{********************************************************************** }
{*
 * @brief Creates a new WebGPU Canvas object with optional rendering engine settings.
 *
 * This method generates a WebGPU canvas instance that can be used for drawing vector graphics.
 * It accepts an optional parameter @p op to choose between different rendering engine behaviors.
 *
 * @param[in] op The rendering engine option.
 *
 * @return A new Tvg_Canvas object.
 *
 * @note Currently, it does not support @c TVG_ENGINE_OPTION_SMART_RENDER. The request will be ignored.
 *
 * @see enum Tvg_Engine_Option
 *
 * @since 1.0
  }
function tvg_wgcanvas_create(op:TTvg_Engine_Option):TTvg_Canvas;cdecl;external libthorvg;
{*
 * @brief Sets the drawing target for the rasterization.
 *
 * @param[in] device WGPUDevice, a desired handle for the wgpu device. If it is @c nullptr, ThorVG will assign an appropriate device internally.
 * @param[in] instance WGPUInstance, context for all other wgpu objects.
 * @param[in] target Either WGPUSurface or WGPUTexture, serving as handles to a presentable surface or texture.
 * @param[in] w The width of the target.
 * @param[in] h The height of the target.
 * @param[in] cs Specifies how the pixel values should be interpreted. Currently, it only allows @c TVG_COLORSPACE_ABGR8888S as @c WGPUTextureFormat_RGBA8Unorm.
 * @param[in] type @c 0: surface, @c 1: texture are used as pesentable target.
 *
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION if the canvas is performing rendering. Please ensure the canvas is synced.
 * @retval TVG_RESULT_NOT_SUPPORTED In case the wg engine is not supported.
 *
 * @since 1.0
  }
function tvg_wgcanvas_set_target(canvas:TTvg_Canvas; device:pointer; instance:pointer; target:pointer; w:Tuint32_t; 
           h:Tuint32_t; cs:TTvg_Colorspace; _type:longint):TTvg_Result;cdecl;external libthorvg;
{* \  }{ end defgroup ThorVGCapi_WgCanvas }
{********************************************************************** }
{ Common Canvas API                                                     }
{********************************************************************** }
{*
 * @brief Clears the canvas internal data, releases all paints stored by the canvas and destroys the canvas object itself.
 *
 * @param[in] canvas The Tvg_Canvas object to be destroyed.
 *
  }
function tvg_canvas_destroy(canvas:TTvg_Canvas):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Adds a paint object to the canvas for rendering.
 *
 * Adds the specified paint into the canvas root scene. Only paints added to
 * the canvas are considered rendering targets. The canvas retains the paint
 * object until it is explicitly removed via tvg_canvas_remove().
 *
 * @param[in] canvas A handle to the canvas that will manage the paint object.
 * @param[in] paint  A handle to the paint object to be rendered.
 *
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION If the canvas is not in a valid state to accept new paints.
 *
 * @note Ownership of the @p paint object is transferred to the canvas upon
 *       successful addition. To retain ownership, call @ref tvg_paint_ref()
 *       before adding it to the canvas.
 * @note The rendering order of paint objects follows the order in which they are
 *       added to the canvas. If layering is required, ensure paints are added in
 *       the desired order.
 *
 * @see tvg_canvas_insert()
 * @see tvg_canvas_remove()
 *
 * @since 1.0
  }
function tvg_canvas_add(canvas:TTvg_Canvas; paint:TTvg_Paint):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Inserts a paint object into the canvas root scene.
 *
 * Inserts a paint object into the root scene of the specified canvas. If the
 * @p at parameter is provided, the paint object is inserted immediately before
 * the specified paint in the root scene. If @p at is @c nullptr, the paint object
 * is appended to the end of the root scene.
 *
 * @param[in] canvas A handle to the canvas that will manage the paint object.
 *                   This parameter must be a valid canvas handle.
 * @param[in] target A handle to the paint object to be inserted into the root scene.
 *                   This parameter must not be @c nullptr.
 * @param[in] at     A handle to an existing paint object in the root scene before
 *                   which @p target will be inserted. If @c nullptr, @p target is
 *                   appended to the end of the root scene.
 *
 * @note Ownership of the @p target object is transferred to the canvas upon
 *       successful addition. To retain ownership, call @ref tvg_paint_ref()
 *       before adding it to the canvas.
 * @note The rendering order of paint objects follows their order in the root
 *       scene. If layering is required, ensure paints are inserted in the
 *       desired order.
 *
 * @see tvg_canvas_add()
 * @see tvg_canvas_remove()
 *
 * @since 1.0
  }
function tvg_canvas_insert(canvas:TTvg_Canvas; target:TTvg_Paint; at:TTvg_Paint):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Removes a paint object from the root scene.
 *
 * This function removes a specified paint object from the root scene. If no paint
 * object is specified (i.e., the default @c nullptr is used), the function
 * performs to clear all paints from the scene.
 *
 * @param[in] canvas A Tvg_Canvas object to remove the @p paint.
 * @param[in] paint A pointer to the Paint object to be removed from the root scene.
 *                  If @c nullptr, remove all the paints from the root scene.
 *
 * @see tvg_canvas_add()
 * @see tvg_canvas_insert()
 * @since 1.0
  }
function tvg_canvas_remove(canvas:TTvg_Canvas; paint:TTvg_Paint):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Requests the canvas to update modified paint objects in preparation for rendering.
 *
 * This function triggers an internal update for all paint instances that have been modified
 * since the last update. It ensures that the canvas state is ready for accurate rendering.
 *
 * @param[in] canvas The Tvg_Canvas object to be updated.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Canvas pointer.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION The canvas is not properly prepared.
 *         This may occur if the canvas target has not been set or if the update is called during drawing.
 *         Call tvg_canvas_sync() before trying.
 *
 * @note Only paint objects that have been changed will be processed.
 * @note If the canvas is configured with multiple threads, the update may be performed asynchronously.
 *
 * @see tvg_canvas_sync()
  }
function tvg_canvas_update(canvas:TTvg_Canvas):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Requests the canvas to render the Paint objects.
 *
 * @param[in] canvas The Tvg_Canvas object containing elements to be drawn.
 * @param[in] clear If @c true, clears the target buffer to zero before drawing.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Canvas pointer.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION The canvas is not properly prepared.
 *         This may occur if the canvas target has not been set or if the update is called during drawing.
 *         without calling tvg_canvas_sync() in between.
 *
 * @note Clearing the buffer is unnecessary if the canvas will be fully covered
 *       with opaque content. Skipping the clear can improve performance.
 * @note Drawing may be performed asynchronously if the thread count is greater than zero.
 *       To ensure the drawing process is complete, call sync() afterwards.
 * @note If the canvas has not been updated prior to tvg_canvas_draw(), it may implicitly perform tvg_canvas_update()
 *
 * @see tvg_canvas_sync()
 * @see tvg_canvas_update()
  }
function tvg_canvas_draw(canvas:TTvg_Canvas; clear:Tbool):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Guarantees that drawing task is finished.
 *
 * @param[in] canvas The Tvg_Canvas object containing elements which were drawn.
 *
 * The Canvas rendering can be performed asynchronously. To make sure that rendering is finished,
 * the tvg_canvas_sync() must be called after the tvg_canvas_draw() regardless of threading.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Canvas pointer.
 *
 * @see tvg_canvas_draw()
  }
function tvg_canvas_sync(canvas:TTvg_Canvas):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the drawing region of the canvas.
 *
 * This function defines a rectangular area of the canvas to be used for drawing operations.
 * The specified viewport clips rendering output to the boundaries of that rectangle.
 *
 * Please note that changing the viewport is only allowed at the beginning of the rendering sequence—that is, after calling tvg_canvas_sync().
 *
 * @param[in] canvas The Tvg_Canvas object containing elements which were drawn.
 * @param[in] x The x-coordinate of the upper-left corner of the rectangle.
 * @param[in] y The y-coordinate of the upper-left corner of the rectangle.
 * @param[in] w The width of the rectangle.
 * @param[in] h The height of the rectangle.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Canvas pointer.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION If the canvas is not in a synced state.
 *
 * @see tvg_canvas_sync()
 * @see tvg_swcanvas_set_target()
 * @see tvg_glcanvas_set_target()
 * @see tvg_wgcanvas_set_target()
 *
 * @warning Changing the viewport is not allowed after calling tvg_canvas_add(),
 *          tvg_canvas_remove(), tvg_canvas_update(), or tvg_canvas_draw().
 *
 * @note When the target is reset, the viewport will also be reset to match the target size.
 * @since 0.15
  }
function tvg_canvas_set_viewport(canvas:TTvg_Canvas; x:Tint32_t; y:Tint32_t; w:Tint32_t; h:Tint32_t):TTvg_Result;cdecl;external libthorvg;
{* \  }{ end defgroup ThorVGCapi_Canvas }
{*
 * @defgroup ThorVGCapi_Paint Paint
 * @brief A module for managing graphical elements. It enables duplication, transformation and composition.
 *
 * \
  }
{********************************************************************** }
{ Paint API                                                             }
{********************************************************************** }
{*
 * @brief Safely releases a Tv_Paint object.
 *
 * This is the counterpart to the `new()` API, and releases the given Paint object safely, 
 * handling @c nullptr and managing ownership properly.
 *
 * @param[in] paint A Tvg_Paint object to release.
  }
function tvg_paint_rel(paint:TTvg_Paint):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Increment the reference count for the Tvg_Paint object.
 *
 * This method increases the reference count of Tvg_Paint object, allowing shared ownership and control over its lifetime.
 *
 * @param[in] paint The Tvg_Paint object to increase the reference count.
 *
 * @return The updated reference count after the increment by 1.
 *
 * @warning Please ensure that each call to tvg_paint_ref() is paired with a corresponding call to tvg_paint_unref() to prevent a dangling instance.
 *
 * @see tvg_paint_unref()
 * @see tvg_paint_get_ref()
 *
 * @since 1.0
  }
function tvg_paint_ref(paint:TTvg_Paint):Tuint16_t;cdecl;external libthorvg;
{*
 * @brief Decrement the reference count for the Tvg_Paint object.
 *
 * This method decreases the reference count of the Tvg_Paint object by 1.
 * If the reference count reaches zero and the @p free flag is set to true, the instance is automatically deleted.
 *
 * @param[in] paint The Tvg_Paint object to decrease the reference count.
 * @param[in] free Flag indicating whether to delete the Paint instance when the reference count reaches zero.
 *
 * @return The updated reference count after the decrement.
 *
 * @see tvg_paint_ref()
 * @see tvg_paint_get_ref()
 *
 * @since 1.0
  }
function tvg_paint_unref(paint:TTvg_Paint; free:Tbool):Tuint16_t;cdecl;external libthorvg;
{*
 * @brief Retrieve the current reference count of the Tvg_Paint object.
 *
 * This method provides the current reference count, allowing the user to check the shared ownership state of the Tvg_Paint object.
 *
 * @param[in] paint The Tvg_Paint object to return the reference count.
 *
 * @return The current reference count of the Tvg_Paint object.
 *
 * @see tvg_paint_ref()
 * @see tvg_paint_unref()
 *
 * @since 1.0
  }
function tvg_paint_get_ref(paint:TTvg_Paint):Tuint16_t;cdecl;external libthorvg;
{*
 * @brief Sets the visibility of the Paint object.
 *
 * This is useful for selectively excluding paint objects during rendering.
 *
 * @param[in] paint The Tvg_Paint object to set the visibility status.
 * @param[in] on A boolean flag indicating visibility. The default is @c true.
 *               @c true, the object will be rendered by the engine.
 *               @c false, the object will be excluded from the drawing process.
 *
 * @note An invisible object is not considered inactive—it may still participate
 *       in internal update processing if its properties are updated, but it will not
 *       be taken into account for the final drawing output. To completely deactivate
 *       a paint object, remove it from the canvas.
 *
 * @see tvg_paint_get_visible()
 * @see tvg_canvas_remove()
 *
 * @since 1.0
  }
function tvg_paint_set_visible(paint:TTvg_Paint; visible:Tbool):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the current visibility status of the Paint object.
 *
 * @param[in] paint The Tvg_Paint object to return the visibility status.
 *
 * @return true if the object is visible and will be rendered.
 *         false if the object is hidden and will not be rendered.
 *
 * @see tvg_paint_set_visible()
 *
 * @since 1.0
  }
function tvg_paint_get_visible(paint:TTvg_Paint):Tbool;cdecl;external libthorvg;
{*
 * @brief Gets the ID of the Paint object.
 *
 * @param[in] paint The paint object whose ID will be returned.
 *
 * @return The ID of the paint object, or 0 if the ID is not set.
 *
 * @see tvg_picture_get_paint()
 * @see tvg_accessor_generate_id()
 * @see tvg_paint_set_id()
 *
 * @note Experimental API
  }
function tvg_paint_get_id(paint:TTvg_Paint):Tuint32_t;cdecl;external libthorvg;
{*
 * @brief Sets the ID of the Paint object.
 *
 * The ID is used to specify a paint instance in a scene.
 *
 * @param[in] paint The paint object whose ID will be set.
 * @param[in] id The ID to assign to the paint object.
 *
 * @see tvg_picture_get_paint()
 * @see tvg_accessor_generate_id()
 * @see tvg_paint_get_id()
 *
 * @note Experimental API
  }
function tvg_paint_set_id(paint:TTvg_Paint; id:Tuint32_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Scales the given Tvg_Paint object by the given factor.
 *
 * @param[in] paint The Tvg_Paint object to be scaled.
 * @param[in] factor The value of the scaling factor. The default value is 1.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION in case a custom transform is applied.
 *
 * @see tvg_paint_set_transform()
  }
function tvg_paint_scale(paint:TTvg_Paint; factor:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Rotates the given Tvg_Paint by the given angle.
 *
 * The angle in measured clockwise from the horizontal axis.
 * The rotational axis passes through the point on the object with zero coordinates.
 *
 * @param[in] paint The Tvg_Paint object to be rotated.
 * @param[in] degree The value of the rotation angle in degrees.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION in case a custom transform is applied.
 *
 * @see tvg_paint_set_transform()
  }
function tvg_paint_rotate(paint:TTvg_Paint; degree:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Moves the given Tvg_Paint in a two-dimensional space.
 *
 * The origin of the coordinate system is in the upper-left corner of the canvas.
 * The horizontal and vertical axes point to the right and down, respectively.
 *
 * @param[in] paint The Tvg_Paint object to be shifted.
 * @param[in] x The value of the horizontal shift.
 * @param[in] y The value of the vertical shift.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION in case a custom transform is applied.
 *
 * @see tvg_paint_set_transform()
  }
function tvg_paint_translate(paint:TTvg_Paint; x:single; y:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Transforms the given Tvg_Paint using the augmented transformation matrix.
 *
 * The augmented matrix of the transformation is expected to be given.
 *
 * @param[in] paint The Tvg_Paint object to be transformed.
 * @param[in] m The 3x3 augmented matrix.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr is passed as the argument.
  }
function tvg_paint_set_transform(paint:TTvg_Paint; m:PTvg_Matrix):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the matrix of the affine transformation of the given Tvg_Paint object.
 *
 * In case no transformation was applied, the identity matrix is returned.
 *
 * @param[in] paint The Tvg_Paint object of which to get the transformation matrix.
 * @param[out] m The 3x3 augmented matrix.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr is passed as the argument.
  }
function tvg_paint_get_transform(paint:TTvg_Paint; m:PTvg_Matrix):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the opacity of the given Tvg_Paint.
 *
 * @param[in] paint The Tvg_Paint object of which the opacity value is to be set.
 * @param[in] opacity The opacity value in the range [0 ~ 255], where 0 is completely transparent and 255 is opaque.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 *
 * @note Setting the opacity with this API may require multiple renderings using a composition. It is recommended to avoid changing the opacity if possible.
  }
function tvg_paint_set_opacity(paint:TTvg_Paint; opacity:Tuint8_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the opacity of the given Tvg_Paint.
 *
 * @param[in] paint The Tvg_Paint object of which to get the opacity value.
 * @param[out] opacity The opacity value in the range [0 ~ 255], where 0 is completely transparent and 255 is opaque.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT In case a @c nullptr is passed as the argument.
  }
function tvg_paint_get_opacity(paint:TTvg_Paint; opacity:Puint8_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Duplicates the given Tvg_Paint object.
 *
 * Creates a new object and sets its all properties as in the original object.
 *
 * @param[in] paint The Tvg_Paint object to be copied.
 *
 * @return A copied Tvg_Paint object if succeed, @c nullptr otherwise.
  }
function tvg_paint_duplicate(paint:TTvg_Paint):TTvg_Paint;cdecl;external libthorvg;
{*
 * @brief Checks whether a given region intersects the filled area of the paint.
 *
 * This function determines whether the specified rectangular region—defined by (`x`, `y`, `w`, `h`)—
 * intersects the geometric fill region of the paint object.
 *
 * This is useful for hit-testing purposes, such as detecting whether a user interaction (e.g., touch or click)
 * occurs within a painted region.
 *
 * The paint must be updated in a Canvas beforehand—typically after the Canvas has been
 * drawn and synchronized.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object to be tested.
 * @param[in] x The x-coordinate of the top-left corner of the test region.
 * @param[in] y The y-coordinate of the top-left corner of the test region.
 * @param[in] w The width of the region to test. Must be greater than 0; defaults to 1.
 * @param[in] h The height of the region to test. Must be greater than 0; defaults to 1.
 *
 * @return @c true if any part of the region intersects the filled area; otherwise, @c false.
 *
 * @note To test a single point, set the region size to w = 1, h = 1.
 * @note For efficiency, an AABB (axis-aligned bounding box) test is performed internally before precise hit detection.
 * @note This test does not take into account the results of blending or masking.
 * @note This test does take into account the the hidden paints as well. @see tvg_paint_set_visible().
 * @since 1.0
  }
function tvg_paint_intersects(paint:TTvg_Paint; x:Tint32_t; y:Tint32_t; w:Tint32_t; h:Tint32_t):Tbool;cdecl;external libthorvg;
{*
 * @brief Retrieves the axis-aligned bounding box (AABB) of the paint object in canvas space.
 *
 * Returns the bounding box of the paint as an axis-aligned bounding box (AABB), with all relevant transformations applied.
 * The returned values @p x, @p y, @p w, @p h, may have invalid if the operation fails. Thus, please check the retval.
 *
 * This bounding box can be used to determine the actual rendered area of the object on the canvas,
 * for purposes such as hit-testing, culling, or layout calculations.
 *
 * @param[in] paint The Tvg_Paint object of which to get the bounds.
 * @param[out] x The x-coordinate of the upper-left corner of the bounding box.
 * @param[out] y The y-coordinate of the upper-left corner of the bounding box.
 * @param[out] w The width of the bounding box.
 * @param[out] h The height of the bounding box.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid @p paint.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION If it failed to compute the bounding box (mostly due to invalid path information).
 *
 * @see tvg_paint_get_obb()
 * @see tvg_canvas_update()
  }
function tvg_paint_get_aabb(paint:TTvg_Paint; x:Psingle; y:Psingle; w:Psingle; h:Psingle):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Retrieves the object-oriented bounding box (OBB) of the paint object in canvas space.
 *
 * This function returns the bounding box of the paint, as an oriented bounding box (OBB) after transformations are applied.
 * The returned values @p pt4 may have invalid if the operation fails. Thus, please check the retval.
 *
 * This bounding box can be used to obtain the transformed bounding region in canvas space
 * by taking the geometry's axis-aligned bounding box (AABB) in the object's local coordinate space
 * and applying the object's transformations.
 *
 * @param[in] paint The Tvg_Paint object of which to get the bounds.
 * @param[out] pt4 An array of four points representing the bounding box. The array size must be 4.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT @p paint or @p pt4 is invalid.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION If it failed to compute the bounding box (mostly due to invalid path information).
 *
 * @see tvg_paint_get_aabb()
 * @see tvg_canvas_update()
 *
 * @since 1.0
  }
function tvg_paint_get_obb(paint:TTvg_Paint; pt4:PTvg_Point):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the masking target object and the masking method.
 *
 * @param[in] paint The source object of the masking.
 * @param[in] target The target object of the masking.
 * @param[in] method The method used to mask the source object with the target.
 *
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION if the target has already belonged to another paint.
 *
  }
function tvg_paint_set_mask_method(paint:TTvg_Paint; target:TTvg_Paint; method:TTvg_Mask_Method):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the masking target object and the masking method.
 *
 * @param[in] paint The source object of the masking.
 * @param[out] target The target object of the masking.
 * @param[out] method The method used to mask the source object with the target.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr is passed as the argument.
  }
function tvg_paint_get_mask_method(paint:TTvg_Paint; target:TTvg_Paint; method:PTvg_Mask_Method):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Clip the drawing region of the paint object.
 *
 * This function restricts the drawing area of the paint object to the specified shape's paths.
 *
 * @param[in] paint The target object of the clipping.
 * @param[in] clipper The shape object as the clipper.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT In case a @c nullptr is passed as the argument.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION if the target has already belonged to another paint.
 * @retval TVG_RESULT_NOT_SUPPORTED If the @p clipper type is not Shape.
 *
 * @see tvg_paint_get_clip()
 *
 * @since 1.0
  }
function tvg_paint_set_clip(paint:TTvg_Paint; clipper:TTvg_Paint):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Get the clipper shape of the paint object.
 *
 * This function returns the clipper that has been previously set to this paint object.
 *
 * @return The shape object used as the clipper, or @c nullptr if no clipper is set.
 *
 * @see tvg_paint_set_clip()
 *
 * @since 1.0
  }
function tvg_paint_get_clip(paint:TTvg_Paint):TTvg_Paint;cdecl;external libthorvg;
{*
 * @brief Retrieves the parent paint object.
 *
 * This function returns a pointer to the parent object if the current paint
 * belongs to one. Otherwise, it returns @c nullptr.
 *
 * @param[in] paint The Tvg_Paint object of which to get the scene.
 *
 * @return A pointer to the parent object if available, otherwise @c nullptr.
 *
 * @see tvg_scene_add()
 * @see tvg_canvas_add()
 *
 * @since 1.0
 }
function tvg_paint_get_parent(paint:TTvg_Paint):TTvg_Paint;cdecl;external libthorvg;
{*
 * @brief Gets the unique value of the paint instance indicating the instance type.
 *
 * @param[in] paint The Tvg_Paint object of which to get the type value.
 * @param[out] type The unique type of the paint instance type.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT In case a @c nullptr is passed as the argument.
 *
 * @since 1.0
  }
function tvg_paint_get_type(paint:TTvg_Paint; _type:PTvg_Type):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the blending method for the paint object.
 *
 * The blending feature allows you to combine colors to create visually appealing effects, including transparency, lighting, shading, and color mixing, among others.
 * its process involves the combination of colors or images from the source paint object with the destination (the lower layer image) using blending operations.
 * The blending operation is determined by the chosen @p BlendMethod, which specifies how the colors or images are combined.
 *
 * @param[in] paint The Tvg_Paint object of which to set the blend method.
 * @param[in] method The blending method to be set.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT In case a @c nullptr is passed as the argument.
 *
 * @since 0.15
  }
function tvg_paint_set_blend_method(paint:TTvg_Paint; method:TTvg_Blend_Method):TTvg_Result;cdecl;external libthorvg;
{* \  }{ end defgroup ThorVGCapi_Paint }
{*
 * @defgroup ThorVGCapi_Shape Shape
 *
 * @brief A module for managing two-dimensional figures and their properties.
 *
 * A shape has three major properties: shape outline, stroking, filling. The outline in the shape is retained as the path.
 * Path can be composed by accumulating primitive commands such as tvg_shape_move_to(), tvg_shape_line_to(), tvg_shape_cubic_to() or complete shape interfaces such as tvg_shape_append_rect(), tvg_shape_append_circle(), etc.
 * Path can consists of sub-paths. One sub-path is determined by a close command.
 *
 * The stroke of a shape is an optional property in case the shape needs to be represented with/without the outline borders.
 * It's efficient since the shape path and the stroking path can be shared with each other. It's also convenient when controlling both in one context.
 *
 * \
  }
{********************************************************************** }
{ Shape API                                                             }
{********************************************************************** }
{*
 * @brief Creates a new Shape object.
 *
 * This function allocates and returns a new Shape instance.
 * To properly destroy the Shape object, use @ref tvg_paint_rel().
 *
 * @return A pointer to the newly created Shape object.
 *
 * @see tvg_paint_rel()
  }
function tvg_shape_new:TTvg_Paint;cdecl;external libthorvg;
{*
 * @brief Resets the shape path properties.
 *
 * The color, the fill and the stroke properties are retained.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 *
 * @note The memory, where the path data is stored, is not deallocated at this stage for caching effect.
  }
function tvg_shape_reset(paint:TTvg_Paint):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the initial point of the sub-path.
 *
 * The value of the current point is set to the given point.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] x The horizontal coordinate of the initial point of the sub-path.
 * @param[in] y The vertical coordinate of the initial point of the sub-path.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
  }
function tvg_shape_move_to(paint:TTvg_Paint; x:single; y:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Adds a new point to the sub-path, which results in drawing a line from the current point to the given end-point.
 *
 * The value of the current point is set to the given end-point.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] x The horizontal coordinate of the end-point of the line.
 * @param[in] y The vertical coordinate of the end-point of the line.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 *
 * @note In case this is the first command in the path, it corresponds to the tvg_shape_move_to() call.
  }
function tvg_shape_line_to(paint:TTvg_Paint; x:single; y:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Adds new points to the sub-path, which results in drawing a cubic Bezier curve.
 *
 * The Bezier curve starts at the current point and ends at the given end-point (@p x, @p y). Two control points (@p cx1, @p cy1) and (@p cx2, @p cy2) are used to determine the shape of the curve.
 * The value of the current point is set to the given end-point.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] cx1 The horizontal coordinate of the 1st control point.
 * @param[in] cy1 The vertical coordinate of the 1st control point.
 * @param[in] cx2 The horizontal coordinate of the 2nd control point.
 * @param[in] cy2 The vertical coordinate of the 2nd control point.
 * @param[in] x The horizontal coordinate of the endpoint of the curve.
 * @param[in] y The vertical coordinate of the endpoint of the curve.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 *
 * @note In case this is the first command in the path, no data from the path are rendered.
  }
function tvg_shape_cubic_to(paint:TTvg_Paint; cx1:single; cy1:single; cx2:single; cy2:single; 
           x:single; y:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Closes the current sub-path by drawing a line from the current point to the initial point of the sub-path.
 *
 * The value of the current point is set to the initial point of the closed sub-path.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 *
 * @note In case the sub-path does not contain any points, this function has no effect.
  }
function tvg_shape_close(paint:TTvg_Paint):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Appends a rectangle to the path.
 *
 * The rectangle with rounded corners can be achieved by setting non-zero values to @p rx and @p ry arguments.
 * The @p rx and @p ry values specify the radii of the ellipse defining the rounding of the corners.
 *
 * The position of the rectangle is specified by the coordinates of its upper-left corner -  @p x and @p y arguments.
 *
 * The rectangle is treated as a new sub-path - it is not connected with the previous sub-path.
 *
 * The value of the current point is set to (@p x + @p rx, @p y) - in case @p rx is greater
 * than @p w/2 the current point is set to (@p x + @p w/2, @p y)
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] x The horizontal coordinate of the upper-left corner of the rectangle.
 * @param[in] y The vertical coordinate of the upper-left corner of the rectangle.
 * @param[in] w The width of the rectangle.
 * @param[in] h The height of the rectangle.
 * @param[in] rx The x-axis radius of the ellipse defining the rounded corners of the rectangle.
 * @param[in] ry The y-axis radius of the ellipse defining the rounded corners of the rectangle.
 * @param[in] cw Specifies the path direction: @c true for clockwise, @c false for counterclockwise.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 *
 * @note For @p rx and @p ry greater than or equal to the half of @p w and the half of @p h, respectively, the shape become an ellipse.
  }
function tvg_shape_append_rect(paint:TTvg_Paint; x:single; y:single; w:single; h:single; 
           rx:single; ry:single; cw:Tbool):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Appends an ellipse to the path.
 *
 * The position of the ellipse is specified by the coordinates of its center - @p cx and @p cy arguments.
 *
 * The ellipse is treated as a new sub-path - it is not connected with the previous sub-path.
 *
 * The value of the current point is set to (@p cx, @p cy - @p ry).
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] cx The horizontal coordinate of the center of the ellipse.
 * @param[in] cy The vertical coordinate of the center of the ellipse.
 * @param[in] rx The x-axis radius of the ellipse.
 * @param[in] ry The y-axis radius of the ellipse.
 * @param[in] cw Specifies the path direction: @c true for clockwise, @c false for counterclockwise.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
  }
function tvg_shape_append_circle(paint:TTvg_Paint; cx:single; cy:single; rx:single; ry:single; 
           cw:Tbool):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Appends a given sub-path to the path.
 *
 * The current point value is set to the last point from the sub-path.
 * For each command from the @p cmds array, an appropriate number of points in @p pts array should be specified.
 * If the number of points in the @p pts array is different than the number required by the @p cmds array, the shape with this sub-path will not be displayed on the screen.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] cmds The array of the commands in the sub-path.
 * @param[in] cmdCnt The length of the @p cmds array.
 * @param[in] pts The array of the two-dimensional points.
 * @param[in] ptsCnt The length of the @p pts array.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr passed as the argument or @p cmdCnt or @p ptsCnt equal to zero.
  }
function tvg_shape_append_path(paint:TTvg_Paint; cmds:PTvg_Path_Command; cmdCnt:Tuint32_t; pts:PTvg_Point; ptsCnt:Tuint32_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Retrieves the current path data of the shape.
 *
 * This function provides access to the shape's path data, including the commands
 * and points that define the path.
 *
 * @param[out] cmds Pointer to the array of commands representing the path.
 *                  Can be @c nullptr if this information is not needed.
 * @param[out] cmdsCnt Pointer to the variable that receives the number of commands in the @p cmds array.
 *                     Can be @c nullptr if this information is not needed.
 * @param[out] pts Pointer to the array of two-dimensional points that define the path.
 *                 Can be @c nullptr if this information is not needed.
 * @param[out] ptsCnt Pointer to the variable that receives the number of points in the @p pts array.
 *                    Can be @c nullptr if this information is not needed.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 *
 * @note If any of the arguments are @c nullptr, that value will be ignored.
  }
function tvg_shape_get_path(paint:TTvg_Paint; cmds:PPTvg_Path_Command; cmdsCnt:Puint32_t; pts:PPTvg_Point; ptsCnt:Puint32_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the stroke width for the path.
 *
 * This function defines the thickness of the stroke applied to all figures
 * in the path object. A stroke is the outline drawn along the edges of the
 * path's geometry.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] width The width of the stroke in pixels. Must be positive value. (The default is 0)
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 *
 * @note A value of @p width 0 disables the stroke.
 *
 * @see tvg_shape_set_stroke_color()
  }
function tvg_shape_set_stroke_width(paint:TTvg_Paint; width:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the shape's stroke width.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[out] width The stroke width.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid pointer passed as an argument.
  }
function tvg_shape_get_stroke_width(paint:TTvg_Paint; width:Psingle):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the shape's stroke color.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] r The red color channel value in the range [0 ~ 255]. The default value is 0.
 * @param[in] g The green color channel value in the range [0 ~ 255]. The default value is 0.
 * @param[in] b The blue color channel value in the range [0 ~ 255]. The default value is 0.
 * @param[in] a The alpha channel value in the range [0 ~ 255], where 0 is completely transparent and 255 is opaque.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 *
 * @note If the stroke width is 0 (default), the stroke will not be visible regardless of the color.
 * @note Either a solid color or a gradient fill is applied, depending on what was set as last.
 *
 * @see tvg_shape_set_stroke_width()
 * @see tvg_shape_set_stroke_gradient()
  }
function tvg_shape_set_stroke_color(paint:TTvg_Paint; r:Tuint8_t; g:Tuint8_t; b:Tuint8_t; a:Tuint8_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the shape's stroke color.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[out] r The red color channel value in the range [0 ~ 255]. The default value is 0.
 * @param[out] g The green color channel value in the range [0 ~ 255]. The default value is 0.
 * @param[out] b The blue color channel value in the range [0 ~ 255]. The default value is 0.
 * @param[out] a The alpha channel value in the range [0 ~ 255], where 0 is completely transparent and 255 is opaque.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION No stroke was set.
  }
function tvg_shape_get_stroke_color(paint:TTvg_Paint; r:Puint8_t; g:Puint8_t; b:Puint8_t; a:Puint8_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the gradient fill of the stroke for all of the figures from the path.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] grad The gradient fill.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 * @retval TVG_RESULT_MEMORY_CORRUPTION An invalid Tvg_Gradient pointer or an error with accessing it.
 *
 * @note Either a solid color or a gradient fill is applied, depending on what was set as last.
 *
 * @see tvg_shape_set_stroke_color()
  }
function tvg_shape_set_stroke_gradient(paint:TTvg_Paint; grad:TTvg_Gradient):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the gradient fill of the shape's stroke.
 *
 * The function does not allocate any memory.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[out] grad The gradient fill.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid pointer passed as an argument.
  }
function tvg_shape_get_stroke_gradient(paint:TTvg_Paint; grad:PTvg_Gradient):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the shape's stroke dash pattern.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] dashPattern An array of alternating dash and gap lengths.
 * @param[in] cnt The size of the @p dashPattern array.
 * @param[in] offset The shift of the starting point within the repeating dash pattern, from which the pattern begins to be applied.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT In case @p dashPattern is @c nullptr and @p cnt > 0 or @p dashPattern is not @c nullptr and @p cnt is zero.
 *
 * @note To reset the stroke dash pattern, pass @c nullptr to @p dashPattern and zero to @p cnt.
 * @note Values of @p dashPattern less than zero are treated as zero.
 * @note If all values in the @p dashPattern are equal to or less than 0, the dash is ignored.
 * @note If the @p dashPattern contains an odd number of elements, the sequence is repeated in the same
 * order to form an even-length pattern, preserving the alternation of dashes and gaps.
 * @since 1.0
  }
function tvg_shape_set_stroke_dash(paint:TTvg_Paint; dashPattern:Psingle; cnt:Tuint32_t; offset:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the dash pattern of the stroke.
 *
 * The function does not allocate any memory.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[out] dashPattern The array of consecutive pair values of the dash length and the gap length.
 * @param[out] cnt The size of the @p dashPattern array.
 * @param[out] offset The shift of the starting point within the repeating dash pattern.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid pointer passed as an argument.
 * @since 1.0
  }
function tvg_shape_get_stroke_dash(paint:TTvg_Paint; dashPattern:PPsingle; cnt:Puint32_t; offset:Psingle):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the cap style used for stroking the path.
 *
 * The cap style specifies the shape to be used at the end of the open stroked sub-paths.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] cap The cap style value. The default value is @c TVG_STROKE_CAP_SQUARE.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
  }
function tvg_shape_set_stroke_cap(paint:TTvg_Paint; cap:TTvg_Stroke_Cap):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the stroke cap style used for stroking the path.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[out] cap The cap style value.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid pointer passed as an argument.
  }
function tvg_shape_get_stroke_cap(paint:TTvg_Paint; cap:PTvg_Stroke_Cap):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the join style for stroked path segments.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] join The join style value. The default value is @c TVG_STROKE_JOIN_BEVEL.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
  }
function tvg_shape_set_stroke_join(paint:TTvg_Paint; join:TTvg_Stroke_Join):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief The function gets the stroke join method
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[out] join The join style value.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid pointer passed as an argument.
  }
function tvg_shape_get_stroke_join(paint:TTvg_Paint; join:PTvg_Stroke_Join):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the stroke miterlimit.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] miterlimit The miterlimit imposes a limit on the extent of the stroke join when the @c TVG_STROKE_JOIN_MITER join style is set. The default value is 4.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer or Unsupported @p miterlimit values (less than zero).
 *
 * @since 0.11
  }
function tvg_shape_set_stroke_miterlimit(paint:TTvg_Paint; miterlimit:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief The function gets the stroke miterlimit.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[out] miterlimit The stroke miterlimit.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid pointer passed as an argument.
 *
 * @since 0.11
  }
function tvg_shape_get_stroke_miterlimit(paint:TTvg_Paint; miterlimit:Psingle):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the trim of the shape along the defined path segment, allowing control over which part of the shape is visible.
 *
 * If the values of the arguments @p begin and @p end exceed the 0-1 range, they are wrapped around in a manner similar to angle wrapping, effectively treating the range as circular.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] begin Specifies the start of the segment to display along the path.
 * @param[in] end Specifies the end of the segment to display along the path.
 * @param[in] simultaneous Determines how to trim multiple paths within a single shape. If set to @c true (default), trimming is applied simultaneously to all paths;
 *                         Otherwise, all paths are treated as a single entity with a combined length equal to the sum of their individual lengths and are trimmed as such.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 *
 * @since 1.0
  }
function tvg_shape_set_trimpath(paint:TTvg_Paint; begin:single; end:single; simultaneous:Tbool):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the shape's solid color.
 *
 * The parts of the shape defined as inner are colored.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] r The red color channel value in the range [0 ~ 255]. The default value is 0.
 * @param[in] g The green color channel value in the range [0 ~ 255]. The default value is 0.
 * @param[in] b The blue color channel value in the range [0 ~ 255]. The default value is 0.
 * @param[in] a The alpha channel value in the range [0 ~ 255], where 0 is completely transparent and 255 is opaque. The default value is 0.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 *
 * @note Either a solid color or a gradient fill is applied, depending on what was set as last.
 * @see tvg_shape_set_fill_rule()
  }
function tvg_shape_set_fill_color(paint:TTvg_Paint; r:Tuint8_t; g:Tuint8_t; b:Tuint8_t; a:Tuint8_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the shape's solid color.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[out] r The red color channel value in the range [0 ~ 255]. The default value is 0.
 * @param[out] g The green color channel value in the range [0 ~ 255]. The default value is 0.
 * @param[out] b The blue color channel value in the range [0 ~ 255]. The default value is 0.
 * @param[out] a The alpha channel value in the range [0 ~ 255], where 0 is completely transparent and 255 is opaque. The default value is 0.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
  }
function tvg_shape_get_fill_color(paint:TTvg_Paint; r:Puint8_t; g:Puint8_t; b:Puint8_t; a:Puint8_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the fill rule for the shape.
 *
 * Specifies how the interior of the shape is determined when its path intersects itself.
 * The default fill rule is @c TVG_FILL_RULE_NON_ZERO.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] rule The fill rule to apply to the shape.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
  }
function tvg_shape_set_fill_rule(paint:TTvg_Paint; rule:TTvg_Fill_Rule):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Retrieves the current fill rule used by the shape.
 *
 * This function returns the fill rule, which determines how the interior 
 * regions of the shape are calculated when it overlaps itself.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[out] rule The current Tvg_Fill_Rule value of the shape.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid pointer passed as an argument.
  }
function tvg_shape_get_fill_rule(paint:TTvg_Paint; rule:PTvg_Fill_Rule):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the rendering order of the stroke and the fill.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] strokeFirst If @c true the stroke is rendered before the fill, otherwise the stroke is rendered as the second one (the default option).
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 *
 * @since 0.10
  }
function tvg_shape_set_paint_order(paint:TTvg_Paint; strokeFirst:Tbool):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the gradient fill for all of the figures from the path.
 *
 * The parts of the shape defined as inner are filled.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[in] grad The gradient fill.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 * @retval TVG_RESULT_MEMORY_CORRUPTION An invalid Tvg_Gradient pointer.
 *
 * @note Either a solid color or a gradient fill is applied, depending on what was set as last.
 * @see tvg_shape_set_fill_rule()
  }
function tvg_shape_set_gradient(paint:TTvg_Paint; grad:TTvg_Gradient):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the gradient fill of the shape.
 *
 * The function does not allocate any data.
 *
 * @param[in] paint A Tvg_Paint pointer to the shape object.
 * @param[out] grad The gradient fill.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid pointer passed as an argument.
  }
function tvg_shape_get_gradient(paint:TTvg_Paint; grad:PTvg_Gradient):TTvg_Result;cdecl;external libthorvg;
{* \  }{ end defgroup ThorVGCapi_Shape }
{*
 * @defgroup ThorVGCapi_Gradient Gradient
 * @brief A module managing the gradient fill of objects.
 *
 * The module enables to set and to get the gradient colors and their arrangement inside the gradient bounds,
 * to specify the gradient bounds and the gradient behavior in case the area defined by the gradient bounds
 * is smaller than the area to be filled.
 *
 * \
  }
{********************************************************************** }
{ Gradient API                                                          }
{********************************************************************** }
{*
 * @brief Creates a new linear gradient object.
 *
 * @return A new linear gradient object.
  }
function tvg_linear_gradient_new:TTvg_Gradient;cdecl;external libthorvg;
{*
 * @brief Creates a new radial gradient object.
 *
 * @return A new radial gradient object.
  }
function tvg_radial_gradient_new:TTvg_Gradient;cdecl;external libthorvg;
{*
 * @brief Sets the linear gradient bounds.
 *
 * The bounds of the linear gradient are defined as a surface constrained by two parallel lines crossing
 * the given points (@p x1, @p y1) and (@p x2, @p y2), respectively. Both lines are perpendicular to the line linking
 * (@p x1, @p y1) and (@p x2, @p y2).
 *
 * @param[in] grad The Tvg_Gradient object of which bounds are to be set.
 * @param[in] x1 The horizontal coordinate of the first point used to determine the gradient bounds.
 * @param[in] y1 The vertical coordinate of the first point used to determine the gradient bounds.
 * @param[in] x2 The horizontal coordinate of the second point used to determine the gradient bounds.
 * @param[in] y2 The vertical coordinate of the second point used to determine the gradient bounds.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Gradient pointer.
 *
 * @note In case the first and the second points are equal, an object is filled with a single color using the last color specified in the tvg_gradient_set_color_stops().
 * @see tvg_gradient_set_color_stops()
  }
function tvg_linear_gradient_set(grad:TTvg_Gradient; x1:single; y1:single; x2:single; y2:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the linear gradient bounds.
 *
 * The bounds of the linear gradient are defined as a surface constrained by two parallel lines crossing
 * the given points (@p x1, @p y1) and (@p x2, @p y2), respectively. Both lines are perpendicular to the line linking
 * (@p x1, @p y1) and (@p x2, @p y2).
 *
 * @param[in] grad The Tvg_Gradient object of which to get the bounds.
 * @param[out] x1 The horizontal coordinate of the first point used to determine the gradient bounds.
 * @param[out] y1 The vertical coordinate of the first point used to determine the gradient bounds.
 * @param[out] x2 The horizontal coordinate of the second point used to determine the gradient bounds.
 * @param[out] y2 The vertical coordinate of the second point used to determine the gradient bounds.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Gradient pointer.
  }
function tvg_linear_gradient_get(grad:TTvg_Gradient; x1:Psingle; y1:Psingle; x2:Psingle; y2:Psingle):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the radial gradient attributes.
 *
 * The radial gradient is defined by the end circle with a center (@p cx, @p cy) and a radius @p r and
 * the start circle with a center/focal point (@p fx, @p fy) and a radius @p fr.
 * The gradient will be rendered such that the gradient stop at an offset of 100% aligns with the edge of the end circle
 * and the stop at an offset of 0% aligns with the edge of the start circle.
 *
 * @param[in] grad The Tvg_Gradient object of which bounds are to be set.
 * @param[in] cx The horizontal coordinate of the center of the end circle.
 * @param[in] cy The vertical coordinate of the center of the end circle.
 * @param[in] r The radius of the end circle.
 * @param[in] fx The horizontal coordinate of the center of the start circle.
 * @param[in] fy The vertical coordinate of the center of the start circle.
 * @param[in] fr The radius of the start circle.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Gradient pointer or the radius @p r or @p fr value is negative.
 *
 * @note In case the radius @p r is zero, an object is filled with a single color using the last color specified in the specified in the tvg_gradient_set_color_stops().
 * @note In case the focal point (@p fx and @p fy) lies outside the end circle, it is projected onto the edge of the end circle.
 * @note If the start circle doesn't fully fit inside the end circle (after possible repositioning), the @p fr is reduced accordingly.
 * @note By manipulating the position and size of the focal point, a wide range of visual effects can be achieved, such as directing
 *       the gradient focus towards a specific edge or enhancing the depth and complexity of shading patterns.
 *       If a focal effect is not desired, simply align the focal point (@p fx and @p fy) with the center of the end circle (@p cx and @p cy)
 *       and set the radius (@p fr) to zero. This will result in a uniform gradient without any focal variations.
 *
 * @see tvg_gradient_set_color_stops()
  }
function tvg_radial_gradient_set(grad:TTvg_Gradient; cx:single; cy:single; r:single; fx:single; 
           fy:single; fr:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief The function gets radial gradient attributes.
 *
 * @param[in] grad The Tvg_Gradient object of which to get the gradient attributes.
 * @param[out] cx The horizontal coordinate of the center of the end circle.
 * @param[out] cy The vertical coordinate of the center of the end circle.
 * @param[out] r The radius of the end circle.
 * @param[out] fx The horizontal coordinate of the center of the start circle.
 * @param[out] fy The vertical coordinate of the center of the start circle.
 * @param[out] fr The radius of the start circle.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Gradient pointer.
 *
 * @see tvg_radial_gradient_set()
  }
function tvg_radial_gradient_get(grad:TTvg_Gradient; cx:Psingle; cy:Psingle; r:Psingle; fx:Psingle; 
           fy:Psingle; fr:Psingle):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the parameters of the colors of the gradient and their position.
 *
 * @param[in] grad The Tvg_Gradient object of which the color information is to be set.
 * @param[in] color_stop An array of Tvg_Color_Stop data structure.
 * @param[in] cnt The size of the @p color_stop array equal to the colors number used in the gradient.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Gradient pointer.
  }
function tvg_gradient_set_color_stops(grad:TTvg_Gradient; color_stop:PTvg_Color_Stop; cnt:Tuint32_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the parameters of the colors of the gradient, their position and number
 *
 * The function does not allocate any memory.
 *
 * @param[in] grad The Tvg_Gradient object of which to get the color information.
 * @param[out] color_stop An array of Tvg_Color_Stop data structure.
 * @param[out] cnt The size of the @p color_stop array equal to the colors number used in the gradient.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr passed as the argument.
  }
function tvg_gradient_get_color_stops(grad:TTvg_Gradient; color_stop:PPTvg_Color_Stop; cnt:Puint32_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the Tvg_Stroke_Fill value, which specifies how to fill the area outside the gradient bounds.
 *
 * @param[in] grad The Tvg_Gradient object.
 * @param[in] spread The FillSpread value.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Gradient pointer.
  }
function tvg_gradient_set_spread(grad:TTvg_Gradient; spread:TTvg_Stroke_Fill):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the FillSpread value of the gradient object.
 *
 * @param[in] grad The Tvg_Gradient object.
 * @param[out] spread The FillSpread value.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr passed as the argument.
  }
function tvg_gradient_get_spread(grad:TTvg_Gradient; spread:PTvg_Stroke_Fill):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the matrix of the affine transformation for the gradient object.
 *
 * The augmented matrix of the transformation is expected to be given.
 *
 * @param[in] grad The Tvg_Gradient object to be transformed.
 * @param[in] m The 3x3 augmented matrix.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr is passed as the argument.
  }
function tvg_gradient_set_transform(grad:TTvg_Gradient; m:PTvg_Matrix):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the matrix of the affine transformation of the gradient object.
 *
 * In case no transformation was applied, the identity matrix is set.
 *
 * @param[in] grad The Tvg_Gradient object of which to get the transformation matrix.
 * @param[out] m The 3x3 augmented matrix.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr is passed as the argument.
  }
function tvg_gradient_get_transform(grad:TTvg_Gradient; m:PTvg_Matrix):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the unique value of the gradient instance indicating the instance type.
 *
 * @param[in] grad The Tvg_Gradient object of which to get the type value.
 * @param[out] type The unique type of the gradient instance type.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT In case a @c nullptr is passed as the argument.
 *
 * @since 1.0
  }
function tvg_gradient_get_type(grad:TTvg_Gradient; _type:PTvg_Type):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Duplicates the given Tvg_Gradient object.
 *
 * Creates a new object and sets its all properties as in the original object.
 *
 * @param[in] grad The Tvg_Gradient object to be copied.
 *
 * @return A copied Tvg_Gradient object if succeed, @c nullptr otherwise.
  }
function tvg_gradient_duplicate(grad:TTvg_Gradient):TTvg_Gradient;cdecl;external libthorvg;
{*
 * @brief Deletes the given gradient object.
 *
 * @param[in] grad The gradient object to be deleted.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Gradient pointer.
  }
function tvg_gradient_del(grad:TTvg_Gradient):TTvg_Result;cdecl;external libthorvg;
{* \  }{ end defgroup ThorVGCapi_Gradient }
{*
 * @defgroup ThorVGCapi_Picture Picture
 *
 * @brief A module enabling to create and to load an image in one of the supported formats: svg, png, jpg, lottie and raw.
 *
 *
 * \
  }
{********************************************************************** }
{ Picture API                                                           }
{********************************************************************** }
{*
 * @brief Creates a new Picture object.
 *
 * This function allocates and returns a new Picture instance.
 * To properly destroy the Picture object, use @ref tvg_paint_rel().
 *
 * @return A pointer to the newly created Picture object.
 *
 * @see tvg_paint_rel()
  }
function tvg_picture_new:TTvg_Paint;cdecl;external libthorvg;
{*
 * @brief Loads a picture data directly from a file.
 *
 * ThorVG efficiently caches the loaded data using the specified @p path as a key.
 * This means that loading the same file again will not result in duplicate operations;
 * instead, ThorVG will reuse the previously loaded picture data.
 *
 * @param[in] picture A Tvg_Paint pointer to the picture object.
 * @param[in] path The absolute path to the image file.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer or an empty @p path.
 * @retval TVG_RESULT_NOT_SUPPORTED A file with an unknown extension.
  }
function tvg_picture_load(picture:TTvg_Paint; path:Pchar):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Loads raw image data in a specific format from a memory block of the given size.
 *
 * ThorVG efficiently caches the loaded data, using the provided @p data address as a key
 * when @p copy is set to @c false. This allows ThorVG to avoid redundant operations
 * by reusing the previously loaded picture data for the same sharable @p data,
 * rather than duplicating the load process.
 *
 * @param[in] picture A Tvg_Paint pointer to the picture object.
 * @param[in] data A pointer to the memory block where the raw image data is stored.
 * @param[in] w The width of the image in pixels.
 * @param[in] h The height of the image in pixels.
 * @param[in] cs Specifies how the 32-bit color values should be interpreted (read/write).
 * @param[in] copy If @c true, the data is copied into the engine's local buffer. If @c false, the data is not copied.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer or no data are provided or the @p w or @p h value is zero or less.
 *
 * @since 0.9
  }
function tvg_picture_load_raw(picture:TTvg_Paint; data:Puint32_t; w:Tuint32_t; h:Tuint32_t; cs:TTvg_Colorspace; 
           copy:Tbool):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Loads a picture data from a memory block of a given size.
 *
 * ThorVG efficiently caches the loaded data using the specified @p data address as a key
 * when the @p copy has @c false. This means that loading the same data again will not result in duplicate operations
 * for the sharable @p data. Instead, ThorVG will reuse the previously loaded picture data.
 *
 * @param[in] picture A Tvg_Paint pointer to the picture object.
 * @param[in] data A pointer to a memory location where the content of the picture file is stored. A null-terminated string is expected for non-binary data if @p copy is @c false
 * @param[in] size The size in bytes of the memory occupied by the @p data.
 * @param[in] mimetype Mimetype or extension of data such as "jpg", "jpeg", "svg", "svg+xml", "lot", "lottie+json", "png", etc. In case an empty string or an unknown type is provided, the loaders will be tried one by one.
 * @param[in] rpath A resource directory path, if the @p data needs to access any external resources.
 * @param[in] copy If @c true the data are copied into the engine local buffer, otherwise they are not.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT In case a @c nullptr is passed as the argument or the @p size is zero or less.
 * @retval TVG_RESULT_NOT_SUPPORTED A file with an unknown extension.
 *
 * @warning: It's the user responsibility to release the @p data memory if the @p copy is @c true.
  }
function tvg_picture_load_data(picture:TTvg_Paint; data:Pchar; size:Tuint32_t; mimetype:Pchar; rpath:Pchar; 
           copy:Tbool):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the asset resolver callback for handling external resources (e.g., images and fonts).
 *
 * This callback is invoked when an external asset reference (such as an image source or file path)
 * is encountered in a Picture object. It allows the user to provide a custom mechanism for loading
 * or substituting assets, such as loading from an external source or a virtual filesystem.
 *
 * @param[in] resolver A user-defined function that handles the resolution of asset paths.
 *                     The function should return @c true if the asset was successfully resolved by the user, or @c false if it was not.
 * @param[in] data A pointer to user-defined data that will be passed to the callback each time it is invoked.
 *                 This can be used to maintain context or access external resources.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr passed as the @p picture argument.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION If the @p picture is already loaded.
 *
 * @note This function must be called before @ref tvg_picture_load()
 *       Setting the resolver after loading will have no effect on asset resolution for that asset.
 * @note If @c false is returned by @p resolver, ThorVG will attempt to resolve the resource using its internal resolution mechanism as a fallback.
 * @note To unset the resolver, pass @c nullptr as the @p resolver parameter.
 * @note Experimental API
 *
 * @see Tvg_Picture_Asset_Resolver
  }
function tvg_picture_set_asset_resolver(picture:TTvg_Paint; resolver:TTvg_Picture_Asset_Resolver; data:pointer):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Resizes the picture content to the given width and height.
 *
 * The picture content is resized while keeping the default size aspect ratio.
 * The scaling factor is established for each of dimensions and the smaller value is applied to both of them.
 *
 * @param[in] picture A Tvg_Paint pointer to the picture object.
 * @param[in] w A new width of the image in pixels.
 * @param[in] h A new height of the image in pixels.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
  }
function tvg_picture_set_size(picture:TTvg_Paint; w:single; h:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the size of the loaded picture.
 *
 * @param[in] picture A Tvg_Paint pointer to the picture object.
 * @param[out] w A width of the image in pixels.
 * @param[out] h A height of the image in pixels.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
  }
function tvg_picture_get_size(picture:TTvg_Paint; w:Psingle; h:Psingle):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the normalized origin point of the Picture object.
 *
 * This method defines the origin point of the Picture using normalized coordinates.
 * Unlike a typical pivot point used only for transformations, this origin affects both
 * the transformation behavior and the actual rendering position of the Picture.
 *
 * The specified origin becomes the reference point for positioning the Picture on the canvas.
 * For example, setting the origin to (0.5f, 0.5f) moves the visual center of the picture
 * to the position specified by Paint::translate().
 *
 * The coordinates are given in a normalized range relative to the picture's bounds:
 * - (0.0f, 0.0f): top-left corner
 * - (0.5f, 0.5f): center
 * - (1.0f, 1.0f): bottom-right corner
 *
 * @param[in] picture A Tvg_Paint pointer to the picture object.
 * @param[in] x The normalized x-coordinate of the origin point (range: 0.0f to 1.0f).
 * @param[in] y The normalized y-coordinate of the origin point (range: 0.0f to 1.0f).
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 *
 * @note This origin directly affects how the Picture is placed on the canvas when using
 *       transformations such as translate(), rotate(), or scale().
 *
 * @see tvg_paint_translate()
 * @see tvg_paint_rotate()
 * @see tvg_paint_scale()
 * @see tvg_paint_set_transform()
 * @see tvg_picture_get_origin()
 *
 * @since 1.0
  }
function tvg_picture_set_origin(picture:TTvg_Paint; x:single; y:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the normalized origin point of the Picture object.
 *
 * This method retrieves the current origin point of the Picture, expressed
 * in normalized coordinates relative to the picture’s bounds.
 *
 * @param[in] picture A Tvg_Paint pointer to the picture object.
 * @param[out] x The normalized x-coordinate of the origin (range: 0.0f to 1.0f).
 * @param[out] y The normalized y-coordinate of the origin (range: 0.0f to 1.0f).
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Paint pointer.
 *
 * @see tvg_picture_set_origin()
 * @since 1.0
  }
function tvg_picture_get_origin(picture:TTvg_Paint; x:Psingle; y:Psingle):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Retrieve a paint object from the Picture scene by its Unique ID.
 *
 * This function searches for a paint object within the Picture scene that matches the provided @p id.
 *
 * @param[in] picture A Tvg_Paint pointer to the picture object.
 * @param[in] id The Unique ID of the paint object.
 *
 * @return A pointer to the paint object that matches the given identifier, or @c nullptr if no matching paint object is found.
 *
 * @see tvg_accessor_generate_id()
 * @since 1.0
  }
function tvg_picture_get_paint(picture:TTvg_Paint; id:Tuint32_t):TTvg_Paint;cdecl;external libthorvg;
{*
 * @brief Sets the image filtering method for rendering this picture.
 *
 * Specifies how the image data should be filtered when it is scaled or transformed
 * during rendering. This affects the visual quality and performance of the output.
 *
 * @param[in] picture A Tvg_Paint pointer to the picture object.
 * @param[in] method The filtering method to apply. Default is @c TVG_FILTER_METHOD_BILINEAR.
 *
 * @see Tvg_Filter_Method
 * @note Experimental API
  }
function tvg_picture_set_filter(picture:TTvg_Paint; method:TTvg_Filter_Method):TTvg_Result;cdecl;external libthorvg;
{* \  }{ end defgroup ThorVGCapi_Picture }
{*
 * @defgroup ThorVGCapi_Scene Scene
 * @brief A module managing the multiple paints as one group paint.
 *
 * As a group, scene can be transformed, translucent, composited with other target paints,
 * its children will be affected by the scene world.
 *
 * \
  }
{********************************************************************** }
{ Scene API                                                             }
{********************************************************************** }
{*
 * @brief Creates a new Scene object.
 *
 * This function allocates and returns a new Scene instance.
 * To properly destroy the Scene object, use @ref tvg_paint_rel().
 *
 * @return A pointer to the newly created Scene object.
 *
 * @see tvg_paint_rel()
  }
function tvg_scene_new:TTvg_Paint;cdecl;external libthorvg;
{*
 * @brief Adds a paint object to the scene.
 *
 * Appends the specified paint object to the given scene. Only paint objects
 * added to the scene are considered rendering targets.
 *
 * @param[in] scene A handle to the scene object.
 *                  This parameter must not be @c nullptr.
 * @param[in] paint A handle to the paint object to be added to the scene.
 *                  This parameter must not be @c nullptr.
 *
 * @note Ownership of the @p paint object is transferred to the canvas upon
 *       successful addition. To retain ownership, call @ref tvg_paint_ref()
 *       before adding it to the scene.
* @note The rendering order of paint objects follows their order in the root
 *       scene. If layering is required, ensure the paints are added in the
 *       desired order.
 *
 * @see tvg_scene_insert()
 * @see tvg_scene_remove()
 *
 * @since 1.0
  }
function tvg_scene_add(scene:TTvg_Paint; paint:TTvg_Paint):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Inserts a paint object into the scene.
 *
 * Inserts the specified paint object into the scene immediately before the
 * given paint object @p at. The @p at parameter must reference an existing
 * paint object already added to the scene.
 *
 * @param[in] scene  A handle to the scene object.
 *                   This parameter must not be @c nullptr.
 * @param[in] target A handle to the paint object to be inserted into the scene.
 *                   This parameter must not be @c nullptr.
 * @param[in] at     A handle to an existing paint object in the scene before
 *                   which @p target will be inserted.
 *                   This parameter must not be @c nullptr.
 *
 * @note Ownership of the @p target object is transferred to the scene upon
 *       successful addition. To retain ownership, call @ref tvg_paint_ref()
 *       before adding it to the scene.
 * @note The rendering order of paint objects follows their order in the root
 *       scene. If layering is required, ensure the paints are added in the
 *       desired order.
 *
 * @see tvg_scene_add()
 * @see tvg_scene_remove()
 *
 * @since 1.0
  }
function tvg_scene_insert(scene:TTvg_Paint; target:TTvg_Paint; at:TTvg_Paint):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Removes a paint object from the scene.
 *
 * This function removes a specified paint object from the scene. If no paint
 * object is specified (i.e., the default @c nullptr is used), the function
 * performs to clear all paints from the scene.
 *
 * @param[in] scene A Tvg_Paint pointer to the scene object.
 * @param[in] paint A pointer to the Paint object to be removed from the scene.
 *                  If @c nullptr, remove all the paints from the scene.
 *
 * @see tvg_scene_add()
 * @since 1.0
  }
function tvg_scene_remove(scene:TTvg_Paint; paint:TTvg_Paint):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Clears all previously applied scene effects.
 *
 * This function clears all effects that have been applied to the scene,
 * restoring it to its original state without any post-processing.
 *
 * @param[in] scene A pointer to the Tvg_Paint scene object.
 *
 * @since 1.0
  }
function tvg_scene_clear_effects(scene:TTvg_Paint):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Adds a Gaussian blur effect to the scene.
 *
 * This function adds a Gaussian blur filter to the scene as a post-processing effect.
 * The blur can be applied in different directions with configurable border handling and quality settings.
 *
 * @param[in] scene A pointer to the Tvg_Paint scene object.
 * @param[in] sigma The blur radius (sigma) value. Must be greater than 0.
 * @param[in] direction Blur direction: 0 = both directions, 1 = horizontal only, 2 = vertical only.
 * @param[in] border Border handling method: 0 = duplicate, 1 = wrap.
 * @param[in] quality Blur quality level [0 - 100].
 *
 * @since 1.0
  }
function tvg_scene_add_effect_gaussian_blur(scene:TTvg_Paint; sigma:Tdouble; direction:longint; border:longint; quality:longint):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Adds a drop shadow effect to the scene.
 *
 * This function adds a drop shadow with a Gaussian blur to the scene. The shadow 
 * can be customized using color, opacity, angle, distance, blur radius (sigma), 
 * and quality parameters.
 *
 * @param[in] scene A pointer to the Tvg_Paint scene object.
 * @param[in] r Red channel value of the shadow color [0 - 255].
 * @param[in] g Green channel value of the shadow color [0 - 255].
 * @param[in] b Blue channel value of the shadow color [0 - 255].
 * @param[in] a Alpha (opacity) channel value of the shadow [0 - 255].
 * @param[in] angle Shadow direction in degrees [0 - 360].
 * @param[in] distance Distance of the shadow from the original object.
 * @param[in] sigma Gaussian blur sigma value for the shadow. Must be > 0.
 * @param[in] quality Blur quality level [0 - 100].
 *
 * @since 1.0
  }
function tvg_scene_add_effect_drop_shadow(scene:TTvg_Paint; r:longint; g:longint; b:longint; a:longint; 
           angle:Tdouble; distance:Tdouble; sigma:Tdouble; quality:longint):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Adds a fill color effect to the scene.
 *
 * This function overrides the scene's content colors with the specified fill color.
 *
 * @param[in] scene A pointer to the Tvg_Paint scene object.
 * @param[in] r Red color channel value [0 - 255].
 * @param[in] g Green color channel value [0 - 255].
 * @param[in] b Blue color channel value [0 - 255].
 * @param[in] a Alpha (opacity) channel value [0 - 255].
 *
 * @since 1.0
  }
function tvg_scene_add_effect_fill(scene:TTvg_Paint; r:longint; g:longint; b:longint; a:longint):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Adds a tint effect to the scene.
 *
 * This function tints the current scene using specified black and white color values,
 * modulated by a given intensity.
 *
 * @param[in] scene A pointer to the Tvg_Paint scene object.
 * @param[in] black_r Red component of the black color [0 - 255].
 * @param[in] black_g Green component of the black color [0 - 255].
 * @param[in] black_b Blue component of the black color [0 - 255].
 * @param[in] white_r Red component of the white color [0 - 255].
 * @param[in] white_g Green component of the white color [0 - 255].
 * @param[in] white_b Blue component of the white color [0 - 255].
 * @param[in] intensity Tint intensity value [0 - 100].
 *
 * @since 1.0
  }
function tvg_scene_add_effect_tint(scene:TTvg_Paint; black_r:longint; black_g:longint; black_b:longint; white_r:longint; 
           white_g:longint; white_b:longint; intensity:Tdouble):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Adds a tritone color effect to the scene.
 *
 * This function adds a tritone color effect to the given scene using three sets of RGB values 
 * representing shadow, midtone, and highlight colors.
 *
 * @param[in] scene A pointer to the Tvg_Paint scene object.
 * @param[in] shadow_r Red component of the shadow color [0 - 255].
 * @param[in] shadow_g Green component of the shadow color [0 - 255].
 * @param[in] shadow_b Blue component of the shadow color [0 - 255].
 * @param[in] midtone_r Red component of the midtone color [0 - 255].
 * @param[in] midtone_g Green component of the midtone color [0 - 255].
 * @param[in] midtone_b Blue component of the midtone color [0 - 255].
 * @param[in] highlight_r Red component of the highlight color [0 - 255].
 * @param[in] highlight_g Green component of the highlight color [0 - 255].
 * @param[in] highlight_b Blue component of the highlight color [0 - 255].
 * @param[in] blend A blending factor that determines the mix between the original color and the tritone colors [0 - 255].
 *
 * @since 1.0
  }
function tvg_scene_add_effect_tritone(scene:TTvg_Paint; shadow_r:longint; shadow_g:longint; shadow_b:longint; midtone_r:longint; 
           midtone_g:longint; midtone_b:longint; highlight_r:longint; highlight_g:longint; highlight_b:longint; 
           blend:longint):TTvg_Result;cdecl;external libthorvg;
{* \  }{ end defgroup ThorVGCapi_Scene }
{*
 * @defgroup ThorVGCapi_Text Text
 * @brief A class to represent text objects in a graphical context, allowing for rendering and manipulation of unicode text.
 *
 * @since 0.15
 *
 * \
  }
{********************************************************************** }
{ Text API                                                             }
{********************************************************************** }
{*
 * @brief Creates a new Text object.
 *
 * This function allocates and returns a new Text instance.
 * To properly destroy the Text object, use @ref tvg_paint_rel().
 *
 * @return A pointer to the newly created Text object.
 *
 * @see tvg_paint_rel()
 *
 * @since 0.15
  }
function tvg_text_new:TTvg_Paint;cdecl;external libthorvg;
{*
 * @brief Sets the font family for the text.
 *
 * This function specifies the name of the font to be used when rendering text.
 *
 * @param[in] text A Tvg_Paint pointer to the text object.
 * @param[in] name The name of the font. This should match a font available through the canvas backend.
 *                 If set to @c nullptr, ThorVG will attempt to select a fallback font available on the engine.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr passed as the @p paint argument.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION  The specified @p name cannot be found.
 *
 * @note This function only sets the font family name. Use @ref size() to define the font size.
 * @note If the @p name is not specified, ThorVG will select an available fallback font.
 *
 * @see tvg_text_set_size()
 * @see tvg_font_load()
 *
 * @since 1.0
  }
function tvg_text_set_font(text:TTvg_Paint; name:Pchar):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the font size for the text.
 *
 * This function sets the font size used during text rendering.
 * The size is specified in point units, and supports floating-point precision
 * for smooth scaling and animation effects.
 *
 * @param[in] text A Tvg_Paint pointer to the text object.
 * @param[in] size The font size in points. Must be greater than 0.0.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr passed as the @p paint argument.
 * @retval TVG_RESULT_INVALID_ARGUMENT if the @p size is less than or equal to 0.
 *
 * @note Use this function in combination with @ref font() to fully define text appearance.
 * @note Fractional sizes (e.g., 12.5) are supported for sub-pixel rendering and animations.
 *
 * @see tvg_text_set_font()
 *
 * @since 1.0
  }
function tvg_text_set_size(text:TTvg_Paint; size:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Assigns the given unicode text to be rendered.
 *
 * This function sets the unicode text that will be displayed by the rendering system.
 * The text is set according to the specified UTF encoding method, which defaults to UTF-8.
 *
 * @param[in] text A Tvg_Paint pointer to the text object.
 * @param[in] utf8 The multi-byte text encoded with utf8 string to be rendered.
 *
 * @see tvg_text_get_text()
 *
 * @since 1.0
  }
function tvg_text_set_text(text:TTvg_Paint; utf8:Pchar):TTvg_Result;cdecl;external libthorvg;
{*
  * @brief Returns the currently assigned unicode text.
  *
  * This function retrieves the unicode string that is currently set
  * for rendering. The returned text is encoded in UTF-8.
  *
  * @param[in] text A Tvg_Paint pointer to the text object.
  *
  * @return The UTF-8 encoded multi-byte text string.
  *
  * @see tvg_text_set_text()
  *
  * @note Experimental API
   }
function tvg_text_get_text(text:TTvg_Paint):Pchar;cdecl;external libthorvg;
{*
 * @brief Sets text alignment or anchor per axis.
 *
 * If layout width/height is set on an axis, align within the layout box.
 * Otherwise, treat it as an anchor within the text bounds which point of
 * the text box is pinned to the paint position.
 *
 * @param[in] text A Tvg_Paint pointer to the text object.
 * @param[in] x Horizontal alignment/anchor in [0..1]: 0=left/start, 0.5=center, 1=right/end. (Default is 0)
 * @param[in] y Vertical alignment/anchor in [0..1]: 0=top, 0.5=middle, 1=bottom. (Default is 0)
 *
 * @since 1.0
 *
 * @see tvg_text_layout()
  }
function tvg_text_align(text:TTvg_Paint; x:single; y:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the virtual layout box (constraints) for the text.
 *
 * If width/height is set on an axis, that axis is constrained by a virtual layout box and
 * the text may wrap/align inside it. If width/height == 0, the axis is
 * unconstrained and @ref tvg_text_align() acts as an anchor on that axis.
 *
 * @param[in] text A Tvg_Paint pointer to the text object.
 * @param[in] w Layout width in user space. Use 0 for no horizontal constraint. (Default is 0)
 * @param[in] h Layout height in user space. Use 0 for no vertical constraint. (Default is 0)
 *
 * @note This defines constraints only; alignment/anchoring is controlled by @ref align().
 * @since 1.0
 *
 * @see tvg_text_align()
 * @see tvg_text_spacing()
  }
function tvg_text_layout(text:TTvg_Paint; w:single; h:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the text wrapping mode for this text object.
 *
 * This method controls how the text is laid out when it exceeds the available space.
 * The wrapping mode determines whether text is truncated, wrapped by character or word,
 * or adjusted automatically. An ellipsis mode is also available for truncation with "...".
 *
 * @param[in] text A Tvg_Paint pointer to the text object.
 * @param[in] mode The wrapping strategy to apply. Default is @c TVG_TEXT_WRAP_NONE.
 *
 * @see Tvg_Text_Wrap
 * @see tvg_text_line_count()
 * @since 1.0
  }
function tvg_text_wrap_mode(text:TTvg_Paint; mode:TTvg_Text_Wrap):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Returns the number of text lines.
 *
 * This function retrieves the number of lines generated after applying text layout and wrapping.
 * The returned value reflects the current wrapping configuration set by tvg_text_wrap_mode().
 * The line count is also increased by explicit line feed characters ('\n') contained in the text.
 *
 * @param[in] text A Tvg_Paint pointer to the text object.
 *
 * @return The total number of lines.
 *
 * @see tvg_text_wrap_mode()
 * @note Experimental API
  }
function tvg_text_line_count(text:TTvg_Paint):Tuint32_t;cdecl;external libthorvg;
{*
 * @brief Set the spacing scale factors for text layout.
 *
 * This function adjusts the letter spacing (horizontal space between glyphs) and
 * line spacing (vertical space between lines of text) using scale factors.
 *
 * Both values are relative to the font's default metrics:
 * - The letter spacing is applied as a scale factor to the glyph's advance width.
 * - The line spacing is applied as a scale factor to the glyph's advance height.
 *
 * @param[in] text A Tvg_Paint pointer to the text object.
 * @param[in] letter The scale factor for letter spacing.
 *                   Values > 1.0 increase spacing, values < 1.0 decrease it.
 *                   Must be greater than or equal to 0.0. (default: 1.0)
 *
 * @param[in] line The scale factor for line spacing.
 *                 Values > 1.0 increase line spacing, values < 1.0 decrease it.
 *                 Must be greater than or equal to 0.0. (default: 1.0)
 *
 * @since 1.0
  }
function tvg_text_spacing(text:TTvg_Paint; letter:single; line:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Apply an italic (slant) transformation to the text.
 *
 * This function applies a shear transformation to simulate an italic (oblique) style
 * for the current text object. The shear factor determines the degree of slant
 * applied along the X-axis.
 *
 * @param[in] text A Tvg_Paint pointer to the text object.
 * @param[in] shear The shear factor to apply. A value of 0.0 applies no slant, while values around 0.5 result in a strong slant.
 *                  Must be in the range [0.0, 0.5]. Recommended value is 0.18.
 *
 * @note The @p shear factor will be clamped to the valid range if it exceeds the limits.
 * @note This does not require the font itself to be italic.
 *       It visually simulates the effect by applying a transformation matrix.
 *
 * @warning Excessive slanting may cause visual distortion depending on the font and size.
 *
 * @see tvg_text_set_font()
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr passed as the @p paint argument.
 *
 * @since 1.0
  }
function tvg_text_set_italic(text:TTvg_Paint; shear:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets an outline (stroke) around the text object.
 *
 * This function adds an outline to the text with the specified width and RGB color.
 * The outline enhances the visibility of the text by rendering a stroke around its glyphs.
 *
 * @param[in] text A Tvg_Paint pointer to the text object.
 * @param width The width of the outline. Must be positive value. (The default is 0)
 * @param r     Red component of the outline color (0–255).
 * @param g     Green component of the outline color (0–255).
 * @param b     Blue component of the outline color (0–255).
 *
 * @note To disable the outline, set @p width to 0.
 * @see tvg_text_set_fill_color() to set the main text fill color.
 *
 * @since 1.0
  }
function tvg_text_set_outline(text:TTvg_Paint; width:single; r:Tuint8_t; g:Tuint8_t; b:Tuint8_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the text solid color.
 *
 * @param[in] paint A Tvg_Paint pointer to the text object.
 * @param[in] r The red color channel value in the range [0 ~ 255]. The default value is 0.
 * @param[in] g The green color channel value in the range [0 ~ 255]. The default value is 0.
 * @param[in] b The blue color channel value in the range [0 ~ 255]. The default value is 0.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr passed as the @p paint argument.
 *
 * @note Either a solid color or a gradient fill is applied, depending on what was set as last.
 *
 * @see tvg_text_set_font()
 * @see tvg_text_set_outline()
 *
 * @since 0.15
  }
function tvg_text_set_color(text:TTvg_Paint; r:Tuint8_t; g:Tuint8_t; b:Tuint8_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the gradient fill for the text.
 *
 * @param[in] text A Tvg_Paint pointer to the text object.
 * @param[in] grad The linear or radial gradient fill
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr passed as the @p paint argument.
 * @retval TVG_RESULT_MEMORY_CORRUPTION An invalid Tvg_Gradient pointer.
 *
 * @note Either a solid color or a gradient fill is applied, depending on what was set as last.
 * @see tvg_text_set_font()
 *
 * @since 0.15
  }
function tvg_text_set_gradient(text:TTvg_Paint; gradient:TTvg_Gradient):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Retrieves the layout metrics of the text object.
 *
 * Fills the provided @ref Tvg_Text_Metrics structure with the font layout values of this text object,
 * such as ascent, descent, linegap, and line advance.
 *
 * The returned values reflect the font size applied to the text object,
 * but do not include any transformations (e.g., scale, rotation, or translation).
 *
 * @param[in] text A Tvg_Paint pointer to the text object.
 * @param[out] metrics A pointer to a @ref Tvg_Text_Metrics structure to be filled with the resulting values.
 *
 * @return TVG_RESULT_INSUFFICIENT_CONDITION if no font or size has been set yet.
 *
 * @see Tvg_Text_Metrics
 * @note Experimental API
  }
function tvg_text_get_text_metrics(text:TTvg_Paint; metrics:PTvg_Text_Metrics):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Retrieves the layout metrics of a glyph in the text object.
 *
 * Fills the provided @ref Tvg_Glyph_Metrics structure with the horizontal layout values
 * of the specified glyph, such as advance, left-side bearing, and bounding box.
 *
 * The returned values reflect the font size applied to the text object,
 * but do not include any transformations (e.g., scale, rotation, or translation).
 *
 * The input character must be a single UTF-8 encoded character.
 *
 * @param[in] text A Tvg_Paint pointer to the text object.
 * @param[in] ch A pointer to a UTF-8 encoded character.
 * @param[out] metrics A pointer to a @ref Tvg_Glyph_Metrics structure to be filled with the resulting values.
 *
 * @return TVG_RESULT_INSUFFICIENT_CONDITION if no font or size has been set yet.
 * @return TVG_RESULT_INVALID_ARGUMENT if the given character is invalid or not supported.
 *
 * @see Tvg_Glyph_Metrics
 * @note Currently, ThorVG only supports horizontal text layout.
 * @note Experimental API
  }
function tvg_text_get_glyph_metrics(text:TTvg_Paint; ch:Pchar; metrics:PTvg_Glyph_Metrics):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Loads a scalable font data from a file.
 *
 * ThorVG efficiently caches the loaded data using the specified @p path as a key.
 * This means that loading the same file again will not result in duplicate operations;
 * instead, ThorVG will reuse the previously loaded font data.
 *
 * @param[in] path The path to the font file.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid @p path passed as an argument.
 * @retval TVG_RESULT_NOT_SUPPORTED When trying to load a file with an unknown extension.
 *
 * @see tvg_font_unload()
 *
 * @since 0.15
  }
function tvg_font_load(path:Pchar):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Loads a scalable font data from a memory block of a given size.
 *
 * ThorVG efficiently caches the loaded font data using the specified @p name as a key.
 * This means that loading the same fonts again will not result in duplicate operations.
 * Instead, ThorVG will reuse the previously loaded font data.
 *
 * @param[in] name The name under which the font will be stored and accessible (e.x. in a @p tvg_text_set_font API).
 * @param[in] data A pointer to a memory location where the content of the font data is stored.
 * @param[in] size The size in bytes of the memory occupied by the @p data.
 * @param[in] mimetype Mimetype or extension of font data. In case a @c nullptr or an empty "" value is provided the loader will be determined automatically.
 * @param[in] copy If @c true the data are copied into the engine local buffer, otherwise they are not (default).
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT If no name is provided or if @p size is zero while @p data points to a valid memory location.
 * @retval TVG_RESULT_NOT_SUPPORTED When trying to load a file with an unknown extension.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION When trying to unload the font data that has not been previously loaded.
 *
 * @warning: It's the user responsibility to release the @p data memory.
 *
 * @note To unload the font data loaded using this API, pass the proper @p name and @c nullptr as @p data.
 *
 * @since 0.15
  }
function tvg_font_load_data(name:Pchar; data:Pchar; size:Tuint32_t; mimetype:Pchar; copy:Tbool):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Unloads the specified scalable font data that was previously loaded.
 *
 * This function is used to release resources associated with a font file that has been loaded into memory.
 *
 * @param[in] path The path to the loaded font file.
 *
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION The loader is not initialized.
 *
 * @note If the font data is currently in use, it will not be immediately unloaded.
 * @see tvg_font_load()
 *
 * @since 0.15
  }
function tvg_font_unload(path:Pchar):TTvg_Result;cdecl;external libthorvg;
{* \  }{ end defgroup ThorVGCapi_Text }
{*
 * @defgroup ThorVGCapi_Saver Saver
 * @brief A module for exporting a paint object into a specified file.
 *
 * The module enables to save the composed scene and/or image from a paint object.
 * Once it's successfully exported to a file, it can be recreated using the Picture module.
 *
 * \
  }
{********************************************************************** }
{ Saver API                                                             }
{********************************************************************** }
{*
 * @brief Creates a new Tvg_Saver object.
 *
 * @return A new Tvg_Saver object.
  }
function tvg_saver_new:TTvg_Saver;cdecl;external libthorvg;
{*
 * @brief Exports the given @p paint data to the given @p path
 *
 * If the saver module supports any compression mechanism, it will optimize the data size.
 * This might affect the encoding/decoding time in some cases. You can turn off the compression
 * if you wish to optimize for speed.
 *
 * @param[in] saver The Tvg_Saver object connected with the saving task.
 * @param[in] paint The paint to be saved with all its associated properties.
 * @param[in] path A path to the file, in which the paint data is to be saved.
 * @param[in] quality The encoded quality level. @c 0 is the minimum, @c 100 is the maximum value(recommended).
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr passed as the argument.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION Currently saving other resources.
 * @retval TVG_RESULT_NOT_SUPPORTED Trying to save a file with an unknown extension or in an unsupported format.
 * @retval TVG_RESULT_UNKNOWN An empty paint is to be saved.
 *
 * @note Saving can be asynchronous if the assigned thread number is greater than zero. To guarantee the saving is done, call tvg_saver_sync() afterwards.
 * @see tvg_saver_sync()
  }
function tvg_saver_save_paint(saver:TTvg_Saver; paint:TTvg_Paint; path:Pchar; quality:Tuint32_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Exports the given @p animation data to the given @p path
 *
 * If the saver module supports any compression mechanism, it will optimize the data size.
 * This might affect the encoding/decoding time in some cases. You can turn off the compression
 * if you wish to optimize for speed.
 *
 * @param[in] saver The Tvg_Saver object connected with the saving task.
 * @param[in] animation The animation to be saved with all its associated properties.
 * @param[in] path A path to the file, in which the animation data is to be saved.
 * @param[in] quality The encoded quality level. @c 0 is the minimum, @c 100 is the maximum value(recommended).
 * @param[in] fps The frames per second for the animation. If @c 0, the default fps is used.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr passed as the argument.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION Currently saving other resources or animation has no frames.
 * @retval TVG_RESULT_NOT_SUPPORTED Trying to save a file with an unknown extension or in an unsupported format.
 * @retval TVG_RESULT_UNKNOWN Unknown if attempting to save an empty paint.
 *
 * @note A higher frames per second (FPS) would result in a larger file size. It is recommended to use the default value.
 * @note Saving can be asynchronous if the assigned thread number is greater than zero. To guarantee the saving is done, call tvg_saver_sync() afterwards.
 *
 * @see tvg_saver_sync()
 *
 * @since 1.0
 }
function tvg_saver_save_animation(saver:TTvg_Saver; animation:TTvg_Animation; path:Pchar; quality:Tuint32_t; fps:Tuint32_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Guarantees that the saving task is finished.
 *
 * The behavior of the Saver module works on a sync/async basis, depending on the threading setting of the Initializer.
 * Thus, if you wish to have a benefit of it, you must call tvg_saver_sync() after the tvg_saver_save_paint() in the proper delayed time.
 * Otherwise, you can call tvg_saver_sync() immediately.
 *
 * @param[in] saver The Tvg_Saver object connected with the saving task.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT A @c nullptr passed as the argument.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION No saving task is running.
 *
 * @note The asynchronous tasking is dependent on the Saver module implementation.
 * @see tvg_saver_save_paint()
  }
function tvg_saver_sync(saver:TTvg_Saver):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Deletes the given Tvg_Saver object.
 *
 * @param[in] saver The Tvg_Saver object to be deleted.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Saver pointer.
  }
function tvg_saver_del(saver:TTvg_Saver):TTvg_Result;cdecl;external libthorvg;
{* \  }{ end defgroup ThorVGCapi_Saver }
{*
 * @defgroup ThorVGCapi_Animation Animation
 * @brief A module for manipulation of animatable images.
 *
 * The module supports the display and control of animation frames.
 *
 * \
  }
{********************************************************************** }
{ Animation API                                                         }
{********************************************************************** }
{*
 * @brief Creates a new Animation object.
 *
 * @return Tvg_Animation A new Tvg_Animation object.
 *
 * @since 0.13
  }
function tvg_animation_new:TTvg_Animation;cdecl;external libthorvg;
{*
 * @brief Specifies the current frame in the animation.
 *
 * @param[in] animation A Tvg_Animation pointer to the animation object.
 * @param[in] no The index of the animation frame to be displayed. The index should be less than the tvg_animation_get_total_frame().
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Animation pointer.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION if the given @p no is the same as the current frame value.
 * @retval TVG_RESULT_NOT_SUPPORTED The picture data does not support animations.
 *
 * @note For efficiency, ThorVG ignores updates to the new frame value if the difference from the current frame value
 *       is less than 0.001. In such cases, it returns @c Result::InsufficientCondition.
 *       Values less than 0.001 may be disregarded and may not be accurately retained by the Animation.
 * @see tvg_animation_get_total_frame()
 *
 * @since 0.13
 }
function tvg_animation_set_frame(animation:TTvg_Animation; no:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Retrieves a picture instance associated with this animation instance.
 *
 * This function provides access to the picture instance that can be used to load animation formats, such as lot.
 * After setting up the picture, it can be added to the designated canvas, enabling control over animation frames
 * with this Animation instance.
 *
 * @param[in] animation A Tvg_Animation pointer to the animation object.
 *
 * @return A picture instance that is tied to this animation.
 *
 * @warning The picture instance is owned by Animation. It should not be deleted manually.
 *
 * @since 0.13
  }
function tvg_animation_get_picture(animation:TTvg_Animation):TTvg_Paint;cdecl;external libthorvg;
{*
 * @brief Retrieves the current frame number of the animation.
 *
 * @param[in] animation A Tvg_Animation pointer to the animation object.
 * @param[in] no The current frame number of the animation, between 0 and totalFrame() - 1.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Animation pointer or @p no
 *
 * @see tvg_animation_get_total_frame()
 * @see tvg_animation_set_frame()
 *
 * @since 0.13
  }
function tvg_animation_get_frame(animation:TTvg_Animation; no:Psingle):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Retrieves the total number of frames in the animation.
 *
 * @param[in] animation A Tvg_Animation pointer to the animation object.
 * @param[in] cnt The total number of frames in the animation.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Animation pointer or @p cnt.
 *
 * @note Frame numbering starts from 0.
 * @note If the Picture is not properly configured, this function will return 0.
 *
 * @since 0.13
  }
function tvg_animation_get_total_frame(animation:TTvg_Animation; cnt:Psingle):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Retrieves the duration of the animation in seconds.
 *
 * @param[in] animation A Tvg_Animation pointer to the animation object.
 * @param[in] duration The duration of the animation in seconds.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Animation pointer or @p duration.
 *
 * @note If the Picture is not properly configured, this function will return 0.
 *
 * @since 0.13
  }
function tvg_animation_get_duration(animation:TTvg_Animation; duration:Psingle):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Specifies the playback segment of the animation.
 *
 * The set segment is designated as the play area of the animation.
 * This is useful for playing a specific segment within the entire animation.
 * After setting, the number of animation frames and the playback time are calculated
 * by mapping the playback segment as the entire range.
 *
 * @param[in] animation The Tvg_Animation pointer to the animation object.
 * @param[in] begin segment begin frame.
 * @param[in] end segment end frame.
 *
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION In case the animation is not loaded.
 * @retval TVG_RESULT_INVALID_ARGUMENT If the @p begin is higher than @p end.
 *
 * @note Animation allows a range from 0.0 to the total frame. @p end should not be higher than @p begin.
 * @note If a marker has been specified, its range will be disregarded.
 *
 * @see tvg_lottie_animation_set_marker()
 * @see tvg_animation_get_total_frame()
 *
 * @since 1.0
  }
function tvg_animation_set_segment(animation:TTvg_Animation; begin:single; end:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the current segment range information.
 *
 * @param[in] animation The Tvg_Animation pointer to the animation object.
 * @param[out] begin segment begin frame.
 * @param[out] end segment end frame.
 *
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION In case the animation is not loaded.
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Animation pointer.
 *
 * @since 1.0
  }
function tvg_animation_get_segment(animation:TTvg_Animation; begin:Psingle; end:Psingle):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Deletes the given Tvg_Animation object.
 *
 * @param[in] animation The Tvg_Animation object to be deleted.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Animation pointer.
 *
 * @since 0.13
  }
function tvg_animation_del(animation:TTvg_Animation):TTvg_Result;cdecl;external libthorvg;
{* \  }{ end defgroup ThorVGCapi_Animation }
{*
 * @defgroup ThorVGCapi_Accesssor Accessor
 * @brief A module for manipulation of the scene tree
 *
 * This module helps to control the scene tree.
 * \
  }
{********************************************************************** }
{ Accessor API                                                          }
{********************************************************************** }
{*
 * @brief Creates a new accessor object.
 *
 * @return A new accessor object.
 *
 * @since 1.0
  }
function tvg_accessor_new:TTvg_Accessor;cdecl;external libthorvg;
{*
 * @brief Deletes the given accessor object.
 *
 * @param[in] accessor The accessor object to be deleted.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Accessor pointer.
 *
 * @since 1.0
  }
function tvg_accessor_del(accessor:TTvg_Accessor):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the paint of the accessor then iterates through its descendents.
 *
 * Iterates through all descendents of the scene passed through the paint argument
 * while calling func on each and passing the data pointer to this function. When
 * func returns false iteration stops and the function returns.
 *
 * @param[in] accessor A Tvg_Accessor pointer to the accessor object.
 * @param[in] paint A Tvg_Paint pointer to the scene object.
 * @param[in] func A function pointer to the function that will be execute for each child.
 * @param[in] data A void pointer to data that will be passed to the func.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Accessor, Tvg_Paint, or function pointer.
 *
 * @since 1.0
  }
function tvg_accessor_set(accessor:TTvg_Accessor; paint:TTvg_Paint; func:function (paint:TTvg_Paint; data:pointer):Tbool; data:pointer):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Generate a unique ID (hash key) from a given name.
 *
 * This function computes a unique identifier value based on the provided string.
 * You can use this to assign a unique ID to the Paint object.
 *
 * @param[in] name The input string to generate the unique identifier from.
 *
 * @return The generated unique identifier value.
 *
 * @since 1.0
  }
function tvg_accessor_generate_id(name:Pchar):Tuint32_t;cdecl;external libthorvg;
{* \  }{ end defgroup ThorVGCapi_Accessor }
{*
 * @defgroup ThorVGCapi_LottieAnimation LottieAnimation
 * @brief A module for manipulation of lottie extension features.
 *
 * The module enables control of advanced Lottie features.
 * \
  }
{********************************************************************** }
{ LottieAnimation Extension API                                         }
{********************************************************************** }
{*
 * @brief Creates a new LottieAnimation object.
 *
 * @return Tvg_Animation A new Tvg_LottieAnimation object.
 *
 * @since 0.15
  }
function tvg_lottie_animation_new:TTvg_Animation;cdecl;external libthorvg;
{*
 * @brief Generates a new slot from the given slot data.
 *
 * @param[in] animation The Tvg_Animation pointer to the Lottie animation object.
 * @param[in] slot The Lottie slot data in JSON format.
 *
 * @return The generated slot ID when successful, 0 otherwise.
 *
 * @since 1.0
  }
function tvg_lottie_animation_gen_slot(animation:TTvg_Animation; slot:Pchar):Tuint32_t;cdecl;external libthorvg;
{*
 * @brief Applies a previously generated slot to the animation.
 *
 * @param[in] animation The Tvg_Animation pointer to the Lottie animation object.
 * @param[in] id The ID of the slot to apply, or 0 to reset all slots.
 *
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION In case the animation is not loaded.
 * @retval TVG_RESULT_INVALID_ARGUMENT When the given @p id is invalid
 * @retval TVG_RESULT_NOT_SUPPORTED The Lottie Animation is not supported.
 *
 * @since 1.0
  }
function tvg_lottie_animation_apply_slot(animation:TTvg_Animation; id:Tuint32_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Deletes a previously generated slot.
 *
 * @param[in] animation The Tvg_Animation pointer to the Lottie animation object.
 * @param[in] id The ID of the slot to delete.
 *
 * @return Tvg_Result enumeration.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION In case the animation is not loaded or the slot ID is invalid.
 * @retval TVG_RESULT_NOT_SUPPORTED The Lottie Animation is not supported.
 *
 * @note This function should be paired with gen.
 * @see tvg_lottie_animation_gen_slot()
 * @since 1.0
  }
function tvg_lottie_animation_del_slot(animation:TTvg_Animation; id:Tuint32_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Specifies a segment by marker.
 *
 * @param[in] animation The Tvg_Animation pointer to the Lottie animation object.
 * @param[in] marker The name of the segment marker.
 *
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION In case the animation is not loaded.
 * @retval TVG_RESULT_INVALID_ARGUMENT When the given @p marker is invalid.
 * @retval TVG_RESULT_NOT_SUPPORTED The Lottie Animation is not supported.
 *
 * @since 1.0
  }
function tvg_lottie_animation_set_marker(animation:TTvg_Animation; marker:Pchar):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the marker count of the animation.
 *
 * @param[in] animation The Tvg_Animation pointer to the Lottie animation object.
 * @param[out] cnt The count value of the markers.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT In case a @c nullptr is passed as the argument.
 *
 * @since 1.0
  }
function tvg_lottie_animation_get_markers_cnt(animation:TTvg_Animation; cnt:Puint32_t):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Gets the marker name by a given index.
 *
 * @param[in] animation The Tvg_Animation pointer to the Lottie animation object.
 * @param[in] idx The index of the animation marker, starts from 0.
 * @param[out] name The name of marker when succeed.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT In case @c nullptr is passed as the argument or @c idx is out of range.
 *
 * @since 1.0
  }
function tvg_lottie_animation_get_marker(animation:TTvg_Animation; idx:Tuint32_t; name:PPchar):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Retrieves marker information by index.
 *
 * @param[in] animation The Lottie animation object.
 * @param[in] idx The zero-based index of the animation marker.
 * @param[out] name Pointer to receive the marker name.
 *                  Pass @c nullptr if the value is not required.
 * @param[out] begin Pointer to receive the marker's starting frame.
 *                   Pass @c nullptr if the value is not required.
 * @param[out] end Pointer to receive the marker's ending frame.
 *                 Pass @c nullptr if the value is not required.
 *
 * @retval TVG_RESULT_INVALID_ARGUMENT if @p idx is out of range.
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION In case the animation is not loaded.
 *
 * @see tvg_lottie_animation_get_markers_cnt()
 * @note Experimental API
  }
function tvg_lottie_animation_get_marker_info(animation:TTvg_Animation; idx:Tuint32_t; name:PPchar; begin:Psingle; end:Psingle):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Interpolates between two frames over a specified duration.
 *
 * This method performs tweening, a process of generating intermediate frame
 * between @p from and @p to based on the given @p progress.
 *
 * @param[in] animation The Tvg_Animation pointer to the Lottie animation object.
 * @param[in] from The start frame number of the interpolation.
 * @param[in] to The end frame number of the interpolation.
 * @param[in] progress The current progress of the interpolation (range: 0.0 to 1.0).
 *
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION In case the animation is not loaded.
 *
 * @since 1.0
  }
function tvg_lottie_animation_tween(animation:TTvg_Animation; from:single; to:single; progress:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Updates the value of an expression variable for a specific layer.
 *
 * @param[in] animation The Tvg_Animation pointer to the Lottie animation object.
 * @param[in] layer The name of the layer containing the variable to be updated.
 * @param[in] ix The property index of the variable within the layer.
 * @param[in] var The name of the variable to be updated.
 * @param[in] val The new value to assign to the variable.
 *
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION If the animation is not loaded.
 * @retval TVG_RESULT_INVALID_ARGUMENT When the given parameter is invalid.
 * @retval TVG_RESULT_NOT_SUPPORTED When neither the layer nor the property is found in the current animation.
 *
 * @note Experimental API
  }
function tvg_lottie_animation_assign(animation:TTvg_Animation; layer:Pchar; ix:Tuint32_t; var:Pchar; val:single):TTvg_Result;cdecl;external libthorvg;
{*
 * @brief Sets the quality level for Lottie effects.
 *
 * This function controls the rendering quality of effects like blur, shadows, etc.
 * Lower values prioritize performance while higher values prioritize quality.
 *
 * @param[in] animation The Tvg_Animation pointer to the Lottie animation object.
 * @param[in] value The quality level (0-100). 0 represents lowest quality/best performance,
 *                  100 represents highest quality/lowest performance, default is 50.
 *
 * @retval TVG_RESULT_INSUFFICIENT_CONDITION If the animation is not loaded.
 * @retval TVG_RESULT_INVALID_ARGUMENT An invalid Tvg_Animation pointer.
 *
 * @note This option is used as a hint; its behavior heavily depends on the render backend.
 *
 * @since 1.0
  }
function tvg_lottie_animation_set_quality(animation:TTvg_Animation; value:Tuint8_t):TTvg_Result;cdecl;external libthorvg;
{* \  }{ end addtogroup ThorVGCapi_LottieAnimation }
{* \  }{ end defgroup ThorVGCapi }
{ C++ end of extern C conditionnal removed }
{$endif}
{_THORVG_CAPI_H_ }

// === Konventiert am: 15-3-26 17:01:32 ===


implementation



end.
