unit fp_microhttpd;

interface

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  {$IFDEF Linux}
  libmicrohttpd = 'microhttpd';
  {$ENDIF}

  {$IFDEF mswindows}
  libmicrohttpd = 'microhttpd.dll';  // ?????
  {$ENDIF}


  // ==== Eigenes
const
  UINT64_MAX = High(uint64);
  FD_SETSIZE = 1024; // Nur Linux    Windows = 64

type
  Tintptr_t = PtrInt;
  TSOCKET = pointer;

  Tsocklen_t = longint;

  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;

  Tuint16_t = uint16;

  Tint32_t = int64;
  Tuint32_t = uint32;

  Tint64_t = int64;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;


  Tsize_t = SizeInt;
  Psize_t = ^Tsize_t;

  Toff_t = uint64; // bei 64bit

  Tva_list = Pointer;

  Psockaddr = Pointer;

  Pfd_set = Pointer;

  //  Tdigest_arr=array[0..(MHD_MD5_DIGEST_SIZE)-1] of Tuint8_t
  Tdigest_arr = array[0..(16) - 1] of Tuint8_t;


  // ========


type
  Pssize_t = ^Tssize_t;
  Tssize_t = Tintptr_t;

  TMHD_Result = longint;

const
  MHD_NO = 0;
  MHD_YES = 1;

  MHD_SIZE_UNKNOWN = UINT64_MAX;

type
  PMHD_socket = ^TMHD_socket;
  TMHD_socket = longint;

type
  TMHD_LONG_LONG = int64;
  TMHD_UNSIGNED_LONG_LONG = qword;
  PMHD_UNSIGNED_LONG_LONG = ^TMHD_UNSIGNED_LONG_LONG;

const
  MHD_LONG_LONG_PRINTF = 'll';
  MHD_UNSIGNED_LONG_LONG_PRINTF = '%llu';
  MHD_HTTP_CONTINUE = 100;
  MHD_HTTP_SWITCHING_PROTOCOLS = 101;
  MHD_HTTP_PROCESSING = 102;
  MHD_HTTP_EARLY_HINTS = 103;
  MHD_HTTP_OK = 200;
  MHD_HTTP_CREATED = 201;
  MHD_HTTP_ACCEPTED = 202;
  MHD_HTTP_NON_AUTHORITATIVE_INFORMATION = 203;
  MHD_HTTP_NO_CONTENT = 204;
  MHD_HTTP_RESET_CONTENT = 205;
  MHD_HTTP_PARTIAL_CONTENT = 206;
  MHD_HTTP_MULTI_STATUS = 207;
  MHD_HTTP_ALREADY_REPORTED = 208;
  MHD_HTTP_IM_USED = 226;
  MHD_HTTP_MULTIPLE_CHOICES = 300;
  MHD_HTTP_MOVED_PERMANENTLY = 301;
  MHD_HTTP_FOUND = 302;
  MHD_HTTP_SEE_OTHER = 303;
  MHD_HTTP_NOT_MODIFIED = 304;
  MHD_HTTP_USE_PROXY = 305;
  MHD_HTTP_SWITCH_PROXY = 306;
  MHD_HTTP_TEMPORARY_REDIRECT = 307;
  MHD_HTTP_PERMANENT_REDIRECT = 308;
  MHD_HTTP_BAD_REQUEST = 400;
  MHD_HTTP_UNAUTHORIZED = 401;
  MHD_HTTP_PAYMENT_REQUIRED = 402;
  MHD_HTTP_FORBIDDEN = 403;
  MHD_HTTP_NOT_FOUND = 404;
  MHD_HTTP_METHOD_NOT_ALLOWED = 405;
  MHD_HTTP_NOT_ACCEPTABLE = 406;
  MHD_HTTP_PROXY_AUTHENTICATION_REQUIRED = 407;
  MHD_HTTP_REQUEST_TIMEOUT = 408;
  MHD_HTTP_CONFLICT = 409;
  MHD_HTTP_GONE = 410;
  MHD_HTTP_LENGTH_REQUIRED = 411;
  MHD_HTTP_PRECONDITION_FAILED = 412;
  MHD_HTTP_CONTENT_TOO_LARGE = 413;
  MHD_HTTP_URI_TOO_LONG = 414;
  MHD_HTTP_UNSUPPORTED_MEDIA_TYPE = 415;
  MHD_HTTP_RANGE_NOT_SATISFIABLE = 416;
  MHD_HTTP_EXPECTATION_FAILED = 417;
  MHD_HTTP_MISDIRECTED_REQUEST = 421;
  MHD_HTTP_UNPROCESSABLE_CONTENT = 422;
  MHD_HTTP_LOCKED = 423;
  MHD_HTTP_FAILED_DEPENDENCY = 424;
  MHD_HTTP_TOO_EARLY = 425;
  MHD_HTTP_UPGRADE_REQUIRED = 426;
  MHD_HTTP_PRECONDITION_REQUIRED = 428;
  MHD_HTTP_TOO_MANY_REQUESTS = 429;
  MHD_HTTP_REQUEST_HEADER_FIELDS_TOO_LARGE = 431;
  MHD_HTTP_UNAVAILABLE_FOR_LEGAL_REASONS = 451;
  MHD_HTTP_INTERNAL_SERVER_ERROR = 500;
  MHD_HTTP_NOT_IMPLEMENTED = 501;
  MHD_HTTP_BAD_GATEWAY = 502;
  MHD_HTTP_SERVICE_UNAVAILABLE = 503;
  MHD_HTTP_GATEWAY_TIMEOUT = 504;
  MHD_HTTP_HTTP_VERSION_NOT_SUPPORTED = 505;
  MHD_HTTP_VARIANT_ALSO_NEGOTIATES = 506;
  MHD_HTTP_INSUFFICIENT_STORAGE = 507;
  MHD_HTTP_LOOP_DETECTED = 508;
  MHD_HTTP_NOT_EXTENDED = 510;
  MHD_HTTP_NETWORK_AUTHENTICATION_REQUIRED = 511;
  MHD_HTTP_RETRY_WITH = 449;
  MHD_HTTP_BLOCKED_BY_WINDOWS_PARENTAL_CONTROLS = 450;
  MHD_HTTP_BANDWIDTH_LIMIT_EXCEEDED = 509;

function MHD_get_reason_phrase_for(code: dword): pchar; cdecl; external libmicrohttpd;
function MHD_get_reason_phrase_len_for(code: dword): Tsize_t; cdecl; external libmicrohttpd;

