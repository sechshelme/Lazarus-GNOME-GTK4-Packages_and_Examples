unit video_anc;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2018> Edward Hervey <edward@centricular.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_VIDEO_ANC_H__}
{$define __GST_VIDEO_ANC_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-format.h>}
{$include <gst/video/video-info.h>}
type
{*
 * GstVideoAncillary:
 * @DID: The Data Identifier
 * @SDID_block_number: The Secondary Data Identifier (if type 2) or the Data
 *                     Block Number (if type 1)
 * @data_count: The amount of data (in bytes) in @data (max 255 bytes)
 * @data: (array fixed-size=256): The user data content of the Ancillary packet.
 *    Does not contain the ADF, DID, SDID nor CS.
 *
 * Video Ancillary data, according to SMPTE-291M specification.
 *
 * Note that the contents of the data are always stored as 8bit data (i.e. do not contain
 * the parity check bits).
 *
 * Since: 1.16
  }
{< private > }
{ Padding for future extension  }
  PGstVideoAncillary = ^TGstVideoAncillary;
  TGstVideoAncillary = record
      DID : Tguint8;
      SDID_block_number : Tguint8;
      data_count : Tguint8;
      data : array[0..255] of Tguint8;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVideoAncillaryDID:
 *
 * Since: 1.16
  }

  PGstVideoAncillaryDID = ^TGstVideoAncillaryDID;
  TGstVideoAncillaryDID =  Longint;
  Const
    GST_VIDEO_ANCILLARY_DID_UNDEFINED = $00;
    GST_VIDEO_ANCILLARY_DID_DELETION = $80;
    GST_VIDEO_ANCILLARY_DID_HANC_3G_AUDIO_DATA_FIRST = $a0;
    GST_VIDEO_ANCILLARY_DID_HANC_3G_AUDIO_DATA_LAST = $a7;
    GST_VIDEO_ANCILLARY_DID_HANC_HDTV_AUDIO_DATA_FIRST = $e0;
    GST_VIDEO_ANCILLARY_DID_HANC_HDTV_AUDIO_DATA_LAST = $e7;
    GST_VIDEO_ANCILLARY_DID_HANC_SDTV_AUDIO_DATA_1_FIRST = $ec;
    GST_VIDEO_ANCILLARY_DID_HANC_SDTV_AUDIO_DATA_1_LAST = $ef;
    GST_VIDEO_ANCILLARY_DID_CAMERA_POSITION = $f0;
    GST_VIDEO_ANCILLARY_DID_HANC_ERROR_DETECTION = $f4;
    GST_VIDEO_ANCILLARY_DID_HANC_SDTV_AUDIO_DATA_2_FIRST = $f8;
    GST_VIDEO_ANCILLARY_DID_HANC_SDTV_AUDIO_DATA_2_LAST = $ff;
