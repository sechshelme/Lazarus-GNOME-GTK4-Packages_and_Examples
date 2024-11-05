/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_allocator_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_ALLOCATOR_FLAGS: TGType;

function gst_bin_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_BIN_FLAGS: TGType;

function gst_buffer_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_BUFFER_FLAGS: TGType;

function gst_buffer_copy_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_BUFFER_COPY_FLAGS: TGType;

function gst_buffer_pool_acquire_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_BUFFER_POOL_ACQUIRE_FLAGS: TGType;

function gst_bus_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_BUS_FLAGS: TGType;

function gst_bus_sync_reply_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_BUS_SYNC_REPLY: TGType;

function gst_caps_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_CAPS_FLAGS: TGType;

function gst_caps_intersect_mode_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_CAPS_INTERSECT_MODE: TGType;

function gst_clock_return_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_CLOCK_RETURN: TGType;

function gst_clock_entry_type_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_CLOCK_ENTRY_TYPE: TGType;

function gst_clock_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_CLOCK_FLAGS: TGType;

function gst_debug_graph_details_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_DEBUG_GRAPH_DETAILS: TGType;

function gst_state_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_STATE: TGType;

function gst_state_change_return_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_STATE_CHANGE_RETURN: TGType;

function gst_state_change_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_STATE_CHANGE: TGType;

function gst_element_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_ELEMENT_FLAGS: TGType;

function gst_core_error_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_CORE_ERROR: TGType;

function gst_library_error_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_LIBRARY_ERROR: TGType;

function gst_resource_error_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_RESOURCE_ERROR: TGType;

function gst_stream_error_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_STREAM_ERROR: TGType;

function gst_event_type_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_EVENT_TYPE_FLAGS: TGType;

function gst_event_type_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_EVENT_TYPE: TGType;

function gst_stream_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_STREAM_FLAGS: TGType;

function gst_qos_type_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_QOS_TYPE: TGType;

function gst_gap_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_GAP_FLAGS: TGType;

function gst_format_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_FORMAT: TGType;

function gst_debug_level_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_DEBUG_LEVEL: TGType;

function gst_debug_color_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_DEBUG_COLOR_FLAGS: TGType;

function gst_stack_trace_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_STACK_TRACE_FLAGS: TGType;

function gst_debug_color_mode_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_DEBUG_COLOR_MODE: TGType;

function gst_iterator_result_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_ITERATOR_RESULT: TGType;

function gst_iterator_item_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_ITERATOR_ITEM: TGType;

function gst_memory_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_MEMORY_FLAGS: TGType;

function gst_map_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_MAP_FLAGS: TGType;

function gst_message_type_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_MESSAGE_TYPE: TGType;

function gst_structure_change_type_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_STRUCTURE_CHANGE_TYPE: TGType;

function gst_stream_status_type_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_STREAM_STATUS_TYPE: TGType;

function gst_progress_type_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PROGRESS_TYPE: TGType;

function gst_meta_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_META_FLAGS: TGType;

function gst_mini_object_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_MINI_OBJECT_FLAGS: TGType;

function gst_lock_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_LOCK_FLAGS: TGType;

function gst_object_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_OBJECT_FLAGS: TGType;

function gst_pad_direction_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PAD_DIRECTION: TGType;

function gst_pad_mode_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PAD_MODE: TGType;

function gst_pad_link_return_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PAD_LINK_RETURN: TGType;

function gst_flow_return_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_FLOW_RETURN: TGType;

function gst_pad_link_check_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PAD_LINK_CHECK: TGType;

function gst_pad_probe_type_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PAD_PROBE_TYPE: TGType;

function gst_pad_probe_return_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PAD_PROBE_RETURN: TGType;

function gst_pad_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PAD_FLAGS: TGType;

function gst_pad_presence_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PAD_PRESENCE: TGType;

function gst_pad_template_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PAD_TEMPLATE_FLAGS: TGType;

function gst_parse_error_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PARSE_ERROR: TGType;

function gst_parse_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PARSE_FLAGS: TGType;

function gst_pipeline_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PIPELINE_FLAGS: TGType;

function gst_plugin_error_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PLUGIN_ERROR: TGType;