const
  MHD_HTTP_HEADER_ACCEPT = 'Accept';
  MHD_HTTP_HEADER_ACCEPT_CHARSET = 'Accept-Charset';
  MHD_HTTP_HEADER_ACCEPT_ENCODING = 'Accept-Encoding';
  MHD_HTTP_HEADER_ACCEPT_LANGUAGE = 'Accept-Language';
  MHD_HTTP_HEADER_ACCEPT_RANGES = 'Accept-Ranges';
  MHD_HTTP_HEADER_AGE = 'Age';
  MHD_HTTP_HEADER_ALLOW = 'Allow';
  MHD_HTTP_HEADER_AUTHENTICATION_INFO = 'Authentication-Info';
  MHD_HTTP_HEADER_AUTHORIZATION = 'Authorization';
  MHD_HTTP_HEADER_CACHE_CONTROL = 'Cache-Control';
  MHD_HTTP_HEADER_CLOSE = 'Close';
  MHD_HTTP_HEADER_CONNECTION = 'Connection';
  MHD_HTTP_HEADER_CONTENT_ENCODING = 'Content-Encoding';
  MHD_HTTP_HEADER_CONTENT_LANGUAGE = 'Content-Language';
  MHD_HTTP_HEADER_CONTENT_LENGTH = 'Content-Length';
  MHD_HTTP_HEADER_CONTENT_LOCATION = 'Content-Location';
  MHD_HTTP_HEADER_CONTENT_RANGE = 'Content-Range';
  MHD_HTTP_HEADER_CONTENT_TYPE = 'Content-Type';
  MHD_HTTP_HEADER_DATE = 'Date';
  MHD_HTTP_HEADER_ETAG = 'ETag';
  MHD_HTTP_HEADER_EXPECT = 'Expect';
  MHD_HTTP_HEADER_EXPIRES = 'Expires';
  MHD_HTTP_HEADER_FROM = 'From';
  MHD_HTTP_HEADER_HOST = 'Host';
  MHD_HTTP_HEADER_IF_MATCH = 'If-Match';
  MHD_HTTP_HEADER_IF_MODIFIED_SINCE = 'If-Modified-Since';
  MHD_HTTP_HEADER_IF_NONE_MATCH = 'If-None-Match';
  MHD_HTTP_HEADER_IF_RANGE = 'If-Range';
  MHD_HTTP_HEADER_IF_UNMODIFIED_SINCE = 'If-Unmodified-Since';
  MHD_HTTP_HEADER_LAST_MODIFIED = 'Last-Modified';
  MHD_HTTP_HEADER_LOCATION = 'Location';
  MHD_HTTP_HEADER_MAX_FORWARDS = 'Max-Forwards';
  MHD_HTTP_HEADER_MIME_VERSION = 'MIME-Version';
  MHD_HTTP_HEADER_PRAGMA = 'Pragma';
  MHD_HTTP_HEADER_PROXY_AUTHENTICATE = 'Proxy-Authenticate';
  MHD_HTTP_HEADER_PROXY_AUTHENTICATION_INFO = 'Proxy-Authentication-Info';
  MHD_HTTP_HEADER_PROXY_AUTHORIZATION = 'Proxy-Authorization';
  MHD_HTTP_HEADER_RANGE = 'Range';
  MHD_HTTP_HEADER_REFERER = 'Referer';
  MHD_HTTP_HEADER_RETRY_AFTER = 'Retry-After';
  MHD_HTTP_HEADER_SERVER = 'Server';
  MHD_HTTP_HEADER_TE = 'TE';
  MHD_HTTP_HEADER_TRAILER = 'Trailer';
  MHD_HTTP_HEADER_TRANSFER_ENCODING = 'Transfer-Encoding';
  MHD_HTTP_HEADER_UPGRADE = 'Upgrade';
  MHD_HTTP_HEADER_USER_AGENT = 'User-Agent';
  MHD_HTTP_HEADER_VARY = 'Vary';
  MHD_HTTP_HEADER_VIA = 'Via';
  MHD_HTTP_HEADER_WWW_AUTHENTICATE = 'WWW-Authenticate';
  MHD_HTTP_HEADER_ASTERISK = '*';
  MHD_HTTP_HEADER_A_IM = 'A-IM';
  MHD_HTTP_HEADER_ACCEPT_ADDITIONS = 'Accept-Additions';
  MHD_HTTP_HEADER_ACCEPT_CH = 'Accept-CH';
  MHD_HTTP_HEADER_ACCEPT_DATETIME = 'Accept-Datetime';
  MHD_HTTP_HEADER_ACCEPT_FEATURES = 'Accept-Features';
  MHD_HTTP_HEADER_ACCEPT_PATCH = 'Accept-Patch';
  MHD_HTTP_HEADER_ACCEPT_POST = 'Accept-Post';
  MHD_HTTP_HEADER_ACCEPT_SIGNATURE = 'Accept-Signature';
  MHD_HTTP_HEADER_ACCESS_CONTROL_ALLOW_CREDENTIALS = 'Access-Control-Allow-Credentials';
  MHD_HTTP_HEADER_ACCESS_CONTROL_ALLOW_HEADERS = 'Access-Control-Allow-Headers';
  MHD_HTTP_HEADER_ACCESS_CONTROL_ALLOW_METHODS = 'Access-Control-Allow-Methods';
  MHD_HTTP_HEADER_ACCESS_CONTROL_ALLOW_ORIGIN = 'Access-Control-Allow-Origin';
  MHD_HTTP_HEADER_ACCESS_CONTROL_EXPOSE_HEADERS = 'Access-Control-Expose-Headers';
  MHD_HTTP_HEADER_ACCESS_CONTROL_MAX_AGE = 'Access-Control-Max-Age';
  MHD_HTTP_HEADER_ACCESS_CONTROL_REQUEST_HEADERS = 'Access-Control-Request-Headers';
  MHD_HTTP_HEADER_ACCESS_CONTROL_REQUEST_METHOD = 'Access-Control-Request-Method';
  MHD_HTTP_HEADER_ALPN = 'ALPN';
  MHD_HTTP_HEADER_ALT_SVC = 'Alt-Svc';
  MHD_HTTP_HEADER_ALT_USED = 'Alt-Used';
  MHD_HTTP_HEADER_ALTERNATES = 'Alternates';
  MHD_HTTP_HEADER_APPLY_TO_REDIRECT_REF = 'Apply-To-Redirect-Ref';
  MHD_HTTP_HEADER_AUTHENTICATION_CONTROL = 'Authentication-Control';
  MHD_HTTP_HEADER_CACHE_STATUS = 'Cache-Status';
  MHD_HTTP_HEADER_CAL_MANAGED_ID = 'Cal-Managed-ID';
  MHD_HTTP_HEADER_CALDAV_TIMEZONES = 'CalDAV-Timezones';
  MHD_HTTP_HEADER_CAPSULE_PROTOCOL = 'Capsule-Protocol';
  MHD_HTTP_HEADER_CDN_CACHE_CONTROL = 'CDN-Cache-Control';
  MHD_HTTP_HEADER_CDN_LOOP = 'CDN-Loop';
  MHD_HTTP_HEADER_CERT_NOT_AFTER = 'Cert-Not-After';
  MHD_HTTP_HEADER_CERT_NOT_BEFORE = 'Cert-Not-Before';
  MHD_HTTP_HEADER_CLEAR_SITE_DATA = 'Clear-Site-Data';
  MHD_HTTP_HEADER_CLIENT_CERT = 'Client-Cert';
  MHD_HTTP_HEADER_CLIENT_CERT_CHAIN = 'Client-Cert-Chain';
  MHD_HTTP_HEADER_CONTENT_DIGEST = 'Content-Digest';
  MHD_HTTP_HEADER_CONTENT_DISPOSITION = 'Content-Disposition';
  MHD_HTTP_HEADER_CONTENT_ID = 'Content-ID';
  MHD_HTTP_HEADER_CONTENT_SECURITY_POLICY = 'Content-Security-Policy';
  MHD_HTTP_HEADER_CONTENT_SECURITY_POLICY_REPORT_ONLY = 'Content-Security-Policy-Report-Only';
  MHD_HTTP_HEADER_COOKIE = 'Cookie';
  MHD_HTTP_HEADER_CROSS_ORIGIN_EMBEDDER_POLICY = 'Cross-Origin-Embedder-Policy';
  MHD_HTTP_HEADER_CROSS_ORIGIN_EMBEDDER_POLICY_REPORT_ONLY = 'Cross-Origin-Embedder-Policy-Report-Only';
  MHD_HTTP_HEADER_CROSS_ORIGIN_OPENER_POLICY = 'Cross-Origin-Opener-Policy';
  MHD_HTTP_HEADER_CROSS_ORIGIN_OPENER_POLICY_REPORT_ONLY = 'Cross-Origin-Opener-Policy-Report-Only';
  MHD_HTTP_HEADER_CROSS_ORIGIN_RESOURCE_POLICY = 'Cross-Origin-Resource-Policy';
  MHD_HTTP_HEADER_DASL = 'DASL';
  MHD_HTTP_HEADER_DAV = 'DAV';
  MHD_HTTP_HEADER_DELTA_BASE = 'Delta-Base';
  MHD_HTTP_HEADER_DEPTH = 'Depth';
  MHD_HTTP_HEADER_DESTINATION = 'Destination';
  MHD_HTTP_HEADER_DIFFERENTIAL_ID = 'Differential-ID';
  MHD_HTTP_HEADER_DPOP = 'DPoP';
  MHD_HTTP_HEADER_DPOP_NONCE = 'DPoP-Nonce';
  MHD_HTTP_HEADER_EARLY_DATA = 'Early-Data';
  MHD_HTTP_HEADER_EXPECT_CT = 'Expect-CT';
  MHD_HTTP_HEADER_FORWARDED = 'Forwarded';
  MHD_HTTP_HEADER_HOBAREG = 'Hobareg';
  MHD_HTTP_HEADER_IF = 'If';
  MHD_HTTP_HEADER_IF_SCHEDULE_TAG_MATCH = 'If-Schedule-Tag-Match';
  MHD_HTTP_HEADER_IM = 'IM';
  MHD_HTTP_HEADER_INCLUDE_REFERRED_TOKEN_BINDING_ID = 'Include-Referred-Token-Binding-ID';
  MHD_HTTP_HEADER_KEEP_ALIVE = 'Keep-Alive';
  MHD_HTTP_HEADER_LABEL = 'Label';
  MHD_HTTP_HEADER_LAST_EVENT_ID = 'Last-Event-ID';
  MHD_HTTP_HEADER_LINK = 'Link';
  MHD_HTTP_HEADER_LOCK_TOKEN = 'Lock-Token';
  MHD_HTTP_HEADER_MEMENTO_DATETIME = 'Memento-Datetime';
  MHD_HTTP_HEADER_METER = 'Meter';
  MHD_HTTP_HEADER_NEGOTIATE = 'Negotiate';
  MHD_HTTP_HEADER_NEL = 'NEL';
  MHD_HTTP_HEADER_ODATA_ENTITYID = 'OData-EntityId';
  MHD_HTTP_HEADER_ODATA_ISOLATION = 'OData-Isolation';
  MHD_HTTP_HEADER_ODATA_MAXVERSION = 'OData-MaxVersion';
  MHD_HTTP_HEADER_ODATA_VERSION = 'OData-Version';
  MHD_HTTP_HEADER_OPTIONAL_WWW_AUTHENTICATE = 'Optional-WWW-Authenticate';
  MHD_HTTP_HEADER_ORDERING_TYPE = 'Ordering-Type';
  MHD_HTTP_HEADER_ORIGIN = 'Origin';
  MHD_HTTP_HEADER_ORIGIN_AGENT_CLUSTER = 'Origin-Agent-Cluster';
  MHD_HTTP_HEADER_OSCORE = 'OSCORE';
  MHD_HTTP_HEADER_OSLC_CORE_VERSION = 'OSLC-Core-Version';
  MHD_HTTP_HEADER_OVERWRITE = 'Overwrite';
  MHD_HTTP_HEADER_PING_FROM = 'Ping-From';
  MHD_HTTP_HEADER_PING_TO = 'Ping-To';
  MHD_HTTP_HEADER_POSITION = 'Position';
  MHD_HTTP_HEADER_PREFER = 'Prefer';
  MHD_HTTP_HEADER_PREFERENCE_APPLIED = 'Preference-Applied';
  MHD_HTTP_HEADER_PRIORITY = 'Priority';
  MHD_HTTP_HEADER_PROXY_STATUS = 'Proxy-Status';
  MHD_HTTP_HEADER_PUBLIC_KEY_PINS = 'Public-Key-Pins';
  MHD_HTTP_HEADER_PUBLIC_KEY_PINS_REPORT_ONLY = 'Public-Key-Pins-Report-Only';
  MHD_HTTP_HEADER_REDIRECT_REF = 'Redirect-Ref';
  MHD_HTTP_HEADER_REFRESH = 'Refresh';
  MHD_HTTP_HEADER_REPLAY_NONCE = 'Replay-Nonce';
  MHD_HTTP_HEADER_REPR_DIGEST = 'Repr-Digest';
  MHD_HTTP_HEADER_SCHEDULE_REPLY = 'Schedule-Reply';
  MHD_HTTP_HEADER_SCHEDULE_TAG = 'Schedule-Tag';
  MHD_HTTP_HEADER_SEC_PURPOSE = 'Sec-Purpose';
  MHD_HTTP_HEADER_SEC_TOKEN_BINDING = 'Sec-Token-Binding';
  MHD_HTTP_HEADER_SEC_WEBSOCKET_ACCEPT = 'Sec-WebSocket-Accept';
  MHD_HTTP_HEADER_SEC_WEBSOCKET_EXTENSIONS = 'Sec-WebSocket-Extensions';
  MHD_HTTP_HEADER_SEC_WEBSOCKET_KEY = 'Sec-WebSocket-Key';
  MHD_HTTP_HEADER_SEC_WEBSOCKET_PROTOCOL = 'Sec-WebSocket-Protocol';
  MHD_HTTP_HEADER_SEC_WEBSOCKET_VERSION = 'Sec-WebSocket-Version';
  MHD_HTTP_HEADER_SERVER_TIMING = 'Server-Timing';
  MHD_HTTP_HEADER_SET_COOKIE = 'Set-Cookie';
  MHD_HTTP_HEADER_SIGNATURE = 'Signature';
  MHD_HTTP_HEADER_SIGNATURE_INPUT = 'Signature-Input';
  MHD_HTTP_HEADER_SLUG = 'SLUG';
  MHD_HTTP_HEADER_SOAPACTION = 'SoapAction';
  MHD_HTTP_HEADER_STATUS_URI = 'Status-URI';
  MHD_HTTP_HEADER_STRICT_TRANSPORT_SECURITY = 'Strict-Transport-Security';
  MHD_HTTP_HEADER_SUNSET = 'Sunset';
  MHD_HTTP_HEADER_SURROGATE_CAPABILITY = 'Surrogate-Capability';
  MHD_HTTP_HEADER_SURROGATE_CONTROL = 'Surrogate-Control';
  MHD_HTTP_HEADER_TCN = 'TCN';
  MHD_HTTP_HEADER_TIMEOUT = 'Timeout';
  MHD_HTTP_HEADER_TOPIC = 'Topic';
  MHD_HTTP_HEADER_TRACEPARENT = 'Traceparent';
  MHD_HTTP_HEADER_TRACESTATE = 'Tracestate';
  MHD_HTTP_HEADER_TTL = 'TTL';
  MHD_HTTP_HEADER_URGENCY = 'Urgency';
  MHD_HTTP_HEADER_VARIANT_VARY = 'Variant-Vary';
  MHD_HTTP_HEADER_WANT_CONTENT_DIGEST = 'Want-Content-Digest';
  MHD_HTTP_HEADER_WANT_REPR_DIGEST = 'Want-Repr-Digest';
  MHD_HTTP_HEADER_X_CONTENT_TYPE_OPTIONS = 'X-Content-Type-Options';
  MHD_HTTP_HEADER_X_FRAME_OPTIONS = 'X-Frame-Options';
  MHD_HTTP_HEADER_AMP_CACHE_TRANSFORM = 'AMP-Cache-Transform';
  MHD_HTTP_HEADER_CONFIGURATION_CONTEXT = 'Configuration-Context';
  MHD_HTTP_HEADER_EDIINT_FEATURES = 'EDIINT-Features';
  MHD_HTTP_HEADER_ISOLATION = 'Isolation';
  MHD_HTTP_HEADER_PERMISSIONS_POLICY = 'Permissions-Policy';
  MHD_HTTP_HEADER_REPEATABILITY_CLIENT_ID = 'Repeatability-Client-ID';
  MHD_HTTP_HEADER_REPEATABILITY_FIRST_SENT = 'Repeatability-First-Sent';
  MHD_HTTP_HEADER_REPEATABILITY_REQUEST_ID = 'Repeatability-Request-ID';
  MHD_HTTP_HEADER_REPEATABILITY_RESULT = 'Repeatability-Result';
  MHD_HTTP_HEADER_REPORTING_ENDPOINTS = 'Reporting-Endpoints';
  MHD_HTTP_HEADER_SEC_GPC = 'Sec-GPC';
  MHD_HTTP_HEADER_TIMING_ALLOW_ORIGIN = 'Timing-Allow-Origin';
  MHD_HTTP_HEADER_C_PEP_INFO = 'C-PEP-Info';
  MHD_HTTP_HEADER_PROTOCOL_INFO = 'Protocol-Info';
  MHD_HTTP_HEADER_PROTOCOL_QUERY = 'Protocol-Query';
  MHD_HTTP_HEADER_ACCESS_CONTROL = 'Access-Control';
  MHD_HTTP_HEADER_C_EXT = 'C-Ext';
  MHD_HTTP_HEADER_C_MAN = 'C-Man';
  MHD_HTTP_HEADER_C_OPT = 'C-Opt';
  MHD_HTTP_HEADER_C_PEP = 'C-PEP';
  MHD_HTTP_HEADER_CONTENT_BASE = 'Content-Base';
  MHD_HTTP_HEADER_CONTENT_MD5 = 'Content-MD5';
  MHD_HTTP_HEADER_CONTENT_SCRIPT_TYPE = 'Content-Script-Type';
  MHD_HTTP_HEADER_CONTENT_STYLE_TYPE = 'Content-Style-Type';
  MHD_HTTP_HEADER_CONTENT_VERSION = 'Content-Version';
  MHD_HTTP_HEADER_COOKIE2 = 'Cookie2';
  MHD_HTTP_HEADER_DEFAULT_STYLE = 'Default-Style';
  MHD_HTTP_HEADER_DERIVED_FROM = 'Derived-From';
  MHD_HTTP_HEADER_DIGEST = 'Digest';
  MHD_HTTP_HEADER_EXT = 'Ext';
  MHD_HTTP_HEADER_GETPROFILE = 'GetProfile';
  MHD_HTTP_HEADER_HTTP2_SETTINGS = 'HTTP2-Settings';
  MHD_HTTP_HEADER_MAN = 'Man';
  MHD_HTTP_HEADER_METHOD_CHECK = 'Method-Check';
  MHD_HTTP_HEADER_METHOD_CHECK_EXPIRES = 'Method-Check-Expires';
  MHD_HTTP_HEADER_OPT = 'Opt';
  MHD_HTTP_HEADER_P3P = 'P3P';
  MHD_HTTP_HEADER_PEP = 'PEP';
  MHD_HTTP_HEADER_PEP_INFO = 'Pep-Info';
  MHD_HTTP_HEADER_PICS_LABEL = 'PICS-Label';
  MHD_HTTP_HEADER_PROFILEOBJECT = 'ProfileObject';
  MHD_HTTP_HEADER_PROTOCOL = 'Protocol';
  MHD_HTTP_HEADER_PROTOCOL_REQUEST = 'Protocol-Request';
  MHD_HTTP_HEADER_PROXY_FEATURES = 'Proxy-Features';
  MHD_HTTP_HEADER_PROXY_INSTRUCTION = 'Proxy-Instruction';
  MHD_HTTP_HEADER_PUBLIC = 'Public';
  MHD_HTTP_HEADER_REFERER_ROOT = 'Referer-Root';
  MHD_HTTP_HEADER_SAFE = 'Safe';
  MHD_HTTP_HEADER_SECURITY_SCHEME = 'Security-Scheme';
  MHD_HTTP_HEADER_SET_COOKIE2 = 'Set-Cookie2';
  MHD_HTTP_HEADER_SETPROFILE = 'SetProfile';
  MHD_HTTP_HEADER_URI = 'URI';
  MHD_HTTP_HEADER_WANT_DIGEST = 'Want-Digest';
  MHD_HTTP_HEADER_WARNING = 'Warning';
  MHD_HTTP_HEADER_COMPLIANCE = 'Compliance';
  MHD_HTTP_HEADER_CONTENT_TRANSFER_ENCODING = 'Content-Transfer-Encoding';
  MHD_HTTP_HEADER_COST = 'Cost';
  MHD_HTTP_HEADER_MESSAGE_ID = 'Message-ID';
  MHD_HTTP_HEADER_NON_COMPLIANCE = 'Non-Compliance';
  MHD_HTTP_HEADER_OPTIONAL = 'Optional';
  MHD_HTTP_HEADER_RESOLUTION_HINT = 'Resolution-Hint';
  MHD_HTTP_HEADER_RESOLVER_LOCATION = 'Resolver-Location';
  MHD_HTTP_HEADER_SUBOK = 'SubOK';
  MHD_HTTP_HEADER_SUBST = 'Subst';
  MHD_HTTP_HEADER_TITLE = 'Title';
  MHD_HTTP_HEADER_UA_COLOR = 'UA-Color';
  MHD_HTTP_HEADER_UA_MEDIA = 'UA-Media';
  MHD_HTTP_HEADER_UA_PIXELS = 'UA-Pixels';
  MHD_HTTP_HEADER_UA_RESOLUTION = 'UA-Resolution';
  MHD_HTTP_HEADER_UA_WINDOWPIXELS = 'UA-Windowpixels';
  MHD_HTTP_HEADER_VERSION = 'Version';
  MHD_HTTP_HEADER_X_DEVICE_ACCEPT = 'X-Device-Accept';
  MHD_HTTP_HEADER_X_DEVICE_ACCEPT_CHARSET = 'X-Device-Accept-Charset';
  MHD_HTTP_HEADER_X_DEVICE_ACCEPT_ENCODING = 'X-Device-Accept-Encoding';
  MHD_HTTP_HEADER_X_DEVICE_ACCEPT_LANGUAGE = 'X-Device-Accept-Language';
  MHD_HTTP_HEADER_X_DEVICE_USER_AGENT = 'X-Device-User-Agent';
  MHD_HTTP_VERSION_1_0 = 'HTTP/1.0';
  MHD_HTTP_VERSION_1_1 = 'HTTP/1.1';
  MHD_HTTP_METHOD_GET = 'GET';
  MHD_HTTP_METHOD_HEAD = 'HEAD';
  MHD_HTTP_METHOD_POST = 'POST';
  MHD_HTTP_METHOD_PUT = 'PUT';
  MHD_HTTP_METHOD_DELETE = 'DELETE';
  MHD_HTTP_METHOD_CONNECT = 'CONNECT';
  MHD_HTTP_METHOD_OPTIONS = 'OPTIONS';
  MHD_HTTP_METHOD_TRACE = 'TRACE';
  MHD_HTTP_METHOD_ACL = 'ACL';
  MHD_HTTP_METHOD_BASELINE_CONTROL = 'BASELINE-CONTROL';
  MHD_HTTP_METHOD_BIND = 'BIND';
  MHD_HTTP_METHOD_CHECKIN = 'CHECKIN';
  MHD_HTTP_METHOD_CHECKOUT = 'CHECKOUT';
  MHD_HTTP_METHOD_COPY = 'COPY';
  MHD_HTTP_METHOD_LABEL = 'LABEL';
  MHD_HTTP_METHOD_LINK = 'LINK';
  MHD_HTTP_METHOD_LOCK = 'LOCK';
  MHD_HTTP_METHOD_MERGE = 'MERGE';
  MHD_HTTP_METHOD_MKACTIVITY = 'MKACTIVITY';
  MHD_HTTP_METHOD_MKCALENDAR = 'MKCALENDAR';
  MHD_HTTP_METHOD_MKCOL = 'MKCOL';
  MHD_HTTP_METHOD_MKREDIRECTREF = 'MKREDIRECTREF';
  MHD_HTTP_METHOD_MKWORKSPACE = 'MKWORKSPACE';
  MHD_HTTP_METHOD_MOVE = 'MOVE';
  MHD_HTTP_METHOD_ORDERPATCH = 'ORDERPATCH';
  MHD_HTTP_METHOD_PATCH = 'PATCH';
  MHD_HTTP_METHOD_PRI = 'PRI';
  MHD_HTTP_METHOD_PROPFIND = 'PROPFIND';
  MHD_HTTP_METHOD_PROPPATCH = 'PROPPATCH';
  MHD_HTTP_METHOD_REBIND = 'REBIND';
  MHD_HTTP_METHOD_REPORT = 'REPORT';
  MHD_HTTP_METHOD_SEARCH = 'SEARCH';
  MHD_HTTP_METHOD_UNBIND = 'UNBIND';
  MHD_HTTP_METHOD_UNCHECKOUT = 'UNCHECKOUT';
  MHD_HTTP_METHOD_UNLINK = 'UNLINK';
  MHD_HTTP_METHOD_UNLOCK = 'UNLOCK';
  MHD_HTTP_METHOD_UPDATE = 'UPDATE';
  MHD_HTTP_METHOD_UPDATEREDIRECTREF = 'UPDATEREDIRECTREF';
  MHD_HTTP_METHOD_VERSION_CONTROL = 'VERSION-CONTROL';
  MHD_HTTP_METHOD_ASTERISK = '*';
  MHD_HTTP_POST_ENCODING_FORM_URLENCODED = 'application/x-www-form-urlencoded';
  MHD_HTTP_POST_ENCODING_MULTIPART_FORMDATA = 'multipart/form-data';

