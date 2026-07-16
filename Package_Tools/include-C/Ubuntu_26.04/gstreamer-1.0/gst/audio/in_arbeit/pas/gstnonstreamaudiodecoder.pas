unit gstnonstreamaudiodecoder;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2017> Carlos Rafael Giani <dv at pseudoterminal dot org>
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
{$ifndef __GST_NONSTREAM_AUDIO_DECODER_H__}
{$define __GST_NONSTREAM_AUDIO_DECODER_H__}
{$include <gst/gst.h>}
{$include <gst/base/gstadapter.h>}
{$include <gst/audio/audio.h>}
{$include <gst/audio/audio-bad-prelude.h>}
type
{*
 * GstNonstreamAudioOutputMode:
 * @GST_NONSTREAM_AUDIO_OUTPUT_MODE_LOOPING: Playback position is moved back to the beginning of the loop
 * @GST_NONSTREAM_AUDIO_OUTPUT_MODE_STEADY: Playback position increases steadily, even when looping
 *
 * The output mode defines how the output behaves with regards to looping. Either the playback position is
 * moved back to the beginning of the loop, acting like a backwards seek, or it increases steadily, as if
 * loop were "unrolled".
  }

  PGstNonstreamAudioOutputMode = ^TGstNonstreamAudioOutputMode;
  TGstNonstreamAudioOutputMode =  Longint;
  Const
    GST_NONSTREAM_AUDIO_OUTPUT_MODE_LOOPING = 0;
    GST_NONSTREAM_AUDIO_OUTPUT_MODE_STEADY = 1;
;
{*
 * GstNonstreamAudioSubsongMode:
 * @GST_NONSTREAM_AUDIO_SUBSONG_MODE_SINGLE: Only the current subsong is played
 * @GST_NONSTREAM_AUDIO_SUBSONG_MODE_ALL: All subsongs are played (current subsong index is ignored)
 * @GST_NONSTREAM_AUDIO_SUBSONG_MODE_DECODER_DEFAULT: Use decoder specific default behavior
 *
 * The subsong mode defines how the decoder shall handle subsongs.
  }
type
  PGstNonstreamAudioSubsongMode = ^TGstNonstreamAudioSubsongMode;
  TGstNonstreamAudioSubsongMode =  Longint;
  Const
    GST_NONSTREAM_AUDIO_SUBSONG_MODE_SINGLE = 0;
    GST_NONSTREAM_AUDIO_SUBSONG_MODE_ALL = 1;
    GST_NONSTREAM_AUDIO_SUBSONG_MODE_DECODER_DEFAULT = 2;
;

