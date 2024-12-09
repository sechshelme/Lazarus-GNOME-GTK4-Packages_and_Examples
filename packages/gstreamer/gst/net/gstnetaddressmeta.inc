
{$IFDEF read_interface}

type
  TGstNetAddressMeta = record
    meta: TGstMeta;
    addr: PGSocketAddress;
  end;
  PGstNetAddressMeta = ^TGstNetAddressMeta;


function gst_net_address_meta_api_get_type: TGType; cdecl; external libgstnet;
function gst_net_address_meta_get_info: PGstMetaInfo; cdecl; external libgstnet;

function gst_buffer_add_net_address_meta(buffer: PGstBuffer; addr: PGSocketAddress): PGstNetAddressMeta; cdecl; external libgstnet;
function gst_buffer_get_net_address_meta(buffer: PGstBuffer): PGstNetAddressMeta; cdecl; external libgstnet;

function GST_NET_ADDRESS_META_INFO: PGstMetaInfo;

// === Konventiert am: 11-10-24 14:27:45 ===

function GST_NET_ADDRESS_META_API_TYPE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_NET_ADDRESS_META_API_TYPE: TGType;
begin
  GST_NET_ADDRESS_META_API_TYPE := gst_net_address_meta_api_get_type;
end;

function GST_NET_ADDRESS_META_INFO: PGstMetaInfo;
begin
  GST_NET_ADDRESS_META_INFO := gst_net_address_meta_get_info;
end;


{$ENDIF read_implementation}