type
  PMHD_Daemon = ^TMHD_Daemon;
  TMHD_Daemon = record
  end;

  PMHD_Connection = ^TMHD_Connection;
  TMHD_Connection = record
  end;

  PMHD_Response = ^TMHD_Response;
  TMHD_Response = record
  end;

  PMHD_PostProcessor = ^TMHD_PostProcessor;
  TMHD_PostProcessor = record
  end;

  TMHD_FLAG = longint;

const
  MHD_NO_FLAG = 0;
  MHD_USE_ERROR_LOG = 1;
  MHD_USE_DEBUG = 1;
  MHD_USE_TLS = 2;
  MHD_USE_SSL = 2;
  MHD_USE_THREAD_PER_CONNECTION = 4;
  MHD_USE_INTERNAL_POLLING_THREAD = 8;
  MHD_USE_SELECT_INTERNALLY = 8;
  MHD_USE_IPv6 = 16;
  MHD_USE_PEDANTIC_CHECKS = 32;
  MHD_USE_POLL = 64;
  MHD_USE_POLL_INTERNAL_THREAD = MHD_USE_POLL or MHD_USE_INTERNAL_POLLING_THREAD;
  MHD_USE_POLL_INTERNALLY = MHD_USE_POLL or MHD_USE_INTERNAL_POLLING_THREAD;
  MHD_USE_SUPPRESS_DATE_NO_CLOCK = 128;
  MHD_SUPPRESS_DATE_NO_CLOCK = 128;
  MHD_USE_NO_LISTEN_SOCKET = 256;
  MHD_USE_EPOLL = 512;
  MHD_USE_EPOLL_LINUX_ONLY = 512;
  MHD_USE_EPOLL_INTERNAL_THREAD = MHD_USE_EPOLL or MHD_USE_INTERNAL_POLLING_THREAD;
  MHD_USE_EPOLL_INTERNALLY = MHD_USE_EPOLL or MHD_USE_INTERNAL_POLLING_THREAD;
  MHD_USE_EPOLL_INTERNALLY_LINUX_ONLY = MHD_USE_EPOLL or MHD_USE_INTERNAL_POLLING_THREAD;
  MHD_USE_ITC = 1024;
  MHD_USE_PIPE_FOR_SHUTDOWN = 1024;
  MHD_USE_DUAL_STACK = MHD_USE_IPv6 or 2048;
  MHD_USE_TURBO = 4096;
  MHD_USE_EPOLL_TURBO = 4096;
  MHD_ALLOW_SUSPEND_RESUME = 8192 or MHD_USE_ITC;
  MHD_USE_SUSPEND_RESUME = 8192 or MHD_USE_ITC;
  MHD_USE_TCP_FASTOPEN = 16384;
  MHD_ALLOW_UPGRADE = 32768;
  MHD_USE_AUTO = 65536;
  MHD_USE_AUTO_INTERNAL_THREAD = MHD_USE_AUTO or MHD_USE_INTERNAL_POLLING_THREAD;
  MHD_USE_POST_HANDSHAKE_AUTH_SUPPORT = 1 shl 17;
  MHD_USE_INSECURE_TLS_EARLY_DATA = 1 shl 18;
  MHD_USE_NO_THREAD_SAFETY = 1 shl 19;

