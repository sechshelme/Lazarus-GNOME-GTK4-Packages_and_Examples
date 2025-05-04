
unit sixel;
interface

{
  Automatically converted by H2Pas 1.0.0 from sixel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sixel.h
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
PbuiltinDither  = ^builtinDither;
Pbyte  = ^byte;
Pchar  = ^char;
PcharacterSize  = ^characterSize;
PencodePolicy  = ^encodePolicy;
PformatType  = ^formatType;
PimageFormat  = ^imageFormat;
Plongint  = ^longint;
PloopControl  = ^loopControl;
PmethodForDiffuse  = ^methodForDiffuse;
PmethodForLargest  = ^methodForLargest;
PmethodForRep  = ^methodForRep;
PmethodForResampling  = ^methodForResampling;
PpaletteType  = ^paletteType;
PpixelFormat  = ^pixelFormat;
PqualityMode  = ^qualityMode;
Psixel_allocator  = ^sixel_allocator;
Psixel_allocator_function  = ^sixel_allocator_function;
Psixel_allocator_t  = ^sixel_allocator_t;
Psixel_calloc_t  = ^sixel_calloc_t;
Psixel_decoder  = ^sixel_decoder;
Psixel_decoder_t  = ^sixel_decoder_t;
Psixel_dither  = ^sixel_dither;
Psixel_dither_t  = ^sixel_dither_t;
Psixel_encoder  = ^sixel_encoder;
Psixel_encoder_t  = ^sixel_encoder_t;
Psixel_frame  = ^sixel_frame;
Psixel_frame_t  = ^sixel_frame_t;
Psixel_index_t  = ^sixel_index_t;
Psixel_malloc_t  = ^sixel_malloc_t;
Psixel_output  = ^sixel_output;
Psixel_output_t  = ^sixel_output_t;
Psixel_realloc_t  = ^sixel_realloc_t;
PSIXELSTATUS  = ^SIXELSTATUS;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2021 libsixel developers. See `AUTHORS`.
 * Copyright (c) 2014-2020 Hayaki Saito
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  }
{$include <stddef.h>  /* for size_t */}
{$ifndef LIBSIXEL_SIXEL_H}
{$define LIBSIXEL_SIXEL_H}

const
  LIBSIXEL_VERSION = '1.10.3';  
  PACKAGE_VERSION = LIBSIXEL_VERSION;  
  LIBSIXEL_ABI_VERSION = '@LS_LT_CURRENT@:@LS_LT_REVISION@:@LS_LT_AGE@';  
  LS_LTVERSION = LIBSIXEL_ABI_VERSION;  
  PACKAGE_DESCRIPTION = 'A lightweight, fast C implementation of DEC SIXEL graphics codec';  
type
  Psixel_index_t = ^Tsixel_index_t;
  Tsixel_index_t = byte;
{ limitations  }

const
  SIXEL_OUTPUT_PACKET_SIZE = 16384;  
  SIXEL_PALETTE_MIN = 2;  
  SIXEL_PALETTE_MAX = 256;  
  SIXEL_USE_DEPRECATED_SYMBOLS = 1;  
{ up to 128M  }
  SIXEL_ALLOCATE_BYTES_MAX = (10248*1024)*128;  
  SIXEL_WIDTH_LIMIT = 1000000;  
  SIXEL_HEIGHT_LIMIT = 1000000;  
{ loader settings  }
  SIXEL_DEFALUT_GIF_DELAY = 1;  
{ return value  }
type
  PSIXELSTATUS = ^TSIXELSTATUS;
  TSIXELSTATUS = longint;
{ succeeded  }

