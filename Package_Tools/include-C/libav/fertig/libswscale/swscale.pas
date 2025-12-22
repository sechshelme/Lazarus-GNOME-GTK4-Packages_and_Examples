unit swscale;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2001-2011 Michael Niedermayer <michaelni@gmx.at>
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{$ifndef SWSCALE_SWSCALE_H}
{$define SWSCALE_SWSCALE_H}
{*
 * @file
 * @ingroup libsws
 * external API header
  }
{$include <stdint.h>}
{$include "libavutil/avutil.h"}
{$include "libavutil/frame.h"}
{$include "libavutil/log.h"}
{$include "libavutil/pixfmt.h"}
{$include "version_major.h"}
{$ifndef HAVE_AV_CONFIG_H}
{ When included as part of the ffmpeg build, only include the major version
 * to avoid unnecessary rebuilds. When included externally, keep including
 * the full version information.  }
{$include "version.h"}
{$endif}
{*
 * @defgroup libsws libswscale
 * Color conversion and scaling library.
 *
 * @
 *
 * Return the LIBSWSCALE_VERSION_INT constant.
  }

function swscale_version:dword;cdecl;external libswscale;
{*
 * Return the libswscale build-time configuration.
  }
function swscale_configuration:Pchar;cdecl;external libswscale;
{*
 * Return the libswscale license.
  }
function swscale_license:Pchar;cdecl;external libswscale;
{ values for the flags, the stuff on the command line is different  }
const
  SWS_FAST_BILINEAR = 1;  
  SWS_BILINEAR = 2;  
  SWS_BICUBIC = 4;  
  SWS_X = 8;  
  SWS_POINT = $10;  
  SWS_AREA = $20;  
  SWS_BICUBLIN = $40;  
  SWS_GAUSS = $80;  
  SWS_SINC = $100;  
  SWS_LANCZOS = $200;  
  SWS_SPLINE = $400;  
  SWS_SRC_V_CHR_DROP_MASK = $30000;  
  SWS_SRC_V_CHR_DROP_SHIFT = 16;  
  SWS_PARAM_DEFAULT = 123456;  
  SWS_PRINT_INFO = $1000;  
{the following 3 flags are not completely implemented }
{internal chrominance subsampling info }
  SWS_FULL_CHR_H_INT = $2000;  
{input subsampling info }
  SWS_FULL_CHR_H_INP = $4000;  
  SWS_DIRECT_BGR = $8000;  
  SWS_ACCURATE_RND = $40000;  
  SWS_BITEXACT = $80000;  
  SWS_ERROR_DIFFUSION = $800000;  
  SWS_MAX_REDUCE_CUTOFF = 0.002;  
  SWS_CS_ITU709 = 1;  
  SWS_CS_FCC = 4;  
  SWS_CS_ITU601 = 5;  
  SWS_CS_ITU624 = 5;  
  SWS_CS_SMPTE170M = 5;  
  SWS_CS_SMPTE240M = 7;  
  SWS_CS_DEFAULT = 5;  
  SWS_CS_BT2020 = 9;  
{*
 * Return a pointer to yuv<->rgb coefficients for the given colorspace
 * suitable for sws_setColorspaceDetails().
 *
 * @param colorspace One of the SWS_CS_* macros. If invalid,
 * SWS_CS_DEFAULT is used.
  }

function sws_getCoefficients(colorspace:longint):Plongint;cdecl;external libswscale;
{ when used for filters they must have an odd number of elements }
{ coeffs cannot be shared between vectors }
{/< pointer to the list of coefficients }
{/< number of coefficients in the vector }
type
  PSwsVector = ^TSwsVector;
  TSwsVector = record
      coeff : Pdouble;
      length : longint;
    end;
{ vectors can be shared }

  PSwsFilter = ^TSwsFilter;
  TSwsFilter = record
      lumH : PSwsVector;
      lumV : PSwsVector;
      chrH : PSwsVector;
      chrV : PSwsVector;
    end;
  PSwsContext = ^TSwsContext;
  TSwsContext = record
      {undefined structure}
    end;

{*
 * Return a positive value if pix_fmt is a supported input format, 0
 * otherwise.
  }