type
  TMHD_LogCallback = procedure(cls: pointer; fm: pchar; ap: Tva_list); cdecl;
  TMHD_PskServerCredentialsCallback = function(cls: pointer; connection: PMHD_Connection; username: pchar; psk: Ppointer; psk_size: Psize_t): longint; cdecl;
  TMHD_DAuthBindNonce = longint;

const
  MHD_DAUTH_BIND_NONCE_NONE = 0;
  MHD_DAUTH_BIND_NONCE_REALM = 1 shl 0;
  MHD_DAUTH_BIND_NONCE_URI = 1 shl 1;
  MHD_DAUTH_BIND_NONCE_URI_PARAMS = 1 shl 2;
  MHD_DAUTH_BIND_NONCE_CLIENT_IP = 1 shl 3;

type
  TMHD_OPTION = longint;

const
  MHD_OPTION_END = 0;
  MHD_OPTION_CONNECTION_MEMORY_LIMIT = 1;
  MHD_OPTION_CONNECTION_LIMIT = 2;
  MHD_OPTION_CONNECTION_TIMEOUT = 3;
  MHD_OPTION_NOTIFY_COMPLETED = 4;
  MHD_OPTION_PER_IP_CONNECTION_LIMIT = 5;
  MHD_OPTION_SOCK_ADDR = 6;
  MHD_OPTION_URI_LOG_CALLBACK = 7;
  MHD_OPTION_HTTPS_MEM_KEY = 8;
  MHD_OPTION_HTTPS_MEM_CERT = 9;
  MHD_OPTION_HTTPS_CRED_TYPE = 10;
  MHD_OPTION_HTTPS_PRIORITIES = 11;
  MHD_OPTION_LISTEN_SOCKET = 12;
  MHD_OPTION_EXTERNAL_LOGGER = 13;
  MHD_OPTION_THREAD_POOL_SIZE = 14;
  MHD_OPTION_ARRAY = 15;
  MHD_OPTION_UNESCAPE_CALLBACK = 16;
  MHD_OPTION_DIGEST_AUTH_RANDOM = 17;
  MHD_OPTION_NONCE_NC_SIZE = 18;
  MHD_OPTION_THREAD_STACK_SIZE = 19;
  MHD_OPTION_HTTPS_MEM_TRUST = 20;
  MHD_OPTION_CONNECTION_MEMORY_INCREMENT = 21;
  MHD_OPTION_HTTPS_CERT_CALLBACK = 22;
  MHD_OPTION_TCP_FASTOPEN_QUEUE_SIZE = 23;
  MHD_OPTION_HTTPS_MEM_DHPARAMS = 24;
  MHD_OPTION_LISTENING_ADDRESS_REUSE = 25;
  MHD_OPTION_HTTPS_KEY_PASSWORD = 26;
  MHD_OPTION_NOTIFY_CONNECTION = 27;
  MHD_OPTION_LISTEN_BACKLOG_SIZE = 28;
  MHD_OPTION_STRICT_FOR_CLIENT = 29;
  MHD_OPTION_GNUTLS_PSK_CRED_HANDLER = 30;
  MHD_OPTION_HTTPS_CERT_CALLBACK2 = 31;
  MHD_OPTION_SERVER_INSANITY = 32;
  MHD_OPTION_SIGPIPE_HANDLED_BY_APP = 33;
  MHD_OPTION_TLS_NO_ALPN = 34;
  MHD_OPTION_DIGEST_AUTH_RANDOM_COPY = 35;
  MHD_OPTION_DIGEST_AUTH_NONCE_BIND_TYPE = 36;
  MHD_OPTION_HTTPS_PRIORITIES_APPEND = 37;
  MHD_OPTION_CLIENT_DISCIPLINE_LVL = 38;
  MHD_OPTION_APP_FD_SETSIZE = 39;
  MHD_OPTION_SOCK_ADDR_LEN = 40;
  MHD_OPTION_DIGEST_AUTH_DEFAULT_NONCE_TIMEOUT = 41;
  MHD_OPTION_DIGEST_AUTH_DEFAULT_MAX_NC = 42;

