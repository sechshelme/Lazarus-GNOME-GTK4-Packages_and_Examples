
{$IFDEF read_interface}

function gst_vulkan_operation_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_operation_new(cmd_pool: PGstVulkanCommandPool): PGstVulkanOperation; cdecl; external libgstvulkan;
function gst_vulkan_operation_begin(self: PGstVulkanOperation; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_operation_wait(self: PGstVulkanOperation): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_operation_end(self: PGstVulkanOperation; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
procedure gst_vulkan_operation_reset(self: PGstVulkanOperation); cdecl; external libgstvulkan;
function gst_vulkan_operation_retrieve_image_barriers(self: PGstVulkanOperation): PGArray; cdecl; external libgstvulkan;
function gst_vulkan_operation_new_extra_image_barriers(self: PGstVulkanOperation): PGArray; cdecl; external libgstvulkan;
function gst_vulkan_operation_add_frame_barrier(self: PGstVulkanOperation; frame: PGstBuffer; dst_stage: Tguint64; new_access: Tguint64; new_layout: TVkImageLayout;
  new_queue: PGstVulkanQueue): Tgboolean; cdecl; external libgstvulkan;
procedure gst_vulkan_operation_add_extra_image_barriers(self: PGstVulkanOperation; extra_barriers: PGArray); cdecl; external libgstvulkan;
procedure gst_vulkan_operation_update_frame(self: PGstVulkanOperation; frame: PGstBuffer; dst_stage: Tguint64; new_access: Tguint64; new_layout: TVkImageLayout;
  new_queue: PGstVulkanQueue); cdecl; external libgstvulkan;
function gst_vulkan_operation_add_dependency_frame(self: PGstVulkanOperation; frame: PGstBuffer; wait_stage: Tguint64; signal_stage: Tguint64): Tgboolean; cdecl; external libgstvulkan;
procedure gst_vulkan_operation_discard_dependencies(self: PGstVulkanOperation); cdecl; external libgstvulkan;
function gst_vulkan_operation_enable_query(self: PGstVulkanOperation; query_type: TVkQueryType; n_queries: Tguint; pnext: Tgpointer; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_operation_get_query(self: PGstVulkanOperation; Data: Pgpointer; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_operation_begin_query(self: PGstVulkanOperation; id: Tguint32): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_operation_end_query(self: PGstVulkanOperation; id: Tguint32): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_operation_use_sync2(self: PGstVulkanOperation): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_operation_pipeline_barrier2(self: PGstVulkanOperation; dependency_info: Tgpointer): Tgboolean; cdecl; external libgstvulkan;

// === Konventiert am: 10-10-24 17:10:33 ===

function GST_TYPE_VULKAN_OPERATION: TGType;
function GST_VULKAN_OPERATION(obj: Pointer): PGstVulkanOperation;
function GST_VULKAN_OPERATION_CLASS(klass: Pointer): PGstVulkanOperationClass;
function GST_IS_VULKAN_OPERATION(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_OPERATION_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_OPERATION_GET_CLASS(obj: Pointer): PGstVulkanOperationClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_OPERATION: TGType;
begin
  GST_TYPE_VULKAN_OPERATION := gst_vulkan_operation_get_type;
end;

function GST_VULKAN_OPERATION(obj: Pointer): PGstVulkanOperation;
begin
  Result := PGstVulkanOperation(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_OPERATION));
end;

function GST_VULKAN_OPERATION_CLASS(klass: Pointer): PGstVulkanOperationClass;
begin
  Result := PGstVulkanOperationClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_OPERATION));
end;

function GST_IS_VULKAN_OPERATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_OPERATION);
end;

function GST_IS_VULKAN_OPERATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_OPERATION);
end;

function GST_VULKAN_OPERATION_GET_CLASS(obj: Pointer): PGstVulkanOperationClass;
begin
  Result := PGstVulkanOperationClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
