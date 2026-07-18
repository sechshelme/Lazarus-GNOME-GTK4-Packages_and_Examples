unit gstvkcommandpool;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function gst_vulkan_command_pool_get_type:TGType;cdecl;external libgstvulkan;

type
  PGstVulkanCommandPool = ^TGstVulkanCommandPool;
  TGstVulkanCommandPool = record
      parent : TGstObject;
      queue : PGstVulkanQueue;
      pool : TVkCommandPool;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

  PGstVulkanCommandPoolClass = ^TGstVulkanCommandPoolClass;
  TGstVulkanCommandPoolClass = record
      parent_class : TGstObjectClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_vulkan_command_pool_get_queue(pool:PGstVulkanCommandPool):PGstVulkanQueue;cdecl;external libgstvulkan;
function gst_vulkan_command_pool_create(pool:PGstVulkanCommandPool; error:PPGError):PGstVulkanCommandBuffer;cdecl;external libgstvulkan;
procedure gst_vulkan_command_pool_lock(pool:PGstVulkanCommandPool);cdecl;external libgstvulkan;
procedure gst_vulkan_command_pool_unlock(pool:PGstVulkanCommandPool);cdecl;external libgstvulkan;

// === Konventiert am: 17-7-26 15:37:15 ===

function GST_TYPE_VULKAN_COMMAND_POOL : TGType;
function GST_VULKAN_COMMAND_POOL(obj : Pointer) : PGstVulkanCommandPool;
function GST_VULKAN_COMMAND_POOL_CLASS(klass : Pointer) : PGstVulkanCommandPoolClass;
function GST_IS_VULKAN_COMMAND_POOL(obj : Pointer) : Tgboolean;
function GST_IS_VULKAN_COMMAND_POOL_CLASS(klass : Pointer) : Tgboolean;
function GST_VULKAN_COMMAND_POOL_GET_CLASS(obj : Pointer) : PGstVulkanCommandPoolClass;

implementation

function GST_TYPE_VULKAN_COMMAND_POOL : TGType;
  begin
    GST_TYPE_VULKAN_COMMAND_POOL:=gst_vulkan_command_pool_get_type;
  end;

function GST_VULKAN_COMMAND_POOL(obj : Pointer) : PGstVulkanCommandPool;
begin
  Result := PGstVulkanCommandPool(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_COMMAND_POOL));
end;

function GST_VULKAN_COMMAND_POOL_CLASS(klass : Pointer) : PGstVulkanCommandPoolClass;
begin
  Result := PGstVulkanCommandPoolClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_COMMAND_POOL));
end;

function GST_IS_VULKAN_COMMAND_POOL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VULKAN_COMMAND_POOL);
end;

function GST_IS_VULKAN_COMMAND_POOL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VULKAN_COMMAND_POOL);
end;

function GST_VULKAN_COMMAND_POOL_GET_CLASS(obj : Pointer) : PGstVulkanCommandPoolClass;
begin
  Result := PGstVulkanCommandPoolClass(PGTypeInstance(obj)^.g_class);
end;



end.