const
  SIXEL_OK = $0000;  
{ failed  }
  SIXEL_FALSE = $1000;  
{ runtime error  }
  SIXEL_RUNTIME_ERROR = SIXEL_FALSE or $0100;  
{ logic error  }
  SIXEL_LOGIC_ERROR = SIXEL_FALSE or $0200;  
{ feature not enabled  }
  SIXEL_FEATURE_ERROR = SIXEL_FALSE or $0300;  
{ errors caused by curl  }
  SIXEL_LIBC_ERROR = SIXEL_FALSE or $0400;  
{ errors occures in libc functions  }
  SIXEL_CURL_ERROR = SIXEL_FALSE or $0500;  
{ errors occures in libjpeg functions  }
  SIXEL_JPEG_ERROR = SIXEL_FALSE or $0600;  
{ errors occures in libpng functions  }
  SIXEL_PNG_ERROR = SIXEL_FALSE or $0700;  
{ errors occures in gdk functions  }
  SIXEL_GDK_ERROR = SIXEL_FALSE or $0800;  
{ errors occures in gd functions  }
  SIXEL_GD_ERROR = SIXEL_FALSE or $0900;  
{ errors occures in stb_image functions  }
  SIXEL_STBI_ERROR = SIXEL_FALSE or $0a00;  
{ errors occures in stb_image_write functions  }
  SIXEL_STBIW_ERROR = SIXEL_FALSE or $0b00;  
{ interrupted by a signal  }
  SIXEL_INTERRUPTED = SIXEL_OK or $0001;  
{ malloc() failed  }
  SIXEL_BAD_ALLOCATION = SIXEL_RUNTIME_ERROR or $0001;  
{ bad argument detected  }
  SIXEL_BAD_ARGUMENT = SIXEL_RUNTIME_ERROR or $0002;  
{ bad input detected  }
  SIXEL_BAD_INPUT = SIXEL_RUNTIME_ERROR or $0003;  
{ integer overflow  }
  SIXEL_BAD_INTEGER_OVERFLOW = SIXEL_RUNTIME_ERROR or $0004;  
{ feature not implemented  }
  SIXEL_NOT_IMPLEMENTED = SIXEL_FEATURE_ERROR or $0001;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function SIXEL_SUCCEEDED(status : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SIXEL_FAILED(status : longint) : longint;

{ method for finding the largest dimension for splitting,
 * and sorting by that component  }
{ choose automatically the method for finding the largest
                                    dimension  }
const
  SIXEL_LARGE_AUTO = $0;  
{ simply comparing the range in RGB space  }
  SIXEL_LARGE_NORM = $1;  
{ transforming into luminosities before the comparison  }
  SIXEL_LARGE_LUM = $2;  
{ method for choosing a color from the box  }
{ choose automatically the method for selecting
                                          representative color from each box  }
  SIXEL_REP_AUTO = $0;  
{ choose the center of the box  }
  SIXEL_REP_CENTER_BOX = $1;  
{ choose the average all the color
                                          in the box (specified in Heckbert's paper)  }
  SIXEL_REP_AVERAGE_COLORS = $2;  
{ choose the average all the pixels in the box  }
  SIXEL_REP_AVERAGE_PIXELS = $3;  
{ method for diffusing  }
{ choose diffusion type automatically  }
  SIXEL_DIFFUSE_AUTO = $0;  
{ don't diffuse  }
  SIXEL_DIFFUSE_NONE = $1;  
{ diffuse with Bill Atkinson's method  }
  SIXEL_DIFFUSE_ATKINSON = $2;  
{ diffuse with Floyd-Steinberg method  }
  SIXEL_DIFFUSE_FS = $3;  
{ diffuse with Jarvis, Judice & Ninke method  }
  SIXEL_DIFFUSE_JAJUNI = $4;  
{ diffuse with Stucki's method  }
  SIXEL_DIFFUSE_STUCKI = $5;  
{ diffuse with Burkes' method  }
  SIXEL_DIFFUSE_BURKES = $6;  
{ positionally stable arithmetic dither  }
  SIXEL_DIFFUSE_A_DITHER = $7;  
{ positionally stable arithmetic xor based dither  }
  SIXEL_DIFFUSE_X_DITHER = $8;  
{ quality modes  }
{ choose quality mode automatically  }
  SIXEL_QUALITY_AUTO = $0;  
{ high quality palette construction  }
  SIXEL_QUALITY_HIGH = $1;  
{ low quality palette construction  }
  SIXEL_QUALITY_LOW = $2;  
{ full quality palette construction  }
  SIXEL_QUALITY_FULL = $3;  
{ high color  }
  SIXEL_QUALITY_HIGHCOLOR = $4;  
{ built-in dither  }
{ monochrome terminal with dark background  }
  SIXEL_BUILTIN_MONO_DARK = $0;  
{ monochrome terminal with light background  }
  SIXEL_BUILTIN_MONO_LIGHT = $1;  
{ xterm 16color  }
  SIXEL_BUILTIN_XTERM16 = $2;  
{ xterm 256color  }
  SIXEL_BUILTIN_XTERM256 = $3;  
{ vt340 monochrome  }
  SIXEL_BUILTIN_VT340_MONO = $4;  
{ vt340 color  }
  SIXEL_BUILTIN_VT340_COLOR = $5;  
{ 1bit grayscale  }
  SIXEL_BUILTIN_G1 = $6;  
{ 2bit grayscale  }
  SIXEL_BUILTIN_G2 = $7;  
{ 4bit grayscale  }
  SIXEL_BUILTIN_G4 = $8;  
{ 8bit grayscale  }
  SIXEL_BUILTIN_G8 = $9;  
{ offset value of pixelFormat  }
  SIXEL_FORMATTYPE_COLOR = 0;  
  SIXEL_FORMATTYPE_GRAYSCALE = 1 shl 6;  
  SIXEL_FORMATTYPE_PALETTE = 1 shl 7;  
{ pixelformat type of input image
   NOTE: for compatibility, the value of PIXELFORAMT_COLOR_RGB888 must be 3  }
{ 15bpp  }
  SIXEL_PIXELFORMAT_RGB555 = SIXEL_FORMATTYPE_COLOR or $01;  
{ 16bpp  }
  SIXEL_PIXELFORMAT_RGB565 = SIXEL_FORMATTYPE_COLOR or $02;  
{ 24bpp  }
  SIXEL_PIXELFORMAT_RGB888 = SIXEL_FORMATTYPE_COLOR or $03;  
{ 15bpp  }
  SIXEL_PIXELFORMAT_BGR555 = SIXEL_FORMATTYPE_COLOR or $04;  
{ 16bpp  }
  SIXEL_PIXELFORMAT_BGR565 = SIXEL_FORMATTYPE_COLOR or $05;  
{ 24bpp  }
  SIXEL_PIXELFORMAT_BGR888 = SIXEL_FORMATTYPE_COLOR or $06;  
{ 32bpp  }
  SIXEL_PIXELFORMAT_ARGB8888 = SIXEL_FORMATTYPE_COLOR or $10;  
{ 32bpp  }
  SIXEL_PIXELFORMAT_RGBA8888 = SIXEL_FORMATTYPE_COLOR or $11;  
{ 32bpp  }
  SIXEL_PIXELFORMAT_ABGR8888 = SIXEL_FORMATTYPE_COLOR or $12;  
{ 32bpp  }
  SIXEL_PIXELFORMAT_BGRA8888 = SIXEL_FORMATTYPE_COLOR or $13;  
{ 1bpp grayscale  }
  SIXEL_PIXELFORMAT_G1 = SIXEL_FORMATTYPE_GRAYSCALE or $00;  
{ 2bpp grayscale  }
  SIXEL_PIXELFORMAT_G2 = SIXEL_FORMATTYPE_GRAYSCALE or $01;  
{ 4bpp grayscale  }
  SIXEL_PIXELFORMAT_G4 = SIXEL_FORMATTYPE_GRAYSCALE or $02;  
{ 8bpp grayscale  }
  SIXEL_PIXELFORMAT_G8 = SIXEL_FORMATTYPE_GRAYSCALE or $03;  
{ 16bpp gray+alpha  }
  SIXEL_PIXELFORMAT_AG88 = SIXEL_FORMATTYPE_GRAYSCALE or $13;  
{ 16bpp gray+alpha  }
  SIXEL_PIXELFORMAT_GA88 = SIXEL_FORMATTYPE_GRAYSCALE or $23;  
{ 1bpp palette  }
  SIXEL_PIXELFORMAT_PAL1 = SIXEL_FORMATTYPE_PALETTE or $00;  
{ 2bpp palette  }
  SIXEL_PIXELFORMAT_PAL2 = SIXEL_FORMATTYPE_PALETTE or $01;  
{ 4bpp palette  }
  SIXEL_PIXELFORMAT_PAL4 = SIXEL_FORMATTYPE_PALETTE or $02;  
{ 8bpp palette  }
  SIXEL_PIXELFORMAT_PAL8 = SIXEL_FORMATTYPE_PALETTE or $03;  
{ palette type  }
{ choose palette type automatically  }
  SIXEL_PALETTETYPE_AUTO = 0;  
{ HLS colorspace  }
  SIXEL_PALETTETYPE_HLS = 1;  
{ RGB colorspace  }
  SIXEL_PALETTETYPE_RGB = 2;  
{ policies of SIXEL encoding  }
{ choose encoding policy automatically  }
  SIXEL_ENCODEPOLICY_AUTO = 0;  
{ encode as fast as possible  }
  SIXEL_ENCODEPOLICY_FAST = 1;  
{ encode to as small sixel sequence as possible  }
  SIXEL_ENCODEPOLICY_SIZE = 2;  
{ method for re-sampling  }
{ Use nearest neighbor method  }
  SIXEL_RES_NEAREST = 0;  
{ Use guaussian filter  }
  SIXEL_RES_GAUSSIAN = 1;  
{ Use hanning filter  }
  SIXEL_RES_HANNING = 2;  
{ Use hamming filter  }
  SIXEL_RES_HAMMING = 3;  
{ Use bilinear filter  }
  SIXEL_RES_BILINEAR = 4;  
{ Use welsh filter  }
  SIXEL_RES_WELSH = 5;  
{ Use bicubic filter  }
  SIXEL_RES_BICUBIC = 6;  
{ Use lanczos-2 filter  }
  SIXEL_RES_LANCZOS2 = 7;  
{ Use lanczos-3 filter  }
  SIXEL_RES_LANCZOS3 = 8;  
{ Use lanczos-4 filter  }
  SIXEL_RES_LANCZOS4 = 9;  
{ image format  }
{ read only  }
  SIXEL_FORMAT_GIF = $0;  
{ read/write  }
  SIXEL_FORMAT_PNG = $1;  
{ read only  }
  SIXEL_FORMAT_BMP = $2;  
{ read only  }
  SIXEL_FORMAT_JPG = $3;  
{ read only  }
  SIXEL_FORMAT_TGA = $4;  
{ read only with --with-gd configure option  }
  SIXEL_FORMAT_WBMP = $5;  
{ read only  }
  SIXEL_FORMAT_TIFF = $6;  
{ read only  }
  SIXEL_FORMAT_SIXEL = $7;  
{ read only  }
  SIXEL_FORMAT_PNM = $8;  
{ read only with --with-gd configure option  }
  SIXEL_FORMAT_GD2 = $9;  
{ read only  }
  SIXEL_FORMAT_PSD = $a;  
{ read only  }
  SIXEL_FORMAT_HDR = $b;  
{ loop mode  }
{ honer the setting of GIF header  }
  SIXEL_LOOP_AUTO = 0;  
{ always enable loop  }
  SIXEL_LOOP_FORCE = 1;  
{ always disable loop  }
  SIXEL_LOOP_DISABLE = 2;  
{ setopt flags  }
{ -i, --input: specify input file name.  }
  SIXEL_OPTFLAG_INPUT = 'i';  
{ -o, --output: specify output file name.  }
  SIXEL_OPTFLAG_OUTPUT = 'o';  
{ -o, --outfile: specify output file name.  }
  SIXEL_OPTFLAG_OUTFILE = 'o';  
{ -7, --7bit-mode: for 7bit terminals or printers (default)  }
  SIXEL_OPTFLAG_7BIT_MODE = '7';  
{ -8, --8bit-mode: for 8bit terminals or printers  }
  SIXEL_OPTFLAG_8BIT_MODE = '8';  
{ -R, --gri-limit: limit arguments of DECGRI('!') to 255  }
  SIXEL_OPTFLAG_HAS_GRI_ARG_LIMIT = 'R';  
{ -p COLORS, --colors=COLORS: specify number of colors  }
  SIXEL_OPTFLAG_COLORS = 'p';  
{ -m FILE, --mapfile=FILE: specify set of colors  }
  SIXEL_OPTFLAG_MAPFILE = 'm';  
{ -e, --monochrome: output monochrome sixel image  }
  SIXEL_OPTFLAG_MONOCHROME = 'e';  
{ -k, --insecure: allow to connect to SSL sites without certs  }
  SIXEL_OPTFLAG_INSECURE = 'k';  
{ -i, --invert: assume the terminal background color  }
  SIXEL_OPTFLAG_INVERT = 'i';  
{ -I, --high-color: output 15bpp sixel image  }
  SIXEL_OPTFLAG_HIGH_COLOR = 'I';  
{ -u, --use-macro: use DECDMAC and DEVINVM sequences  }
  SIXEL_OPTFLAG_USE_MACRO = 'u';  
{ -n MACRONO, --macro-number=MACRONO:
                                                  specify macro register number  }
  SIXEL_OPTFLAG_MACRO_NUMBER = 'n';  
{ -C COMPLEXIONSCORE, --complexion-score=COMPLEXIONSCORE:
                                                  specify an number argument for the score of
                                                  complexion correction.  }
  SIXEL_OPTFLAG_COMPLEXION_SCORE = 'C';  
{ -g, --ignore-delay: render GIF animation without delay  }
  SIXEL_OPTFLAG_IGNORE_DELAY = 'g';  
{ -S, --static: render animated GIF as a static image  }
  SIXEL_OPTFLAG_STATIC = 'S';  
{ -d DIFFUSIONTYPE, --diffusion=DIFFUSIONTYPE:
                                                  choose diffusion method which used with -p option.
                                                  DIFFUSIONTYPE is one of them:
                                                    auto     -> choose diffusion type
                                                                automatically (default)
                                                    none     -> do not diffuse
                                                    fs       -> Floyd-Steinberg method
                                                    atkinson -> Bill Atkinson's method
                                                    jajuni   -> Jarvis, Judice & Ninke
                                                    stucki   -> Stucki's method
                                                    burkes   -> Burkes' method
                                                    a_dither -> positionally stable
                                                                arithmetic dither
                                                    a_dither -> positionally stable
                                                                arithmetic xor based dither
                                                 }
  SIXEL_OPTFLAG_DIFFUSION = 'd';  
{ -f FINDTYPE, --find-largest=FINDTYPE:
                                                  choose method for finding the largest
                                                  dimension of median cut boxes for
                                                  splitting, make sense only when -p
                                                  option (color reduction) is
                                                  specified
                                                  FINDTYPE is one of them:
                                                    auto -> choose finding method
                                                            automatically (default)
                                                    norm -> simply comparing the
                                                            range in RGB space
                                                    lum  -> transforming into
                                                            luminosities before the
                                                            comparison
                                                 }
  SIXEL_OPTFLAG_FIND_LARGEST = 'f';  
{ -s SELECTTYPE, --select-color=SELECTTYPE
                                                  choose the method for selecting
                                                  representative color from each
                                                  median-cut box, make sense only
                                                  when -p option (color reduction) is
                                                  specified
                                                  SELECTTYPE is one of them:
                                                    auto      -> choose selecting
                                                                 method automatically
                                                                 (default)
                                                    center    -> choose the center of
                                                                 the box
                                                    average    -> calculate the color
                                                                 average into the box
                                                    histogram -> similar with average
                                                                 but considers color
                                                                 histogram
                                                 }
  SIXEL_OPTFLAG_SELECT_COLOR = 's';  
{ -c REGION, --crop=REGION:
                                                  crop source image to fit the
                                                  specified geometry. REGION should
                                                  be formatted as '%dx%d+%d+%d'
                                                 }
  SIXEL_OPTFLAG_CROP = 'c';  
{ -w WIDTH, --width=WIDTH:
                                                  resize image to specified width
                                                  WIDTH is represented by the
                                                  following syntax
                                                    auto       -> preserving aspect
                                                                  ratio (default)
                                                    <number>%  -> scale width with
                                                                  given percentage
                                                    <number>   -> scale width with
                                                                  pixel counts
                                                    <number>px -> scale width with
                                                                  pixel counts
                                                 }
  SIXEL_OPTFLAG_WIDTH = 'w';  
{ -h HEIGHT, --height=HEIGHT:
                                                   resize image to specified height
                                                   HEIGHT is represented by the
                                                   following syntax
                                                     auto       -> preserving aspect
                                                                   ratio (default)
                                                     <number>%  -> scale height with
                                                                   given percentage
                                                     <number>   -> scale height with
                                                                   pixel counts
                                                     <number>px -> scale height with
                                                                   pixel counts
                                                 }
  SIXEL_OPTFLAG_HEIGHT = 'h';  
{ -r RESAMPLINGTYPE, --resampling=RESAMPLINGTYPE:
                                                  choose resampling filter used
                                                  with -w or -h option (scaling)
                                                  RESAMPLINGTYPE is one of them:
                                                    nearest  -> Nearest-Neighbor
                                                                method
                                                    gaussian -> Gaussian filter
                                                    hanning  -> Hanning filter
                                                    hamming  -> Hamming filter
                                                    bilinear -> Bilinear filter
                                                                (default)
                                                    welsh    -> Welsh filter
                                                    bicubic  -> Bicubic filter
                                                    lanczos2 -> Lanczos-2 filter
                                                    lanczos3 -> Lanczos-3 filter
                                                    lanczos4 -> Lanczos-4 filter
                                                 }
  SIXEL_OPTFLAG_RESAMPLING = 'r';  
{ -q QUALITYMODE, --quality=QUALITYMODE:
                                                  select quality of color
                                                  quanlization.
                                                    auto -> decide quality mode
                                                            automatically (default)
                                                    low  -> low quality and high
                                                            speed mode
                                                    high -> high quality and low
                                                            speed mode
                                                    full -> full quality and careful
                                                            speed mode
                                                 }
  SIXEL_OPTFLAG_QUALITY = 'q';  
{ -l LOOPMODE, --loop-control=LOOPMODE:
                                                  select loop control mode for GIF
                                                  animation.
                                                    auto    -> honor the setting of
                                                               GIF header (default)
                                                    force   -> always enable loop
                                                    disable -> always disable loop
                                                 }
  SIXEL_OPTFLAG_LOOPMODE = 'l';  
{ -t PALETTETYPE, --palette-type=PALETTETYPE:
                                                  select palette color space type
                                                    auto -> choose palette type
                                                            automatically (default)
                                                    hls  -> use HLS color space
                                                    rgb  -> use RGB color space
                                                 }
  SIXEL_OPTFLAG_PALETTE_TYPE = 't';  
{ -b BUILTINPALETTE, --builtin-palette=BUILTINPALETTE:
                                                  select built-in palette type
                                                    xterm16    -> X default 16 color map
                                                    xterm256   -> X default 256 color map
                                                    vt340mono  -> VT340 monochrome map
                                                    vt340color -> VT340 color map
                                                    gray1      -> 1bit grayscale map
                                                    gray2      -> 2bit grayscale map
                                                    gray4      -> 4bit grayscale map
                                                    gray8      -> 8bit grayscale map
                                                 }
  SIXEL_OPTFLAG_BUILTIN_PALETTE = 'b';  
{ -E ENCODEPOLICY, --encode-policy=ENCODEPOLICY:
                                                  select encoding policy
                                                    auto -> choose encoding policy
                                                            automatically (default)
                                                    fast -> encode as fast as possible
                                                    size -> encode to as small sixel
                                                            sequence as possible
                                                 }
  SIXEL_OPTFLAG_ENCODE_POLICY = 'E';  
{ -O, --ormode:
                                                  output ormode sixel image
                                                 }
  SIXEL_OPTFLAG_ORMODE = 'O';  
{ -B BGCOLOR, --bgcolor=BGCOLOR:
                                                  specify background color
                                                  BGCOLOR is represented by the
                                                  following syntax
                                                    #rgb
                                                    #rrggbb
                                                    #rrrgggbbb
                                                    #rrrrggggbbbb
                                                    rgb:r/g/b
                                                    rgb:rr/gg/bb
                                                    rgb:rrr/ggg/bbb
                                                    rgb:rrrr/gggg/bbbb
                                                 }
  SIXEL_OPTFLAG_BGCOLOR = 'B';  
{ -P, --penetrate:
                                                  penetrate GNU Screen using DCS
                                                  pass-through sequence  }
  SIXEL_OPTFLAG_PENETRATE = 'P';  
{ -D, --pipe-mode: (deprecated)
                                                  read source images from stdin continuously  }
  SIXEL_OPTFLAG_PIPE_MODE = 'D';  
{ -v, --verbose: show debugging info  }
  SIXEL_OPTFLAG_VERBOSE = 'v';  
{ -V, --version: show version and license info  }
  SIXEL_OPTFLAG_VERSION = 'V';  
{ -H, --help: show this help  }
  SIXEL_OPTFLAG_HELP = 'H';  
{$if SIXEL_USE_DEPRECATED_SYMBOLS}
{ output character size  }
{ 7bit character  }
{ 8bit character  }
type
  TcharacterSize =  Longint;
  Const
    CSIZE_7BIT = 0;
    CSIZE_8BIT = 1;

{ method for finding the largest dimension for splitting,
 * and sorting by that component  }
{ choose automatically the method for finding the largest
                        dimension  }
{ simply comparing the range in RGB space  }
{ transforming into luminosities before the comparison  }
type
  TmethodForLargest =  Longint;
  Const
    LARGE_AUTO = 0;
    LARGE_NORM = 1;
    LARGE_LUM = 2;

{ method for choosing a color from the box  }
{ choose automatically the method for selecting
                               representative color from each box  }
{ choose the center of the box  }
{ choose the average all the color
                               in the box (specified in Heckbert's paper)  }
{ choose the average all the pixels in the box  }
type
  TmethodForRep =  Longint;
  Const
    REP_AUTO = 0;
    REP_CENTER_BOX = 1;
    REP_AVERAGE_COLORS = 2;
    REP_AVERAGE_PIXELS = 3;

{ method for diffusing  }
{ choose diffusion type automatically  }
{ don't diffuse  }
{ diffuse with Bill Atkinson's method  }
{ diffuse with Floyd-Steinberg method  }
{ diffuse with Jarvis, Judice & Ninke method  }
{ diffuse with Stucki's method  }
{ diffuse with Burkes' method  }
{ positionally stable arithmetic dither  }
{ positionally stable arithmetic xor based dither  }
type
  TmethodForDiffuse =  Longint;
  Const
    DIFFUSE_AUTO = 0;
    DIFFUSE_NONE = 1;
    DIFFUSE_ATKINSON = 2;
    DIFFUSE_FS = 3;
    DIFFUSE_JAJUNI = 4;
    DIFFUSE_STUCKI = 5;
    DIFFUSE_BURKES = 6;
    DIFFUSE_A_DITHER = 7;
    DIFFUSE_X_DITHER = 8;

{ quality modes  }
{ choose quality mode automatically  }
{ high quality palette construction  }
{ low quality palette construction  }
{ full quality palette construction  }
{ high color  }
type
  TqualityMode =  Longint;
  Const
    QUALITY_AUTO = 0;
    QUALITY_HIGH = 1;
    QUALITY_LOW = 2;
    QUALITY_FULL = 3;
    QUALITY_HIGHCOLOR = 4;

{ built-in dither  }
{ monochrome terminal with dark background  }
{ monochrome terminal with dark background  }
{ xterm 16color  }
{ xterm 256color  }
{ vt340 monochrome  }
{ vt340 color  }
type
  TbuiltinDither =  Longint;
  Const
    BUILTIN_MONO_DARK = 0;
    BUILTIN_MONO_LIGHT = 1;
    BUILTIN_XTERM16 = 2;
    BUILTIN_XTERM256 = 3;
    BUILTIN_VT340_MONO = 4;
    BUILTIN_VT340_COLOR = 5;

{ offset value of enum pixelFormat  }
type
  TformatType =  Longint;
  Const
    FORMATTYPE_COLOR = 0;
    FORMATTYPE_GRAYSCALE = 1 shl 6;
    FORMATTYPE_PALETTE = 1 shl 7;

{ pixelformat type of input image
   NOTE: for compatibility, the value of PIXELFORAMT_COLOR_RGB888 must be 3  }
{ 15bpp  }
{ 16bpp  }
{ 24bpp  }
{ 15bpp  }
{ 16bpp  }
{ 24bpp  }
{ 32bpp  }
{ 32bpp  }
{ 1bpp grayscale  }
{ 2bpp grayscale  }
{ 4bpp grayscale  }
{ 8bpp grayscale  }
{ 16bpp gray+alpha  }
{ 16bpp gray+alpha  }
{ 1bpp palette  }
{ 2bpp palette  }
{ 4bpp palette  }
{ 8bpp palette  }
type
  TpixelFormat =  Longint;
  Const
    PIXELFORMAT_RGB555 = FORMATTYPE_COLOR or $01;
    PIXELFORMAT_RGB565 = FORMATTYPE_COLOR or $02;
    PIXELFORMAT_RGB888 = FORMATTYPE_COLOR or $03;
    PIXELFORMAT_BGR555 = FORMATTYPE_COLOR or $04;
    PIXELFORMAT_BGR565 = FORMATTYPE_COLOR or $05;
    PIXELFORMAT_BGR888 = FORMATTYPE_COLOR or $06;
    PIXELFORMAT_ARGB8888 = FORMATTYPE_COLOR or $10;
    PIXELFORMAT_RGBA8888 = FORMATTYPE_COLOR or $11;
    PIXELFORMAT_G1 = FORMATTYPE_GRAYSCALE or $00;
    PIXELFORMAT_G2 = FORMATTYPE_GRAYSCALE or $01;
    PIXELFORMAT_G4 = FORMATTYPE_GRAYSCALE or $02;
    PIXELFORMAT_G8 = FORMATTYPE_GRAYSCALE or $03;
    PIXELFORMAT_AG88 = FORMATTYPE_GRAYSCALE or $13;
    PIXELFORMAT_GA88 = FORMATTYPE_GRAYSCALE or $23;
    PIXELFORMAT_PAL1 = FORMATTYPE_PALETTE or $00;
    PIXELFORMAT_PAL2 = FORMATTYPE_PALETTE or $01;
    PIXELFORMAT_PAL4 = FORMATTYPE_PALETTE or $02;
    PIXELFORMAT_PAL8 = FORMATTYPE_PALETTE or $03;

{ palette type  }
{ choose palette type automatically  }
{ HLS colorspace  }
{ RGB colorspace  }
type
  TpaletteType =  Longint;
  Const
    PALETTETYPE_AUTO = 0;
    PALETTETYPE_HLS = 1;
    PALETTETYPE_RGB = 2;

{ policies of SIXEL encoding  }
{ choose encoding policy automatically  }
{ encode as fast as possible  }
{ encode to as small sixel sequence as possible  }
type
  TencodePolicy =  Longint;
  Const
    ENCODEPOLICY_AUTO = 0;
    ENCODEPOLICY_FAST = 1;
    ENCODEPOLICY_SIZE = 2;

{ method for re-sampling  }
{ Use nearest neighbor method  }
{ Use guaussian filter  }
{ Use hanning filter  }
{ Use hamming filter  }
{ Use bilinear filter  }
{ Use welsh filter  }
{ Use bicubic filter  }
{ Use lanczos-2 filter  }
{ Use lanczos-3 filter  }
{ Use lanczos-4 filter  }
type
  TmethodForResampling =  Longint;
  Const
    RES_NEAREST = 0;
    RES_GAUSSIAN = 1;
    RES_HANNING = 2;
    RES_HAMMING = 3;
    RES_BILINEAR = 4;
    RES_WELSH = 5;
    RES_BICUBIC = 6;
    RES_LANCZOS2 = 7;
    RES_LANCZOS3 = 8;
    RES_LANCZOS4 = 9;

{$endif}
type
  Psixel_malloc_t = ^Tsixel_malloc_t;
  Tsixel_malloc_t = function (para1:Tsize_t):pointer;cdecl;

  Psixel_calloc_t = ^Tsixel_calloc_t;
  Tsixel_calloc_t = function (para1:Tsize_t; para2:Tsize_t):pointer;cdecl;

  Psixel_realloc_t = ^Tsixel_realloc_t;
  Tsixel_realloc_t = function (para1:pointer; para2:Tsize_t):pointer;cdecl;

  Tsixel_free_t = procedure (para1:pointer);cdecl;
  Psixel_allocator = ^Tsixel_allocator;
  Tsixel_allocator = record
      {undefined structure}
    end;

  Tsixel_allocator = Tsixel_allocator_t;
{ C++ extern C conditionnal removed }
{ create allocator object  }
{ out  }{ allocator object to be created  }
{ in  }{ custom malloc() function  }
{ in  }{ custom calloc() function  }
{ in  }{ custom realloc() function  }
{ in  }
function sixel_allocator_new(ppallocator:PPsixel_allocator_t; fn_malloc:Tsixel_malloc_t; fn_calloc:Tsixel_calloc_t; fn_realloc:Tsixel_realloc_t; fn_free:Tsixel_free_t):TSIXELSTATUS;cdecl;external;
{ custom free() function  }
{ increase reference count of allocator object (thread-unsafe)  }
{ in  }procedure sixel_allocator_ref(allocator:Psixel_allocator_t);cdecl;external;
{ allocator object to be
                                                increment reference counter  }
{ decrease reference count of output context object (thread-unsafe)  }
procedure sixel_allocator_unref(allocator:Psixel_allocator_t);cdecl;external;
{ call custom malloc()  }
{ in  }{ allocator object  }
{ in  }function sixel_allocator_malloc(allocator:Psixel_allocator_t; n:Tsize_t):pointer;cdecl;external;
{ allocation size  }
{ call custom calloc()  }
{ in  }{ allocator object  }
{ in  }{ allocation size  }
{ in  }function sixel_allocator_calloc(allocator:Psixel_allocator_t; nelm:Tsize_t; elsize:Tsize_t):pointer;cdecl;external;
{ allocation size  }
{ call custom realloc()  }
{ in  }{ allocator object  }
{ in  }{ existing buffer to be re-allocated  }
{ in  }function sixel_allocator_realloc(allocator:Psixel_allocator_t; p:pointer; n:Tsize_t):pointer;cdecl;external;
{ re-allocation size  }
{ call custom free()  }
{ in  }{ allocator object  }
{ in  }procedure sixel_allocator_free(allocator:Psixel_allocator_t; p:pointer);cdecl;external;
{ existing buffer to be freed  }
{$ifdef HAVE_TESTS}
  var
    sixel_debug_malloc_counter : longint;cvar;external;

function sixel_bad_malloc(size:Tsize_t):pointer;cdecl;external;
function sixel_bad_calloc(count:Tsize_t; size:Tsize_t):pointer;cdecl;external;
function sixel_bad_realloc(ptr:pointer; size:Tsize_t):pointer;cdecl;external;
{$endif}
{ HAVE_TESTS  }
{ C++ end of extern C conditionnal removed }
{ output context manipulation API  }
type
  Psixel_output = ^Tsixel_output;
  Tsixel_output = record
      {undefined structure}
    end;

  Tsixel_output = Tsixel_output_t;

  Tsixel_write_function = function (data:Pchar; size:longint; priv:pointer):longint;cdecl;
{ C++ extern C conditionnal removed }
{ create new output context object  }
{ out  }{ output object to be created  }
{ in  }{ callback for output sixel  }
{ in  }{ private data given as
                                                       3rd argument of fn_write  }
{ in  }
function sixel_output_new(output:PPsixel_output_t; fn_write:Tsixel_write_function; priv:pointer; allocator:Psixel_allocator_t):TSIXELSTATUS;cdecl;external;
{ allocator, null if you use
                                                       default allocator  }
{ deprecated: create an output object  }
{ __attribute__((deprecated)) }
{ in  }{ callback for output sixel  }
{ in  }function sixel_output_create(fn_write:Tsixel_write_function; priv:pointer):Psixel_output_t;cdecl;external;
{ private data given as
                                               3rd argument of fn_write  }
{ destroy output context object  }
{ in  }procedure sixel_output_destroy(output:Psixel_output_t);cdecl;external;
{ output context  }
{ increase reference count of output context object (thread-unsafe)  }
{ in  }procedure sixel_output_ref(output:Psixel_output_t);cdecl;external;
{ output context  }
{ decrease reference count of output context object (thread-unsafe)  }
{ in  }procedure sixel_output_unref(output:Psixel_output_t);cdecl;external;
{ output context  }
{ get 8bit output mode which indicates whether it uses C1 control characters  }
{ in  }function sixel_output_get_8bit_availability(output:Psixel_output_t):longint;cdecl;external;
{ output context  }
{ set 8bit output mode state  }
{ in  }{ output context  }
{ in  }procedure sixel_output_set_8bit_availability(output:Psixel_output_t; availability:longint);cdecl;external;
{ 0: do not use 8bit characters
                                              1: use 8bit characters  }
{ set whether limit arguments of DECGRI('!') to 255  }
{ in  }{ output context  }
{ in  }procedure sixel_output_set_gri_arg_limit(output:Psixel_output_t; value:longint);cdecl;external;
{ 0: don't limit arguments of DECGRI
                                        1: limit arguments of DECGRI to 255  }
{ set GNU Screen penetration feature enable or disable  }
{ in  }{ output context  }
{ in  }procedure sixel_output_set_penetrate_multiplexer(output:Psixel_output_t; penetrate:longint);cdecl;external;
{ 0: penetrate GNU Screen
                                           1: do not penetrate GNU Screen  }
{ set whether we skip DCS envelope  }
{ in  }{ output context  }
{ in  }procedure sixel_output_set_skip_dcs_envelope(output:Psixel_output_t; skip:longint);cdecl;external;
{ 0: output DCS envelope
                                          1: do not output DCS envelope  }
{ set palette type: RGB or HLS  }
{ in  }{ output context  }
{ in  }procedure sixel_output_set_palette_type(output:Psixel_output_t; palettetype:longint);cdecl;external;
{ PALETTETYPE_RGB: RGB palette
                                             PALETTETYPE_HLS: HLS palette  }
{ in  }{ output context  }
{ in  }procedure sixel_output_set_ormode(output:Psixel_output_t; ormode:longint);cdecl;external;
{ set encodeing policy: auto, fast or size  }
{ in  }{ output context  }
{ in  }procedure sixel_output_set_encode_policy(output:Psixel_output_t; encode_policy:longint);cdecl;external;
{ C++ end of extern C conditionnal removed }
{ color quantization API  }
{ handle type of dither context object  }
type
  Psixel_dither = ^Tsixel_dither;
  Tsixel_dither = record
      {undefined structure}
    end;

  Tsixel_dither = Tsixel_dither_t;
{ C++ extern C conditionnal removed }
{ create dither context object  }
{ out  }{ dither object to be created  }
{ in  }{ required colors  }
{ in  }
function sixel_dither_new(ppdither:PPsixel_dither_t; ncolors:longint; allocator:Psixel_allocator_t):TSIXELSTATUS;cdecl;external;
{ allocator, null if you use
                                                    default allocator  }
{ create dither context object  }
{ __attribute__((deprecated))  }
{ in  }function sixel_dither_create(ncolors:longint):Psixel_dither_t;cdecl;external;
{ number of colors  }
{ get built-in dither context object  }
function sixel_dither_get(builtin_dither:longint):Psixel_dither_t;cdecl;external;
{ ID of built-in dither object  }
{ destroy dither context object  }
procedure sixel_dither_destroy(dither:Psixel_dither_t);cdecl;external;
{ dither context object  }
{ increase reference count of dither context object (thread-unsafe)  }
procedure sixel_dither_ref(dither:Psixel_dither_t);cdecl;external;
{ dither context object  }
{ decrease reference count of dither context object (thread-unsafe)  }
procedure sixel_dither_unref(dither:Psixel_dither_t);cdecl;external;
{ dither context object  }
{ initialize internal palette from specified pixel buffer  }
{ dither context object  }
{ in  }{ sample image  }
{ in  }{ image width  }
{ in  }{ image height  }
{ in  }{ one of enum pixelFormat  }
{ in  }{ method for finding the largest dimension  }
{ in  }{ method for choosing a color from the box  }
{ in  }function sixel_dither_initialize(dither:Psixel_dither_t; data:Pbyte; width:longint; height:longint; pixelformat:longint; 
           method_for_largest:longint; method_for_rep:longint; quality_mode:longint):TSIXELSTATUS;cdecl;external;
{ quality of histogram processing  }
{ set diffusion type, choose from enum methodForDiffuse  }
{ in  }{ dither context object  }
{ in  }procedure sixel_dither_set_diffusion_type(dither:Psixel_dither_t; method_for_diffuse:longint);cdecl;external;
{ one of enum methodForDiffuse  }
{ get number of palette colors  }
{ in  }function sixel_dither_get_num_of_palette_colors(dither:Psixel_dither_t):longint;cdecl;external;
{ dither context object  }
{ get number of histogram colors  }
{ in  }function sixel_dither_get_num_of_histogram_colors(dither:Psixel_dither_t):longint;cdecl;external;
{ dither context object  }
{ __attribute__((deprecated)) }
{ typoed! remains for compatibility.  }
{ in  }function sixel_dither_get_num_of_histgram_colors(dither:Psixel_dither_t):longint;cdecl;external;
{ dither context object  }
{ get palette  }
{ in  }function sixel_dither_get_palette(dither:Psixel_dither_t):Pbyte;cdecl;external;
{ dither context object  }
{ set palette  }
{ in  }{ dither context object  }
{ in  }procedure sixel_dither_set_palette(dither:Psixel_dither_t; palette:Pbyte);cdecl;external;
{ set the factor of complexion color correcting  }
{ in  }{ dither context object  }
{ in  }procedure sixel_dither_set_complexion_score(dither:Psixel_dither_t; score:longint);cdecl;external;
{ complexion score (>= 1)  }
{ set whether omitting palette difinition  }
{ in  }{ dither context object  }
{ in  }procedure sixel_dither_set_body_only(dither:Psixel_dither_t; bodyonly:longint);cdecl;external;
{ 0: output palette section(default)
                                          1: do not output palette section  }
{ set whether optimize palette size  }
{ in  }{ dither context object  }
{ in  }procedure sixel_dither_set_optimize_palette(dither:Psixel_dither_t; do_opt:longint);cdecl;external;
{ 0: optimize palette size
                                          1: don't optimize palette size  }
{ set pixelformat  }
{ in  }{ dither context object  }
{ in  }procedure sixel_dither_set_pixelformat(dither:Psixel_dither_t; pixelformat:longint);cdecl;external;
{ one of enum pixelFormat  }
{ set transparent  }
{ in  }{ dither context object  }
{ in  }procedure sixel_dither_set_transparent(dither:Psixel_dither_t; transparent:longint);cdecl;external;
{ transparent color index  }
{ C++ end of extern C conditionnal removed }
{ converter API  }
type
  Psixel_allocator_function = ^Tsixel_allocator_function;
  Tsixel_allocator_function = function (size:Tsize_t):pointer;cdecl;
{ C++ extern C conditionnal removed }
{ convert pixels into sixel format and write it to output context  }
{ in  }{ pixel bytes  }
{ in  }{ image width  }
{ in  }{ image height  }
{ in  }{ color depth: now unused  }
{ in  }{ dither context  }
{ in  }
function sixel_encode(pixels:Pbyte; width:longint; height:longint; depth:longint; dither:Psixel_dither_t; 
           context:Psixel_output_t):TSIXELSTATUS;cdecl;external;
{ output context  }
{ convert sixel data into indexed pixel bytes and palette data  }
{ in  }{ sixel bytes  }
{ in  }{ size of sixel bytes  }
{ out  }{ decoded pixels  }
{ out  }{ image width  }
{ out  }{ image height  }
{ out  }{ ARGB palette  }
{ out  }{ palette size (<= 256)  }
{ in  }function sixel_decode_raw(p:Pbyte; len:longint; pixels:PPbyte; pwidth:Plongint; pheight:Plongint; 
           palette:PPbyte; ncolors:Plongint; allocator:Psixel_allocator_t):TSIXELSTATUS;cdecl;external;
{ allocator object or null  }
{ __attribute__((deprecated)) }
{ in  }{ sixel bytes  }
{ in  }{ size of sixel bytes  }
{ out  }{ decoded pixels  }
{ out  }{ image width  }
{ out  }{ image height  }
{ out  }{ RGBA palette  }
{ out  }{ palette size (<= 256)  }
{ in  }function sixel_decode(sixels:Pbyte; size:longint; pixels:PPbyte; pwidth:Plongint; pheight:Plongint; 
           palette:PPbyte; ncolors:Plongint; fn_malloc:Tsixel_allocator_function):TSIXELSTATUS;cdecl;external;
{ malloc function  }
{ C++ end of extern C conditionnal removed }
{ helper API  }
{ C++ extern C conditionnal removed }
(* Const before type ignored *)
{ in  }{ error message  }
procedure sixel_helper_set_additional_message(message:Pchar);cdecl;external;
(* Const before declarator ignored *)
function sixel_helper_get_additional_message:Pchar;cdecl;external;
{ convert error status code int formatted string  }
{ in  }{ status code  }
(* Const before declarator ignored *)
function sixel_helper_format_error(status:TSIXELSTATUS):Pchar;cdecl;external;
{ compute pixel depth from pixelformat  }
{ in  }{ one of enum pixelFormat  }
function sixel_helper_compute_depth(pixelformat:longint):longint;cdecl;external;
{ convert pixelFormat into PIXELFORMAT_RGB888  }
{ out  }{ destination buffer  }
{ out  }{ converted pixelformat  }
{ in  }(* Const before declarator ignored *)
{ source pixels  }
{ in  }{ format of source image  }
{ in  }{ width of source image  }
{ in  }{ height of source image  }
function sixel_helper_normalize_pixelformat(dst:Pbyte; dst_pixelformat:Plongint; src:Pbyte; src_pixelformat:longint; width:longint; 
           height:longint):TSIXELSTATUS;cdecl;external;
{ scale image to specified size  }
{ out  }{ destination buffer  }
{ in  }(* Const before declarator ignored *)
{ source image data  }
{ in  }{ source image width  }
{ in  }{ source image height  }
{ in  }{ one of enum pixelFormat  }
{ in  }{ destination image width  }
{ in  }{ destination image height  }
{ in  }{ one of methodForResampling  }
{ in  }{ allocator object  }
function sixel_helper_scale_image(dst:Pbyte; src:Pbyte; srcw:longint; srch:longint; pixelformat:longint; 
           dstw:longint; dsth:longint; method_for_resampling:longint; allocator:Psixel_allocator_t):TSIXELSTATUS;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ image loader/writer API  }
{$if SIXEL_USE_DEPRECATED_SYMBOLS}
{ read only  }
{ read/write  }
{ read only  }
{ read only  }
{ read only  }
{ read only with --with-gd configure option  }
{ read only  }
{ read only  }
{ read only  }
{ read only with --with-gd configure option  }
{ read only  }
{ read only  }
type
  TimageFormat =  Longint;
  Const
    FORMAT_GIF = 0;
    FORMAT_PNG = 1;
    FORMAT_BMP = 2;
    FORMAT_JPG = 3;
    FORMAT_TGA = 4;
    FORMAT_WBMP = 5;
    FORMAT_TIFF = 6;
    FORMAT_SIXEL = 7;
    FORMAT_PNM = 8;
    FORMAT_GD2 = 9;
    FORMAT_PSD = 10;
    FORMAT_HDR = 11;

{ loop mode  }
{ honer the setting of GIF header  }
{ always enable loop  }
{ always disable loop  }
type
  TloopControl =  Longint;
  Const
    LOOP_AUTO = 0;
    LOOP_FORCE = 1;
    LOOP_DISABLE = 2;

{$endif}
{ handle type of dither context object  }
type
  Psixel_frame = ^Tsixel_frame;
  Tsixel_frame = record
      {undefined structure}
    end;

  Tsixel_frame = Tsixel_frame_t;
{ C++ extern C conditionnal removed }
{ constructor of frame object  }
{ out  }{ frame object to be created  }
{ in  }
function sixel_frame_new(ppframe:PPsixel_frame_t; allocator:Psixel_allocator_t):TSIXELSTATUS;cdecl;external;
{ allocator, null if you use
                                                   default allocator  }
{ deprecated version of sixel_frame_new()  }
{ __attribute__((deprecated)) }
function sixel_frame_create:Psixel_frame_t;cdecl;external;
{ increase reference count of frame object (thread-unsafe)  }
{ in  }procedure sixel_frame_ref(frame:Psixel_frame_t);cdecl;external;
{ decrease reference count of frame object (thread-unsafe)  }
{ in  }procedure sixel_frame_unref(frame:Psixel_frame_t);cdecl;external;
{ initialize frame object with a pixel buffer  }
{ in  }{ frame object to be initialize  }
{ in  }{ pixel buffer  }
{ in  }{ pixel width of buffer  }
{ in  }{ pixel height of buffer  }
{ in  }{ pixelformat of buffer  }
{ in  }{ palette for buffer or NULL  }
{ in  }{ number of palette colors or (-1)  }
function sixel_frame_init(frame:Psixel_frame_t; pixels:Pbyte; width:longint; height:longint; pixelformat:longint; 
           palette:Pbyte; ncolors:longint):TSIXELSTATUS;cdecl;external;
{ get pixels  }
{ in  }function sixel_frame_get_pixels(frame:Psixel_frame_t):Pbyte;cdecl;external;
{ frame object  }
{ get palette  }
{ in  }function sixel_frame_get_palette(frame:Psixel_frame_t):Pbyte;cdecl;external;
{ frame object  }
{ get width  }
{ in  }function sixel_frame_get_width(frame:Psixel_frame_t):longint;cdecl;external;
{ frame object  }
{ get height  }
{ in  }function sixel_frame_get_height(frame:Psixel_frame_t):longint;cdecl;external;
{ frame object  }
{ get ncolors  }
{ in  }function sixel_frame_get_ncolors(frame:Psixel_frame_t):longint;cdecl;external;
{ frame object  }
{ get pixelformat  }
{ in  }function sixel_frame_get_pixelformat(frame:Psixel_frame_t):longint;cdecl;external;
{ frame object  }
{ get transparent  }
{ in  }function sixel_frame_get_transparent(frame:Psixel_frame_t):longint;cdecl;external;
{ frame object  }
{ get transparent  }
{ in  }function sixel_frame_get_multiframe(frame:Psixel_frame_t):longint;cdecl;external;
{ frame object  }
{ get delay  }
{ in  }function sixel_frame_get_delay(frame:Psixel_frame_t):longint;cdecl;external;
{ frame object  }
{ get frame no  }
{ in  }function sixel_frame_get_frame_no(frame:Psixel_frame_t):longint;cdecl;external;
{ frame object  }
{ get loop no  }
{ in  }function sixel_frame_get_loop_no(frame:Psixel_frame_t):longint;cdecl;external;
{ frame object  }
{ strip alpha from RGBA/ARGB formatted pixbuf  }
{ in  }{ in  }function sixel_frame_strip_alpha(frame:Psixel_frame_t; bgcolor:Pbyte):longint;cdecl;external;
{ resize a frame to given size with specified resampling filter  }
{ in  }{ in  }{ in  }{ in  }function sixel_frame_resize(frame:Psixel_frame_t; width:longint; height:longint; method_for_resampling:longint):TSIXELSTATUS;cdecl;external;
{ clip frame  }
{ in  }{ in  }{ in  }{ in  }{ in  }function sixel_frame_clip(frame:Psixel_frame_t; x:longint; y:longint; width:longint; height:longint):TSIXELSTATUS;cdecl;external;
{ in  }{ in/out  }type

  Tsixel_load_image_function = function (frame:Psixel_frame_t; context:pointer):TSIXELSTATUS;cdecl;
{ in  }(* Const before declarator ignored *)
{ source file name  }
{ in  }{ whether to extract static image  }
{ in  }{ whether to use paletted image  }
{ in  }{ requested number of colors  }
{ in  }{ background color  }
{ in  }{ one of enum loopControl  }
{ in  }{ callback  }
{ in  }{ true if do not verify SSL  }
{ in  }(* Const before declarator ignored *)
{ cancel flag  }
{ in/out  }{ private data for callback  }
{ in  }
function sixel_helper_load_image_file(filename:Pchar; fstatic:longint; fuse_palette:longint; reqcolors:longint; bgcolor:Pbyte; 
           loop_control:longint; fn_load:Tsixel_load_image_function; finsecure:longint; cancel_flag:Plongint; context:pointer; 
           allocator:Psixel_allocator_t):TSIXELSTATUS;cdecl;external;
{ allocator object  }
{ write image to file  }
{ in  }{ source pixel data  }
{ in  }{ source data width  }
{ in  }{ source data height  }
{ in  }{ palette of source data  }
{ in  }{ source pixelFormat  }
{ in  }(* Const before declarator ignored *)
{ destination filename  }
{ in  }{ one of enum imageformat  }
{ in  }function sixel_helper_write_image_file(data:Pbyte; width:longint; height:longint; palette:Pbyte; pixelformat:longint; 
           filename:Pchar; imageformat:longint; allocator:Psixel_allocator_t):TSIXELSTATUS;cdecl;external;
{ allocator object  }
{ C++ end of extern C conditionnal removed }
{ easy encoder API  }
{ handle type of dither context object  }
type
  Psixel_encoder = ^Tsixel_encoder;
  Tsixel_encoder = record
      {undefined structure}
    end;

  Tsixel_encoder = Tsixel_encoder_t;
{ C++ extern C conditionnal removed }
{ create encoder object  }
{ out  }{ encoder object to be created  }
{ in  }
function sixel_encoder_new(ppencoder:PPsixel_encoder_t; allocator:Psixel_allocator_t):TSIXELSTATUS;cdecl;external;
{ allocator, null if you use
                                                  default allocator  }
{ deprecated version of sixel_decoder_new()  }
{ __attribute__((deprecated)) }
function sixel_encoder_create:Psixel_encoder_t;cdecl;external;
{ increase reference count of encoder object (thread-unsafe)  }
{ in  }procedure sixel_encoder_ref(encoder:Psixel_encoder_t);cdecl;external;
{ decrease reference count of encoder object (thread-unsafe)  }
{ in  }procedure sixel_encoder_unref(encoder:Psixel_encoder_t);cdecl;external;
{ set cancel state flag to encoder object  }
{ in  }{ in  }function sixel_encoder_set_cancel_flag(encoder:Psixel_encoder_t; cancel_flag:Plongint):TSIXELSTATUS;cdecl;external;
{ set an option flag to encoder object  }
{ in  }{ in  }{ in  }(* Const before declarator ignored *)
function sixel_encoder_setopt(encoder:Psixel_encoder_t; arg:longint; optarg:Pchar):TSIXELSTATUS;cdecl;external;
{ load source data from specified file and encode it to SIXEL format  }
{ in  }{ in  }(* Const before declarator ignored *)
function sixel_encoder_encode(encoder:Psixel_encoder_t; filename:Pchar):TSIXELSTATUS;cdecl;external;
{ encode specified pixel data to SIXEL format
 * output to encoder->outfd  }
{ in  }{ in  }{ in  }{ in  }{ in  }{ in  }{ in  }function sixel_encoder_encode_bytes(encoder:Psixel_encoder_t; bytes:Pbyte; width:longint; height:longint; pixelformat:longint; 
           palette:Pbyte; ncolors:longint):TSIXELSTATUS;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ easy encoder API  }
{ handle type of dither context object  }
type
  Psixel_decoder = ^Tsixel_decoder;
  Tsixel_decoder = record
      {undefined structure}
    end;

  Tsixel_decoder = Tsixel_decoder_t;
{ C++ extern C conditionnal removed }
{ create decoder object  }
{ out  }{ decoder object to be created  }
{ in  }
function sixel_decoder_new(ppdecoder:PPsixel_decoder_t; allocator:Psixel_allocator_t):TSIXELSTATUS;cdecl;external;
{ allocator, null if you use
                                                  default allocator  }
{ deprecated version of sixel_decoder_new()  }
{ __attribute__((deprecated)) }
function sixel_decoder_create:Psixel_decoder_t;cdecl;external;
{ increase reference count of decoder object (thread-unsafe)  }
procedure sixel_decoder_ref(decoder:Psixel_decoder_t);cdecl;external;
{ decrease reference count of decoder object (thread-unsafe)  }
procedure sixel_decoder_unref(decoder:Psixel_decoder_t);cdecl;external;
{ set an option flag to decoder object  }
{ in  }{ decoder object  }
{ in  }{ one of SIXEL_OPTFLAG_***  }
{ in  }(* Const before declarator ignored *)
function sixel_decoder_setopt(decoder:Psixel_decoder_t; arg:longint; optarg:Pchar):TSIXELSTATUS;cdecl;external;
{ null or an argument of optflag  }
{ load source data from stdin or the file specified with
   SIXEL_OPTFLAG_INPUT flag, and decode it  }
{ in  }function sixel_decoder_decode(decoder:Psixel_decoder_t):TSIXELSTATUS;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBSIXEL_SIXEL_H  }
{ emacs Local Variables:       }
{ emacs mode: c                }
{ emacs tab-width: 4           }
{ emacs indent-tabs-mode: nil  }
{ emacs c-basic-offset: 4      }
{ emacs End:                   }
{ vim: set expandtab ts=4 sts=4 sw=4 :  }
{ EOF  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SIXEL_SUCCEEDED(status : longint) : longint;
begin
  SIXEL_SUCCEEDED:=(Tstatus(@($1000)))=0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SIXEL_FAILED(status : longint) : longint;
begin
  SIXEL_FAILED:=(Tstatus(@($1000)))<>0;
end;


end.
