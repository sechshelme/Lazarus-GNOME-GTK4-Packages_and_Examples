
unit dirac;
interface

{
  Automatically converted by H2Pas 1.0.0 from dirac.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dirac.h
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
PAVDiracSeqHeader  = ^AVDiracSeqHeader;
PDiracParseCodes  = ^DiracParseCodes;
PDiracVersionInfo  = ^DiracVersionInfo;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2007 Marco Gerards <marco@gnu.org>
 * Copyright (C) 2009 David Conrad
 * Copyright (C) 2011 Jordi Ortiz
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
{$ifndef AVCODEC_DIRAC_H}
{$define AVCODEC_DIRAC_H}
{*
 * @file
 * Interface to Dirac Decoder/Encoder
 * @author Marco Gerards <marco@gnu.org>
 * @author David Conrad
 * @author Jordi Ortiz
  }
{$include <stddef.h>}
{$include <stdint.h>}
{$include "libavutil/pixfmt.h"}
{$include "libavutil/rational.h"}
{*
 * The spec limits the number of wavelet decompositions to 4 for both
 * level 1 (VC-2) and 128 (long-gop default).
 * 5 decompositions is the maximum before >16-bit buffers are needed.
 * Schroedinger allows this for DD 9,7 and 13,7 wavelets only, limiting
 * the others to 4 decompositions (or 3 for the fidelity filter).
 *
 * We use this instead of MAX_DECOMPOSITIONS to save some memory.
  }

const
  MAX_DWT_LEVELS = 5;  
{*
 * Parse code values:
 *
 * Dirac Specification ->
 * 9.6.1  Table 9.1
 *
 * VC-2 Specification  ->
 * 10.4.1 Table 10.1
  }
type
  TDiracParseCodes =  Longint;
  Const
    DIRAC_PCODE_SEQ_HEADER = $00;
    DIRAC_PCODE_END_SEQ = $10;
    DIRAC_PCODE_AUX = $20;
    DIRAC_PCODE_PAD = $30;
    DIRAC_PCODE_PICTURE_CODED = $08;
    DIRAC_PCODE_PICTURE_RAW = $48;
    DIRAC_PCODE_PICTURE_LOW_DEL = $C8;
    DIRAC_PCODE_PICTURE_HQ = $E8;
    DIRAC_PCODE_INTER_NOREF_CO1 = $0A;
    DIRAC_PCODE_INTER_NOREF_CO2 = $09;
    DIRAC_PCODE_INTER_REF_CO1 = $0D;
    DIRAC_PCODE_INTER_REF_CO2 = $0E;
    DIRAC_PCODE_INTRA_REF_CO = $0C;
    DIRAC_PCODE_INTRA_REF_RAW = $4C;
    DIRAC_PCODE_INTRA_REF_PICT = $CC;
    DIRAC_PCODE_MAGIC = $42424344;

type
  PDiracVersionInfo = ^TDiracVersionInfo;
  TDiracVersionInfo = record
      major : longint;
      minor : longint;
    end;
{/< 0: 444  1: 422  2: 420 }
{/< index into dirac_frame_rate[] }
{/< index into dirac_aspect_ratio[] }
{/< index into dirac_pixel_range_presets[] }
{/< index into dirac_color_spec_presets[] }

  PAVDiracSeqHeader = ^TAVDiracSeqHeader;
  TAVDiracSeqHeader = record
      width : dword;
      height : dword;
      chroma_format : Tuint8_t;
      interlaced : Tuint8_t;
      top_field_first : Tuint8_t;
      frame_rate_index : Tuint8_t;
      aspect_ratio_index : Tuint8_t;
      clean_width : Tuint16_t;
      clean_height : Tuint16_t;
      clean_left_offset : Tuint16_t;
      clean_right_offset : Tuint16_t;
      pixel_range_index : Tuint8_t;
      color_spec_index : Tuint8_t;
      profile : longint;
      level : longint;
      framerate : TAVRational;
      sample_aspect_ratio : TAVRational;
      pix_fmt : TAVPixelFormat;
      color_range : TAVColorRange;
      color_primaries : TAVColorPrimaries;
      color_trc : TAVColorTransferCharacteristic;
      colorspace : TAVColorSpace;
      version : TDiracVersionInfo;
      bit_depth : longint;
    end;
{*
 * Parse a Dirac sequence header.
 *
 * @param dsh this function will allocate and fill an AVDiracSeqHeader struct
 *            and write it into this pointer. The caller must free it with
 *            av_free().
 * @param buf the data buffer
 * @param buf_size the size of the data buffer in bytes
 * @param log_ctx if non-NULL, this function will log errors here
 * @return 0 on success, a negative AVERROR code on failure
  }
(* Const before type ignored *)

function av_dirac_parse_sequence_header(dsh:PPAVDiracSeqHeader; buf:Puint8_t; buf_size:Tsize_t; log_ctx:pointer):longint;cdecl;external;
{$endif}
{ AVCODEC_DIRAC_H  }

implementation


end.
