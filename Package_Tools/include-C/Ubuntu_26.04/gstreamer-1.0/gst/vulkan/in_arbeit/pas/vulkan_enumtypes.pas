unit vulkan_enumtypes;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$IFDEF read_enum}
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

function gst_vulkan_window_error_get_type: TGType; cdecl; external libgstvulkan;
function GST_TYPE_VULKAN_WINDOW_ERROR: TGType;
{$ENDIF read_enum}

// === Konventiert am: 17-7-26 15:48:49 ===


implementation


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

function GST_TYPE_VULKAN_WINDOW_ERROR: TGType;
begin
  GST_TYPE_VULKAN_WINDOW_ERROR := gst_vulkan_window_error_get_type;
end;


end.