;
{*
 * GST_VIDEO_ANCILLARY_DID16:
 * @anc: a #GstVideoAncillary
 *
 * Returns the #GstVideoAncillaryDID16 of the ancillary data.
 *
 * Since: 1.16
 *
 * Returns: a #GstVideoAncillaryDID16 identifier
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_VIDEO_ANCILLARY_DID16(anc : longint) : longint;

{*
 * GstVideoAncillaryDID16:
 * @GST_VIDEO_ANCILLARY_DID16_S334_EIA_708: CEA 708 Ancillary data according to SMPTE 334
 * @GST_VIDEO_ANCILLARY_DID16_S334_EIA_608: CEA 608 Ancillary data according to SMPTE 334
 * @GST_VIDEO_ANCILLARY_DID16_S2016_3_AFD_BAR: AFD/Bar Ancillary data according to SMPTE 2016-3 (Since: 1.18)
 *
 * Some know types of Ancillary Data identifiers.
 *
 * Since: 1.16
  }
type
  PGstVideoAncillaryDID16 = ^TGstVideoAncillaryDID16;
  TGstVideoAncillaryDID16 =  Longint;
  Const
    GST_VIDEO_ANCILLARY_DID16_S334_EIA_708 = $6101;
    GST_VIDEO_ANCILLARY_DID16_S334_EIA_608 = $6102;
    GST_VIDEO_ANCILLARY_DID16_S2016_3_AFD_BAR = $4105;
;
{*
 * GstAncillaryMetaField:
 * @GST_ANCILLARY_META_FIELD_PROGRESSIVE: Progressive or no field specified (default)
 * @GST_ANCILLARY_META_FIELD_INTERLACED_FIRST: Interlaced first field
 * @GST_ANCILLARY_META_FIELD_INTERLACED_SECOND: Interlaced second field
 *
 * Location of a @GstAncillaryMeta.
 *
 * Since: 1.24
  }
type
  PGstAncillaryMetaField = ^TGstAncillaryMetaField;
  TGstAncillaryMetaField =  Longint;
  Const
    GST_ANCILLARY_META_FIELD_PROGRESSIVE = $00;
    GST_ANCILLARY_META_FIELD_INTERLACED_FIRST = $10;
    GST_ANCILLARY_META_FIELD_INTERLACED_SECOND = $11;
;
{*
 * GstAncillaryMeta:
 * @meta: Parent #GstMeta
 * @field: The field where the ancillary data is located
 * @c_not_y_channel: Which channel (luminance or chrominance) the ancillary
 *    data is located. 0 if content is SD or stored in the luminance channel
 *    (default). 1 if HD and stored in the chrominance channel.
 * @line: The line on which the ancillary data is located (max 11bit). There
 *    are two special values: 0x7ff if no line is specified (default), 0x7fe
 *    to specify the ancillary data is on any valid line before active video
 * @offset: The location of the ancillary data packet in a SDI raster relative
 *    to the start of active video (max 12bits). A value of 0 means the ADF of
 *    the ancillary packet starts immediately following SAV. There are 3
 *    special values: 0xfff: No specified location (default), 0xffe: within
 *    HANC data space, 0xffd: within the ancillary data space located between
 *    SAV and EAV
 * @DID: Data Identified
 * @SDID_block_number: Secondary Data identification (if type 2) or Data block
 *    number (if type 1)
 * @data_count: The amount of user data
 * @data: (array length=data_count): The User data
 * @checksum: The checksum of the ADF
 *
 * #GstMeta for carrying SMPTE-291M Ancillary data. Note that all the ADF fields
 *    (@DID to @checksum) are 10bit values with parity/non-parity high-bits set.
 *
 * Since: 1.24
  }
{ Field location  }
{ 1 if content is HD and the ANC data is stored
				   in the chrominance channel. 0 if content is
				   SD or the ANC data is stored in the luminance
				   channel (default)  }
{ The line on which this ANC data is located.
				 *
				 * 11bit value
				 *
				 * Special values:
				 * * 0x7ff : No line specified (default)
				 * * 0x7fe : Any valid line before active video  }
{ Location of the ANC data packet in a SDI
				 * raster relative to SAV. A value of 0 means
				 * the ADF of the ANC data packet beings
				 * immediately following SAV.
				 *
				 * 12bits value
				 *
				 * The unit is 10-bit words of the indicated
				 * data stream and data channel
				 *
				 * Special values:
				 * * 0xfff: No specified horizontal location (default)
				 * * 0xffe: Within HANC data space
				 * * 0xffd: Within the ancillary data space located
				 *     between SAV and EAV
				  }
{ EXCLUDED from ANC RTP are the multi-stream properties (ex: stereoscopic
   * video). That information should be conveyed by having separate VANC
   * streams  }
{ What follows are all the fields making up a ST 291 ADF packet. All of the
   * fields are stored as 10bit, including the parity/non-parity high-bits set.
   *
   * To access the 8bit content, just cast the value  }
{ Data Identifier (10 bit)  }
{ Secondary data identification (If type 2) or
				 * Data Block number (if type 1). Value is
				 * 10bit  }
{ The amount of User Data. Only the low 8 bits are to be used  }
{ The User Data (10bit)  }
{ The checksum (10bit)  }
type
  PGstAncillaryMeta = ^TGstAncillaryMeta;
  TGstAncillaryMeta = record
      meta : TGstMeta;
      field : TGstAncillaryMetaField;
      c_not_y_channel : Tgboolean;
      line : Tguint16;
      offset : Tguint16;
      DID : Tguint16;
      SDID_block_number : Tguint16;
      data_count : Tguint16;
      data : Pguint16;
      checksum : Tguint16;
    end;

function gst_ancillary_meta_api_get_type:TGType;cdecl;external libgstvideo;
{ was #define dname def_expr }
function GST_ANCILLARY_META_API_TYPE : longint; { return type might be wrong }

function gst_ancillary_meta_get_info:PGstMetaInfo;cdecl;external libgstvideo;
{ was #define dname def_expr }
function GST_ANCILLARY_META_INFO : longint; { return type might be wrong }

function gst_buffer_add_ancillary_meta(buffer:PGstBuffer):PGstAncillaryMeta;cdecl;external libgstvideo;
{*
 * gst_buffer_get_ancillary_meta:
 * @b: A #GstBuffer
 *
 * Gets the #GstAncillaryMeta that might be present on @b.
 *
 * Note: It is quite likely that there might be more than one ancillary meta on
 * a given buffer. This function will only return the first one. See gst_buffer_iterate_ancillary_meta() for a way to iterate over all ancillary metas of the buffer.
 *
 * Since: 1.24
 *
 * Returns: The first #GstAncillaryMeta present on @b, or %NULL if none are
 * present.
  }
{ xxxxxxxxx #define gst_buffer_get_ancillary_meta(b) ((GstAncillaryMeta*)gst_buffer_get_meta((b), GST_ANCILLARY_META_API_TYPE) }
{*
 * gst_buffer_iterate_ancillary_meta:
 * @b: A #GstBuffer
 * @s: (out caller-allocates): An opaque state pointer
 *
 * Retrieves the next #GstAncillaryMeta after the current one according to
 * @s. If @s points to %NULL, the first #GstAncillaryMeta will be returned (if
 * any).
 *
 * @s will be updated with an opaque state pointer.
 *
 * Since: 1.24
 *
 * Returns: (transfer none) (nullable): The next #GstAncillaryMeta present on @b
 * or %NULL when there are no more items.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_iterate_ancillary_meta(b,s : longint) : PGstAncillaryMeta;

{*
 * GstVideoAFDValue:
 * @GST_VIDEO_AFD_UNAVAILABLE: Unavailable (see note 0 below).
 * @GST_VIDEO_AFD_16_9_TOP_ALIGNED: For 4:3 coded frame, letterbox 16:9 image,
 *      at top of the coded frame. For 16:9 coded frame, full frame 16:9 image,
 *      the same as the coded frame.
 * @GST_VIDEO_AFD_14_9_TOP_ALIGNED: For 4:3 coded frame, letterbox 14:9 image,
 *      at top of the coded frame. For 16:9 coded frame, pillarbox 14:9 image,
 *      horizontally centered in the coded frame.
 * @GST_VIDEO_AFD_GREATER_THAN_16_9: For 4:3 coded frame, letterbox image with an aspect ratio
 *      greater than 16:9, vertically centered in the coded frame. For 16:9 coded frame,
 *      letterbox image with an aspect ratio greater than 16:9.
 * @GST_VIDEO_AFD_4_3_FULL_16_9_FULL: For 4:3 coded frame, full frame 4:3 image,
 *      the same as the coded frame. For 16:9 coded frame, full frame 16:9 image, the same as
 *      the coded frame.
 * @GST_VIDEO_AFD_4_3_FULL_4_3_PILLAR: For 4:3 coded frame, full frame 4:3 image, the same as
 *      the coded frame. For 16:9 coded frame, pillarbox 4:3 image, horizontally centered in the
 *      coded frame.
 * @GST_VIDEO_AFD_16_9_LETTER_16_9_FULL: For 4:3 coded frame, letterbox 16:9 image, vertically centered in
 *      the coded frame with all image areas protected. For 16:9 coded frame, full frame 16:9 image,
 *      with all image areas protected.
 * @GST_VIDEO_AFD_14_9_LETTER_14_9_PILLAR: For 4:3 coded frame, letterbox 14:9 image, vertically centered in
 *      the coded frame. For 16:9 coded frame, pillarbox 14:9 image, horizontally centered in the
 *      coded frame.
 * @GST_VIDEO_AFD_4_3_FULL_14_9_CENTER: For 4:3 coded frame, full frame 4:3 image, with alternative 14:9
 *      center. For 16:9 coded frame, pillarbox 4:3 image, with alternative 14:9 center.
 * @GST_VIDEO_AFD_16_9_LETTER_14_9_CENTER: For 4:3 coded frame, letterbox 16:9 image, with alternative 14:9
 *      center. For 16:9 coded frame, full frame 16:9 image, with alternative 14:9 center.
 * @GST_VIDEO_AFD_16_9_LETTER_4_3_CENTER: For 4:3 coded frame, letterbox 16:9 image, with alternative 4:3
 *      center. For 16:9 coded frame, full frame 16:9 image, with alternative 4:3 center.
 *
 * Enumeration of the various values for Active Format Description (AFD)
 *
 * AFD should be included in video user data whenever the rectangular
 * picture area containing useful information does not extend to the full height or width of the coded
 * frame. AFD data may also be included in user data when the rectangular picture area containing
 * useful information extends to the full height and width of the coded frame.
 *
 * For details, see Table 6.14 Active Format in:
 *
 * ATSC Digital Television Standard:
 * Part 4 – MPEG-2 Video System Characteristics
 *
 * https://www.atsc.org/wp-content/uploads/2015/03/a_53-Part-4-2009.pdf
 *
 * and Active Format Description in Complete list of AFD codes
 *
 * https://en.wikipedia.org/wiki/Active_Format_Description#Complete_list_of_AFD_codes
 *
 * and SMPTE ST2016-1
 *
 * Notes:
 *
 * 1) AFD 0 is undefined for ATSC and SMPTE ST2016-1, indicating that AFD data is not available:
 * If Bar Data is not present, AFD '0000' indicates that exact information
 * is not available and the active image should be assumed to be the same as the coded frame. AFD '0000'.
 * AFD '0000' accompanied by Bar Data signals that the active image’s aspect ratio is narrower than 16:9,
 * but is not 4:3 or 14:9. As the exact aspect ratio cannot be conveyed by AFD alone, wherever possible,
 * AFD ‘0000’ should be accompanied by Bar Data to define the exact vertical or horizontal extent
 * of the active image.
 * 2) AFD 0 is reserved for DVB/ETSI
 * 3) values 1, 5, 6, 7, and 12 are reserved for both ATSC and DVB/ETSI
 * 4) values 2 and 3 are not recommended for ATSC, but are valid for DVB/ETSI
 *
 * Since: 1.18
  }
