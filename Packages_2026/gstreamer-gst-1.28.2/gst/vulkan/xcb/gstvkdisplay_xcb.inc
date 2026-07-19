

  {$IFDEF read_struct}
type
  PGstVulkanDisplayXCB = type Pointer;

  PGstVulkanDisplayXCBClass = ^TGstVulkanDisplayXCBClass;
  TGstVulkanDisplayXCBClass = record
    object_class: TGstVulkanDisplayClass;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_display_xcb_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_display_xcb_new(name: Pgchar): PGstVulkanDisplayXCB; cdecl; external libgstvulkan;
function gst_vulkan_display_xcb_new_with_connection(connection: Pxcb_connection_t; screen_no: longint): PGstVulkanDisplayXCB; cdecl; external libgstvulkan;

// === Konventiert am: 19-7-26 17:15:38 ===

function GST_VULKAN_DISPLAY_XCB_CAST(obj: Pointer): PGstVulkanDisplayXCB;
function GST_VULKAN_DISPLAY_XCB_CONNECTION(d: Pointer): Pxcb_connection_t;
function GST_VULKAN_DISPLAY_XCB_ROOT_WINDOW(d: Pointer): Txcb_window_t;
function GST_VULKAN_DISPLAY_XCB_SCREEN(d: Pointer): Pxcb_screen_t;

function GST_TYPE_VULKAN_DISPLAY_XCB: TGType;
function GST_VULKAN_DISPLAY_XCB(obj: Pointer): PGstVulkanDisplayXCB;
function GST_VULKAN_DISPLAY_XCB_CLASS(klass: Pointer): PGstVulkanDisplayXCBClass;
function GST_IS_VULKAN_DISPLAY_XCB(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_DISPLAY_XCB_CLASS(klass: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_DISPLAY_XCB: TGType;
begin
  GST_TYPE_VULKAN_DISPLAY_XCB := gst_vulkan_display_xcb_get_type;
end;

function GST_VULKAN_DISPLAY_XCB(obj: Pointer): PGstVulkanDisplayXCB;
begin
  Result := PGstVulkanDisplayXCB(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_DISPLAY_XCB));
end;

function GST_VULKAN_DISPLAY_XCB_CLASS(klass: Pointer): PGstVulkanDisplayXCBClass;
begin
  Result := PGstVulkanDisplayXCBClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_DISPLAY_XCB));
end;

function GST_IS_VULKAN_DISPLAY_XCB(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_DISPLAY_XCB);
end;

function GST_IS_VULKAN_DISPLAY_XCB_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_DISPLAY_XCB);
end;

// ====

function GST_VULKAN_DISPLAY_XCB_CAST(obj: Pointer): PGstVulkanDisplayXCB;
begin
  GST_VULKAN_DISPLAY_XCB_CAST := PGstVulkanDisplayXCB(obj);
end;

function GST_VULKAN_DISPLAY_XCB_CONNECTION(d: Pointer): Pxcb_connection_t;
begin
  //  GST_VULKAN_DISPLAY_XCB_CONNECTION:=GST_VULKAN_DISPLAY_XCB(d)^.connection;
end;

function GST_VULKAN_DISPLAY_XCB_ROOT_WINDOW(d: Pointer): Txcb_window_t;
begin
  //  GST_VULKAN_DISPLAY_XCB_ROOT_WINDOW:=(GST_VULKAN_DISPLAY_XCB(d))^.root_window;
end;

function GST_VULKAN_DISPLAY_XCB_SCREEN(d: Pointer): Pxcb_screen_t;
begin
  //  GST_VULKAN_DISPLAY_XCB_SCREEN:=(GST_VULKAN_DISPLAY_XCB(d))^.screen;
end;


{$ENDIF read_implementation}
