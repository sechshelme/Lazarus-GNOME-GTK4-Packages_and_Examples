/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 10-10-2024   19:37                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_vulkan_barrier_type_get_type: TGType; cdecl; external libgstvulkan;
function GST_TYPE_VULKAN_BARRIER_TYPE: TGType;

function gst_vulkan_barrier_flags_get_type: TGType; cdecl; external libgstvulkan;
function GST_TYPE_VULKAN_BARRIER_FLAGS: TGType;

function gst_vulkan_display_type_get_type: TGType; cdecl; external libgstvulkan;
function GST_TYPE_VULKAN_DISPLAY_TYPE: TGType;

function gst_vulkan_error_get_type: TGType; cdecl; external libgstvulkan;
function GST_TYPE_VULKAN_ERROR: TGType;

function gst_vulkan_format_scaling_get_type: TGType; cdecl; external libgstvulkan;
function GST_TYPE_VULKAN_FORMAT_SCALING: TGType;

function gst_vulkan_format_flags_get_type: TGType; cdecl; external libgstvulkan;
function GST_TYPE_VULKAN_FORMAT_FLAGS: TGType;

function gst_vulkan_handle_type_get_type: TGType; cdecl; external libgstvulkan;
function GST_TYPE_VULKAN_HANDLE_TYPE: TGType;

function gst_vulkan_video_operation_get_type: TGType; cdecl; external libgstvulkan;
function GST_TYPE_VULKAN_VIDEO_OPERATION: TGType;

function gst_vulkan_window_error_get_type: TGType; cdecl; external libgstvulkan;
function GST_TYPE_VULKAN_WINDOW_ERROR: TGType;


// === Konventiert am: 10-10-24 16:56:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_VULKAN_BARRIER_TYPE: TGType;
begin
  GST_TYPE_VULKAN_BARRIER_TYPE := gst_vulkan_barrier_type_get_type;
end;

function GST_TYPE_VULKAN_BARRIER_FLAGS: TGType;
begin
  GST_TYPE_VULKAN_BARRIER_FLAGS := gst_vulkan_barrier_flags_get_type;
end;

function GST_TYPE_VULKAN_DISPLAY_TYPE: TGType;
begin
  GST_TYPE_VULKAN_DISPLAY_TYPE := gst_vulkan_display_type_get_type;
end;

function GST_TYPE_VULKAN_ERROR: TGType;
begin
  GST_TYPE_VULKAN_ERROR := gst_vulkan_error_get_type;
end;

function GST_TYPE_VULKAN_FORMAT_SCALING: TGType;
begin
  GST_TYPE_VULKAN_FORMAT_SCALING := gst_vulkan_format_scaling_get_type;
end;

function GST_TYPE_VULKAN_FORMAT_FLAGS: TGType;
begin
  GST_TYPE_VULKAN_FORMAT_FLAGS := gst_vulkan_format_flags_get_type;
end;

function GST_TYPE_VULKAN_HANDLE_TYPE: TGType;
begin
  GST_TYPE_VULKAN_HANDLE_TYPE := gst_vulkan_handle_type_get_type;
end;

function GST_TYPE_VULKAN_VIDEO_OPERATION: TGType;
begin
  GST_TYPE_VULKAN_VIDEO_OPERATION := gst_vulkan_video_operation_get_type;
end;

function GST_TYPE_VULKAN_WINDOW_ERROR: TGType;
begin
  GST_TYPE_VULKAN_WINDOW_ERROR := gst_vulkan_window_error_get_type;
end;


{$ENDIF read_implementation}