type
  TMHD_DisableSanityCheck = longint;

const
  MHD_DSC_SANE = 0;

type
  PMHD_OptionItem = ^TMHD_OptionItem;

  TMHD_OptionItem = record
    option: TMHD_OPTION;
    Value: Tintptr_t;
    ptr_value: pointer;
  end;

  TMHD_ValueKind = longint;

const
  MHD_RESPONSE_HEADER_KIND = 0;
  MHD_HEADER_KIND = 1;
  MHD_COOKIE_KIND = 2;
  MHD_POSTDATA_KIND = 4;
  MHD_GET_ARGUMENT_KIND = 8;
  MHD_FOOTER_KIND = 16;

type
  TMHD_RequestTerminationCode = longint;

const
  MHD_REQUEST_TERMINATED_COMPLETED_OK = 0;
  MHD_REQUEST_TERMINATED_WITH_ERROR = 1;
  MHD_REQUEST_TERMINATED_TIMEOUT_REACHED = 2;
  MHD_REQUEST_TERMINATED_DAEMON_SHUTDOWN = 3;
  MHD_REQUEST_TERMINATED_READ_ERROR = 4;
  MHD_REQUEST_TERMINATED_CLIENT_ABORT = 5;

type
  TMHD_ConnectionNotificationCode = longint;

const
  MHD_CONNECTION_NOTIFY_STARTED = 0;
  MHD_CONNECTION_NOTIFY_CLOSED = 1;

type
  PMHD_ConnectionInfo = ^TMHD_ConnectionInfo;
  TMHD_ConnectionInfo = record
    case longint of
      0: (cipher_algorithm: longint);
      1: (protocol: longint);
      2: (suspended: longint);
      3: (connection_timeout: dword);
      4: (http_status: dword);
      5: (connect_fd: TMHD_socket);
      6: (header_size: Tsize_t);
      7: (tls_session: pointer);
      8: (client_cert: pointer);
      9: (client_addr: Psockaddr);
      10: (daemon: PMHD_Daemon);
      11: (socket_context: pointer);
  end;

  PMHD_IoVec = ^TMHD_IoVec;

  TMHD_IoVec = record
    iov_base: pointer;
    iov_len: Tsize_t;
  end;

  TMHD_ConnectionInfoType = longint;

const
  MHD_CONNECTION_INFO_CIPHER_ALGO = 0;
  MHD_CONNECTION_INFO_PROTOCOL = 1;
  MHD_CONNECTION_INFO_CLIENT_ADDRESS = 2;
  MHD_CONNECTION_INFO_GNUTLS_SESSION = 3;
  MHD_CONNECTION_INFO_GNUTLS_CLIENT_CERT = 4;
  MHD_CONNECTION_INFO_DAEMON = 5;
  MHD_CONNECTION_INFO_CONNECTION_FD = 6;
  MHD_CONNECTION_INFO_SOCKET_CONTEXT = 7;
  MHD_CONNECTION_INFO_CONNECTION_SUSPENDED = 8;
  MHD_CONNECTION_INFO_CONNECTION_TIMEOUT = 9;
  MHD_CONNECTION_INFO_REQUEST_HEADER_SIZE = 10;
  MHD_CONNECTION_INFO_HTTP_STATUS = 11;

type
  TMHD_DaemonInfoType = longint;

const
  MHD_DAEMON_INFO_KEY_SIZE = 0;
  MHD_DAEMON_INFO_MAC_KEY_SIZE = 1;
  MHD_DAEMON_INFO_LISTEN_FD = 2;
  MHD_DAEMON_INFO_EPOLL_FD_LINUX_ONLY = 3;
  MHD_DAEMON_INFO_EPOLL_FD = MHD_DAEMON_INFO_EPOLL_FD_LINUX_ONLY;
  MHD_DAEMON_INFO_CURRENT_CONNECTIONS = (MHD_DAEMON_INFO_EPOLL_FD_LINUX_ONLY) + 1;
  MHD_DAEMON_INFO_FLAGS = (MHD_DAEMON_INFO_EPOLL_FD_LINUX_ONLY) + 2;
  MHD_DAEMON_INFO_BIND_PORT = (MHD_DAEMON_INFO_EPOLL_FD_LINUX_ONLY) + 3;

type
  TMHD_PanicCallback = procedure(cls: pointer; file_: pchar; line: dword; reason: pchar); cdecl;
  TMHD_AcceptPolicyCallback = function(cls: pointer; addr: Psockaddr; addrlen: Tsocklen_t): TMHD_Result; cdecl;
  TMHD_AccessHandlerCallback = function(cls: pointer; connection: PMHD_Connection; url: pchar; method: pchar; version: pchar; upload_data: pchar; upload_data_size: Psize_t; req_cls: Ppointer): TMHD_Result; cdecl;
  TMHD_RequestCompletedCallback = procedure(cls: pointer; connection: PMHD_Connection; req_cls: Ppointer; toe: TMHD_RequestTerminationCode); cdecl;
  TMHD_NotifyConnectionCallback = procedure(cls: pointer; connection: PMHD_Connection; socket_context: Ppointer; toe: TMHD_ConnectionNotificationCode); cdecl;
  TMHD_KeyValueIterator = function(cls: pointer; kind: TMHD_ValueKind; key: pchar; Value: pchar): TMHD_Result; cdecl;
  TMHD_KeyValueIteratorN = function(cls: pointer; kind: TMHD_ValueKind; key: pchar; key_size: Tsize_t; Value: pchar; value_size: Tsize_t): TMHD_Result; cdecl;
  TMHD_ContentReaderCallback = function(cls: pointer; pos: Tuint64_t; buf: pchar; max: Tsize_t): Tssize_t; cdecl;
  TMHD_ContentReaderFreeCallback = procedure(cls: pointer); cdecl;
  TMHD_PostDataIterator = function(cls: pointer; kind: TMHD_ValueKind; key: pchar; filename: pchar; content_type: pchar; transfer_encoding: pchar; Data: pchar; off: Tuint64_t; size: Tsize_t): TMHD_Result; cdecl;

function MHD_start_daemon_va(flags: dword; port: Tuint16_t; apc: TMHD_AcceptPolicyCallback; apc_cls: pointer; dh: TMHD_AccessHandlerCallback;
  dh_cls: pointer; ap: Tva_list): PMHD_Daemon; cdecl; external libmicrohttpd;
function MHD_start_daemon(flags: dword; port: Tuint16_t; apc: TMHD_AcceptPolicyCallback; apc_cls: pointer; dh: TMHD_AccessHandlerCallback;
  dh_cls: pointer): PMHD_Daemon; cdecl; varargs; external libmicrohttpd;