function sws_isSupportedInput(pix_fmt:TAVPixelFormat):longint;cdecl;external libswscale;
{*
 * Return a positive value if pix_fmt is a supported output format, 0
 * otherwise.
  }
function sws_isSupportedOutput(pix_fmt:TAVPixelFormat):longint;cdecl;external libswscale;
{*
 * @param[in]  pix_fmt the pixel format
 * @return a positive value if an endianness conversion for pix_fmt is
 * supported, 0 otherwise.
  }
function sws_isSupportedEndiannessConversion(pix_fmt:TAVPixelFormat):longint;cdecl;external libswscale;
{*
 * Allocate an empty SwsContext. This must be filled and passed to
 * sws_init_context(). For filling see AVOptions, options.c and
 * sws_setColorspaceDetails().
  }
function sws_alloc_context:PSwsContext;cdecl;external libswscale;
{*
 * Initialize the swscaler context sws_context.
 *
 * @return zero or positive value on success, a negative value on
 * error
  }
function sws_init_context(sws_context:PSwsContext; srcFilter:PSwsFilter; dstFilter:PSwsFilter):longint;cdecl;external libswscale;
{*
 * Free the swscaler context swsContext.
 * If swsContext is NULL, then does nothing.
  }
procedure sws_freeContext(swsContext:PSwsContext);cdecl;external libswscale;
{*
 * Allocate and return an SwsContext. You need it to perform
 * scaling/conversion operations using sws_scale().
 *
 * @param srcW the width of the source image
 * @param srcH the height of the source image
 * @param srcFormat the source image format
 * @param dstW the width of the destination image
 * @param dstH the height of the destination image
 * @param dstFormat the destination image format
 * @param flags specify which algorithm and options to use for rescaling
 * @param param extra parameters to tune the used scaler
 *              For SWS_BICUBIC param[0] and [1] tune the shape of the basis
 *              function, param[0] tunes f(1) and param[1] f´(1)
 *              For SWS_GAUSS param[0] tunes the exponent and thus cutoff
 *              frequency
 *              For SWS_LANCZOS param[0] tunes the width of the window function
 * @return a pointer to an allocated context, or NULL in case of error
 * @note this function is to be removed after a saner alternative is
 *       written
  }
function sws_getContext(srcW:longint; srcH:longint; srcFormat:TAVPixelFormat; dstW:longint; dstH:longint; 
           dstFormat:TAVPixelFormat; flags:longint; srcFilter:PSwsFilter; dstFilter:PSwsFilter; param:Pdouble):PSwsContext;cdecl;external libswscale;
{*
 * Scale the image slice in srcSlice and put the resulting scaled
 * slice in the image in dst. A slice is a sequence of consecutive
 * rows in an image.
 *
 * Slices have to be provided in sequential order, either in
 * top-bottom or bottom-top order. If slices are provided in
 * non-sequential order the behavior of the function is undefined.
 *
 * @param c         the scaling context previously created with
 *                  sws_getContext()
 * @param srcSlice  the array containing the pointers to the planes of
 *                  the source slice
 * @param srcStride the array containing the strides for each plane of
 *                  the source image
 * @param srcSliceY the position in the source image of the slice to
 *                  process, that is the number (counted starting from
 *                  zero) in the image of the first row of the slice
 * @param srcSliceH the height of the source slice, that is the number
 *                  of rows in the slice
 * @param dst       the array containing the pointers to the planes of
 *                  the destination image
 * @param dstStride the array containing the strides for each plane of
 *                  the destination image
 * @return          the height of the output slice
  }
function sws_scale(c:PSwsContext; srcSlice:PPuint8_t; srcStride:Plongint; srcSliceY:longint; srcSliceH:longint; 
           dst:PPuint8_t; dstStride:Plongint):longint;cdecl;external libswscale;
{*
 * Scale source data from src and write the output to dst.
 *
 * This is merely a convenience wrapper around
 * - sws_frame_start()
 * - sws_send_slice(0, src->height)
 * - sws_receive_slice(0, dst->height)
 * - sws_frame_end()
 *
 * @param c   The scaling context
 * @param dst The destination frame. See documentation for sws_frame_start() for
 *            more details.
 * @param src The source frame.
 *
 * @return 0 on success, a negative AVERROR code on failure
  }
