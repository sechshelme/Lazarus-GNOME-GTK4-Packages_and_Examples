
unit gstvideoutils;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvideoutils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvideoutils.h
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
PGList  = ^GList;
PGstBuffer  = ^GstBuffer;
PGstCaps  = ^GstCaps;
PGstVideoCodecFrame  = ^GstVideoCodecFrame;
PGstVideoCodecFrameFlags  = ^GstVideoCodecFrameFlags;
PGstVideoCodecState  = ^GstVideoCodecState;
PGstVideoContentLightLevel  = ^GstVideoContentLightLevel;
PGstVideoMasteringDisplayInfo  = ^GstVideoMasteringDisplayInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2008 David Schleef <ds@schleef.org>
 * Copyright (C) 2012 Collabora Ltd.
 *	Author : Edward Hervey <edward@collabora.com>
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
{$ifndef __GST_VIDEO_H__}
{$include <gst/video/video.h>}
{$endif}
{$ifndef _GST_VIDEO_UTILS_H_}
{$define _GST_VIDEO_UTILS_H_}
{$include <gst/gst.h>}
{$include <gst/video/video-prelude.h>}
{$include <gst/video/video-hdr.h>}

{ was #define dname def_expr }
function GST_TYPE_VIDEO_CODEC_STATE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_TYPE_VIDEO_CODEC_FRAME : longint; { return type might be wrong }

type
{*
 * GstVideoCodecState:
 * @info: The #GstVideoInfo describing the stream
 * @caps: The #GstCaps used in the caps negotiation of the pad.
 * @codec_data: a #GstBuffer corresponding to the
 *     'codec_data' field of a stream, or NULL.
 * @allocation_caps: The #GstCaps for allocation query and pool
 *     negotiation. Since: 1.10
 * @mastering_display_info: Mastering display color volume information
 *     (HDR metadata) for the stream. Since: 1.20
 * @content_light_level: Content light level information for the stream.
 *     Since: 1.20
 *
 * Structure representing the state of an incoming or outgoing video
 * stream for encoders and decoders.
 *
 * Decoders and encoders will receive such a state through their
 * respective @set_format vmethods.
 *
 * Decoders and encoders can set the downstream state, by using the
 * gst_video_decoder_set_output_state() or
 * gst_video_encoder_set_output_state() methods.
  }
{*
 * GstVideoCodecState.mastering_display_info:
 *
 * Mastering display color volume information (HDR metadata) for the stream.
 *
 * Since: 1.20
  }
{*
 * GstVideoCodecState.content_light_level:
 *
 * Content light level information for the stream.
 *
 * Since: 1.20
  }
{< private > }
{< public > }
{< private > }
  PGstVideoCodecState = ^TGstVideoCodecState;
  TGstVideoCodecState = record
      ref_count : Tgint;
      info : TGstVideoInfo;
      caps : PGstCaps;
      codec_data : PGstBuffer;
      allocation_caps : PGstCaps;
      mastering_display_info : PGstVideoMasteringDisplayInfo;
      content_light_level : PGstVideoContentLightLevel;
      padding : array[0..(GST_PADDING_LARGE-3)-1] of Tgpointer;
    end;

{*
 * GstVideoCodecFrameFlags:
 * @GST_VIDEO_CODEC_FRAME_FLAG_DECODE_ONLY: is the frame only meant to be decoded
 * @GST_VIDEO_CODEC_FRAME_FLAG_SYNC_POINT: is the frame a synchronization point (keyframe)
 * @GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME: should the output frame be made a keyframe
 * @GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME_HEADERS: should the encoder output stream headers
 * @GST_VIDEO_CODEC_FRAME_FLAG_CORRUPTED: the buffer data is corrupted (Since: 1.20)
 *
 * Flags for #GstVideoCodecFrame
  }
{*
   * GST_VIDEO_CODEC_FRAME_FLAG_CORRUPTED:
   *
   * The buffer data is corrupted.
   *
   * Since: 1.20
    }

  PGstVideoCodecFrameFlags = ^TGstVideoCodecFrameFlags;
  TGstVideoCodecFrameFlags =  Longint;
  Const
    GST_VIDEO_CODEC_FRAME_FLAG_DECODE_ONLY = 1 shl 0;
    GST_VIDEO_CODEC_FRAME_FLAG_SYNC_POINT = 1 shl 1;
    GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME = 1 shl 2;
    GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME_HEADERS = 1 shl 3;
    GST_VIDEO_CODEC_FRAME_FLAG_CORRUPTED = 1 shl 4;
;
{*
 * GST_VIDEO_CODEC_FRAME_FLAGS:
 * @frame: a #GstVideoCodecFrame
 *
 * The entire set of flags for the @frame
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_VIDEO_CODEC_FRAME_FLAGS(frame : longint) : longint;

{*
 * GST_VIDEO_CODEC_FRAME_FLAG_IS_SET:
 * @frame: a #GstVideoCodecFrame
 * @flag: a flag to check for
 *
 * Checks whether the given @flag is set
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_FLAG_IS_SET(frame,flag : longint) : longint;

{*
 * GST_VIDEO_CODEC_FRAME_FLAG_SET:
 * @frame: a #GstVideoCodecFrame
 * @flag: Flag to set, can be any number of bits in guint32.
 *
 * This macro sets the given bits
  }
{xxxxxxxxx #define GST_VIDEO_CODEC_FRAME_FLAG_SET(frame,flag)     (GST_VIDEO_CODEC_FRAME_FLAGS(frame) |= (flag)) }
{*
 * GST_VIDEO_CODEC_FRAME_FLAG_UNSET:
 * @frame: a #GstVideoCodecFrame
 * @flag: Flag to unset
 *
 * This macro usets the given bits.
  }
{xxxxx #define GST_VIDEO_CODEC_FRAME_FLAG_UNSET(frame,flag)   (GST_VIDEO_CODEC_FRAME_FLAGS(frame) &= ~(flag)) }
{*
 * GST_VIDEO_CODEC_FRAME_IS_DECODE_ONLY:
 * @frame: a #GstVideoCodecFrame
 *
 * Tests if the buffer should only be decoded but not sent downstream.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_IS_DECODE_ONLY(frame : longint) : longint;

{*
 * GST_VIDEO_CODEC_FRAME_SET_DECODE_ONLY:
 * @frame: a #GstVideoCodecFrame
 *
 * Sets the buffer to not be sent downstream.
 *
 * Decoder implementation can use this if they have frames that
 * are not meant to be displayed.
 *
 * Encoder implementation can safely ignore this field.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_SET_DECODE_ONLY(frame : longint) : longint;

{*
 * GST_VIDEO_CODEC_FRAME_IS_SYNC_POINT:
 * @frame: a #GstVideoCodecFrame
 *
 * Tests if the frame is a synchronization point (like a keyframe).
 *
 * Decoder implementations can use this to detect keyframes.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_IS_SYNC_POINT(frame : longint) : longint;

{*
 * GST_VIDEO_CODEC_FRAME_SET_SYNC_POINT:
 * @frame: a #GstVideoCodecFrame
 *
 * Sets the frame to be a synchronization point (like a keyframe).
 *
 * Encoder implementations should set this accordingly.
 *
 * Decoder implementing parsing features should set this when they
 * detect such a synchronization point.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_SET_SYNC_POINT(frame : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_UNSET_SYNC_POINT(frame : longint) : longint;

{*
 * GST_VIDEO_CODEC_FRAME_IS_FORCE_KEYFRAME:
 * @frame: a #GstVideoCodecFrame
 *
 * Tests if the frame must be encoded as a keyframe. Applies only to
 * frames provided to encoders. Decoders can safely ignore this field.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_IS_FORCE_KEYFRAME(frame : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_SET_FORCE_KEYFRAME(frame : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_UNSET_FORCE_KEYFRAME(frame : longint) : longint;

{*
 * GST_VIDEO_CODEC_FRAME_IS_FORCE_KEYFRAME_HEADERS:
 * @frame: a #GstVideoCodecFrame
 *
 * Tests if encoder should output stream headers before outputting the
 * resulting encoded buffer for the given frame.
 *
 * Applies only to frames provided to encoders. Decoders can safely
 * ignore this field.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_IS_FORCE_KEYFRAME_HEADERS(frame : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_SET_FORCE_KEYFRAME_HEADERS(frame : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_UNSET_FORCE_KEYFRAME_HEADERS(frame : longint) : longint;

{*
 * GstVideoCodecFrame:
 * @pts: Presentation timestamp
 * @dts: Decoding timestamp
 * @duration: Duration of the frame
 * @system_frame_number: Unique identifier for the frame. Use this if you need
 *       to get hold of the frame later (like when data is being decoded).
 *       Typical usage in decoders is to set this on the opaque value provided
 *       to the library and get back the frame using gst_video_decoder_get_frame()
 * @distance_from_sync: Distance in frames from the last synchronization point.
 * @input_buffer: the input #GstBuffer that created this frame. The buffer is owned
 *           by the frame and references to the frame instead of the buffer should
 *           be kept.
 * @output_buffer: the output #GstBuffer. Implementations should set this either
 *           directly, or by using the
 *           gst_video_decoder_allocate_output_frame() or
 *           gst_video_decoder_allocate_output_buffer() methods. The buffer is
 *           owned by the frame and references to the frame instead of the
 *           buffer should be kept.
 * @deadline: Running time when the frame will be used.
 *
 * A #GstVideoCodecFrame represents a video frame both in raw and
 * encoded form.
  }
{< private > }
{< public > }
{ ED  }
{< private > }
{ ED  }
{ ED  }
{< public > }
{ ED  }
{ ED  }
{ ED  }
{ ED  }
{ ED  }
{ ED  }
{ D  }
{< private > }
{ Events that should be pushed downstream *before*
   * the next output_buffer  }
{ FIXME 2.0: Use a GQueue or similar  }
{ ED  }
{< private > }
type
  PGstVideoCodecFrame = ^TGstVideoCodecFrame;
  TGstVideoCodecFrame = record
      ref_count : Tgint;
      flags : Tguint32;
      system_frame_number : Tguint32;
      decode_frame_number : Tguint32;
      presentation_frame_number : Tguint32;
      dts : TGstClockTime;
      pts : TGstClockTime;
      duration : TGstClockTime;
      distance_from_sync : longint;
      input_buffer : PGstBuffer;
      output_buffer : PGstBuffer;
      deadline : TGstClockTime;
      events : PGList;
      user_data : Tgpointer;
      user_data_destroy_notify : TGDestroyNotify;
      abidata : record
          case longint of
            0 : ( ABI : record
                ts : TGstClockTime;
                ts2 : TGstClockTime;
                num_subframes : Tguint;
                subframes_processed : Tguint;
              end );
            1 : ( padding : array[0..(GST_PADDING_LARGE)-1] of Tgpointer );
          end;
    end;

{ GstVideoCodecState  }

function gst_video_codec_state_get_type:TGType;cdecl;external;
function gst_video_codec_state_ref(state:PGstVideoCodecState):PGstVideoCodecState;cdecl;external;
procedure gst_video_codec_state_unref(state:PGstVideoCodecState);cdecl;external;
{ GstVideoCodecFrame  }
function gst_video_codec_frame_get_type:TGType;cdecl;external;
function gst_video_codec_frame_ref(frame:PGstVideoCodecFrame):PGstVideoCodecFrame;cdecl;external;
procedure gst_video_codec_frame_unref(frame:PGstVideoCodecFrame);cdecl;external;
procedure gst_video_codec_frame_set_user_data(frame:PGstVideoCodecFrame; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
function gst_video_codec_frame_get_user_data(frame:PGstVideoCodecFrame):Tgpointer;cdecl;external;
{////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstVideoCodecFrame, gst_video_codec_frame_unref) }
{////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstVideoCodecState, gst_video_codec_state_unref) }
{$endif}

implementation

{ was #define dname def_expr }
function GST_TYPE_VIDEO_CODEC_STATE : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_CODEC_STATE:=gst_video_codec_state_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_VIDEO_CODEC_FRAME : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_CODEC_FRAME:=gst_video_codec_frame_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_FLAGS(frame : longint) : longint;
begin
  GST_VIDEO_CODEC_FRAME_FLAGS:=frame^.flags;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_FLAG_IS_SET(frame,flag : longint) : longint;
begin
  GST_VIDEO_CODEC_FRAME_FLAG_IS_SET:= not ( not ((GST_VIDEO_CODEC_FRAME_FLAGS(frame)) and flag));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_IS_DECODE_ONLY(frame : longint) : longint;
begin
  GST_VIDEO_CODEC_FRAME_IS_DECODE_ONLY:=GST_VIDEO_CODEC_FRAME_FLAG_IS_SET(frame,GST_VIDEO_CODEC_FRAME_FLAG_DECODE_ONLY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_SET_DECODE_ONLY(frame : longint) : longint;
begin
  GST_VIDEO_CODEC_FRAME_SET_DECODE_ONLY:=GST_VIDEO_CODEC_FRAME_FLAG_SET(frame,GST_VIDEO_CODEC_FRAME_FLAG_DECODE_ONLY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_IS_SYNC_POINT(frame : longint) : longint;
begin
  GST_VIDEO_CODEC_FRAME_IS_SYNC_POINT:=GST_VIDEO_CODEC_FRAME_FLAG_IS_SET(frame,GST_VIDEO_CODEC_FRAME_FLAG_SYNC_POINT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_SET_SYNC_POINT(frame : longint) : longint;
begin
  GST_VIDEO_CODEC_FRAME_SET_SYNC_POINT:=GST_VIDEO_CODEC_FRAME_FLAG_SET(frame,GST_VIDEO_CODEC_FRAME_FLAG_SYNC_POINT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_UNSET_SYNC_POINT(frame : longint) : longint;
begin
  GST_VIDEO_CODEC_FRAME_UNSET_SYNC_POINT:=GST_VIDEO_CODEC_FRAME_FLAG_UNSET(frame,GST_VIDEO_CODEC_FRAME_FLAG_SYNC_POINT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_IS_FORCE_KEYFRAME(frame : longint) : longint;
begin
  GST_VIDEO_CODEC_FRAME_IS_FORCE_KEYFRAME:=GST_VIDEO_CODEC_FRAME_FLAG_IS_SET(frame,GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_SET_FORCE_KEYFRAME(frame : longint) : longint;
begin
  GST_VIDEO_CODEC_FRAME_SET_FORCE_KEYFRAME:=GST_VIDEO_CODEC_FRAME_FLAG_SET(frame,GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_UNSET_FORCE_KEYFRAME(frame : longint) : longint;
begin
  GST_VIDEO_CODEC_FRAME_UNSET_FORCE_KEYFRAME:=GST_VIDEO_CODEC_FRAME_FLAG_UNSET(frame,GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_IS_FORCE_KEYFRAME_HEADERS(frame : longint) : longint;
begin
  GST_VIDEO_CODEC_FRAME_IS_FORCE_KEYFRAME_HEADERS:=GST_VIDEO_CODEC_FRAME_FLAG_IS_SET(frame,GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME_HEADERS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_SET_FORCE_KEYFRAME_HEADERS(frame : longint) : longint;
begin
  GST_VIDEO_CODEC_FRAME_SET_FORCE_KEYFRAME_HEADERS:=GST_VIDEO_CODEC_FRAME_FLAG_SET(frame,GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME_HEADERS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_CODEC_FRAME_UNSET_FORCE_KEYFRAME_HEADERS(frame : longint) : longint;
begin
  GST_VIDEO_CODEC_FRAME_UNSET_FORCE_KEYFRAME_HEADERS:=GST_VIDEO_CODEC_FRAME_FLAG_UNSET(frame,GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME_HEADERS);
end;


end.
