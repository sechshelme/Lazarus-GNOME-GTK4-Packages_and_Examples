unit ambient_viewing_environment;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2023 Jan Ekström <jeebjp@gmail.com>
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
{$ifndef AVUTIL_AMBIENT_VIEWING_ENVIRONMENT_H}
{$define AVUTIL_AMBIENT_VIEWING_ENVIRONMENT_H}
{$include <stddef.h>}
{$include "frame.h"}
{$include "rational.h"}
{*
 * Ambient viewing environment metadata as defined by H.274. The values are
 * saved in AVRationals so that they keep their exactness, while allowing for
 * easy access to a double value with f.ex. av_q2d.
 *
 * @note sizeof(AVAmbientViewingEnvironment) is not part of the public ABI, and
 *       it must be allocated using av_ambient_viewing_environment_alloc.
  }
{*
     * Environmental illuminance of the ambient viewing environment in lux.
      }
{*
     * Normalized x chromaticity coordinate of the environmental ambient light
     * in the nominal viewing environment according to the CIE 1931 definition
     * of x and y as specified in ISO/CIE 11664-1.
      }
{*
     * Normalized y chromaticity coordinate of the environmental ambient light
     * in the nominal viewing environment according to the CIE 1931 definition
     * of x and y as specified in ISO/CIE 11664-1.
      }
type
  PAVAmbientViewingEnvironment = ^TAVAmbientViewingEnvironment;
  TAVAmbientViewingEnvironment = record
      ambient_illuminance : TAVRational;
      ambient_light_x : TAVRational;
      ambient_light_y : TAVRational;
    end;
{*
 * Allocate an AVAmbientViewingEnvironment structure.
 *
 * @return the newly allocated struct or NULL on failure
  }

function av_ambient_viewing_environment_alloc(size:Psize_t):PAVAmbientViewingEnvironment;cdecl;external libavutil;
{*
 * Allocate and add an AVAmbientViewingEnvironment structure to an existing
 * AVFrame as side data.
 *
 * @return the newly allocated struct, or NULL on failure
  }
function av_ambient_viewing_environment_create_side_data(frame:PAVFrame):PAVAmbientViewingEnvironment;cdecl;external libavutil;
{$endif}
{ AVUTIL_AMBIENT_VIEWING_ENVIRONMENT_H  }

// === Konventiert am: 14-12-25 16:00:12 ===


implementation



end.
