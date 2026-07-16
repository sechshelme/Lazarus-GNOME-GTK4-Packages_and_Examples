unit video_multiview;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, video_info;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function gst_video_multiview_flagset_get_type: TGType; cdecl; external libgstvideo;
function gst_video_multiview_mode_to_caps_string(mview_mode: TGstVideoMultiviewMode): Pgchar; cdecl; external libgstvideo;
function gst_video_multiview_mode_from_caps_string(caps_mview_mode: Pgchar): TGstVideoMultiviewMode; cdecl; external libgstvideo;
function gst_video_multiview_get_mono_modes: PGValue; cdecl; external libgstvideo;
function gst_video_multiview_get_unpacked_modes: PGValue; cdecl; external libgstvideo;
function gst_video_multiview_get_doubled_height_modes: PGValue; cdecl; external libgstvideo;
function gst_video_multiview_get_doubled_width_modes: PGValue; cdecl; external libgstvideo;
function gst_video_multiview_get_doubled_size_modes: PGValue; cdecl; external libgstvideo;
procedure gst_video_multiview_video_info_change_mode(info: PGstVideoInfo; out_mview_mode: TGstVideoMultiviewMode; out_mview_flags: TGstVideoMultiviewFlags); cdecl; external libgstvideo;
function gst_video_multiview_guess_half_aspect(mv_mode: TGstVideoMultiviewMode; width: Tguint; height: Tguint; par_n: Tguint; par_d: Tguint): Tgboolean; cdecl; external libgstvideo;

// === Konventiert am: 15-7-26 13:35:30 ===

function GST_TYPE_VIDEO_MULTIVIEW_FLAGSET: TGType;
{$ENDIF read_function}

implementation


function GST_TYPE_VIDEO_MULTIVIEW_FLAGSET: TGType;
begin
  GST_TYPE_VIDEO_MULTIVIEW_FLAGSET := gst_video_multiview_flagset_get_type;
end;

end.
