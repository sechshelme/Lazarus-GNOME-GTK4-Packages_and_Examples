
{$IFDEF read_interface}

function gst_vulkan_physical_device_type_to_string(_type: TVkPhysicalDeviceType): Pgchar; cdecl; external libgstvulkan;
function gst_vulkan_memory_property_flags_to_string(prop_bits: TVkMemoryPropertyFlags): Pgchar; cdecl; external libgstvulkan;
function gst_vulkan_memory_heap_flags_to_string(prop_bits: TVkMemoryHeapFlags): Pgchar; cdecl; external libgstvulkan;
function gst_vulkan_queue_flags_to_string(queue_bits: TVkQueueFlags): Pgchar; cdecl; external libgstvulkan;
function gst_vulkan_sample_count_flags_to_string(sample_count_bits: TVkSampleCountFlags): Pgchar; cdecl; external libgstvulkan;
function gst_vulkan_present_mode_to_string(present_mode: TVkPresentModeKHR): Pgchar; cdecl; external libgstvulkan;

// === Konventiert am: 10-10-24 16:59:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
