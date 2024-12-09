
{$IFDEF read_interface}

function gst_va_ensure_element_data(element: Tgpointer; render_device_path: Pgchar; display_ptr: PPGstVaDisplay): Tgboolean; cdecl; external libgstva;
procedure gst_va_context_query(element: PGstElement; context_type: Pgchar); cdecl; external libgstva;
function gst_va_handle_set_context(element: PGstElement; context: PGstContext; render_device_path: Pgchar; display_ptr: PPGstVaDisplay): Tgboolean; cdecl; external libgstva;
function gst_va_handle_context_query(element: PGstElement; query: PGstQuery; display: PGstVaDisplay): Tgboolean; cdecl; external libgstva;
procedure gst_va_element_propagate_display_context(element: PGstElement; display: PGstVaDisplay); cdecl; external libgstva;
function gst_context_get_va_display(context: PGstContext; type_name: Pgchar; render_device_path: Pgchar; display_ptr: PPGstVaDisplay): Tgboolean; cdecl; external libgstva;
procedure gst_context_set_va_display(context: PGstContext; display: PGstVaDisplay); cdecl; external libgstva;

// === Konventiert am: 8-10-24 16:14:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
