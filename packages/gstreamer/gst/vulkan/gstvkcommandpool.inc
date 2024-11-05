/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 10-10-2024   19:37                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_vulkan_command_pool_get_type: TGType; cdecl; external libgstvulkan;

type
  TGstVulkanCommandPoolClass = record
    parent_class: TGstObjectClass;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVulkanCommandPoolClass = ^TGstVulkanCommandPoolClass;


function gst_vulkan_command_pool_get_queue(pool: PGstVulkanCommandPool): PGstVulkanQueue; cdecl; external libgstvulkan;
function gst_vulkan_command_pool_create(pool: PGstVulkanCommandPool; error: PPGError): PGstVulkanCommandBuffer; cdecl; external libgstvulkan;
procedure gst_vulkan_command_pool_lock(pool: PGstVulkanCommandPool); cdecl; external libgstvulkan;
procedure gst_vulkan_command_pool_unlock(pool: PGstVulkanCommandPool); cdecl; external libgstvulkan;

// === Konventiert am: 10-10-24 15:09:57 ===

function GST_TYPE_VULKAN_COMMAND_POOL: TGType;
function GST_VULKAN_COMMAND_POOL(obj: Pointer): PGstVulkanCommandPool;
function GST_VULKAN_COMMAND_POOL_CLASS(klass: Pointer): PGstVulkanCommandPoolClass;
function GST_IS_VULKAN_COMMAND_POOL(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_COMMAND_POOL_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_COMMAND_POOL_GET_CLASS(obj: Pointer): PGstVulkanCommandPoolClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_COMMAND_POOL: TGType;
begin
  GST_TYPE_VULKAN_COMMAND_POOL := gst_vulkan_command_pool_get_type;
end;

function GST_VULKAN_COMMAND_POOL(obj: Pointer): PGstVulkanCommandPool;
begin
  Result := PGstVulkanCommandPool(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_COMMAND_POOL));
end;

function GST_VULKAN_COMMAND_POOL_CLASS(klass: Pointer): PGstVulkanCommandPoolClass;
begin
  Result := PGstVulkanCommandPoolClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_COMMAND_POOL));
end;

function GST_IS_VULKAN_COMMAND_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_COMMAND_POOL);
end;

function GST_IS_VULKAN_COMMAND_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_COMMAND_POOL);
end;

function GST_VULKAN_COMMAND_POOL_GET_CLASS(obj: Pointer): PGstVulkanCommandPoolClass;
begin
  Result := PGstVulkanCommandPoolClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
