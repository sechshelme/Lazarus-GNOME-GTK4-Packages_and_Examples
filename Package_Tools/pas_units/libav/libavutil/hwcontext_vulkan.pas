unit hwcontext_vulkan;

interface

uses
  fp_ffmpeg, pixfmt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVVulkanDeviceContext = type Pointer;

type
  PAVVkFrameFlags = ^TAVVkFrameFlags;
  TAVVkFrameFlags = longint;

const
  AV_VK_FRAME_FLAG_NONE = 1 shl 0;
  AV_VK_FRAME_FLAG_CONTIGUOUS_MEMORY = 1 shl 1;
  AV_VK_FRAME_FLAG_DISABLE_MULTIPLANE = 1 shl 2;

type
  PAVVulkanFramesContext = type Pointer;
  PAVVkFrame = type Pointer;

function av_vk_frame_alloc: PAVVkFrame; cdecl; external libavutil;
function av_vkfmt_from_pixfmt(p: TAVPixelFormat): PVkFormat; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:14:44 ===


implementation



end.
