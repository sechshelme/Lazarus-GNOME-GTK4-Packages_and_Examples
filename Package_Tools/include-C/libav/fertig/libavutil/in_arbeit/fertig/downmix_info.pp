
unit downmix_info;
interface

{
  Automatically converted by H2Pas 1.0.0 from downmix_info.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    downmix_info.h
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
PAVDownmixInfo  = ^AVDownmixInfo;
PAVDownmixType  = ^AVDownmixType;
PAVFrame  = ^AVFrame;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2014 Tim Walker <tdskywalker@gmail.com>
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
{$ifndef AVUTIL_DOWNMIX_INFO_H}
{$define AVUTIL_DOWNMIX_INFO_H}
{$include "frame.h"}
{*
 * @file
 * audio downmix medatata
  }
{*
 * @addtogroup lavu_audio
 * @
  }
{*
 * @defgroup downmix_info Audio downmix metadata
 * @
  }
{*
 * Possible downmix types.
  }
{*< Not indicated.  }
{*< Lo/Ro 2-channel downmix (Stereo).  }
{*< Lt/Rt 2-channel downmix, Dolby Surround compatible.  }
{*< Lt/Rt 2-channel downmix, Dolby Pro Logic II compatible.  }
{*< Number of downmix types. Not part of ABI.  }
type
  TAVDownmixType =  Longint;
  Const
    AV_DOWNMIX_TYPE_UNKNOWN = 0;
    AV_DOWNMIX_TYPE_LORO = 1;
    AV_DOWNMIX_TYPE_LTRT = 2;
    AV_DOWNMIX_TYPE_DPLII = 3;
    AV_DOWNMIX_TYPE_NB = 4;

{*
 * This structure describes optional metadata relevant to a downmix procedure.
 *
 * All fields are set by the decoder to the value indicated in the audio
 * bitstream (if present), or to a "sane" default otherwise.
  }
{*
     * Type of downmix preferred by the mastering engineer.
      }
{*
     * Absolute scale factor representing the nominal level of the center
     * channel during a regular downmix.
      }
{*
     * Absolute scale factor representing the nominal level of the center
     * channel during an Lt/Rt compatible downmix.
      }
{*
     * Absolute scale factor representing the nominal level of the surround
     * channels during a regular downmix.
      }
{*
     * Absolute scale factor representing the nominal level of the surround
     * channels during an Lt/Rt compatible downmix.
      }
{*
     * Absolute scale factor representing the level at which the LFE data is
     * mixed into L/R channels during downmixing.
      }
type
  PAVDownmixInfo = ^TAVDownmixInfo;
  TAVDownmixInfo = record
      preferred_downmix_type : TAVDownmixType;
      center_mix_level : Tdouble;
      center_mix_level_ltrt : Tdouble;
      surround_mix_level : Tdouble;
      surround_mix_level_ltrt : Tdouble;
      lfe_mix_level : Tdouble;
    end;
{*
 * Get a frame's AV_FRAME_DATA_DOWNMIX_INFO side data for editing.
 *
 * If the side data is absent, it is created and added to the frame.
 *
 * @param frame the frame for which the side data is to be obtained or created
 *
 * @return the AVDownmixInfo structure to be edited by the caller, or NULL if
 *         the structure cannot be allocated.
  }

function av_downmix_info_update_side_data(frame:PAVFrame):PAVDownmixInfo;cdecl;external;
{*
 * @
  }
{*
 * @
  }
{$endif}
{ AVUTIL_DOWNMIX_INFO_H  }

implementation


end.
