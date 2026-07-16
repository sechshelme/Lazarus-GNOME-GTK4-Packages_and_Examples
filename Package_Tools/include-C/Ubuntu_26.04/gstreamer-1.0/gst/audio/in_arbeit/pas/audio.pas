unit audio;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function GST_FRAMES_TO_CLOCK_TIME(frames,rate : longint) : TGstClockTime;

{*
 * GST_CLOCK_TIME_TO_FRAMES:
 * @clocktime: clock time
 * @rate: sampling rate
 *
 * Calculate frames from @clocktime and sample @rate.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_TIME_TO_FRAMES(clocktime,rate : longint) : longint;

{ metadata macros  }
{*
 * GST_META_TAG_AUDIO_STR:
 *
 * This metadata is relevant for audio streams.
 *
 * Since: 1.2
  }
const
  GST_META_TAG_AUDIO_STR = 'audio';  
{*
 * GST_META_TAG_AUDIO_CHANNELS_STR:
 *
 * This metadata stays relevant as long as channels are unchanged.
 *
 * Since: 1.2
  }
  GST_META_TAG_AUDIO_CHANNELS_STR = 'channels';  
{*
 * GST_META_TAG_AUDIO_RATE_STR:
 *
 * This metadata stays relevant as long as sample rate is unchanged.
 *
 * Since: 1.8
  }
  GST_META_TAG_AUDIO_RATE_STR = 'rate';  
{
 * this library defines and implements some helper functions for audio
 * handling
  }

function gst_audio_buffer_clip(buffer:PGstBuffer; segment:PGstSegment; rate:Tgint; bpf:Tgint):PGstBuffer;cdecl;external libgstaudio;
function gst_audio_buffer_truncate(buffer:PGstBuffer; bpf:Tgint; trim:Tgsize; samples:Tgsize):PGstBuffer;cdecl;external libgstaudio;
{$include <gst/audio/gstaudioringbuffer.h>}
{$include <gst/audio/gstaudioclock.h>}
{$include <gst/audio/gstaudiofilter.h>}
{$include <gst/audio/gstaudiocdsrc.h>}
{$include <gst/audio/gstaudiodecoder.h>}
{$include <gst/audio/gstaudioencoder.h>}
{$include <gst/audio/gstaudiobasesink.h>}
{$include <gst/audio/gstaudiobasesrc.h>}
{$include <gst/audio/gstaudiometa.h>}
{$include <gst/audio/gstaudiosink.h>}
{$include <gst/audio/gstaudiosrc.h>}
{$include <gst/audio/streamvolume.h>}
{$include <gst/audio/gstaudioiec61937.h>}
{$endif}
{ __GST_AUDIO_AUDIO_H__  }

// === Konventiert am: 16-7-26 15:11:04 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_FRAMES_TO_CLOCK_TIME(frames,rate : longint) : TGstClockTime;
begin
  GST_FRAMES_TO_CLOCK_TIME:=TGstClockTime(gst_util_uint64_scale_round(frames,GST_SECOND,rate));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CLOCK_TIME_TO_FRAMES(clocktime,rate : longint) : longint;
begin
  GST_CLOCK_TIME_TO_FRAMES:=gst_util_uint64_scale_round(clocktime,rate,GST_SECOND);
end;


end.
