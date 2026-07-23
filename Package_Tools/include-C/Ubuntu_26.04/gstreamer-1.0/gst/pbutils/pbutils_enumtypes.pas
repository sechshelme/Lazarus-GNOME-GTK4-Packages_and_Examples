unit pbutils_enumtypes;

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gst_pb_utils_caps_description_flags_get_type: TGType; cdecl; external libgstpbutils;
function GST_TYPE_PB_UTILS_CAPS_DESCRIPTION_FLAGS: TGType;

function gst_audio_visualizer_shader_get_type: TGType; cdecl; external libgstpbutils;
function GST_TYPE_AUDIO_VISUALIZER_SHADER: TGType;

function gst_discoverer_result_get_type: TGType; cdecl; external libgstpbutils;
function GST_TYPE_DISCOVERER_RESULT: TGType;

function gst_discoverer_serialize_flags_get_type: TGType; cdecl; external libgstpbutils;
function GST_TYPE_DISCOVERER_SERIALIZE_FLAGS: TGType;

function gst_install_plugins_return_get_type: TGType; cdecl; external libgstpbutils;
function GST_TYPE_INSTALL_PLUGINS_RETURN: TGType;

{ Generated data ends here  }

// === Konventiert am: 23-7-26 19:45:19 ===


implementation


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


end.