function MHD_quiesce_daemon(daemon: PMHD_Daemon): TMHD_socket; cdecl; external libmicrohttpd;
procedure MHD_stop_daemon(daemon: PMHD_Daemon); cdecl; external libmicrohttpd;
function MHD_add_connection(daemon: PMHD_Daemon; client_socket: TMHD_socket; addr: Psockaddr; addrlen: Tsocklen_t): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_get_fdset(daemon: PMHD_Daemon; read_fd_set: Pfd_set; write_fd_set: Pfd_set; except_fd_set: Pfd_set; max_fd: PMHD_socket): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_get_fdset2(daemon: PMHD_Daemon; read_fd_set: Pfd_set; write_fd_set: Pfd_set; except_fd_set: Pfd_set; max_fd: PMHD_socket;
  fd_setsize: dword): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_get_timeout(daemon: PMHD_Daemon; timeout: PMHD_UNSIGNED_LONG_LONG): TMHD_Result; cdecl; external libmicrohttpd;
procedure MHD_free(ptr: pointer); cdecl; external libmicrohttpd;
function MHD_get_timeout64(daemon: PMHD_Daemon; timeout: Puint64_t): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_get_timeout64s(daemon: PMHD_Daemon): Tint64_t; cdecl; external libmicrohttpd;
function MHD_get_timeout_i(daemon: PMHD_Daemon): longint; cdecl; external libmicrohttpd;
function MHD_run(daemon: PMHD_Daemon): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_run_wait(daemon: PMHD_Daemon; millisec: Tint32_t): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_run_from_select(daemon: PMHD_Daemon; read_fd_set: Pfd_set; write_fd_set: Pfd_set; except_fd_set: Pfd_set): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_run_from_select2(daemon: PMHD_Daemon; read_fd_set: Pfd_set; write_fd_set: Pfd_set; except_fd_set: Pfd_set; fd_setsize: dword): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_get_connection_values(connection: PMHD_Connection; kind: TMHD_ValueKind; iterator: TMHD_KeyValueIterator; iterator_cls: pointer): longint; cdecl; external libmicrohttpd;
function MHD_get_connection_values_n(connection: PMHD_Connection; kind: TMHD_ValueKind; iterator: TMHD_KeyValueIteratorN; iterator_cls: pointer): longint; cdecl; external libmicrohttpd;
function MHD_set_connection_value(connection: PMHD_Connection; kind: TMHD_ValueKind; key: pchar; Value: pchar): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_set_connection_value_n(connection: PMHD_Connection; kind: TMHD_ValueKind; key: pchar; key_size: Tsize_t; Value: pchar;
  value_size: Tsize_t): TMHD_Result; cdecl; external libmicrohttpd;
procedure MHD_set_panic_func(cb: TMHD_PanicCallback; cls: pointer); cdecl; external libmicrohttpd;
function MHD_http_unescape(val: pchar): Tsize_t; cdecl; external libmicrohttpd;
function MHD_lookup_connection_value(connection: PMHD_Connection; kind: TMHD_ValueKind; key: pchar): pchar; cdecl; external libmicrohttpd;
function MHD_lookup_connection_value_n(connection: PMHD_Connection; kind: TMHD_ValueKind; key: pchar; key_size: Tsize_t; value_ptr: PPchar;
  value_size_ptr: Psize_t): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_queue_response(connection: PMHD_Connection; status_code: dword; response: PMHD_Response): TMHD_Result; cdecl; external libmicrohttpd;
procedure MHD_suspend_connection(connection: PMHD_Connection); cdecl; external libmicrohttpd;
procedure MHD_resume_connection(connection: PMHD_Connection); cdecl; external libmicrohttpd;

type
  TMHD_ResponseFlags = longint;

const
  MHD_RF_NONE = 0;
  MHD_RF_HTTP_1_0_COMPATIBLE_STRICT = 1 shl 0;
  MHD_RF_HTTP_VERSION_1_0_ONLY = 1 shl 0;
  MHD_RF_HTTP_1_0_SERVER = 1 shl 1;
  MHD_RF_HTTP_VERSION_1_0_RESPONSE = 1 shl 1;
  MHD_RF_INSANITY_HEADER_CONTENT_LENGTH = 1 shl 2;
  MHD_RF_SEND_KEEP_ALIVE_HEADER = 1 shl 3;
  MHD_RF_HEAD_ONLY_RESPONSE = 1 shl 4;

type
  TMHD_ResponseOptions = longint;

const
  MHD_RO_END = 0;

function MHD_set_response_options(response: PMHD_Response; flags: TMHD_ResponseFlags): TMHD_Result; cdecl; varargs; external libmicrohttpd;
function MHD_create_response_from_callback(size: Tuint64_t; block_size: Tsize_t; crc: TMHD_ContentReaderCallback; crc_cls: pointer; crfc: TMHD_ContentReaderFreeCallback): PMHD_Response; cdecl; external libmicrohttpd;
function MHD_create_response_from_data(size: Tsize_t; Data: pointer; must_free: longint; must_copy: longint): PMHD_Response; cdecl; external libmicrohttpd;

type
  TMHD_ResponseMemoryMode = longint;

const
  MHD_RESPMEM_PERSISTENT = 0;
  MHD_RESPMEM_MUST_FREE = 1;
  MHD_RESPMEM_MUST_COPY = 2;

function MHD_create_response_from_buffer(size: Tsize_t; buffer: pointer; mode: TMHD_ResponseMemoryMode): PMHD_Response; cdecl; external libmicrohttpd;
function MHD_create_response_from_buffer_static(size: Tsize_t; buffer: pointer): PMHD_Response; cdecl; external libmicrohttpd;
function MHD_create_response_from_buffer_copy(size: Tsize_t; buffer: pointer): PMHD_Response; cdecl; external libmicrohttpd;
function MHD_create_response_from_buffer_with_free_callback(size: Tsize_t; buffer: pointer; crfc: TMHD_ContentReaderFreeCallback): PMHD_Response; cdecl; external libmicrohttpd;
function MHD_create_response_from_buffer_with_free_callback_cls(size: Tsize_t; buffer: pointer; crfc: TMHD_ContentReaderFreeCallback; crfc_cls: pointer): PMHD_Response; cdecl; external libmicrohttpd;
function MHD_create_response_from_fd(size: Tsize_t; fd: longint): PMHD_Response; cdecl; external libmicrohttpd;
function MHD_create_response_from_pipe(fd: longint): PMHD_Response; cdecl; external libmicrohttpd;
function MHD_create_response_from_fd64(size: Tuint64_t; fd: longint): PMHD_Response; cdecl; external libmicrohttpd;
function MHD_create_response_from_fd_at_offset(size: Tsize_t; fd: longint; offset: Toff_t): PMHD_Response; cdecl; external libmicrohttpd;
function MHD_create_response_from_fd_at_offset64(size: Tuint64_t; fd: longint; offset: Tuint64_t): PMHD_Response; cdecl; external libmicrohttpd;
function MHD_create_response_from_iovec(iov: PMHD_IoVec; iovcnt: dword; free_cb: TMHD_ContentReaderFreeCallback; cls: pointer): PMHD_Response; cdecl; external libmicrohttpd;
function MHD_create_response_empty(flags: TMHD_ResponseFlags): PMHD_Response; cdecl; external libmicrohttpd;

type
  TMHD_UpgradeAction = longint;

const
  MHD_UPGRADE_ACTION_CLOSE = 0;
  MHD_UPGRADE_ACTION_CORK_ON = 1;
  MHD_UPGRADE_ACTION_CORK_OFF = 2;

type
  PMHD_UpgradeResponseHandle = ^TMHD_UpgradeResponseHandle;
  TMHD_UpgradeResponseHandle = record
  end;

function MHD_upgrade_action(urh: PMHD_UpgradeResponseHandle; action: TMHD_UpgradeAction): TMHD_Result; cdecl; varargs; external libmicrohttpd;

type
  TMHD_UpgradeHandler = procedure(cls: pointer; connection: PMHD_Connection; req_cls: pointer; extra_in: pchar; extra_in_size: Tsize_t; sock: TMHD_socket; urh: PMHD_UpgradeResponseHandle); cdecl;

function MHD_create_response_for_upgrade(upgrade_handler: TMHD_UpgradeHandler; upgrade_handler_cls: pointer): PMHD_Response; cdecl; external libmicrohttpd;
procedure MHD_destroy_response(response: PMHD_Response); cdecl; external libmicrohttpd;
function MHD_add_response_header(response: PMHD_Response; header: pchar; content: pchar): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_add_response_footer(response: PMHD_Response; footer: pchar; content: pchar): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_del_response_header(response: PMHD_Response; header: pchar; content: pchar): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_get_response_headers(response: PMHD_Response; iterator: TMHD_KeyValueIterator; iterator_cls: pointer): longint; cdecl; external libmicrohttpd;
function MHD_get_response_header(response: PMHD_Response; key: pchar): pchar; cdecl; external libmicrohttpd;
function MHD_create_post_processor(connection: PMHD_Connection; buffer_size: Tsize_t; iter: TMHD_PostDataIterator; iter_cls: pointer): PMHD_PostProcessor; cdecl; external libmicrohttpd;
function MHD_post_process(pp: PMHD_PostProcessor; post_data: pchar; post_data_len: Tsize_t): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_destroy_post_processor(pp: PMHD_PostProcessor): TMHD_Result; cdecl; external libmicrohttpd;

const
  MHD_MD5_DIGEST_SIZE = 16;
  MHD_SHA256_DIGEST_SIZE = 32;
  MHD_SHA512_256_DIGEST_SIZE = 32;

type
  TMHD_DigestBaseAlgo = longint;

