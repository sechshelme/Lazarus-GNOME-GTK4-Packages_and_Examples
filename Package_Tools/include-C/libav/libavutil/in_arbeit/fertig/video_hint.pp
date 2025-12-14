
unit video_hint;
interface

{
  Automatically converted by H2Pas 1.0.0 from video_hint.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    video_hint.h
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
PAVVideoHint  = ^AVVideoHint;
PAVVideoHintType  = ^AVVideoHintType;
PAVVideoRect  = ^AVVideoRect;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Copyright 2023 Elias Carotti <eliascrt at amazon dot it>
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
{$ifndef AVUTIL_VIDEO_HINT_H}
{$define AVUTIL_VIDEO_HINT_H}
{$include <stddef.h>}
{$include <stdint.h>}
{$include "libavutil/avassert.h"}
{$include "libavutil/frame.h"}
type
  PAVVideoRect = ^TAVVideoRect;
  TAVVideoRect = record
      x : Tuint32_t;
      y : Tuint32_t;
      width : Tuint32_t;
      height : Tuint32_t;
    end;
{ rectangled delimit the constant areas (unchanged), default is changed  }
{ rectangled delimit the constant areas (changed), default is not changed  }

  PAVVideoHintType = ^TAVVideoHintType;
  TAVVideoHintType =  Longint;
  Const
    AV_VIDEO_HINT_TYPE_CONSTANT = 0;
    AV_VIDEO_HINT_TYPE_CHANGED = 1;
;
{*
     * Number of AVVideoRect present.
     *
     * May be 0, in which case no per-rectangle information is present. In this
     * case the values of rect_offset / rect_size are unspecified and should
     * not be accessed.
      }
{*
     * Offset in bytes from the beginning of this structure at which the array
     * of AVVideoRect starts.
      }
{*
     * Size in bytes of AVVideoRect.
      }
type
  PAVVideoHint = ^TAVVideoHint;
  TAVVideoHint = record
      nb_rects : Tsize_t;
      rect_offset : Tsize_t;
      rect_size : Tsize_t;
      _type : TAVVideoHintType;
    end;
{*
 * Allocate memory for the AVVideoHint struct along with an nb_rects-sized
 * arrays of AVVideoRect.
 *
 * The side data contains a list of rectangles for the portions of the frame
 * which changed from the last encoded one (and the remainder are assumed to be
 * changed), or, alternately (depending on the type parameter) the unchanged
 * ones (and the remanining ones are those which changed).
 * Macroblocks will thus be hinted either to be P_SKIP-ped or go through the
 * regular encoding procedure.
 *
 * It's responsibility of the caller to fill the AVRects accordingly, and to set
 * the proper AVVideoHintType field.
 *
 * @param out_size if non-NULL, the size in bytes of the resulting data array is
 *                 written here
 *
 * @return newly allocated AVVideoHint struct (must be freed by the caller using
 *         av_free()) on success, NULL on memory allocation failure
  }

function av_video_hint_alloc(nb_rects:Tsize_t; out_size:Psize_t):PAVVideoHint;cdecl;external;
{*
 * Same as av_video_hint_alloc(), except newly-allocated AVVideoHint is attached
 * as side data of type AV_FRAME_DATA_VIDEO_HINT_INFO to frame.
  }
function av_video_hint_create_side_data(frame:PAVFrame; nb_rects:Tsize_t):PAVVideoHint;cdecl;external;
{$endif}
{ AVUTIL_VIDEO_HINT_H  }

implementation


end.
