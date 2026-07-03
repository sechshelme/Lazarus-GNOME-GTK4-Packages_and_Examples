unit gdkframetimings;

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGdkFrameTimings = type Pointer;

function gdk_frame_timings_get_type: TGType; cdecl; external libgtk4;
function gdk_frame_timings_ref(timings: PGdkFrameTimings): PGdkFrameTimings; cdecl; external libgtk4;
procedure gdk_frame_timings_unref(timings: PGdkFrameTimings); cdecl; external libgtk4;
function gdk_frame_timings_get_frame_counter(timings: PGdkFrameTimings): Tgint64; cdecl; external libgtk4;
function gdk_frame_timings_get_complete(timings: PGdkFrameTimings): Tgboolean; cdecl; external libgtk4;
function gdk_frame_timings_get_frame_time(timings: PGdkFrameTimings): Tgint64; cdecl; external libgtk4;
function gdk_frame_timings_get_presentation_time(timings: PGdkFrameTimings): Tgint64; cdecl; external libgtk4;
function gdk_frame_timings_get_refresh_interval(timings: PGdkFrameTimings): Tgint64; cdecl; external libgtk4;
function gdk_frame_timings_get_predicted_presentation_time(timings: PGdkFrameTimings): Tgint64; cdecl; external libgtk4;

// === Konventiert am: 2-7-26 19:19:39 ===


implementation



end.
