/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 10-10-2024   19:37                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_vulkan_image_buffer_pool_get_type:TGType;cdecl;external libgstvulkan;

type
  TGstVulkanImageBufferPool = record
      bufferpool : TGstBufferPool;
      device : PGstVulkanDevice;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
  PGstVulkanImageBufferPool = ^TGstVulkanImageBufferPool;

  TGstVulkanImageBufferPoolClass = record
      parent_class : TGstBufferPoolClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
  PGstVulkanImageBufferPoolClass = ^TGstVulkanImageBufferPoolClass;

function gst_vulkan_image_buffer_pool_new(device:PGstVulkanDevice):PGstBufferPool;cdecl;external libgstvulkan;
procedure gst_vulkan_image_buffer_pool_config_set_allocation_params(config:PGstStructure; usage:TVkImageUsageFlags; mem_properties:TVkMemoryPropertyFlags; initial_layout:TVkImageLayout; initial_access:Tguint64);cdecl;external libgstvulkan;
procedure gst_vulkan_image_buffer_pool_config_set_decode_caps(config:PGstStructure; caps:PGstCaps);cdecl;external libgstvulkan;

function GST_VULKAN_IMAGE_BUFFER_POOL_CAST(obj : Pointer) : PGstVulkanImageBufferPool;

// === Konventiert am: 10-10-24 17:10:22 ===

function GST_TYPE_VULKAN_IMAGE_BUFFER_POOL : TGType;
function GST_VULKAN_IMAGE_BUFFER_POOL(obj : Pointer) : PGstVulkanImageBufferPool;
function GST_IS_VULKAN_IMAGE_BUFFER_POOL(obj : Pointer) : Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_IMAGE_BUFFER_POOL : TGType;
  begin
    GST_TYPE_VULKAN_IMAGE_BUFFER_POOL:=gst_vulkan_image_buffer_pool_get_type;
  end;

function GST_VULKAN_IMAGE_BUFFER_POOL(obj : Pointer) : PGstVulkanImageBufferPool;
begin
  Result := PGstVulkanImageBufferPool(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_IMAGE_BUFFER_POOL));
end;

function GST_IS_VULKAN_IMAGE_BUFFER_POOL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VULKAN_IMAGE_BUFFER_POOL);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_IMAGE_BUFFER_POOL_CAST(obj: Pointer
  ): PGstVulkanImageBufferPool;
begin
  GST_VULKAN_IMAGE_BUFFER_POOL_CAST:=PGstVulkanImageBufferPool(obj);
end;


{$ENDIF read_implementation}
