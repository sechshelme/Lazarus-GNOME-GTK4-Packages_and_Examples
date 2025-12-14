
unit video_enc_params;
interface

{
  Automatically converted by H2Pas 1.0.0 from video_enc_params.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    video_enc_params.h
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
PAVVideoBlockParams  = ^AVVideoBlockParams;
PAVVideoEncParams  = ^AVVideoEncParams;
PAVVideoEncParamsType  = ^AVVideoEncParamsType;
Psize_t  = ^size_t;
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
{$ifndef AVUTIL_VIDEO_ENC_PARAMS_H}
{$define AVUTIL_VIDEO_ENC_PARAMS_H}
{$include <stddef.h>}
{$include <stdint.h>}
{$include "libavutil/avassert.h"}
{$include "libavutil/frame.h"}
{*
     * VP9 stores:
     * - per-frame base (luma AC) quantizer index, exported as AVVideoEncParams.qp
     * - deltas for luma DC, chroma AC and chroma DC, exported in the
     *   corresponding entries in AVVideoEncParams.delta_qp
     * - per-segment delta, exported as for each block as AVVideoBlockParams.delta_qp
     *
     * To compute the resulting quantizer index for a block:
     * - for luma AC, add the base qp and the per-block delta_qp, saturating to
     *   unsigned 8-bit.
     * - for luma DC and chroma AC/DC, add the corresponding
     *   AVVideoBlockParams.delta_qp to the luma AC index, again saturating to
     *   unsigned 8-bit.
      }
{*
     * H.264 stores:
     * - in PPS (per-picture):
     *   * initial QP_Y (luma) value, exported as AVVideoEncParams.qp
     *   * delta(s) for chroma QP values (same for both, or each separately),
     *     exported as in the corresponding entries in AVVideoEncParams.delta_qp
     * - per-slice QP delta, not exported directly, added to the per-MB value
     * - per-MB delta; not exported directly; the final per-MB quantizer
     *   parameter - QP_Y - minus the value in AVVideoEncParams.qp is exported
     *   as AVVideoBlockParams.qp_delta.
      }
{
     * MPEG-2-compatible quantizer.
     *
     * Summing the frame-level qp with the per-block delta_qp gives the
     * resulting quantizer for the block.
      }
type
  TAVVideoEncParamsType =  Longint;
  Const
    AV_VIDEO_ENC_PARAMS_NONE = -(1);
    AV_VIDEO_ENC_PARAMS_VP9 = (-(1))+1;
    AV_VIDEO_ENC_PARAMS_H264 = (-(1))+2;
    AV_VIDEO_ENC_PARAMS_MPEG2 = (-(1))+3;

{*
 * Video encoding parameters for a given frame. This struct is allocated along
 * with an optional array of per-block AVVideoBlockParams descriptors.
 * Must be allocated with av_video_enc_params_alloc().
  }
{*
     * Number of blocks in the array.
     *
     * May be 0, in which case no per-block information is present. In this case
     * the values of blocks_offset / block_size are unspecified and should not
     * be accessed.
      }
{*
     * Offset in bytes from the beginning of this structure at which the array
     * of blocks starts.
      }
{
     * Size of each block in bytes. May not match sizeof(AVVideoBlockParams).
      }
{*
     * Type of the parameters (the codec they are used with).
      }
{*
     * Base quantisation parameter for the frame. The final quantiser for a
     * given block in a given plane is obtained from this value, possibly
     * combined with @code delta_qp and the per-block delta in a manner
     * documented for each type.
      }
{*
     * Quantisation parameter offset from the base (per-frame) qp for a given
     * plane (first index) and AC/DC coefficients (second index).
      }
type
  PAVVideoEncParams = ^TAVVideoEncParams;
  TAVVideoEncParams = record
      nb_blocks : dword;
      blocks_offset : Tsize_t;
      block_size : Tsize_t;
      _type : TAVVideoEncParamsType;
      qp : Tint32_t;
      delta_qp : array[0..3] of array[0..1] of Tint32_t;
    end;
{*
 * Data structure for storing block-level encoding information.
 * It is allocated as a part of AVVideoEncParams and should be retrieved with
 * av_video_enc_params_block().
 *
 * sizeof(AVVideoBlockParams) is not a part of the ABI and new fields may be
 * added to it.
  }
{*
     * Distance in luma pixels from the top-left corner of the visible frame
     * to the top-left corner of the block.
     * Can be negative if top/right padding is present on the coded frame.
      }
{*
     * Width and height of the block in luma pixels.
      }
{*
     * Difference between this block's final quantization parameter and the
     * corresponding per-frame value.
      }

  PAVVideoBlockParams = ^TAVVideoBlockParams;
  TAVVideoBlockParams = record
      src_x : longint;
      src_y : longint;
      w : longint;
      h : longint;
      delta_qp : Tint32_t;
    end;
{*
 * Get the block at the specified @code idx. Must be between 0 and nb_blocks - 1.
  }
{*
 * Allocates memory for AVVideoEncParams of the given type, plus an array of
 * @code nb_blocks AVVideoBlockParams and initializes the variables. Can be
 * freed with a normal av_free() call.
 *
 * @param out_size if non-NULL, the size in bytes of the resulting data array is
 * written here.
  }

function av_video_enc_params_alloc(_type:TAVVideoEncParamsType; nb_blocks:dword; out_size:Psize_t):PAVVideoEncParams;cdecl;external;
{*
 * Allocates memory for AVEncodeInfoFrame plus an array of
 * @code nb_blocks AVEncodeInfoBlock in the given AVFrame @code frame
 * as AVFrameSideData of type AV_FRAME_DATA_VIDEO_ENC_PARAMS
 * and initializes the variables.
  }
function av_video_enc_params_create_side_data(frame:PAVFrame; _type:TAVVideoEncParamsType; nb_blocks:dword):PAVVideoEncParams;cdecl;external;
{$endif}
{ AVUTIL_VIDEO_ENC_PARAMS_H  }

implementation


end.
