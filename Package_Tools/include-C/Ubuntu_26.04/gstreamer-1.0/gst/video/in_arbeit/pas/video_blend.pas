unit video_blend;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, video_tile;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
procedure gst_video_blend_scale_linear_RGBA(src: PGstVideoInfo; src_buffer: PGstBuffer; dest_height: Tgint; dest_width: Tgint; dest: PGstVideoInfo;
  dest_buffer: PPGstBuffer); cdecl; external libgstvideo;
function gst_video_blend(dest: PGstVideoFrame; src: PGstVideoFrame; x: Tgint; y: Tgint; global_alpha: Tgfloat): Tgboolean; cdecl; external libgstvideo;
{$ENDIF read_function}

// === Konventiert am: 15-7-26 13:29:42 ===


implementation



end.
