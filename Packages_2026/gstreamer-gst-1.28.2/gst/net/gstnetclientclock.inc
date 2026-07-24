{$IFDEF read_interface}


type
  PGstNetClientClockPrivate = type Pointer;

  PGstNetClientClock = ^TGstNetClientClock;
  TGstNetClientClock = record
    clock: TGstSystemClock;
    priv: PGstNetClientClockPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstNetClientClockClass = ^TGstNetClientClockClass;
  TGstNetClientClockClass = record
    parent_class: TGstSystemClockClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;


function gst_net_client_clock_get_type: TGType; cdecl; external libgstnet;
procedure gst_net_client_clock_deinit; cdecl; external libgstnet;
function gst_net_client_clock_new(name: Pgchar; remote_address: Pgchar; remote_port: Tgint; base_time: TGstClockTime): PGstClock; cdecl; external libgstnet;

type
  PGstNtpClock = PGstNetClientClock;
  PGstNtpClockClass = PGstNetClientClockClass;

function gst_ntp_clock_get_type: TGType; cdecl; external libgstnet;
function gst_ntp_clock_new(name: Pgchar; remote_address: Pgchar; remote_port: Tgint; base_time: TGstClockTime): PGstClock; cdecl; external libgstnet;

// === Konventiert am: 24-7-26 14:45:44 ===

function GST_TYPE_NET_CLIENT_CLOCK: TGType;
function GST_NET_CLIENT_CLOCK(obj: Pointer): PGstNetClientClock;
function GST_NET_CLIENT_CLOCK_CLASS(klass: Pointer): PGstNetClientClockClass;
function GST_IS_NET_CLIENT_CLOCK(obj: Pointer): Tgboolean;
function GST_IS_NET_CLIENT_CLOCK_CLASS(klass: Pointer): Tgboolean;

function GST_TYPE_NTP_CLOCK: TGType;
function GST_NTP_CLOCK(obj: Pointer): PGstNtpClock;
function GST_NTP_CLOCK_CLASS(klass: Pointer): PGstNtpClockClass;
function GST_IS_NTP_CLOCK(obj: Pointer): Tgboolean;
function GST_IS_NTP_CLOCK_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_NET_CLIENT_CLOCK: TGType;
begin
  GST_TYPE_NET_CLIENT_CLOCK := gst_net_client_clock_get_type;
end;

function GST_NET_CLIENT_CLOCK(obj: Pointer): PGstNetClientClock;
begin
  Result := PGstNetClientClock(g_type_check_instance_cast(obj, GST_TYPE_NET_CLIENT_CLOCK));
end;

function GST_NET_CLIENT_CLOCK_CLASS(klass: Pointer): PGstNetClientClockClass;
begin
  Result := PGstNetClientClockClass(g_type_check_class_cast(klass, GST_TYPE_NET_CLIENT_CLOCK));
end;

function GST_IS_NET_CLIENT_CLOCK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_NET_CLIENT_CLOCK);
end;

function GST_IS_NET_CLIENT_CLOCK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_NET_CLIENT_CLOCK);
end;


function GST_TYPE_NTP_CLOCK: TGType;
begin
  GST_TYPE_NTP_CLOCK := gst_ntp_clock_get_type;
end;

function GST_NTP_CLOCK(obj: Pointer): PGstNtpClock;
begin
  Result := PGstNtpClock(g_type_check_instance_cast(obj, GST_TYPE_NTP_CLOCK));
end;

function GST_NTP_CLOCK_CLASS(klass: Pointer): PGstNtpClockClass;
begin
  Result := PGstNtpClockClass(g_type_check_class_cast(klass, GST_TYPE_NTP_CLOCK));
end;

function GST_IS_NTP_CLOCK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_NTP_CLOCK);
end;

function GST_IS_NTP_CLOCK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_NTP_CLOCK);
end;

{$ENDIF read_implementation}