{ was #define dname def_expr }
function GST_TYPE_NONSTREAM_AUDIO_DECODER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NONSTREAM_AUDIO_DECODER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_NONSTREAM_AUDIO_DECODER_CAST(obj : longint) : PGstNonstreamAudioDecoder;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NONSTREAM_AUDIO_DECODER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NONSTREAM_AUDIO_DECODER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_NONSTREAM_AUDIO_DECODER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_NONSTREAM_AUDIO_DECODER_CLASS(klass : longint) : longint;

{*
 * GST_NONSTREAM_AUDIO_DECODER_SINK_NAME:
 *
 * The name of the template for the sink pad.
  }
const
  GST_NONSTREAM_AUDIO_DECODER_SINK_NAME = 'sink';  
{*
 * GST_NONSTREAM_AUDIO_DECODER_SRC_NAME:
 *
 * The name of the template for the source pad.
  }
  GST_NONSTREAM_AUDIO_DECODER_SRC_NAME = 'src';  
{*
 * GST_NONSTREAM_AUDIO_DECODER_SINK_PAD:
 * @obj: base nonstream audio codec instance
 *
 * Gives the pointer to the sink #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_NONSTREAM_AUDIO_DECODER_SINK_PAD(obj : longint) : longint;

{*
 * GST_NONSTREAM_AUDIO_DECODER_SRC_PAD:
 * @obj: base nonstream audio codec instance
 *
 * Gives the pointer to the source #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NONSTREAM_AUDIO_DECODER_SRC_PAD(obj : longint) : longint;

{*
 * GST_NONSTREAM_AUDIO_DECODER_LOCK_MUTEX:
 * @obj: base nonstream audio codec instance
 *
 * Locks the decoder mutex.
 *
 * Internally, the mutex is locked before one of the class vfuncs are
 * called, when position and duration queries are handled, and when
 * properties are set/retrieved.
 *
 * Derived classes should call lock during decoder related modifications
 * (for example, setting/clearing filter banks), when at the same time
 * audio might get decoded. An example are configuration changes that
 * happen when properties are set. Properties might be set from another
 * thread, so while the derived decoder is reconfigured, the mutex
 * should be locked.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NONSTREAM_AUDIO_DECODER_LOCK_MUTEX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NONSTREAM_AUDIO_DECODER_UNLOCK_MUTEX(obj : longint) : longint;

{*
 * GstNonstreamAudioDecoder:
 *
 * The opaque #GstNonstreamAudioDecoder data structure.
  }
{< protected >  }
{ source and sink pads  }
{ loading information  }
{ subsong states  }
{ output states  }
{ The difference between these two values is: cur_pos_in_samples is
   * used for the GstBuffer offsets, while num_decoded_samples is used
   * for the segment base time values.
   * cur_pos_in_samples is reset after seeking, looping (when output mode
   * is LOOPING) and switching subsongs, while num_decoded is only reset
   * to 0 after a flushing seek (because flushing seeks alter the
   * pipeline's base_time).  }
{ metadata  }
{ allocation  }
{ thread safety  }
type
  PGstNonstreamAudioDecoder = ^TGstNonstreamAudioDecoder;
  TGstNonstreamAudioDecoder = record
      element : TGstElement;
      sinkpad : PGstPad;
      srcpad : PGstPad;
      upstream_size : Tgint64;
      loaded_mode : Tgboolean;
      input_data_adapter : PGstAdapter;
      current_subsong : Tguint;
      subsong_mode : TGstNonstreamAudioSubsongMode;
      subsong_duration : TGstClockTime;
      output_mode : TGstNonstreamAudioOutputMode;
      num_loops : Tgint;
      output_format_changed : Tgboolean;
      output_audio_info : TGstAudioInfo;
      cur_pos_in_samples : Tguint64;
      num_decoded_samples : Tguint64;
      cur_segment : TGstSegment;
      discont : Tgboolean;
      toc : PGstToc;
      allocator : PGstAllocator;
      allocation_params : TGstAllocationParams;
      mutex : TGMutex;
    end;

{*
 * GstNonstreamAudioDecoderClass:
 * @element_class:              The parent class structure
 * @seek:                       Optional.
 *                              Called when a seek event is received by the parent class.
 *                              new_position is a pointer to a GstClockTime integer which
 *                              contains a position relative to the current subsong.
 *                              Minimum is 0, maximum is the subsong length.
 *                              After this function finishes, new_position is set to the
 *                              actual new position (which may differ from the request
 *                              position, depending on the decoder).
 * @tell:                       Optional.
 *                              Called when a position query is received by the parent class.
 *                              The position that this function returns must be relative to
 *                              the current subsong. Thus, the minimum is 0, and the maximum
 *                              is the subsong length.
 * @load_from_buffer:           Required if loads_from_sinkpad is set to TRUE (the default value).
 *                              Loads the media from the given buffer. The entire media is supplied at once,
 *                              so after this call, loading should be finished. This function
 *                              can also make use of a suggested initial subsong & subsong mode and initial
 *                              playback position (but isn't required to). In case it chooses a different starting
 *                              position, the function must pass this position to *initial_position.
 *                              The subclass does not have to unref the input buffer; the base class does that
 *                              already.
 * @load_from_custom:           Required if loads_from_sinkpad is set to FALSE.
 *                              Loads the media in a way defined by the custom sink. Data is not supplied;
 *                              the derived class has to handle this on its own. Otherwise, this function is
 *                              identical to @load_from_buffer.
 * @get_main_tags:              Optional.
 *                              Returns a tag list containing the main song tags, or NULL if there are
 *                              no such tags. Returned tags will be unref'd. Use this vfunc instead of
 *                              manually pushing a tag event downstream to avoid edge cases where not yet
 *                              pushed sticky tag events get overwritten before they are pushed (can for
 *                              example happen with decodebin if tags are pushed downstream before the
 *                              decodebin pads are linked).
 * @set_current_subsong:        Optional.
 *                              Sets the current subsong. This function is allowed to switch to a different
 *                              subsong than the required one, and can optionally make use of the suggested initial
 *                              position. In case it chooses a different starting position, the function must pass
 *                              this position to *initial_position.
 *                              This function switches the subsong mode to GST_NONSTREAM_AUDIO_SUBSONG_MODE_SINGLE
 *                              automatically.
 *                              If this function is implemented by the subclass, @get_current_subsong and
 *                              @get_num_subsongs should be implemented as well.
 * @get_current_subsong:        Optional.
 *                              Returns the current subsong.
 *                              If the current subsong mode is not GST_NONSTREAM_AUDIO_SUBSONG_MODE_SINGLE, this
 *                              function's return value is undefined.
 *                              If this function is implemented by the subclass,
 *                              @get_num_subsongs should be implemented as well.
 * @get_num_subsongs:           Optional.
 *                              Returns the number of subsongs available.
 *                              The return values 0 and 1 have a similar, but distinct, meaning.
 *                              If this function returns 0, then this decoder does not support subsongs at all.
 *                              @get_current_subsong must then also always return 0. In other words, this function
 *                              either never returns 0, or never returns anything else than 0.
 *                              A return value of 1 means that the media contains either only one or no subsongs
 *                              (the entire song is then considered to be one single subsong). 1 also means that only
 *                              this very media has no or just one subsong, and the decoder itself can
 *                              support multiple subsongs.
 * @get_subsong_duration:       Optional.
 *                              Returns the duration of a subsong. Returns GST_CLOCK_TIME_NONE if duration is unknown.
 * @get_subsong_tags:           Optional.
 *                              Returns tags for a subsong, or NULL if there are no tags.
 *                              Returned tags will be unref'd.
 * @set_subsong_mode:           Optional.
 *                              Sets the current subsong mode. Since this might influence the current playback position,
 *                              this function must set the initial_position integer argument to a defined value.
 *                              If the playback position is not affected at all, it must be set to GST_CLOCK_TIME_NONE.
 *                              If the subsong is restarted after the mode switch, it is recommended to set the value
 *                              to the position in the playback right after the switch (or 0 if the subsongs are always
 *                              reset back to the beginning).
 * @set_num_loops:              Optional.
 *                              Sets the number of loops for playback. If this is called during playback,
 *                              the subclass must set any internal loop counters to zero. A loop value of -1
 *                              means infinite looping; 0 means no looping; and when the num_loops is greater than 0,
 *                              playback should loop exactly num_loops times. If this function is implemented,
 *                              @get_num_loops should be implemented as well. The function can ignore the given values
 *                              and choose another; however, @get_num_loops should return this other value afterwards.
 *                              It is up to the subclass to define where the loop starts and ends. It can mean that only
 *                              a subset at the end or in the middle of a song is repeated, for example.
 *                              If the current subsong mode is GST_NONSTREAM_AUDIO_SUBSONG_MODE_SINGLE, then the subsong
 *                              is repeated this many times. If it is GST_NONSTREAM_AUDIO_SUBSONG_MODE_ALL, then all
 *                              subsongs are repeated this many times. With GST_NONSTREAM_AUDIO_SUBSONG_MODE_DECODER_DEFAULT,
 *                              the behavior is decoder specific.
 * @get_num_loops:              Optional.
 *                              Returns the number of loops for playback.
 * @get_supported_output_modes: Always required.
 *                              Returns a bitmask containing the output modes the subclass supports.
 *                              The mask is formed by a bitwise OR combination of integers, which can be calculated
 *                              this way:  1 << GST_NONSTREAM_AUDIO_OUTPUT_MODE_<mode> , where mode is either STEADY or LOOPING
 * @set_output_mode:            Optional.
 *                              Sets the output mode the subclass has to use. Unlike with most other functions, the subclass
 *                              cannot choose a different mode; it must use the requested one.
 *                              If the output mode is set to LOOPING, @gst_nonstream_audio_decoder_handle_loop
 *                              must be called after playback moved back to the start of a loop.
 * @decode:                     Always required.
 *                              Allocates an output buffer, fills it with decoded audio samples, and must be passed on to
 *                              *buffer . The number of decoded samples must be passed on to *num_samples.
 *                              If decoding finishes or the decoding is no longer possible (for example, due to an
 *                              unrecoverable error), this function returns FALSE, otherwise TRUE.
 * @decide_allocation:          Optional.
 *                              Sets up the allocation parameters for allocating output
 *                              buffers. The passed in query contains the result of the
 *                              downstream allocation query.
 *                              Subclasses should chain up to the parent implementation to
 *                              invoke the default handler.
 * @propose_allocation:         Optional.
 *                              Proposes buffer allocation parameters for upstream elements.
 *                              Subclasses should chain up to the parent implementation to
 *                              invoke the default handler.
 *
 * Subclasses can override any of the available optional virtual methods or not, as
 * needed. At minimum, @load_from_buffer (or @load_from_custom), @get_supported_output_modes,
 * and @decode need to be overridden.
 *
 * All functions are called with a locked decoder mutex.
 *
 * > If GST_ELEMENT_ERROR, GST_ELEMENT_WARNING, or GST_ELEMENT_INFO are called from
 * > inside one of these functions, it is strongly recommended to unlock the decoder mutex
 * > before and re-lock it after these macros to prevent potential deadlocks in case the
 * > application does something with the element when it receives an ERROR/WARNING/INFO
 * > message. Same goes for gst_element_post_message() calls and non-serialized events.
 *
 * By default, this class works by reading media data from the sinkpad, and then commencing
 * playback. Some decoders cannot be given data from a memory block, so the usual way of
 * reading all upstream data and passing it to @load_from_buffer doesn't work then. In this case,
 * set the value of loads_from_sinkpad to FALSE. This changes the way this class operates;
 * it does not require a sinkpad to exist anymore, and will call @load_from_custom instead.
 * One example of a decoder where this makes sense is UADE (Unix Amiga Delitracker Emulator).
 * For some formats (such as TFMX), it needs to do the file loading by itself.
 * Since most decoders can read input data from a memory block, the default value of
 * loads_from_sinkpad is TRUE.
  }
{< public >  }
{ virtual methods for subclasses  }
{< private >  }
  PGstNonstreamAudioDecoderClass = ^TGstNonstreamAudioDecoderClass;
  TGstNonstreamAudioDecoderClass = record
      element_class : TGstElementClass;
      loads_from_sinkpad : Tgboolean;
      seek : function (dec:PGstNonstreamAudioDecoder; new_position:PGstClockTime):Tgboolean;cdecl;
      tell : function (dec:PGstNonstreamAudioDecoder):TGstClockTime;cdecl;
      load_from_buffer : function (dec:PGstNonstreamAudioDecoder; source_data:PGstBuffer; initial_subsong:Tguint; initial_subsong_mode:TGstNonstreamAudioSubsongMode; initial_position:PGstClockTime; 
                   initial_output_mode:PGstNonstreamAudioOutputMode; initial_num_loops:Pgint):Tgboolean;cdecl;
      load_from_custom : function (dec:PGstNonstreamAudioDecoder; initial_subsong:Tguint; initial_subsong_mode:TGstNonstreamAudioSubsongMode; initial_position:PGstClockTime; initial_output_mode:PGstNonstreamAudioOutputMode; 
                   initial_num_loops:Pgint):Tgboolean;cdecl;
      get_main_tags : function (dec:PGstNonstreamAudioDecoder):PGstTagList;cdecl;
      set_current_subsong : function (dec:PGstNonstreamAudioDecoder; subsong:Tguint; initial_position:PGstClockTime):Tgboolean;cdecl;
      get_current_subsong : function (dec:PGstNonstreamAudioDecoder):Tguint;cdecl;
      get_num_subsongs : function (dec:PGstNonstreamAudioDecoder):Tguint;cdecl;
      get_subsong_duration : function (dec:PGstNonstreamAudioDecoder; subsong:Tguint):TGstClockTime;cdecl;
      get_subsong_tags : function (dec:PGstNonstreamAudioDecoder; subsong:Tguint):PGstTagList;cdecl;
      set_subsong_mode : function (dec:PGstNonstreamAudioDecoder; mode:TGstNonstreamAudioSubsongMode; initial_position:PGstClockTime):Tgboolean;cdecl;
      set_num_loops : function (dec:PGstNonstreamAudioDecoder; num_loops:Tgint):Tgboolean;cdecl;
      get_num_loops : function (dec:PGstNonstreamAudioDecoder):Tgint;cdecl;
      get_supported_output_modes : function (dec:PGstNonstreamAudioDecoder):Tguint;cdecl;
      set_output_mode : function (dec:PGstNonstreamAudioDecoder; mode:TGstNonstreamAudioOutputMode; current_position:PGstClockTime):Tgboolean;cdecl;
      decode : function (dec:PGstNonstreamAudioDecoder; buffer:PPGstBuffer; num_samples:Pguint):Tgboolean;cdecl;
      negotiate : function (dec:PGstNonstreamAudioDecoder):Tgboolean;cdecl;
      decide_allocation : function (dec:PGstNonstreamAudioDecoder; query:PGstQuery):Tgboolean;cdecl;
      propose_allocation : function (dec:PGstNonstreamAudioDecoder; query:PGstQuery):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{GST_AUDIO_BAD_API }

function gst_nonstream_audio_decoder_get_type:TGType;cdecl;external libgstaudio;
{//GST_AUDIO_BAD_API }
procedure gst_nonstream_audio_decoder_handle_loop(dec:PGstNonstreamAudioDecoder; new_position:TGstClockTime);cdecl;external libgstaudio;
{GST_AUDIO_BAD_API }
function gst_nonstream_audio_decoder_set_output_format(dec:PGstNonstreamAudioDecoder; audio_info:PGstAudioInfo):Tgboolean;cdecl;external libgstaudio;
{GST_AUDIO_BAD_API }
function gst_nonstream_audio_decoder_set_output_format_simple(dec:PGstNonstreamAudioDecoder; sample_rate:Tguint; sample_format:TGstAudioFormat; num_channels:Tguint):Tgboolean;cdecl;external libgstaudio;
{GST_AUDIO_BAD_API }
procedure gst_nonstream_audio_decoder_get_downstream_info(dec:PGstNonstreamAudioDecoder; format:PGstAudioFormat; sample_rate:Pgint; num_channels:Pgint);cdecl;external libgstaudio;
{GST_AUDIO_BAD_API }
function gst_nonstream_audio_decoder_allocate_output_buffer(dec:PGstNonstreamAudioDecoder; size:Tgsize):PGstBuffer;cdecl;external libgstaudio;
{$endif}
{ __GST_NONSTREAM_AUDIO_DECODER_H__  }

// === Konventiert am: 16-7-26 15:25:47 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_NONSTREAM_AUDIO_DECODER : longint; { return type might be wrong }
  begin
    GST_TYPE_NONSTREAM_AUDIO_DECODER:=gst_nonstream_audio_decoder_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NONSTREAM_AUDIO_DECODER(obj : longint) : longint;
begin
  GST_NONSTREAM_AUDIO_DECODER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_NONSTREAM_AUDIO_DECODER,GstNonstreamAudioDecoder);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_NONSTREAM_AUDIO_DECODER_CAST(obj : longint) : PGstNonstreamAudioDecoder;
begin
  GST_NONSTREAM_AUDIO_DECODER_CAST:=PGstNonstreamAudioDecoder(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NONSTREAM_AUDIO_DECODER_CLASS(klass : longint) : longint;
begin
  GST_NONSTREAM_AUDIO_DECODER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_NONSTREAM_AUDIO_DECODER,GstNonstreamAudioDecoderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NONSTREAM_AUDIO_DECODER_GET_CLASS(obj : longint) : longint;
begin
  GST_NONSTREAM_AUDIO_DECODER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_NONSTREAM_AUDIO_DECODER,GstNonstreamAudioDecoderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_NONSTREAM_AUDIO_DECODER(obj : longint) : longint;
begin
  GST_IS_NONSTREAM_AUDIO_DECODER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_NONSTREAM_AUDIO_DECODER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_NONSTREAM_AUDIO_DECODER_CLASS(klass : longint) : longint;
begin
  GST_IS_NONSTREAM_AUDIO_DECODER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_NONSTREAM_AUDIO_DECODER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NONSTREAM_AUDIO_DECODER_SINK_PAD(obj : longint) : longint;
begin
  GST_NONSTREAM_AUDIO_DECODER_SINK_PAD:=(PGstNonstreamAudioDecoder(obj))^.sinkpad;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NONSTREAM_AUDIO_DECODER_SRC_PAD(obj : longint) : longint;
begin
  GST_NONSTREAM_AUDIO_DECODER_SRC_PAD:=(PGstNonstreamAudioDecoder(obj))^.srcpad;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NONSTREAM_AUDIO_DECODER_LOCK_MUTEX(obj : longint) : longint;
begin
  GST_NONSTREAM_AUDIO_DECODER_LOCK_MUTEX:=g_mutex_lock(@((PGstNonstreamAudioDecoder(obj))^.mutex));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NONSTREAM_AUDIO_DECODER_UNLOCK_MUTEX(obj : longint) : longint;
begin
  GST_NONSTREAM_AUDIO_DECODER_UNLOCK_MUTEX:=g_mutex_unlock(@((PGstNonstreamAudioDecoder(obj))^.mutex));
end;


end.
