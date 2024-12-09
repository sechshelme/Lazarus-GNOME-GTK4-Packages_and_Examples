
{$IFDEF read_interface}

type
  TGstSDPOrigin = record
    username: Pgchar;
    sess_id: Pgchar;
    sess_version: Pgchar;
    nettype: Pgchar;
    addrtype: Pgchar;
    addr: Pgchar;
  end;
  PGstSDPOrigin = ^TGstSDPOrigin;

  TGstSDPConnection = record
    nettype: Pgchar;
    addrtype: Pgchar;
    address: Pgchar;
    ttl: Tguint;
    addr_number: Tguint;
  end;
  PGstSDPConnection = ^TGstSDPConnection;

function gst_sdp_connection_set(conn: PGstSDPConnection; nettype: Pgchar; addrtype: Pgchar; address: Pgchar; ttl: Tguint;
  addr_number: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_connection_clear(conn: PGstSDPConnection): TGstSDPResult; cdecl; external libgstsdp;

const
  GST_SDP_BWTYPE_CT = 'CT';
  GST_SDP_BWTYPE_AS = 'AS';
  GST_SDP_BWTYPE_EXT_PREFIX = 'X-';
  GST_SDP_BWTYPE_RS = 'RS';
  GST_SDP_BWTYPE_RR = 'RR';
  GST_SDP_BWTYPE_TIAS = 'TIAS';

type
  TGstSDPBandwidth = record
    bwtype: Pgchar;
    bandwidth: Tguint;
  end;
  PGstSDPBandwidth = ^TGstSDPBandwidth;

function gst_sdp_bandwidth_set(bw: PGstSDPBandwidth; bwtype: Pgchar; bandwidth: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_bandwidth_clear(bw: PGstSDPBandwidth): TGstSDPResult; cdecl; external libgstsdp;

type
  TGstSDPTime = record
    start: Pgchar;
    stop: Pgchar;
    _repeat: PGArray;
  end;
  PGstSDPTime = ^TGstSDPTime;

function gst_sdp_time_set(t: PGstSDPTime; start: Pgchar; stop: Pgchar; _repeat: PPgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_time_clear(t: PGstSDPTime): TGstSDPResult; cdecl; external libgstsdp;

type
  TGstSDPZone = record
    time: Pgchar;
    typed_time: Pgchar;
  end;
  PGstSDPZone = ^TGstSDPZone;

function gst_sdp_zone_set(zone: PGstSDPZone; adj_time: Pgchar; typed_time: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_zone_clear(zone: PGstSDPZone): TGstSDPResult; cdecl; external libgstsdp;

type
  TGstSDPKey = record
    _type: Pgchar;
    Data: Pgchar;
  end;
  PGstSDPKey = ^TGstSDPKey;

  TGstSDPAttribute = record
    key: Pgchar;
    Value: Pgchar;
  end;
  PGstSDPAttribute = ^TGstSDPAttribute;

function gst_sdp_attribute_set(attr: PGstSDPAttribute; key: Pgchar; Value: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_attribute_clear(attr: PGstSDPAttribute): TGstSDPResult; cdecl; external libgstsdp;

type
  TGstSDPMedia = record
    media: Pgchar;
    port: Tguint;
    num_ports: Tguint;
    proto: Pgchar;
    fmts: PGArray;
    information: Pgchar;
    connections: PGArray;
    bandwidths: PGArray;
    key: TGstSDPKey;
    attributes: PGArray;
  end;
  PGstSDPMedia = ^TGstSDPMedia;
  PPGstSDPMedia = ^PGstSDPMedia;

  TGstSDPMessage = record
    version: Pgchar;
    origin: TGstSDPOrigin;
    session_name: Pgchar;
    information: Pgchar;
    uri: Pgchar;
    emails: PGArray;
    phones: PGArray;
    connection: TGstSDPConnection;
    bandwidths: PGArray;
    times: PGArray;
    zones: PGArray;
    key: TGstSDPKey;
    attributes: PGArray;
    medias: PGArray;
  end;
  PGstSDPMessage = ^TGstSDPMessage;
  PPGstSDPMessage = ^PGstSDPMessage;

function gst_sdp_message_get_type: TGType; cdecl; external libgstsdp;
function gst_sdp_message_new(msg: PPGstSDPMessage): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_init(msg: PGstSDPMessage): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_uninit(msg: PGstSDPMessage): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_free(msg: PGstSDPMessage): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_copy(msg: PGstSDPMessage; copy: PPGstSDPMessage): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_parse_buffer(Data: Pguint8; size: Tguint; msg: PGstSDPMessage): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_as_text(msg: PGstSDPMessage): Pgchar; cdecl; external libgstsdp;
function gst_sdp_message_new_from_text(Text: Pgchar; msg: PPGstSDPMessage): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_parse_uri(uri: Pgchar; msg: PGstSDPMessage): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_as_uri(scheme: Pgchar; msg: PGstSDPMessage): Pgchar; cdecl; external libgstsdp;
function gst_sdp_address_is_multicast(nettype: Pgchar; addrtype: Pgchar; addr: Pgchar): Tgboolean; cdecl; external libgstsdp;
function gst_sdp_message_get_version(msg: PGstSDPMessage): Pgchar; cdecl; external libgstsdp;
function gst_sdp_message_set_version(msg: PGstSDPMessage; version: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_get_origin(msg: PGstSDPMessage): PGstSDPOrigin; cdecl; external libgstsdp;
function gst_sdp_message_set_origin(msg: PGstSDPMessage; username: Pgchar; sess_id: Pgchar; sess_version: Pgchar; nettype: Pgchar;
  addrtype: Pgchar; addr: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_get_session_name(msg: PGstSDPMessage): Pgchar; cdecl; external libgstsdp;
function gst_sdp_message_set_session_name(msg: PGstSDPMessage; session_name: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_get_information(msg: PGstSDPMessage): Pgchar; cdecl; external libgstsdp;
function gst_sdp_message_set_information(msg: PGstSDPMessage; information: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_get_uri(msg: PGstSDPMessage): Pgchar; cdecl; external libgstsdp;
function gst_sdp_message_set_uri(msg: PGstSDPMessage; uri: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_emails_len(msg: PGstSDPMessage): Tguint; cdecl; external libgstsdp;
function gst_sdp_message_get_email(msg: PGstSDPMessage; idx: Tguint): Pgchar; cdecl; external libgstsdp;
function gst_sdp_message_insert_email(msg: PGstSDPMessage; idx: Tgint; email: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_replace_email(msg: PGstSDPMessage; idx: Tguint; email: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_remove_email(msg: PGstSDPMessage; idx: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_add_email(msg: PGstSDPMessage; email: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_phones_len(msg: PGstSDPMessage): Tguint; cdecl; external libgstsdp;
function gst_sdp_message_get_phone(msg: PGstSDPMessage; idx: Tguint): Pgchar; cdecl; external libgstsdp;
function gst_sdp_message_insert_phone(msg: PGstSDPMessage; idx: Tgint; phone: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_replace_phone(msg: PGstSDPMessage; idx: Tguint; phone: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_remove_phone(msg: PGstSDPMessage; idx: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_add_phone(msg: PGstSDPMessage; phone: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_get_connection(msg: PGstSDPMessage): PGstSDPConnection; cdecl; external libgstsdp;
function gst_sdp_message_set_connection(msg: PGstSDPMessage; nettype: Pgchar; addrtype: Pgchar; address: Pgchar; ttl: Tguint;
  addr_number: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_bandwidths_len(msg: PGstSDPMessage): Tguint; cdecl; external libgstsdp;
function gst_sdp_message_get_bandwidth(msg: PGstSDPMessage; idx: Tguint): PGstSDPBandwidth; cdecl; external libgstsdp;
function gst_sdp_message_insert_bandwidth(msg: PGstSDPMessage; idx: Tgint; bw: PGstSDPBandwidth): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_replace_bandwidth(msg: PGstSDPMessage; idx: Tguint; bw: PGstSDPBandwidth): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_remove_bandwidth(msg: PGstSDPMessage; idx: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_add_bandwidth(msg: PGstSDPMessage; bwtype: Pgchar; bandwidth: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_times_len(msg: PGstSDPMessage): Tguint; cdecl; external libgstsdp;
function gst_sdp_message_get_time(msg: PGstSDPMessage; idx: Tguint): PGstSDPTime; cdecl; external libgstsdp;
function gst_sdp_message_insert_time(msg: PGstSDPMessage; idx: Tgint; t: PGstSDPTime): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_replace_time(msg: PGstSDPMessage; idx: Tguint; t: PGstSDPTime): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_remove_time(msg: PGstSDPMessage; idx: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_add_time(msg: PGstSDPMessage; start: Pgchar; stop: Pgchar; _repeat: PPgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_zones_len(msg: PGstSDPMessage): Tguint; cdecl; external libgstsdp;
function gst_sdp_message_get_zone(msg: PGstSDPMessage; idx: Tguint): PGstSDPZone; cdecl; external libgstsdp;
function gst_sdp_message_insert_zone(msg: PGstSDPMessage; idx: Tgint; zone: PGstSDPZone): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_replace_zone(msg: PGstSDPMessage; idx: Tguint; zone: PGstSDPZone): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_remove_zone(msg: PGstSDPMessage; idx: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_add_zone(msg: PGstSDPMessage; adj_time: Pgchar; typed_time: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_get_key(msg: PGstSDPMessage): PGstSDPKey; cdecl; external libgstsdp;
function gst_sdp_message_set_key(msg: PGstSDPMessage; _type: Pgchar; Data: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_attributes_len(msg: PGstSDPMessage): Tguint; cdecl; external libgstsdp;
function gst_sdp_message_get_attribute(msg: PGstSDPMessage; idx: Tguint): PGstSDPAttribute; cdecl; external libgstsdp;
function gst_sdp_message_get_attribute_val(msg: PGstSDPMessage; key: Pgchar): Pgchar; cdecl; external libgstsdp;
function gst_sdp_message_get_attribute_val_n(msg: PGstSDPMessage; key: Pgchar; nth: Tguint): Pgchar; cdecl; external libgstsdp;
function gst_sdp_message_insert_attribute(msg: PGstSDPMessage; idx: Tgint; attr: PGstSDPAttribute): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_replace_attribute(msg: PGstSDPMessage; idx: Tguint; attr: PGstSDPAttribute): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_remove_attribute(msg: PGstSDPMessage; idx: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_add_attribute(msg: PGstSDPMessage; key: Pgchar; Value: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_medias_len(msg: PGstSDPMessage): Tguint; cdecl; external libgstsdp;
function gst_sdp_message_get_media(msg: PGstSDPMessage; idx: Tguint): PGstSDPMedia; cdecl; external libgstsdp;
function gst_sdp_message_add_media(msg: PGstSDPMessage; media: PGstSDPMedia): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_remove_media(msg: PGstSDPMessage; idx: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_dump(msg: PGstSDPMessage): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_new(media: PPGstSDPMedia): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_init(media: PGstSDPMedia): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_uninit(media: PGstSDPMedia): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_free(media: PGstSDPMedia): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_copy(media: PGstSDPMedia; copy: PPGstSDPMedia): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_as_text(media: PGstSDPMedia): Pgchar; cdecl; external libgstsdp;
function gst_sdp_media_get_media(media: PGstSDPMedia): Pgchar; cdecl; external libgstsdp;
function gst_sdp_media_set_media(media: PGstSDPMedia; med: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_get_port(media: PGstSDPMedia): Tguint; cdecl; external libgstsdp;
function gst_sdp_media_get_num_ports(media: PGstSDPMedia): Tguint; cdecl; external libgstsdp;
function gst_sdp_media_set_port_info(media: PGstSDPMedia; port: Tguint; num_ports: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_get_proto(media: PGstSDPMedia): Pgchar; cdecl; external libgstsdp;
function gst_sdp_media_set_proto(media: PGstSDPMedia; proto: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_formats_len(media: PGstSDPMedia): Tguint; cdecl; external libgstsdp;
function gst_sdp_media_get_format(media: PGstSDPMedia; idx: Tguint): Pgchar; cdecl; external libgstsdp;
function gst_sdp_media_insert_format(media: PGstSDPMedia; idx: Tgint; format: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_replace_format(media: PGstSDPMedia; idx: Tguint; format: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_remove_format(media: PGstSDPMedia; idx: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_add_format(media: PGstSDPMedia; format: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_get_information(media: PGstSDPMedia): Pgchar; cdecl; external libgstsdp;
function gst_sdp_media_set_information(media: PGstSDPMedia; information: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_connections_len(media: PGstSDPMedia): Tguint; cdecl; external libgstsdp;
function gst_sdp_media_get_connection(media: PGstSDPMedia; idx: Tguint): PGstSDPConnection; cdecl; external libgstsdp;
function gst_sdp_media_insert_connection(media: PGstSDPMedia; idx: Tgint; conn: PGstSDPConnection): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_replace_connection(media: PGstSDPMedia; idx: Tguint; conn: PGstSDPConnection): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_remove_connection(media: PGstSDPMedia; idx: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_add_connection(media: PGstSDPMedia; nettype: Pgchar; addrtype: Pgchar; address: Pgchar; ttl: Tguint;
  addr_number: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_bandwidths_len(media: PGstSDPMedia): Tguint; cdecl; external libgstsdp;
function gst_sdp_media_get_bandwidth(media: PGstSDPMedia; idx: Tguint): PGstSDPBandwidth; cdecl; external libgstsdp;
function gst_sdp_media_insert_bandwidth(media: PGstSDPMedia; idx: Tgint; bw: PGstSDPBandwidth): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_replace_bandwidth(media: PGstSDPMedia; idx: Tguint; bw: PGstSDPBandwidth): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_remove_bandwidth(media: PGstSDPMedia; idx: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_add_bandwidth(media: PGstSDPMedia; bwtype: Pgchar; bandwidth: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_get_key(media: PGstSDPMedia): PGstSDPKey; cdecl; external libgstsdp;
function gst_sdp_media_set_key(media: PGstSDPMedia; _type: Pgchar; Data: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_attributes_len(media: PGstSDPMedia): Tguint; cdecl; external libgstsdp;
function gst_sdp_media_get_attribute(media: PGstSDPMedia; idx: Tguint): PGstSDPAttribute; cdecl; external libgstsdp;
function gst_sdp_media_get_attribute_val(media: PGstSDPMedia; key: Pgchar): Pgchar; cdecl; external libgstsdp;
function gst_sdp_media_get_attribute_val_n(media: PGstSDPMedia; key: Pgchar; nth: Tguint): Pgchar; cdecl; external libgstsdp;
function gst_sdp_media_insert_attribute(media: PGstSDPMedia; idx: Tgint; attr: PGstSDPAttribute): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_replace_attribute(media: PGstSDPMedia; idx: Tguint; attr: PGstSDPAttribute): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_remove_attribute(media: PGstSDPMedia; idx: Tguint): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_add_attribute(media: PGstSDPMedia; key: Pgchar; Value: Pgchar): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_get_caps_from_media(media: PGstSDPMedia; pt: Tgint): PGstCaps; cdecl; external libgstsdp;
function gst_sdp_media_set_media_from_caps(caps: PGstCaps; media: PGstSDPMedia): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_make_keymgmt(uri: Pgchar; base64: Pgchar): Pgchar; cdecl; external libgstsdp;
function gst_sdp_message_parse_keymgmt(msg: PGstSDPMessage; mikey: PPGstMIKEYMessage): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_parse_keymgmt(media: PGstSDPMedia; mikey: PPGstMIKEYMessage): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_message_attributes_to_caps(msg: PGstSDPMessage; caps: PGstCaps): TGstSDPResult; cdecl; external libgstsdp;
function gst_sdp_media_attributes_to_caps(media: PGstSDPMedia; caps: PGstCaps): TGstSDPResult; cdecl; external libgstsdp;

function GST_SDP_MESSAGE_CAST(obj: Pointer): PGstSDPMessage;
function GST_SDP_MESSAGE(obj: Pointer): PGstSDPMessage;


// === Konventiert am: 5-10-24 18:00:12 ===

function GST_TYPE_SDP_MESSAGE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_SDP_MESSAGE: TGType;
begin
  GST_TYPE_SDP_MESSAGE := gst_sdp_message_get_type;
end;

function GST_SDP_MESSAGE_CAST(obj: Pointer): PGstSDPMessage;
begin
  GST_SDP_MESSAGE_CAST := PGstSDPMessage(obj);
end;

function GST_SDP_MESSAGE(obj: Pointer): PGstSDPMessage;
begin
  GST_SDP_MESSAGE := GST_SDP_MESSAGE_CAST(obj);
end;


{$ENDIF read_implementation}
