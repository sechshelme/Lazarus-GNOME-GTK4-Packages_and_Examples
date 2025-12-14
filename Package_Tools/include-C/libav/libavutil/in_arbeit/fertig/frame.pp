
unit frame;
interface

{
  Automatically converted by H2Pas 1.0.0 from frame.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    frame.h
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
PAVActiveFormatDescription  = ^AVActiveFormatDescription;
PAVBufferRef  = ^AVBufferRef;
PAVDictionary  = ^AVDictionary;
PAVFrame  = ^AVFrame;
PAVFrameSideData  = ^AVFrameSideData;
PAVFrameSideDataType  = ^AVFrameSideDataType;
PAVRegionOfInterest  = ^AVRegionOfInterest;
Pchar  = ^char;
Puint8_t  = ^uint8_t;
Pxxxxxxxxxxxx  = ^xxxxxxxxxxxx;
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
{*
 * @file
 * @ingroup lavu_frame
 * reference-counted frame API
  }
{$ifndef AVUTIL_FRAME_H}
{$define AVUTIL_FRAME_H}
{$include <stddef.h>}
{$include <stdint.h>}
{$include "avutil.h"}
{$include "buffer.h"}
{$include "channel_layout.h"}
{$include "dict.h"}
{$include "rational.h"}
{$include "samplefmt.h"}
{$include "pixfmt.h"}
{$include "version.h"}
{*
 * @defgroup lavu_frame AVFrame
 * @ingroup lavu_data
 *
 * @
 * AVFrame is an abstraction for reference-counted raw multimedia data.
  }
{*
     * The data is the AVPanScan struct defined in libavcodec.
      }
{*
     * ATSC A53 Part 4 Closed Captions.
     * A53 CC bitstream is stored as uint8_t in AVFrameSideData.data.
     * The number of bytes of CC data is AVFrameSideData.size.
      }
{*
     * Stereoscopic 3d metadata.
     * The data is the AVStereo3D struct defined in libavutil/stereo3d.h.
      }
{*
     * The data is the AVMatrixEncoding enum defined in libavutil/channel_layout.h.
      }
{*
     * Metadata relevant to a downmix procedure.
     * The data is the AVDownmixInfo struct defined in libavutil/downmix_info.h.
      }
{*
     * ReplayGain information in the form of the AVReplayGain struct.
      }
{*
     * This side data contains a 3x3 transformation matrix describing an affine
     * transformation that needs to be applied to the frame for correct
     * presentation.
     *
     * See libavutil/display.h for a detailed description of the data.
      }
{*
     * Active Format Description data consisting of a single byte as specified
     * in ETSI TS 101 154 using AVActiveFormatDescription enum.
      }
{*
     * Motion vectors exported by some codecs (on demand through the export_mvs
     * flag set in the libavcodec AVCodecContext flags2 option).
     * The data is the AVMotionVector struct defined in
     * libavutil/motion_vector.h.
      }
{*
     * Recommmends skipping the specified number of samples. This is exported
     * only if the "skip_manual" AVOption is set in libavcodec.
     * This has the same format as AV_PKT_DATA_SKIP_SAMPLES.
     * @code
     * u32le number of samples to skip from start of this packet
     * u32le number of samples to skip from end of this packet
     * u8    reason for start skip
     * u8    reason for end   skip (0=padding silence, 1=convergence)
     * @endcode
      }
{*
     * This side data must be associated with an audio frame and corresponds to
     * enum AVAudioServiceType defined in avcodec.h.
      }
{*
     * Mastering display metadata associated with a video frame. The payload is
     * an AVMasteringDisplayMetadata type and contains information about the
     * mastering display color volume.
      }
{*
     * The GOP timecode in 25 bit timecode format. Data format is 64-bit integer.
     * This is set on the first frame of a GOP that has a temporal reference of 0.
      }
{*
     * The data represents the AVSphericalMapping structure defined in
     * libavutil/spherical.h.
      }
{*
     * Content light level (based on CTA-861.3). This payload contains data in
     * the form of the AVContentLightMetadata struct.
      }
{*
     * The data contains an ICC profile as an opaque octet buffer following the
     * format described by ISO 15076-1 with an optional name defined in the
     * metadata key entry "name".
      }
{*
     * Timecode which conforms to SMPTE ST 12-1. The data is an array of 4 uint32_t
     * where the first uint32_t describes how many (1-3) of the other timecodes are used.
     * The timecode format is described in the documentation of av_timecode_get_smpte_from_framenum()
     * function in libavutil/timecode.h.
      }
{*
     * HDR dynamic metadata associated with a video frame. The payload is
     * an AVDynamicHDRPlus type and contains information for color
     * volume transform - application 4 of SMPTE 2094-40:2016 standard.
      }
{*
     * Regions Of Interest, the data is an array of AVRegionOfInterest type, the number of
     * array element is implied by AVFrameSideData.size / AVRegionOfInterest.self_size.
      }
{*
     * Encoding parameters for a video frame, as described by AVVideoEncParams.
      }
{*
     * User data unregistered metadata associated with a video frame.
     * This is the H.26[45] UDU SEI message, and shouldn't be used for any other purpose
     * The data is stored as uint8_t in AVFrameSideData.data which is 16 bytes of
     * uuid_iso_iec_11578 followed by AVFrameSideData.size - 16 bytes of user_data_payload_byte.
      }
{*
     * Film grain parameters for a frame, described by AVFilmGrainParams.
     * Must be present for every frame which should have film grain applied.
      }
{*
     * Bounding boxes for object detection and classification,
     * as described by AVDetectionBBoxHeader.
      }
{*
     * Dolby Vision RPU raw data, suitable for passing to x265
     * or other libraries. Array of uint8_t, with NAL emulation
     * bytes intact.
      }
{*
     * Parsed Dolby Vision metadata, suitable for passing to a software
     * implementation. The payload is the AVDOVIMetadata struct defined in
     * libavutil/dovi_meta.h.
      }
{*
     * HDR Vivid dynamic metadata associated with a video frame. The payload is
     * an AVDynamicHDRVivid type and contains information for color
     * volume transform - CUVA 005.1-2021.
      }
{*
     * Ambient viewing environment metadata, as defined by H.274.
      }
{*
     * Provide encoder-specific hinting information about changed/unchanged
     * portions of a frame.  It can be used to pass information about which
     * macroblocks can be skipped because they didn't change from the
     * corresponding ones in the previous frame. This could be useful for
     * applications which know this information in advance to speed up
     * encoding.
      }
type
  TAVFrameSideDataType =  Longint;
  Const
    AV_FRAME_DATA_PANSCAN = 0;
    AV_FRAME_DATA_A53_CC = 1;
    AV_FRAME_DATA_STEREO3D = 2;
    AV_FRAME_DATA_MATRIXENCODING = 3;
    AV_FRAME_DATA_DOWNMIX_INFO = 4;
    AV_FRAME_DATA_REPLAYGAIN = 5;
    AV_FRAME_DATA_DISPLAYMATRIX = 6;
    AV_FRAME_DATA_AFD = 7;
    AV_FRAME_DATA_MOTION_VECTORS = 8;
    AV_FRAME_DATA_SKIP_SAMPLES = 9;
    AV_FRAME_DATA_AUDIO_SERVICE_TYPE = 10;
    AV_FRAME_DATA_MASTERING_DISPLAY_METADATA = 11;
    AV_FRAME_DATA_GOP_TIMECODE = 12;
    AV_FRAME_DATA_SPHERICAL = 13;
    AV_FRAME_DATA_CONTENT_LIGHT_LEVEL = 14;
    AV_FRAME_DATA_ICC_PROFILE = 15;
    AV_FRAME_DATA_S12M_TIMECODE = 16;
    AV_FRAME_DATA_DYNAMIC_HDR_PLUS = 17;
    AV_FRAME_DATA_REGIONS_OF_INTEREST = 18;
    AV_FRAME_DATA_VIDEO_ENC_PARAMS = 19;
    AV_FRAME_DATA_SEI_UNREGISTERED = 20;
    AV_FRAME_DATA_FILM_GRAIN_PARAMS = 21;
    AV_FRAME_DATA_DETECTION_BBOXES = 22;
    AV_FRAME_DATA_DOVI_RPU_BUFFER = 23;
    AV_FRAME_DATA_DOVI_METADATA = 24;
    AV_FRAME_DATA_DYNAMIC_HDR_VIVID = 25;
    AV_FRAME_DATA_AMBIENT_VIEWING_ENVIRONMENT = 26;
    AV_FRAME_DATA_VIDEO_HINT = 27;

type
  TAVActiveFormatDescription =  Longint;
  Const
    AV_AFD_SAME = 8;
    AV_AFD_4_3 = 9;
    AV_AFD_16_9 = 10;
    AV_AFD_14_9 = 11;
    AV_AFD_4_3_SP_14_9 = 13;
    AV_AFD_16_9_SP_14_9 = 14;
    AV_AFD_SP_4_3 = 15;

{*
 * Structure to hold side data for an AVFrame.
 *
 * sizeof(AVFrameSideData) is not a part of the public ABI, so new fields may be added
 * to the end with a minor bump.
  }
type
  PAVFrameSideData = ^TAVFrameSideData;
  TAVFrameSideData = record
      _type : TAVFrameSideDataType;
      data : Puint8_t;
      size : Tsize_t;
      metadata : PAVDictionary;
      buf : PAVBufferRef;
    end;
{*
 * Structure describing a single Region Of Interest.
 *
 * When multiple regions are defined in a single side-data block, they
 * should be ordered from most to least important - some encoders are only
 * capable of supporting a limited number of distinct regions, so will have
 * to truncate the list.
 *
 * When overlapping regions are defined, the first region containing a given
 * area of the frame applies.
  }
{*
     * Must be set to the size of this data structure (that is,
     * sizeof(AVRegionOfInterest)).
      }
{*
     * Distance in pixels from the top edge of the frame to the top and
     * bottom edges and from the left edge of the frame to the left and
     * right edges of the rectangle defining this region of interest.
     *
     * The constraints on a region are encoder dependent, so the region
     * actually affected may be slightly larger for alignment or other
     * reasons.
      }
{*
     * Quantisation offset.
     *
     * Must be in the range -1 to +1.  A value of zero indicates no quality
     * change.  A negative value asks for better quality (less quantisation),
     * while a positive value asks for worse quality (greater quantisation).
     *
     * The range is calibrated so that the extreme values indicate the
     * largest possible offset - if the rest of the frame is encoded with the
     * worst possible quality, an offset of -1 indicates that this region
     * should be encoded with the best possible quality anyway.  Intermediate
     * values are then interpolated in some codec-dependent way.
     *
     * For example, in 10-bit H.264 the quantisation parameter varies between
     * -12 and 51.  A typical qoffset value of -1/10 therefore indicates that
     * this region should be encoded with a QP around one-tenth of the full
     * range better than the rest of the frame.  So, if most of the frame
     * were to be encoded with a QP of around 30, this region would get a QP
     * of around 24 (an offset of approximately -1/10 * (51 - -12) = -6.3).
     * An extreme value of -1 would indicate that this region should be
     * encoded with the best possible quality regardless of the treatment of
     * the rest of the frame - that is, should be encoded at a QP of -12.
      }

