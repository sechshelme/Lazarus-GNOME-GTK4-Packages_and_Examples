
{$IFDEF read_interface}

type
  TGstVulkanTrashNotify = procedure(device: PGstVulkanDevice; user_data: Tgpointer); cdecl;

function gst_vulkan_trash_new(fence: PGstVulkanFence; notify: TGstVulkanTrashNotify; user_data: Tgpointer): PGstVulkanTrash; cdecl; external libgstvulkan;
procedure gst_vulkan_trash_mini_object_unref(device: PGstVulkanDevice; user_data: Tgpointer); cdecl; external libgstvulkan;
procedure gst_vulkan_trash_object_unref(device: PGstVulkanDevice; user_data: Tgpointer); cdecl; external libgstvulkan;
function gst_vulkan_trash_new_free_semaphore(fence: PGstVulkanFence; semaphore: PVkSemaphore): PGstVulkanTrash; cdecl; external libgstvulkan;
function gst_vulkan_trash_list_get_type: TGType; cdecl; external libgstvulkan;

function gst_vulkan_trash_get_type: TGType; cdecl; external libgstvulkan;

type
  TGstVulkanTrashListGC = procedure(trash_list: PGstVulkanTrashList); cdecl;
  TGstVulkanTrashListAdd = function(trash_list: PGstVulkanTrashList; trash: PGstVulkanTrash): Tgboolean; cdecl;
  TGstVulkanTrashListWait = function(trash_list: PGstVulkanTrashList; timeout: Tguint64): Tgboolean; cdecl;

procedure gst_vulkan_trash_list_gc(trash_list: PGstVulkanTrashList); cdecl; external libgstvulkan;
function gst_vulkan_trash_list_wait(trash_list: PGstVulkanTrashList; timeout: Tguint64): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_trash_list_add(trash_list: PGstVulkanTrashList; trash: PGstVulkanTrash): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_trash_list_acquire(trash_list: PGstVulkanTrashList; fence: PGstVulkanFence; notify: TGstVulkanTrashNotify; user_data: Tgpointer): PGstVulkanTrash; cdecl; external libgstvulkan;

type
  TGstVulkanTrashFenceList = record
  end;
  PGstVulkanTrashFenceList = ^TGstVulkanTrashFenceList;

  PGstVulkanTrashFenceListClass = type Pointer;

function gst_vulkan_trash_fence_list_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_trash_fence_list_new: PGstVulkanTrashList; cdecl; external libgstvulkan;

function GST_TYPE_VULKAN_TRASH: TGType;

function GST_TYPE_VULKAN_TRASH_FENCE_LIST: TGType;
function GST_VULKAN_TRASH_FENCE_LIST(obj: Pointer): PGstVulkanTrashFenceList;
function GST_IS_VULKAN_TRASH_FENCE_LIST(obj: Pointer): Tgboolean;

// === Konventiert am: 10-10-24 14:28:15 ===

function GST_TYPE_VULKAN_TRASH_LIST: TGType;
function GST_VULKAN_TRASH_LIST(obj: Pointer): PGstVulkanTrashList;
function GST_VULKAN_TRASH_LIST_CLASS(klass: Pointer): PGstVulkanTrashListClass;
function GST_IS_VULKAN_TRASH_LIST(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_TRASH_LIST_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_TRASH_LIST_GET_CLASS(obj: Pointer): PGstVulkanTrashListClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_TRASH_LIST: TGType;
begin
  GST_TYPE_VULKAN_TRASH_LIST := gst_vulkan_trash_list_get_type;
end;

function GST_VULKAN_TRASH_LIST(obj: Pointer): PGstVulkanTrashList;
begin
  Result := PGstVulkanTrashList(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_TRASH_LIST));
end;

function GST_VULKAN_TRASH_LIST_CLASS(klass: Pointer): PGstVulkanTrashListClass;
begin
  Result := PGstVulkanTrashListClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_TRASH_LIST));
end;

function GST_IS_VULKAN_TRASH_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_TRASH_LIST);
end;

function GST_IS_VULKAN_TRASH_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_TRASH_LIST);
end;

function GST_VULKAN_TRASH_LIST_GET_CLASS(obj: Pointer): PGstVulkanTrashListClass;
begin
  Result := PGstVulkanTrashListClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_TYPE_VULKAN_TRASH_FENCE_LIST: TGType;
begin
  Result := gst_vulkan_trash_fence_list_get_type;
end;

function GST_VULKAN_TRASH_FENCE_LIST(obj: Pointer): PGstVulkanTrashFenceList;
begin
  Result := PGstVulkanTrashFenceList(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_TRASH_FENCE_LIST));
end;

function GST_IS_VULKAN_TRASH_FENCE_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_TRASH_FENCE_LIST);
end;

// ====

function GST_TYPE_VULKAN_TRASH: TGType;
begin
  GST_TYPE_VULKAN_TRASH := gst_vulkan_trash_get_type;
end;


{$ENDIF read_implementation}