type
  PGstVideoAFDValue = ^TGstVideoAFDValue;
  TGstVideoAFDValue =  Longint;
  Const
    GST_VIDEO_AFD_UNAVAILABLE = 0;
    GST_VIDEO_AFD_16_9_TOP_ALIGNED = 2;
    GST_VIDEO_AFD_14_9_TOP_ALIGNED = 3;
    GST_VIDEO_AFD_GREATER_THAN_16_9 = 4;
    GST_VIDEO_AFD_4_3_FULL_16_9_FULL = 8;
    GST_VIDEO_AFD_4_3_FULL_4_3_PILLAR = 9;
    GST_VIDEO_AFD_16_9_LETTER_16_9_FULL = 10;
    GST_VIDEO_AFD_14_9_LETTER_14_9_PILLAR = 11;
    GST_VIDEO_AFD_4_3_FULL_14_9_CENTER = 13;
    GST_VIDEO_AFD_16_9_LETTER_14_9_CENTER = 14;
    GST_VIDEO_AFD_16_9_LETTER_4_3_CENTER = 15;
;
{*
 * GstVideoAFDSpec:
 * @GST_VIDEO_AFD_SPEC_DVB_ETSI: AFD value is from DVB/ETSI standard
 * @GST_VIDEO_AFD_SPEC_ATSC_A53: AFD value is from ATSC A/53 standard
 * @GST_VIDEO_AFD_SPEC_SMPT_ST2016_1 : AFD value is from SMPTE ST2016-1 standard
 *
 * Enumeration of the different standards that may apply to AFD data:
 *
 * 0) ETSI/DVB:
 * https://www.etsi.org/deliver/etsi_ts/101100_101199/101154/02.01.01_60/ts_101154v020101p.pdf
 *
 * 1) ATSC A/53:
 * https://www.atsc.org/wp-content/uploads/2015/03/a_53-Part-4-2009.pdf
 *
 * 2) SMPTE ST2016-1:
 *
 * Since: 1.18
  }
