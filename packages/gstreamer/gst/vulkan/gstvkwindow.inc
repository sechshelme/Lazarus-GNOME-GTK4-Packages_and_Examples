/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 10-10-2024   19:37                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_vulkan_window_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_window_error_quark: TGQuark; cdecl; external libgstvulkan;

type
  PGstVulkanWindowError = ^TGstVulkanWindowError;
  TGstVulkanWindowError = longint;

const
  GST_VULKAN_WINDOW_ERROR_FAILED = 0;
  GST_VULKAN_WINDOW_ERROR_OLD_LIBS = 1;
  GST_VULKAN_WINDOW_ERROR_RESOURCE_UNAVAILABLE = 2;

type
  TGstVulkanWindowClass = record
    parent_class: TGstObjectClass;
    Open: function(window: PGstVulkanWindow; error: PPGError): Tgboolean; cdecl;
    Close: procedure(window: PGstVulkanWindow); cdecl;
    get_surface: function(window: PGstVulkanWindow; error: PPGError): TVkSurfaceKHR; cdecl;
    get_presentation_support: function(window: PGstVulkanWindow; device: PGstVulkanDevice; queue_family_idx: Tguint32): Tgboolean; cdecl;
    set_window_handle: procedure(window: PGstVulkanWindow; handle: Tguintptr); cdecl;
    get_surface_dimensions: procedure(window: PGstVulkanWindow; Width: Pguint; Height: Pguint); cdecl;
    handle_events: procedure(window: PGstVulkanWindow; handle_events: Tgboolean); cdecl;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVulkanWindowClass = ^TGstVulkanWindowClass;

function gst_vulkan_window_new(display: PGstVulkanDisplay): PGstVulkanWindow; cdecl; external libgstvulkan;
function gst_vulkan_window_get_display(window: PGstVulkanWindow): PGstVulkanDisplay; cdecl; external libgstvulkan;
function gst_vulkan_window_get_surface(window: PGstVulkanWindow; error: PPGError): TVkSurfaceKHR; cdecl; external libgstvulkan;
function gst_vulkan_window_get_presentation_support(window: PGstVulkanWindow; device: PGstVulkanDevice; queue_family_idx: Tguint32): Tgboolean; cdecl; external libgstvulkan;
procedure gst_vulkan_window_get_surface_dimensions(window: PGstVulkanWindow; Width: Pguint; Height: Pguint); cdecl; external libgstvulkan;
procedure gst_vulkan_window_set_window_handle(window: PGstVulkanWindow; handle: Tguintptr); cdecl; external libgstvulkan;
procedure gst_vulkan_window_handle_events(window: PGstVulkanWindow; handle_events: Tgboolean); cdecl; external libgstvulkan;
procedure gst_vulkan_window_send_key_event(window: PGstVulkanWindow; event_type: pansichar; key_str: pansichar); cdecl; external libgstvulkan;
procedure gst_vulkan_window_send_mouse_event(window: PGstVulkanWindow; event_type: pansichar; button: longint; posx: Tdouble; posy: Tdouble); cdecl; external libgstvulkan;
function gst_vulkan_window_open(window: PGstVulkanWindow; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
procedure gst_vulkan_window_close(window: PGstVulkanWindow); cdecl; external libgstvulkan;
procedure gst_vulkan_window_resize(window: PGstVulkanWindow; Width: Tgint; Height: Tgint); cdecl; external libgstvulkan;
procedure gst_vulkan_window_redraw(window: PGstVulkanWindow); cdecl; external libgstvulkan;

function GST_VULKAN_WINDOW_ERROR: TGQuark;

// === Konventiert am: 10-10-24 16:13:01 ===

function GST_TYPE_VULKAN_WINDOW: TGType;
function GST_VULKAN_WINDOW(obj: Pointer): PGstVulkanWindow;
function GST_VULKAN_WINDOW_CLASS(klass: Pointer): PGstVulkanWindowClass;
function GST_IS_VULKAN_WINDOW(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_WINDOW_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_WINDOW_GET_CLASS(obj: Pointer): PGstVulkanWindowClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_WINDOW: TGType;
begin
  GST_TYPE_VULKAN_WINDOW := gst_vulkan_window_get_type;
end;

function GST_VULKAN_WINDOW(obj: Pointer): PGstVulkanWindow;
begin
  Result := PGstVulkanWindow(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_WINDOW));
end;

function GST_VULKAN_WINDOW_CLASS(klass: Pointer): PGstVulkanWindowClass;
begin
  Result := PGstVulkanWindowClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_WINDOW));
end;

function GST_IS_VULKAN_WINDOW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_WINDOW);
end;

function GST_IS_VULKAN_WINDOW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_WINDOW);
end;

function GST_VULKAN_WINDOW_GET_CLASS(obj: Pointer): PGstVulkanWindowClass;
begin
  Result := PGstVulkanWindowClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_VULKAN_WINDOW_ERROR: TGQuark;
begin
  GST_VULKAN_WINDOW_ERROR := gst_vulkan_window_error_quark;
end;


{$ENDIF read_implementation}
