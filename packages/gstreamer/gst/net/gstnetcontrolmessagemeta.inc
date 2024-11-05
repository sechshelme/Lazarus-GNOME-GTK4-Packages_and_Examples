/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 11-10-2024   14:43                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstNetControlMessageMeta = record
    meta: TGstMeta;
    message: PGSocketControlMessage;
  end;
  PGstNetControlMessageMeta = ^TGstNetControlMessageMeta;

function gst_net_control_message_meta_api_get_type: TGType; cdecl; external libgstnet;
function gst_net_control_message_meta_get_info: PGstMetaInfo; cdecl; external libgstnet;

function gst_buffer_add_net_control_message_meta(buffer: PGstBuffer; message: PGSocketControlMessage): PGstNetControlMessageMeta; cdecl; external libgstnet;

function gst_buffer_get_net_control_message_meta(b: PGstBuffer): PGstNetControlMessageMeta;
function GST_NET_CONTROL_MESSAGE_META_INFO: PGstMetaInfo;

// === Konventiert am: 11-10-24 14:28:13 ===

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
