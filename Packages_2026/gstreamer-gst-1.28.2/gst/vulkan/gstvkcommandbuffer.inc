
  {$IFDEF read_struct}
type
  PPGstVulkanCommandBuffer = ^PGstVulkanCommandBuffer;
  PGstVulkanCommandBuffer = ^TGstVulkanCommandBuffer;
  TGstVulkanCommandBuffer = record
    parent: TGstMiniObject;
    cmd: TVkCommandBuffer;
    pool: PGstVulkanCommandPool;
    level: TVkCommandBufferLevel;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_command_buffer_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_command_buffer_new_wrapped(cmd: TVkCommandBuffer; level: TVkCommandBufferLevel): PGstVulkanCommandBuffer; cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:37:26 ===

procedure gst_vulkan_command_buffer_lock(cmd: PGstVulkanCommandBuffer);
procedure gst_vulkan_command_buffer_unlock(cmd: PGstVulkanCommandBuffer);
function gst_vulkan_command_buffer_ref(cmd: PGstVulkanCommandBuffer): PGstVulkanCommandBuffer; inline;
procedure gst_vulkan_command_buffer_unref(cmd: PGstVulkanCommandBuffer); inline;
procedure gst_clear_vulkan_command_buffer(cmd_ptr: PPGstVulkanCommandBuffer); inline;

function GST_TYPE_VULKAN_COMMAND_BUFFER: TGType;
{$ENDIF read_function}


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

function gst_vulkan_command_buffer_ref(cmd: PGstVulkanCommandBuffer): PGstVulkanCommandBuffer;
begin
  Result := PGstVulkanCommandBuffer(gst_mini_object_ref(PGstMiniObject(cmd)));
end;

procedure gst_vulkan_command_buffer_unref(cmd: PGstVulkanCommandBuffer);
begin
  gst_mini_object_unref(PGstMiniObject(cmd));
end;

procedure gst_clear_vulkan_command_buffer(cmd_ptr: PPGstVulkanCommandBuffer);
begin
  gst_clear_mini_object(PPGstMiniObject(cmd_ptr));
end;

{$ENDIF read_implementation}
