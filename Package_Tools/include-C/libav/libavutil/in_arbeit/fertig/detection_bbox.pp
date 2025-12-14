
unit detection_bbox;
interface

{
  Automatically converted by H2Pas 1.0.0 from detection_bbox.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    detection_bbox.h
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
PAVDetectionBBox  = ^AVDetectionBBox;
PAVDetectionBBoxHeader  = ^AVDetectionBBoxHeader;
PAVFrame  = ^AVFrame;
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
{$ifndef AVUTIL_DETECTION_BBOX_H}
{$define AVUTIL_DETECTION_BBOX_H}
{$include "rational.h"}
{$include "avassert.h"}
{$include "frame.h"}
{*
     * Distance in pixels from the left/top edge of the frame,
     * together with width and height, defining the bounding box.
      }
{*
     * Detect result with confidence
      }
{*
     * At most 4 classifications based on the detected bounding box.
     * For example, we can get max 4 different attributes with 4 different
     * DNN models on one bounding box.
     * classify_count is zero if no classification.
      }
type
  PAVDetectionBBox = ^TAVDetectionBBox;
  TAVDetectionBBox = record
      x : longint;
      y : longint;
      w : longint;
      h : longint;
      detect_label : array[0..(AV_DETECTION_BBOX_LABEL_NAME_MAX_SIZE)-1] of char;
      detect_confidence : TAVRational;
      classify_count : Tuint32_t;
      classify_labels : array[0..(AV_NUM_DETECTION_BBOX_CLASSIFY)-1] of array[0..(AV_DETECTION_BBOX_LABEL_NAME_MAX_SIZE)-1] of char;
      classify_confidences : array[0..(AV_NUM_DETECTION_BBOX_CLASSIFY)-1] of TAVRational;
    end;

const
  AV_DETECTION_BBOX_LABEL_NAME_MAX_SIZE = 64;  
  AV_NUM_DETECTION_BBOX_CLASSIFY = 4;  
{*
     * Information about how the bounding box is generated.
     * for example, the DNN model name.
      }
{*
     * Number of bounding boxes in the array.
      }
{*
     * Offset in bytes from the beginning of this structure at which
     * the array of bounding boxes starts.
      }
{*
     * Size of each bounding box in bytes.
      }
type
  PAVDetectionBBoxHeader = ^TAVDetectionBBoxHeader;
  TAVDetectionBBoxHeader = record
      source : array[0..255] of char;
      nb_bboxes : Tuint32_t;
      bboxes_offset : Tsize_t;
      bbox_size : Tsize_t;
    end;
{
 * Get the bounding box at the specified @code idx. Must be between 0 and nb_bboxes.
  }
{*
 * Allocates memory for AVDetectionBBoxHeader, plus an array of @code nb_bboxes
 * AVDetectionBBox, and initializes the variables.
 * Can be freed with a normal av_free() call.
 *
 * @param nb_bboxes number of AVDetectionBBox structures to allocate
 * @param out_size if non-NULL, the size in bytes of the resulting data array is
 * written here.
  }

function av_detection_bbox_alloc(nb_bboxes:Tuint32_t; out_size:Psize_t):PAVDetectionBBoxHeader;cdecl;external;
{*
 * Allocates memory for AVDetectionBBoxHeader, plus an array of @code nb_bboxes
 * AVDetectionBBox, in the given AVFrame @code frame as AVFrameSideData of type
 * AV_FRAME_DATA_DETECTION_BBOXES and initializes the variables.
  }
function av_detection_bbox_create_side_data(frame:PAVFrame; nb_bboxes:Tuint32_t):PAVDetectionBBoxHeader;cdecl;external;
{$endif}

implementation


end.