  PAVRegionOfInterest = ^TAVRegionOfInterest;
  TAVRegionOfInterest = record
      self_size : Tuint32_t;
      top : longint;
      bottom : longint;
      left : longint;
      right : longint;
      qoffset : TAVRational;
    end;
{*
 * This structure describes decoded (raw) audio or video data.
 *
 * AVFrame must be allocated using av_frame_alloc(). Note that this only
 * allocates the AVFrame itself, the buffers for the data must be managed
 * through other means (see below).
 * AVFrame must be freed with av_frame_free().
 *
 * AVFrame is typically allocated once and then reused multiple times to hold
 * different data (e.g. a single AVFrame to hold frames received from a
 * decoder). In such a case, av_frame_unref() will free any references held by
 * the frame and reset it to its original clean state before it
 * is reused again.
 *
 * The data described by an AVFrame is usually reference counted through the
 * AVBuffer API. The underlying buffer references are stored in AVFrame.buf /
 * AVFrame.extended_buf. An AVFrame is considered to be reference counted if at
 * least one reference is set, i.e. if AVFrame.buf[0] != NULL. In such a case,
 * every single data plane must be contained in one of the buffers in
 * AVFrame.buf or AVFrame.extended_buf.
 * There may be a single buffer for all the data, or one separate buffer for
 * each plane, or anything in between.
 *
 * sizeof(AVFrame) is not a part of the public ABI, so new fields may be added
 * to the end with a minor bump.
 *
 * Fields can be accessed through AVOptions, the name string used, matches the
 * C structure field name for fields accessible through AVOptions. The AVClass
 * for AVFrame can be obtained from avcodec_get_frame_class()
  }
{xxxxxxxxxxxxx     }

