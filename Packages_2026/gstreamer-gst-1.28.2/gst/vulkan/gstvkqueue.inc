

  {$IFDEF read_enum}
const
  GST_VULKAN_QUEUE_CONTEXT_TYPE_STR = 'gst.vulkan.queue';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PPGstVulkanQueue = ^PGstVulkanQueue;
  PGstVulkanQueue = type Pointer;

  PGstVulkanQueueClass = ^TGstVulkanQueueClass;
  TGstVulkanQueueClass = record
    parent_class: TGstObjectClass;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_queue_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_queue_get_device(queue: PGstVulkanQueue): PGstVulkanDevice; cdecl; external libgstvulkan;
function gst_vulkan_queue_create_command_pool(queue: PGstVulkanQueue; error: PPGError): PGstVulkanCommandPool; cdecl; external libgstvulkan;
procedure gst_vulkan_queue_submit_lock(queue: PGstVulkanQueue); cdecl; external libgstvulkan;
procedure gst_vulkan_queue_submit_unlock(queue: PGstVulkanQueue); cdecl; external libgstvulkan;
procedure gst_context_set_vulkan_queue(context: PGstContext; queue: PGstVulkanQueue); cdecl; external libgstvulkan;
function gst_context_get_vulkan_queue(context: PGstContext; queue: PPGstVulkanQueue): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_queue_handle_context_query(element: PGstElement; query: PGstQuery; queue: PGstVulkanQueue): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_queue_run_context_query(element: PGstElement; queue: PPGstVulkanQueue): Tgboolean; cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:46:40 ===

function GST_TYPE_VULKAN_QUEUE: TGType;
function GST_VULKAN_QUEUE(obj: Pointer): PGstVulkanQueue;
function GST_VULKAN_QUEUE_CLASS(klass: Pointer): PGstVulkanQueueClass;
function GST_IS_VULKAN_QUEUE(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_QUEUE_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_QUEUE_GET_CLASS(obj: Pointer): PGstVulkanQueueClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_QUEUE: TGType;
begin
  GST_TYPE_VULKAN_QUEUE := gst_vulkan_queue_get_type;
end;

function GST_VULKAN_QUEUE(obj: Pointer): PGstVulkanQueue;
begin
  Result := PGstVulkanQueue(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_QUEUE));
end;

function GST_VULKAN_QUEUE_CLASS(klass: Pointer): PGstVulkanQueueClass;
begin
  Result := PGstVulkanQueueClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_QUEUE));
end;

function GST_IS_VULKAN_QUEUE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_QUEUE);
end;

function GST_IS_VULKAN_QUEUE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_QUEUE);
end;

function GST_VULKAN_QUEUE_GET_CLASS(obj: Pointer): PGstVulkanQueueClass;
begin
  Result := PGstVulkanQueueClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
