/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 03-10-2024   17:46                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


function gst_media_source_ready_state_get_type: TGType; cdecl; external libgstmse;
function GST_TYPE_MEDIA_SOURCE_READY_STATE: TGType;

function gst_media_source_error_get_type: TGType; cdecl; external libgstmse;
function GST_TYPE_MEDIA_SOURCE_ERROR: TGType;

function gst_media_source_eos_error_get_type: TGType; cdecl; external libgstmse;
function GST_TYPE_MEDIA_SOURCE_EOS_ERROR: TGType;

function gst_mse_src_ready_state_get_type: TGType; cdecl; external libgstmse;
function GST_TYPE_MSE_SRC_READY_STATE: TGType;

function gst_source_buffer_append_mode_get_type: TGType; cdecl; external libgstmse;
function GST_TYPE_SOURCE_BUFFER_APPEND_MODE: TGType;

// === Konventiert am: 3-10-24 17:29:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_MEDIA_SOURCE_READY_STATE: TGType;
begin
  GST_TYPE_MEDIA_SOURCE_READY_STATE := gst_media_source_ready_state_get_type;
end;

function GST_TYPE_MEDIA_SOURCE_ERROR: TGType;
begin
  GST_TYPE_MEDIA_SOURCE_ERROR := gst_media_source_error_get_type;
end;

function GST_TYPE_MEDIA_SOURCE_EOS_ERROR: TGType;
begin
  GST_TYPE_MEDIA_SOURCE_EOS_ERROR := gst_media_source_eos_error_get_type;
end;

function GST_TYPE_MSE_SRC_READY_STATE: TGType;
begin
  GST_TYPE_MSE_SRC_READY_STATE := gst_mse_src_ready_state_get_type;
end;

function GST_TYPE_SOURCE_BUFFER_APPEND_MODE: TGType;
begin
  GST_TYPE_SOURCE_BUFFER_APPEND_MODE := gst_source_buffer_append_mode_get_type;
end;


{$ENDIF read_implementation}
