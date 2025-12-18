
unit codec_desc;
interface

{
  Automatically converted by H2Pas 1.0.0 from codec_desc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    codec_desc.h
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
PAVCodecDescriptor  = ^AVCodecDescriptor;
PAVProfile  = ^AVProfile;
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Codec descriptors public API
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
{$ifndef AVCODEC_CODEC_DESC_H}
{$define AVCODEC_CODEC_DESC_H}
{$include "libavutil/avutil.h"}
{$include "codec_id.h"}
{*
 * @addtogroup lavc_core
 * @
  }
{*
 * This struct describes the properties of a single codec described by an
 * AVCodecID.
 * @see avcodec_descriptor_get()
  }
{*
     * Name of the codec described by this descriptor. It is non-empty and
     * unique for each codec descriptor. It should contain alphanumeric
     * characters and '_' only.
      }
(* Const before type ignored *)
{*
     * A more descriptive name for this codec. May be NULL.
      }
(* Const before type ignored *)
{*
     * Codec properties, a combination of AV_CODEC_PROP_* flags.
      }
{*
     * MIME type(s) associated with the codec.
     * May be NULL; if not, a NULL-terminated array of MIME types.
     * The first item is always non-NULL and is the preferred MIME type.
      }
(* Const before type ignored *)
(* Const before declarator ignored *)
{*
     * If non-NULL, an array of profiles recognized for this codec.
     * Terminated with AV_PROFILE_UNKNOWN.
      }
(* Const before type ignored *)
type
  PAVCodecDescriptor = ^TAVCodecDescriptor;
  TAVCodecDescriptor = record
      id : TAVCodecID;
      _type : TAVMediaType;
      name : Pchar;
      long_name : Pchar;
      props : longint;
      mime_types : ^Pchar;
      profiles : PAVProfile;
    end;
{*
 * Codec uses only intra compression.
 * Video and audio codecs only.
  }

const
  AV_CODEC_PROP_INTRA_ONLY = 1 shl 0;  
{*
 * Codec supports lossy compression. Audio and video codecs only.
 * @note a codec may support both lossy and lossless
 * compression modes
  }
  AV_CODEC_PROP_LOSSY = 1 shl 1;  
{*
 * Codec supports lossless compression. Audio and video codecs only.
  }
  AV_CODEC_PROP_LOSSLESS = 1 shl 2;  
{*
 * Codec supports frame reordering. That is, the coded order (the order in which
 * the encoded packets are output by the encoders / stored / input to the
 * decoders) may be different from the presentation order of the corresponding
 * frames.
 *
 * For codecs that do not have this property set, PTS and DTS should always be
 * equal.
  }
  AV_CODEC_PROP_REORDER = 1 shl 3;  
{*
 * Video codec supports separate coding of fields in interlaced frames.
  }
  AV_CODEC_PROP_FIELDS = 1 shl 4;  
{*
 * Subtitle codec is bitmap based
 * Decoded AVSubtitle data can be read from the AVSubtitleRect->pict field.
  }
  AV_CODEC_PROP_BITMAP_SUB = 1 shl 16;  
{*
 * Subtitle codec is text based.
 * Decoded AVSubtitle data can be read from the AVSubtitleRect->ass field.
  }
  AV_CODEC_PROP_TEXT_SUB = 1 shl 17;  
{*
 * @return descriptor for given codec ID or NULL if no descriptor exists.
  }
(* Const before type ignored *)

function avcodec_descriptor_get(id:TAVCodecID):PAVCodecDescriptor;cdecl;external;
{*
 * Iterate over all codec descriptors known to libavcodec.
 *
 * @param prev previous descriptor. NULL to get the first descriptor.
 *
 * @return next descriptor or NULL after the last descriptor
  }
(* Const before type ignored *)
(* Const before type ignored *)
function avcodec_descriptor_next(prev:PAVCodecDescriptor):PAVCodecDescriptor;cdecl;external;
{*
 * @return codec descriptor with the given name or NULL if no such descriptor
 *         exists.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function avcodec_descriptor_get_by_name(name:Pchar):PAVCodecDescriptor;cdecl;external;
{*
 * @
  }
{$endif}
{ AVCODEC_CODEC_DESC_H }

implementation


end.
