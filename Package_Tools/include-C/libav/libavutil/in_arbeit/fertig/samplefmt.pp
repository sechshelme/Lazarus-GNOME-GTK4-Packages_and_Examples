
unit samplefmt;
interface

{
  Automatically converted by H2Pas 1.0.0 from samplefmt.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    samplefmt.h
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
PAVSampleFormat  = ^AVSampleFormat;
Pchar  = ^char;
Plongint  = ^longint;
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
{$ifndef AVUTIL_SAMPLEFMT_H}
{$define AVUTIL_SAMPLEFMT_H}
{$include <stdint.h>}
{*
 * @addtogroup lavu_audio
 * @
 *
 * @defgroup lavu_sampfmts Audio sample formats
 *
 * Audio sample format enumeration and related convenience functions.
 * @
  }
{*
 * Audio sample formats
 *
 * - The data described by the sample format is always in native-endian order.
 *   Sample values can be expressed by native C types, hence the lack of a signed
 *   24-bit sample format even though it is a common raw audio data format.
 *
 * - The floating-point formats are based on full volume being in the range
 *   [-1.0, 1.0]. Any values outside this range are beyond full volume level.
 *
 * - The data layout as used in av_samples_fill_arrays() and elsewhere in FFmpeg
 *   (such as AVFrame in libavcodec) is as follows:
 *
 * @par
 * For planar sample formats, each audio channel is in a separate data plane,
 * and linesize is the buffer size, in bytes, for a single plane. All data
 * planes must be the same size. For packed sample formats, only the first data
 * plane is used, and samples for each channel are interleaved. In this case,
 * linesize is the buffer size, in bytes, for the 1 plane.
 *
  }
{/< unsigned 8 bits }
{/< signed 16 bits }
{/< signed 32 bits }
{/< float }
{/< double }
{/< unsigned 8 bits, planar }
{/< signed 16 bits, planar }
{/< signed 32 bits, planar }
{/< float, planar }
{/< double, planar }
{/< signed 64 bits }
{/< signed 64 bits, planar }
{/< Number of sample formats. DO NOT USE if linking dynamically }
type
  TAVSampleFormat =  Longint;
  Const
    AV_SAMPLE_FMT_NONE = -(1);
    AV_SAMPLE_FMT_U8 = (-(1))+1;
    AV_SAMPLE_FMT_S16 = (-(1))+2;
    AV_SAMPLE_FMT_S32 = (-(1))+3;
    AV_SAMPLE_FMT_FLT = (-(1))+4;
    AV_SAMPLE_FMT_DBL = (-(1))+5;
    AV_SAMPLE_FMT_U8P = (-(1))+6;
    AV_SAMPLE_FMT_S16P = (-(1))+7;
    AV_SAMPLE_FMT_S32P = (-(1))+8;
    AV_SAMPLE_FMT_FLTP = (-(1))+9;
    AV_SAMPLE_FMT_DBLP = (-(1))+10;
    AV_SAMPLE_FMT_S64 = (-(1))+11;
    AV_SAMPLE_FMT_S64P = (-(1))+12;
    AV_SAMPLE_FMT_NB = (-(1))+13;

{*
 * Return the name of sample_fmt, or NULL if sample_fmt is not
 * recognized.
  }
(* Const before type ignored *)

function av_get_sample_fmt_name(sample_fmt:TAVSampleFormat):Pchar;cdecl;external;
{*
 * Return a sample format corresponding to name, or AV_SAMPLE_FMT_NONE
 * on error.
  }
(* Const before type ignored *)
function av_get_sample_fmt(name:Pchar):TAVSampleFormat;cdecl;external;
{*
 * Return the planar<->packed alternative form of the given sample format, or
 * AV_SAMPLE_FMT_NONE on error. If the passed sample_fmt is already in the
 * requested planar/packed format, the format returned is the same as the
 * input.
  }
function av_get_alt_sample_fmt(sample_fmt:TAVSampleFormat; planar:longint):TAVSampleFormat;cdecl;external;
{*
 * Get the packed alternative form of the given sample format.
 *
 * If the passed sample_fmt is already in packed format, the format returned is
 * the same as the input.
 *
 * @return  the packed alternative form of the given sample format or
            AV_SAMPLE_FMT_NONE on error.
  }
function av_get_packed_sample_fmt(sample_fmt:TAVSampleFormat):TAVSampleFormat;cdecl;external;
{*
 * Get the planar alternative form of the given sample format.
 *
 * If the passed sample_fmt is already in planar format, the format returned is
 * the same as the input.
 *
 * @return  the planar alternative form of the given sample format or
            AV_SAMPLE_FMT_NONE on error.
  }
function av_get_planar_sample_fmt(sample_fmt:TAVSampleFormat):TAVSampleFormat;cdecl;external;
{*
 * Generate a string corresponding to the sample format with
 * sample_fmt, or a header if sample_fmt is negative.
 *
 * @param buf the buffer where to write the string
 * @param buf_size the size of buf
 * @param sample_fmt the number of the sample format to print the
 * corresponding info string, or a negative value to print the
 * corresponding header.
 * @return the pointer to the filled buffer or NULL if sample_fmt is
 * unknown or in case of other errors
  }
function av_get_sample_fmt_string(buf:Pchar; buf_size:longint; sample_fmt:TAVSampleFormat):Pchar;cdecl;external;
{*
 * Return number of bytes per sample.
 *
 * @param sample_fmt the sample format
 * @return number of bytes per sample or zero if unknown for the given
 * sample format
  }
function av_get_bytes_per_sample(sample_fmt:TAVSampleFormat):longint;cdecl;external;
{*
 * Check if the sample format is planar.
 *
 * @param sample_fmt the sample format to inspect
 * @return 1 if the sample format is planar, 0 if it is interleaved
  }
function av_sample_fmt_is_planar(sample_fmt:TAVSampleFormat):longint;cdecl;external;
{*
 * Get the required buffer size for the given audio parameters.
 *
 * @param[out] linesize calculated linesize, may be NULL
 * @param nb_channels   the number of channels
 * @param nb_samples    the number of samples in a single channel
 * @param sample_fmt    the sample format
 * @param align         buffer size alignment (0 = default, 1 = no alignment)
 * @return              required buffer size, or negative error code on failure
  }
function av_samples_get_buffer_size(linesize:Plongint; nb_channels:longint; nb_samples:longint; sample_fmt:TAVSampleFormat; align:longint):longint;cdecl;external;
{*
 * @
 *
 * @defgroup lavu_sampmanip Samples manipulation
 *
 * Functions that manipulate audio samples
 * @
  }
{*
 * Fill plane data pointers and linesize for samples with sample
 * format sample_fmt.
 *
 * The audio_data array is filled with the pointers to the samples data planes:
 * for planar, set the start point of each channel's data within the buffer,
 * for packed, set the start point of the entire buffer only.
 *
 * The value pointed to by linesize is set to the aligned size of each
 * channel's data buffer for planar layout, or to the aligned size of the
 * buffer for all channels for packed layout.
 *
 * The buffer in buf must be big enough to contain all the samples
 * (use av_samples_get_buffer_size() to compute its minimum size),
 * otherwise the audio_data pointers will point to invalid data.
 *
 * @see enum AVSampleFormat
 * The documentation for AVSampleFormat describes the data layout.
 *
 * @param[out] audio_data  array to be filled with the pointer for each channel
 * @param[out] linesize    calculated linesize, may be NULL
 * @param buf              the pointer to a buffer containing the samples
 * @param nb_channels      the number of channels
 * @param nb_samples       the number of samples in a single channel
 * @param sample_fmt       the sample format
 * @param align            buffer size alignment (0 = default, 1 = no alignment)
 * @return                 minimum size in bytes required for the buffer on success,
 *                         or a negative error code on failure
  }
(* Const before type ignored *)
function av_samples_fill_arrays(audio_data:PPuint8_t; linesize:Plongint; buf:Puint8_t; nb_channels:longint; nb_samples:longint; 
           sample_fmt:TAVSampleFormat; align:longint):longint;cdecl;external;
{*
 * Allocate a samples buffer for nb_samples samples, and fill data pointers and
 * linesize accordingly.
 * The allocated samples buffer can be freed by using av_freep(&audio_data[0])
 * Allocated data will be initialized to silence.
 *
 * @see enum AVSampleFormat
 * The documentation for AVSampleFormat describes the data layout.
 *
 * @param[out] audio_data  array to be filled with the pointer for each channel
 * @param[out] linesize    aligned size for audio buffer(s), may be NULL
 * @param nb_channels      number of audio channels
 * @param nb_samples       number of samples per channel
 * @param sample_fmt       the sample format
 * @param align            buffer size alignment (0 = default, 1 = no alignment)
 * @return                 >=0 on success or a negative error code on failure
 * @todo return the size of the allocated buffer in case of success at the next bump
 * @see av_samples_fill_arrays()
 * @see av_samples_alloc_array_and_samples()
  }
function av_samples_alloc(audio_data:PPuint8_t; linesize:Plongint; nb_channels:longint; nb_samples:longint; sample_fmt:TAVSampleFormat; 
           align:longint):longint;cdecl;external;
{*
 * Allocate a data pointers array, samples buffer for nb_samples
 * samples, and fill data pointers and linesize accordingly.
 *
 * This is the same as av_samples_alloc(), but also allocates the data
 * pointers array.
 *
 * @see av_samples_alloc()
  }
function av_samples_alloc_array_and_samples(audio_data:PPPuint8_t; linesize:Plongint; nb_channels:longint; nb_samples:longint; sample_fmt:TAVSampleFormat; 
           align:longint):longint;cdecl;external;
{*
 * Copy samples from src to dst.
 *
 * @param dst destination array of pointers to data planes
 * @param src source array of pointers to data planes
 * @param dst_offset offset in samples at which the data will be written to dst
 * @param src_offset offset in samples at which the data will be read from src
 * @param nb_samples number of samples to be copied
 * @param nb_channels number of audio channels
 * @param sample_fmt audio sample format
  }
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function av_samples_copy(dst:PPuint8_t; src:PPuint8_t; dst_offset:longint; src_offset:longint; nb_samples:longint; 
           nb_channels:longint; sample_fmt:TAVSampleFormat):longint;cdecl;external;
{*
 * Fill an audio buffer with silence.
 *
 * @param audio_data  array of pointers to data planes
 * @param offset      offset in samples at which to start filling
 * @param nb_samples  number of samples to fill
 * @param nb_channels number of audio channels
 * @param sample_fmt  audio sample format
  }
(* Const before declarator ignored *)
function av_samples_set_silence(audio_data:PPuint8_t; offset:longint; nb_samples:longint; nb_channels:longint; sample_fmt:TAVSampleFormat):longint;cdecl;external;
{*
 * @
 * @
  }
{$endif}
{ AVUTIL_SAMPLEFMT_H  }

implementation


end.
