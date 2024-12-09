
{$IFDEF read_interface}

function gst_pb_utils_caps_description_flags_get_type: TGType; cdecl; external libgstpbutils;
function gst_audio_visualizer_shader_get_type: TGType; cdecl; external libgstpbutils;
function gst_discoverer_result_get_type: TGType; cdecl; external libgstpbutils;
function gst_discoverer_serialize_flags_get_type: TGType; cdecl; external libgstpbutils;
function gst_install_plugins_return_get_type: TGType; cdecl; external libgstpbutils;

function GST_TYPE_PB_UTILS_CAPS_DESCRIPTION_FLAGS: TGType;
function GST_TYPE_AUDIO_VISUALIZER_SHADER: TGType;
function GST_TYPE_DISCOVERER_RESULT: TGType;
function GST_TYPE_DISCOVERER_SERIALIZE_FLAGS: TGType;
function GST_TYPE_INSTALL_PLUGINS_RETURN: TGType;

// === Konventiert am: 27-9-24 16:15:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_PB_UTILS_CAPS_DESCRIPTION_FLAGS: TGType;
begin
  GST_TYPE_PB_UTILS_CAPS_DESCRIPTION_FLAGS := gst_pb_utils_caps_description_flags_get_type;
end;

function GST_TYPE_AUDIO_VISUALIZER_SHADER: TGType;
begin
  GST_TYPE_AUDIO_VISUALIZER_SHADER := gst_audio_visualizer_shader_get_type;
end;

function GST_TYPE_DISCOVERER_RESULT: TGType;
begin
  GST_TYPE_DISCOVERER_RESULT := gst_discoverer_result_get_type;
end;

function GST_TYPE_DISCOVERER_SERIALIZE_FLAGS: TGType;
begin
  GST_TYPE_DISCOVERER_SERIALIZE_FLAGS := gst_discoverer_serialize_flags_get_type;
end;

function GST_TYPE_INSTALL_PLUGINS_RETURN: TGType;
begin
  GST_TYPE_INSTALL_PLUGINS_RETURN := gst_install_plugins_return_get_type;
end;


{$ENDIF read_implementation}
