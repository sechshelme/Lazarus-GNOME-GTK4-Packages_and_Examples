unit stereo3d;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2013 Vittorio Giovara <vittorio.giovara@gmail.com>
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
{*
 * @file
 * @ingroup lavu_video_stereo3d
 * Stereoscopic video
  }
{$ifndef AVUTIL_STEREO3D_H}
{$define AVUTIL_STEREO3D_H}
{$include <stdint.h>}
{$include "frame.h"}
{*
 * @defgroup lavu_video_stereo3d Stereo3D types and functions
 * @ingroup lavu_video
 *
 * A stereoscopic video file consists in multiple views embedded in a single
 * frame, usually describing two views of a scene. This file describes all
 * possible codec-independent view arrangements.
 *
 * @
  }
{*
 * List of possible 3D Types
  }
{*
     * Video is not stereoscopic (and metadata has to be there).
      }
{*
     * Views are next to each other.
     *
     * @code.unparsed
     *    LLLLRRRR
     *    LLLLRRRR
     *    LLLLRRRR
     *    ...
     * @endcode
      }
{*
     * Views are on top of each other.
     *
     * @code.unparsed
     *    LLLLLLLL
     *    LLLLLLLL
     *    RRRRRRRR
     *    RRRRRRRR
     * @endcode
      }
{*
     * Views are alternated temporally.
     *
     * @code.unparsed
     *     frame0   frame1   frame2   ...
     *    LLLLLLLL RRRRRRRR LLLLLLLL
     *    LLLLLLLL RRRRRRRR LLLLLLLL
     *    LLLLLLLL RRRRRRRR LLLLLLLL
     *    ...      ...      ...
     * @endcode
      }
{*
     * Views are packed in a checkerboard-like structure per pixel.
     *
     * @code.unparsed
     *    LRLRLRLR
     *    RLRLRLRL
     *    LRLRLRLR
     *    ...
     * @endcode
      }
{*
     * Views are next to each other, but when upscaling
     * apply a checkerboard pattern.
     *
     * @code.unparsed
     *     LLLLRRRR          L L L L    R R R R
     *     LLLLRRRR    =>     L L L L  R R R R
     *     LLLLRRRR          L L L L    R R R R
     *     LLLLRRRR           L L L L  R R R R
     * @endcode
      }
{*
     * Views are packed per line, as if interlaced.
     *
     * @code.unparsed
     *    LLLLLLLL
     *    RRRRRRRR
     *    LLLLLLLL
     *    ...
     * @endcode
      }
{*
     * Views are packed per column.
     *
     * @code.unparsed
     *    LRLRLRLR
     *    LRLRLRLR
     *    LRLRLRLR
     *    ...
     * @endcode
      }
type
  TAVStereo3DType =  Longint;
  Const
    AV_STEREO3D_2D = 0;
    AV_STEREO3D_SIDEBYSIDE = 1;
    AV_STEREO3D_TOPBOTTOM = 2;
    AV_STEREO3D_FRAMESEQUENCE = 3;
    AV_STEREO3D_CHECKERBOARD = 4;
    AV_STEREO3D_SIDEBYSIDE_QUINCUNX = 5;
    AV_STEREO3D_LINES = 6;
    AV_STEREO3D_COLUMNS = 7;

{*
 * List of possible view types.
  }
{*
     * Frame contains two packed views.
      }
{*
     * Frame contains only the left view.
      }
{*
     * Frame contains only the right view.
      }
type
  TAVStereo3DView =  Longint;
  Const
    AV_STEREO3D_VIEW_PACKED = 0;
    AV_STEREO3D_VIEW_LEFT = 1;
    AV_STEREO3D_VIEW_RIGHT = 2;

{*
 * Inverted views, Right/Bottom represents the left view.
  }
  AV_STEREO3D_FLAG_INVERT = 1 shl 0;  
{*
 * Stereo 3D type: this structure describes how two videos are packed
 * within a single video surface, with additional information as needed.
 *
 * @note The struct must be allocated with av_stereo3d_alloc() and
 *       its size is not a part of the public ABI.
  }
{*
     * How views are packed within the video.
      }
{*
     * Additional information about the frame packing.
      }
{*
     * Determines which views are packed.
      }
type
  PAVStereo3D = ^TAVStereo3D;
  TAVStereo3D = record
      _type : TAVStereo3DType;
      flags : longint;
      view : TAVStereo3DView;
    end;
{*
 * Allocate an AVStereo3D structure and set its fields to default values.
 * The resulting struct can be freed using av_freep().
 *
 * @return An AVStereo3D filled with default values or NULL on failure.
  }

function av_stereo3d_alloc:PAVStereo3D;cdecl;external libavutil;
{*
 * Allocate a complete AVFrameSideData and add it to the frame.
 *
 * @param frame The frame which side data is added to.
 *
 * @return The AVStereo3D structure to be filled by caller.
  }
function av_stereo3d_create_side_data(frame:PAVFrame):PAVStereo3D;cdecl;external libavutil;
{*
 * Provide a human-readable name of a given stereo3d type.
 *
 * @param type The input stereo3d type value.
 *
 * @return The name of the stereo3d value, or "unknown".
  }
function av_stereo3d_type_name(_type:dword):Pchar;cdecl;external libavutil;
{*
 * Get the AVStereo3DType form a human-readable name.
 *
 * @param name The input string.
 *
 * @return The AVStereo3DType value, or -1 if not found.
  }
function av_stereo3d_from_name(name:Pchar):longint;cdecl;external libavutil;
{*
 * @
  }
{$endif}
{ AVUTIL_STEREO3D_H  }

// === Konventiert am: 14-12-25 17:37:22 ===


implementation



end.
