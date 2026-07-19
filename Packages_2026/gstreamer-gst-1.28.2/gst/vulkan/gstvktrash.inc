

  {$IFDEF read_struct}
type
  PGstVulkanTrashList = type Pointer;
  PGstVulkanTrash = type Pointer;

  TGstVulkanTrashNotify = procedure(device: PGstVulkanDevice; user_data: Tgpointer); cdecl;
  TGstVulkanTrashListGC = procedure(trash_list: PGstVulkanTrashList); cdecl;
  TGstVulkanTrashListAdd = function(trash_list: PGstVulkanTrashList; trash: PGstVulkanTrash): Tgboolean; cdecl;
  TGstVulkanTrashListWait = function(trash_list: PGstVulkanTrashList; timeout: Tguint64): Tgboolean; cdecl;

  PGstVulkanTrashListClass = ^TGstVulkanTrashListClass;
  TGstVulkanTrashListClass = record
    parent_class: TGstVulkanHandlePoolClass;
    add_func: TGstVulkanTrashListAdd;
    gc_func: TGstVulkanTrashListGC;
    wait_func: TGstVulkanTrashListWait;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstVulkanTrashFenceList = type Pointer;

  TGstVulkanTrashFenceListClass = record
    parent_class: TGstVulkanTrashListClass;
  end;
  PGstVulkanTrashFenceListClass = ^TGstVulkanTrashFenceListClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_trash_fence_list_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_trash_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_trash_new(fence: PGstVulkanFence; notify: TGstVulkanTrashNotify; user_data: Tgpointer): PGstVulkanTrash; cdecl; external libgstvulkan;
procedure gst_vulkan_trash_mini_object_unref(device: PGstVulkanDevice; user_data: Tgpointer); cdecl; external libgstvulkan;
procedure gst_vulkan_trash_object_unref(device: PGstVulkanDevice; user_data: Tgpointer); cdecl; external libgstvulkan;
function gst_vulkan_trash_new_free_semaphore(fence: PGstVulkanFence; semaphore: TVkSemaphore): PGstVulkanTrash; cdecl; external libgstvulkan;
function gst_vulkan_trash_list_get_type: TGType; cdecl; external libgstvulkan;

procedure gst_vulkan_trash_list_gc(trash_list: PGstVulkanTrashList); cdecl; external libgstvulkan;
function gst_vulkan_trash_list_wait(trash_list: PGstVulkanTrashList; timeout: Tguint64): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_trash_list_add(trash_list: PGstVulkanTrashList; trash: PGstVulkanTrash): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_trash_list_acquire(trash_list: PGstVulkanTrashList; fence: PGstVulkanFence; notify: TGstVulkanTrashNotify; user_data: Tgpointer): PGstVulkanTrash; cdecl; external libgstvulkan;
function gst_vulkan_trash_fence_list_new: PGstVulkanTrashList; cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:46:24 ===

function gst_vulkan_trash_ref(trash: PGstVulkanTrash): PGstVulkanTrash; inline;
procedure gst_vulkan_trash_unref(trash: PGstVulkanTrash); inline;
function gst_vulkan_trash_new_object_unref(fence: PGstVulkanFence; obj: Pointer): PGstVulkanTrash; inline;
function gst_vulkan_trash_new_mini_object_unref(fence: PGstVulkanFence; obj: Pointer): PGstVulkanTrash; inline;

function GST_TYPE_VULKAN_TRASH_FENCE_LIST: TGType;
function GST_VULKAN_TRASH_FENCE_LIST(obj: Pointer): PGstVulkanTrashFenceList;
function GST_IS_VULKAN_TRASH_FENCE_LIST(obj: Pointer): Tgboolean;

function GST_TYPE_VULKAN_TRASH_LIST: TGType;
function GST_VULKAN_TRASH_LIST(obj: Pointer): PGstVulkanTrashList;
function GST_VULKAN_TRASH_LIST_CLASS(klass: Pointer): PGstVulkanTrashListClass;
function GST_IS_VULKAN_TRASH_LIST(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_TRASH_LIST_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_TRASH_LIST_GET_CLASS(obj: Pointer): PGstVulkanTrashListClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

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

function gst_vulkan_trash_ref(trash: PGstVulkanTrash): PGstVulkanTrash;
begin
  Result := PGstVulkanTrash(gst_mini_object_ref(PGstMiniObject(trash)));
end;

procedure gst_vulkan_trash_unref(trash: PGstVulkanTrash);
begin
  gst_mini_object_unref(PGstMiniObject(trash));
end;

function gst_vulkan_trash_new_object_unref(fence: PGstVulkanFence; obj: Pointer): PGstVulkanTrash;
begin
  if obj = nil then begin
    Result := nil;
  end else begin
    Result := gst_vulkan_trash_new(fence, @gst_vulkan_trash_object_unref, obj);
  end;
end;

function gst_vulkan_trash_new_mini_object_unref(fence: PGstVulkanFence; obj: Pointer): PGstVulkanTrash;
begin
  Result := gst_vulkan_trash_new(fence, @gst_vulkan_trash_mini_object_unref, obj);
end;

{$ENDIF read_implementation}
