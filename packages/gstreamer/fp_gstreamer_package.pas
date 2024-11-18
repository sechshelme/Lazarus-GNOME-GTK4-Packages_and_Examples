{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_gstreamer_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_gst_webrtc_nice, fp_gst_webrtc, fp_gst_wayland, fp_gst_vulkan_xcb, 
  fp_gst_vulkan_wayland, fp_gst_vulkan, fp_gst_video, fp_gst_va, 
  fp_gst_uridownloader, fp_gst_transcoder, fp_gstTools, fp_gst_tag, 
  fp_gst_sdp, fp_gst_sctp, fp_gst_rtsp, fp_gst_rtp, fp_gst_riff, 
  fp_gst_player, fp_gst_play, fp_gst_pbutils, fp_gst_opencv, fp_gst_net, 
  fp_gst_mse, fp_gst_mpegts, fp_gst_isoff, fp_gst_insertbin, fp_gst_gl_x11, 
  fp_gst_gl_wayland, fp_gst_gl_glprototypes, fp_gst_gl_egl, fp_gst_gl, 
  fp_gst_fft, fp_gst_cuda, fp_gst_controller, fp_gst_codecparsers, 
  fp_gst_check, fp_gst_basecamerabinsrc, fp_gst_base, fp_gst_audio, 
  fp_gst_app, fp_gst_analytics, fp_gst_allocators, fp_gst, fp_gst_interfaces, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_gstreamer_package', @Register);
end.