type
  PGstVideoAFDSpec = ^TGstVideoAFDSpec;
  TGstVideoAFDSpec =  Longint;
  Const
    GST_VIDEO_AFD_SPEC_DVB_ETSI = 0;
    GST_VIDEO_AFD_SPEC_ATSC_A53 = 1;
    GST_VIDEO_AFD_SPEC_SMPTE_ST2016_1 = 2;
;
{*
 * GstVideoAFDMeta:
 * @meta: parent #GstMeta
 * @field: 0 for progressive or field 1 and 1 for field 2
 * @spec: #GstVideoAFDSpec that applies to @afd
 * @afd: #GstVideoAFDValue AFD value
 *
 * Active Format Description (AFD)
 *
 * For details, see Table 6.14 Active Format in:
 *
 * ATSC Digital Television Standard:
 * Part 4 – MPEG-2 Video System Characteristics
 *
 * https://www.atsc.org/wp-content/uploads/2015/03/a_53-Part-4-2009.pdf
 *
 * and Active Format Description in Complete list of AFD codes
 *
 * https://en.wikipedia.org/wiki/Active_Format_Description#Complete_list_of_AFD_codes
 *
 * and SMPTE ST2016-1
 *
 * Since: 1.18
  }
type
  PGstVideoAFDMeta = ^TGstVideoAFDMeta;
  TGstVideoAFDMeta = record
      meta : TGstMeta;
      field : Tguint8;
      spec : TGstVideoAFDSpec;
      afd : TGstVideoAFDValue;
    end;