const
  MHD_DIGEST_BASE_ALGO_INVALID = 0;
  MHD_DIGEST_BASE_ALGO_MD5 = 1 shl 0;
  MHD_DIGEST_BASE_ALGO_SHA256 = 1 shl 1;
  MHD_DIGEST_BASE_ALGO_SHA512_256 = 1 shl 2;

const
  MHD_DIGEST_AUTH_ALGO3_NON_SESSION = 1 shl 6;
  MHD_DIGEST_AUTH_ALGO3_SESSION = 1 shl 7;

type
  TMHD_DigestAuthAlgo3 = longint;

const
  MHD_DIGEST_AUTH_ALGO3_INVALID = 0;
  MHD_DIGEST_AUTH_ALGO3_MD5 = MHD_DIGEST_BASE_ALGO_MD5 or MHD_DIGEST_AUTH_ALGO3_NON_SESSION;
  MHD_DIGEST_AUTH_ALGO3_MD5_SESSION = MHD_DIGEST_BASE_ALGO_MD5 or MHD_DIGEST_AUTH_ALGO3_SESSION;
  MHD_DIGEST_AUTH_ALGO3_SHA256 = MHD_DIGEST_BASE_ALGO_SHA256 or MHD_DIGEST_AUTH_ALGO3_NON_SESSION;
  MHD_DIGEST_AUTH_ALGO3_SHA256_SESSION = MHD_DIGEST_BASE_ALGO_SHA256 or MHD_DIGEST_AUTH_ALGO3_SESSION;
  MHD_DIGEST_AUTH_ALGO3_SHA512_256 = MHD_DIGEST_BASE_ALGO_SHA512_256 or MHD_DIGEST_AUTH_ALGO3_NON_SESSION;
  MHD_DIGEST_AUTH_ALGO3_SHA512_256_SESSION = MHD_DIGEST_BASE_ALGO_SHA512_256 or MHD_DIGEST_AUTH_ALGO3_SESSION;

function MHD_digest_get_hash_size(algo3: TMHD_DigestAuthAlgo3): Tsize_t; cdecl; external libmicrohttpd;

type
  TMHD_DigestAuthMultiAlgo3 = longint;

const
  MHD_DIGEST_AUTH_MULT_ALGO3_INVALID = MHD_DIGEST_AUTH_ALGO3_INVALID;
  MHD_DIGEST_AUTH_MULT_ALGO3_MD5 = MHD_DIGEST_AUTH_ALGO3_MD5;
  MHD_DIGEST_AUTH_MULT_ALGO3_MD5_SESSION = MHD_DIGEST_AUTH_ALGO3_MD5_SESSION;
  MHD_DIGEST_AUTH_MULT_ALGO3_SHA256 = MHD_DIGEST_AUTH_ALGO3_SHA256;
  MHD_DIGEST_AUTH_MULT_ALGO3_SHA256_SESSION = MHD_DIGEST_AUTH_ALGO3_SHA256_SESSION;
  MHD_DIGEST_AUTH_MULT_ALGO3_SHA512_256 = MHD_DIGEST_AUTH_ALGO3_SHA512_256;
  MHD_DIGEST_AUTH_MULT_ALGO3_SHA512_256_SESSION = MHD_DIGEST_AUTH_ALGO3_SHA512_256_SESSION;
  MHD_DIGEST_AUTH_MULT_ALGO3_SHA_ANY_NON_SESSION = MHD_DIGEST_AUTH_ALGO3_SHA256 or MHD_DIGEST_AUTH_ALGO3_SHA512_256;
  MHD_DIGEST_AUTH_MULT_ALGO3_ANY_NON_SESSION = $3F or MHD_DIGEST_AUTH_ALGO3_NON_SESSION;
  MHD_DIGEST_AUTH_MULT_ALGO3_SHA_ANY_SESSION = MHD_DIGEST_AUTH_ALGO3_SHA256_SESSION or MHD_DIGEST_AUTH_ALGO3_SHA512_256_SESSION;
  MHD_DIGEST_AUTH_MULT_ALGO3_ANY_SESSION = $3F or MHD_DIGEST_AUTH_ALGO3_SESSION;
  MHD_DIGEST_AUTH_MULT_ALGO3_MD5_ANY = MHD_DIGEST_AUTH_MULT_ALGO3_MD5 or MHD_DIGEST_AUTH_MULT_ALGO3_MD5_SESSION;
  MHD_DIGEST_AUTH_MULT_ALGO3_SHA256_ANY = MHD_DIGEST_AUTH_MULT_ALGO3_SHA256 or MHD_DIGEST_AUTH_MULT_ALGO3_SHA256_SESSION;
  MHD_DIGEST_AUTH_MULT_ALGO3_SHA512_256_ANY = MHD_DIGEST_AUTH_MULT_ALGO3_SHA512_256 or MHD_DIGEST_AUTH_MULT_ALGO3_SHA512_256_SESSION;
  MHD_DIGEST_AUTH_MULT_ALGO3_SHA_ANY_ANY = MHD_DIGEST_AUTH_MULT_ALGO3_SHA_ANY_NON_SESSION or MHD_DIGEST_AUTH_MULT_ALGO3_SHA_ANY_SESSION;
  MHD_DIGEST_AUTH_MULT_ALGO3_ANY = ($3F or MHD_DIGEST_AUTH_ALGO3_NON_SESSION) or MHD_DIGEST_AUTH_ALGO3_SESSION;

function MHD_digest_auth_calc_userhash(algo3: TMHD_DigestAuthAlgo3; username: pchar; realm: pchar; userhash_bin: pointer; bin_buf_size: Tsize_t): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_digest_auth_calc_userhash_hex(algo3: TMHD_DigestAuthAlgo3; username: pchar; realm: pchar; userhash_hex: pchar; hex_buf_size: Tsize_t): TMHD_Result; cdecl; external libmicrohttpd;

type
  TMHD_DigestAuthUsernameType = longint;

const
  MHD_DIGEST_AUTH_UNAME_TYPE_MISSING = 0;
  MHD_DIGEST_AUTH_UNAME_TYPE_STANDARD = 1 shl 2;
  MHD_DIGEST_AUTH_UNAME_TYPE_EXTENDED = 1 shl 3;
  MHD_DIGEST_AUTH_UNAME_TYPE_USERHASH = 1 shl 1;
  MHD_DIGEST_AUTH_UNAME_TYPE_INVALID = 1 shl 0;

type
  TMHD_DigestAuthQOP = longint;

const
  MHD_DIGEST_AUTH_QOP_INVALID = 0;
  MHD_DIGEST_AUTH_QOP_NONE = 1 shl 0;
  MHD_DIGEST_AUTH_QOP_AUTH = 1 shl 1;
  MHD_DIGEST_AUTH_QOP_AUTH_INT = 1 shl 2;

type
  TMHD_DigestAuthMultiQOP = longint;

const
  MHD_DIGEST_AUTH_MULT_QOP_INVALID = MHD_DIGEST_AUTH_QOP_INVALID;
  MHD_DIGEST_AUTH_MULT_QOP_NONE = MHD_DIGEST_AUTH_QOP_NONE;
  MHD_DIGEST_AUTH_MULT_QOP_AUTH = MHD_DIGEST_AUTH_QOP_AUTH;
  MHD_DIGEST_AUTH_MULT_QOP_AUTH_INT = MHD_DIGEST_AUTH_QOP_AUTH_INT;
  MHD_DIGEST_AUTH_MULT_QOP_ANY_NON_INT = MHD_DIGEST_AUTH_QOP_NONE or MHD_DIGEST_AUTH_QOP_AUTH;
  MHD_DIGEST_AUTH_MULT_QOP_AUTH_ANY = MHD_DIGEST_AUTH_QOP_AUTH or MHD_DIGEST_AUTH_QOP_AUTH_INT;

  MHD_DIGEST_AUTH_INVALID_NC_VALUE = 0;

type
  PMHD_DigestAuthInfo = ^TMHD_DigestAuthInfo;

  TMHD_DigestAuthInfo = record
    algo3: TMHD_DigestAuthAlgo3;
    uname_type: TMHD_DigestAuthUsernameType;
    username: pchar;
    username_len: Tsize_t;
    userhash_hex: pchar;
    userhash_hex_len: Tsize_t;
    userhash_bin: Puint8_t;
    opaque: pchar;
    opaque_len: Tsize_t;
    realm: pchar;
    realm_len: Tsize_t;
    qop: TMHD_DigestAuthQOP;
    cnonce_len: Tsize_t;
    nc: Tuint32_t;
  end;

function MHD_digest_auth_get_request_info3(connection: PMHD_Connection): PMHD_DigestAuthInfo; cdecl; external libmicrohttpd;

type
  PMHD_DigestAuthUsernameInfo = ^TMHD_DigestAuthUsernameInfo;

  TMHD_DigestAuthUsernameInfo = record
    algo3: TMHD_DigestAuthAlgo3;
    uname_type: TMHD_DigestAuthUsernameType;
    username: pchar;
    username_len: Tsize_t;
    userhash_hex: pchar;
    userhash_hex_len: Tsize_t;
    userhash_bin: Puint8_t;
  end;

function MHD_digest_auth_get_username3(connection: PMHD_Connection): PMHD_DigestAuthUsernameInfo; cdecl; external libmicrohttpd;

type
  TMHD_DigestAuthResult = longint;

