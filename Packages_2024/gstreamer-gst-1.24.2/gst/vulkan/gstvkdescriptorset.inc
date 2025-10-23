
{$IFDEF read_interface}

function gst_vulkan_descriptor_set_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_descriptor_set_new_wrapped(pool: PGstVulkanDescriptorPool; set_: PVkDescriptorSet; n_layouts: Tguint; layouts: PPGstVulkanHandle): PGstVulkanDescriptorSet; cdecl; external libgstvulkan;

// === Konventiert am: 10-10-24 16:35:15 ===

function GST_TYPE_VULKAN_DESCRIPTOR_SET: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_DESCRIPTOR_SET: TGType;
begin
  GST_TYPE_VULKAN_DESCRIPTOR_SET := gst_vulkan_descriptor_set_get_type;
end;



{$ENDIF read_implementation}
