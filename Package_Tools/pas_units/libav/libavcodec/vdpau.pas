unit vdpau;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVCodecContext = type Pointer;

  TAVVDPAU_Render2 = function(para1: PAVCodecContext; para2: PAVFrame; para3: PVdpPictureInfo; para4: Tuint32_t; para5: PVdpBitstreamBuffer): longint; cdecl;

  PAVVDPAUContext = type Pointer;

function av_alloc_vdpaucontext: PAVVDPAUContext; cdecl; external libavcodec;
function av_vdpau_hwaccel_get_render2(para1: PAVVDPAUContext): TAVVDPAU_Render2; cdecl; external libavcodec;
procedure av_vdpau_hwaccel_set_render2(para1: PAVVDPAUContext; para2: TAVVDPAU_Render2); cdecl; external libavcodec;
function av_vdpau_bind_context(avctx: PAVCodecContext; device: TVdpDevice; get_proc_address: PVdpGetProcAddress; flags: dword): longint; cdecl; external libavcodec;
function av_vdpau_get_surface_parameters(avctx: PAVCodecContext; _type: PVdpChromaType; width: Puint32_t; height: Puint32_t): longint; cdecl; external libavcodec;
function av_vdpau_alloc_context: PAVVDPAUContext; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:16:16 ===


implementation



end.
