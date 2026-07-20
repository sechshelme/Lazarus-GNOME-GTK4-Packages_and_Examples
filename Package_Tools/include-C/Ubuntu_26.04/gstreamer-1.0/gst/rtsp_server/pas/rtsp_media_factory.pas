unit rtsp_media_factory;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, fp_gst_rtsp, rtsp_permissions, rtsp_address_pool;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstRTSPMediaFactoryPrivate = type Pointer;

  PGstRTSPMediaFactory = ^TGstRTSPMediaFactory;
  TGstRTSPMediaFactory = record
    parent: TGObject;
    priv: PGstRTSPMediaFactoryPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstRTSPMediaFactoryClass = ^TGstRTSPMediaFactoryClass;
  TGstRTSPMediaFactoryClass = record
    parent_class: TGObjectClass;
    gen_key: function(factory: PGstRTSPMediaFactory; url: PGstRTSPUrl): Pgchar; cdecl;
    create_element: function(factory: PGstRTSPMediaFactory; url: PGstRTSPUrl): PGstElement; cdecl;
    construct: function(factory: PGstRTSPMediaFactory; url: PGstRTSPUrl): PGstRTSPMedia; cdecl;
    create_pipeline: function(factory: PGstRTSPMediaFactory; media: PGstRTSPMedia): PGstElement; cdecl;
    configure: procedure(factory: PGstRTSPMediaFactory; media: PGstRTSPMedia); cdecl;
    media_constructed: procedure(factory: PGstRTSPMediaFactory; media: PGstRTSPMedia); cdecl;
    media_configure: procedure(factory: PGstRTSPMediaFactory; media: PGstRTSPMedia); cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_media_factory_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_media_factory_new: PGstRTSPMediaFactory; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_launch(factory: PGstRTSPMediaFactory; launch: Pgchar); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_launch(factory: PGstRTSPMediaFactory): Pgchar; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_permissions(factory: PGstRTSPMediaFactory; permissions: PGstRTSPPermissions); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_permissions(factory: PGstRTSPMediaFactory): PGstRTSPPermissions; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_add_role(factory: PGstRTSPMediaFactory; role: Pgchar; fieldname: Pgchar; args: array of const); cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_add_role(factory: PGstRTSPMediaFactory; role: Pgchar; fieldname: Pgchar); cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_add_role_from_structure(factory: PGstRTSPMediaFactory; structure: PGstStructure); cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_shared(factory: PGstRTSPMediaFactory; shared: Tgboolean); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_is_shared(factory: PGstRTSPMediaFactory): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_stop_on_disconnect(factory: PGstRTSPMediaFactory; stop_on_disconnect: Tgboolean); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_is_stop_on_disonnect(factory: PGstRTSPMediaFactory): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_suspend_mode(factory: PGstRTSPMediaFactory; mode: TGstRTSPSuspendMode); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_suspend_mode(factory: PGstRTSPMediaFactory): TGstRTSPSuspendMode; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_eos_shutdown(factory: PGstRTSPMediaFactory; eos_shutdown: Tgboolean); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_is_eos_shutdown(factory: PGstRTSPMediaFactory): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_profiles(factory: PGstRTSPMediaFactory; profiles: TGstRTSPProfile); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_profiles(factory: PGstRTSPMediaFactory): TGstRTSPProfile; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_protocols(factory: PGstRTSPMediaFactory; protocols: TGstRTSPLowerTrans); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_protocols(factory: PGstRTSPMediaFactory): TGstRTSPLowerTrans; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_address_pool(factory: PGstRTSPMediaFactory; pool: PGstRTSPAddressPool); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_address_pool(factory: PGstRTSPMediaFactory): PGstRTSPAddressPool; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_multicast_iface(factory: PGstRTSPMediaFactory; multicast_iface: Pgchar); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_multicast_iface(factory: PGstRTSPMediaFactory): Pgchar; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_buffer_size(factory: PGstRTSPMediaFactory; size: Tguint); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_buffer_size(factory: PGstRTSPMediaFactory): Tguint; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_ensure_keyunit_on_start(factory: PGstRTSPMediaFactory; ensure_keyunit_on_start: Tgboolean); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_ensure_keyunit_on_start(factory: PGstRTSPMediaFactory): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_ensure_keyunit_on_start_timeout(factory: PGstRTSPMediaFactory; timeout: Tguint); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_ensure_keyunit_on_start_timeout(factory: PGstRTSPMediaFactory): Tguint; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_retransmission_time(factory: PGstRTSPMediaFactory; time: TGstClockTime); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_retransmission_time(factory: PGstRTSPMediaFactory): TGstClockTime; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_do_retransmission(factory: PGstRTSPMediaFactory; do_retransmission: Tgboolean); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_do_retransmission(factory: PGstRTSPMediaFactory): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_latency(factory: PGstRTSPMediaFactory; latency: Tguint); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_latency(factory: PGstRTSPMediaFactory): Tguint; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_transport_mode(factory: PGstRTSPMediaFactory; mode: TGstRTSPTransportMode); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_transport_mode(factory: PGstRTSPMediaFactory): TGstRTSPTransportMode; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_media_gtype(factory: PGstRTSPMediaFactory; media_gtype: TGType); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_media_gtype(factory: PGstRTSPMediaFactory): TGType; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_clock(factory: PGstRTSPMediaFactory; clock: PGstClock); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_clock(factory: PGstRTSPMediaFactory): PGstClock; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_publish_clock_mode(factory: PGstRTSPMediaFactory; mode: TGstRTSPPublishClockMode); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_publish_clock_mode(factory: PGstRTSPMediaFactory): TGstRTSPPublishClockMode; cdecl; external libgstrtsp;