function gst_plugin_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PLUGIN_FLAGS: TGType;

function gst_plugin_dependency_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PLUGIN_DEPENDENCY_FLAGS: TGType;

function gst_rank_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_RANK: TGType;

function gst_promise_result_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PROMISE_RESULT: TGType;

function gst_query_type_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_QUERY_TYPE_FLAGS: TGType;

function gst_query_type_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_QUERY_TYPE: TGType;

function gst_buffering_mode_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_BUFFERING_MODE: TGType;

function gst_scheduling_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_SCHEDULING_FLAGS: TGType;

function gst_seek_type_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_SEEK_TYPE: TGType;

function gst_seek_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_SEEK_FLAGS: TGType;

function gst_segment_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_SEGMENT_FLAGS: TGType;

function gst_stream_type_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_STREAM_TYPE: TGType;

function gst_serialize_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_SERIALIZE_FLAGS: TGType;

function gst_clock_type_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_CLOCK_TYPE: TGType;

function gst_tag_merge_mode_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_TAG_MERGE_MODE: TGType;

function gst_tag_flag_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_TAG_FLAG: TGType;

function gst_tag_scope_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_TAG_SCOPE: TGType;

function gst_task_state_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_TASK_STATE: TGType;

function gst_toc_scope_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_TOC_SCOPE: TGType;

function gst_toc_entry_type_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_TOC_ENTRY_TYPE: TGType;

function gst_toc_loop_type_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_TOC_LOOP_TYPE: TGType;

function gst_tracer_value_scope_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_TRACER_VALUE_SCOPE: TGType;

function gst_tracer_value_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_TRACER_VALUE_FLAGS: TGType;

function gst_type_find_probability_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_TYPE_FIND_PROBABILITY: TGType;

function gst_uri_error_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_URI_ERROR: TGType;

function gst_uri_type_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_URI_TYPE: TGType;

function gst_search_mode_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_SEARCH_MODE: TGType;

function gst_plugin_api_flags_get_type: TGType; cdecl; external libgstreamer;
function GST_TYPE_PLUGIN_API_FLAGS: TGType;

// === Konventiert am: 16-9-24 17:25:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_ALLOCATOR_FLAGS: TGType;
begin
  GST_TYPE_ALLOCATOR_FLAGS := gst_allocator_flags_get_type;
end;

function GST_TYPE_BIN_FLAGS: TGType;
begin
  GST_TYPE_BIN_FLAGS := gst_bin_flags_get_type;
end;

function GST_TYPE_BUFFER_FLAGS: TGType;
begin
  GST_TYPE_BUFFER_FLAGS := gst_buffer_flags_get_type;
end;

function GST_TYPE_BUFFER_COPY_FLAGS: TGType;
begin
  GST_TYPE_BUFFER_COPY_FLAGS := gst_buffer_copy_flags_get_type;
end;

function GST_TYPE_BUFFER_POOL_ACQUIRE_FLAGS: TGType;
begin
  GST_TYPE_BUFFER_POOL_ACQUIRE_FLAGS := gst_buffer_pool_acquire_flags_get_type;
end;

function GST_TYPE_BUS_FLAGS: TGType;
begin
  GST_TYPE_BUS_FLAGS := gst_bus_flags_get_type;
end;

function GST_TYPE_BUS_SYNC_REPLY: TGType;
begin
  GST_TYPE_BUS_SYNC_REPLY := gst_bus_sync_reply_get_type;
end;

function GST_TYPE_CAPS_FLAGS: TGType;
begin
  GST_TYPE_CAPS_FLAGS := gst_caps_flags_get_type;
end;

function GST_TYPE_CAPS_INTERSECT_MODE: TGType;
begin
  GST_TYPE_CAPS_INTERSECT_MODE := gst_caps_intersect_mode_get_type;
end;

function GST_TYPE_CLOCK_RETURN: TGType;
begin
  GST_TYPE_CLOCK_RETURN := gst_clock_return_get_type;
end;

function GST_TYPE_CLOCK_ENTRY_TYPE: TGType;
begin
  GST_TYPE_CLOCK_ENTRY_TYPE := gst_clock_entry_type_get_type;
end;

