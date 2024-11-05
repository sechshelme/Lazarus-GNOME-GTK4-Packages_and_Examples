/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 10-10-2024   19:37                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_vulkan_image_view_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_image_view_new(image: PGstVulkanImageMemory; create_info: PVkImageViewCreateInfo): PGstVulkanImageView; cdecl; external libgstvulkan;

function GST_TYPE_VULKAN_IMAGE_VIEW: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_IMAGE_VIEW: TGType;
begin
  GST_TYPE_VULKAN_IMAGE_VIEW := gst_vulkan_image_view_get_type;
end;


{$ENDIF read_implementation}
