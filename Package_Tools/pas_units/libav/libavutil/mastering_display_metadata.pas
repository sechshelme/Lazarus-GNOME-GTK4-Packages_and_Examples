unit mastering_display_metadata;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2016 Neil Birkbeck <neil.birkbeck@gmail.com>
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
{$ifndef AVUTIL_MASTERING_DISPLAY_METADATA_H}
{$define AVUTIL_MASTERING_DISPLAY_METADATA_H}
{$include "frame.h"}
{$include "rational.h"}
{*
 * Mastering display metadata capable of representing the color volume of
 * the display used to master the content (SMPTE 2086:2014).
 *
 * To be used as payload of a AVFrameSideData or AVPacketSideData with the
 * appropriate type.
 *
 * @note The struct should be allocated with av_mastering_display_metadata_alloc()
 *       and its size is not a part of the public ABI.
  }
{*
     * CIE 1931 xy chromaticity coords of color primaries (r, g, b order).
      }
{*
     * CIE 1931 xy chromaticity coords of white point.
      }
{*
     * Min luminance of mastering display (cd/m^2).
      }
{*
     * Max luminance of mastering display (cd/m^2).
      }
{*
     * Flag indicating whether the display primaries (and white point) are set.
      }
{*
     * Flag indicating whether the luminance (min_ and max_) have been set.
      }
type
  PAVMasteringDisplayMetadata = ^TAVMasteringDisplayMetadata;
  TAVMasteringDisplayMetadata = record
      display_primaries : array[0..2] of array[0..1] of TAVRational;
      white_point : array[0..1] of TAVRational;
      min_luminance : TAVRational;
      max_luminance : TAVRational;
      has_primaries : longint;
      has_luminance : longint;
    end;
{*
 * Allocate an AVMasteringDisplayMetadata structure and set its fields to
 * default values. The resulting struct can be freed using av_freep().
 *
 * @return An AVMasteringDisplayMetadata filled with default values or NULL
 *         on failure.
  }

function av_mastering_display_metadata_alloc:PAVMasteringDisplayMetadata;cdecl;external libavutil;
{*
 * Allocate a complete AVMasteringDisplayMetadata and add it to the frame.
 *
 * @param frame The frame which side data is added to.
 *
 * @return The AVMasteringDisplayMetadata structure to be filled by caller.
  }
function av_mastering_display_metadata_create_side_data(frame:PAVFrame):PAVMasteringDisplayMetadata;cdecl;external libavutil;
{*
 * Content light level needed by to transmit HDR over HDMI (CTA-861.3).
 *
 * To be used as payload of a AVFrameSideData or AVPacketSideData with the
 * appropriate type.
 *
 * @note The struct should be allocated with av_content_light_metadata_alloc()
 *       and its size is not a part of the public ABI.
  }
{*
     * Max content light level (cd/m^2).
      }
{*
     * Max average light level per frame (cd/m^2).
      }
type
  PAVContentLightMetadata = ^TAVContentLightMetadata;
  TAVContentLightMetadata = record
      MaxCLL : dword;
      MaxFALL : dword;
    end;
{*
 * Allocate an AVContentLightMetadata structure and set its fields to
 * default values. The resulting struct can be freed using av_freep().
 *
 * @return An AVContentLightMetadata filled with default values or NULL
 *         on failure.
  }

function av_content_light_metadata_alloc(size:Psize_t):PAVContentLightMetadata;cdecl;external libavutil;
{*
 * Allocate a complete AVContentLightMetadata and add it to the frame.
 *
 * @param frame The frame which side data is added to.
 *
 * @return The AVContentLightMetadata structure to be filled by caller.
  }
function av_content_light_metadata_create_side_data(frame:PAVFrame):PAVContentLightMetadata;cdecl;external libavutil;
{$endif}
{ AVUTIL_MASTERING_DISPLAY_METADATA_H  }

// === Konventiert am: 14-12-25 17:31:16 ===


implementation



end.
