
unit packet;
interface

{
  Automatically converted by H2Pas 1.0.0 from packet.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    packet.h
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
PAVBufferRef  = ^AVBufferRef;
PAVDictionary  = ^AVDictionary;
PAVPacket  = ^AVPacket;
PAVPacketList  = ^AVPacketList;
PAVPacketSideData  = ^AVPacketSideData;
PAVPacketSideDataType  = ^AVPacketSideDataType;
PAVSideDataParamChangeFlags  = ^AVSideDataParamChangeFlags;
Pchar  = ^char;
Plongint  = ^longint;
Psize_t  = ^size_t;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * AVPacket public API
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
{$ifndef AVCODEC_PACKET_H}
{$define AVCODEC_PACKET_H}
{$include <stddef.h>}
{$include <stdint.h>}
{$include "libavutil/attributes.h"}
{$include "libavutil/buffer.h"}
{$include "libavutil/dict.h"}
{$include "libavutil/rational.h"}
{$include "libavutil/version.h"}
{$include "libavcodec/version_major.h"}
{*
 * @defgroup lavc_packet_side_data AVPacketSideData
 *
 * Types and functions for working with AVPacketSideData.
 * @
  }
{*
     * An AV_PKT_DATA_PALETTE side data packet contains exactly AVPALETTE_SIZE
     * bytes worth of palette. This side data signals that a new palette is
     * present.
      }
{*
     * The AV_PKT_DATA_NEW_EXTRADATA is used to notify the codec or the format
     * that the extradata buffer was changed and the receiving side should
     * act upon it appropriately. The new extradata is embedded in the side
     * data buffer and should be immediately used for processing the current
     * frame or packet.
      }
{*
     * An AV_PKT_DATA_PARAM_CHANGE side data packet is laid out as follows:
     * @code
     * u32le param_flags
     * if (param_flags & AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_COUNT)
     *     s32le channel_count
     * if (param_flags & AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_LAYOUT)
     *     u64le channel_layout
     * if (param_flags & AV_SIDE_DATA_PARAM_CHANGE_SAMPLE_RATE)
     *     s32le sample_rate
     * if (param_flags & AV_SIDE_DATA_PARAM_CHANGE_DIMENSIONS)
     *     s32le width
     *     s32le height
     * @endcode
      }
{*
     * An AV_PKT_DATA_H263_MB_INFO side data packet contains a number of
     * structures with info about macroblocks relevant to splitting the
     * packet into smaller packets on macroblock edges (e.g. as for RFC 2190).
     * That is, it does not necessarily contain info about all macroblocks,
     * as long as the distance between macroblocks in the info is smaller
     * than the target payload size.
     * Each MB info structure is 12 bytes, and is laid out as follows:
     * @code
     * u32le bit offset from the start of the packet
     * u8    current quantizer at the start of the macroblock
     * u8    GOB number
     * u16le macroblock address within the GOB
     * u8    horizontal MV predictor
     * u8    vertical MV predictor
     * u8    horizontal MV predictor for block number 3
     * u8    vertical MV predictor for block number 3
     * @endcode
      }
{*
     * This side data should be associated with an audio stream and contains
     * ReplayGain information in form of the AVReplayGain struct.
      }
{*
     * This side data contains a 3x3 transformation matrix describing an affine
     * transformation that needs to be applied to the decoded video frames for
     * correct presentation.
     *
     * See libavutil/display.h for a detailed description of the data.
      }
{*
     * This side data should be associated with a video stream and contains
     * Stereoscopic 3D information in form of the AVStereo3D struct.
      }
{*
     * This side data should be associated with an audio stream and corresponds
     * to enum AVAudioServiceType.
      }
{*
     * This side data contains quality related information from the encoder.
     * @code
     * u32le quality factor of the compressed frame. Allowed range is between 1 (good) and FF_LAMBDA_MAX (bad).
     * u8    picture type
     * u8    error count
     * u16   reserved
     * u64le[error count] sum of squared differences between encoder in and output
     * @endcode
      }
{*
     * This side data contains an integer value representing the stream index
     * of a "fallback" track.  A fallback track indicates an alternate
     * track to use when the current track can not be decoded for some reason.
     * e.g. no decoder available for codec.
      }
{*
     * This side data corresponds to the AVCPBProperties struct.
      }
{*
     * Recommmends skipping the specified number of samples
     * @code
     * u32le number of samples to skip from start of this packet
     * u32le number of samples to skip from end of this packet
     * u8    reason for start skip
     * u8    reason for end   skip (0=padding silence, 1=convergence)
     * @endcode
      }
{*
     * An AV_PKT_DATA_JP_DUALMONO side data packet indicates that
     * the packet may contain "dual mono" audio specific to Japanese DTV
     * and if it is true, recommends only the selected channel to be used.
     * @code
     * u8    selected channels (0=main/left, 1=sub/right, 2=both)
     * @endcode
      }
{*
     * A list of zero terminated key/value strings. There is no end marker for
     * the list, so it is required to rely on the side data size to stop.
      }
{*
     * Subtitle event position
     * @code
     * u32le x1
     * u32le y1
     * u32le x2
     * u32le y2
     * @endcode
      }
{*
     * Data found in BlockAdditional element of matroska container. There is
     * no end marker for the data, so it is required to rely on the side data
     * size to recognize the end. 8 byte id (as found in BlockAddId) followed
     * by data.
      }
{*
     * The optional first identifier line of a WebVTT cue.
      }
{*
     * The optional settings (rendering instructions) that immediately
     * follow the timestamp specifier of a WebVTT cue.
      }
{*
     * A list of zero terminated key/value strings. There is no end marker for
     * the list, so it is required to rely on the side data size to stop. This
     * side data includes updated metadata which appeared in the stream.
      }
{*
     * MPEGTS stream ID as uint8_t, this is required to pass the stream ID
     * information from the demuxer to the corresponding muxer.
      }
{*
     * Mastering display metadata (based on SMPTE-2086:2014). This metadata
     * should be associated with a video stream and contains data in the form
     * of the AVMasteringDisplayMetadata struct.
      }
{*
     * This side data should be associated with a video stream and corresponds
     * to the AVSphericalMapping structure.
      }
{*
     * Content light level (based on CTA-861.3). This metadata should be
     * associated with a video stream and contains data in the form of the
     * AVContentLightMetadata struct.
      }
{*
     * ATSC A53 Part 4 Closed Captions. This metadata should be associated with
     * a video stream. A53 CC bitstream is stored as uint8_t in AVPacketSideData.data.
     * The number of bytes of CC data is AVPacketSideData.size.
      }
{*
     * This side data is encryption initialization data.
     * The format is not part of ABI, use av_encryption_init_info_* methods to
     * access.
      }
{*
     * This side data contains encryption info for how to decrypt the packet.
     * The format is not part of ABI, use av_encryption_info_* methods to access.
      }
{*
     * Active Format Description data consisting of a single byte as specified
     * in ETSI TS 101 154 using AVActiveFormatDescription enum.
      }
{*
     * Producer Reference Time data corresponding to the AVProducerReferenceTime struct,
     * usually exported by some encoders (on demand through the prft flag set in the
     * AVCodecContext export_side_data field).
      }
{*
     * ICC profile data consisting of an opaque octet buffer following the
     * format described by ISO 15076-1.
      }
{*
     * DOVI configuration
     * ref:
     * dolby-vision-bitstreams-within-the-iso-base-media-file-format-v2.1.2, section 2.2
     * dolby-vision-bitstreams-in-mpeg-2-transport-stream-multiplex-v1.2, section 3.3
     * Tags are stored in struct AVDOVIDecoderConfigurationRecord.
      }
{*
     * Timecode which conforms to SMPTE ST 12-1:2014. The data is an array of 4 uint32_t
     * where the first uint32_t describes how many (1-3) of the other timecodes are used.
     * The timecode format is described in the documentation of av_timecode_get_smpte_from_framenum()
     * function in libavutil/timecode.h.
      }
{*
     * HDR10+ dynamic metadata associated with a video frame. The metadata is in
     * the form of the AVDynamicHDRPlus struct and contains
     * information for color volume transform - application 4 of
     * SMPTE 2094-40:2016 standard.
      }
{*
     * The number of side data types.
     * This is not part of the public API/ABI in the sense that it may
     * change when new side data types are added.
     * This must stay the last enum value.
     * If its value becomes huge, some code using it
     * needs to be updated as it assumes it to be smaller than other limits.
      }
type
  TAVPacketSideDataType =  Longint;
  Const
    AV_PKT_DATA_PALETTE = 0;
    AV_PKT_DATA_NEW_EXTRADATA = 1;
    AV_PKT_DATA_PARAM_CHANGE = 2;
    AV_PKT_DATA_H263_MB_INFO = 3;
    AV_PKT_DATA_REPLAYGAIN = 4;
    AV_PKT_DATA_DISPLAYMATRIX = 5;
    AV_PKT_DATA_STEREO3D = 6;
    AV_PKT_DATA_AUDIO_SERVICE_TYPE = 7;
    AV_PKT_DATA_QUALITY_STATS = 8;
    AV_PKT_DATA_FALLBACK_TRACK = 9;
    AV_PKT_DATA_CPB_PROPERTIES = 10;
    AV_PKT_DATA_SKIP_SAMPLES = 11;
    AV_PKT_DATA_JP_DUALMONO = 12;
    AV_PKT_DATA_STRINGS_METADATA = 13;
    AV_PKT_DATA_SUBTITLE_POSITION = 14;
    AV_PKT_DATA_MATROSKA_BLOCKADDITIONAL = 15;
    AV_PKT_DATA_WEBVTT_IDENTIFIER = 16;
    AV_PKT_DATA_WEBVTT_SETTINGS = 17;
    AV_PKT_DATA_METADATA_UPDATE = 18;
    AV_PKT_DATA_MPEGTS_STREAM_ID = 19;
    AV_PKT_DATA_MASTERING_DISPLAY_METADATA = 20;
    AV_PKT_DATA_SPHERICAL = 21;
    AV_PKT_DATA_CONTENT_LIGHT_LEVEL = 22;
    AV_PKT_DATA_A53_CC = 23;
    AV_PKT_DATA_ENCRYPTION_INIT_INFO = 24;
    AV_PKT_DATA_ENCRYPTION_INFO = 25;
    AV_PKT_DATA_AFD = 26;
    AV_PKT_DATA_PRFT = 27;
    AV_PKT_DATA_ICC_PROFILE = 28;
    AV_PKT_DATA_DOVI_CONF = 29;
    AV_PKT_DATA_S12M_TIMECODE = 30;
    AV_PKT_DATA_DYNAMIC_HDR10_PLUS = 31;
    AV_PKT_DATA_NB = 32;