function sws_scale_frame(c:PSwsContext; dst:PAVFrame; src:PAVFrame):longint;cdecl;external libswscale;
{*
 * Initialize the scaling process for a given pair of source/destination frames.
 * Must be called before any calls to sws_send_slice() and sws_receive_slice().
 *
 * This function will retain references to src and dst, so they must both use
 * refcounted buffers (if allocated by the caller, in case of dst).
 *
 * @param c   The scaling context
 * @param dst The destination frame.
 *
 *            The data buffers may either be already allocated by the caller or
 *            left clear, in which case they will be allocated by the scaler.
 *            The latter may have performance advantages - e.g. in certain cases
 *            some output planes may be references to input planes, rather than
 *            copies.
 *
 *            Output data will be written into this frame in successful
 *            sws_receive_slice() calls.
 * @param src The source frame. The data buffers must be allocated, but the
 *            frame data does not have to be ready at this point. Data
 *            availability is then signalled by sws_send_slice().
 * @return 0 on success, a negative AVERROR code on failure
 *
 * @see sws_frame_end()
  }
function sws_frame_start(c:PSwsContext; dst:PAVFrame; src:PAVFrame):longint;cdecl;external libswscale;
{*
 * Finish the scaling process for a pair of source/destination frames previously
 * submitted with sws_frame_start(). Must be called after all sws_send_slice()
 * and sws_receive_slice() calls are done, before any new sws_frame_start()
 * calls.
 *
 * @param c   The scaling context
  }
procedure sws_frame_end(c:PSwsContext);cdecl;external libswscale;
{*
 * Indicate that a horizontal slice of input data is available in the source
 * frame previously provided to sws_frame_start(). The slices may be provided in
 * any order, but may not overlap. For vertically subsampled pixel formats, the
 * slices must be aligned according to subsampling.
 *
 * @param c   The scaling context
 * @param slice_start first row of the slice
 * @param slice_height number of rows in the slice
 *
 * @return a non-negative number on success, a negative AVERROR code on failure.
  }
function sws_send_slice(c:PSwsContext; slice_start:dword; slice_height:dword):longint;cdecl;external libswscale;
{*
 * Request a horizontal slice of the output data to be written into the frame
 * previously provided to sws_frame_start().
 *
 * @param c   The scaling context
 * @param slice_start first row of the slice; must be a multiple of
 *                    sws_receive_slice_alignment()
 * @param slice_height number of rows in the slice; must be a multiple of
 *                     sws_receive_slice_alignment(), except for the last slice
 *                     (i.e. when slice_start+slice_height is equal to output
 *                     frame height)
 *
 * @return a non-negative number if the data was successfully written into the output
 *         AVERROR(EAGAIN) if more input data needs to be provided before the
 *                         output can be produced
 *         another negative AVERROR code on other kinds of scaling failure
  }
function sws_receive_slice(c:PSwsContext; slice_start:dword; slice_height:dword):longint;cdecl;external libswscale;
{*
 * Get the alignment required for slices
 *
 * @param c   The scaling context
 * @return alignment required for output slices requested with sws_receive_slice().
 *         Slice offsets and sizes passed to sws_receive_slice() must be
 *         multiples of the value returned from this function.
  }
function sws_receive_slice_alignment(c:PSwsContext):dword;cdecl;external libswscale;
{*
 * @param c the scaling context
 * @param dstRange flag indicating the while-black range of the output (1=jpeg / 0=mpeg)
 * @param srcRange flag indicating the while-black range of the input (1=jpeg / 0=mpeg)
 * @param table the yuv2rgb coefficients describing the output yuv space, normally ff_yuv2rgb_coeffs[x]
 * @param inv_table the yuv2rgb coefficients describing the input yuv space, normally ff_yuv2rgb_coeffs[x]
 * @param brightness 16.16 fixed point brightness correction
 * @param contrast 16.16 fixed point contrast correction
 * @param saturation 16.16 fixed point saturation correction
 *
 * @return A negative error code on error, non negative otherwise.
 *         If `LIBSWSCALE_VERSION_MAJOR < 7`, returns -1 if not supported.
  }
