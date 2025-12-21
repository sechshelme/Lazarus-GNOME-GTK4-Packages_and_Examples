
unit vdpau;
interface

{
  Automatically converted by H2Pas 1.0.0 from vdpau.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vdpau.h
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
PAVCodecContext  = ^AVCodecContext;
PAVFrame  = ^AVFrame;
PAVVDPAUContext  = ^AVVDPAUContext;
Puint32_t  = ^uint32_t;
PVdpBitstreamBuffer  = ^VdpBitstreamBuffer;
PVdpChromaType  = ^VdpChromaType;
PVdpDecoderRender  = ^VdpDecoderRender;
PVdpGetProcAddress  = ^VdpGetProcAddress;
PVdpPictureInfo  = ^VdpPictureInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * The Video Decode and Presentation API for UNIX (VDPAU) is used for
 * hardware-accelerated decoding of MPEG-1/2, H.264 and VC-1.
 *
 * Copyright (C) 2008 NVIDIA
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
{$ifndef AVCODEC_VDPAU_H}
{$define AVCODEC_VDPAU_H}
{*
 * @file
 * @ingroup lavc_codec_hwaccel_vdpau
 * Public libavcodec VDPAU header.
  }
{*
 * @defgroup lavc_codec_hwaccel_vdpau VDPAU Decoder and Renderer
 * @ingroup lavc_codec_hwaccel
 *
 * VDPAU hardware acceleration has two modules
 * - VDPAU decoding
 * - VDPAU presentation
 *
 * The VDPAU decoding module parses all headers using FFmpeg
 * parsing mechanisms and uses VDPAU for the actual decoding.
 *
 * As per the current implementation, the actual decoding
 * and rendering (API calls) are done as part of the VDPAU
 * presentation (vo_vdpau.c) module.
 *
 * @
  }
{$include <vdpau/vdpau.h>}
{$include "libavutil/avconfig.h"}
{$include "libavutil/attributes.h"}
{$include "avcodec.h"}
type
  PAVCodecContext = ^TAVCodecContext;
  TAVCodecContext = record
      {undefined structure}
    end;

  PAVFrame = ^TAVFrame;
  TAVFrame = record
      {undefined structure}
    end;

(* Const before type ignored *)
(* Const before type ignored *)

  TAVVDPAU_Render2 = function (para1:PAVCodecContext; para2:PAVFrame; para3:PVdpPictureInfo; para4:Tuint32_t; para5:PVdpBitstreamBuffer):longint;cdecl;
{*
 * This structure is used to share data between the libavcodec library and
 * the client video application.
 * The user shall allocate the structure via the av_alloc_vdpau_hwaccel
 * function and make it available as
 * AVCodecContext.hwaccel_context. Members can be set by the user once
 * during initialization or through each AVCodecContext.get_buffer()
 * function call. In any case, they must be valid prior to calling
 * decoding functions.
 *
 * The size of this structure is not a part of the public ABI and must not
 * be used outside of libavcodec. Use av_vdpau_alloc_context() to allocate an
 * AVVDPAUContext.
  }
{*
     * VDPAU decoder handle
     *
     * Set by user.
      }
{*
     * VDPAU decoder render callback
     *
     * Set by the user.
      }

  PAVVDPAUContext = ^TAVVDPAUContext;
  TAVVDPAUContext = record
      decoder : TVdpDecoder;
      render : PVdpDecoderRender;
      render2 : TAVVDPAU_Render2;
    end;
{*
 * @brief allocation function for AVVDPAUContext
 *
 * Allows extending the struct without breaking API/ABI
  }

function av_alloc_vdpaucontext:PAVVDPAUContext;cdecl;external;
(* Const before type ignored *)
function av_vdpau_hwaccel_get_render2(para1:PAVVDPAUContext):TAVVDPAU_Render2;cdecl;external;
procedure av_vdpau_hwaccel_set_render2(para1:PAVVDPAUContext; para2:TAVVDPAU_Render2);cdecl;external;
{*
 * Associate a VDPAU device with a codec context for hardware acceleration.
 * This function is meant to be called from the get_format() codec callback,
 * or earlier. It can also be called after avcodec_flush_buffers() to change
 * the underlying VDPAU device mid-stream (e.g. to recover from non-transparent
 * display preemption).
 *
 * @note get_format() must return AV_PIX_FMT_VDPAU if this function completes
 * successfully.
 *
 * @param avctx decoding context whose get_format() callback is invoked
 * @param device VDPAU device handle to use for hardware acceleration
 * @param get_proc_address VDPAU device driver
 * @param flags zero of more OR'd AV_HWACCEL_FLAG_* flags
 *
 * @return 0 on success, an AVERROR code on failure.
  }
function av_vdpau_bind_context(avctx:PAVCodecContext; device:TVdpDevice; get_proc_address:PVdpGetProcAddress; flags:dword):longint;cdecl;external;
{*
 * Gets the parameters to create an adequate VDPAU video surface for the codec
 * context using VDPAU hardware decoding acceleration.
 *
 * @note Behavior is undefined if the context was not successfully bound to a
 * VDPAU device using av_vdpau_bind_context().
 *
 * @param avctx the codec context being used for decoding the stream
 * @param type storage space for the VDPAU video surface chroma type
 *              (or NULL to ignore)
 * @param width storage space for the VDPAU video surface pixel width
 *              (or NULL to ignore)
 * @param height storage space for the VDPAU video surface pixel height
 *              (or NULL to ignore)
 *
 * @return 0 on success, a negative AVERROR code on failure.
  }
function av_vdpau_get_surface_parameters(avctx:PAVCodecContext; _type:PVdpChromaType; width:Puint32_t; height:Puint32_t):longint;cdecl;external;
{*
 * Allocate an AVVDPAUContext.
 *
 * @return Newly-allocated AVVDPAUContext or NULL on failure.
  }
function av_vdpau_alloc_context:PAVVDPAUContext;cdecl;external;
{* @  }
{$endif}
{ AVCODEC_VDPAU_H  }

implementation


end.
