

  {$IFDEF read_struct}
type
  PGstRTSPAuthPrivate = type Pointer;

  PGstRTSPAuth = ^TGstRTSPAuth;
  TGstRTSPAuth = record
    parent: TGObject;
    priv: PGstRTSPAuthPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstRTSPAuthClass = ^TGstRTSPAuthClass;
  TGstRTSPAuthClass = record
    parent_class: TGObjectClass;
    authenticate: function(auth: PGstRTSPAuth; ctx: PGstRTSPContext): Tgboolean; cdecl;
    check: function(auth: PGstRTSPAuth; ctx: PGstRTSPContext; check: Pgchar): Tgboolean; cdecl;
    generate_authenticate_header: procedure(auth: PGstRTSPAuth; ctx: PGstRTSPContext); cdecl;
    accept_certificate: function(auth: PGstRTSPAuth; connection: PGTlsConnection; peer_cert: PGTlsCertificate; errors: TGTlsCertificateFlags): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING - 1) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  GST_RTSP_AUTH_CHECK_CONNECT = 'auth.check.connect';
  GST_RTSP_AUTH_CHECK_URL = 'auth.check.url';
  GST_RTSP_AUTH_CHECK_MEDIA_FACTORY_ACCESS = 'auth.check.media.factory.access';
  GST_RTSP_AUTH_CHECK_MEDIA_FACTORY_CONSTRUCT = 'auth.check.media.factory.construct';
  GST_RTSP_AUTH_CHECK_TRANSPORT_CLIENT_SETTINGS = 'auth.check.transport.client-settings';
  GST_RTSP_TOKEN_MEDIA_FACTORY_ROLE = 'media.factory.role';
  GST_RTSP_TOKEN_TRANSPORT_CLIENT_SETTINGS = 'transport.client-settings';
  GST_RTSP_PERM_MEDIA_FACTORY_ACCESS = 'media.factory.access';
  GST_RTSP_PERM_MEDIA_FACTORY_CONSTRUCT = 'media.factory.construct';
  {$ENDIF read_enum}

{$IFDEF read_function}
function gst_rtsp_auth_get_type: TGType; cdecl; external libgstrtspserver;
function gst_rtsp_auth_new: PGstRTSPAuth; cdecl; external libgstrtspserver;
procedure gst_rtsp_auth_set_tls_certificate(auth: PGstRTSPAuth; cert: PGTlsCertificate); cdecl; external libgstrtspserver;
function gst_rtsp_auth_get_tls_certificate(auth: PGstRTSPAuth): PGTlsCertificate; cdecl; external libgstrtspserver;
procedure gst_rtsp_auth_set_tls_database(auth: PGstRTSPAuth; database: PGTlsDatabase); cdecl; external libgstrtspserver;
function gst_rtsp_auth_get_tls_database(auth: PGstRTSPAuth): PGTlsDatabase; cdecl; external libgstrtspserver;
procedure gst_rtsp_auth_set_tls_authentication_mode(auth: PGstRTSPAuth; mode: TGTlsAuthenticationMode); cdecl; external libgstrtspserver;
function gst_rtsp_auth_get_tls_authentication_mode(auth: PGstRTSPAuth): TGTlsAuthenticationMode; cdecl; external libgstrtspserver;
procedure gst_rtsp_auth_set_default_token(auth: PGstRTSPAuth; token: PGstRTSPToken); cdecl; external libgstrtspserver;
function gst_rtsp_auth_get_default_token(auth: PGstRTSPAuth): PGstRTSPToken; cdecl; external libgstrtspserver;
procedure gst_rtsp_auth_add_basic(auth: PGstRTSPAuth; basic: Pgchar; token: PGstRTSPToken); cdecl; external libgstrtspserver;
procedure gst_rtsp_auth_remove_basic(auth: PGstRTSPAuth; basic: Pgchar); cdecl; external libgstrtspserver;
procedure gst_rtsp_auth_add_digest(auth: PGstRTSPAuth; user: Pgchar; pass: Pgchar; token: PGstRTSPToken); cdecl; external libgstrtspserver;
procedure gst_rtsp_auth_remove_digest(auth: PGstRTSPAuth; user: Pgchar); cdecl; external libgstrtspserver;
procedure gst_rtsp_auth_set_supported_methods(auth: PGstRTSPAuth; methods: TGstRTSPAuthMethod); cdecl; external libgstrtspserver;
function gst_rtsp_auth_get_supported_methods(auth: PGstRTSPAuth): TGstRTSPAuthMethod; cdecl; external libgstrtspserver;
function gst_rtsp_auth_check(check: Pgchar): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_auth_parse_htdigest(auth: PGstRTSPAuth; path: Pgchar; token: PGstRTSPToken): Tgboolean; cdecl; external libgstrtspserver;
procedure gst_rtsp_auth_set_realm(auth: PGstRTSPAuth; realm: Pgchar); cdecl; external libgstrtspserver;
function gst_rtsp_auth_get_realm(auth: PGstRTSPAuth): Pgchar; cdecl; external libgstrtspserver;
function gst_rtsp_auth_make_basic(user: Pgchar; pass: Pgchar): Pgchar; cdecl; external libgstrtspserver;

// === Konventiert am: 20-7-26 13:45:51 ===

function GST_TYPE_RTSP_AUTH: TGType;
function GST_RTSP_AUTH(obj: Pointer): PGstRTSPAuth;
function GST_RTSP_AUTH_CLASS(klass: Pointer): PGstRTSPAuthClass;
function GST_IS_RTSP_AUTH(obj: Pointer): Tgboolean;
function GST_IS_RTSP_AUTH_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_AUTH_GET_CLASS(obj: Pointer): PGstRTSPAuthClass;
function GST_RTSP_AUTH_CAST(obj: Pointer): PGstRTSPAuth;
function GST_RTSP_AUTH_CLASS_CAST(klass: Pointer): PGstRTSPAuthClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_AUTH: TGType;
begin
  Result := gst_rtsp_auth_get_type;
end;

function GST_RTSP_AUTH(obj: Pointer): PGstRTSPAuth;
begin
  Result := PGstRTSPAuth(g_type_check_instance_cast(obj, GST_TYPE_RTSP_AUTH));
end;

function GST_RTSP_AUTH_CLASS(klass: Pointer): PGstRTSPAuthClass;
begin
  Result := PGstRTSPAuthClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_AUTH));
end;

function GST_IS_RTSP_AUTH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_AUTH);
end;

function GST_IS_RTSP_AUTH_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_AUTH);
end;

function GST_RTSP_AUTH_GET_CLASS(obj: Pointer): PGstRTSPAuthClass;
begin
  Result := PGstRTSPAuthClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_AUTH_CAST(obj: Pointer): PGstRTSPAuth;
begin
  Result := PGstRTSPAuth(obj);
end;

function GST_RTSP_AUTH_CLASS_CAST(klass: Pointer): PGstRTSPAuthClass;
begin
  Result := PGstRTSPAuthClass(klass);
end;

{$ENDIF read_implementation}
