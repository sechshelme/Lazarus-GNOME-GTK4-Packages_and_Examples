
unit hwcontext_videotoolbox;
interface

{
  Automatically converted by H2Pas 1.0.0 from hwcontext_videotoolbox.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hwcontext_videotoolbox.h
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
PAVFrame  = ^AVFrame;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
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
{$ifndef AVUTIL_HWCONTEXT_VIDEOTOOLBOX_H}
{$define AVUTIL_HWCONTEXT_VIDEOTOOLBOX_H}
{$include <stdint.h>}
{$include <VideoToolbox/VideoToolbox.h>}
{$include "frame.h"}
{$include "pixfmt.h"}
{*
 * @file
 * An API-specific header for AV_HWDEVICE_TYPE_VIDEOTOOLBOX.
 *
 * This API supports frame allocation using a native CVPixelBufferPool
 * instead of an AVBufferPool.
 *
 * If the API user sets a custom pool, AVHWFramesContext.pool must return
 * AVBufferRefs whose data pointer is a CVImageBufferRef or CVPixelBufferRef.
 * Note that the underlying CVPixelBuffer could be retained by OS frameworks
 * depending on application usage, so it is preferable to let CoreVideo manage
 * the pool using the default implementation.
 *
 * Currently AVHWDeviceContext.hwctx and AVHWFramesContext.hwctx are always
 * NULL.
  }
{*
 * Convert a VideoToolbox (actually CoreVideo) format to AVPixelFormat.
 * Returns AV_PIX_FMT_NONE if no known equivalent was found.
  }

function av_map_videotoolbox_format_to_pixfmt(cv_fmt:Tuint32_t):TAVPixelFormat;cdecl;external;
{*
 * Convert an AVPixelFormat to a VideoToolbox (actually CoreVideo) format.
 * Returns 0 if no known equivalent was found.
  }
function av_map_videotoolbox_format_from_pixfmt(pix_fmt:TAVPixelFormat):Tuint32_t;cdecl;external;
{*
 * Same as av_map_videotoolbox_format_from_pixfmt function, but can map and
 * return full range pixel formats via a flag.
  }
function av_map_videotoolbox_format_from_pixfmt2(pix_fmt:TAVPixelFormat; full_range:Tbool):Tuint32_t;cdecl;external;
{*
 * Convert an AVChromaLocation to a VideoToolbox/CoreVideo chroma location string.
 * Returns 0 if no known equivalent was found.
  }
function av_map_videotoolbox_chroma_loc_from_av(loc:TAVChromaLocation):TCFStringRef;cdecl;external;
{*
 * Convert an AVColorSpace to a VideoToolbox/CoreVideo color matrix string.
 * Returns 0 if no known equivalent was found.
  }
function av_map_videotoolbox_color_matrix_from_av(space:TAVColorSpace):TCFStringRef;cdecl;external;
{*
 * Convert an AVColorPrimaries to a VideoToolbox/CoreVideo color primaries string.
 * Returns 0 if no known equivalent was found.
  }
function av_map_videotoolbox_color_primaries_from_av(pri:TAVColorPrimaries):TCFStringRef;cdecl;external;
{*
 * Convert an AVColorTransferCharacteristic to a VideoToolbox/CoreVideo color transfer
 * function string.
 * Returns 0 if no known equivalent was found.
  }
function av_map_videotoolbox_color_trc_from_av(trc:TAVColorTransferCharacteristic):TCFStringRef;cdecl;external;
{*
 * Update a CVPixelBufferRef's metadata to based on an AVFrame.
 * Returns 0 if no known equivalent was found.
  }
(* Const before type ignored *)
function av_vt_pixbuf_set_attachments(log_ctx:pointer; pixbuf:TCVPixelBufferRef; src:PAVFrame):longint;cdecl;external;
{$endif}
{ AVUTIL_HWCONTEXT_VIDEOTOOLBOX_H  }

implementation


end.
