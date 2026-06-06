unit vulkan_video_codecs_common;

interface

uses
  fp_vulkan;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  VULKAN_VIDEO_CODECS_COMMON_H_ = 1;

function VK_MAKE_VIDEO_STD_VERSION(major, minor, patch: longint): longint;

// === Konventiert am: 6-6-26 19:13:31 ===


implementation


function VK_MAKE_VIDEO_STD_VERSION(major, minor, patch: longint): longint;
begin
  VK_MAKE_VIDEO_STD_VERSION := (((Tuint32_t(major)) shl 22) or ((Tuint32_t(minor)) shl 12)) or (Tuint32_t(patch));
end;


end.