function GST_TYPE_CLOCK_FLAGS: TGType;
begin
  GST_TYPE_CLOCK_FLAGS := gst_clock_flags_get_type;
end;

function GST_TYPE_DEBUG_GRAPH_DETAILS: TGType;
begin
  GST_TYPE_DEBUG_GRAPH_DETAILS := gst_debug_graph_details_get_type;
end;

function GST_TYPE_STATE: TGType;
begin
  GST_TYPE_STATE := gst_state_get_type;
end;

function GST_TYPE_STATE_CHANGE_RETURN: TGType;
begin
  GST_TYPE_STATE_CHANGE_RETURN := gst_state_change_return_get_type;
end;

function GST_TYPE_STATE_CHANGE: TGType;
begin
  GST_TYPE_STATE_CHANGE := gst_state_change_get_type;
end;

function GST_TYPE_ELEMENT_FLAGS: TGType;
begin
  GST_TYPE_ELEMENT_FLAGS := gst_element_flags_get_type;
end;

function GST_TYPE_CORE_ERROR: TGType;
begin
  GST_TYPE_CORE_ERROR := gst_core_error_get_type;
end;

function GST_TYPE_LIBRARY_ERROR: TGType;
begin
  GST_TYPE_LIBRARY_ERROR := gst_library_error_get_type;
end;

function GST_TYPE_RESOURCE_ERROR: TGType;
begin
  GST_TYPE_RESOURCE_ERROR := gst_resource_error_get_type;
end;

function GST_TYPE_STREAM_ERROR: TGType;
begin
  GST_TYPE_STREAM_ERROR := gst_stream_error_get_type;
end;

function GST_TYPE_EVENT_TYPE_FLAGS: TGType;
begin
  GST_TYPE_EVENT_TYPE_FLAGS := gst_event_type_flags_get_type;
end;

function GST_TYPE_EVENT_TYPE: TGType;
begin
  GST_TYPE_EVENT_TYPE := gst_event_type_get_type;
end;

function GST_TYPE_STREAM_FLAGS: TGType;
begin
  GST_TYPE_STREAM_FLAGS := gst_stream_flags_get_type;
end;

function GST_TYPE_QOS_TYPE: TGType;
begin
  GST_TYPE_QOS_TYPE := gst_qos_type_get_type;
end;

function GST_TYPE_GAP_FLAGS: TGType;
begin
  GST_TYPE_GAP_FLAGS := gst_gap_flags_get_type;
end;

function GST_TYPE_FORMAT: TGType;
begin
  GST_TYPE_FORMAT := gst_format_get_type;
end;

function GST_TYPE_DEBUG_LEVEL: TGType;
begin
  GST_TYPE_DEBUG_LEVEL := gst_debug_level_get_type;
end;

function GST_TYPE_DEBUG_COLOR_FLAGS: TGType;
begin
  GST_TYPE_DEBUG_COLOR_FLAGS := gst_debug_color_flags_get_type;
end;

function GST_TYPE_STACK_TRACE_FLAGS: TGType;
begin
  GST_TYPE_STACK_TRACE_FLAGS := gst_stack_trace_flags_get_type;
end;

function GST_TYPE_DEBUG_COLOR_MODE: TGType;
begin
  GST_TYPE_DEBUG_COLOR_MODE := gst_debug_color_mode_get_type;
end;

function GST_TYPE_ITERATOR_RESULT: TGType;
begin
  GST_TYPE_ITERATOR_RESULT := gst_iterator_result_get_type;
end;

function GST_TYPE_ITERATOR_ITEM: TGType;
begin
  GST_TYPE_ITERATOR_ITEM := gst_iterator_item_get_type;
end;

function GST_TYPE_MEMORY_FLAGS: TGType;
begin
  GST_TYPE_MEMORY_FLAGS := gst_memory_flags_get_type;
end;

function GST_TYPE_MAP_FLAGS: TGType;
begin
  GST_TYPE_MAP_FLAGS := gst_map_flags_get_type;
end;

function GST_TYPE_MESSAGE_TYPE: TGType;
begin
  GST_TYPE_MESSAGE_TYPE := gst_message_type_get_type;
end;

