
{$IFDEF read_interface}

function gst_missing_uri_source_message_new(element: PGstElement; protocol: Pgchar): PGstMessage; cdecl; external libgstpbutils;
function gst_missing_uri_sink_message_new(element: PGstElement; protocol: Pgchar): PGstMessage; cdecl; external libgstpbutils;
function gst_missing_element_message_new(element: PGstElement; factory_name: Pgchar): PGstMessage; cdecl; external libgstpbutils;
function gst_missing_decoder_message_new(element: PGstElement; decode_caps: PGstCaps): PGstMessage; cdecl; external libgstpbutils;
function gst_missing_encoder_message_new(element: PGstElement; encode_caps: PGstCaps): PGstMessage; cdecl; external libgstpbutils;
function gst_missing_plugin_message_get_installer_detail(msg: PGstMessage): Pgchar; cdecl; external libgstpbutils;
function gst_missing_plugin_message_get_description(msg: PGstMessage): Pgchar; cdecl; external libgstpbutils;
function gst_is_missing_plugin_message(msg: PGstMessage): Tgboolean; cdecl; external libgstpbutils;
function gst_missing_uri_source_installer_detail_new(protocol: Pgchar): Pgchar; cdecl; external libgstpbutils;
function gst_missing_uri_sink_installer_detail_new(protocol: Pgchar): Pgchar; cdecl; external libgstpbutils;
function gst_missing_element_installer_detail_new(factory_name: Pgchar): Pgchar; cdecl; external libgstpbutils;
function gst_missing_decoder_installer_detail_new(decode_caps: PGstCaps): Pgchar; cdecl; external libgstpbutils;
function gst_missing_encoder_installer_detail_new(encode_caps: PGstCaps): Pgchar; cdecl; external libgstpbutils;

// === Konventiert am: 27-9-24 16:15:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