  AV_PKT_DATA_QUALITY_FACTOR = AV_PKT_DATA_QUALITY_STATS;  {DEPRECATED }
{*
 * This structure stores auxiliary information for decoding, presenting, or
 * otherwise processing the coded stream. It is typically exported by demuxers
 * and encoders and can be fed to decoders and muxers either in a per packet
 * basis, or as global side data (applying to the entire coded stream).
 *
 * Global side data is handled as follows:
 * - During demuxing, it may be exported through
 *   @ref AVStream.codecpar.side_data "AVStream's codec parameters", which can
 *   then be passed as input to decoders through the
 *   @ref AVCodecContext.coded_side_data "decoder context's side data", for
 *   initialization.
 * - For muxing, it can be fed through @ref AVStream.codecpar.side_data
 *   "AVStream's codec parameters", typically  the output of encoders through
 *   the @ref AVCodecContext.coded_side_data "encoder context's side data", for
 *   initialization.
 *
 * Packet specific side data is handled as follows:
 * - During demuxing, it may be exported through @ref AVPacket.side_data
 *   "AVPacket's side data", which can then be passed as input to decoders.
 * - For muxing, it can be fed through @ref AVPacket.side_data "AVPacket's
 *   side data", typically the output of encoders.
 *
 * Different modules may accept or export different types of side data
 * depending on media type and codec. Refer to @ref AVPacketSideDataType for a
 * list of defined types and where they may be found or used.
  }
type
  PAVPacketSideData = ^TAVPacketSideData;
  TAVPacketSideData = record
      data : Puint8_t;
      size : Tsize_t;
      _type : TAVPacketSideDataType;
    end;
{*
 * Allocate a new packet side data.
 *
 * @param sd    pointer to an array of side data to which the side data should
 *              be added. *sd may be NULL, in which case the array will be
 *              initialized.
 * @param nb_sd pointer to an integer containing the number of entries in
 *              the array. The integer value will be increased by 1 on success.
 * @param type  side data type
 * @param size  desired side data size
 * @param flags currently unused. Must be zero
 *
 * @return pointer to freshly allocated side data on success, or NULL otherwise.
  }

function av_packet_side_data_new(psd:PPAVPacketSideData; pnb_sd:Plongint; _type:TAVPacketSideDataType; size:Tsize_t; flags:longint):PAVPacketSideData;cdecl;external;
{*
 * Wrap existing data as packet side data.
 *
 * @param sd    pointer to an array of side data to which the side data should
 *              be added. *sd may be NULL, in which case the array will be
 *              initialized
 * @param nb_sd pointer to an integer containing the number of entries in
 *              the array. The integer value will be increased by 1 on success.
 * @param type  side data type
 * @param data  a data array. It must be allocated with the av_malloc() family
 *              of functions. The ownership of the data is transferred to the
 *              side data array on success
 * @param size  size of the data array
 * @param flags currently unused. Must be zero
 *
 * @return pointer to freshly allocated side data on success, or NULL otherwise
 *         On failure, the side data array is unchanged and the data remains
 *         owned by the caller.
  }
function av_packet_side_data_add(sd:PPAVPacketSideData; nb_sd:Plongint; _type:TAVPacketSideDataType; data:pointer; size:Tsize_t; 
           flags:longint):PAVPacketSideData;cdecl;external;
{*
 * Get side information from a side data array.
 *
 * @param sd    the array from which the side data should be fetched
 * @param nb_sd value containing the number of entries in the array.
 * @param type  desired side information type
 *
 * @return pointer to side data if present or NULL otherwise
  }
(* Const before type ignored *)
(* Const before type ignored *)
function av_packet_side_data_get(sd:PAVPacketSideData; nb_sd:longint; _type:TAVPacketSideDataType):PAVPacketSideData;cdecl;external;
{*
 * Remove side data of the given type from a side data array.
 *
 * @param sd    the array from which the side data should be removed
 * @param nb_sd pointer to an integer containing the number of entries in
 *              the array. Will be reduced by the amount of entries removed
 *              upon return
 * @param type  side information type
  }
procedure av_packet_side_data_remove(sd:PAVPacketSideData; nb_sd:Plongint; _type:TAVPacketSideDataType);cdecl;external;
{*
 * Convenience function to free all the side data stored in an array, and
 * the array itself.
 *
 * @param sd    pointer to array of side data to free. Will be set to NULL
 *              upon return.
 * @param nb_sd pointer to an integer containing the number of entries in
 *              the array. Will be set to 0 upon return.
  }
procedure av_packet_side_data_free(sd:PPAVPacketSideData; nb_sd:Plongint);cdecl;external;
(* Const before type ignored *)
function av_packet_side_data_name(_type:TAVPacketSideDataType):Pchar;cdecl;external;
{*
 * @
  }
{*
 * @defgroup lavc_packet AVPacket
 *
 * Types and functions for working with AVPacket.
 * @
  }
{*
 * This structure stores compressed data. It is typically exported by demuxers
 * and then passed as input to decoders, or received as output from encoders and
 * then passed to muxers.
 *
 * For video, it should typically contain one compressed frame. For audio it may
 * contain several compressed frames. Encoders are allowed to output empty
 * packets, with no compressed data, containing only side data
 * (e.g. to update some stream parameters at the end of encoding).
 *
 * The semantics of data ownership depends on the buf field.
 * If it is set, the packet data is dynamically allocated and is
 * valid indefinitely until a call to av_packet_unref() reduces the
 * reference count to 0.
 *
 * If the buf field is not set av_packet_ref() would make a copy instead
 * of increasing the reference count.
 *
 * The side data is always allocated with av_malloc(), copied by
 * av_packet_ref() and freed by av_packet_unref().
 *
 * sizeof(AVPacket) being a part of the public ABI is deprecated. once
 * av_init_packet() is removed, new packets will only be able to be allocated
 * with av_packet_alloc(), and new fields may be added to the end of the struct
 * with a minor bump.
 *
 * @see av_packet_alloc
 * @see av_packet_ref
 * @see av_packet_unref
  }
{*
     * A reference to the reference-counted buffer where the packet data is
     * stored.
     * May be NULL, then the packet data is not reference-counted.
      }
{*
     * Presentation timestamp in AVStream->time_base units; the time at which
     * the decompressed packet will be presented to the user.
     * Can be AV_NOPTS_VALUE if it is not stored in the file.
     * pts MUST be larger or equal to dts as presentation cannot happen before
     * decompression, unless one wants to view hex dumps. Some formats misuse
     * the terms dts and pts/cts to mean something different. Such timestamps
     * must be converted to true pts/dts before they are stored in AVPacket.
      }
{*
     * Decompression timestamp in AVStream->time_base units; the time at which
     * the packet is decompressed.
     * Can be AV_NOPTS_VALUE if it is not stored in the file.
      }
{*
     * A combination of AV_PKT_FLAG values
      }
{*
     * Additional packet data that can be provided by the container.
     * Packet can contain several types of side information.
      }
{*
     * Duration of this packet in AVStream->time_base units, 0 if unknown.
     * Equals next_pts - this_pts in presentation order.
      }
{/< byte position in stream, -1 if unknown }
{*
     * for some private data of the user
      }
{*
     * AVBufferRef for free use by the API user. FFmpeg will never check the
     * contents of the buffer ref. FFmpeg calls av_buffer_unref() on it when
     * the packet is unreferenced. av_packet_copy_props() calls create a new
     * reference with av_buffer_ref() for the target packet's opaque_ref field.
     *
     * This is unrelated to the opaque field, although it serves a similar
     * purpose.
      }
{*
     * Time base of the packet's timestamps.
     * In the future, this field may be set on packets output by encoders or
     * demuxers, but its value will be by default ignored on input to decoders
     * or muxers.
      }
type
  PAVPacket = ^TAVPacket;
  TAVPacket = record
      buf : PAVBufferRef;
      pts : Tint64_t;
      dts : Tint64_t;
      data : Puint8_t;
      size : longint;
      stream_index : longint;
      flags : longint;
      side_data : PAVPacketSideData;
      side_data_elems : longint;
      duration : Tint64_t;
      pos : Tint64_t;
      opaque : pointer;
      opaque_ref : PAVBufferRef;
      time_base : TAVRational;
    end;
{$if FF_API_INIT_PACKET}
type
  PAVPacketList = ^TAVPacketList;
  TAVPacketList = record
      pkt : TAVPacket;
      next : PAVPacketList;
    end;
{$endif}

const
  AV_PKT_FLAG_KEY = $0001;  {/< The packet contains a keyframe }
  AV_PKT_FLAG_CORRUPT = $0002;  {/< The packet content is corrupted }
{*
 * Flag is used to discard packets which are required to maintain valid
 * decoder state but are not required for output and should be dropped
 * after decoding.
 * }
  AV_PKT_FLAG_DISCARD = $0004;  
{*
 * The packet comes from a trusted source.
 *
 * Otherwise-unsafe constructs such as arbitrary pointers to data
 * outside the packet may be followed.
  }
  AV_PKT_FLAG_TRUSTED = $0008;  
{*
 * Flag is used to indicate packets that contain frames that can
 * be discarded by the decoder.  I.e. Non-reference frames.
  }
  AV_PKT_FLAG_DISPOSABLE = $0010;  
{*
     * @deprecated those are not used by any decoder
      }
type
  TAVSideDataParamChangeFlags =  Longint;
  Const
    AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_COUNT = $0001;
    AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_LAYOUT = $0002;
    AV_SIDE_DATA_PARAM_CHANGE_SAMPLE_RATE = $0004;
    AV_SIDE_DATA_PARAM_CHANGE_DIMENSIONS = $0008;

{*
 * Allocate an AVPacket and set its fields to default values.  The resulting
 * struct must be freed using av_packet_free().
 *
 * @return An AVPacket filled with default values or NULL on failure.
 *
 * @note this only allocates the AVPacket itself, not the data buffers. Those
 * must be allocated through other means such as av_new_packet.
 *
 * @see av_new_packet
  }

function av_packet_alloc:PAVPacket;cdecl;external;
{*
 * Create a new packet that references the same data as src.
 *
 * This is a shortcut for av_packet_alloc()+av_packet_ref().
 *
 * @return newly created AVPacket on success, NULL on error.
 *
 * @see av_packet_alloc
 * @see av_packet_ref
  }
(* Const before type ignored *)
function av_packet_clone(src:PAVPacket):PAVPacket;cdecl;external;
{*
 * Free the packet, if the packet is reference counted, it will be
 * unreferenced first.
 *
 * @param pkt packet to be freed. The pointer will be set to NULL.
 * @note passing NULL is a no-op.
  }
procedure av_packet_free(pkt:PPAVPacket);cdecl;external;
{$if FF_API_INIT_PACKET}
{*
 * Initialize optional fields of a packet with default values.
 *
 * Note, this does not touch the data and size members, which have to be
 * initialized separately.
 *
 * @param pkt packet
 *
 * @see av_packet_alloc
 * @see av_packet_unref
 *
 * @deprecated This function is deprecated. Once it's removed,
               sizeof(AVPacket) will not be a part of the ABI anymore.
  }

procedure av_init_packet(pkt:PAVPacket);cdecl;external;
{$endif}
{*
 * Allocate the payload of a packet and initialize its fields with
 * default values.
 *
 * @param pkt packet
 * @param size wanted payload size
 * @return 0 if OK, AVERROR_xxx otherwise
  }

function av_new_packet(pkt:PAVPacket; size:longint):longint;cdecl;external;
{*
 * Reduce packet size, correctly zeroing padding
 *
 * @param pkt packet
 * @param size new size
  }
procedure av_shrink_packet(pkt:PAVPacket; size:longint);cdecl;external;
{*
 * Increase packet size, correctly zeroing padding
 *
 * @param pkt packet
 * @param grow_by number of bytes by which to increase the size of the packet
  }
function av_grow_packet(pkt:PAVPacket; grow_by:longint):longint;cdecl;external;
{*
 * Initialize a reference-counted packet from av_malloc()ed data.
 *
 * @param pkt packet to be initialized. This function will set the data, size,
 *        and buf fields, all others are left untouched.
 * @param data Data allocated by av_malloc() to be used as packet data. If this
 *        function returns successfully, the data is owned by the underlying AVBuffer.
 *        The caller may not access the data through other means.
 * @param size size of data in bytes, without the padding. I.e. the full buffer
 *        size is assumed to be size + AV_INPUT_BUFFER_PADDING_SIZE.
 *
 * @return 0 on success, a negative AVERROR on error
  }
function av_packet_from_data(pkt:PAVPacket; data:Puint8_t; size:longint):longint;cdecl;external;
{*
 * Allocate new information of a packet.
 *
 * @param pkt packet
 * @param type side information type
 * @param size side information size
 * @return pointer to fresh allocated data or NULL otherwise
  }
function av_packet_new_side_data(pkt:PAVPacket; _type:TAVPacketSideDataType; size:Tsize_t):Puint8_t;cdecl;external;
{*
 * Wrap an existing array as a packet side data.
 *
 * @param pkt packet
 * @param type side information type
 * @param data the side data array. It must be allocated with the av_malloc()
 *             family of functions. The ownership of the data is transferred to
 *             pkt.
 * @param size side information size
 * @return a non-negative number on success, a negative AVERROR code on
 *         failure. On failure, the packet is unchanged and the data remains
 *         owned by the caller.
  }
function av_packet_add_side_data(pkt:PAVPacket; _type:TAVPacketSideDataType; data:Puint8_t; size:Tsize_t):longint;cdecl;external;
{*
 * Shrink the already allocated side data buffer
 *
 * @param pkt packet
 * @param type side information type
 * @param size new side information size
 * @return 0 on success, < 0 on failure
  }
function av_packet_shrink_side_data(pkt:PAVPacket; _type:TAVPacketSideDataType; size:Tsize_t):longint;cdecl;external;
{*
 * Get side information from packet.
 *
 * @param pkt packet
 * @param type desired side information type
 * @param size If supplied, *size will be set to the size of the side data
 *             or to zero if the desired side data is not present.
 * @return pointer to data if present or NULL otherwise
  }
(* Const before type ignored *)
function av_packet_get_side_data(pkt:PAVPacket; _type:TAVPacketSideDataType; size:Psize_t):Puint8_t;cdecl;external;
{*
 * Pack a dictionary for use in side_data.
 *
 * @param dict The dictionary to pack.
 * @param size pointer to store the size of the returned data
 * @return pointer to data if successful, NULL otherwise
  }
function av_packet_pack_dictionary(dict:PAVDictionary; size:Psize_t):Puint8_t;cdecl;external;
{*
 * Unpack a dictionary from side_data.
 *
 * @param data data from side_data
 * @param size size of the data
 * @param dict the metadata storage dictionary
 * @return 0 on success, < 0 on failure
  }
(* Const before type ignored *)
function av_packet_unpack_dictionary(data:Puint8_t; size:Tsize_t; dict:PPAVDictionary):longint;cdecl;external;
{*
 * Convenience function to free all the side data stored.
 * All the other fields stay untouched.
 *
 * @param pkt packet
  }
procedure av_packet_free_side_data(pkt:PAVPacket);cdecl;external;
{*
 * Setup a new reference to the data described by a given packet
 *
 * If src is reference-counted, setup dst as a new reference to the
 * buffer in src. Otherwise allocate a new buffer in dst and copy the
 * data from src into it.
 *
 * All the other fields are copied from src.
 *
 * @see av_packet_unref
 *
 * @param dst Destination packet. Will be completely overwritten.
 * @param src Source packet
 *
 * @return 0 on success, a negative AVERROR on error. On error, dst
 *         will be blank (as if returned by av_packet_alloc()).
  }
(* Const before type ignored *)
function av_packet_ref(dst:PAVPacket; src:PAVPacket):longint;cdecl;external;
{*
 * Wipe the packet.
 *
 * Unreference the buffer referenced by the packet and reset the
 * remaining packet fields to their default values.
 *
 * @param pkt The packet to be unreferenced.
  }
procedure av_packet_unref(pkt:PAVPacket);cdecl;external;
{*
 * Move every field in src to dst and reset src.
 *
 * @see av_packet_unref
 *
 * @param src Source packet, will be reset
 * @param dst Destination packet
  }
procedure av_packet_move_ref(dst:PAVPacket; src:PAVPacket);cdecl;external;
{*
 * Copy only "properties" fields from src to dst.
 *
 * Properties for the purpose of this function are all the fields
 * beside those related to the packet data (buf, data, size)
 *
 * @param dst Destination packet
 * @param src Source packet
 *
 * @return 0 on success AVERROR on failure.
  }
(* Const before type ignored *)
function av_packet_copy_props(dst:PAVPacket; src:PAVPacket):longint;cdecl;external;
{*
 * Ensure the data described by a given packet is reference counted.
 *
 * @note This function does not ensure that the reference will be writable.
 *       Use av_packet_make_writable instead for that purpose.
 *
 * @see av_packet_ref
 * @see av_packet_make_writable
 *
 * @param pkt packet whose data should be made reference counted.
 *
 * @return 0 on success, a negative AVERROR on error. On failure, the
 *         packet is unchanged.
  }
function av_packet_make_refcounted(pkt:PAVPacket):longint;cdecl;external;
{*
 * Create a writable reference for the data described by a given packet,
 * avoiding data copy if possible.
 *
 * @param pkt Packet whose data should be made writable.
 *
 * @return 0 on success, a negative AVERROR on failure. On failure, the
 *         packet is unchanged.
  }
function av_packet_make_writable(pkt:PAVPacket):longint;cdecl;external;
{*
 * Convert valid timing fields (timestamps / durations) in a packet from one
 * timebase to another. Timestamps with unknown values (AV_NOPTS_VALUE) will be
 * ignored.
 *
 * @param pkt packet on which the conversion will be performed
 * @param tb_src source timebase, in which the timing fields in pkt are
 *               expressed
 * @param tb_dst destination timebase, to which the timing fields will be
 *               converted
  }
procedure av_packet_rescale_ts(pkt:PAVPacket; tb_src:TAVRational; tb_dst:TAVRational);cdecl;external;
{*
 * @
  }
{$endif}
{ AVCODEC_PACKET_H }

implementation


end.