function GST_TYPE_STRUCTURE_CHANGE_TYPE: TGType;
begin
  GST_TYPE_STRUCTURE_CHANGE_TYPE := gst_structure_change_type_get_type;
end;

function GST_TYPE_STREAM_STATUS_TYPE: TGType;
begin
  GST_TYPE_STREAM_STATUS_TYPE := gst_stream_status_type_get_type;
end;

function GST_TYPE_PROGRESS_TYPE: TGType;
begin
  GST_TYPE_PROGRESS_TYPE := gst_progress_type_get_type;
end;

function GST_TYPE_META_FLAGS: TGType;
begin
  GST_TYPE_META_FLAGS := gst_meta_flags_get_type;
end;

function GST_TYPE_MINI_OBJECT_FLAGS: TGType;
begin
  GST_TYPE_MINI_OBJECT_FLAGS := gst_mini_object_flags_get_type;
end;

function GST_TYPE_LOCK_FLAGS: TGType;
begin
  GST_TYPE_LOCK_FLAGS := gst_lock_flags_get_type;
end;

function GST_TYPE_OBJECT_FLAGS: TGType;
begin
  GST_TYPE_OBJECT_FLAGS := gst_object_flags_get_type;
end;

function GST_TYPE_PAD_DIRECTION: TGType;
begin
  GST_TYPE_PAD_DIRECTION := gst_pad_direction_get_type;
end;

function GST_TYPE_PAD_MODE: TGType;
begin
  GST_TYPE_PAD_MODE := gst_pad_mode_get_type;
end;

function GST_TYPE_PAD_LINK_RETURN: TGType;
begin
  GST_TYPE_PAD_LINK_RETURN := gst_pad_link_return_get_type;
end;

function GST_TYPE_FLOW_RETURN: TGType;
begin
  GST_TYPE_FLOW_RETURN := gst_flow_return_get_type;
end;

function GST_TYPE_PAD_LINK_CHECK: TGType;
begin
  GST_TYPE_PAD_LINK_CHECK := gst_pad_link_check_get_type;
end;

function GST_TYPE_PAD_PROBE_TYPE: TGType;
begin
  GST_TYPE_PAD_PROBE_TYPE := gst_pad_probe_type_get_type;
end;

function GST_TYPE_PAD_PROBE_RETURN: TGType;
begin
  GST_TYPE_PAD_PROBE_RETURN := gst_pad_probe_return_get_type;
end;

function GST_TYPE_PAD_FLAGS: TGType;
begin
  GST_TYPE_PAD_FLAGS := gst_pad_flags_get_type;
end;

function GST_TYPE_PAD_PRESENCE: TGType;
begin
  GST_TYPE_PAD_PRESENCE := gst_pad_presence_get_type;
end;

function GST_TYPE_PAD_TEMPLATE_FLAGS: TGType;
begin
  GST_TYPE_PAD_TEMPLATE_FLAGS := gst_pad_template_flags_get_type;
end;

function GST_TYPE_PARSE_ERROR: TGType;
begin
  GST_TYPE_PARSE_ERROR := gst_parse_error_get_type;
end;

function GST_TYPE_PARSE_FLAGS: TGType;
begin
  GST_TYPE_PARSE_FLAGS := gst_parse_flags_get_type;
end;

function GST_TYPE_PIPELINE_FLAGS: TGType;
begin
  GST_TYPE_PIPELINE_FLAGS := gst_pipeline_flags_get_type;
end;

function GST_TYPE_PLUGIN_ERROR: TGType;
begin
  GST_TYPE_PLUGIN_ERROR := gst_plugin_error_get_type;
end;

function GST_TYPE_PLUGIN_FLAGS: TGType;
begin
  GST_TYPE_PLUGIN_FLAGS := gst_plugin_flags_get_type;
end;

function GST_TYPE_PLUGIN_DEPENDENCY_FLAGS: TGType;
begin
  GST_TYPE_PLUGIN_DEPENDENCY_FLAGS := gst_plugin_dependency_flags_get_type;
end;

function GST_TYPE_RANK: TGType;
begin
  GST_TYPE_RANK := gst_rank_get_type;
end;

function GST_TYPE_PROMISE_RESULT: TGType;
begin
  GST_TYPE_PROMISE_RESULT := gst_promise_result_get_type;