const
  MHD_DAUTH_OK = 1;
  MHD_DAUTH_ERROR = 0;
  MHD_DAUTH_WRONG_HEADER = -(1);
  MHD_DAUTH_WRONG_USERNAME = -(2);
  MHD_DAUTH_WRONG_REALM = -(3);
  MHD_DAUTH_WRONG_URI = -(4);
  MHD_DAUTH_WRONG_QOP = -(5);
  MHD_DAUTH_WRONG_ALGO = -(6);
  MHD_DAUTH_TOO_LARGE = -(15);
  MHD_DAUTH_NONCE_STALE = -(17);
  MHD_DAUTH_NONCE_OTHER_COND = -(18);
  MHD_DAUTH_NONCE_WRONG = -(33);
  MHD_DAUTH_RESPONSE_WRONG = -(34);

function MHD_digest_auth_check3(connection: PMHD_Connection; realm: pchar; username: pchar; password: pchar; nonce_timeout: dword;
  max_nc: Tuint32_t; mqop: TMHD_DigestAuthMultiQOP; malgo3: TMHD_DigestAuthMultiAlgo3): TMHD_DigestAuthResult; cdecl; external libmicrohttpd;
function MHD_digest_auth_calc_userdigest(algo3: TMHD_DigestAuthAlgo3; username: pchar; realm: pchar; password: pchar; userdigest_bin: pointer;
  bin_buf_size: Tsize_t): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_digest_auth_check_digest3(connection: PMHD_Connection; realm: pchar; username: pchar; userdigest: pointer; userdigest_size: Tsize_t;
  nonce_timeout: dword; max_nc: Tuint32_t; mqop: TMHD_DigestAuthMultiQOP; malgo3: TMHD_DigestAuthMultiAlgo3): TMHD_DigestAuthResult; cdecl; external libmicrohttpd;
function MHD_queue_auth_required_response3(connection: PMHD_Connection; realm: pchar; opaque: pchar; domain: pchar; response: PMHD_Response;
  signal_stale: longint; mqop: TMHD_DigestAuthMultiQOP; algo: TMHD_DigestAuthMultiAlgo3; userhash_support: longint; prefer_utf8: longint): TMHD_Result; cdecl; external libmicrohttpd;

const
  MHD_INVALID_NONCE = -(1);

function MHD_digest_auth_get_username(connection: PMHD_Connection): pchar; cdecl; external libmicrohttpd;

type
  TMHD_DigestAuthAlgorithm = longint;

const
  MHD_DIGEST_ALG_AUTO = 0;
  MHD_DIGEST_ALG_MD5 = 1;
  MHD_DIGEST_ALG_SHA256 = 2;

function MHD_digest_auth_check2(connection: PMHD_Connection; realm: pchar; username: pchar; password: pchar; nonce_timeout: dword;
  algo: TMHD_DigestAuthAlgorithm): longint; cdecl; external libmicrohttpd;
function MHD_digest_auth_check(connection: PMHD_Connection; realm: pchar; username: pchar; password: pchar; nonce_timeout: dword): longint; cdecl; external libmicrohttpd;
function MHD_digest_auth_check_digest2(connection: PMHD_Connection; realm: pchar; username: pchar; digest: Puint8_t; digest_size: Tsize_t;
  nonce_timeout: dword; algo: TMHD_DigestAuthAlgorithm): longint; cdecl; external libmicrohttpd;
function MHD_digest_auth_check_digest(connection: PMHD_Connection; realm: pchar; username: pchar; digest: Tdigest_arr; nonce_timeout: dword): longint; cdecl; external libmicrohttpd;
function MHD_queue_auth_fail_response2(connection: PMHD_Connection; realm: pchar; opaque: pchar; response: PMHD_Response; signal_stale: longint;
  algo: TMHD_DigestAuthAlgorithm): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_queue_auth_fail_response(connection: PMHD_Connection; realm: pchar; opaque: pchar; response: PMHD_Response; signal_stale: longint): TMHD_Result; cdecl; external libmicrohttpd;

type
  PMHD_BasicAuthInfo = ^TMHD_BasicAuthInfo;

  TMHD_BasicAuthInfo = record
    username: pchar;
    username_len: Tsize_t;
    password: pchar;
    password_len: Tsize_t;
  end;

function MHD_basic_auth_get_username_password3(connection: PMHD_Connection): PMHD_BasicAuthInfo; cdecl; external libmicrohttpd;
function MHD_queue_basic_auth_required_response3(connection: PMHD_Connection; realm: pchar; prefer_utf8: longint; response: PMHD_Response): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_basic_auth_get_username_password(connection: PMHD_Connection; password: PPchar): pchar; cdecl; external libmicrohttpd;
function MHD_queue_basic_auth_fail_response(connection: PMHD_Connection; realm: pchar; response: PMHD_Response): TMHD_Result; cdecl; external libmicrohttpd;
function MHD_get_connection_info(connection: PMHD_Connection; info_type: TMHD_ConnectionInfoType): PMHD_ConnectionInfo; cdecl; varargs; external libmicrohttpd;

type
  TMHD_CONNECTION_OPTION = longint;

const
  MHD_CONNECTION_OPTION_TIMEOUT = 0;

function MHD_set_connection_option(connection: PMHD_Connection; option: TMHD_CONNECTION_OPTION): TMHD_Result; cdecl; varargs; external libmicrohttpd;

type
  PMHD_DaemonInfo = ^TMHD_DaemonInfo;
  TMHD_DaemonInfo = record
    case longint of
      0: (key_size: Tsize_t);
      1: (mac_key_size: Tsize_t);
      2: (listen_fd: TMHD_socket);
      3: (port: Tuint16_t);
      4: (epoll_fd: longint);
      5: (num_connections: dword);
      6: (flags: TMHD_FLAG);
  end;

function MHD_get_daemon_info(daemon: PMHD_Daemon; info_type: TMHD_DaemonInfoType): PMHD_DaemonInfo; cdecl; varargs; external libmicrohttpd;
function MHD_get_version: pchar; cdecl; external libmicrohttpd;
function MHD_get_version_bin: Tuint32_t; cdecl; external libmicrohttpd;

type
  TMHD_FEATURE = longint;

const
  MHD_FEATURE_MESSAGES = 1;
  MHD_FEATURE_TLS = 2;
  MHD_FEATURE_SSL = 2;
  MHD_FEATURE_HTTPS_CERT_CALLBACK = 3;
  MHD_FEATURE_IPv6 = 4;
  MHD_FEATURE_IPv6_ONLY = 5;
  MHD_FEATURE_POLL = 6;
  MHD_FEATURE_EPOLL = 7;
  MHD_FEATURE_SHUTDOWN_LISTEN_SOCKET = 8;
  MHD_FEATURE_SOCKETPAIR = 9;
  MHD_FEATURE_TCP_FASTOPEN = 10;
  MHD_FEATURE_BASIC_AUTH = 11;
  MHD_FEATURE_DIGEST_AUTH = 12;
  MHD_FEATURE_POSTPROCESSOR = 13;
  MHD_FEATURE_HTTPS_KEY_PASSWORD = 14;
  MHD_FEATURE_LARGE_FILE = 15;
  MHD_FEATURE_THREAD_NAMES = 16;
  MHD_THREAD_NAMES = 16;
  MHD_FEATURE_UPGRADE = 17;
  MHD_FEATURE_RESPONSES_SHARED_FD = 18;
  MHD_FEATURE_AUTODETECT_BIND_PORT = 19;
  MHD_FEATURE_AUTOSUPPRESS_SIGPIPE = 20;
  MHD_FEATURE_SENDFILE = 21;
  MHD_FEATURE_THREADS = 22;
  MHD_FEATURE_HTTPS_CERT_CALLBACK2 = 23;
  MHD_FEATURE_HTTPS_COOKIE_PARSING = 24;
  MHD_FEATURE_DIGEST_AUTH_RFC2069 = 25;
  MHD_FEATURE_DIGEST_AUTH_MD5 = 26;
  MHD_FEATURE_DIGEST_AUTH_SHA256 = 27;
  MHD_FEATURE_DIGEST_AUTH_SHA512_256 = 28;
  MHD_FEATURE_DIGEST_AUTH_AUTH_INT = 29;
  MHD_FEATURE_DIGEST_AUTH_ALGO_SESSION = 30;
  MHD_FEATURE_DIGEST_AUTH_USERHASH = 31;
  MHD_FEATURE_EXTERN_HASH = 32;
  MHD_FEATURE_DEBUG_BUILD = 33;
  MHD_FEATURE_FLEXIBLE_FD_SETSIZE = 34;

function MHD_is_feature_supported(feature: TMHD_FEATURE): TMHD_Result; cdecl; external libmicrohttpd;

function MHD_CONTENT_READER_END_OF_STREAM: Tssize_t;
function MHD_CONTENT_READER_END_WITH_ERROR: Tssize_t;

function MHD_ICY_FLAG: Tuint32_t;

implementation

function MHD_CONTENT_READER_END_OF_STREAM: Tssize_t;
begin
  MHD_CONTENT_READER_END_OF_STREAM := Tssize_t(-(1));
end;

function MHD_CONTENT_READER_END_WITH_ERROR: Tssize_t;
begin
  MHD_CONTENT_READER_END_WITH_ERROR := Tssize_t(-(2));
end;

function MHD_ICY_FLAG: Tuint32_t;
begin
  MHD_ICY_FLAG := Tuint32_t((Tuint32_t(1)) shl 31);
end;

end.