  PAVFrame = ^TAVFrame;
  TAVFrame = record
      xxxxxxxxx : Tint64_t;
    end;
{*
 * Allocate an AVFrame and set its fields to default values.  The resulting
 * struct must be freed using av_frame_free().
 *
 * @return An AVFrame filled with default values or NULL on failure.
 *
 * @note this only allocates the AVFrame itself, not the data buffers. Those
 * must be allocated through other means, e.g. with av_frame_get_buffer() or
 * manually.
  }

function av_frame_alloc:PAVFrame;cdecl;external;
{*
 * Free the frame and any dynamically allocated objects in it,
 * e.g. extended_data. If the frame is reference counted, it will be
 * unreferenced first.
 *
 * @param frame frame to be freed. The pointer will be set to NULL.
  }
procedure av_frame_free(frame:PPAVFrame);cdecl;external;
{*
 * Set up a new reference to the data described by the source frame.
 *
 * Copy frame properties from src to dst and create a new reference for each
 * AVBufferRef from src.
 *
 * If src is not reference counted, new buffers are allocated and the data is
 * copied.
 *
 * @warning: dst MUST have been either unreferenced with av_frame_unref(dst),
 *           or newly allocated with av_frame_alloc() before calling this
 *           function, or undefined behavior will occur.
 *
 * @return 0 on success, a negative AVERROR on error
  }
(* Const before type ignored *)
function av_frame_ref(dst:PAVFrame; src:PAVFrame):longint;cdecl;external;
{*
 * Ensure the destination frame refers to the same data described by the source
 * frame, either by creating a new reference for each AVBufferRef from src if
 * they differ from those in dst, by allocating new buffers and copying data if
 * src is not reference counted, or by unrefencing it if src is empty.
 *
 * Frame properties on dst will be replaced by those from src.
 *
 * @return 0 on success, a negative AVERROR on error. On error, dst is
 *         unreferenced.
  }
(* Const before type ignored *)
function av_frame_replace(dst:PAVFrame; src:PAVFrame):longint;cdecl;external;
{*
 * Create a new frame that references the same data as src.
 *
 * This is a shortcut for av_frame_alloc()+av_frame_ref().
 *
 * @return newly created AVFrame on success, NULL on error.
  }
(* Const before type ignored *)
function av_frame_clone(src:PAVFrame):PAVFrame;cdecl;external;
{*
 * Unreference all the buffers referenced by frame and reset the frame fields.
  }
procedure av_frame_unref(frame:PAVFrame);cdecl;external;
{*
 * Move everything contained in src to dst and reset src.
 *
 * @warning: dst is not unreferenced, but directly overwritten without reading
 *           or deallocating its contents. Call av_frame_unref(dst) manually
 *           before calling this function to ensure that no memory is leaked.
  }
procedure av_frame_move_ref(dst:PAVFrame; src:PAVFrame);cdecl;external;
{*
 * Allocate new buffer(s) for audio or video data.
 *
 * The following fields must be set on frame before calling this function:
 * - format (pixel format for video, sample format for audio)
 * - width and height for video
 * - nb_samples and ch_layout for audio
 *
 * This function will fill AVFrame.data and AVFrame.buf arrays and, if
 * necessary, allocate and fill AVFrame.extended_data and AVFrame.extended_buf.
 * For planar formats, one buffer will be allocated for each plane.
 *
 * @warning: if frame already has been allocated, calling this function will
 *           leak memory. In addition, undefined behavior can occur in certain
 *           cases.
 *
 * @param frame frame in which to store the new buffers.
 * @param align Required buffer size alignment. If equal to 0, alignment will be
 *              chosen automatically for the current CPU. It is highly
 *              recommended to pass 0 here unless you know what you are doing.
 *
 * @return 0 on success, a negative AVERROR on error.
  }
function av_frame_get_buffer(frame:PAVFrame; align:longint):longint;cdecl;external;
{*
 * Check if the frame data is writable.
 *
 * @return A positive value if the frame data is writable (which is true if and
 * only if each of the underlying buffers has only one reference, namely the one
 * stored in this frame). Return 0 otherwise.
 *
 * If 1 is returned the answer is valid until av_buffer_ref() is called on any
 * of the underlying AVBufferRefs (e.g. through av_frame_ref() or directly).
 *
 * @see av_frame_make_writable(), av_buffer_is_writable()
  }
function av_frame_is_writable(frame:PAVFrame):longint;cdecl;external;
{*
 * Ensure that the frame data is writable, avoiding data copy if possible.
 *
 * Do nothing if the frame is writable, allocate new buffers and copy the data
 * if it is not. Non-refcounted frames behave as non-writable, i.e. a copy
 * is always made.
 *
 * @return 0 on success, a negative AVERROR on error.
 *
 * @see av_frame_is_writable(), av_buffer_is_writable(),
 * av_buffer_make_writable()
  }
function av_frame_make_writable(frame:PAVFrame):longint;cdecl;external;
{*
 * Copy the frame data from src to dst.
 *
 * This function does not allocate anything, dst must be already initialized and
 * allocated with the same parameters as src.
 *
 * This function only copies the frame data (i.e. the contents of the data /
 * extended data arrays), not any other properties.
 *
 * @return >= 0 on success, a negative AVERROR on error.
  }
(* Const before type ignored *)
function av_frame_copy(dst:PAVFrame; src:PAVFrame):longint;cdecl;external;
{*
 * Copy only "metadata" fields from src to dst.
 *
 * Metadata for the purpose of this function are those fields that do not affect
 * the data layout in the buffers.  E.g. pts, sample rate (for audio) or sample
 * aspect ratio (for video), but not width/height or channel layout.
 * Side data is also copied.
  }
(* Const before type ignored *)
function av_frame_copy_props(dst:PAVFrame; src:PAVFrame):longint;cdecl;external;
{*
 * Get the buffer reference a given data plane is stored in.
 *
 * @param frame the frame to get the plane's buffer from
 * @param plane index of the data plane of interest in frame->extended_data.
 *
 * @return the buffer reference that contains the plane or NULL if the input
 * frame is not valid.
  }
(* Const before type ignored *)
function av_frame_get_plane_buffer(frame:PAVFrame; plane:longint):PAVBufferRef;cdecl;external;
{*
 * Add a new side data to a frame.
 *
 * @param frame a frame to which the side data should be added
 * @param type type of the added side data
 * @param size size of the side data
 *
 * @return newly added side data on success, NULL on error
  }
function av_frame_new_side_data(frame:PAVFrame; _type:TAVFrameSideDataType; size:Tsize_t):PAVFrameSideData;cdecl;external;
{*
 * Add a new side data to a frame from an existing AVBufferRef
 *
 * @param frame a frame to which the side data should be added
 * @param type  the type of the added side data
 * @param buf   an AVBufferRef to add as side data. The ownership of
 *              the reference is transferred to the frame.
 *
 * @return newly added side data on success, NULL on error. On failure
 *         the frame is unchanged and the AVBufferRef remains owned by
 *         the caller.
  }
function av_frame_new_side_data_from_buf(frame:PAVFrame; _type:TAVFrameSideDataType; buf:PAVBufferRef):PAVFrameSideData;cdecl;external;
{*
 * @return a pointer to the side data of a given type on success, NULL if there
 * is no side data with such type in this frame.
  }
(* Const before type ignored *)
function av_frame_get_side_data(frame:PAVFrame; _type:TAVFrameSideDataType):PAVFrameSideData;cdecl;external;
{*
 * Remove and free all side data instances of the given type.
  }
procedure av_frame_remove_side_data(frame:PAVFrame; _type:TAVFrameSideDataType);cdecl;external;
{*
 * Flags for frame cropping.
  }
{*
     * Apply the maximum possible cropping, even if it requires setting the
     * AVFrame.data[] entries to unaligned pointers. Passing unaligned data
     * to FFmpeg API is generally not allowed, and causes undefined behavior
     * (such as crashes). You can pass unaligned data only to FFmpeg APIs that
     * are explicitly documented to accept it. Use this flag only if you
     * absolutely know what you are doing.
      }
type
  Txxxxxxxxxxxx =  Longint;
  Const
    AV_FRAME_CROP_UNALIGNED = 1 shl 0;

{*
 * Crop the given video AVFrame according to its crop_left/crop_top/crop_right/
 * crop_bottom fields. If cropping is successful, the function will adjust the
 * data pointers and the width/height fields, and set the crop fields to 0.
 *
 * In all cases, the cropping boundaries will be rounded to the inherent
 * alignment of the pixel format. In some cases, such as for opaque hwaccel
 * formats, the left/top cropping is ignored. The crop fields are set to 0 even
 * if the cropping was rounded or ignored.
 *
 * @param frame the frame which should be cropped
 * @param flags Some combination of AV_FRAME_CROP_* flags, or 0.
 *
 * @return >= 0 on success, a negative AVERROR on error. If the cropping fields
 * were invalid, AVERROR(ERANGE) is returned, and nothing is changed.
  }

function av_frame_apply_cropping(frame:PAVFrame; flags:longint):longint;cdecl;external;
{*
 * @return a string identifying the side data type
  }
(* Const before type ignored *)
function av_frame_side_data_name(_type:TAVFrameSideDataType):Pchar;cdecl;external;
{*
 * @
  }
{$endif}
{ AVUTIL_FRAME_H  }

implementation


end.
