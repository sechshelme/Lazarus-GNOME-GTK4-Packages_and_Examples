
{$IFDEF read_interface}

function gst_vulkan_display_wayland_get_type:TGType;cdecl;external libgstvulkan;

type
  TGstVulkanDisplayWayland = record
    parent: TGstVulkanDisplay;
    display: Pwl_display;
    registry: Pwl_registry;
    compositor: Pwl_compositor;
    subcompositor: Pwl_subcompositor;
    shell: Pwl_shell;
    foreign_display: Tgboolean;
  end;
  PGstVulkanDisplayWayland = ^TGstVulkanDisplayWayland;

  TGstVulkanDisplayWaylandClass = record
    object_class: TGstVulkanDisplayClass;
  end;
  PGstVulkanDisplayWaylandClass = ^TGstVulkanDisplayWaylandClass;


function gst_vulkan_display_wayland_new(name:Pgchar):PGstVulkanDisplayWayland;cdecl;external libgstvulkan;
function gst_vulkan_display_wayland_new_with_display(display:Pwl_display):PGstVulkanDisplayWayland;cdecl;external libgstvulkan;

function GST_VULKAN_DISPLAY_WAYLAND_CAST(obj : Pointer) : PGstVulkanDisplayWayland;
function GST_VULKAN_DISPLAY_WAYLAND_DISPLAY(display_ : Pointer) : Pwl_display;

// === Konventiert am: 10-10-24 19:34:16 ===

function GST_TYPE_VULKAN_DISPLAY_WAYLAND : TGType;
function GST_VULKAN_DISPLAY_WAYLAND(obj : Pointer) : PGstVulkanDisplayWayland;
function GST_VULKAN_DISPLAY_WAYLAND_CLASS(klass : Pointer) : PGstVulkanDisplayWaylandClass;
function GST_IS_VULKAN_DISPLAY_WAYLAND(obj : Pointer) : Tgboolean;
function GST_IS_VULKAN_DISPLAY_WAYLAND_CLASS(klass : Pointer) : Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_DISPLAY_WAYLAND: TGType;
begin
  GST_TYPE_VULKAN_DISPLAY_WAYLAND := gst_vulkan_display_wayland_get_type;
end;

function GST_VULKAN_DISPLAY_WAYLAND(obj: Pointer): PGstVulkanDisplayWayland;
begin
  Result := PGstVulkanDisplayWayland(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_DISPLAY_WAYLAND));
end;

function GST_VULKAN_DISPLAY_WAYLAND_CLASS(klass: Pointer): PGstVulkanDisplayWaylandClass;
begin
  Result := PGstVulkanDisplayWaylandClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_DISPLAY_WAYLAND));
end;

function GST_IS_VULKAN_DISPLAY_WAYLAND(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_DISPLAY_WAYLAND);
end;

function GST_IS_VULKAN_DISPLAY_WAYLAND_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_DISPLAY_WAYLAND);
end;

// ====

function GST_VULKAN_DISPLAY_WAYLAND_CAST(obj: Pointer  ): PGstVulkanDisplayWayland;
begin
  GST_VULKAN_DISPLAY_WAYLAND_CAST:=PGstVulkanDisplayWayland(obj);
end;

function GST_VULKAN_DISPLAY_WAYLAND_DISPLAY(display_: Pointer): Pwl_display;
begin
  GST_VULKAN_DISPLAY_WAYLAND_DISPLAY:=(GST_VULKAN_DISPLAY_WAYLAND(display_))^.display;
end;


{$ENDIF read_implementation}
