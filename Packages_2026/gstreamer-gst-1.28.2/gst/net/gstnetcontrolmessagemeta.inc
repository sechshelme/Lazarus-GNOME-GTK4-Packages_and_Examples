{$IFDEF read_interface}


type
  PGstNetControlMessageMeta = ^TGstNetControlMessageMeta;
  TGstNetControlMessageMeta = record
    meta: TGstMeta;
    message: PGSocketControlMessage;
  end;

function gst_net_control_message_meta_api_get_type: TGType; cdecl; external libgstnet;

function gst_net_control_message_meta_get_info: PGstMetaInfo; cdecl; external libgstnet;
function gst_buffer_add_net_control_message_meta(buffer: PGstBuffer; message: PGSocketControlMessage): PGstNetControlMessageMeta; cdecl; external libgstnet;

// === Konventiert am: 24-7-26 14:45:16 ===

function gst_buffer_get_net_control_message_meta(b: PGstBuffer): PGstNetControlMessageMeta;
function GST_NET_CONTROL_MESSAGE_META_INFO: PGstMetaInfo;
function GST_NET_CONTROL_MESSAGE_META_API_TYPE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_NET_CONTROL_MESSAGE_META_API_TYPE: TGType;
begin
  GST_NET_CONTROL_MESSAGE_META_API_TYPE := gst_net_control_message_meta_api_get_type;
end;

function gst_buffer_get_net_control_message_meta(b: PGstBuffer): PGstNetControlMessageMeta;
begin
  gst_buffer_get_net_control_message_meta := PGstNetControlMessageMeta(gst_buffer_get_meta(b, GST_NET_CONTROL_MESSAGE_META_API_TYPE));
end;

function GST_NET_CONTROL_MESSAGE_META_INFO: PGstMetaInfo;
begin
  GST_NET_CONTROL_MESSAGE_META_INFO := gst_net_control_message_meta_get_info;
end;

{$ENDIF read_implementation}