function gst_rtsp_media_factory_set_max_mcast_ttl(factory: PGstRTSPMediaFactory; ttl: Tguint): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_max_mcast_ttl(factory: PGstRTSPMediaFactory): Tguint; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_bind_mcast_address(factory: PGstRTSPMediaFactory; bind_mcast_addr: Tgboolean); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_is_bind_mcast_address(factory: PGstRTSPMediaFactory): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_dscp_qos(factory: PGstRTSPMediaFactory; dscp_qos: Tgint); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_get_dscp_qos(factory: PGstRTSPMediaFactory): Tgint; cdecl; external libgstrtsp;
procedure gst_rtsp_media_factory_set_enable_rtcp(factory: PGstRTSPMediaFactory; enable: Tgboolean); cdecl; external libgstrtsp;
function gst_rtsp_media_factory_is_enable_rtcp(factory: PGstRTSPMediaFactory): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_media_factory_construct(factory: PGstRTSPMediaFactory; url: PGstRTSPUrl): PGstRTSPMedia; cdecl; external libgstrtsp;
function gst_rtsp_media_factory_create_element(factory: PGstRTSPMediaFactory; url: PGstRTSPUrl): PGstElement; cdecl; external libgstrtsp;

// === Konventiert am: 20-7-26 13:45:31 ===

function GST_TYPE_RTSP_MEDIA_FACTORY: TGType;
function GST_RTSP_MEDIA_FACTORY(obj: Pointer): PGstRTSPMediaFactory;
function GST_RTSP_MEDIA_FACTORY_CLASS(klass: Pointer): PGstRTSPMediaFactoryClass;
function GST_IS_RTSP_MEDIA_FACTORY(obj: Pointer): Tgboolean;
function GST_IS_RTSP_MEDIA_FACTORY_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_MEDIA_FACTORY_GET_CLASS(obj: Pointer): PGstRTSPMediaFactoryClass;
function GST_RTSP_MEDIA_FACTORY_CAST(obj: Pointer): PGstRTSPMediaFactory;
function GST_RTSP_MEDIA_FACTORY_CLASS_CAST(klass: Pointer): PGstRTSPMediaFactoryClass;
{$ENDIF read_function}

implementation

function GST_TYPE_RTSP_MEDIA_FACTORY: TGType;
begin
  Result := gst_rtsp_media_factory_get_type;
end;

function GST_RTSP_MEDIA_FACTORY(obj: Pointer): PGstRTSPMediaFactory;
begin
  Result := PGstRTSPMediaFactory(g_type_check_instance_cast(obj, GST_TYPE_RTSP_MEDIA_FACTORY));
end;

function GST_RTSP_MEDIA_FACTORY_CLASS(klass: Pointer): PGstRTSPMediaFactoryClass;
begin
  Result := PGstRTSPMediaFactoryClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_MEDIA_FACTORY));
end;

function GST_IS_RTSP_MEDIA_FACTORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_MEDIA_FACTORY);
end;

function GST_IS_RTSP_MEDIA_FACTORY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_MEDIA_FACTORY);
end;

function GST_RTSP_MEDIA_FACTORY_GET_CLASS(obj: Pointer): PGstRTSPMediaFactoryClass;
begin
  Result := PGstRTSPMediaFactoryClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_MEDIA_FACTORY_CAST(obj: Pointer): PGstRTSPMediaFactory;
begin
  Result := PGstRTSPMediaFactory(obj);
end;

function GST_RTSP_MEDIA_FACTORY_CLASS_CAST(klass: Pointer): PGstRTSPMediaFactoryClass;
begin
  Result := PGstRTSPMediaFactoryClass(klass);
end;

end.
