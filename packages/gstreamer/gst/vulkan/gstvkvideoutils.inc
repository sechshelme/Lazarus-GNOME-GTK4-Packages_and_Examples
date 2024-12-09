
{$IFDEF read_interface}

type
  TGstVulkanVideoProfile = record
      profile : TVkVideoProfileInfoKHR;
      usage : record
          case longint of
            0 : ( decode : TVkVideoDecodeUsageInfoKHR );
          end;
      codec : record
          case longint of
            0 : ( base : TVkBaseInStructure );
            1 : ( h264dec : TVkVideoDecodeH264ProfileInfoKHR );
            2 : ( h265dec : TVkVideoDecodeH265ProfileInfoKHR );
          end;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
  PGstVulkanVideoProfile = ^TGstVulkanVideoProfile;

  TGstVulkanVideoCapabilities = record
      caps : TVkVideoCapabilitiesKHR;
      codec : record
          case longint of
            0 : ( base : TVkBaseInStructure );
            1 : ( h264dec : TVkVideoDecodeH264CapabilitiesKHR );
            2 : ( h265dec : TVkVideoDecodeH265CapabilitiesKHR );
          end;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
  PGstVulkanVideoCapabilities = ^TGstVulkanVideoCapabilities;

  PGstVulkanVideoOperation = ^TGstVulkanVideoOperation;
  TGstVulkanVideoOperation =  Longint;
  Const
    GST_VULKAN_VIDEO_OPERATION_DECODE = 0;
    GST_VULKAN_VIDEO_OPERATION_ENCODE = (0)+1;
    GST_VULKAN_VIDEO_OPERATION_UNKNOWN = (0)+2;

function gst_vulkan_video_profile_to_caps(profile:PGstVulkanVideoProfile):PGstCaps;cdecl;external libgstvulkan;
function gst_vulkan_video_profile_from_caps(profile:PGstVulkanVideoProfile; caps:PGstCaps; video_operation:TGstVulkanVideoOperation):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_video_profile_is_valid(profile:PGstVulkanVideoProfile; codec:Tguint):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_video_profile_is_equal(a:PGstVulkanVideoProfile; b:PGstVulkanVideoProfile):Tgboolean;cdecl;external libgstvulkan;

// === Konventiert am: 10-10-24 15:48:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