function sws_setColorspaceDetails(c:PSwsContext; inv_table:array[0..3] of longint; srcRange:longint; table:array[0..3] of longint; dstRange:longint; 
           brightness:longint; contrast:longint; saturation:longint):longint;cdecl;external libswscale;
{*
 * @return A negative error code on error, non negative otherwise.
 *         If `LIBSWSCALE_VERSION_MAJOR < 7`, returns -1 if not supported.
  }
function sws_getColorspaceDetails(c:PSwsContext; inv_table:PPlongint; srcRange:Plongint; table:PPlongint; dstRange:Plongint; 
           brightness:Plongint; contrast:Plongint; saturation:Plongint):longint;cdecl;external libswscale;
{*
 * Allocate and return an uninitialized vector with length coefficients.
  }
function sws_allocVec(length:longint):PSwsVector;cdecl;external libswscale;
{*
 * Return a normalized Gaussian curve used to filter stuff
 * quality = 3 is high quality, lower is lower quality.
  }
function sws_getGaussianVec(variance:Tdouble; quality:Tdouble):PSwsVector;cdecl;external libswscale;
{*
 * Scale all the coefficients of a by the scalar value.
  }
procedure sws_scaleVec(a:PSwsVector; scalar:Tdouble);cdecl;external libswscale;
{*
 * Scale all the coefficients of a so that their sum equals height.
  }
procedure sws_normalizeVec(a:PSwsVector; height:Tdouble);cdecl;external libswscale;
procedure sws_freeVec(a:PSwsVector);cdecl;external libswscale;
function sws_getDefaultFilter(lumaGBlur:single; chromaGBlur:single; lumaSharpen:single; chromaSharpen:single; chromaHShift:single; 
           chromaVShift:single; verbose:longint):PSwsFilter;cdecl;external libswscale;
procedure sws_freeFilter(filter:PSwsFilter);cdecl;external libswscale;
{*
 * Check if context can be reused, otherwise reallocate a new one.
 *
 * If context is NULL, just calls sws_getContext() to get a new
 * context. Otherwise, checks if the parameters are the ones already
 * saved in context. If that is the case, returns the current
 * context. Otherwise, frees context and gets a new context with
 * the new parameters.
 *
 * Be warned that srcFilter and dstFilter are not checked, they
 * are assumed to remain the same.
  }
function sws_getCachedContext(context:PSwsContext; srcW:longint; srcH:longint; srcFormat:TAVPixelFormat; dstW:longint; 
           dstH:longint; dstFormat:TAVPixelFormat; flags:longint; srcFilter:PSwsFilter; dstFilter:PSwsFilter; 
           param:Pdouble):PSwsContext;cdecl;external libswscale;
{*
 * Convert an 8-bit paletted frame into a frame with a color depth of 32 bits.
 *
 * The output frame will have the same packed format as the palette.
 *
 * @param src        source frame buffer
 * @param dst        destination frame buffer
 * @param num_pixels number of pixels to convert
 * @param palette    array with [256] entries, which must match color arrangement (RGB or BGR) of src
  }
procedure sws_convertPalette8ToPacked32(src:Puint8_t; dst:Puint8_t; num_pixels:longint; palette:Puint8_t);cdecl;external libswscale;
{*
 * Convert an 8-bit paletted frame into a frame with a color depth of 24 bits.
 *
 * With the palette format "ABCD", the destination frame ends up with the format "ABC".
 *
 * @param src        source frame buffer
 * @param dst        destination frame buffer
 * @param num_pixels number of pixels to convert
 * @param palette    array with [256] entries, which must match color arrangement (RGB or BGR) of src
  }
procedure sws_convertPalette8ToPacked24(src:Puint8_t; dst:Puint8_t; num_pixels:longint; palette:Puint8_t);cdecl;external libswscale;
{*
 * Get the AVClass for swsContext. It can be used in combination with
 * AV_OPT_SEARCH_FAKE_OBJ for examining options.
 *
 * @see av_opt_find().
  }
function sws_get_class:PAVClass;cdecl;external libswscale;
{*
 * @
  }
{$endif}
{ SWSCALE_SWSCALE_H  }

// === Konventiert am: 22-12-25 19:30:47 ===


implementation



end.
