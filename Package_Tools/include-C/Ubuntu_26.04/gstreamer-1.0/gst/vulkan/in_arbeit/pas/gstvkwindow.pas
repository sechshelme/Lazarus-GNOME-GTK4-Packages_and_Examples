unit gstvkwindow;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGstVulkanWindowError = ^TGstVulkanWindowError;
  TGstVulkanWindowError = longint;
const
  GST_VULKAN_WINDOW_ERROR_FAILED = 0;
  GST_VULKAN_WINDOW_ERROR_OLD_LIBS = 1;
  GST_VULKAN_WINDOW_ERROR_RESOURCE_UNAVAILABLE = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstVulkanWindow = type Pointer;

  PGstVulkanWindowClass = ^TGstVulkanWindowClass;
  TGstVulkanWindowClass = record
    parent_class: TGstObjectClass;
    open: function(window: PGstVulkanWindow; error: PPGError): Tgboolean; cdecl;
    close: procedure(window: PGstVulkanWindow); cdecl;
    get_surface: function(window: PGstVulkanWindow; error: PPGError): TVkSurfaceKHR; cdecl;
    get_presentation_support: function(window: PGstVulkanWindow; device: PGstVulkanDevice; queue_family_idx: Tguint32): Tgboolean; cdecl;
    set_window_handle: procedure(window: PGstVulkanWindow; handle: Tguintptr); cdecl;
    get_surface_dimensions: procedure(window: PGstVulkanWindow; width: Pguint; height: Pguint); cdecl;
    handle_events: procedure(window: PGstVulkanWindow; handle_events: Tgboolean); cdecl;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_window_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_window_error_quark: TGQuark; cdecl; external libgstvulkan;
function gst_vulkan_window_new(display: PGstVulkanDisplay): PGstVulkanWindow; cdecl; external libgstvulkan;
function gst_vulkan_window_get_display(window: PGstVulkanWindow): PGstVulkanDisplay; cdecl; external libgstvulkan;
function gst_vulkan_window_get_surface(window: PGstVulkanWindow; error: PPGError): TVkSurfaceKHR; cdecl; external libgstvulkan;
function gst_vulkan_window_get_presentation_support(window: PGstVulkanWindow; device: PGstVulkanDevice; queue_family_idx: Tguint32): Tgboolean; cdecl; external libgstvulkan;
procedure gst_vulkan_window_get_surface_dimensions(window: PGstVulkanWindow; width: Pguint; height: Pguint); cdecl; external libgstvulkan;
procedure gst_vulkan_window_set_window_handle(window: PGstVulkanWindow; handle: Tguintptr); cdecl; external libgstvulkan;
procedure gst_vulkan_window_handle_events(window: PGstVulkanWindow; handle_events: Tgboolean); cdecl; external libgstvulkan;
procedure gst_vulkan_window_send_key_event(window: PGstVulkanWindow; event_type: pchar; key_str: pchar); cdecl; external libgstvulkan;
procedure gst_vulkan_window_send_mouse_event(window: PGstVulkanWindow; event_type: pchar; button: longint; posx: double; posy: double); cdecl; external libgstvulkan;
function gst_vulkan_window_open(window: PGstVulkanWindow; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
procedure gst_vulkan_window_close(window: PGstVulkanWindow); cdecl; external libgstvulkan;
procedure gst_vulkan_window_resize(window: PGstVulkanWindow; width: Tgint; height: Tgint); cdecl; external libgstvulkan;
procedure gst_vulkan_window_redraw(window: PGstVulkanWindow); cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:49:10 ===

procedure GST_VULKAN_WINDOW_LOCK(w: Pointer); inline;
procedure GST_VULKAN_WINDOW_UNLOCK(w: Pointer); inline;
function GST_VULKAN_WINDOW_GET_LOCK(w: Pointer): PGMutex; inline;

function GST_VULKAN_WINDOW_ERROR: TGQuark;

function GST_TYPE_VULKAN_WINDOW: TGType;
function GST_VULKAN_WINDOW(obj: Pointer): PGstVulkanWindow;
function GST_VULKAN_WINDOW_CLASS(klass: Pointer): PGstVulkanWindowClass;
function GST_IS_VULKAN_WINDOW(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_WINDOW_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_WINDOW_GET_CLASS(obj: Pointer): PGstVulkanWindowClass;
{$ENDIF read_function}

implementation

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

function GST_VULKAN_WINDOW_ERROR: TGQuark;
begin
  GST_VULKAN_WINDOW_ERROR := gst_vulkan_window_error_quark;
end;

procedure GST_VULKAN_WINDOW_LOCK(w: Pointer);
begin
  g_mutex_lock(GST_OBJECT_GET_LOCK(w));
end;

procedure GST_VULKAN_WINDOW_UNLOCK(w: Pointer);
begin
  g_mutex_unlock(GST_OBJECT_GET_LOCK(w));
end;

function GST_VULKAN_WINDOW_GET_LOCK(w: Pointer): PGMutex;
begin
  Result := GST_OBJECT_GET_LOCK(w);
end;

end.