end;

function GST_TYPE_QUERY_TYPE_FLAGS: TGType;
begin
  GST_TYPE_QUERY_TYPE_FLAGS := gst_query_type_flags_get_type;
end;

function GST_TYPE_QUERY_TYPE: TGType;
begin
  GST_TYPE_QUERY_TYPE := gst_query_type_get_type;
end;

function GST_TYPE_BUFFERING_MODE: TGType;
begin
  GST_TYPE_BUFFERING_MODE := gst_buffering_mode_get_type;
end;

function GST_TYPE_SCHEDULING_FLAGS: TGType;
begin
  GST_TYPE_SCHEDULING_FLAGS := gst_scheduling_flags_get_type;
end;

function GST_TYPE_SEEK_TYPE: TGType;
begin
  GST_TYPE_SEEK_TYPE := gst_seek_type_get_type;
end;

function GST_TYPE_SEEK_FLAGS: TGType;
begin
  GST_TYPE_SEEK_FLAGS := gst_seek_flags_get_type;
end;

function GST_TYPE_SEGMENT_FLAGS: TGType;
begin
  GST_TYPE_SEGMENT_FLAGS := gst_segment_flags_get_type;
end;

function GST_TYPE_STREAM_TYPE: TGType;
begin
  GST_TYPE_STREAM_TYPE := gst_stream_type_get_type;
end;

function GST_TYPE_SERIALIZE_FLAGS: TGType;
begin
  GST_TYPE_SERIALIZE_FLAGS := gst_serialize_flags_get_type;
end;

function GST_TYPE_CLOCK_TYPE: TGType;
begin
  GST_TYPE_CLOCK_TYPE := gst_clock_type_get_type;
end;

function GST_TYPE_TAG_MERGE_MODE: TGType;
begin
  GST_TYPE_TAG_MERGE_MODE := gst_tag_merge_mode_get_type;
end;

function GST_TYPE_TAG_FLAG: TGType;
begin
  GST_TYPE_TAG_FLAG := gst_tag_flag_get_type;
end;

function GST_TYPE_TAG_SCOPE: TGType;
begin
  GST_TYPE_TAG_SCOPE := gst_tag_scope_get_type;
end;

function GST_TYPE_TASK_STATE: TGType;
begin
  GST_TYPE_TASK_STATE := gst_task_state_get_type;
end;

function GST_TYPE_TOC_SCOPE: TGType;
begin
  GST_TYPE_TOC_SCOPE := gst_toc_scope_get_type;
end;

function GST_TYPE_TOC_ENTRY_TYPE: TGType;
begin
  GST_TYPE_TOC_ENTRY_TYPE := gst_toc_entry_type_get_type;
end;

function GST_TYPE_TOC_LOOP_TYPE: TGType;
begin
  GST_TYPE_TOC_LOOP_TYPE := gst_toc_loop_type_get_type;
end;

function GST_TYPE_TRACER_VALUE_SCOPE: TGType;
begin
  GST_TYPE_TRACER_VALUE_SCOPE := gst_tracer_value_scope_get_type;
end;

function GST_TYPE_TRACER_VALUE_FLAGS: TGType;
begin
  GST_TYPE_TRACER_VALUE_FLAGS := gst_tracer_value_flags_get_type;
end;

function GST_TYPE_TYPE_FIND_PROBABILITY: TGType;
begin
  GST_TYPE_TYPE_FIND_PROBABILITY := gst_type_find_probability_get_type;
end;

function GST_TYPE_URI_ERROR: TGType;
begin
  GST_TYPE_URI_ERROR := gst_uri_error_get_type;
end;

function GST_TYPE_URI_TYPE: TGType;
begin
  GST_TYPE_URI_TYPE := gst_uri_type_get_type;
end;

function GST_TYPE_SEARCH_MODE: TGType;
begin
  GST_TYPE_SEARCH_MODE := gst_search_mode_get_type;
end;

function GST_TYPE_PLUGIN_API_FLAGS: TGType;
begin
  GST_TYPE_PLUGIN_API_FLAGS := gst_plugin_api_flags_get_type;
end;


{$ENDIF read_implementation}
