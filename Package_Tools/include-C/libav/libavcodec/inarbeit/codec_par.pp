
unit codec_par;
interface

{
  Automatically converted by H2Pas 1.0.0 from codec_par.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    codec_par.h
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
PAVCodecParameters  = ^AVCodecParameters;
PAVPacketSideData  = ^AVPacketSideData;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Codec parameters public API
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
{$ifndef AVCODEC_CODEC_PAR_H}
{$define AVCODEC_CODEC_PAR_H}
{$include <stdint.h>}
{$include "libavutil/avutil.h"}
{$include "libavutil/channel_layout.h"}
{$include "libavutil/rational.h"}
{$include "libavutil/pixfmt.h"}
{$include "codec_id.h"}
{$include "defs.h"}
{$include "packet.h"}
{*
 * @addtogroup lavc_core
 * @
  }
{*
 * This struct describes the properties of an encoded stream.
 *
 * sizeof(AVCodecParameters) is not a part of the public ABI, this struct must
 * be allocated with avcodec_parameters_alloc() and freed with
 * avcodec_parameters_free().
  }
{*
     * General type of the encoded data.
      }
{*
     * Specific type of the encoded data (the codec used).
      }
{*
     * Additional information about the codec (corresponds to the AVI FOURCC).
      }
{*
     * Extra binary data needed for initializing the decoder, codec-dependent.
     *
     * Must be allocated with av_malloc() and will be freed by
     * avcodec_parameters_free(). The allocated size of extradata must be at
     * least extradata_size + AV_INPUT_BUFFER_PADDING_SIZE, with the padding
     * bytes zeroed.
      }
{*
     * Size of the extradata content in bytes.
      }
{*
     * - video: the pixel format, the value corresponds to enum AVPixelFormat.
     * - audio: the sample format, the value corresponds to enum AVSampleFormat.
      }
{*
     * The average bitrate of the encoded data (in bits per second).
      }
{*
     * The number of bits per sample in the codedwords.
     *
     * This is basically the bitrate per sample. It is mandatory for a bunch of
     * formats to actually decode them. It's the number of bits for one sample in
     * the actual coded bitstream.
     *
     * This could be for example 4 for ADPCM
     * For PCM formats this matches bits_per_raw_sample
     * Can be 0
      }
{*
     * This is the number of valid bits in each output sample. If the
     * sample format has more bits, the least significant bits are additional
     * padding bits, which are always 0. Use right shifts to reduce the sample
     * to its actual size. For example, audio formats with 24 bit samples will
     * have bits_per_raw_sample set to 24, and format set to AV_SAMPLE_FMT_S32.
     * To get the original sample use "(int32_t)sample >> 8"."
     *
     * For ADPCM this might be 12 or 16 or similar
     * Can be 0
      }
{*
     * Codec-specific bitstream restrictions that the stream conforms to.
      }
{*
     * Video only. The dimensions of the video frame in pixels.
      }
{*
     * Video only. The aspect ratio (width / height) which a single pixel
     * should have when displayed.
     *
     * When the aspect ratio is unknown / undefined, the numerator should be
     * set to 0 (the denominator may have any value).
      }
{*
     * Video only. The order of the fields in interlaced video.
      }
{*
     * Video only. Additional colorspace characteristics.
      }
{*
     * Video only. Number of delayed frames.
      }
{$if FF_API_OLD_CHANNEL_LAYOUT}
{*
     * Audio only. The channel layout bitmask. May be 0 if the channel layout is
     * unknown or unspecified, otherwise the number of bits set must be equal to
     * the channels field.
     * @deprecated use ch_layout
      }
{*
     * Audio only. The number of audio channels.
     * @deprecated use ch_layout.nb_channels
      }
{$endif}
{*
     * Audio only. The number of audio samples per second.
      }
{*
     * Audio only. The number of bytes per coded audio frame, required by some
     * formats.
     *
     * Corresponds to nBlockAlign in WAVEFORMATEX.
      }
{*
     * Audio only. Audio frame size, if known. Required by some formats to be static.
      }
{*
     * Audio only. The amount of padding (in samples) inserted by the encoder at
     * the beginning of the audio. I.e. this number of leading decoded samples
     * must be discarded by the caller to get the original audio without leading
     * padding.
      }
{*
     * Audio only. The amount of padding (in samples) appended by the encoder to
     * the end of the audio. I.e. this number of decoded samples must be
     * discarded by the caller from the end of the stream to get the original
     * audio without any trailing padding.
      }
{*
     * Audio only. Number of samples to skip after a discontinuity.
      }
{*
     * Audio only. The channel layout and number of channels.
      }
{*
     * Video only. Number of frames per second, for streams with constant frame
     * durations. Should be set to  0, 1  when some frames have differing
     * durations or if the value is not known.
     *
     * @note This field correponds to values that are stored in codec-level
     * headers and is typically overridden by container/transport-layer
     * timestamps, when available. It should thus be used only as a last resort,
     * when no higher-level timing information is available.
      }
{*
     * Additional data associated with the entire stream.
      }
{*
     * Amount of entries in @ref coded_side_data.
      }
type
  PAVCodecParameters = ^TAVCodecParameters;
  TAVCodecParameters = record
      codec_type : TAVMediaType;
      codec_id : TAVCodecID;
      codec_tag : Tuint32_t;
      extradata : Puint8_t;
      extradata_size : longint;
      format : longint;
      bit_rate : Tint64_t;
      bits_per_coded_sample : longint;
      bits_per_raw_sample : longint;
      profile : longint;
      level : longint;
      width : longint;
      height : longint;
      sample_aspect_ratio : TAVRational;
      field_order : TAVFieldOrder;
      color_range : TAVColorRange;
      color_primaries : TAVColorPrimaries;
      color_trc : TAVColorTransferCharacteristic;
      color_space : TAVColorSpace;
      chroma_location : TAVChromaLocation;
      video_delay : longint;
      channel_layout : Tuint64_t;
      channels : longint;
      sample_rate : longint;
      block_align : longint;
      frame_size : longint;
      initial_padding : longint;
      trailing_padding : longint;
      seek_preroll : longint;
      ch_layout : TAVChannelLayout;
      framerate : TAVRational;
      coded_side_data : PAVPacketSideData;
      nb_coded_side_data : longint;
    end;
{*
 * Allocate a new AVCodecParameters and set its fields to default values
 * (unknown/invalid/0). The returned struct must be freed with
 * avcodec_parameters_free().
  }

function avcodec_parameters_alloc:PAVCodecParameters;cdecl;external;
{*
 * Free an AVCodecParameters instance and everything associated with it and
 * write NULL to the supplied pointer.
  }
procedure avcodec_parameters_free(par:PPAVCodecParameters);cdecl;external;
{*
 * Copy the contents of src to dst. Any allocated fields in dst are freed and
 * replaced with newly allocated duplicates of the corresponding fields in src.
 *
 * @return >= 0 on success, a negative AVERROR code on failure.
  }
(* Const before type ignored *)
function avcodec_parameters_copy(dst:PAVCodecParameters; src:PAVCodecParameters):longint;cdecl;external;
{*
 * This function is the same as av_get_audio_frame_duration(), except it works
 * with AVCodecParameters instead of an AVCodecContext.
  }
function av_get_audio_frame_duration2(par:PAVCodecParameters; frame_bytes:longint):longint;cdecl;external;
{*
 * @
  }
{$endif}
{ AVCODEC_CODEC_PAR_H }

implementation


end.