function gst_video_afd_meta_api_get_type:TGType;cdecl;external libgstvideo;
{ was #define dname def_expr }
function GST_VIDEO_AFD_META_API_TYPE : longint; { return type might be wrong }

function gst_video_afd_meta_get_info:PGstMetaInfo;cdecl;external libgstvideo;
{ was #define dname def_expr }
function GST_VIDEO_AFD_META_INFO : longint; { return type might be wrong }

{*
 * gst_buffer_get_video_afd_meta:
 * @b: A #GstBuffer
 *
 * Gets the #GstVideoAFDMeta that might be present on @b.
 *
 * Note: there may be two #GstVideoAFDMeta structs for interlaced video.
 *
 * Since: 1.18
 *
 * Returns: (nullable): The first #GstVideoAFDMeta present on @b, or %NULL if
 * no #GstVideoAFDMeta are present
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_afd_meta(b : longint) : PGstVideoAFDMeta;

function gst_buffer_add_video_afd_meta(buffer:PGstBuffer; field:Tguint8; spec:TGstVideoAFDSpec; afd:TGstVideoAFDValue):PGstVideoAFDMeta;cdecl;external libgstvideo;
{*
 * GstVideoBarMeta:
 * @meta: parent #GstMeta
 * @field: 0 for progressive or field 1 and 1 for field 2
 * @is_letterbox: if true then bar data specifies letterbox, otherwise pillarbox
 * @bar_data1: If @is_letterbox is true, then the value specifies the
 *      last line of a horizontal letterbox bar area at top of reconstructed frame.
 *      Otherwise, it specifies the last horizontal luminance sample of a vertical pillarbox
 *      bar area at the left side of the reconstructed frame
 * @bar_data2: If @is_letterbox is true, then the value specifies the
 *      first line of a horizontal letterbox bar area at bottom of reconstructed frame.
 *      Otherwise, it specifies the first horizontal
 *      luminance sample of a vertical pillarbox bar area at the right side of the reconstructed frame.
 *
 * Bar data should be included in video user data
 * whenever the rectangular picture area containing useful information
 * does not extend to the full height or width of the coded frame
 * and AFD alone is insufficient to describe the extent of the image.
 *
 * Note: either vertical or horizontal bars are specified, but not both.
 *
 * For more details, see:
 *
 * https://www.atsc.org/wp-content/uploads/2015/03/a_53-Part-4-2009.pdf
 *
 * and SMPTE ST2016-1
 *
 * Since: 1.18
  }
type
  PGstVideoBarMeta = ^TGstVideoBarMeta;
  TGstVideoBarMeta = record
      meta : TGstMeta;
      field : Tguint8;
      is_letterbox : Tgboolean;
      bar_data1 : Tguint;
      bar_data2 : Tguint;
    end;

function gst_video_bar_meta_api_get_type:TGType;cdecl;external libgstvideo;
{ was #define dname def_expr }
function GST_VIDEO_BAR_META_API_TYPE : longint; { return type might be wrong }

function gst_video_bar_meta_get_info:PGstMetaInfo;cdecl;external libgstvideo;
{ was #define dname def_expr }
function GST_VIDEO_BAR_META_INFO : longint; { return type might be wrong }

{*
 * gst_buffer_get_video_bar_meta:
 * @b: A #GstBuffer
 *
 * Gets the #GstVideoBarMeta that might be present on @b.
 *
 * Since: 1.18
 *
 * Returns: (nullable): The first #GstVideoBarMeta present on @b, or %NULL if
 * no #GstVideoBarMeta are present
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_bar_meta(b : longint) : PGstVideoBarMeta;

function gst_buffer_add_video_bar_meta(buffer:PGstBuffer; field:Tguint8; is_letterbox:Tgboolean; bar_data1:Tguint; bar_data2:Tguint):PGstVideoBarMeta;cdecl;external libgstvideo;
{ Closed Caption support  }
{*
 * GstVideoCaptionType:
 * @GST_VIDEO_CAPTION_TYPE_UNKNOWN: Unknown type of CC
 * @GST_VIDEO_CAPTION_TYPE_CEA608_RAW: CEA-608 as byte pairs. Note that
 *      this format is not recommended since is does not specify to
 *      which field the caption comes from and therefore assumes
 *      it comes from the first field (and that there is no information
 *      on the second field). Use @GST_VIDEO_CAPTION_TYPE_CEA708_RAW
 *      if you wish to store CEA-608 from two fields and prefix each byte pair
 *      with 0xFC for the first field and 0xFD for the second field.
 * @GST_VIDEO_CAPTION_TYPE_CEA608_S334_1A: CEA-608 as byte triplets as defined
 *      in SMPTE S334-1 Annex A. The second and third byte of the byte triplet
 *      is the raw CEA608 data, the first byte is a bitfield: The top/7th bit is
 *      0 for the second field, 1 for the first field, bit 6 and 5 are 0 and
 *      bits 4 to 0 are a 5 bit unsigned integer that represents the line
 *      offset relative to the base-line of the original image format (line 9
 *      for 525-line field 1, line 272 for 525-line field 2, line 5 for
 *      625-line field 1 and line 318 for 625-line field 2).
 * @GST_VIDEO_CAPTION_TYPE_CEA708_RAW: CEA-708 as cc_data byte triplets. They
 *      can also contain 608-in-708 and the first byte of each triplet has to
 *      be inspected for detecting the type.
 * @GST_VIDEO_CAPTION_TYPE_CEA708_CDP: CEA-708 (and optionally CEA-608) in
 *      a CDP (Caption Distribution Packet) defined by SMPTE S-334-2.
 *      Contains the whole CDP (starting with 0x9669).
 *
 * The various known types of Closed Caption (CC).
 *
 * Since: 1.16
  }
type
  PGstVideoCaptionType = ^TGstVideoCaptionType;
  TGstVideoCaptionType =  Longint;
  Const
    GST_VIDEO_CAPTION_TYPE_UNKNOWN = 0;
    GST_VIDEO_CAPTION_TYPE_CEA608_RAW = 1;
    GST_VIDEO_CAPTION_TYPE_CEA608_S334_1A = 2;
    GST_VIDEO_CAPTION_TYPE_CEA708_RAW = 3;
    GST_VIDEO_CAPTION_TYPE_CEA708_CDP = 4;
;

function gst_video_caption_type_from_caps(caps:PGstCaps):TGstVideoCaptionType;cdecl;external libgstvideo;
function gst_video_caption_type_to_caps(_type:TGstVideoCaptionType):PGstCaps;cdecl;external libgstvideo;
{*
 * GstVideoCaptionMeta:
 * @meta: parent #GstMeta
 * @caption_type: The type of Closed Caption contained in the meta.
 * @data: (array length=size): The Closed Caption data.
 * @size: The size in bytes of @data
 *
 * Extra buffer metadata providing Closed Caption.
 *
 * Since: 1.16
  }
type
  PGstVideoCaptionMeta = ^TGstVideoCaptionMeta;
  TGstVideoCaptionMeta = record
      meta : TGstMeta;
      caption_type : TGstVideoCaptionType;
      data : Pguint8;
      size : Tgsize;
    end;

function gst_video_caption_meta_api_get_type:TGType;cdecl;external libgstvideo;
{ was #define dname def_expr }
function GST_VIDEO_CAPTION_META_API_TYPE : longint; { return type might be wrong }

function gst_video_caption_meta_get_info:PGstMetaInfo;cdecl;external libgstvideo;
{ was #define dname def_expr }
function GST_VIDEO_CAPTION_META_INFO : longint; { return type might be wrong }

{*
 * gst_buffer_get_video_caption_meta:
 * @b: A #GstBuffer
 *
 * Gets the #GstVideoCaptionMeta that might be present on @b.
 *
 * Since: 1.16
 *
 * Returns: (nullable): The first #GstVideoCaptionMeta present on @b, or %NULL if
 * no #GstVideoCaptionMeta are present
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_caption_meta(b : longint) : PGstVideoCaptionMeta;

function gst_buffer_add_video_caption_meta(buffer:PGstBuffer; caption_type:TGstVideoCaptionType; data:Pguint8; size:Tgsize):PGstVideoCaptionMeta;cdecl;external libgstvideo;
{*
 * GstVideoVBIParser:
 *
 * A parser for detecting and extracting @GstVideoAncillary data from
 * Vertical Blanking Interval lines of component signals.
 *
 * Since: 1.16
  }
type

function gst_video_vbi_parser_get_type:TGType;cdecl;external libgstvideo;
{*
 * GstVideoVBIParserResult:
 * @GST_VIDEO_VBI_PARSER_RESULT_DONE: No line were provided, or no more Ancillary data was found.
 * @GST_VIDEO_VBI_PARSER_RESULT_OK: A #GstVideoAncillary was found.
 * @GST_VIDEO_VBI_PARSER_RESULT_ERROR: An error occurred
 *
 * Return values for #GstVideoVBIParser
 *
 * Since: 1.16
  }
type
  PGstVideoVBIParserResult = ^TGstVideoVBIParserResult;
  TGstVideoVBIParserResult =  Longint;
  Const
    GST_VIDEO_VBI_PARSER_RESULT_DONE = 0;
    GST_VIDEO_VBI_PARSER_RESULT_OK = 1;
    GST_VIDEO_VBI_PARSER_RESULT_ERROR = 2;
;

function gst_video_vbi_parser_get_ancillary(parser:PGstVideoVBIParser; anc:PGstVideoAncillary):TGstVideoVBIParserResult;cdecl;external libgstvideo;
function gst_video_vbi_parser_new(format:TGstVideoFormat; pixel_width:Tguint32):PGstVideoVBIParser;cdecl;external libgstvideo;
function gst_video_vbi_parser_copy(parser:PGstVideoVBIParser):PGstVideoVBIParser;cdecl;external libgstvideo;
procedure gst_video_vbi_parser_free(parser:PGstVideoVBIParser);cdecl;external libgstvideo;
procedure gst_video_vbi_parser_add_line(parser:PGstVideoVBIParser; data:Pguint8);cdecl;external libgstvideo;
{*
 * GstVideoVBIEncoder:
 *
 * An encoder for writing ancillary data to the
 * Vertical Blanking Interval lines of component signals.
 *
 * Since: 1.16
  }
type

function gst_video_vbi_encoder_get_type:TGType;cdecl;external libgstvideo;
function gst_video_vbi_encoder_new(format:TGstVideoFormat; pixel_width:Tguint32):PGstVideoVBIEncoder;cdecl;external libgstvideo;
function gst_video_vbi_encoder_copy(encoder:PGstVideoVBIEncoder):PGstVideoVBIEncoder;cdecl;external libgstvideo;
procedure gst_video_vbi_encoder_free(encoder:PGstVideoVBIEncoder);cdecl;external libgstvideo;
function gst_video_vbi_encoder_add_ancillary(encoder:PGstVideoVBIEncoder; composite:Tgboolean; DID:Tguint8; SDID_block_number:Tguint8; data:Pguint8; 
           data_count:Tguint):Tgboolean;cdecl;external libgstvideo;
procedure gst_video_vbi_encoder_write_line(encoder:PGstVideoVBIEncoder; data:Pguint8);cdecl;external libgstvideo;
{$endif}
{ __GST_VIDEO_ANC_H__  }

// === Konventiert am: 15-7-26 13:29:50 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ANCILLARY_DID16(anc : longint) : longint;
begin
  GST_VIDEO_ANCILLARY_DID16:=((Tguint16(anc^.DID)) shl 8) or (Tguint16(anc^.SDID_block_number));
end;

{ was #define dname def_expr }
function GST_ANCILLARY_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_ANCILLARY_META_API_TYPE:=gst_ancillary_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_ANCILLARY_META_INFO : longint; { return type might be wrong }
  begin
    GST_ANCILLARY_META_INFO:=gst_ancillary_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_iterate_ancillary_meta(b,s : longint) : PGstAncillaryMeta;
begin
  gst_buffer_iterate_ancillary_meta:=PGstAncillaryMeta(gst_buffer_iterate_meta_filtered(b,s,GST_ANCILLARY_META_API_TYPE));
end;

{ was #define dname def_expr }
function GST_VIDEO_AFD_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_VIDEO_AFD_META_API_TYPE:=gst_video_afd_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_VIDEO_AFD_META_INFO : longint; { return type might be wrong }
  begin
    GST_VIDEO_AFD_META_INFO:=gst_video_afd_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_afd_meta(b : longint) : PGstVideoAFDMeta;
begin
  gst_buffer_get_video_afd_meta:=PGstVideoAFDMeta(gst_buffer_get_meta(b,GST_VIDEO_AFD_META_API_TYPE));
end;

{ was #define dname def_expr }
function GST_VIDEO_BAR_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_VIDEO_BAR_META_API_TYPE:=gst_video_bar_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_VIDEO_BAR_META_INFO : longint; { return type might be wrong }
  begin
    GST_VIDEO_BAR_META_INFO:=gst_video_bar_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_bar_meta(b : longint) : PGstVideoBarMeta;
begin
  gst_buffer_get_video_bar_meta:=PGstVideoBarMeta(gst_buffer_get_meta(b,GST_VIDEO_BAR_META_API_TYPE));
end;

{ was #define dname def_expr }
function GST_VIDEO_CAPTION_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_VIDEO_CAPTION_META_API_TYPE:=gst_video_caption_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_VIDEO_CAPTION_META_INFO : longint; { return type might be wrong }
  begin
    GST_VIDEO_CAPTION_META_INFO:=gst_video_caption_meta_get_info;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_video_caption_meta(b : longint) : PGstVideoCaptionMeta;
begin
  gst_buffer_get_video_caption_meta:=PGstVideoCaptionMeta(gst_buffer_get_meta(b,GST_VIDEO_CAPTION_META_API_TYPE));
end;


end.
