
{$IFDEF read_interface}


function gst_vulkan_display_get_type: TGType; cdecl; external libgstvulkan;

const
  GST_VULKAN_DISPLAY_CONTEXT_TYPE_STR = 'gst.vulkan.display';

type
  TGstVulkanDisplayClass = record
    object_class: TGstObjectClass;
    get_handle: function(display: PGstVulkanDisplay): Tgpointer; cdecl;
    create_window: function(display: PGstVulkanDisplay): PGstVulkanWindow; cdecl;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVulkanDisplayClass = ^TGstVulkanDisplayClass;

function gst_vulkan_display_new(instance: PGstVulkanInstance): PGstVulkanDisplay; cdecl; external libgstvulkan;
function gst_vulkan_display_new_with_type(instance: PGstVulkanInstance; _type: TGstVulkanDisplayType): PGstVulkanDisplay; cdecl; external libgstvulkan;
function gst_vulkan_display_choose_type(instance: PGstVulkanInstance): TGstVulkanDisplayType; cdecl; external libgstvulkan;
function gst_vulkan_display_type_to_extension_string(_type: TGstVulkanDisplayType): Pgchar; cdecl; external libgstvulkan;
function gst_vulkan_display_get_handle(display: PGstVulkanDisplay): Tgpointer; cdecl; external libgstvulkan;
function gst_vulkan_display_get_handle_type(display: PGstVulkanDisplay): TGstVulkanDisplayType; cdecl; external libgstvulkan;
function gst_vulkan_display_create_window(display: PGstVulkanDisplay): PGstVulkanWindow; cdecl; external libgstvulkan;
function gst_context_get_vulkan_display(context: PGstContext; display: PPGstVulkanDisplay): Tgboolean; cdecl; external libgstvulkan;
procedure gst_context_set_vulkan_display(context: PGstContext; display: PGstVulkanDisplay); cdecl; external libgstvulkan;
function gst_vulkan_display_handle_context_query(element: PGstElement; query: PGstQuery; display: PGstVulkanDisplay): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_display_run_context_query(element: PGstElement; display: PPGstVulkanDisplay): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_display_remove_window(display: PGstVulkanDisplay; window: PGstVulkanWindow): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_display_find_window(display: PGstVulkanDisplay; Data: Tgpointer; compare_func: TGCompareFunc): PGstVulkanWindow; cdecl; external libgstvulkan;

function GST_VULKAN_DISPLAY_CAST(obj: Pointer): PGstVulkanDisplay;

// === Konventiert am: 10-10-24 16:16:24 ===

function GST_TYPE_VULKAN_DISPLAY: TGType;
function GST_VULKAN_DISPLAY(obj: Pointer): PGstVulkanDisplay;
function GST_VULKAN_DISPLAY_CLASS(klass: Pointer): PGstVulkanDisplayClass;
function GST_IS_VULKAN_DISPLAY(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_DISPLAY_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_DISPLAY_GET_CLASS(obj: Pointer): PGstVulkanDisplayClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_DISPLAY: TGType;
begin
  GST_TYPE_VULKAN_DISPLAY := gst_vulkan_display_get_type;
end;

function GST_VULKAN_DISPLAY(obj: Pointer): PGstVulkanDisplay;
begin
  Result := PGstVulkanDisplay(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_DISPLAY));
end;

function GST_VULKAN_DISPLAY_CLASS(klass: Pointer): PGstVulkanDisplayClass;
begin
  Result := PGstVulkanDisplayClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_DISPLAY));
end;

function GST_IS_VULKAN_DISPLAY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_DISPLAY);
end;

function GST_IS_VULKAN_DISPLAY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_DISPLAY);
end;

function GST_VULKAN_DISPLAY_GET_CLASS(obj: Pointer): PGstVulkanDisplayClass;
begin
  Result := PGstVulkanDisplayClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_VULKAN_DISPLAY_CAST(obj: Pointer): PGstVulkanDisplay;
begin
  GST_VULKAN_DISPLAY_CAST := PGstVulkanDisplay(obj);
end;


{$ENDIF read_implementation}
