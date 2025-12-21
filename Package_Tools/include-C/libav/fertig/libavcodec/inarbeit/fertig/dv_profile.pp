
unit dv_profile;
interface

{
  Automatically converted by H2Pas 1.0.0 from dv_profile.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dv_profile.h
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
PAVDVProfile  = ^AVDVProfile;
Puint8_t  = ^uint8_t;
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
{$ifndef AVCODEC_DV_PROFILE_H}
{$define AVCODEC_DV_PROFILE_H}
{$include <stdint.h>}
{$include "libavutil/pixfmt.h"}
{$include "libavutil/rational.h"}
{ minimum number of bytes to read from a DV stream in order to
 * determine the profile  }
{ 6 DIF blocks  }

const
  DV_PROFILE_BYTES = 6*80;  
{
 * AVDVProfile is used to express the differences between various
 * DV flavors. For now it's primarily used for differentiating
 * 525/60 and 625/50, but the plans are to use it for various
 * DV specs as well (e.g. SMPTE314M vs. IEC 61834).
  }
{ value of the dsf in the DV header  }
{ stype for VAUX source pack  }
{ total size of one frame in bytes  }
{ number of DIF segments per DIF channel  }
{ number of DIF channels per frame  }
{ 1/framerate  }
{ FPS from the LTS standpoint  }
{ picture height in pixels  }
{ picture width in pixels  }
{ sample aspect ratios for 4:3 and 16:9  }
{ picture pixel format  }
{ blocks per macroblock  }
(* Const before type ignored *)
{ AC block sizes, in bits  }
{ size of audio_shuffle table  }
{ min amount of audio samples  }
{ for 48kHz, 44.1kHz and 32kHz  }
{ how many samples are supposed to be  }
{ in each frame in a 5 frames window  }
(* Const before type ignored *)
{ PCM shuffling table  }
type
  PAVDVProfile = ^TAVDVProfile;
  TAVDVProfile = record
      dsf : longint;
      video_stype : longint;
      frame_size : longint;
      difseg_size : longint;
      n_difchan : longint;
      time_base : TAVRational;
      ltc_divisor : longint;
      height : longint;
      width : longint;
      sar : array[0..1] of TAVRational;
      pix_fmt : TAVPixelFormat;
      bpm : longint;
      block_sizes : Puint8_t;
      audio_stride : longint;
      audio_min_samples : array[0..2] of longint;
      audio_samples_dist : array[0..4] of longint;
      audio_shuffle : ^array[0..8] of Tuint8_t;
    end;
{*
 * Get a DV profile for the provided compressed frame.
 *
 * @param sys the profile used for the previous frame, may be NULL
 * @param frame the compressed data buffer
 * @param buf_size size of the buffer in bytes
 * @return the DV profile for the supplied data or NULL on failure
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function av_dv_frame_profile(sys:PAVDVProfile; frame:Puint8_t; buf_size:dword):PAVDVProfile;cdecl;external;
{*
 * Get a DV profile for the provided stream parameters.
  }
(* Const before type ignored *)
function av_dv_codec_profile(width:longint; height:longint; pix_fmt:TAVPixelFormat):PAVDVProfile;cdecl;external;
{*
 * Get a DV profile for the provided stream parameters.
 * The frame rate is used as a best-effort parameter.
  }
(* Const before type ignored *)
function av_dv_codec_profile2(width:longint; height:longint; pix_fmt:TAVPixelFormat; frame_rate:TAVRational):PAVDVProfile;cdecl;external;
{$endif}
{ AVCODEC_DV_PROFILE_H  }

implementation


end.
