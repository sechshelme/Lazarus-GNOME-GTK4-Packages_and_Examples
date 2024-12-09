
{$IFDEF read_interface}

function gst_vulkan_command_buffer_get_type: TGType; cdecl; external libgstvulkan;

function gst_vulkan_command_buffer_new_wrapped(cmd: TVkCommandBuffer; level: TVkCommandBufferLevel): PGstVulkanCommandBuffer; cdecl; external libgstvulkan;

procedure gst_vulkan_command_buffer_lock(cmd: PGstVulkanCommandBuffer);
procedure gst_vulkan_command_buffer_unlock(cmd: PGstVulkanCommandBuffer);

// === Konventiert am: 10-10-24 15:12:40 ===

function GST_TYPE_VULKAN_COMMAND_BUFFER: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_COMMAND_BUFFER: TGType;
begin
  GST_TYPE_VULKAN_COMMAND_BUFFER := gst_vulkan_command_buffer_get_type;
end;

procedure gst_vulkan_command_buffer_lock(cmd: PGstVulkanCommandBuffer);
begin
  gst_vulkan_command_pool_lock(cmd^.pool);
end;

procedure gst_vulkan_command_buffer_unlock(cmd: PGstVulkanCommandBuffer);
begin
  gst_vulkan_command_pool_unlock(cmd^.pool);
end;


{$ENDIF read_implementation}
