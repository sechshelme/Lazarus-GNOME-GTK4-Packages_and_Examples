unit microhttpd;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

// ==== Eigenes
const
  libmicrohttpd='microhttpd';

const
  UINT64_MAX = High(UInt64);
  FD_SETSIZE=1024; // Nur Linux    Windows = 64
type
  Tintptr_t=PtrInt;
  TSOCKET=pointer;

  Tsocklen_t= LongInt;

  Tuint8_t=UInt8;
  Puint8_t=^Tuint8_t;

  Tuint16_t=UInt16;

  Tint32_t=Int64;
  Tuint32_t=UInt32;

  Tint64_t=Int64;
  Tuint64_t=UInt64;
  Puint64_t=^Tuint64_t;


  Tsize_t=SizeInt;
  Psize_t=^Tsize_t;

  Toff_t=UInt64; // bei 64bit

  Tva_list=Pointer;

  Psockaddr=Pointer;

  Pfd_set=Pointer;

//  Tdigest_arr=array[0..(MHD_MD5_DIGEST_SIZE)-1] of Tuint8_t
    Tdigest_arr=array[0..(16)-1] of Tuint8_t;


// ========


type
  Pssize_t = ^Tssize_t;
  Tssize_t = Tintptr_t;
{*
   * MHD result code for "NO".
    }
{*
   * MHD result code for "YES".
    }
  TMHD_Result =  Longint;
  Const
    MHD_NO = 0;
    MHD_YES = 1;

{*
 * Constant used to indicate unknown size (use when
 * creating a response).
  }
  MHD_SIZE_UNKNOWN = UINT64_MAX;  

{ was #define dname def_expr }
function MHD_CONTENT_READER_END_OF_STREAM : Tssize_t;  

{ was #define dname def_expr }
function MHD_CONTENT_READER_END_WITH_ERROR : Tssize_t;  

type
  PMHD_socket = ^TMHD_socket;
  TMHD_socket = longint;

//  PMHD_socket = ^TMHD_socket;
//  TMHD_socket = TSOCKET;

type
  TMHD_LONG_LONG = int64;  
  TMHD_UNSIGNED_LONG_LONG = qword;
  PMHD_UNSIGNED_LONG_LONG=^TMHD_UNSIGNED_LONG_LONG;
const
  MHD_LONG_LONG_PRINTF = 'll';  
  MHD_UNSIGNED_LONG_LONG_PRINTF = '%llu';  
{ 100 "Continue".            RFC9110, Section 15.2.1.  }
  MHD_HTTP_CONTINUE = 100;  
{ 101 "Switching Protocols". RFC9110, Section 15.2.2.  }
  MHD_HTTP_SWITCHING_PROTOCOLS = 101;  
{ 102 "Processing".          RFC2518.  }
  MHD_HTTP_PROCESSING = 102;  
{ 103 "Early Hints".         RFC8297.  }
  MHD_HTTP_EARLY_HINTS = 103;  
{ 200 "OK".                  RFC9110, Section 15.3.1.  }
  MHD_HTTP_OK = 200;  
{ 201 "Created".             RFC9110, Section 15.3.2.  }
  MHD_HTTP_CREATED = 201;  
{ 202 "Accepted".            RFC9110, Section 15.3.3.  }
  MHD_HTTP_ACCEPTED = 202;  
{ 203 "Non-Authoritative Information". RFC9110, Section 15.3.4.  }
  MHD_HTTP_NON_AUTHORITATIVE_INFORMATION = 203;  
{ 204 "No Content".          RFC9110, Section 15.3.5.  }
  MHD_HTTP_NO_CONTENT = 204;  
{ 205 "Reset Content".       RFC9110, Section 15.3.6.  }
  MHD_HTTP_RESET_CONTENT = 205;  
{ 206 "Partial Content".     RFC9110, Section 15.3.7.  }
  MHD_HTTP_PARTIAL_CONTENT = 206;  
{ 207 "Multi-Status".        RFC4918.  }
  MHD_HTTP_MULTI_STATUS = 207;  
{ 208 "Already Reported".    RFC5842.  }
  MHD_HTTP_ALREADY_REPORTED = 208;  
{ 226 "IM Used".             RFC3229.  }
  MHD_HTTP_IM_USED = 226;  
{ 300 "Multiple Choices".    RFC9110, Section 15.4.1.  }
  MHD_HTTP_MULTIPLE_CHOICES = 300;  
{ 301 "Moved Permanently".   RFC9110, Section 15.4.2.  }
  MHD_HTTP_MOVED_PERMANENTLY = 301;  
{ 302 "Found".               RFC9110, Section 15.4.3.  }
  MHD_HTTP_FOUND = 302;  
{ 303 "See Other".           RFC9110, Section 15.4.4.  }
  MHD_HTTP_SEE_OTHER = 303;  
{ 304 "Not Modified".        RFC9110, Section 15.4.5.  }
  MHD_HTTP_NOT_MODIFIED = 304;  
{ 305 "Use Proxy".           RFC9110, Section 15.4.6.  }
  MHD_HTTP_USE_PROXY = 305;  
{ 306 "Switch Proxy".        Not used! RFC9110, Section 15.4.7.  }
  MHD_HTTP_SWITCH_PROXY = 306;  
{ 307 "Temporary Redirect".  RFC9110, Section 15.4.8.  }
  MHD_HTTP_TEMPORARY_REDIRECT = 307;  
{ 308 "Permanent Redirect".  RFC9110, Section 15.4.9.  }
  MHD_HTTP_PERMANENT_REDIRECT = 308;  
{ 400 "Bad Request".         RFC9110, Section 15.5.1.  }
  MHD_HTTP_BAD_REQUEST = 400;  
{ 401 "Unauthorized".        RFC9110, Section 15.5.2.  }
  MHD_HTTP_UNAUTHORIZED = 401;  
{ 402 "Payment Required".    RFC9110, Section 15.5.3.  }
  MHD_HTTP_PAYMENT_REQUIRED = 402;  
{ 403 "Forbidden".           RFC9110, Section 15.5.4.  }
  MHD_HTTP_FORBIDDEN = 403;  
{ 404 "Not Found".           RFC9110, Section 15.5.5.  }
  MHD_HTTP_NOT_FOUND = 404;  
{ 405 "Method Not Allowed".  RFC9110, Section 15.5.6.  }
  MHD_HTTP_METHOD_NOT_ALLOWED = 405;  
{ 406 "Not Acceptable".      RFC9110, Section 15.5.7.  }
  MHD_HTTP_NOT_ACCEPTABLE = 406;  
{ 407 "Proxy Authentication Required". RFC9110, Section 15.5.8.  }
  MHD_HTTP_PROXY_AUTHENTICATION_REQUIRED = 407;  
{ 408 "Request Timeout".     RFC9110, Section 15.5.9.  }
  MHD_HTTP_REQUEST_TIMEOUT = 408;  
{ 409 "Conflict".            RFC9110, Section 15.5.10.  }
  MHD_HTTP_CONFLICT = 409;  
{ 410 "Gone".                RFC9110, Section 15.5.11.  }
  MHD_HTTP_GONE = 410;  
{ 411 "Length Required".     RFC9110, Section 15.5.12.  }
  MHD_HTTP_LENGTH_REQUIRED = 411;  
{ 412 "Precondition Failed". RFC9110, Section 15.5.13.  }
  MHD_HTTP_PRECONDITION_FAILED = 412;  
{ 413 "Content Too Large".   RFC9110, Section 15.5.14.  }
  MHD_HTTP_CONTENT_TOO_LARGE = 413;  
{ 414 "URI Too Long".        RFC9110, Section 15.5.15.  }
  MHD_HTTP_URI_TOO_LONG = 414;  
{ 415 "Unsupported Media Type". RFC9110, Section 15.5.16.  }
  MHD_HTTP_UNSUPPORTED_MEDIA_TYPE = 415;  
{ 416 "Range Not Satisfiable". RFC9110, Section 15.5.17.  }
  MHD_HTTP_RANGE_NOT_SATISFIABLE = 416;  
{ 417 "Expectation Failed".  RFC9110, Section 15.5.18.  }
  MHD_HTTP_EXPECTATION_FAILED = 417;  
{ 421 "Misdirected Request". RFC9110, Section 15.5.20.  }
  MHD_HTTP_MISDIRECTED_REQUEST = 421;  
{ 422 "Unprocessable Content". RFC9110, Section 15.5.21.  }
  MHD_HTTP_UNPROCESSABLE_CONTENT = 422;  
{ 423 "Locked".              RFC4918.  }
  MHD_HTTP_LOCKED = 423;  
{ 424 "Failed Dependency".   RFC4918.  }
  MHD_HTTP_FAILED_DEPENDENCY = 424;  
{ 425 "Too Early".           RFC8470.  }
  MHD_HTTP_TOO_EARLY = 425;  
{ 426 "Upgrade Required".    RFC9110, Section 15.5.22.  }
  MHD_HTTP_UPGRADE_REQUIRED = 426;  
{ 428 "Precondition Required". RFC6585.  }
  MHD_HTTP_PRECONDITION_REQUIRED = 428;  
{ 429 "Too Many Requests".   RFC6585.  }
  MHD_HTTP_TOO_MANY_REQUESTS = 429;  
{ 431 "Request Header Fields Too Large". RFC6585.  }
  MHD_HTTP_REQUEST_HEADER_FIELDS_TOO_LARGE = 431;  
{ 451 "Unavailable For Legal Reasons". RFC7725.  }
  MHD_HTTP_UNAVAILABLE_FOR_LEGAL_REASONS = 451;  
{ 500 "Internal Server Error". RFC9110, Section 15.6.1.  }
  MHD_HTTP_INTERNAL_SERVER_ERROR = 500;  
{ 501 "Not Implemented".     RFC9110, Section 15.6.2.  }
  MHD_HTTP_NOT_IMPLEMENTED = 501;  
{ 502 "Bad Gateway".         RFC9110, Section 15.6.3.  }
  MHD_HTTP_BAD_GATEWAY = 502;  
{ 503 "Service Unavailable". RFC9110, Section 15.6.4.  }
  MHD_HTTP_SERVICE_UNAVAILABLE = 503;  
{ 504 "Gateway Timeout".     RFC9110, Section 15.6.5.  }
  MHD_HTTP_GATEWAY_TIMEOUT = 504;  
{ 505 "HTTP Version Not Supported". RFC9110, Section 15.6.6.  }
  MHD_HTTP_HTTP_VERSION_NOT_SUPPORTED = 505;  
{ 506 "Variant Also Negotiates". RFC2295.  }
  MHD_HTTP_VARIANT_ALSO_NEGOTIATES = 506;  
{ 507 "Insufficient Storage". RFC4918.  }
  MHD_HTTP_INSUFFICIENT_STORAGE = 507;  
{ 508 "Loop Detected".       RFC5842.  }
  MHD_HTTP_LOOP_DETECTED = 508;  
{ 510 "Not Extended".        (OBSOLETED) RFC2774; status-change-http-experiments-to-historic.  }
  MHD_HTTP_NOT_EXTENDED = 510;  
{ 511 "Network Authentication Required". RFC6585.  }
  MHD_HTTP_NETWORK_AUTHENTICATION_REQUIRED = 511;  
{ Not registered non-standard codes  }
{ 449 "Reply With".          MS IIS extension.  }
  MHD_HTTP_RETRY_WITH = 449;  
{ 450 "Blocked by Windows Parental Controls". MS extension.  }
  MHD_HTTP_BLOCKED_BY_WINDOWS_PARENTAL_CONTROLS = 450;  
{ 509 "Bandwidth Limit Exceeded". Apache extension.  }
  MHD_HTTP_BANDWIDTH_LIMIT_EXCEEDED = 509;  
{ Deprecated names and codes  }
{* @deprecated  }

function MHD_get_reason_phrase_for(code:dword):Pchar;cdecl;external libmicrohttpd;
{*
 * Returns the length of the string reason phrase for a response code.
 *
 * If message string is not available for a status code,
 * 0 is returned.
  }
function MHD_get_reason_phrase_len_for(code:dword):Tsize_t;cdecl;external libmicrohttpd;
{*
 * Flag to be or-ed with MHD_HTTP status code for
 * SHOUTcast.  This will cause the response to begin
 * with the SHOUTcast "ICY" line instead of "HTTP/1.x".
 * @ingroup specialized
  }
{ was #define dname def_expr }
function MHD_ICY_FLAG : Tuint32_t;  

{*
 * @defgroup headers HTTP headers
 * The standard headers found in HTTP requests and responses.
 * See: https://www.iana.org/assignments/http-fields/http-fields.xhtml
 * Registry export date: 2023-10-02
 * @
  }
{ Main HTTP headers.  }
{ Permanent.     RFC9110, Section 12.5.1: HTTP Semantics  }
const
  MHD_HTTP_HEADER_ACCEPT = 'Accept';  
{ Deprecated.    RFC9110, Section 12.5.2: HTTP Semantics  }
  MHD_HTTP_HEADER_ACCEPT_CHARSET = 'Accept-Charset';  
{ Permanent.     RFC9110, Section 12.5.3: HTTP Semantics  }
  MHD_HTTP_HEADER_ACCEPT_ENCODING = 'Accept-Encoding';  
{ Permanent.     RFC9110, Section 12.5.4: HTTP Semantics  }
  MHD_HTTP_HEADER_ACCEPT_LANGUAGE = 'Accept-Language';  
{ Permanent.     RFC9110, Section 14.3: HTTP Semantics  }
  MHD_HTTP_HEADER_ACCEPT_RANGES = 'Accept-Ranges';  
{ Permanent.     RFC9111, Section 5.1: HTTP Caching  }
  MHD_HTTP_HEADER_AGE = 'Age';  
{ Permanent.     RFC9110, Section 10.2.1: HTTP Semantics  }
  MHD_HTTP_HEADER_ALLOW = 'Allow';  
{ Permanent.     RFC9110, Section 11.6.3: HTTP Semantics  }
  MHD_HTTP_HEADER_AUTHENTICATION_INFO = 'Authentication-Info';  
{ Permanent.     RFC9110, Section 11.6.2: HTTP Semantics  }
  MHD_HTTP_HEADER_AUTHORIZATION = 'Authorization';  
{ Permanent.     RFC9111, Section 5.2  }
  MHD_HTTP_HEADER_CACHE_CONTROL = 'Cache-Control';  
{ Permanent.     RFC9112, Section 9.6: HTTP/1.1  }
  MHD_HTTP_HEADER_CLOSE = 'Close';  
{ Permanent.     RFC9110, Section 7.6.1: HTTP Semantics  }
  MHD_HTTP_HEADER_CONNECTION = 'Connection';  
{ Permanent.     RFC9110, Section 8.4: HTTP Semantics  }
  MHD_HTTP_HEADER_CONTENT_ENCODING = 'Content-Encoding';  
{ Permanent.     RFC9110, Section 8.5: HTTP Semantics  }
  MHD_HTTP_HEADER_CONTENT_LANGUAGE = 'Content-Language';  
{ Permanent.     RFC9110, Section 8.6: HTTP Semantics  }
  MHD_HTTP_HEADER_CONTENT_LENGTH = 'Content-Length';  
{ Permanent.     RFC9110, Section 8.7: HTTP Semantics  }
  MHD_HTTP_HEADER_CONTENT_LOCATION = 'Content-Location';  
{ Permanent.     RFC9110, Section 14.4: HTTP Semantics  }
  MHD_HTTP_HEADER_CONTENT_RANGE = 'Content-Range';  
{ Permanent.     RFC9110, Section 8.3: HTTP Semantics  }
  MHD_HTTP_HEADER_CONTENT_TYPE = 'Content-Type';  
{ Permanent.     RFC9110, Section 6.6.1: HTTP Semantics  }
  MHD_HTTP_HEADER_DATE = 'Date';  
{ Permanent.     RFC9110, Section 8.8.3: HTTP Semantics  }
  MHD_HTTP_HEADER_ETAG = 'ETag';  
{ Permanent.     RFC9110, Section 10.1.1: HTTP Semantics  }
  MHD_HTTP_HEADER_EXPECT = 'Expect';  
{ Permanent.     RFC9111, Section 5.3: HTTP Caching  }
  MHD_HTTP_HEADER_EXPIRES = 'Expires';  
{ Permanent.     RFC9110, Section 10.1.2: HTTP Semantics  }
  MHD_HTTP_HEADER_FROM = 'From';  
{ Permanent.     RFC9110, Section 7.2: HTTP Semantics  }
  MHD_HTTP_HEADER_HOST = 'Host';  
{ Permanent.     RFC9110, Section 13.1.1: HTTP Semantics  }
  MHD_HTTP_HEADER_IF_MATCH = 'If-Match';  
{ Permanent.     RFC9110, Section 13.1.3: HTTP Semantics  }
  MHD_HTTP_HEADER_IF_MODIFIED_SINCE = 'If-Modified-Since';  
{ Permanent.     RFC9110, Section 13.1.2: HTTP Semantics  }
  MHD_HTTP_HEADER_IF_NONE_MATCH = 'If-None-Match';  
{ Permanent.     RFC9110, Section 13.1.5: HTTP Semantics  }
  MHD_HTTP_HEADER_IF_RANGE = 'If-Range';  
{ Permanent.     RFC9110, Section 13.1.4: HTTP Semantics  }
  MHD_HTTP_HEADER_IF_UNMODIFIED_SINCE = 'If-Unmodified-Since';  
{ Permanent.     RFC9110, Section 8.8.2: HTTP Semantics  }
  MHD_HTTP_HEADER_LAST_MODIFIED = 'Last-Modified';  
{ Permanent.     RFC9110, Section 10.2.2: HTTP Semantics  }
  MHD_HTTP_HEADER_LOCATION = 'Location';  
{ Permanent.     RFC9110, Section 7.6.2: HTTP Semantics  }
  MHD_HTTP_HEADER_MAX_FORWARDS = 'Max-Forwards';  
{ Permanent.     RFC9112, Appendix B.1: HTTP/1.1  }
  MHD_HTTP_HEADER_MIME_VERSION = 'MIME-Version';  
{ Deprecated.    RFC9111, Section 5.4: HTTP Caching  }
  MHD_HTTP_HEADER_PRAGMA = 'Pragma';  
{ Permanent.     RFC9110, Section 11.7.1: HTTP Semantics  }
  MHD_HTTP_HEADER_PROXY_AUTHENTICATE = 'Proxy-Authenticate';  
{ Permanent.     RFC9110, Section 11.7.3: HTTP Semantics  }
  MHD_HTTP_HEADER_PROXY_AUTHENTICATION_INFO = 'Proxy-Authentication-Info';  
{ Permanent.     RFC9110, Section 11.7.2: HTTP Semantics  }
  MHD_HTTP_HEADER_PROXY_AUTHORIZATION = 'Proxy-Authorization';  
{ Permanent.     RFC9110, Section 14.2: HTTP Semantics  }
  MHD_HTTP_HEADER_RANGE = 'Range';  
{ Permanent.     RFC9110, Section 10.1.3: HTTP Semantics  }
  MHD_HTTP_HEADER_REFERER = 'Referer';  
{ Permanent.     RFC9110, Section 10.2.3: HTTP Semantics  }
  MHD_HTTP_HEADER_RETRY_AFTER = 'Retry-After';  
{ Permanent.     RFC9110, Section 10.2.4: HTTP Semantics  }
  MHD_HTTP_HEADER_SERVER = 'Server';  
{ Permanent.     RFC9110, Section 10.1.4: HTTP Semantics  }
  MHD_HTTP_HEADER_TE = 'TE';  
{ Permanent.     RFC9110, Section 6.6.2: HTTP Semantics  }
  MHD_HTTP_HEADER_TRAILER = 'Trailer';  
{ Permanent.     RFC9112, Section 6.1: HTTP Semantics  }
  MHD_HTTP_HEADER_TRANSFER_ENCODING = 'Transfer-Encoding';  
{ Permanent.     RFC9110, Section 7.8: HTTP Semantics  }
  MHD_HTTP_HEADER_UPGRADE = 'Upgrade';  
{ Permanent.     RFC9110, Section 10.1.5: HTTP Semantics  }
  MHD_HTTP_HEADER_USER_AGENT = 'User-Agent';  
{ Permanent.     RFC9110, Section 12.5.5: HTTP Semantics  }
  MHD_HTTP_HEADER_VARY = 'Vary';  
{ Permanent.     RFC9110, Section 7.6.3: HTTP Semantics  }
  MHD_HTTP_HEADER_VIA = 'Via';  
{ Permanent.     RFC9110, Section 11.6.1: HTTP Semantics  }
  MHD_HTTP_HEADER_WWW_AUTHENTICATE = 'WWW-Authenticate';  
{ Permanent.     RFC9110, Section 12.5.5: HTTP Semantics  }
  MHD_HTTP_HEADER_ASTERISK = '*';  
{ Additional HTTP headers.  }
{ Permanent.     RFC 3229: Delta encoding in HTTP  }
  MHD_HTTP_HEADER_A_IM = 'A-IM';  
{ Permanent.     RFC 2324: Hyper Text Coffee Pot Control Protocol (HTCPCP/1.0)  }
  MHD_HTTP_HEADER_ACCEPT_ADDITIONS = 'Accept-Additions';  
{ Permanent.     RFC 8942, Section 3.1: HTTP Client Hints  }
  MHD_HTTP_HEADER_ACCEPT_CH = 'Accept-CH';  
{ Permanent.     RFC 7089: HTTP Framework for Time-Based Access to Resource States -- Memento  }
  MHD_HTTP_HEADER_ACCEPT_DATETIME = 'Accept-Datetime';  
{ Permanent.     RFC 2295: Transparent Content Negotiation in HTTP  }
  MHD_HTTP_HEADER_ACCEPT_FEATURES = 'Accept-Features';  
{ Permanent.     RFC 5789: PATCH Method for HTTP  }
  MHD_HTTP_HEADER_ACCEPT_PATCH = 'Accept-Patch';  
{ Permanent.     Linked Data Platform 1.0  }
  MHD_HTTP_HEADER_ACCEPT_POST = 'Accept-Post';  
{ Permanent.     RFC-ietf-httpbis-message-signatures-19, Section 5.1: HTTP Message Signatures  }
  MHD_HTTP_HEADER_ACCEPT_SIGNATURE = 'Accept-Signature';  
{ Permanent.     Fetch  }
  MHD_HTTP_HEADER_ACCESS_CONTROL_ALLOW_CREDENTIALS = 'Access-Control-Allow-Credentials';  
{ Permanent.     Fetch  }
  MHD_HTTP_HEADER_ACCESS_CONTROL_ALLOW_HEADERS = 'Access-Control-Allow-Headers';  
{ Permanent.     Fetch  }
  MHD_HTTP_HEADER_ACCESS_CONTROL_ALLOW_METHODS = 'Access-Control-Allow-Methods';  
{ Permanent.     Fetch  }
  MHD_HTTP_HEADER_ACCESS_CONTROL_ALLOW_ORIGIN = 'Access-Control-Allow-Origin';  
{ Permanent.     Fetch  }
  MHD_HTTP_HEADER_ACCESS_CONTROL_EXPOSE_HEADERS = 'Access-Control-Expose-Headers';  
{ Permanent.     Fetch  }
  MHD_HTTP_HEADER_ACCESS_CONTROL_MAX_AGE = 'Access-Control-Max-Age';  
{ Permanent.     Fetch  }
  MHD_HTTP_HEADER_ACCESS_CONTROL_REQUEST_HEADERS = 'Access-Control-Request-Headers';  
{ Permanent.     Fetch  }
  MHD_HTTP_HEADER_ACCESS_CONTROL_REQUEST_METHOD = 'Access-Control-Request-Method';  
{ Permanent.     RFC 7639, Section 2: The ALPN HTTP Header Field  }
  MHD_HTTP_HEADER_ALPN = 'ALPN';  
{ Permanent.     RFC 7838: HTTP Alternative Services  }
  MHD_HTTP_HEADER_ALT_SVC = 'Alt-Svc';  
{ Permanent.     RFC 7838: HTTP Alternative Services  }
  MHD_HTTP_HEADER_ALT_USED = 'Alt-Used';  
{ Permanent.     RFC 2295: Transparent Content Negotiation in HTTP  }
  MHD_HTTP_HEADER_ALTERNATES = 'Alternates';  
{ Permanent.     RFC 4437: Web Distributed Authoring and Versioning (WebDAV) Redirect Reference Resources  }
  MHD_HTTP_HEADER_APPLY_TO_REDIRECT_REF = 'Apply-To-Redirect-Ref';  
{ Permanent.     RFC 8053, Section 4: HTTP Authentication Extensions for Interactive Clients  }
  MHD_HTTP_HEADER_AUTHENTICATION_CONTROL = 'Authentication-Control';  
{ Permanent.     RFC9211: The Cache-Status HTTP Response Header Field  }
  MHD_HTTP_HEADER_CACHE_STATUS = 'Cache-Status';  
{ Permanent.     RFC 8607, Section 5.1: Calendaring Extensions to WebDAV (CalDAV): Managed Attachments  }
  MHD_HTTP_HEADER_CAL_MANAGED_ID = 'Cal-Managed-ID';  
{ Permanent.     RFC 7809, Section 7.1: Calendaring Extensions to WebDAV (CalDAV): Time Zones by Reference  }
  MHD_HTTP_HEADER_CALDAV_TIMEZONES = 'CalDAV-Timezones';  
{ Permanent.     RFC9297  }
  MHD_HTTP_HEADER_CAPSULE_PROTOCOL = 'Capsule-Protocol';  
{ Permanent.     RFC9213: Targeted HTTP Cache Control  }
  MHD_HTTP_HEADER_CDN_CACHE_CONTROL = 'CDN-Cache-Control';  
{ Permanent.     RFC 8586: Loop Detection in Content Delivery Networks (CDNs)  }
  MHD_HTTP_HEADER_CDN_LOOP = 'CDN-Loop';  
{ Permanent.     RFC 8739, Section 3.3: Support for Short-Term, Automatically Renewed (STAR) Certificates in the Automated Certificate Management Environment (ACME)  }
  MHD_HTTP_HEADER_CERT_NOT_AFTER = 'Cert-Not-After';  
{ Permanent.     RFC 8739, Section 3.3: Support for Short-Term, Automatically Renewed (STAR) Certificates in the Automated Certificate Management Environment (ACME)  }
  MHD_HTTP_HEADER_CERT_NOT_BEFORE = 'Cert-Not-Before';  
{ Permanent.     Clear Site Data  }
  MHD_HTTP_HEADER_CLEAR_SITE_DATA = 'Clear-Site-Data';  
{ Permanent.     RFC9440, Section 2: Client-Cert HTTP Header Field  }
  MHD_HTTP_HEADER_CLIENT_CERT = 'Client-Cert';  
{ Permanent.     RFC9440, Section 2: Client-Cert HTTP Header Field  }
  MHD_HTTP_HEADER_CLIENT_CERT_CHAIN = 'Client-Cert-Chain';  
{ Permanent.     RFC-ietf-httpbis-digest-headers-13, Section 2: Digest Fields  }
  MHD_HTTP_HEADER_CONTENT_DIGEST = 'Content-Digest';  
{ Permanent.     RFC 6266: Use of the Content-Disposition Header Field in the Hypertext Transfer Protocol (HTTP)  }
  MHD_HTTP_HEADER_CONTENT_DISPOSITION = 'Content-Disposition';  
{ Permanent.     The HTTP Distribution and Replication Protocol  }
  MHD_HTTP_HEADER_CONTENT_ID = 'Content-ID';  
{ Permanent.     Content Security Policy Level 3  }
  MHD_HTTP_HEADER_CONTENT_SECURITY_POLICY = 'Content-Security-Policy';  
{ Permanent.     Content Security Policy Level 3  }
  MHD_HTTP_HEADER_CONTENT_SECURITY_POLICY_REPORT_ONLY = 'Content-Security-Policy-Report-Only';  
{ Permanent.     RFC 6265: HTTP State Management Mechanism  }
  MHD_HTTP_HEADER_COOKIE = 'Cookie';  
{ Permanent.     HTML  }
  MHD_HTTP_HEADER_CROSS_ORIGIN_EMBEDDER_POLICY = 'Cross-Origin-Embedder-Policy';  
{ Permanent.     HTML  }
  MHD_HTTP_HEADER_CROSS_ORIGIN_EMBEDDER_POLICY_REPORT_ONLY = 'Cross-Origin-Embedder-Policy-Report-Only';  
{ Permanent.     HTML  }
  MHD_HTTP_HEADER_CROSS_ORIGIN_OPENER_POLICY = 'Cross-Origin-Opener-Policy';  
{ Permanent.     HTML  }
  MHD_HTTP_HEADER_CROSS_ORIGIN_OPENER_POLICY_REPORT_ONLY = 'Cross-Origin-Opener-Policy-Report-Only';  
{ Permanent.     Fetch  }
  MHD_HTTP_HEADER_CROSS_ORIGIN_RESOURCE_POLICY = 'Cross-Origin-Resource-Policy';  
{ Permanent.     RFC 5323: Web Distributed Authoring and Versioning (WebDAV) SEARCH  }
  MHD_HTTP_HEADER_DASL = 'DASL';  
{ Permanent.     RFC 4918: HTTP Extensions for Web Distributed Authoring and Versioning (WebDAV)  }
  MHD_HTTP_HEADER_DAV = 'DAV';  
{ Permanent.     RFC 3229: Delta encoding in HTTP  }
  MHD_HTTP_HEADER_DELTA_BASE = 'Delta-Base';  
{ Permanent.     RFC 4918: HTTP Extensions for Web Distributed Authoring and Versioning (WebDAV)  }
  MHD_HTTP_HEADER_DEPTH = 'Depth';  
{ Permanent.     RFC 4918: HTTP Extensions for Web Distributed Authoring and Versioning (WebDAV)  }
  MHD_HTTP_HEADER_DESTINATION = 'Destination';  
{ Permanent.     The HTTP Distribution and Replication Protocol  }
  MHD_HTTP_HEADER_DIFFERENTIAL_ID = 'Differential-ID';  
{ Permanent.     RFC9449: OAuth 2.0 Demonstrating Proof of Possession (DPoP)  }
  MHD_HTTP_HEADER_DPOP = 'DPoP';  
{ Permanent.     RFC9449: OAuth 2.0 Demonstrating Proof of Possession (DPoP)  }
  MHD_HTTP_HEADER_DPOP_NONCE = 'DPoP-Nonce';  
{ Permanent.     RFC 8470: Using Early Data in HTTP  }
  MHD_HTTP_HEADER_EARLY_DATA = 'Early-Data';  
{ Permanent.     RFC9163: Expect-CT Extension for HTTP  }
  MHD_HTTP_HEADER_EXPECT_CT = 'Expect-CT';  
{ Permanent.     RFC 7239: Forwarded HTTP Extension  }
  MHD_HTTP_HEADER_FORWARDED = 'Forwarded';  
{ Permanent.     RFC 7486, Section 6.1.1: HTTP Origin-Bound Authentication (HOBA)  }
  MHD_HTTP_HEADER_HOBAREG = 'Hobareg';  
{ Permanent.     RFC 4918: HTTP Extensions for Web Distributed Authoring and Versioning (WebDAV)  }
  MHD_HTTP_HEADER_IF = 'If';  
{ Permanent.      RFC 6338: Scheduling Extensions to CalDAV  }
  MHD_HTTP_HEADER_IF_SCHEDULE_TAG_MATCH = 'If-Schedule-Tag-Match';  
{ Permanent.     RFC 3229: Delta encoding in HTTP  }
  MHD_HTTP_HEADER_IM = 'IM';  
{ Permanent.     RFC 8473: Token Binding over HTTP  }
  MHD_HTTP_HEADER_INCLUDE_REFERRED_TOKEN_BINDING_ID = 'Include-Referred-Token-Binding-ID';  
{ Permanent.     RFC 2068: Hypertext Transfer Protocol -- HTTP/1.1  }
  MHD_HTTP_HEADER_KEEP_ALIVE = 'Keep-Alive';  
{ Permanent.     RFC 3253: Versioning Extensions to WebDAV: (Web Distributed Authoring and Versioning)  }
  MHD_HTTP_HEADER_LABEL = 'Label';  
{ Permanent.     HTML  }
  MHD_HTTP_HEADER_LAST_EVENT_ID = 'Last-Event-ID';  
{ Permanent.     RFC 8288: Web Linking  }
  MHD_HTTP_HEADER_LINK = 'Link';  
{ Permanent.     RFC 4918: HTTP Extensions for Web Distributed Authoring and Versioning (WebDAV)  }
  MHD_HTTP_HEADER_LOCK_TOKEN = 'Lock-Token';  
{ Permanent.     RFC 7089: HTTP Framework for Time-Based Access to Resource States -- Memento  }
  MHD_HTTP_HEADER_MEMENTO_DATETIME = 'Memento-Datetime';  
{ Permanent.     RFC 2227: Simple Hit-Metering and Usage-Limiting for HTTP  }
  MHD_HTTP_HEADER_METER = 'Meter';  
{ Permanent.     RFC 2295: Transparent Content Negotiation in HTTP  }
  MHD_HTTP_HEADER_NEGOTIATE = 'Negotiate';  
{ Permanent.     Network Error Logging  }
  MHD_HTTP_HEADER_NEL = 'NEL';  
{ Permanent.     OData Version 4.01 Part 1: Protocol; OASIS; Chet_Ensign  }
  MHD_HTTP_HEADER_ODATA_ENTITYID = 'OData-EntityId';  
{ Permanent.     OData Version 4.01 Part 1: Protocol; OASIS; Chet_Ensign  }
  MHD_HTTP_HEADER_ODATA_ISOLATION = 'OData-Isolation';  
{ Permanent.     OData Version 4.01 Part 1: Protocol; OASIS; Chet_Ensign  }
  MHD_HTTP_HEADER_ODATA_MAXVERSION = 'OData-MaxVersion';  
{ Permanent.     OData Version 4.01 Part 1: Protocol; OASIS; Chet_Ensign  }
  MHD_HTTP_HEADER_ODATA_VERSION = 'OData-Version';  
{ Permanent.     RFC 8053, Section 3: HTTP Authentication Extensions for Interactive Clients  }
  MHD_HTTP_HEADER_OPTIONAL_WWW_AUTHENTICATE = 'Optional-WWW-Authenticate';  
{ Permanent.     RFC 3648: Web Distributed Authoring and Versioning (WebDAV) Ordered Collections Protocol  }
  MHD_HTTP_HEADER_ORDERING_TYPE = 'Ordering-Type';  
{ Permanent.     RFC 6454: The Web Origin Concept  }
  MHD_HTTP_HEADER_ORIGIN = 'Origin';  
{ Permanent.     HTML  }
  MHD_HTTP_HEADER_ORIGIN_AGENT_CLUSTER = 'Origin-Agent-Cluster';  
{ Permanent.     RFC 8613, Section 11.1: Object Security for Constrained RESTful Environments (OSCORE)  }
  MHD_HTTP_HEADER_OSCORE = 'OSCORE';  
{ Permanent.     OASIS Project Specification 01; OASIS; Chet_Ensign  }
  MHD_HTTP_HEADER_OSLC_CORE_VERSION = 'OSLC-Core-Version';  
{ Permanent.     RFC 4918: HTTP Extensions for Web Distributed Authoring and Versioning (WebDAV)  }
  MHD_HTTP_HEADER_OVERWRITE = 'Overwrite';  
{ Permanent.     HTML  }
  MHD_HTTP_HEADER_PING_FROM = 'Ping-From';  
{ Permanent.     HTML  }
  MHD_HTTP_HEADER_PING_TO = 'Ping-To';  
{ Permanent.     RFC 3648: Web Distributed Authoring and Versioning (WebDAV) Ordered Collections Protocol  }
  MHD_HTTP_HEADER_POSITION = 'Position';  
{ Permanent.     RFC 7240: Prefer Header for HTTP  }
  MHD_HTTP_HEADER_PREFER = 'Prefer';  
{ Permanent.     RFC 7240: Prefer Header for HTTP  }
  MHD_HTTP_HEADER_PREFERENCE_APPLIED = 'Preference-Applied';  
{ Permanent.     RFC9218: Extensible Prioritization Scheme for HTTP  }
  MHD_HTTP_HEADER_PRIORITY = 'Priority';  
{ Permanent.     RFC9209: The Proxy-Status HTTP Response Header Field  }
  MHD_HTTP_HEADER_PROXY_STATUS = 'Proxy-Status';  
{ Permanent.     RFC 7469: Public Key Pinning Extension for HTTP  }
  MHD_HTTP_HEADER_PUBLIC_KEY_PINS = 'Public-Key-Pins';  
{ Permanent.     RFC 7469: Public Key Pinning Extension for HTTP  }
  MHD_HTTP_HEADER_PUBLIC_KEY_PINS_REPORT_ONLY = 'Public-Key-Pins-Report-Only';  
{ Permanent.     RFC 4437: Web Distributed Authoring and Versioning (WebDAV) Redirect Reference Resources  }
  MHD_HTTP_HEADER_REDIRECT_REF = 'Redirect-Ref';  
{ Permanent.     HTML  }
  MHD_HTTP_HEADER_REFRESH = 'Refresh';  
{ Permanent.     RFC 8555, Section 6.5.1: Automatic Certificate Management Environment (ACME)  }
  MHD_HTTP_HEADER_REPLAY_NONCE = 'Replay-Nonce';  
{ Permanent.     RFC-ietf-httpbis-digest-headers-13, Section 3: Digest Fields  }
  MHD_HTTP_HEADER_REPR_DIGEST = 'Repr-Digest';  
{ Permanent.     RFC 6638: Scheduling Extensions to CalDAV  }
  MHD_HTTP_HEADER_SCHEDULE_REPLY = 'Schedule-Reply';  
{ Permanent.     RFC 6338: Scheduling Extensions to CalDAV  }
  MHD_HTTP_HEADER_SCHEDULE_TAG = 'Schedule-Tag';  
{ Permanent.     Fetch  }
  MHD_HTTP_HEADER_SEC_PURPOSE = 'Sec-Purpose';  
{ Permanent.     RFC 8473: Token Binding over HTTP  }
  MHD_HTTP_HEADER_SEC_TOKEN_BINDING = 'Sec-Token-Binding';  
{ Permanent.     RFC 6455: The WebSocket Protocol  }
  MHD_HTTP_HEADER_SEC_WEBSOCKET_ACCEPT = 'Sec-WebSocket-Accept';  
{ Permanent.     RFC 6455: The WebSocket Protocol  }
  MHD_HTTP_HEADER_SEC_WEBSOCKET_EXTENSIONS = 'Sec-WebSocket-Extensions';  
{ Permanent.     RFC 6455: The WebSocket Protocol  }
  MHD_HTTP_HEADER_SEC_WEBSOCKET_KEY = 'Sec-WebSocket-Key';  
{ Permanent.     RFC 6455: The WebSocket Protocol  }
  MHD_HTTP_HEADER_SEC_WEBSOCKET_PROTOCOL = 'Sec-WebSocket-Protocol';  
{ Permanent.     RFC 6455: The WebSocket Protocol  }
  MHD_HTTP_HEADER_SEC_WEBSOCKET_VERSION = 'Sec-WebSocket-Version';  
{ Permanent.     Server Timing  }
  MHD_HTTP_HEADER_SERVER_TIMING = 'Server-Timing';  
{ Permanent.     RFC 6265: HTTP State Management Mechanism  }
  MHD_HTTP_HEADER_SET_COOKIE = 'Set-Cookie';  
{ Permanent.     RFC-ietf-httpbis-message-signatures-19, Section 4.2: HTTP Message Signatures  }
  MHD_HTTP_HEADER_SIGNATURE = 'Signature';  
{ Permanent.     RFC-ietf-httpbis-message-signatures-19, Section 4.1: HTTP Message Signatures  }
  MHD_HTTP_HEADER_SIGNATURE_INPUT = 'Signature-Input';  
{ Permanent.     RFC 5023: The Atom Publishing Protocol  }
  MHD_HTTP_HEADER_SLUG = 'SLUG';  
{ Permanent.     Simple Object Access Protocol (SOAP) 1.1  }
  MHD_HTTP_HEADER_SOAPACTION = 'SoapAction';  
{ Permanent.     RFC 2518: HTTP Extensions for Distributed Authoring -- WEBDAV  }
  MHD_HTTP_HEADER_STATUS_URI = 'Status-URI';  
{ Permanent.     RFC 6797: HTTP Strict Transport Security (HSTS)  }
  MHD_HTTP_HEADER_STRICT_TRANSPORT_SECURITY = 'Strict-Transport-Security';  
{ Permanent.     RFC 8594: The Sunset HTTP Header Field  }
  MHD_HTTP_HEADER_SUNSET = 'Sunset';  
{ Permanent.     Edge Architecture Specification  }
  MHD_HTTP_HEADER_SURROGATE_CAPABILITY = 'Surrogate-Capability';  
{ Permanent.     Edge Architecture Specification  }
  MHD_HTTP_HEADER_SURROGATE_CONTROL = 'Surrogate-Control';  
{ Permanent.     RFC 2295: Transparent Content Negotiation in HTTP  }
  MHD_HTTP_HEADER_TCN = 'TCN';  
{ Permanent.     RFC 4918: HTTP Extensions for Web Distributed Authoring and Versioning (WebDAV)  }
  MHD_HTTP_HEADER_TIMEOUT = 'Timeout';  
{ Permanent.     RFC 8030, Section 5.4: Generic Event Delivery Using HTTP Push  }
  MHD_HTTP_HEADER_TOPIC = 'Topic';  
{ Permanent.     Trace Context  }
  MHD_HTTP_HEADER_TRACEPARENT = 'Traceparent';  
{ Permanent.     Trace Context  }
  MHD_HTTP_HEADER_TRACESTATE = 'Tracestate';  
{ Permanent.     RFC 8030, Section 5.2: Generic Event Delivery Using HTTP Push  }
  MHD_HTTP_HEADER_TTL = 'TTL';  
{ Permanent.     RFC 8030, Section 5.3: Generic Event Delivery Using HTTP Push  }
  MHD_HTTP_HEADER_URGENCY = 'Urgency';  
{ Permanent.     RFC 2295: Transparent Content Negotiation in HTTP  }
  MHD_HTTP_HEADER_VARIANT_VARY = 'Variant-Vary';  
{ Permanent.     RFC-ietf-httpbis-digest-headers-13, Section 4: Digest Fields  }
  MHD_HTTP_HEADER_WANT_CONTENT_DIGEST = 'Want-Content-Digest';  
{ Permanent.     RFC-ietf-httpbis-digest-headers-13, Section 4: Digest Fields  }
  MHD_HTTP_HEADER_WANT_REPR_DIGEST = 'Want-Repr-Digest';  
{ Permanent.     Fetch  }
  MHD_HTTP_HEADER_X_CONTENT_TYPE_OPTIONS = 'X-Content-Type-Options';  
{ Permanent.     HTML  }
  MHD_HTTP_HEADER_X_FRAME_OPTIONS = 'X-Frame-Options';  
{ Provisional.   AMP-Cache-Transform HTTP request header  }
  MHD_HTTP_HEADER_AMP_CACHE_TRANSFORM = 'AMP-Cache-Transform';  
{ Provisional.   OSLC Configuration Management Version 1.0. Part 3: Configuration Specification  }
  MHD_HTTP_HEADER_CONFIGURATION_CONTEXT = 'Configuration-Context';  
{ Provisional.   RFC 6017: Electronic Data Interchange - Internet Integration (EDIINT) Features Header Field  }
  MHD_HTTP_HEADER_EDIINT_FEATURES = 'EDIINT-Features';  
{ Provisional.   OData Version 4.01 Part 1: Protocol; OASIS; Chet_Ensign  }
  MHD_HTTP_HEADER_ISOLATION = 'Isolation';  
{ Provisional.   Permissions Policy  }
  MHD_HTTP_HEADER_PERMISSIONS_POLICY = 'Permissions-Policy';  
{ Provisional.   Repeatable Requests Version 1.0; OASIS; Chet_Ensign  }
  MHD_HTTP_HEADER_REPEATABILITY_CLIENT_ID = 'Repeatability-Client-ID';  
{ Provisional.   Repeatable Requests Version 1.0; OASIS; Chet_Ensign  }
  MHD_HTTP_HEADER_REPEATABILITY_FIRST_SENT = 'Repeatability-First-Sent';  
{ Provisional.   Repeatable Requests Version 1.0; OASIS; Chet_Ensign  }
  MHD_HTTP_HEADER_REPEATABILITY_REQUEST_ID = 'Repeatability-Request-ID';  
{ Provisional.   Repeatable Requests Version 1.0; OASIS; Chet_Ensign  }
  MHD_HTTP_HEADER_REPEATABILITY_RESULT = 'Repeatability-Result';  
{ Provisional.   Reporting API  }
  MHD_HTTP_HEADER_REPORTING_ENDPOINTS = 'Reporting-Endpoints';  
{ Provisional.   Global Privacy Control (GPC)  }
  MHD_HTTP_HEADER_SEC_GPC = 'Sec-GPC';  
{ Provisional.   Resource Timing Level 1  }
  MHD_HTTP_HEADER_TIMING_ALLOW_ORIGIN = 'Timing-Allow-Origin';  
{ Deprecated.    PEP - an Extension Mechanism for HTTP; status-change-http-experiments-to-historic  }
  MHD_HTTP_HEADER_C_PEP_INFO = 'C-PEP-Info';  
{ Deprecated.    White Paper: Joint Electronic Payment Initiative  }
  MHD_HTTP_HEADER_PROTOCOL_INFO = 'Protocol-Info';  
{ Deprecated.    White Paper: Joint Electronic Payment Initiative  }
  MHD_HTTP_HEADER_PROTOCOL_QUERY = 'Protocol-Query';  
{ Obsoleted.     Access Control for Cross-site Requests  }
  MHD_HTTP_HEADER_ACCESS_CONTROL = 'Access-Control';  
{ Obsoleted.     RFC 2774: An HTTP Extension Framework; status-change-http-experiments-to-historic  }
  MHD_HTTP_HEADER_C_EXT = 'C-Ext';  
{ Obsoleted.     RFC 2774: An HTTP Extension Framework; status-change-http-experiments-to-historic  }
  MHD_HTTP_HEADER_C_MAN = 'C-Man';  
{ Obsoleted.     RFC 2774: An HTTP Extension Framework; status-change-http-experiments-to-historic  }
  MHD_HTTP_HEADER_C_OPT = 'C-Opt';  
{ Obsoleted.     PEP - an Extension Mechanism for HTTP; status-change-http-experiments-to-historic  }
  MHD_HTTP_HEADER_C_PEP = 'C-PEP';  
{ Obsoleted.     RFC 2068: Hypertext Transfer Protocol -- HTTP/1.1; RFC 2616: Hypertext Transfer Protocol -- HTTP/1.1  }
  MHD_HTTP_HEADER_CONTENT_BASE = 'Content-Base';  
{ Obsoleted.     RFC 2616, Section 14.15: Hypertext Transfer Protocol -- HTTP/1.1; RFC 7231, Appendix B: Hypertext Transfer Protocol (HTTP/1.1): Semantics and Content  }
  MHD_HTTP_HEADER_CONTENT_MD5 = 'Content-MD5';  
{ Obsoleted.     HTML 4.01 Specification  }
  MHD_HTTP_HEADER_CONTENT_SCRIPT_TYPE = 'Content-Script-Type';  
{ Obsoleted.     HTML 4.01 Specification  }
  MHD_HTTP_HEADER_CONTENT_STYLE_TYPE = 'Content-Style-Type';  
{ Obsoleted.     RFC 2068: Hypertext Transfer Protocol -- HTTP/1.1  }
  MHD_HTTP_HEADER_CONTENT_VERSION = 'Content-Version';  
{ Obsoleted.     RFC 2965: HTTP State Management Mechanism; RFC 6265: HTTP State Management Mechanism  }
  MHD_HTTP_HEADER_COOKIE2 = 'Cookie2';  
{ Obsoleted.     HTML 4.01 Specification  }
  MHD_HTTP_HEADER_DEFAULT_STYLE = 'Default-Style';  
{ Obsoleted.     RFC 2068: Hypertext Transfer Protocol -- HTTP/1.1  }
  MHD_HTTP_HEADER_DERIVED_FROM = 'Derived-From';  
{ Obsoleted.     RFC 3230: Instance Digests in HTTP; RFC-ietf-httpbis-digest-headers-13, Section 1.3: Digest Fields  }
  MHD_HTTP_HEADER_DIGEST = 'Digest';  
{ Obsoleted.     RFC 2774: An HTTP Extension Framework; status-change-http-experiments-to-historic  }
  MHD_HTTP_HEADER_EXT = 'Ext';  
{ Obsoleted.     Implementation of OPS Over HTTP  }
  MHD_HTTP_HEADER_GETPROFILE = 'GetProfile';  
{ Obsoleted.     RFC 7540, Section 3.2.1: Hypertext Transfer Protocol Version 2 (HTTP/2)  }
  MHD_HTTP_HEADER_HTTP2_SETTINGS = 'HTTP2-Settings';  
{ Obsoleted.     RFC 2774: An HTTP Extension Framework; status-change-http-experiments-to-historic  }
  MHD_HTTP_HEADER_MAN = 'Man';  
{ Obsoleted.     Access Control for Cross-site Requests  }
  MHD_HTTP_HEADER_METHOD_CHECK = 'Method-Check';  
{ Obsoleted.     Access Control for Cross-site Requests  }
  MHD_HTTP_HEADER_METHOD_CHECK_EXPIRES = 'Method-Check-Expires';  
{ Obsoleted.     RFC 2774: An HTTP Extension Framework; status-change-http-experiments-to-historic  }
  MHD_HTTP_HEADER_OPT = 'Opt';  
{ Obsoleted.     The Platform for Privacy Preferences 1.0 (P3P1.0) Specification  }
  MHD_HTTP_HEADER_P3P = 'P3P';  
{ Obsoleted.     PEP - an Extension Mechanism for HTTP  }
  MHD_HTTP_HEADER_PEP = 'PEP';  
{ Obsoleted.     PEP - an Extension Mechanism for HTTP  }
  MHD_HTTP_HEADER_PEP_INFO = 'Pep-Info';  
{ Obsoleted.     PICS Label Distribution Label Syntax and Communication Protocols  }
  MHD_HTTP_HEADER_PICS_LABEL = 'PICS-Label';  
{ Obsoleted.     Implementation of OPS Over HTTP  }
  MHD_HTTP_HEADER_PROFILEOBJECT = 'ProfileObject';  
{ Obsoleted.     PICS Label Distribution Label Syntax and Communication Protocols  }
  MHD_HTTP_HEADER_PROTOCOL = 'Protocol';  
{ Obsoleted.     PICS Label Distribution Label Syntax and Communication Protocols  }
  MHD_HTTP_HEADER_PROTOCOL_REQUEST = 'Protocol-Request';  
{ Obsoleted.     Notification for Proxy Caches  }
  MHD_HTTP_HEADER_PROXY_FEATURES = 'Proxy-Features';  
{ Obsoleted.     Notification for Proxy Caches  }
  MHD_HTTP_HEADER_PROXY_INSTRUCTION = 'Proxy-Instruction';  
{ Obsoleted.     RFC 2068: Hypertext Transfer Protocol -- HTTP/1.1  }
  MHD_HTTP_HEADER_PUBLIC = 'Public';  
{ Obsoleted.     Access Control for Cross-site Requests  }
  MHD_HTTP_HEADER_REFERER_ROOT = 'Referer-Root';  
{ Obsoleted.     RFC 2310: The Safe Response Header Field; status-change-http-experiments-to-historic  }
  MHD_HTTP_HEADER_SAFE = 'Safe';  
{ Obsoleted.     RFC 2660: The Secure HyperText Transfer Protocol; status-change-http-experiments-to-historic  }
  MHD_HTTP_HEADER_SECURITY_SCHEME = 'Security-Scheme';  
{ Obsoleted.     RFC 2965: HTTP State Management Mechanism; RFC 6265: HTTP State Management Mechanism  }
  MHD_HTTP_HEADER_SET_COOKIE2 = 'Set-Cookie2';  
{ Obsoleted.     Implementation of OPS Over HTTP  }
  MHD_HTTP_HEADER_SETPROFILE = 'SetProfile';  
{ Obsoleted.     RFC 2068: Hypertext Transfer Protocol -- HTTP/1.1  }
  MHD_HTTP_HEADER_URI = 'URI';  
{ Obsoleted.     RFC 3230: Instance Digests in HTTP; RFC-ietf-httpbis-digest-headers-13, Section 1.3: Digest Fields  }
  MHD_HTTP_HEADER_WANT_DIGEST = 'Want-Digest';  
{ Obsoleted.     RFC9111, Section 5.5: HTTP Caching  }
  MHD_HTTP_HEADER_WARNING = 'Warning';  
{ Headers removed from the registry. Do not use!  }
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_COMPLIANCE = 'Compliance';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_CONTENT_TRANSFER_ENCODING = 'Content-Transfer-Encoding';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_COST = 'Cost';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_MESSAGE_ID = 'Message-ID';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_NON_COMPLIANCE = 'Non-Compliance';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_OPTIONAL = 'Optional';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_RESOLUTION_HINT = 'Resolution-Hint';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_RESOLVER_LOCATION = 'Resolver-Location';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_SUBOK = 'SubOK';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_SUBST = 'Subst';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_TITLE = 'Title';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_UA_COLOR = 'UA-Color';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_UA_MEDIA = 'UA-Media';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_UA_PIXELS = 'UA-Pixels';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_UA_RESOLUTION = 'UA-Resolution';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_UA_WINDOWPIXELS = 'UA-Windowpixels';  
{ Obsoleted.     RFC4229  }
  MHD_HTTP_HEADER_VERSION = 'Version';  
{ Obsoleted.     W3C Mobile Web Best Practices Working Group  }
  MHD_HTTP_HEADER_X_DEVICE_ACCEPT = 'X-Device-Accept';  
{ Obsoleted.     W3C Mobile Web Best Practices Working Group  }
  MHD_HTTP_HEADER_X_DEVICE_ACCEPT_CHARSET = 'X-Device-Accept-Charset';  
{ Obsoleted.     W3C Mobile Web Best Practices Working Group  }
  MHD_HTTP_HEADER_X_DEVICE_ACCEPT_ENCODING = 'X-Device-Accept-Encoding';  
{ Obsoleted.     W3C Mobile Web Best Practices Working Group  }
  MHD_HTTP_HEADER_X_DEVICE_ACCEPT_LANGUAGE = 'X-Device-Accept-Language';  
{ Obsoleted.     W3C Mobile Web Best Practices Working Group  }
  MHD_HTTP_HEADER_X_DEVICE_USER_AGENT = 'X-Device-User-Agent';  
{* @  }{ end of group headers  }
{*
 * @defgroup versions HTTP versions
 * These strings should be used to match against the first line of the
 * HTTP header.
 * @
  }
  MHD_HTTP_VERSION_1_0 = 'HTTP/1.0';  
  MHD_HTTP_VERSION_1_1 = 'HTTP/1.1';  
{* @  }{ end of group versions  }
{*
 * @defgroup methods HTTP methods
 * HTTP methods (as strings).
 * See: https://www.iana.org/assignments/http-methods/http-methods.xml
 * Registry export date: 2023-10-02
 * @
  }
{ Main HTTP methods.  }
{ Safe.     Idempotent.     RFC9110, Section 9.3.1.  }
  MHD_HTTP_METHOD_GET = 'GET';  
{ Safe.     Idempotent.     RFC9110, Section 9.3.2.  }
  MHD_HTTP_METHOD_HEAD = 'HEAD';  
{ Not safe. Not idempotent. RFC9110, Section 9.3.3.  }
  MHD_HTTP_METHOD_POST = 'POST';  
{ Not safe. Idempotent.     RFC9110, Section 9.3.4.  }
  MHD_HTTP_METHOD_PUT = 'PUT';  
{ Not safe. Idempotent.     RFC9110, Section 9.3.5.  }
  MHD_HTTP_METHOD_DELETE = 'DELETE';  
{ Not safe. Not idempotent. RFC9110, Section 9.3.6.  }
  MHD_HTTP_METHOD_CONNECT = 'CONNECT';  
{ Safe.     Idempotent.     RFC9110, Section 9.3.7.  }
  MHD_HTTP_METHOD_OPTIONS = 'OPTIONS';  
{ Safe.     Idempotent.     RFC9110, Section 9.3.8.  }
  MHD_HTTP_METHOD_TRACE = 'TRACE';  
{ Additional HTTP methods.  }
{ Not safe. Idempotent.     RFC3744, Section 8.1.  }
  MHD_HTTP_METHOD_ACL = 'ACL';  
{ Not safe. Idempotent.     RFC3253, Section 12.6.  }
  MHD_HTTP_METHOD_BASELINE_CONTROL = 'BASELINE-CONTROL';  
{ Not safe. Idempotent.     RFC5842, Section 4.  }
  MHD_HTTP_METHOD_BIND = 'BIND';  
{ Not safe. Idempotent.     RFC3253, Section 4.4, Section 9.4.  }
  MHD_HTTP_METHOD_CHECKIN = 'CHECKIN';  
{ Not safe. Idempotent.     RFC3253, Section 4.3, Section 8.8.  }
  MHD_HTTP_METHOD_CHECKOUT = 'CHECKOUT';  
{ Not safe. Idempotent.     RFC4918, Section 9.8.  }
  MHD_HTTP_METHOD_COPY = 'COPY';  
{ Not safe. Idempotent.     RFC3253, Section 8.2.  }
  MHD_HTTP_METHOD_LABEL = 'LABEL';  
{ Not safe. Idempotent.     RFC2068, Section 19.6.1.2.  }
  MHD_HTTP_METHOD_LINK = 'LINK';  
{ Not safe. Not idempotent. RFC4918, Section 9.10.  }
  MHD_HTTP_METHOD_LOCK = 'LOCK';  
{ Not safe. Idempotent.     RFC3253, Section 11.2.  }
  MHD_HTTP_METHOD_MERGE = 'MERGE';  
{ Not safe. Idempotent.     RFC3253, Section 13.5.  }
  MHD_HTTP_METHOD_MKACTIVITY = 'MKACTIVITY';  
{ Not safe. Idempotent.     RFC4791, Section 5.3.1; RFC8144, Section 2.3.  }
  MHD_HTTP_METHOD_MKCALENDAR = 'MKCALENDAR';  
{ Not safe. Idempotent.     RFC4918, Section 9.3; RFC5689, Section 3; RFC8144, Section 2.3.  }
  MHD_HTTP_METHOD_MKCOL = 'MKCOL';  
{ Not safe. Idempotent.     RFC4437, Section 6.  }
  MHD_HTTP_METHOD_MKREDIRECTREF = 'MKREDIRECTREF';  
{ Not safe. Idempotent.     RFC3253, Section 6.3.  }
  MHD_HTTP_METHOD_MKWORKSPACE = 'MKWORKSPACE';  
{ Not safe. Idempotent.     RFC4918, Section 9.9.  }
  MHD_HTTP_METHOD_MOVE = 'MOVE';  
{ Not safe. Idempotent.     RFC3648, Section 7.  }
  MHD_HTTP_METHOD_ORDERPATCH = 'ORDERPATCH';  
{ Not safe. Not idempotent. RFC5789, Section 2.  }
  MHD_HTTP_METHOD_PATCH = 'PATCH';  
{ Safe.     Idempotent.     RFC9113, Section 3.4.  }
  MHD_HTTP_METHOD_PRI = 'PRI';  
{ Safe.     Idempotent.     RFC4918, Section 9.1; RFC8144, Section 2.1.  }
  MHD_HTTP_METHOD_PROPFIND = 'PROPFIND';  
{ Not safe. Idempotent.     RFC4918, Section 9.2; RFC8144, Section 2.2.  }
  MHD_HTTP_METHOD_PROPPATCH = 'PROPPATCH';  
{ Not safe. Idempotent.     RFC5842, Section 6.  }
  MHD_HTTP_METHOD_REBIND = 'REBIND';  
{ Safe.     Idempotent.     RFC3253, Section 3.6; RFC8144, Section 2.1.  }
  MHD_HTTP_METHOD_REPORT = 'REPORT';  
{ Safe.     Idempotent.     RFC5323, Section 2.  }
  MHD_HTTP_METHOD_SEARCH = 'SEARCH';  
{ Not safe. Idempotent.     RFC5842, Section 5.  }
  MHD_HTTP_METHOD_UNBIND = 'UNBIND';  
{ Not safe. Idempotent.     RFC3253, Section 4.5.  }
  MHD_HTTP_METHOD_UNCHECKOUT = 'UNCHECKOUT';  
{ Not safe. Idempotent.     RFC2068, Section 19.6.1.3.  }
  MHD_HTTP_METHOD_UNLINK = 'UNLINK';  
{ Not safe. Idempotent.     RFC4918, Section 9.11.  }
  MHD_HTTP_METHOD_UNLOCK = 'UNLOCK';  
{ Not safe. Idempotent.     RFC3253, Section 7.1.  }
  MHD_HTTP_METHOD_UPDATE = 'UPDATE';  
{ Not safe. Idempotent.     RFC4437, Section 7.  }
  MHD_HTTP_METHOD_UPDATEREDIRECTREF = 'UPDATEREDIRECTREF';  
{ Not safe. Idempotent.     RFC3253, Section 3.5.  }
  MHD_HTTP_METHOD_VERSION_CONTROL = 'VERSION-CONTROL';  
{ Not safe. Not idempotent. RFC9110, Section 18.2.  }
  MHD_HTTP_METHOD_ASTERISK = '*';  
{* @  }{ end of group methods  }
{*
 * @defgroup postenc HTTP POST encodings
 * See also: http://www.w3.org/TR/html4/interact/forms.html#h-17.13.4
 * @
  }
  MHD_HTTP_POST_ENCODING_FORM_URLENCODED = 'application/x-www-form-urlencoded';  
  MHD_HTTP_POST_ENCODING_MULTIPART_FORMDATA = 'multipart/form-data';  
{* @  }{ end of group postenc  }
{*
 * @brief Handle for the daemon (listening on a socket for HTTP traffic).
 * @ingroup event
  }
type
  PMHD_Daemon = ^TMHD_Daemon;
  TMHD_Daemon = record
      {undefined structure}
    end;

{*
 * @brief Handle for a connection / HTTP request.
 *
 * With HTTP/1.1, multiple requests can be run over the same
 * connection.  However, MHD will only show one request per TCP
 * connection to the client at any given time.
 * @ingroup request
  }
  PMHD_Connection = ^TMHD_Connection;
  TMHD_Connection = record
      {undefined structure}
    end;

{*
 * @brief Handle for a response.
 * @ingroup response
  }
  PMHD_Response = ^TMHD_Response;
  TMHD_Response = record
      {undefined structure}
    end;

{*
 * @brief Handle for POST processing.
 * @ingroup response
  }
  PMHD_PostProcessor = ^TMHD_PostProcessor;
  TMHD_PostProcessor = record
      {undefined structure}
    end;

{*
 * @brief Flags for the `struct MHD_Daemon`.
 *
 * Note that MHD will run automatically in background thread(s) only
 * if #MHD_USE_INTERNAL_POLLING_THREAD is used. Otherwise caller (application)
 * must use #MHD_run() or #MHD_run_from_select() to have MHD processed
 * network connections and data.
 *
 * Starting the daemon may also fail if a particular option is not
 * implemented or not supported on the target platform (i.e. no
 * support for TLS, epoll or IPv6).
  }
{*
   * No options selected.
    }
{*
   * Print errors messages to custom error logger or to `stderr` if
   * custom error logger is not set.
   * @sa ::MHD_OPTION_EXTERNAL_LOGGER
    }
{*
   * Run in debug mode.  If this flag is used, the library should
   * print error messages and warnings to `stderr`.
    }
{*
   * Run in HTTPS mode.  The modern protocol is called TLS.
    }
{* @deprecated  }
{*
   * Run using one thread per connection.
   * Must be used only with #MHD_USE_INTERNAL_POLLING_THREAD.
   *
   * If #MHD_USE_ITC is also not used, closed and expired connections may only
   * be cleaned up internally when a new connection is received.
   * Consider adding of #MHD_USE_ITC flag to have faster internal cleanups
   * at very minor increase in system resources usage.
    }
{*
   * Run using an internal thread (or thread pool) for sockets sending
   * and receiving and data processing. Without this flag MHD will not
   * run automatically in background thread(s).
   * If this flag is set, #MHD_run() and #MHD_run_from_select() couldn't
   * be used.
   * This flag is set explicitly by #MHD_USE_POLL_INTERNAL_THREAD and
   * by #MHD_USE_EPOLL_INTERNAL_THREAD.
   * When this flag is not set, MHD run in "external" polling mode.
    }
{* @deprecated  }
{*
   * Run using the IPv6 protocol (otherwise, MHD will just support
   * IPv4).  If you want MHD to support IPv4 and IPv6 using a single
   * socket, pass #MHD_USE_DUAL_STACK, otherwise, if you only pass
   * this option, MHD will try to bind to IPv6-only (resulting in
   * no IPv4 support).
    }
{*
   * Be pedantic about the protocol (as opposed to as tolerant as
   * possible).
   * This flag is equivalent to setting 1 as #MHD_OPTION_CLIENT_DISCIPLINE_LVL
   * value.
   * @sa #MHD_OPTION_CLIENT_DISCIPLINE_LVL
    }
{*
   * Use `poll()` instead of `select()` for polling sockets.
   * This allows sockets with `fd >= FD_SETSIZE`.
   * This option is not compatible with an "external" polling mode
   * (as there is no API to get the file descriptors for the external
   * poll() from MHD) and must also not be used in combination
   * with #MHD_USE_EPOLL.
   * @sa ::MHD_FEATURE_POLL, #MHD_USE_POLL_INTERNAL_THREAD
    }
{*
   * Run using an internal thread (or thread pool) doing `poll()`.
   * @sa ::MHD_FEATURE_POLL, #MHD_USE_POLL, #MHD_USE_INTERNAL_POLLING_THREAD
    }
{* @deprecated  }
{*
   * Suppress (automatically) adding the 'Date:' header to HTTP responses.
   * This option should ONLY be used on systems that do not have a clock
   * and that DO provide other mechanisms for cache control.  See also
   * RFC 2616, section 14.18 (exception 3).
    }
{* @deprecated  }
{*
   * Run without a listen socket.  This option only makes sense if
   * #MHD_add_connection is to be used exclusively to connect HTTP
   * clients to the HTTP server.  This option is incompatible with
   * using a thread pool; if it is used, #MHD_OPTION_THREAD_POOL_SIZE
   * is ignored.
    }
{*
   * Use `epoll()` instead of `select()` or `poll()` for the event loop.
   * This option is only available on some systems; using the option on
   * systems without epoll will cause #MHD_start_daemon to fail.  Using
   * this option is not supported with #MHD_USE_THREAD_PER_CONNECTION.
   * @sa ::MHD_FEATURE_EPOLL
    }
{* @deprecated  }
{*
   * Run using an internal thread (or thread pool) doing `epoll` polling.
   * This option is only available on certain platforms; using the option on
   * platform without `epoll` support will cause #MHD_start_daemon to fail.
   * @sa ::MHD_FEATURE_EPOLL, #MHD_USE_EPOLL, #MHD_USE_INTERNAL_POLLING_THREAD
    }
{* @deprecated  }
{* @deprecated  }
{*
   * Use inter-thread communication channel.
   * #MHD_USE_ITC can be used with #MHD_USE_INTERNAL_POLLING_THREAD
   * and is ignored with any "external" sockets polling.
   * It's required for use of #MHD_quiesce_daemon
   * or #MHD_add_connection.
   * This option is enforced by #MHD_ALLOW_SUSPEND_RESUME or
   * #MHD_USE_NO_LISTEN_SOCKET.
   * #MHD_USE_ITC is always used automatically on platforms
   * where select()/poll()/other ignore shutdown of listen
   * socket.
    }
{* @deprecated  }
{*
   * Use a single socket for IPv4 and IPv6.
    }
{*
   * Enable `turbo`.  Disables certain calls to `shutdown()`,
   * enables aggressive non-blocking optimistic reads and
   * other potentially unsafe optimizations.
   * Most effects only happen with #MHD_USE_EPOLL.
    }
{* @deprecated  }
{*
   * Enable suspend/resume functions, which also implies setting up
   * ITC to signal resume.
    }
{* @deprecated  }
{*
   * Enable TCP_FASTOPEN option.  This option is only available on Linux with a
   * kernel >= 3.6.  On other systems, using this option cases #MHD_start_daemon
   * to fail.
    }
{*
   * You need to set this option if you want to use HTTP "Upgrade".
   * "Upgrade" may require usage of additional internal resources,
   * which we do not want to use unless necessary.
    }
{*
   * Automatically use best available polling function.
   * Choice of polling function is also depend on other daemon options.
   * If #MHD_USE_INTERNAL_POLLING_THREAD is specified then epoll, poll() or
   * select() will be used (listed in decreasing preference order, first
   * function available on system will be used).
   * If #MHD_USE_THREAD_PER_CONNECTION is specified then poll() or select()
   * will be used.
   * If those flags are not specified then epoll or select() will be
   * used (as the only suitable for MHD_get_fdset())
    }
{*
   * Run using an internal thread (or thread pool) with best available on
   * system polling function.
   * This is combination of #MHD_USE_AUTO and #MHD_USE_INTERNAL_POLLING_THREAD
   * flags.
    }
{*
   * Flag set to enable post-handshake client authentication
   * (only useful in combination with #MHD_USE_TLS).
    }
{*
   * Flag set to enable TLS 1.3 early data.  This has
   * security implications, be VERY careful when using this.
    }
{*
   * Indicates that MHD daemon will be used by application in single-threaded
   * mode only.  When this flag is set then application must call any MHD
   * function only within a single thread.
   * This flag turns off some internal thread-safety and allows MHD making
   * some of the internal optimisations suitable only for single-threaded
   * environment.
   * Not compatible with #MHD_USE_INTERNAL_POLLING_THREAD.
   * @note Available since #MHD_VERSION 0x00097707
    }
  TMHD_FLAG =  Longint;
  Const
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

{*
 * Type of a callback function used for logging by MHD.
 *
 * @param cls closure
 * @param fm format string (`printf()`-style)
 * @param ap arguments to @a fm
 * @ingroup logging
  }
type

  TMHD_LogCallback = procedure (cls:pointer; fm:Pchar; ap:Tva_list);cdecl;
{*
 * Function called to lookup the pre shared key (@a psk) for a given
 * HTTP connection based on the @a username.
 *
 * @param cls closure
 * @param connection the HTTPS connection
 * @param username the user name claimed by the other side
 * @param[out] psk to be set to the pre-shared-key; should be allocated with malloc(),
 *                 will be freed by MHD
 * @param[out] psk_size to be set to the number of bytes in @a psk
 * @return 0 on success, -1 on errors
  }

  TMHD_PskServerCredentialsCallback = function (cls:pointer; connection:PMHD_Connection; username:Pchar; psk:Ppointer; psk_size:Psize_t):longint;cdecl;
{*
 * Values for #MHD_OPTION_DIGEST_AUTH_NONCE_BIND_TYPE.
 *
 * These values can limit the scope of validity of MHD-generated nonces.
 * Values can be combined with bitwise OR.
 * Any value, except #MHD_DAUTH_BIND_NONCE_NONE, enforce function
 * #MHD_digest_auth_check3() (and similar functions) to check nonce by
 * re-generating it again with the same parameters, which is CPU-intensive
 * operation.
 * @note Available since #MHD_VERSION 0x00097701
  }
{*
   * Generated nonces are valid for any request from any client until expired.
   * This is default and recommended value.
   * #MHD_digest_auth_check3() (and similar functions) would check only whether
   * the nonce value that is used by client has been generated by MHD and not
   * expired yet.
   * It is recommended because RFC 7616 allows clients to use the same nonce
   * for any request in the same "protection space".
   * When checking client's authorisation requests CPU is loaded less if this
   * value is used.
   * This mode gives MHD maximum flexibility for nonces generation and can
   * prevent possible nonce collisions (and corresponding log warning messages)
   * when clients' requests are intensive.
   * This value cannot be biwise-OR combined with other values.
    }
{*
   * Generated nonces are valid only for the same realm.
    }
{*
   * Generated nonces are valid only for the same URI (excluding parameters
   * after '?' in URI) and request method (GET, POST etc).
   * Not recommended unless "protection space" is limited to a single URI as
   * RFC 7616 allows clients to re-use server-generated nonces for any URI
   * in the same "protection space" which by default consists of all server
   * URIs.
   * Before #MHD_VERSION 0x00097701 this was default (and only supported)
   * nonce bind type.
    }
{*
   * Generated nonces are valid only for the same URI including URI parameters
   * and request method (GET, POST etc).
   * This value implies #MHD_DAUTH_BIND_NONCE_URI.
   * Not recommended for that same reasons as #MHD_DAUTH_BIND_NONCE_URI.
    }
{*
   * Generated nonces are valid only for the single client's IP.
   * While it looks like security improvement, in practice the same client may
   * jump from one IP to another (mobile or Wi-Fi handover, DHCP re-assignment,
   * Multi-NAT, different proxy chain and other reasons), while IP address
   * spoofing could be used relatively easily.
    }
  TMHD_DAuthBindNonce =  Longint;
  Const
    MHD_DAUTH_BIND_NONCE_NONE = 0;
    MHD_DAUTH_BIND_NONCE_REALM = 1 shl 0;
    MHD_DAUTH_BIND_NONCE_URI = 1 shl 1;
    MHD_DAUTH_BIND_NONCE_URI_PARAMS = 1 shl 2;
    MHD_DAUTH_BIND_NONCE_CLIENT_IP = 1 shl 3;

{*
 * @brief MHD options.
 *
 * Passed in the varargs portion of #MHD_start_daemon.
  }
{*
   * No more options / last option.  This is used
   * to terminate the VARARGs list.
    }
{*
   * Maximum memory size per connection (followed by a `size_t`).
   * Default is 32 kb (#MHD_POOL_SIZE_DEFAULT).
   * Values above 128k are unlikely to result in much benefit, as half
   * of the memory will be typically used for IO, and TCP buffers are
   * unlikely to support window sizes above 64k on most systems.
   * Values below 64 bytes are completely unusable.
   * Since #MHD_VERSION 0x00097710 silently ignored if followed by zero value.
    }
{*
   * Maximum number of concurrent connections to
   * accept (followed by an `unsigned int`).
    }
{*
   * After how many seconds of inactivity should a
   * connection automatically be timed out? (followed
   * by an `unsigned int`; use zero for no timeout).
   * Values larger than (UINT64_MAX / 2000 - 1) will
   * be clipped to this number.
    }
{*
   * Register a function that should be called whenever a request has
   * been completed (this can be used for application-specific clean
   * up).  Requests that have never been presented to the application
   * (via #MHD_AccessHandlerCallback) will not result in
   * notifications.
   *
   * This option should be followed by TWO pointers.  First a pointer
   * to a function of type #MHD_RequestCompletedCallback and second a
   * pointer to a closure to pass to the request completed callback.
   * The second pointer may be NULL.
    }
{*
   * Limit on the number of (concurrent) connections made to the
   * server from the same IP address.  Can be used to prevent one
   * IP from taking over all of the allowed connections.  If the
   * same IP tries to establish more than the specified number of
   * connections, they will be immediately rejected.  The option
   * should be followed by an `unsigned int`.  The default is
   * zero, which means no limit on the number of connections
   * from the same IP address.
    }
{*
   * Bind daemon to the supplied `struct sockaddr`. This option should
   * be followed by a `struct sockaddr *`.  If #MHD_USE_IPv6 is
   * specified, the `struct sockaddr*` should point to a `struct
   * sockaddr_in6`, otherwise to a `struct sockaddr_in`.
   * Silently ignored if followed by NULL pointer.
   * @deprecated Use #MHD_OPTION_SOCK_ADDR_LEN
    }
{*
   * Specify a function that should be called before parsing the URI from
   * the client.  The specified callback function can be used for processing
   * the URI (including the options) before it is parsed.  The URI after
   * parsing will no longer contain the options, which maybe inconvenient for
   * logging.  This option should be followed by two arguments, the first
   * one must be of the form
   *
   *     void * my_logger(void *cls, const char *uri, struct MHD_Connection *con)
   *
   * where the return value will be passed as
   * (`* req_cls`) in calls to the #MHD_AccessHandlerCallback
   * when this request is processed later; returning a
   * value of NULL has no special significance (however,
   * note that if you return non-NULL, you can no longer
   * rely on the first call to the access handler having
   * `NULL == *req_cls` on entry;)
   * "cls" will be set to the second argument following
   * #MHD_OPTION_URI_LOG_CALLBACK.  Finally, uri will
   * be the 0-terminated URI of the request.
   *
   * Note that during the time of this call, most of the connection's
   * state is not initialized (as we have not yet parsed the headers).
   * However, information about the connecting client (IP, socket)
   * is available.
   *
   * The specified function is called only once per request, therefore some
   * programmers may use it to instantiate their own request objects, freeing
   * them in the notifier #MHD_OPTION_NOTIFY_COMPLETED.
    }
{*
   * Memory pointer for the private key (key.pem) to be used by the
   * HTTPS daemon.  This option should be followed by a
   * `const char *` argument.
   * This should be used in conjunction with #MHD_OPTION_HTTPS_MEM_CERT.
    }
{*
   * Memory pointer for the certificate (cert.pem) to be used by the
   * HTTPS daemon.  This option should be followed by a
   * `const char *` argument.
   * This should be used in conjunction with #MHD_OPTION_HTTPS_MEM_KEY.
    }
{*
   * Daemon credentials type.
   * Followed by an argument of type
   * `gnutls_credentials_type_t`.
    }
{*
   * Memory pointer to a `const char *` specifying the GnuTLS priorities string.
   * If this options is not specified, then MHD will try the following strings:
   * * "@LIBMICROHTTPD" (application-specific system-wide configuration)
   * * "@SYSTEM"        (system-wide configuration)
   * * default GnuTLS priorities string
   * * "NORMAL"
   * The first configuration accepted by GnuTLS will be used.
   * For more details see GnuTLS documentation for "Application-specific
   * priority strings".
    }
{*
   * Pass a listen socket for MHD to use (systemd-style).  If this
   * option is used, MHD will not open its own listen socket(s). The
   * argument passed must be of type `MHD_socket` and refer to an
   * existing socket that has been bound to a port and is listening.
   * If followed by MHD_INVALID_SOCKET value, MHD ignores this option
   * and creates socket by itself.
    }
{*
   * Use the given function for logging error messages.  This option
   * must be followed by two arguments; the first must be a pointer to
   * a function of type #MHD_LogCallback and the second a pointer
   * `void *` which will be passed as the first argument to the log
   * callback.
   * Should be specified as the first option, otherwise some messages
   * may be printed by standard MHD logger during daemon startup.
   *
   * Note that MHD will not generate any log messages
   * if it was compiled without the "--enable-messages"
   * flag being set.
    }
{*
   * Number (`unsigned int`) of threads in thread pool. Enable
   * thread pooling by setting this value to to something
   * greater than 1.
   * Can be used only for daemons started with #MHD_USE_INTERNAL_POLLING_THREAD.
   * Ignored if followed by zero value.
    }
{*
   * Additional options given in an array of `struct MHD_OptionItem`.
   * The array must be terminated with an entry `MHD_OPTION_END, 0, NULL`.
   * An example for code using #MHD_OPTION_ARRAY is:
   *
   *     struct MHD_OptionItem ops[] = 
   *        MHD_OPTION_CONNECTION_LIMIT, 100, NULL ,
   *        MHD_OPTION_CONNECTION_TIMEOUT, 10, NULL ,
   *        MHD_OPTION_END, 0, NULL 
   *     ;
   *     d = MHD_start_daemon (0, 8080, NULL, NULL, dh, NULL,
   *                           MHD_OPTION_ARRAY, ops,
   *                           MHD_OPTION_END);
   *
   * For options that expect a single pointer argument, the
   * 'value' member of the `struct MHD_OptionItem` is ignored.
   * For options that expect two pointer arguments, the first
   * argument must be cast to `intptr_t`.
    }
{*
   * Specify a function that should be called for unescaping escape
   * sequences in URIs and URI arguments.  Note that this function
   * will NOT be used by the `struct MHD_PostProcessor`.  If this
   * option is not specified, the default method will be used which
   * decodes escape sequences of the form "%HH".  This option should
   * be followed by two arguments, the first one must be of the form
   *
   *     size_t my_unescaper(void *cls,
   *                         struct MHD_Connection *c,
   *                         char *s)
   *
   * where the return value must be the length of the value left in
   * "s" (without the 0-terminator) and "s" should be updated.  Note
   * that the unescape function must not lengthen "s" (the result must
   * be shorter than the input and must still be 0-terminated).
   * However, it may also include binary zeros before the
   * 0-termination.  "cls" will be set to the second argument
   * following #MHD_OPTION_UNESCAPE_CALLBACK.
    }
{*
   * Memory pointer for the random values to be used by the Digest
   * Auth module. This option should be followed by two arguments.
   * First an integer of type `size_t` which specifies the size
   * of the buffer pointed to by the second argument in bytes.
   * The recommended size is between 8 and 32. If size is four or less
   * then security could be lowered. Sizes more then 32 (or, probably
   * more than 16 - debatable) will not increase security.
   * Note that the application must ensure that the buffer of the
   * second argument remains allocated and unmodified while the
   * daemon is running.
   * @sa #MHD_OPTION_DIGEST_AUTH_RANDOM_COPY
    }
{*
   * Size of the internal array holding the map of the nonce and
   * the nonce counter. This option should be followed by an `unsigend int`
   * argument.
   * The map size is 4 by default, which is enough to communicate with
   * a single client at any given moment of time, but not enough to
   * handle several clients simultaneously.
   * If Digest Auth is not used, this option can be set to zero to minimise
   * memory allocation.
    }
{*
   * Desired size of the stack for threads created by MHD. Followed
   * by an argument of type `size_t`.  Use 0 for system default.
    }
{*
   * Memory pointer for the certificate (ca.pem) to be used by the
   * HTTPS daemon for client authentication.
   * This option should be followed by a `const char *` argument.
    }
{*
   * Increment to use for growing the read buffer (followed by a
   * `size_t`).
   * Must not be higher than 1/4 of #MHD_OPTION_CONNECTION_MEMORY_LIMIT.
   * Since #MHD_VERSION 0x00097710 silently ignored if followed by zero value.
    }
{*
   * Use a callback to determine which X.509 certificate should be
   * used for a given HTTPS connection.  This option should be
   * followed by a argument of type `gnutls_certificate_retrieve_function2 *`.
   * This option provides an
   * alternative to #MHD_OPTION_HTTPS_MEM_KEY,
   * #MHD_OPTION_HTTPS_MEM_CERT.  You must use this version if
   * multiple domains are to be hosted at the same IP address using
   * TLS's Server Name Indication (SNI) extension.  In this case,
   * the callback is expected to select the correct certificate
   * based on the SNI information provided.  The callback is expected
   * to access the SNI data using `gnutls_server_name_get()`.
   * Using this option requires GnuTLS 3.0 or higher.
    }
{*
   * When using #MHD_USE_TCP_FASTOPEN, this option changes the default TCP
   * fastopen queue length of 50.  Note that having a larger queue size can
   * cause resource exhaustion attack as the TCP stack has to now allocate
   * resources for the SYN packet along with its DATA.  This option should be
   * followed by an `unsigned int` argument.
    }
{*
   * Memory pointer for the Diffie-Hellman parameters (dh.pem) to be used by the
   * HTTPS daemon for key exchange.
   * This option must be followed by a `const char *` argument.
    }
{*
   * If present and set to true, allow reusing address:port socket
   * (by using SO_REUSEPORT on most platform, or platform-specific ways).
   * If present and set to false, disallow reusing address:port socket
   * (does nothing on most platform, but uses SO_EXCLUSIVEADDRUSE on Windows).
   * This option must be followed by a `unsigned int` argument.
    }
{*
   * Memory pointer for a password that decrypts the private key (key.pem)
   * to be used by the HTTPS daemon. This option should be followed by a
   * `const char *` argument.
   * This should be used in conjunction with #MHD_OPTION_HTTPS_MEM_KEY.
   * @sa ::MHD_FEATURE_HTTPS_KEY_PASSWORD
    }
{*
   * Register a function that should be called whenever a connection is
   * started or closed.
   *
   * This option should be followed by TWO pointers.  First a pointer
   * to a function of type #MHD_NotifyConnectionCallback and second a
   * pointer to a closure to pass to the request completed callback.
   * The second pointer may be NULL.
    }
{*
   * Allow to change maximum length of the queue of pending connections on
   * listen socket. If not present than default platform-specific SOMAXCONN
   * value is used. This option should be followed by an `unsigned int`
   * argument.
    }
{*
   * If set to 1 - be strict about the protocol.  Use -1 to be
   * as tolerant as possible.
   *
   * The more flexible option #MHD_OPTION_CLIENT_DISCIPLINE_LVL is recommended
   * instead of this option.
   *
   * The values mapping table:
   * #MHD_OPTION_STRICT_FOR_CLIENT | #MHD_OPTION_CLIENT_DISCIPLINE_LVL
   * -----------------------------:|:---------------------------------
   * 1                             | 1
   * 0                             | 0
   * -1                            | -3
   *
   * This option should be followed by an `int` argument.
   * @sa #MHD_OPTION_CLIENT_DISCIPLINE_LVL
    }
{*
   * This should be a pointer to callback of type
   * gnutls_psk_server_credentials_function that will be given to
   * gnutls_psk_set_server_credentials_function. It is used to
   * retrieve the shared key for a given username.
    }
{*
   * Use a callback to determine which X.509 certificate should be
   * used for a given HTTPS connection.  This option should be
   * followed by a argument of type `gnutls_certificate_retrieve_function3 *`.
   * This option provides an
   * alternative/extension to #MHD_OPTION_HTTPS_CERT_CALLBACK.
   * You must use this version if you want to use OCSP stapling.
   * Using this option requires GnuTLS 3.6.3 or higher.
    }
{*
   * Allows the application to disable certain sanity precautions
   * in MHD. With these, the client can break the HTTP protocol,
   * so this should never be used in production. The options are,
   * however, useful for testing HTTP clients against "broken"
   * server implementations.
   * This argument must be followed by an "unsigned int", corresponding
   * to an `enum MHD_DisableSanityCheck`.
    }
{*
   * If followed by value '1' informs MHD that SIGPIPE is suppressed or
   * handled by application. Allows MHD to use network functions that could
   * generate SIGPIPE, like `sendfile()`.
   * Valid only for daemons without #MHD_USE_INTERNAL_POLLING_THREAD as
   * MHD automatically suppresses SIGPIPE for threads started by MHD.
   * This option should be followed by an `int` argument.
   * @note Available since #MHD_VERSION 0x00097205
    }
{*
   * If followed by 'int' with value '1' disables usage of ALPN for TLS
   * connections even if supported by TLS library.
   * Valid only for daemons with #MHD_USE_TLS.
   * This option should be followed by an `int` argument.
   * @note Available since #MHD_VERSION 0x00097207
    }
{*
   * Memory pointer for the random values to be used by the Digest
   * Auth module. This option should be followed by two arguments.
   * First an integer of type `size_t` which specifies the size
   * of the buffer pointed to by the second argument in bytes.
   * The recommended size is between 8 and 32. If size is four or less
   * then security could be lowered. Sizes more then 32 (or, probably
   * more than 16 - debatable) will not increase security.
   * An internal copy of the buffer will be made, the data do not
   * need to be static.
   * @sa #MHD_OPTION_DIGEST_AUTH_RANDOM
   * @note Available since #MHD_VERSION 0x00097701
    }
{*
   * Allow to controls the scope of validity of MHD-generated nonces.
   * This regulates how "nonces" are generated and how "nonces" are checked by
   * #MHD_digest_auth_check3() and similar functions.
   * This option should be followed by an 'unsigned int` argument with value
   * formed as bitwise OR combination of #MHD_DAuthBindNonce values.
   * When not specified, default value #MHD_DAUTH_BIND_NONCE_NONE is used.
   * @note Available since #MHD_VERSION 0x00097701
    }
{*
   * Memory pointer to a `const char *` specifying the GnuTLS priorities to be
   * appended to default priorities.
   * This allow some specific options to be enabled/disabled, while leaving
   * the rest of the settings to their defaults.
   * The string does not have to start with a colon ':' character.
   * See #MHD_OPTION_HTTPS_PRIORITIES description for details of automatic
   * default priorities.
   * @note Available since #MHD_VERSION 0x00097701
    }
{*
   * Sets specified client discipline level (i.e. HTTP protocol parsing
   * strictness level).
   *
   * The following basic values are supported:
   *  0 - default MHD level, a balance between extra security and broader
   *      compatibility, as allowed by RFCs for HTTP servers;
   *  1 - more strict protocol interpretation, within the limits set by
   *      RFCs for HTTP servers;
   * -1 - more lenient protocol interpretation, within the limits set by
   *      RFCs for HTTP servers.
   * The following extended values could be used as well:
   *  2 - stricter protocol interpretation, even stricter then allowed
   *      by RFCs for HTTP servers, however it should be absolutely compatible
   *      with clients following at least RFCs' "MUST" type of requirements
   *      for HTTP clients;
   *  3 - strictest protocol interpretation, even stricter then allowed
   *      by RFCs for HTTP servers, however it should be absolutely compatible
   *      with clients following RFCs' "SHOULD" and "MUST" types of requirements
   *      for HTTP clients;
   * -2 - more relaxed protocol interpretation, violating RFCs' "SHOULD" type
   *      of requirements for HTTP servers;
   * -3 - the most flexible protocol interpretation, beyond RFCs' "MUST" type of
   *      requirements for HTTP server.
   * Values higher than "3" or lower than "-3" are interpreted as "3" or "-3"
   * respectively.
   *
   * Higher values are more secure, lower values are more compatible with
   * various HTTP clients.
   *
   * The default value ("0") could be used in most cases.
   * Value "1" is suitable for highly loaded public servers.
   * Values "2" and "3" are generally recommended only for testing of HTTP
   * clients against MHD.
   * Value "2" may be used for security-centric application, however it is
   * slight violation of RFCs' requirements.
   * Negative values are not recommended for public servers.
   * Values "-1" and "-2" could be used for servers in isolated environment.
   * Value "-3" is not recommended unless it is absolutely necessary to
   * communicate with some client(s) with badly broken HTTP implementation.
   *
   * This option should be followed by an `int` argument.
   * @note Available since #MHD_VERSION 0x00097701
    }
{*
   * Specifies value of FD_SETSIZE used by application.  Only For external
   * polling modes (without MHD internal threads).
   * Some platforms (FreeBSD, Solaris, W32 etc.) allow overriding of FD_SETSIZE
   * value.  When polling by select() is used, MHD rejects sockets with numbers
   * equal or higher than FD_SETSIZE.  If this option is used, MHD treats this
   * value as a limitation for socket number instead of FD_SETSIZE value which
   * was used for building MHD.
   * When external polling is used with #MHD_get_fdset2() (or #MHD_get_fdset()
   * macro) and #MHD_run_from_select() interfaces, it is recommended to always
   * use this option.
   * It is safe to use this option on platforms with fixed FD_SETSIZE (like
   * GNU/Linux) if system value of FD_SETSIZE is used as the argument.
   * Can be used only for daemons without #MHD_USE_INTERNAL_POLLING_THREAD, i.e.
   * only when external sockets polling is used.
   * On W32 it is silently ignored, as W32 does not limit the socket number in
   * fd_sets.
   * This option should be followed by a positive 'int' argument.
   * @note Available since #MHD_VERSION 0x00097705
    }
{*
   * Bind daemon to the supplied 'struct sockaddr'.  This option should
   * be followed by two parameters: 'socklen_t' the size of memory at the next
   * pointer and the pointer 'const struct sockaddr *'.
   * Note: the order of the arguments is not the same as for system bind() and
   * other network functions.
   * If #MHD_USE_IPv6 is specified, the 'struct sockaddr*' should
   * point to a 'struct sockaddr_in6'.
   * The socket domain (protocol family) is detected from provided
   * 'struct sockaddr'. IP, IPv6 and UNIX sockets are supported (if supported
   * by the platform). Other types may work occasionally.
   * Silently ignored if followed by zero size and NULL pointer.
   * @note Available since #MHD_VERSION 0x00097706
    }
{*
   * Default nonce timeout value used for Digest Auth.
   * This option should be followed by an 'unsigned int' argument.
   * Silently ignored if followed by zero value.
   * @see #MHD_digest_auth_check3(), MHD_digest_auth_check_digest3()
   * @note Available since #MHD_VERSION 0x00097709
    }
{*
   * Default maximum nc (nonce count) value used for Digest Auth.
   * This option should be followed by an 'uint32_t' argument.
   * Silently ignored if followed by zero value.
   * @see #MHD_digest_auth_check3(), MHD_digest_auth_check_digest3()
   * @note Available since #MHD_VERSION 0x00097709
    }
type
  TMHD_OPTION =  Longint;
  Const
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

{*
 * Bitfield for the #MHD_OPTION_SERVER_INSANITY specifying
 * which santiy checks should be disabled.
  }
{*
   * All sanity checks are enabled.
    }
type
  TMHD_DisableSanityCheck =  Longint;
  Const
    MHD_DSC_SANE = 0;

{*
 * Entry in an #MHD_OPTION_ARRAY.
  }
{*
   * Which option is being given.  Use #MHD_OPTION_END
   * to terminate the array.
    }
{*
   * Option value (for integer arguments, and for options requiring
   * two pointer arguments); should be 0 for options that take no
   * arguments or only a single pointer argument.
    }
{*
   * Pointer option value (use NULL for options taking no arguments
   * or only an integer option).
    }
type
  PMHD_OptionItem = ^TMHD_OptionItem;
  TMHD_OptionItem = record
      option : TMHD_OPTION;
      value : Tintptr_t;
      ptr_value : pointer;
    end;

{*
 * The `enum MHD_ValueKind` specifies the source of
 * the key-value pairs in the HTTP protocol.
  }
{*
   * Response header
   * @deprecated
    }
{*
   * HTTP header (request/response).
    }
{*
   * Cookies.  Note that the original HTTP header containing
   * the cookie(s) will still be available and intact.
    }
{*
   * POST data.  This is available only if a content encoding
   * supported by MHD is used (currently only URL encoding),
   * and only if the posted content fits within the available
   * memory pool.  Note that in that case, the upload data
   * given to the #MHD_AccessHandlerCallback will be
   * empty (since it has already been processed).
    }
{*
   * GET (URI) arguments.
    }
{*
   * HTTP footer (only for HTTP 1.1 chunked encodings).
    }
  TMHD_ValueKind =  Longint;
  Const
    MHD_RESPONSE_HEADER_KIND = 0;
    MHD_HEADER_KIND = 1;
    MHD_COOKIE_KIND = 2;
    MHD_POSTDATA_KIND = 4;
    MHD_GET_ARGUMENT_KIND = 8;
    MHD_FOOTER_KIND = 16;

{*
 * The `enum MHD_RequestTerminationCode` specifies reasons
 * why a request has been terminated (or completed).
 * @ingroup request
  }
{*
   * We finished sending the response.
   * @ingroup request
    }
{*
   * Error handling the connection (resources
   * exhausted, application error accepting request,
   * decrypt error (for HTTPS), connection died when
   * sending the response etc.)
   * @ingroup request
    }
{*
   * No activity on the connection for the number
   * of seconds specified using
   * #MHD_OPTION_CONNECTION_TIMEOUT.
   * @ingroup request
    }
{*
   * We had to close the session since MHD was being
   * shut down.
   * @ingroup request
    }
{*
   * We tried to read additional data, but the connection became broken or
   * the other side hard closed the connection.
   * This error is similar to #MHD_REQUEST_TERMINATED_WITH_ERROR, but
   * specific to the case where the connection died before request completely
   * received.
   * @ingroup request
    }
{*
   * The client terminated the connection by closing the socket
   * for writing (TCP half-closed) while still sending request.
   * @ingroup request
    }
type
  TMHD_RequestTerminationCode =  Longint;
  Const
    MHD_REQUEST_TERMINATED_COMPLETED_OK = 0;
    MHD_REQUEST_TERMINATED_WITH_ERROR = 1;
    MHD_REQUEST_TERMINATED_TIMEOUT_REACHED = 2;
    MHD_REQUEST_TERMINATED_DAEMON_SHUTDOWN = 3;
    MHD_REQUEST_TERMINATED_READ_ERROR = 4;
    MHD_REQUEST_TERMINATED_CLIENT_ABORT = 5;

{*
 * The `enum MHD_ConnectionNotificationCode` specifies types
 * of connection notifications.
 * @ingroup request
  }
{*
   * A new connection has been started.
   * @ingroup request
    }
{*
   * A connection is closed.
   * @ingroup request
    }
type
  TMHD_ConnectionNotificationCode =  Longint;
  Const
    MHD_CONNECTION_NOTIFY_STARTED = 0;
    MHD_CONNECTION_NOTIFY_CLOSED = 1;

{*
 * Information about a connection.
  }
{*
   * Cipher algorithm used, of type "enum gnutls_cipher_algorithm".
    }
{ enum gnutls_cipher_algorithm  }{*
   * Protocol used, of type "enum gnutls_protocol".
    }
{ enum gnutls_protocol  }{*
   * The suspended status of a connection.
    }
{ MHD_YES or MHD_NO  }{*
   * Amount of second that connection could spend in idle state
   * before automatically disconnected.
   * Zero for no timeout (unlimited idle time).
    }
{*
   * HTTP status queued with the response, for #MHD_CONNECTION_INFO_HTTP_STATUS.
    }
{*
   * Connect socket
    }
{*
   * Size of the client's HTTP header.
   * It includes the request line, all request headers, the header section
   * terminating empty line, with all CRLF (or LF) characters.
    }
{*
   * GNUtls session handle, of type "gnutls_session_t".
    }
{ gnutls_session_t  }{*
   * GNUtls client certificate handle, of type "gnutls_x509_crt_t".
    }
{ gnutls_x509_crt_t  }{*
   * Address information for the client.
    }
{*
   * Which daemon manages this connection (useful in case there are many
   * daemons running).
    }
{*
   * Socket-specific client context.  Points to the same address as
   * the "socket_context" of the #MHD_NotifyConnectionCallback.
    }
type
  PMHD_ConnectionInfo = ^TMHD_ConnectionInfo;
  TMHD_ConnectionInfo = record
      case longint of
        0 : ( cipher_algorithm : longint );
        1 : ( protocol : longint );
        2 : ( suspended : longint );
        3 : ( connection_timeout : dword );
        4 : ( http_status : dword );
        5 : ( connect_fd : TMHD_socket );
        6 : ( header_size : Tsize_t );
        7 : ( tls_session : pointer );
        8 : ( client_cert : pointer );
        9 : ( client_addr : Psockaddr );
        10 : ( daemon : PMHD_Daemon );
        11 : ( socket_context : pointer );
      end;

{*
 * I/O vector type. Provided for use with #MHD_create_response_from_iovec().
 * @note Available since #MHD_VERSION 0x00097204
  }
{*
   * The pointer to the memory region for I/O.
    }
{*
   * The size in bytes of the memory region for I/O.
    }
  PMHD_IoVec = ^TMHD_IoVec;
  TMHD_IoVec = record
      iov_base : pointer;
      iov_len : Tsize_t;
    end;

{*
 * Values of this enum are used to specify what
 * information about a connection is desired.
 * @ingroup request
  }
{*
   * What cipher algorithm is being used.
   * Takes no extra arguments.
   * @ingroup request
    }
{*
   *
   * Takes no extra arguments.
   * @ingroup request
    }
{*
   * Obtain IP address of the client.  Takes no extra arguments.
   * Returns essentially a `struct sockaddr **` (since the API returns
   * a `union MHD_ConnectionInfo *` and that union contains a `struct
   * sockaddr *`).
   * @ingroup request
    }
{*
   * Get the gnuTLS session handle.
   * @ingroup request
    }
{*
   * Get the gnuTLS client certificate handle.  Dysfunctional (never
   * implemented, deprecated).  Use #MHD_CONNECTION_INFO_GNUTLS_SESSION
   * to get the `gnutls_session_t` and then call
   * gnutls_certificate_get_peers().
    }
{*
   * Get the `struct MHD_Daemon *` responsible for managing this connection.
   * @ingroup request
    }
{*
   * Request the file descriptor for the connection socket.
   * MHD sockets are always in non-blocking mode.
   * No extra arguments should be passed.
   * @ingroup request
    }
{*
   * Returns the client-specific pointer to a `void *` that was (possibly)
   * set during a #MHD_NotifyConnectionCallback when the socket was
   * first accepted.
   * Note that this is NOT the same as the "req_cls" argument of
   * the #MHD_AccessHandlerCallback. The "req_cls" is fresh for each
   * HTTP request, while the "socket_context" is fresh for each socket.
    }
{*
   * Check whether the connection is suspended.
   * @ingroup request
    }
{*
   * Get connection timeout
   * @ingroup request
    }
{*
   * Return length of the client's HTTP request header.
   * @ingroup request
    }
{*
   * Return HTTP status queued with the response. NULL
   * if no HTTP response has been queued yet.
    }
  TMHD_ConnectionInfoType =  Longint;
  Const
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

{*
 * Values of this enum are used to specify what
 * information about a daemon is desired.
  }
{*
   * No longer supported (will return NULL).
    }
{*
   * No longer supported (will return NULL).
    }
{*
   * Request the file descriptor for the listening socket.
   * No extra arguments should be passed.
    }
{*
   * Request the file descriptor for the "external" sockets polling
   * when 'epoll' mode is used.
   * No extra arguments should be passed.
   *
   * Waiting on epoll FD must not block longer than value
   * returned by #MHD_get_timeout() otherwise connections
   * will "hung" with unprocessed data in network buffers
   * and timed-out connections will not be closed.
   *
   * @sa #MHD_get_timeout(), #MHD_run()
    }
{*
   * Request the number of current connections handled by the daemon.
   * No extra arguments should be passed.
   * Note: when using MHD in "external" polling mode, this type of request
   * could be used only when #MHD_run()/#MHD_run_from_select is not
   * working in other thread at the same time.
    }
{*
   * Request the daemon flags.
   * No extra arguments should be passed.
   * Note: flags may differ from original 'flags' specified for
   * daemon, especially if #MHD_USE_AUTO was set.
    }
{*
   * Request the port number of daemon's listen socket.
   * No extra arguments should be passed.
   * Note: if port '0' was specified for #MHD_start_daemon(), returned
   * value will be real port number.
    }
type
  TMHD_DaemonInfoType =  Longint;
  Const
    MHD_DAEMON_INFO_KEY_SIZE = 0;
    MHD_DAEMON_INFO_MAC_KEY_SIZE = 1;
    MHD_DAEMON_INFO_LISTEN_FD = 2;
    MHD_DAEMON_INFO_EPOLL_FD_LINUX_ONLY = 3;
    MHD_DAEMON_INFO_EPOLL_FD = MHD_DAEMON_INFO_EPOLL_FD_LINUX_ONLY;
    MHD_DAEMON_INFO_CURRENT_CONNECTIONS = (MHD_DAEMON_INFO_EPOLL_FD_LINUX_ONLY)+1;
    MHD_DAEMON_INFO_FLAGS = (MHD_DAEMON_INFO_EPOLL_FD_LINUX_ONLY)+2;
    MHD_DAEMON_INFO_BIND_PORT = (MHD_DAEMON_INFO_EPOLL_FD_LINUX_ONLY)+3;

{*
 * Callback for serious error condition. The default action is to print
 * an error message and `abort()`.
 *
 * @param cls user specified value
 * @param file where the error occurred, may be NULL if MHD was built without
 *             messages support
 * @param line where the error occurred
 * @param reason error detail, may be NULL
 * @ingroup logging
  }
type

  TMHD_PanicCallback = procedure (cls:pointer; file_:Pchar; line:dword; reason:Pchar);cdecl;
{*
 * Allow or deny a client to connect.
 *
 * @param cls closure
 * @param addr address information from the client
 * @param addrlen length of @a addr
 * @return #MHD_YES if connection is allowed, #MHD_NO if not
  }

  TMHD_AcceptPolicyCallback = function (cls:pointer; addr:Psockaddr; addrlen:Tsocklen_t):TMHD_Result;cdecl;
{*
 * A client has requested the given @a url using the given @a method
 * (#MHD_HTTP_METHOD_GET, #MHD_HTTP_METHOD_PUT, #MHD_HTTP_METHOD_DELETE,
 * #MHD_HTTP_METHOD_POST, etc).
 *
 * The callback must call MHD function MHD_queue_response() to provide content
 * to give back to the client and return an HTTP status code (i.e.
 * #MHD_HTTP_OK, #MHD_HTTP_NOT_FOUND, etc.). The response can be created
 * in this callback or prepared in advance.
 * Alternatively, callback may call MHD_suspend_connection() to temporarily
 * suspend data processing for this connection.
 *
 * As soon as response is provided this callback will not be called anymore
 * for the current request.
 *
 * For each HTTP request this callback is called several times:
 * * after request headers are fully received and decoded,
 * * for each received part of request body (optional, if request has body),
 * * when request is fully received.
 *
 * If response is provided before request is fully received, the rest
 * of the request is discarded and connection is automatically closed
 * after sending response.
 *
 * If the request is fully received, but response hasn't been provided and
 * connection is not suspended, the callback can be called again immediately.
 *
 * The response cannot be queued when this callback is called to process
 * the client upload data (when @a upload_data is not NULL).
 *
 * @param cls argument given together with the function
 *        pointer when the handler was registered with MHD
 * @param connection the connection handle
 * @param url the requested url
 * @param method the HTTP method used (#MHD_HTTP_METHOD_GET,
 *        #MHD_HTTP_METHOD_PUT, etc.)
 * @param version the HTTP version string (i.e.
 *        #MHD_HTTP_VERSION_1_1)
 * @param upload_data the data being uploaded (excluding HEADERS,
 *        for a POST that fits into memory and that is encoded
 *        with a supported encoding, the POST data will NOT be
 *        given in upload_data and is instead available as
 *        part of #MHD_get_connection_values; very large POST
 *        data *will* be made available incrementally in
 *        @a upload_data)
 * @param[in,out] upload_data_size set initially to the size of the
 *        @a upload_data provided; the method must update this
 *        value to the number of bytes NOT processed;
 * @param[in,out] req_cls pointer that the callback can set to some
 *        address and that will be preserved by MHD for future
 *        calls for this request; since the access handler may
 *        be called many times (i.e., for a PUT/POST operation
 *        with plenty of upload data) this allows the application
 *        to easily associate some request-specific state.
 *        If necessary, this state can be cleaned up in the
 *        global #MHD_RequestCompletedCallback (which
 *        can be set with the #MHD_OPTION_NOTIFY_COMPLETED).
 *        Initially, `*req_cls` will be NULL.
 * @return #MHD_YES if the connection was handled successfully,
 *         #MHD_NO if the socket must be closed due to a serious
 *         error while handling the request
 *
 * @sa #MHD_queue_response()
  }

  TMHD_AccessHandlerCallback = function (cls:pointer; connection:PMHD_Connection; url:Pchar; method:Pchar; version:Pchar; 
               upload_data:Pchar; upload_data_size:Psize_t; req_cls:Ppointer):TMHD_Result;cdecl;
{*
 * Signature of the callback used by MHD to notify the
 * application about completed requests.
 *
 * @param cls client-defined closure
 * @param connection connection handle
 * @param req_cls value as set by the last call to
 *        the #MHD_AccessHandlerCallback
 * @param toe reason for request termination
 * @see #MHD_OPTION_NOTIFY_COMPLETED
 * @ingroup request
  }

  TMHD_RequestCompletedCallback = procedure (cls:pointer; connection:PMHD_Connection; req_cls:Ppointer; toe:TMHD_RequestTerminationCode);cdecl;
{*
 * Signature of the callback used by MHD to notify the
 * application about started/stopped connections
 *
 * @param cls client-defined closure
 * @param connection connection handle
 * @param socket_context socket-specific pointer where the
 *                       client can associate some state specific
 *                       to the TCP connection; note that this is
 *                       different from the "req_cls" which is per
 *                       HTTP request.  The client can initialize
 *                       during #MHD_CONNECTION_NOTIFY_STARTED and
 *                       cleanup during #MHD_CONNECTION_NOTIFY_CLOSED
 *                       and access in the meantime using
 *                       #MHD_CONNECTION_INFO_SOCKET_CONTEXT.
 * @param toe reason for connection notification
 * @see #MHD_OPTION_NOTIFY_CONNECTION
 * @ingroup request
  }

  TMHD_NotifyConnectionCallback = procedure (cls:pointer; connection:PMHD_Connection; socket_context:Ppointer; toe:TMHD_ConnectionNotificationCode);cdecl;
{*
 * Iterator over key-value pairs.  This iterator
 * can be used to iterate over all of the cookies,
 * headers, or POST-data fields of a request, and
 * also to iterate over the headers that have been
 * added to a response.
 *
 * @param cls closure
 * @param kind kind of the header we are looking at
 * @param key key for the value, can be an empty string
 * @param value corresponding value, can be NULL
 * @return #MHD_YES to continue iterating,
 *         #MHD_NO to abort the iteration
 * @ingroup request
  }

  TMHD_KeyValueIterator = function (cls:pointer; kind:TMHD_ValueKind; key:Pchar; value:Pchar):TMHD_Result;cdecl;
{*
 * Iterator over key-value pairs with size parameters.
 * This iterator can be used to iterate over all of
 * the cookies, headers, or POST-data fields of a
 * request, and also to iterate over the headers that
 * have been added to a response.
 * @note Available since #MHD_VERSION 0x00096303
 *
 * @param cls closure
 * @param kind kind of the header we are looking at
 * @param key key for the value, can be an empty string
 * @param value corresponding value, can be NULL
 * @param value_size number of bytes in @a value;
 *                   for C-strings, the length excludes the 0-terminator
 * @return #MHD_YES to continue iterating,
 *         #MHD_NO to abort the iteration
 * @ingroup request
  }

  TMHD_KeyValueIteratorN = function (cls:pointer; kind:TMHD_ValueKind; key:Pchar; key_size:Tsize_t; value:Pchar; 
               value_size:Tsize_t):TMHD_Result;cdecl;
{*
 * Callback used by libmicrohttpd in order to obtain content.
 *
 * The callback is to copy at most @a max bytes of content into @a buf.
 * The total number of bytes that has been placed into @a buf should be
 * returned.
 *
 * Note that returning zero will cause libmicrohttpd to try again.
 * Thus, returning zero should only be used in conjunction
 * with MHD_suspend_connection() to avoid busy waiting.
 *
 * @param cls extra argument to the callback
 * @param pos position in the datastream to access;
 *        note that if a `struct MHD_Response` object is re-used,
 *        it is possible for the same content reader to
 *        be queried multiple times for the same data;
 *        however, if a `struct MHD_Response` is not re-used,
 *        libmicrohttpd guarantees that "pos" will be
 *        the sum of all non-negative return values
 *        obtained from the content reader so far.
 * @param buf where to copy the data
 * @param max maximum number of bytes to copy to @a buf (size of @a buf)
 * @return number of bytes written to @a buf;
 *  0 is legal unless MHD is started in "internal" sockets polling mode
 *    (since this would cause busy-waiting); 0 in "external" sockets
 *    polling mode will cause this function to be called again once
 *    any MHD_run*() function is called;
 *  #MHD_CONTENT_READER_END_OF_STREAM (-1) for the regular
 *    end of transmission (with chunked encoding, MHD will then
 *    terminate the chunk and send any HTTP footers that might be
 *    present; without chunked encoding and given an unknown
 *    response size, MHD will simply close the connection; note
 *    that while returning #MHD_CONTENT_READER_END_OF_STREAM is not technically
 *    legal if a response size was specified, MHD accepts this
 *    and treats it just as #MHD_CONTENT_READER_END_WITH_ERROR;
 *  #MHD_CONTENT_READER_END_WITH_ERROR (-2) to indicate a server
 *    error generating the response; this will cause MHD to simply
 *    close the connection immediately.  If a response size was
 *    given or if chunked encoding is in use, this will indicate
 *    an error to the client.  Note, however, that if the client
 *    does not know a response size and chunked encoding is not in
 *    use, then clients will not be able to tell the difference between
 *    #MHD_CONTENT_READER_END_WITH_ERROR and #MHD_CONTENT_READER_END_OF_STREAM.
 *    This is not a limitation of MHD but rather of the HTTP protocol.
  }

  TMHD_ContentReaderCallback = function (cls:pointer; pos:Tuint64_t; buf:Pchar; max:Tsize_t):Tssize_t;cdecl;
{*
 * This method is called by libmicrohttpd if we
 * are done with a content reader.  It should
 * be used to free resources associated with the
 * content reader.
 *
 * @param cls closure
 * @ingroup response
  }

  TMHD_ContentReaderFreeCallback = procedure (cls:pointer);cdecl;
{*
 * Iterator over key-value pairs where the value
 * may be made available in increments and/or may
 * not be zero-terminated.  Used for processing
 * POST data.
 *
 * @param cls user-specified closure
 * @param kind type of the value, always #MHD_POSTDATA_KIND when called from MHD
 * @param key 0-terminated key for the value, NULL if not known. This value
 *            is never NULL for url-encoded POST data.
 * @param filename name of the uploaded file, NULL if not known
 * @param content_type mime-type of the data, NULL if not known
 * @param transfer_encoding encoding of the data, NULL if not known
 * @param data pointer to @a size bytes of data at the
 *              specified offset
 * @param off offset of data in the overall value
 * @param size number of bytes in @a data available
 * @return #MHD_YES to continue iterating,
 *         #MHD_NO to abort the iteration
  }

  TMHD_PostDataIterator = function (cls:pointer; kind:TMHD_ValueKind; key:Pchar; filename:Pchar; content_type:Pchar; 
               transfer_encoding:Pchar; data:Pchar; off:Tuint64_t; size:Tsize_t):TMHD_Result;cdecl;
{ **************** Daemon handling functions *****************  }
{*
 * Start a webserver on the given port.
 *
 * @param flags combination of `enum MHD_FLAG` values
 * @param port port to bind to (in host byte order),
 *        use '0' to bind to random free port,
 *        ignored if MHD_OPTION_SOCK_ADDR or
 *        MHD_OPTION_LISTEN_SOCKET is provided
 *        or MHD_USE_NO_LISTEN_SOCKET is specified
 * @param apc callback to call to check which clients
 *        will be allowed to connect; you can pass NULL
 *        in which case connections from any IP will be
 *        accepted
 * @param apc_cls extra argument to apc
 * @param dh handler called for all requests (repeatedly)
 * @param dh_cls extra argument to @a dh
 * @param ap list of options (type-value pairs,
 *        terminated with #MHD_OPTION_END).
 * @return NULL on error, handle to daemon on success
 * @ingroup event
  }

function MHD_start_daemon_va(flags:dword; port:Tuint16_t; apc:TMHD_AcceptPolicyCallback; apc_cls:pointer; dh:TMHD_AccessHandlerCallback; 
           dh_cls:pointer; ap:Tva_list):PMHD_Daemon;cdecl;external libmicrohttpd;
{*
 * Start a webserver on the given port.  Variadic version of
 * #MHD_start_daemon_va.
 *
 * @param flags combination of `enum MHD_FLAG` values
 * @param port port to bind to (in host byte order),
 *        use '0' to bind to random free port,
 *        ignored if MHD_OPTION_SOCK_ADDR or
 *        MHD_OPTION_LISTEN_SOCKET is provided
 *        or MHD_USE_NO_LISTEN_SOCKET is specified
 * @param apc callback to call to check which clients
 *        will be allowed to connect; you can pass NULL
 *        in which case connections from any IP will be
 *        accepted
 * @param apc_cls extra argument to apc
 * @param dh handler called for all requests (repeatedly)
 * @param dh_cls extra argument to @a dh
 * @return NULL on error, handle to daemon on success
 * @ingroup event
  }
//function MHD_start_daemon(flags:dword; port:Tuint16_t; apc:TMHD_AcceptPolicyCallback; apc_cls:pointer; dh:TMHD_AccessHandlerCallback; 
//           dh_cls:pointer; args:array of const):PMHD_Daemon;cdecl;external libmicrohttpd;
function MHD_start_daemon(flags:dword; port:Tuint16_t; apc:TMHD_AcceptPolicyCallback; apc_cls:pointer; dh:TMHD_AccessHandlerCallback; 
           dh_cls:pointer):PMHD_Daemon;cdecl;varargs; external libmicrohttpd;
{*
 * Stop accepting connections from the listening socket.  Allows
 * clients to continue processing, but stops accepting new
 * connections.  Note that the caller is responsible for closing the
 * returned socket; however, if MHD is run using threads (anything but
 * "external" sockets polling mode), it must not be closed until AFTER
 * #MHD_stop_daemon has been called (as it is theoretically possible
 * that an existing thread is still using it).
 *
 * Note that some thread modes require the caller to have passed
 * #MHD_USE_ITC when using this API.  If this daemon is
 * in one of those modes and this option was not given to
 * #MHD_start_daemon, this function will return #MHD_INVALID_SOCKET.
 *
 * @param daemon daemon to stop accepting new connections for
 * @return old listen socket on success, #MHD_INVALID_SOCKET if
 *         the daemon was already not listening anymore
 * @ingroup specialized
  }
function MHD_quiesce_daemon(daemon:PMHD_Daemon):TMHD_socket;cdecl;external libmicrohttpd;
{*
 * Shutdown an HTTP daemon.
 *
 * @param daemon daemon to stop
 * @ingroup event
  }
procedure MHD_stop_daemon(daemon:PMHD_Daemon);cdecl;external libmicrohttpd;
{*
 * Add another client connection to the set of connections managed by
 * MHD.  This API is usually not needed (since MHD will accept inbound
 * connections on the server socket).  Use this API in special cases,
 * for example if your HTTP server is behind NAT and needs to connect
 * out to the HTTP client, or if you are building a proxy.
 *
 * If you use this API in conjunction with an "internal" socket polling,
 * you must set the option #MHD_USE_ITC to ensure that the freshly added
 * connection is immediately processed by MHD.
 *
 * The given client socket will be managed (and closed!) by MHD after
 * this call and must no longer be used directly by the application
 * afterwards.
 *
 * @param daemon daemon that manages the connection
 * @param client_socket socket to manage (MHD will expect
 *        to receive an HTTP request from this socket next).
 * @param addr IP address of the client
 * @param addrlen number of bytes in @a addr
 * @return #MHD_YES on success, #MHD_NO if this daemon could
 *        not handle the connection (i.e. `malloc()` failed, etc).
 *        The socket will be closed in any case; `errno` is
 *        set to indicate further details about the error.
 * @ingroup specialized
  }
function MHD_add_connection(daemon:PMHD_Daemon; client_socket:TMHD_socket; addr:Psockaddr; addrlen:Tsocklen_t):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Obtain the `select()` sets for this daemon.
 * Daemon's FDs will be added to fd_sets. To get only
 * daemon FDs in fd_sets, call FD_ZERO for each fd_set
 * before calling this function. FD_SETSIZE is assumed
 * to be platform's default.
 *
 * This function should be called only when MHD is configured to
 * use "external" sockets polling with 'select()' or with 'epoll'.
 * In the latter case, it will only add the single 'epoll' file
 * descriptor used by MHD to the sets.
 * It's necessary to use #MHD_get_timeout() to get maximum timeout
 * value for `select()`. Usage of `select()` with indefinite timeout
 * (or timeout larger than returned by #MHD_get_timeout()) will
 * violate MHD API and may results in pending unprocessed data.
 *
 * This function must be called only for daemon started
 * without #MHD_USE_INTERNAL_POLLING_THREAD flag.
 *
 * @param daemon daemon to get sets from
 * @param read_fd_set read set
 * @param write_fd_set write set
 * @param except_fd_set except set
 * @param max_fd increased to largest FD added (if larger
 *               than existing value); can be NULL
 * @return #MHD_YES on success, #MHD_NO if this
 *         daemon was not started with the right
 *         options for this call or any FD didn't
 *         fit fd_set.
 * @ingroup event
  }
function MHD_get_fdset(daemon:PMHD_Daemon; read_fd_set:Pfd_set; write_fd_set:Pfd_set; except_fd_set:Pfd_set; max_fd:PMHD_socket):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Obtain the `select()` sets for this daemon.
 * Daemon's FDs will be added to fd_sets. To get only
 * daemon FDs in fd_sets, call FD_ZERO for each fd_set
 * before calling this function.
 *
 * Passing custom FD_SETSIZE as @a fd_setsize allow usage of
 * larger/smaller than platform's default fd_sets.
 *
 * This function should be called only when MHD is configured to
 * use "external" sockets polling with 'select()' or with 'epoll'.
 * In the latter case, it will only add the single 'epoll' file
 * descriptor used by MHD to the sets.
 * It's necessary to use #MHD_get_timeout() to get maximum timeout
 * value for `select()`. Usage of `select()` with indefinite timeout
 * (or timeout larger than returned by #MHD_get_timeout()) will
 * violate MHD API and may results in pending unprocessed data.
 *
 * This function must be called only for daemon started
 * without #MHD_USE_INTERNAL_POLLING_THREAD flag.
 *
 * @param daemon daemon to get sets from
 * @param read_fd_set read set
 * @param write_fd_set write set
 * @param except_fd_set except set
 * @param max_fd increased to largest FD added (if larger
 *               than existing value); can be NULL
 * @param fd_setsize value of FD_SETSIZE
 * @return #MHD_YES on success, #MHD_NO if this
 *         daemon was not started with the right
 *         options for this call or any FD didn't
 *         fit fd_set.
 * @ingroup event
  }
function MHD_get_fdset2(daemon:PMHD_Daemon; read_fd_set:Pfd_set; write_fd_set:Pfd_set; except_fd_set:Pfd_set; max_fd:PMHD_socket; 
           fd_setsize:dword):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Obtain the `select()` sets for this daemon.
 * Daemon's FDs will be added to fd_sets. To get only
 * daemon FDs in fd_sets, call FD_ZERO for each fd_set
 * before calling this function. Size of fd_set is
 * determined by current value of FD_SETSIZE.
 *
 * This function should be called only when MHD is configured to
 * use "external" sockets polling with 'select()' or with 'epoll'.
 * In the latter case, it will only add the single 'epoll' file
 * descriptor used by MHD to the sets.
 * It's necessary to use #MHD_get_timeout() to get maximum timeout
 * value for `select()`. Usage of `select()` with indefinite timeout
 * (or timeout larger than returned by #MHD_get_timeout()) will
 * violate MHD API and may results in pending unprocessed data.
 *
 * This function must be called only for daemon started
 * without #MHD_USE_INTERNAL_POLLING_THREAD flag.
 *
 * @param daemon daemon to get sets from
 * @param read_fd_set read set
 * @param write_fd_set write set
 * @param except_fd_set except set
 * @param max_fd increased to largest FD added (if larger
 *               than existing value); can be NULL
 * @return #MHD_YES on success, #MHD_NO if this
 *         daemon was not started with the right
 *         options for this call or any FD didn't
 *         fit fd_set.
 * @ingroup event
  }
{*
 * Obtain timeout value for polling function for this daemon.
 *
 * This function set value to the amount of milliseconds for which polling
 * function (`select()`, `poll()` or epoll) should at most block, not the
 * timeout value set for connections.
 *
 * Any "external" sockets polling function must be called with the timeout
 * value provided by this function. Smaller timeout values can be used for
 * polling function if it is required for any reason, but using larger
 * timeout value or no timeout (indefinite timeout) when this function
 * return #MHD_YES will break MHD processing logic and result in "hung"
 * connections with data pending in network buffers and other problems.
 *
 * It is important to always use this function (or #MHD_get_timeout64(),
 * #MHD_get_timeout64s(), #MHD_get_timeout_i() functions) when "external"
 * polling is used.
 * If this function returns #MHD_YES then #MHD_run() (or #MHD_run_from_select())
 * must be called right after return from polling function, regardless of
 * the states of MHD FDs.
 *
 * In practice, if #MHD_YES is returned then #MHD_run() (or
 * #MHD_run_from_select()) must be called not later than @a timeout
 * millisecond even if no activity is detected on sockets by sockets
 * polling function.
 *
 * @param daemon daemon to query for timeout
 * @param[out] timeout set to the timeout (in milliseconds)
 * @return #MHD_YES on success, #MHD_NO if timeouts are
 *         not used and no data processing is pending.
 * @ingroup event
  }
function MHD_get_timeout(daemon:PMHD_Daemon; timeout:PMHD_UNSIGNED_LONG_LONG):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Free the memory allocated by MHD.
 *
 * If any MHD function explicitly mentions that returned pointer must be
 * freed by this function, then no other method must be used to free
 * the memory.
 *
 * @param ptr the pointer to free.
 * @sa #MHD_digest_auth_get_username(), #MHD_basic_auth_get_username_password3()
 * @sa #MHD_basic_auth_get_username_password()
 * @note Available since #MHD_VERSION 0x00095600
 * @ingroup specialized
  }
procedure MHD_free(ptr:pointer);cdecl;external libmicrohttpd;
{*
 * Obtain timeout value for external polling function for this daemon.
 *
 * This function set value to the amount of milliseconds for which polling
 * function (`select()`, `poll()` or epoll) should at most block, not the
 * timeout value set for connections.
 *
 * Any "external" sockets polling function must be called with the timeout
 * value provided by this function. Smaller timeout values can be used for
 * polling function if it is required for any reason, but using larger
 * timeout value or no timeout (indefinite timeout) when this function
 * return #MHD_YES will break MHD processing logic and result in "hung"
 * connections with data pending in network buffers and other problems.
 *
 * It is important to always use this function (or #MHD_get_timeout(),
 * #MHD_get_timeout64s(), #MHD_get_timeout_i() functions) when "external"
 * polling is used.
 * If this function returns #MHD_YES then #MHD_run() (or #MHD_run_from_select())
 * must be called right after return from polling function, regardless of
 * the states of MHD FDs.
 *
 * In practice, if #MHD_YES is returned then #MHD_run() (or
 * #MHD_run_from_select()) must be called not later than @a timeout
 * millisecond even if no activity is detected on sockets by sockets
 * polling function.
 *
 * @param daemon daemon to query for timeout
 * @param[out] timeout64 the pointer to the variable to be set to the
 *                  timeout (in milliseconds)
 * @return #MHD_YES if timeout value has been set,
 *         #MHD_NO if timeouts are not used and no data processing is pending.
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup event
  }
function MHD_get_timeout64(daemon:PMHD_Daemon; timeout:Puint64_t):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Obtain timeout value for external polling function for this daemon.
 *
 * This function set value to the amount of milliseconds for which polling
 * function (`select()`, `poll()` or epoll) should at most block, not the
 * timeout value set for connections.
 *
 * Any "external" sockets polling function must be called with the timeout
 * value provided by this function (if returned value is non-negative).
 * Smaller timeout values can be used for polling function if it is required
 * for any reason, but using larger timeout value or no timeout (indefinite
 * timeout) when this function returns non-negative value will break MHD
 * processing logic and result in "hung" connections with data pending in
 * network buffers and other problems.
 *
 * It is important to always use this function (or #MHD_get_timeout(),
 * #MHD_get_timeout64(), #MHD_get_timeout_i() functions) when "external"
 * polling is used.
 * If this function returns non-negative value then #MHD_run() (or
 * #MHD_run_from_select()) must be called right after return from polling
 * function, regardless of the states of MHD FDs.
 *
 * In practice, if zero or positive value is returned then #MHD_run() (or
 * #MHD_run_from_select()) must be called not later than returned amount of
 * millisecond even if no activity is detected on sockets by sockets
 * polling function.
 *
 * @param daemon the daemon to query for timeout
 * @return -1 if connections' timeouts are not set and no data processing
 *         is pending, so external polling function may wait for sockets
 *         activity for indefinite amount of time,
 *         otherwise returned value is the the maximum amount of millisecond
 *         that external polling function must wait for the activity of FDs.
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup event
  }
function MHD_get_timeout64s(daemon:PMHD_Daemon):Tint64_t;cdecl;external libmicrohttpd;
{*
 * Obtain timeout value for external polling function for this daemon.
 *
 * This function set value to the amount of milliseconds for which polling
 * function (`select()`, `poll()` or epoll) should at most block, not the
 * timeout value set for connections.
 *
 * Any "external" sockets polling function must be called with the timeout
 * value provided by this function (if returned value is non-negative).
 * Smaller timeout values can be used for polling function if it is required
 * for any reason, but using larger timeout value or no timeout (indefinite
 * timeout) when this function returns non-negative value will break MHD
 * processing logic and result in "hung" connections with data pending in
 * network buffers and other problems.
 *
 * It is important to always use this function (or #MHD_get_timeout(),
 * #MHD_get_timeout64(), #MHD_get_timeout64s() functions) when "external"
 * polling is used.
 * If this function returns non-negative value then #MHD_run() (or
 * #MHD_run_from_select()) must be called right after return from polling
 * function, regardless of the states of MHD FDs.
 *
 * In practice, if zero or positive value is returned then #MHD_run() (or
 * #MHD_run_from_select()) must be called not later than returned amount of
 * millisecond even if no activity is detected on sockets by sockets
 * polling function.
 *
 * @param daemon the daemon to query for timeout
 * @return -1 if connections' timeouts are not set and no data processing
 *         is pending, so external polling function may wait for sockets
 *         activity for indefinite amount of time,
 *         otherwise returned value is the the maximum amount of millisecond
 *         (capped at INT_MAX) that external polling function must wait
 *         for the activity of FDs.
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup event
  }
function MHD_get_timeout_i(daemon:PMHD_Daemon):longint;cdecl;external libmicrohttpd;
{*
 * Run webserver operations (without blocking unless in client callbacks).
 *
 * This method should be called by clients in combination with
 * #MHD_get_fdset() (or #MHD_get_daemon_info() with MHD_DAEMON_INFO_EPOLL_FD
 * if epoll is used) and #MHD_get_timeout() if the client-controlled
 * connection polling method is used (i.e. daemon was started without
 * #MHD_USE_INTERNAL_POLLING_THREAD flag).
 *
 * This function is a convenience method, which is useful if the
 * fd_sets from #MHD_get_fdset were not directly passed to `select()`;
 * with this function, MHD will internally do the appropriate `select()`
 * call itself again.  While it is acceptable to call #MHD_run (if
 * #MHD_USE_INTERNAL_POLLING_THREAD is not set) at any moment, you should
 * call #MHD_run_from_select() if performance is important (as it saves an
 * expensive call to `select()`).
 *
 * If #MHD_get_timeout() returned #MHD_YES, than this function must be called
 * right after polling function returns regardless of detected activity on
 * the daemon's FDs.
 *
 * @param daemon daemon to run
 * @return #MHD_YES on success, #MHD_NO if this
 *         daemon was not started with the right
 *         options for this call.
 * @ingroup event
  }
function MHD_run(daemon:PMHD_Daemon):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Run websever operation with possible blocking.
 *
 * This function does the following: waits for any network event not more than
 * specified number of milliseconds, processes all incoming and outgoing data,
 * processes new connections, processes any timed-out connection, and does
 * other things required to run webserver.
 * Once all connections are processed, function returns.
 *
 * This function is useful for quick and simple (lazy) webserver implementation
 * if application needs to run a single thread only and does not have any other
 * network activity.
 *
 * This function calls MHD_get_timeout() internally and use returned value as
 * maximum wait time if it less than value of @a millisec parameter.
 *
 * It is expected that the "external" socket polling function is not used in
 * conjunction with this function unless the @a millisec is set to zero.
 *
 * @param daemon the daemon to run
 * @param millisec the maximum time in milliseconds to wait for network and
 *                 other events. Note: there is no guarantee that function
 *                 blocks for the specified amount of time. The real processing
 *                 time can be shorter (if some data or connection timeout
 *                 comes earlier) or longer (if data processing requires more
 *                 time, especially in user callbacks).
 *                 If set to '0' then function does not block and processes
 *                 only already available data (if any).
 *                 If set to '-1' then function waits for events
 *                 indefinitely (blocks until next network activity or
 *                 connection timeout).
 * @return #MHD_YES on success, #MHD_NO if this
 *         daemon was not started with the right
 *         options for this call or some serious
 *         unrecoverable error occurs.
 * @note Available since #MHD_VERSION 0x00097206
 * @ingroup event
  }
function MHD_run_wait(daemon:PMHD_Daemon; millisec:Tint32_t):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Run webserver operations. This method should be called by clients
 * in combination with #MHD_get_fdset and #MHD_get_timeout() if the
 * client-controlled select method is used.
 *
 * You can use this function instead of #MHD_run if you called
 * `select()` on the result from #MHD_get_fdset.  File descriptors in
 * the sets that are not controlled by MHD will be ignored.  Calling
 * this function instead of #MHD_run is more efficient as MHD will
 * not have to call `select()` again to determine which operations are
 * ready.
 *
 * If #MHD_get_timeout() returned #MHD_YES, than this function must be
 * called right after `select()` returns regardless of detected activity
 * on the daemon's FDs.
 *
 * This function cannot be used with daemon started with
 * #MHD_USE_INTERNAL_POLLING_THREAD flag.
 *
 * @param daemon daemon to run select loop for
 * @param read_fd_set read set
 * @param write_fd_set write set
 * @param except_fd_set except set
 * @return #MHD_NO on serious errors, #MHD_YES on success
 * @ingroup event
  }
function MHD_run_from_select(daemon:PMHD_Daemon; read_fd_set:Pfd_set; write_fd_set:Pfd_set; except_fd_set:Pfd_set):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Run webserver operations. This method should be called by clients
 * in combination with #MHD_get_fdset and #MHD_get_timeout() if the
 * client-controlled select method is used.
 * This function specifies FD_SETSIZE used when provided fd_sets were
 * created. It is important on platforms where FD_SETSIZE can be
 * overridden.
 *
 * You can use this function instead of #MHD_run if you called
 * 'select()' on the result from #MHD_get_fdset2().  File descriptors in
 * the sets that are not controlled by MHD will be ignored.  Calling
 * this function instead of #MHD_run() is more efficient as MHD will
 * not have to call 'select()' again to determine which operations are
 * ready.
 *
 * If #MHD_get_timeout() returned #MHD_YES, than this function must be
 * called right after 'select()' returns regardless of detected activity
 * on the daemon's FDs.
 *
 * This function cannot be used with daemon started with
 * #MHD_USE_INTERNAL_POLLING_THREAD flag.
 *
 * @param daemon the daemon to run select loop for
 * @param read_fd_set the read set
 * @param write_fd_set the write set
 * @param except_fd_set the except set
 * @param fd_setsize the value of FD_SETSIZE
 * @return #MHD_NO on serious errors, #MHD_YES on success
 * @sa #MHD_get_fdset2(), #MHD_OPTION_APP_FD_SETSIZE
 * @ingroup event
  }
function MHD_run_from_select2(daemon:PMHD_Daemon; read_fd_set:Pfd_set; write_fd_set:Pfd_set; except_fd_set:Pfd_set; fd_setsize:dword):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Run webserver operations. This method should be called by clients
 * in combination with #MHD_get_fdset and #MHD_get_timeout() if the
 * client-controlled select method is used.
 * This macro automatically substitutes current FD_SETSIZE value.
 * It is important on platforms where FD_SETSIZE can be overridden.
 *
 * You can use this function instead of #MHD_run if you called
 * 'select()' on the result from #MHD_get_fdset2().  File descriptors in
 * the sets that are not controlled by MHD will be ignored.  Calling
 * this function instead of #MHD_run() is more efficient as MHD will
 * not have to call 'select()' again to determine which operations are
 * ready.
 *
 * If #MHD_get_timeout() returned #MHD_YES, than this function must be
 * called right after 'select()' returns regardless of detected activity
 * on the daemon's FDs.
 *
 * This function cannot be used with daemon started with
 * #MHD_USE_INTERNAL_POLLING_THREAD flag.
 *
 * @param daemon the daemon to run select loop for
 * @param read_fd_set the read set
 * @param write_fd_set the write set
 * @param except_fd_set the except set
 * @param fd_setsize the value of FD_SETSIZE
 * @return #MHD_NO on serious errors, #MHD_YES on success
 * @sa #MHD_get_fdset2(), #MHD_OPTION_APP_FD_SETSIZE
 * @ingroup event
  }

{ **************** Connection handling functions *****************  }
{*
 * Get all of the headers from the request.
 *
 * @param connection connection to get values from
 * @param kind types of values to iterate over, can be a bitmask
 * @param iterator callback to call on each header;
 *        may be NULL (then just count headers)
 * @param iterator_cls extra argument to @a iterator
 * @return number of entries iterated over,
 *         -1 if connection is NULL.
 * @ingroup request
  }
function MHD_get_connection_values(connection:PMHD_Connection; kind:TMHD_ValueKind; iterator:TMHD_KeyValueIterator; iterator_cls:pointer):longint;cdecl;external libmicrohttpd;
{*
 * Get all of the headers from the request.
 *
 * @param connection connection to get values from
 * @param kind types of values to iterate over, can be a bitmask
 * @param iterator callback to call on each header;
 *        may be NULL (then just count headers)
 * @param iterator_cls extra argument to @a iterator
 * @return number of entries iterated over,
 *         -1 if connection is NULL.
 * @note Available since #MHD_VERSION 0x00096400
 * @ingroup request
  }
function MHD_get_connection_values_n(connection:PMHD_Connection; kind:TMHD_ValueKind; iterator:TMHD_KeyValueIteratorN; iterator_cls:pointer):longint;cdecl;external libmicrohttpd;
{*
 * This function can be used to add an entry to the HTTP headers of a
 * connection (so that the #MHD_get_connection_values function will
 * return them -- and the `struct MHD_PostProcessor` will also see
 * them).  This maybe required in certain situations (see Mantis
 * #1399) where (broken) HTTP implementations fail to supply values
 * needed by the post processor (or other parts of the application).
 *
 * This function MUST only be called from within the
 * #MHD_AccessHandlerCallback (otherwise, access maybe improperly
 * synchronized).  Furthermore, the client must guarantee that the key
 * and value arguments are 0-terminated strings that are NOT freed
 * until the connection is closed.  (The easiest way to do this is by
 * passing only arguments to permanently allocated strings.).
 *
 * @param connection the connection for which a
 *  value should be set
 * @param kind kind of the value
 * @param key key for the value
 * @param value the value itself
 * @return #MHD_NO if the operation could not be
 *         performed due to insufficient memory;
 *         #MHD_YES on success
 * @ingroup request
  }
function MHD_set_connection_value(connection:PMHD_Connection; kind:TMHD_ValueKind; key:Pchar; value:Pchar):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * This function can be used to add an arbitrary entry to connection.
 * This function could add entry with binary zero, which is allowed
 * for #MHD_GET_ARGUMENT_KIND. For other kind on entries it is
 * recommended to use #MHD_set_connection_value.
 *
 * This function MUST only be called from within the
 * #MHD_AccessHandlerCallback (otherwise, access maybe improperly
 * synchronized).  Furthermore, the client must guarantee that the key
 * and value arguments are 0-terminated strings that are NOT freed
 * until the connection is closed.  (The easiest way to do this is by
 * passing only arguments to permanently allocated strings.).
 *
 * @param connection the connection for which a
 *  value should be set
 * @param kind kind of the value
 * @param key key for the value, must be zero-terminated
 * @param key_size number of bytes in @a key (excluding 0-terminator)
 * @param value the value itself, must be zero-terminated
 * @param value_size number of bytes in @a value (excluding 0-terminator)
 * @return #MHD_NO if the operation could not be
 *         performed due to insufficient memory;
 *         #MHD_YES on success
 * @note Available since #MHD_VERSION 0x00096400
 * @ingroup request
  }
function MHD_set_connection_value_n(connection:PMHD_Connection; kind:TMHD_ValueKind; key:Pchar; key_size:Tsize_t; value:Pchar; 
           value_size:Tsize_t):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Sets the global error handler to a different implementation.
 *
 * @a cb will only be called in the case of typically fatal, serious internal
 * consistency issues or serious system failures like failed lock of mutex.
 *
 * These issues should only arise in the case of serious memory corruption or
 * similar problems with the architecture, there is no safe way to continue
 * even for closing of the application.
 *
 * The default implementation that is used if no panic function is set simply
 * prints an error message and calls `abort()`.
 * Alternative implementations might call `exit()` or other similar functions.
 *
 * @param cb new error handler or NULL to use default handler
 * @param cls passed to @a cb
 * @ingroup logging
  }
procedure MHD_set_panic_func(cb:TMHD_PanicCallback; cls:pointer);cdecl;external libmicrohttpd;
{*
 * Process escape sequences ('%HH') Updates val in place; the
 * result cannot be larger than the input.
 * The result is still be 0-terminated.
 *
 * @param val value to unescape (modified in the process)
 * @return length of the resulting val (`strlen(val)` may be
 *  shorter afterwards due to elimination of escape sequences)
  }
function MHD_http_unescape(val:Pchar):Tsize_t;cdecl;external libmicrohttpd;
{*
 * Get a particular header value.  If multiple
 * values match the kind, return any one of them.
 *
 * @param connection connection to get values from
 * @param kind what kind of value are we looking for
 * @param key the header to look for, NULL to lookup 'trailing' value without a key
 * @return NULL if no such item was found
 * @ingroup request
  }
function MHD_lookup_connection_value(connection:PMHD_Connection; kind:TMHD_ValueKind; key:Pchar):Pchar;cdecl;external libmicrohttpd;
{*
 * Get a particular header value.  If multiple
 * values match the kind, return any one of them.
 * @note Since MHD_VERSION 0x00096304
 *
 * @param connection connection to get values from
 * @param kind what kind of value are we looking for
 * @param key the header to look for, NULL to lookup 'trailing' value without a key
 * @param key_size the length of @a key in bytes
 * @param[out] value_ptr the pointer to variable, which will be set to found value,
 *                       will not be updated if key not found,
 *                       could be NULL to just check for presence of @a key
 * @param[out] value_size_ptr the pointer variable, which will set to found value,
 *                            will not be updated if key not found,
 *                            could be NULL
 * @return #MHD_YES if key is found,
 *         #MHD_NO otherwise.
 * @ingroup request
  }
function MHD_lookup_connection_value_n(connection:PMHD_Connection; kind:TMHD_ValueKind; key:Pchar; key_size:Tsize_t; value_ptr:PPchar; 
           value_size_ptr:Psize_t):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Queue a response to be transmitted to the client (as soon as
 * possible but after #MHD_AccessHandlerCallback returns).
 *
 * For any active connection this function must be called
 * only by #MHD_AccessHandlerCallback callback.
 *
 * For suspended connection this function can be called at any moment (this
 * behaviour is deprecated and will be removed!). Response  will be sent
 * as soon as connection is resumed.
 *
 * For single thread environment, when MHD is used in "external polling" mode
 * (without MHD_USE_SELECT_INTERNALLY) this function can be called any
 * time (this behaviour is deprecated and will be removed!).
 *
 * If HTTP specifications require use no body in reply, like @a status_code with
 * value 1xx, the response body is automatically not sent even if it is present
 * in the response. No "Content-Length" or "Transfer-Encoding" headers are
 * generated and added.
 *
 * When the response is used to respond HEAD request or used with @a status_code
 * #MHD_HTTP_NOT_MODIFIED, then response body is not sent, but "Content-Length"
 * header is added automatically based the size of the body in the response.
 * If body size it set to #MHD_SIZE_UNKNOWN or chunked encoding is enforced
 * then "Transfer-Encoding: chunked" header (for HTTP/1.1 only) is added instead
 * of "Content-Length" header. For example, if response with zero-size body is
 * used for HEAD request, then "Content-Length: 0" is added automatically to
 * reply headers.
 * @sa #MHD_RF_HEAD_ONLY_RESPONSE
 *
 * In situations, where reply body is required, like answer for the GET request
 * with @a status_code #MHD_HTTP_OK, headers "Content-Length" (for known body
 * size) or "Transfer-Encoding: chunked" (for #MHD_SIZE_UNKNOWN with HTTP/1.1)
 * are added automatically.
 * In practice, the same response object can be used to respond to both HEAD and
 * GET requests.
 *
 * @param connection the connection identifying the client
 * @param status_code HTTP status code (i.e. #MHD_HTTP_OK)
 * @param response response to transmit, the NULL is tolerated
 * @return #MHD_NO on error (reply already sent, response is NULL),
 *         #MHD_YES on success or if message has been queued
 * @ingroup response
 * @sa #MHD_AccessHandlerCallback
  }
function MHD_queue_response(connection:PMHD_Connection; status_code:dword; response:PMHD_Response):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Suspend handling of network data for a given connection.
 * This can be used to dequeue a connection from MHD's event loop
 * (not applicable to thread-per-connection!) for a while.
 *
 * If you use this API in conjunction with an "internal" socket polling,
 * you must set the option #MHD_USE_ITC to ensure that a resumed
 * connection is immediately processed by MHD.
 *
 * Suspended connections continue to count against the total number of
 * connections allowed (per daemon, as well as per IP, if such limits
 * are set).  Suspended connections will NOT time out; timeouts will
 * restart when the connection handling is resumed.  While a
 * connection is suspended, MHD will not detect disconnects by the
 * client.
 *
 * The only safe way to call this function is to call it from the
 * #MHD_AccessHandlerCallback or #MHD_ContentReaderCallback.
 *
 * Finally, it is an API violation to call #MHD_stop_daemon while
 * having suspended connections (this will at least create memory and
 * socket leaks or lead to undefined behavior).  You must explicitly
 * resume all connections before stopping the daemon.
 *
 * @param connection the connection to suspend
 *
 * @sa #MHD_AccessHandlerCallback
  }
procedure MHD_suspend_connection(connection:PMHD_Connection);cdecl;external libmicrohttpd;
{*
 * Resume handling of network data for suspended connection.  It is
 * safe to resume a suspended connection at any time.  Calling this
 * function on a connection that was not previously suspended will
 * result in undefined behavior.
 *
 * If you are using this function in "external" sockets polling mode, you must
 * make sure to run #MHD_run() and #MHD_get_timeout() afterwards (before
 * again calling #MHD_get_fdset()), as otherwise the change may not be
 * reflected in the set returned by #MHD_get_fdset() and you may end up
 * with a connection that is stuck until the next network activity.
 *
 * @param connection the connection to resume
  }
procedure MHD_resume_connection(connection:PMHD_Connection);cdecl;external libmicrohttpd;
{ **************** Response manipulation functions *****************  }
{*
 * Flags for special handling of responses.
  }
{*
   * Default: no special flags.
   * @note Available since #MHD_VERSION 0x00093701
    }
{*
   * Only respond in conservative (dumb) HTTP/1.0-compatible mode.
   * Response still use HTTP/1.1 version in header, but always close
   * the connection after sending the response and do not use chunked
   * encoding for the response.
   * You can also set the #MHD_RF_HTTP_1_0_SERVER flag to force
   * HTTP/1.0 version in the response.
   * Responses are still compatible with HTTP/1.1.
   * This option can be used to communicate with some broken client, which
   * does not implement HTTP/1.1 features, but advertises HTTP/1.1 support.
   * @note Available since #MHD_VERSION 0x00097308
    }
{*
   * The same as #MHD_RF_HTTP_1_0_COMPATIBLE_STRICT
   * @note Available since #MHD_VERSION 0x00093701
    }
{*
   * Only respond in HTTP 1.0-mode.
   * Contrary to the #MHD_RF_HTTP_1_0_COMPATIBLE_STRICT flag, the response's
   * HTTP version will always be set to 1.0 and keep-alive connections
   * will be used if explicitly requested by the client.
   * The "Connection:" header will be added for both "close" and "keep-alive"
   * connections.
   * Chunked encoding will not be used for the response.
   * Due to backward compatibility, responses still can be used with
   * HTTP/1.1 clients.
   * This option can be used to emulate HTTP/1.0 server (for response part
   * only as chunked encoding in requests (if any) is processed by MHD).
   * @note Available since #MHD_VERSION 0x00097308
    }
{*
   * The same as #MHD_RF_HTTP_1_0_SERVER
   * @note Available since #MHD_VERSION 0x00096000
    }
{*
   * Disable sanity check preventing clients from manually
   * setting the HTTP content length option.
   * Allow to set several "Content-Length" headers. These headers will
   * be used even with replies without body.
   * @note Available since #MHD_VERSION 0x00096702
    }
{*
   * Enable sending of "Connection: keep-alive" header even for
   * HTTP/1.1 clients when "Keep-Alive" connection is used.
   * Disabled by default for HTTP/1.1 clients as per RFC.
   * @note Available since #MHD_VERSION 0x00097310
    }
{*
   * Enable special processing of the response as body-less (with undefined
   * body size). No automatic "Content-Length" or "Transfer-Encoding: chunked"
   * headers are added when the response is used with #MHD_HTTP_NOT_MODIFIED
   * code or to respond to HEAD request.
   * The flag also allow to set arbitrary "Content-Length" by
   * MHD_add_response_header() function.
   * This flag value can be used only with responses created without body
   * (zero-size body).
   * Responses with this flag enabled cannot be used in situations where
   * reply body must be sent to the client.
   * This flag is primarily intended to be used when automatic "Content-Length"
   * header is undesirable in response to HEAD requests.
   * @note Available since #MHD_VERSION 0x00097701
    }
type
  TMHD_ResponseFlags =  Longint;
  Const
    MHD_RF_NONE = 0;
    MHD_RF_HTTP_1_0_COMPATIBLE_STRICT = 1 shl 0;
    MHD_RF_HTTP_VERSION_1_0_ONLY = 1 shl 0;
    MHD_RF_HTTP_1_0_SERVER = 1 shl 1;
    MHD_RF_HTTP_VERSION_1_0_RESPONSE = 1 shl 1;
    MHD_RF_INSANITY_HEADER_CONTENT_LENGTH = 1 shl 2;
    MHD_RF_SEND_KEEP_ALIVE_HEADER = 1 shl 3;
    MHD_RF_HEAD_ONLY_RESPONSE = 1 shl 4;

{*
 * MHD options (for future extensions).
  }
{*
   * End of the list of options.
    }
type
  TMHD_ResponseOptions =  Longint;
  Const
    MHD_RO_END = 0;

{*
 * Set special flags and options for a response.
 *
 * @param response the response to modify
 * @param flags to set for the response
 * @param ... #MHD_RO_END terminated list of options
 * @return #MHD_YES on success, #MHD_NO on error
  }

function MHD_set_response_options(response:PMHD_Response; flags:TMHD_ResponseFlags; args:array of const):TMHD_Result;cdecl;external libmicrohttpd;
function MHD_set_response_options(response:PMHD_Response; flags:TMHD_ResponseFlags):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Create a response object.
 * The response object can be extended with header information and then be used
 * any number of times.
 *
 * If response object is used to answer HEAD request then the body of the
 * response is not used, while all headers (including automatic headers) are
 * used.
 *
 * @param size size of the data portion of the response, #MHD_SIZE_UNKNOWN for unknown
 * @param block_size preferred block size for querying crc (advisory only,
 *                   MHD may still call @a crc using smaller chunks); this
 *                   is essentially the buffer size used for IO, clients
 *                   should pick a value that is appropriate for IO and
 *                   memory performance requirements
 * @param crc callback to use to obtain response data
 * @param crc_cls extra argument to @a crc
 * @param crfc callback to call to free @a crc_cls resources
 * @return NULL on error (i.e. invalid arguments, out of memory)
 * @ingroup response
  }
function MHD_create_response_from_callback(size:Tuint64_t; block_size:Tsize_t; crc:TMHD_ContentReaderCallback; crc_cls:pointer; crfc:TMHD_ContentReaderFreeCallback):PMHD_Response;cdecl;external libmicrohttpd;
{*
 * Create a response object.
 * The response object can be extended with header information and then be used
 * any number of times.
 *
 * If response object is used to answer HEAD request then the body of the
 * response is not used, while all headers (including automatic headers) are
 * used.
 *
 * @param size size of the @a data portion of the response
 * @param data the data itself
 * @param must_free libmicrohttpd should free data when done
 * @param must_copy libmicrohttpd must make a copy of @a data
 *        right away, the data may be released anytime after
 *        this call returns
 * @return NULL on error (i.e. invalid arguments, out of memory)
 * @deprecated use #MHD_create_response_from_buffer instead
 * @ingroup response
  }
function MHD_create_response_from_data(size:Tsize_t; data:pointer; must_free:longint; must_copy:longint):PMHD_Response;cdecl;external libmicrohttpd;
{*
 * Specification for how MHD should treat the memory buffer
 * given for the response.
 * @ingroup response
  }
{*
   * Buffer is a persistent (static/global) buffer that won't change
   * for at least the lifetime of the response, MHD should just use
   * it, not free it, not copy it, just keep an alias to it.
   * @ingroup response
    }
{*
   * Buffer is heap-allocated with `malloc()` (or equivalent) and
   * should be freed by MHD after processing the response has
   * concluded (response reference counter reaches zero).
   * The more portable way to automatically free the buffer is function
   * MHD_create_response_from_buffer_with_free_callback() with '&free' as
   * crfc parameter as it does not require to use the same runtime library.
   * @warning It is critical to make sure that the same C-runtime library
   *          is used by both application and MHD (especially
   *          important for W32).
   * @ingroup response
    }
{*
   * Buffer is in transient memory, but not on the heap (for example,
   * on the stack or non-`malloc()` allocated) and only valid during the
   * call to #MHD_create_response_from_buffer.  MHD must make its
   * own private copy of the data for processing.
   * @ingroup response
    }
type
  TMHD_ResponseMemoryMode =  Longint;
  Const
    MHD_RESPMEM_PERSISTENT = 0;
    MHD_RESPMEM_MUST_FREE = 1;
    MHD_RESPMEM_MUST_COPY = 2;

{*
 * Create a response object with the content of provided buffer used as
 * the response body.
 *
 * The response object can be extended with header information and then
 * be used any number of times.
 *
 * If response object is used to answer HEAD request then the body
 * of the response is not used, while all headers (including automatic
 * headers) are used.
 *
 * @param size size of the data portion of the response
 * @param buffer size bytes containing the response's data portion
 * @param mode flags for buffer management
 * @return NULL on error (i.e. invalid arguments, out of memory)
 * @ingroup response
  }

function MHD_create_response_from_buffer(size:Tsize_t; buffer:pointer; mode:TMHD_ResponseMemoryMode):PMHD_Response;cdecl;external libmicrohttpd;
{*
 * Create a response object with the content of provided statically allocated
 * buffer used as the response body.
 *
 * The buffer must be valid for the lifetime of the response. The easiest way
 * to achieve this is to use a statically allocated buffer.
 *
 * The response object can be extended with header information and then
 * be used any number of times.
 *
 * If response object is used to answer HEAD request then the body
 * of the response is not used, while all headers (including automatic
 * headers) are used.
 *
 * @param size the size of the data in @a buffer, can be zero
 * @param buffer the buffer with the data for the response body, can be NULL
 *               if @a size is zero
 * @return NULL on error (i.e. invalid arguments, out of memory)
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup response
  }
function MHD_create_response_from_buffer_static(size:Tsize_t; buffer:pointer):PMHD_Response;cdecl;external libmicrohttpd;
{*
 * Create a response object with the content of provided temporal buffer
 * used as the response body.
 *
 * An internal copy of the buffer will be made automatically, so buffer have
 * to be valid only during the call of this function (as a typical example:
 * buffer is a local (non-static) array).
 *
 * The response object can be extended with header information and then
 * be used any number of times.
 *
 * If response object is used to answer HEAD request then the body
 * of the response is not used, while all headers (including automatic
 * headers) are used.
 *
 * @param size the size of the data in @a buffer, can be zero
 * @param buffer the buffer with the data for the response body, can be NULL
 *               if @a size is zero
 * @return NULL on error (i.e. invalid arguments, out of memory)
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup response
  }
function MHD_create_response_from_buffer_copy(size:Tsize_t; buffer:pointer):PMHD_Response;cdecl;external libmicrohttpd;
{*
 * Create a response object with the content of provided buffer used as
 * the response body.
 *
 * The response object can be extended with header information and then
 * be used any number of times.
 *
 * If response object is used to answer HEAD request then the body
 * of the response is not used, while all headers (including automatic
 * headers) are used.
 *
 * @param size size of the data portion of the response
 * @param buffer size bytes containing the response's data portion
 * @param crfc function to call to free the @a buffer
 * @return NULL on error (i.e. invalid arguments, out of memory)
 * @note Available since #MHD_VERSION 0x00096000
 * @ingroup response
  }
function MHD_create_response_from_buffer_with_free_callback(size:Tsize_t; buffer:pointer; crfc:TMHD_ContentReaderFreeCallback):PMHD_Response;cdecl;external libmicrohttpd;
{*
 * Create a response object with the content of provided buffer used as
 * the response body.
 *
 * The response object can be extended with header information and then
 * be used any number of times.
 *
 * If response object is used to answer HEAD request then the body
 * of the response is not used, while all headers (including automatic
 * headers) are used.
 *
 * @param size size of the data portion of the response
 * @param buffer size bytes containing the response's data portion
 * @param crfc function to call to cleanup, if set to NULL then callback
 *             is not called
 * @param crfc_cls an argument for @a crfc
 * @return NULL on error (i.e. invalid arguments, out of memory)
 * @note Available since #MHD_VERSION 0x00097302
 * @note 'const' qualifier is used for @a buffer since #MHD_VERSION 0x00097701
 * @ingroup response
  }
function MHD_create_response_from_buffer_with_free_callback_cls(size:Tsize_t; buffer:pointer; crfc:TMHD_ContentReaderFreeCallback; crfc_cls:pointer):PMHD_Response;cdecl;external libmicrohttpd;
{*
 * Create a response object with the content of provided file used as
 * the response body.
 *
 * The response object can be extended with header information and then
 * be used any number of times.
 *
 * If response object is used to answer HEAD request then the body
 * of the response is not used, while all headers (including automatic
 * headers) are used.
 *
 * @param size size of the data portion of the response
 * @param fd file descriptor referring to a file on disk with the
 *        data; will be closed when response is destroyed;
 *        fd should be in 'blocking' mode
 * @return NULL on error (i.e. invalid arguments, out of memory)
 * @ingroup response
  }
function MHD_create_response_from_fd(size:Tsize_t; fd:longint):PMHD_Response;cdecl;external libmicrohttpd;
{*
 * Create a response object with the response body created by reading
 * the provided pipe.
 *
 * The response object can be extended with header information and
 * then be used ONLY ONCE.
 *
 * If response object is used to answer HEAD request then the body
 * of the response is not used, while all headers (including automatic
 * headers) are used.
 *
 * @param fd file descriptor referring to a read-end of a pipe with the
 *        data; will be closed when response is destroyed;
 *        fd should be in 'blocking' mode
 * @return NULL on error (i.e. invalid arguments, out of memory)
 * @note Available since #MHD_VERSION 0x00097102
 * @ingroup response
  }
function MHD_create_response_from_pipe(fd:longint):PMHD_Response;cdecl;external libmicrohttpd;
{*
 * Create a response object with the content of provided file used as
 * the response body.
 *
 * The response object can be extended with header information and then
 * be used any number of times.
 *
 * If response object is used to answer HEAD request then the body
 * of the response is not used, while all headers (including automatic
 * headers) are used.
 *
 * @param size size of the data portion of the response;
 *        sizes larger than 2 GiB may be not supported by OS or
 *        MHD build; see ::MHD_FEATURE_LARGE_FILE
 * @param fd file descriptor referring to a file on disk with the
 *        data; will be closed when response is destroyed;
 *        fd should be in 'blocking' mode
 * @return NULL on error (i.e. invalid arguments, out of memory)
 * @ingroup response
  }
function MHD_create_response_from_fd64(size:Tuint64_t; fd:longint):PMHD_Response;cdecl;external libmicrohttpd;
{*
 * Create a response object with the content of provided file with
 * specified offset used as the response body.
 *
 * The response object can be extended with header information and then
 * be used any number of times.
 *
 * If response object is used to answer HEAD request then the body
 * of the response is not used, while all headers (including automatic
 * headers) are used.
 *
 * @param size size of the data portion of the response
 * @param fd file descriptor referring to a file on disk with the
 *        data; will be closed when response is destroyed;
 *        fd should be in 'blocking' mode
 * @param offset offset to start reading from in the file;
 *        Be careful! `off_t` may have been compiled to be a
 *        64-bit variable for MHD, in which case your application
 *        also has to be compiled using the same options! Read
 *        the MHD manual for more details.
 * @return NULL on error (i.e. invalid arguments, out of memory)
 * @ingroup response
  }
function MHD_create_response_from_fd_at_offset(size:Tsize_t; fd:longint; offset:Toff_t):PMHD_Response;cdecl;external libmicrohttpd;
{*
 * Create a response object with the content of provided file with
 * specified offset used as the response body.
 *
 * The response object can be extended with header information and then
 * be used any number of times.
 *
 * If response object is used to answer HEAD request then the body
 * of the response is not used, while all headers (including automatic
 * headers) are used.
 *
 * @param size size of the data portion of the response;
 *        sizes larger than 2 GiB may be not supported by OS or
 *        MHD build; see ::MHD_FEATURE_LARGE_FILE
 * @param fd file descriptor referring to a file on disk with the
 *        data; will be closed when response is destroyed;
 *        fd should be in 'blocking' mode
 * @param offset offset to start reading from in the file;
 *        reading file beyond 2 GiB may be not supported by OS or
 *        MHD build; see ::MHD_FEATURE_LARGE_FILE
 * @return NULL on error (i.e. invalid arguments, out of memory)
 * @ingroup response
  }
function MHD_create_response_from_fd_at_offset64(size:Tuint64_t; fd:longint; offset:Tuint64_t):PMHD_Response;cdecl;external libmicrohttpd;
{*
 * Create a response object with an array of memory buffers
 * used as the response body.
 *
 * The response object can be extended with header information and then
 * be used any number of times.
 *
 * If response object is used to answer HEAD request then the body
 * of the response is not used, while all headers (including automatic
 * headers) are used.
 *
 * @param iov the array for response data buffers, an internal copy of this
 *        will be made
 * @param iovcnt the number of elements in @a iov
 * @param free_cb the callback to clean up any data associated with @a iov when
 *        the response is destroyed.
 * @param cls the argument passed to @a free_cb
 * @return NULL on error (i.e. invalid arguments, out of memory)
 * @note Available since #MHD_VERSION 0x00097204
 * @ingroup response
  }
function MHD_create_response_from_iovec(iov:PMHD_IoVec; iovcnt:dword; free_cb:TMHD_ContentReaderFreeCallback; cls:pointer):PMHD_Response;cdecl;external libmicrohttpd;
{*
 * Create a response object with empty (zero size) body.
 *
 * The response object can be extended with header information and then be used
 * any number of times.
 *
 * This function is a faster equivalent of #MHD_create_response_from_buffer call
 * with zero size combined with call of #MHD_set_response_options.
 *
 * @param flags the flags for the new response object
 * @return NULL on error (i.e. invalid arguments, out of memory),
 *         the pointer to the created response object otherwise
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup response
  }
function MHD_create_response_empty(flags:TMHD_ResponseFlags):PMHD_Response;cdecl;external libmicrohttpd;
{*
 * Enumeration for actions MHD should perform on the underlying socket
 * of the upgrade.  This API is not finalized, and in particular
 * the final set of actions is yet to be decided. This is just an
 * idea for what we might want.
  }
{*
   * Close the socket, the application is done with it.
   *
   * Takes no extra arguments.
    }
{*
   * Enable CORKing on the underlying socket.
    }
{*
   * Disable CORKing on the underlying socket.
    }
type
  TMHD_UpgradeAction =  Longint;
  Const
    MHD_UPGRADE_ACTION_CLOSE = 0;
    MHD_UPGRADE_ACTION_CORK_ON = 1;
    MHD_UPGRADE_ACTION_CORK_OFF = 2;

{*
 * Handle given to the application to manage special
 * actions relating to MHD responses that "upgrade"
 * the HTTP protocol (i.e. to WebSockets).
  }
type
  PMHD_UpgradeResponseHandle = ^TMHD_UpgradeResponseHandle;
  TMHD_UpgradeResponseHandle = record
      {undefined structure}
    end;

{*
 * This connection-specific callback is provided by MHD to
 * applications (unusual) during the #MHD_UpgradeHandler.
 * It allows applications to perform 'special' actions on
 * the underlying socket from the upgrade.
 *
 * @param urh the handle identifying the connection to perform
 *            the upgrade @a action on.
 * @param action which action should be performed
 * @param ... arguments to the action (depends on the action)
 * @return #MHD_NO on error, #MHD_YES on success
  }

function MHD_upgrade_action(urh:PMHD_UpgradeResponseHandle; action:TMHD_UpgradeAction; args:array of const):TMHD_Result;cdecl;external libmicrohttpd;
function MHD_upgrade_action(urh:PMHD_UpgradeResponseHandle; action:TMHD_UpgradeAction):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Function called after a protocol "upgrade" response was sent
 * successfully and the socket should now be controlled by some
 * protocol other than HTTP.
 *
 * Any data already received on the socket will be made available in
 * @e extra_in.  This can happen if the application sent extra data
 * before MHD send the upgrade response.  The application should
 * treat data from @a extra_in as if it had read it from the socket.
 *
 * Note that the application must not close() @a sock directly,
 * but instead use #MHD_upgrade_action() for special operations
 * on @a sock.
 *
 * Data forwarding to "upgraded" @a sock will be started as soon
 * as this function return.
 *
 * Except when in 'thread-per-connection' mode, implementations
 * of this function should never block (as it will still be called
 * from within the main event loop).
 *
 * @param cls closure, whatever was given to #MHD_create_response_for_upgrade().
 * @param connection original HTTP connection handle,
 *                   giving the function a last chance
 *                   to inspect the original HTTP request
 * @param req_cls last value left in `req_cls` of the `MHD_AccessHandlerCallback`
 * @param extra_in if we happened to have read bytes after the
 *                 HTTP header already (because the client sent
 *                 more than the HTTP header of the request before
 *                 we sent the upgrade response),
 *                 these are the extra bytes already read from @a sock
 *                 by MHD.  The application should treat these as if
 *                 it had read them from @a sock.
 * @param extra_in_size number of bytes in @a extra_in
 * @param sock socket to use for bi-directional communication
 *        with the client.  For HTTPS, this may not be a socket
 *        that is directly connected to the client and thus certain
 *        operations (TCP-specific setsockopt(), getsockopt(), etc.)
 *        may not work as expected (as the socket could be from a
 *        socketpair() or a TCP-loopback).  The application is expected
 *        to perform read()/recv() and write()/send() calls on the socket.
 *        The application may also call shutdown(), but must not call
 *        close() directly.
 * @param urh argument for #MHD_upgrade_action()s on this @a connection.
 *        Applications must eventually use this callback to (indirectly)
 *        perform the close() action on the @a sock.
  }
type

  TMHD_UpgradeHandler = procedure (cls:pointer; connection:PMHD_Connection; req_cls:pointer; extra_in:Pchar; extra_in_size:Tsize_t; 
                sock:TMHD_socket; urh:PMHD_UpgradeResponseHandle);cdecl;
{*
 * Create a response object that can be used for 101 UPGRADE
 * responses, for example to implement WebSockets.  After sending the
 * response, control over the data stream is given to the callback (which
 * can then, for example, start some bi-directional communication).
 * If the response is queued for multiple connections, the callback
 * will be called for each connection.  The callback
 * will ONLY be called after the response header was successfully passed
 * to the OS; if there are communication errors before, the usual MHD
 * connection error handling code will be performed.
 *
 * Setting the correct HTTP code (i.e. MHD_HTTP_SWITCHING_PROTOCOLS)
 * and setting correct HTTP headers for the upgrade must be done
 * manually (this way, it is possible to implement most existing
 * WebSocket versions using this API; in fact, this API might be useful
 * for any protocol switch, not just WebSockets).  Note that
 * draft-ietf-hybi-thewebsocketprotocol-00 cannot be implemented this
 * way as the header "HTTP/1.1 101 WebSocket Protocol Handshake"
 * cannot be generated; instead, MHD will always produce "HTTP/1.1 101
 * Switching Protocols" (if the response code 101 is used).
 *
 * As usual, the response object can be extended with header
 * information and then be used any number of times (as long as the
 * header information is not connection-specific).
 *
 * @param upgrade_handler function to call with the "upgraded" socket
 * @param upgrade_handler_cls closure for @a upgrade_handler
 * @return NULL on error (i.e. invalid arguments, out of memory)
  }

function MHD_create_response_for_upgrade(upgrade_handler:TMHD_UpgradeHandler; upgrade_handler_cls:pointer):PMHD_Response;cdecl;external libmicrohttpd;
{*
 * Destroy a response object and associated resources.  Note that
 * libmicrohttpd may keep some of the resources around if the response
 * is still in the queue for some clients, so the memory may not
 * necessarily be freed immediately.
 *
 * @param response response to destroy
 * @ingroup response
  }
procedure MHD_destroy_response(response:PMHD_Response);cdecl;external libmicrohttpd;
{*
 * Add a header line to the response.
 *
 * When reply is generated with queued response, some headers are generated
 * automatically. Automatically generated headers are only sent to the client,
 * but not added back to the response object.
 *
 * The list of automatic headers:
 * + "Date" header is added automatically unless already set by
 *   this function
 *   @see #MHD_USE_SUPPRESS_DATE_NO_CLOCK
 * + "Content-Length" is added automatically when required, attempt to set
 *   it manually by this function is ignored.
 *   @see #MHD_RF_INSANITY_HEADER_CONTENT_LENGTH
 * + "Transfer-Encoding" with value "chunked" is added automatically,
 *   when chunked transfer encoding is used automatically. Same header with
 *   the same value can be set manually by this function to enforce chunked
 *   encoding, however for HTTP/1.0 clients chunked encoding will not be used
 *   and manually set "Transfer-Encoding" header is automatically removed
 *   for HTTP/1.0 clients
 * + "Connection" may be added automatically with value "Keep-Alive" (only
 *   for HTTP/1.0 clients) or "Close". The header "Connection" with value
 *   "Close" could be set by this function to enforce closure of
 *   the connection after sending this response. "Keep-Alive" cannot be
 *   enforced and will be removed automatically.
 *   @see #MHD_RF_SEND_KEEP_ALIVE_HEADER
 *
 * Some headers are pre-processed by this function:
 * * "Connection" headers are combined into single header entry, value is
 *   normilised, "Keep-Alive" tokens are removed.
 * * "Transfer-Encoding" header: the only one header is allowed, the only
 *   allowed value is "chunked".
 * * "Date" header: the only one header is allowed, the second added header
 *   replaces the first one.
 * * "Content-Length" application-defined header is not allowed.
 *   @see #MHD_RF_INSANITY_HEADER_CONTENT_LENGTH
 *
 * Headers are used in order as they were added.
 *
 * @param response the response to add a header to
 * @param header the header name to add, no need to be static, an internal copy
 *               will be created automatically
 * @param content the header value to add, no need to be static, an internal
 *                copy will be created automatically
 * @return #MHD_YES on success,
 *         #MHD_NO on error (i.e. invalid header or content format),
 *         or out of memory
 * @ingroup response
  }
function MHD_add_response_header(response:PMHD_Response; header:Pchar; content:Pchar):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Add a footer line to the response.
 *
 * @param response response to remove a header from
 * @param footer the footer to delete
 * @param content value to delete
 * @return #MHD_NO on error (i.e. invalid footer or content format).
 * @ingroup response
  }
function MHD_add_response_footer(response:PMHD_Response; footer:Pchar; content:Pchar):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Delete a header (or footer) line from the response.
 *
 * For "Connection" headers this function remove all tokens from existing
 * value. Successful result means that at least one token has been removed.
 * If all tokens are removed from "Connection" header, the empty "Connection"
 * header removed.
 *
 * @param response response to remove a header from
 * @param header the header to delete
 * @param content value to delete
 * @return #MHD_NO on error (no such header known)
 * @ingroup response
  }
function MHD_del_response_header(response:PMHD_Response; header:Pchar; content:Pchar):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Get all of the headers (and footers) added to a response.
 *
 * @param response response to query
 * @param iterator callback to call on each header;
 *        may be NULL (then just count headers)
 * @param iterator_cls extra argument to @a iterator
 * @return number of entries iterated over
 * @ingroup response
  }
function MHD_get_response_headers(response:PMHD_Response; iterator:TMHD_KeyValueIterator; iterator_cls:pointer):longint;cdecl;external libmicrohttpd;
{*
 * Get a particular header (or footer) from the response.
 *
 * @param response response to query
 * @param key which header to get
 * @return NULL if header does not exist
 * @ingroup response
  }
function MHD_get_response_header(response:PMHD_Response; key:Pchar):Pchar;cdecl;external libmicrohttpd;
{ ********************** PostProcessor functions **********************  }
{*
 * Create a `struct MHD_PostProcessor`.
 *
 * A `struct MHD_PostProcessor` can be used to (incrementally) parse
 * the data portion of a POST request.  Note that some buggy browsers
 * fail to set the encoding type.  If you want to support those, you
 * may have to call #MHD_set_connection_value with the proper encoding
 * type before creating a post processor (if no supported encoding
 * type is set, this function will fail).
 *
 * @param connection the connection on which the POST is
 *        happening (used to determine the POST format)
 * @param buffer_size maximum number of bytes to use for
 *        internal buffering (used only for the parsing,
 *        specifically the parsing of the keys).  A
 *        tiny value (256-1024) should be sufficient.
 *        Do NOT use a value smaller than 256.  For good
 *        performance, use 32 or 64k (i.e. 65536).
 * @param iter iterator to be called with the parsed data,
 *        Must NOT be NULL.
 * @param iter_cls first argument to @a iter
 * @return NULL on error (out of memory, unsupported encoding),
 *         otherwise a PP handle
 * @ingroup request
  }
function MHD_create_post_processor(connection:PMHD_Connection; buffer_size:Tsize_t; iter:TMHD_PostDataIterator; iter_cls:pointer):PMHD_PostProcessor;cdecl;external libmicrohttpd;
{*
 * Parse and process POST data.  Call this function when POST data is
 * available (usually during an #MHD_AccessHandlerCallback) with the
 * "upload_data" and "upload_data_size".  Whenever possible, this will
 * then cause calls to the #MHD_PostDataIterator.
 *
 * @param pp the post processor
 * @param post_data @a post_data_len bytes of POST data
 * @param post_data_len length of @a post_data
 * @return #MHD_YES on success, #MHD_NO on error
 *         (out-of-memory, iterator aborted, parse error)
 * @ingroup request
  }
function MHD_post_process(pp:PMHD_PostProcessor; post_data:Pchar; post_data_len:Tsize_t):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Release PostProcessor resources.
 *
 * @param pp the PostProcessor to destroy
 * @return #MHD_YES if processing completed nicely,
 *         #MHD_NO if there were spurious characters / formatting
 *                problems; it is common to ignore the return
 *                value of this function
 * @ingroup request
  }
function MHD_destroy_post_processor(pp:PMHD_PostProcessor):TMHD_Result;cdecl;external libmicrohttpd;
{ ********************* Digest Authentication functions ***************  }
{*
 * Length of the binary output of the MD5 hash function.
 * @sa #MHD_digest_get_hash_size()
 * @ingroup authentication
  }
const
  MHD_MD5_DIGEST_SIZE = 16;  
{*
 * Length of the binary output of the SHA-256 hash function.
 * @sa #MHD_digest_get_hash_size()
 * @ingroup authentication
  }
  MHD_SHA256_DIGEST_SIZE = 32;  
{*
 * Length of the binary output of the SHA-512/256 hash function.
 * @warning While this value is the same as the #MHD_SHA256_DIGEST_SIZE,
 *          the calculated digests for SHA-256 and SHA-512/256 are different.
 * @sa #MHD_digest_get_hash_size()
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup authentication
  }
  MHD_SHA512_256_DIGEST_SIZE = 32;  
{*
 * Base type of hash calculation.
 * Used as part of #MHD_DigestAuthAlgo3 values.
 *
 * @warning Not used directly by MHD API.
 * @note Available since #MHD_VERSION 0x00097701
  }
{*
   * Invalid hash algorithm value
    }
{*
   * MD5 hash algorithm.
   * As specified by RFC1321
    }
{*
   * SHA-256 hash algorithm.
   * As specified by FIPS PUB 180-4
    }
{*
   * SHA-512/256 hash algorithm.
   * As specified by FIPS PUB 180-4
    }
type
  TMHD_DigestBaseAlgo =  Longint;
  Const
    MHD_DIGEST_BASE_ALGO_INVALID = 0;
    MHD_DIGEST_BASE_ALGO_MD5 = 1 shl 0;
    MHD_DIGEST_BASE_ALGO_SHA256 = 1 shl 1;
    MHD_DIGEST_BASE_ALGO_SHA512_256 = 1 shl 2;

{*
 * The flag indicating non-session algorithm types,
 * like 'MD5', 'SHA-256' or 'SHA-512-256'.
 * @note Available since #MHD_VERSION 0x00097701
  }
  MHD_DIGEST_AUTH_ALGO3_NON_SESSION = 1 shl 6;  
{*
 * The flag indicating session algorithm types,
 * like 'MD5-sess', 'SHA-256-sess' or 'SHA-512-256-sess'.
 * @note Available since #MHD_VERSION 0x00097701
  }
  MHD_DIGEST_AUTH_ALGO3_SESSION = 1 shl 7;  
{*
 * Digest algorithm identification
 * @warning Do not be confused with #MHD_DigestAuthAlgorithm,
 *          which uses other values!
 * @note Available since #MHD_VERSION 0x00097701
  }
{*
   * Unknown or wrong algorithm type.
   * Used in struct MHD_DigestAuthInfo to indicate client value that
   * cannot by identified.
    }
{*
   * The 'MD5' algorithm, non-session version.
    }
{*
   * The 'MD5-sess' algorithm.
   * Not supported by MHD for authentication.
    }
{*
   * The 'SHA-256' algorithm, non-session version.
    }
{*
   * The 'SHA-256-sess' algorithm.
   * Not supported by MHD for authentication.
    }
{*
   * The 'SHA-512-256' (SHA-512/256) algorithm.
    }
{*
   * The 'SHA-512-256-sess' (SHA-512/256 session) algorithm.
   * Not supported by MHD for authentication.
    }
type
  TMHD_DigestAuthAlgo3 =  Longint;
  Const
    MHD_DIGEST_AUTH_ALGO3_INVALID = 0;
    MHD_DIGEST_AUTH_ALGO3_MD5 = MHD_DIGEST_BASE_ALGO_MD5 or MHD_DIGEST_AUTH_ALGO3_NON_SESSION;
    MHD_DIGEST_AUTH_ALGO3_MD5_SESSION = MHD_DIGEST_BASE_ALGO_MD5 or MHD_DIGEST_AUTH_ALGO3_SESSION;
    MHD_DIGEST_AUTH_ALGO3_SHA256 = MHD_DIGEST_BASE_ALGO_SHA256 or MHD_DIGEST_AUTH_ALGO3_NON_SESSION;
    MHD_DIGEST_AUTH_ALGO3_SHA256_SESSION = MHD_DIGEST_BASE_ALGO_SHA256 or MHD_DIGEST_AUTH_ALGO3_SESSION;
    MHD_DIGEST_AUTH_ALGO3_SHA512_256 = MHD_DIGEST_BASE_ALGO_SHA512_256 or MHD_DIGEST_AUTH_ALGO3_NON_SESSION;
    MHD_DIGEST_AUTH_ALGO3_SHA512_256_SESSION = MHD_DIGEST_BASE_ALGO_SHA512_256 or MHD_DIGEST_AUTH_ALGO3_SESSION;

{*
 * Get digest size for specified algorithm.
 *
 * The size of the digest specifies the size of the userhash, userdigest
 * and other parameters which size depends on used hash algorithm.
 * @param algo3 the algorithm to check
 * @return the size of the digest (either #MHD_MD5_DIGEST_SIZE or
 *         #MHD_SHA256_DIGEST_SIZE/MHD_SHA512_256_DIGEST_SIZE)
 *         or zero if the input value is not supported or not valid
 * @sa #MHD_digest_auth_calc_userdigest()
 * @sa #MHD_digest_auth_calc_userhash(), #MHD_digest_auth_calc_userhash_hex()
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup authentication
  }

function MHD_digest_get_hash_size(algo3:TMHD_DigestAuthAlgo3):Tsize_t;cdecl;external libmicrohttpd;
{*
 * Digest algorithm identification, allow multiple selection.
 *
 * #MHD_DigestAuthAlgo3 always can be casted to #MHD_DigestAuthMultiAlgo3, but
 * not vice versa.
 *
 * @note Available since #MHD_VERSION 0x00097701
  }
{*
   * Unknown or wrong algorithm type.
    }
{*
   * The 'MD5' algorithm, non-session version.
    }
{*
   * The 'MD5-sess' algorithm.
   * Not supported by MHD for authentication.
   * Reserved value.
    }
{*
   * The 'SHA-256' algorithm, non-session version.
    }
{*
   * The 'SHA-256-sess' algorithm.
   * Not supported by MHD for authentication.
   * Reserved value.
    }
{*
   * The 'SHA-512-256' (SHA-512/256) algorithm, non-session version.
    }
{*
   * The 'SHA-512-256-sess' (SHA-512/256 session) algorithm.
   * Not supported by MHD for authentication.
   * Reserved value.
    }
{*
   * SHA-256 or SHA-512/256 non-session algorithm, MHD will choose
   * the preferred or the matching one.
    }
{*
   * Any non-session algorithm, MHD will choose the preferred or
   * the matching one.
    }
{*
   * The SHA-256 or SHA-512/256 session algorithm.
   * Not supported by MHD.
   * Reserved value.
    }
{*
   * Any session algorithm.
   * Not supported by MHD.
   * Reserved value.
    }
{*
   * The MD5 algorithm, session or non-session.
   * Currently supported as non-session only.
    }
{*
   * The SHA-256 algorithm, session or non-session.
   * Currently supported as non-session only.
    }
{*
   * The SHA-512/256 algorithm, session or non-session.
   * Currently supported as non-session only.
    }
{*
   * The SHA-256 or SHA-512/256 algorithm, session or non-session.
   * Currently supported as non-session only.
    }
{*
   * Any algorithm, MHD will choose the preferred or the matching one.
    }
type
  TMHD_DigestAuthMultiAlgo3 =  Longint;
  Const
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

{*
 * Calculate "userhash", return it as binary data.
 *
 * The "userhash" is the hash of the string "username:realm".
 *
 * The "userhash" could be used to avoid sending username in cleartext in Digest
 * Authorization client's header.
 *
 * Userhash is not designed to hide the username in local database or files,
 * as username in cleartext is required for #MHD_digest_auth_check3() function
 * to check the response, but it can be used to hide username in HTTP headers.
 *
 * This function could be used when the new username is added to the username
 * database to save the "userhash" alongside with the username (preferably) or
 * when loading list of the usernames to generate the userhash for every loaded
 * username (this will cause delays at the start with the long lists).
 *
 * Once "userhash" is generated it could be used to identify users by clients
 * with "userhash" support.
 * Avoid repetitive usage of this function for the same username/realm
 * combination as it will cause excessive CPU load; save and re-use the result
 * instead.
 *
 * @param algo3 the algorithm for userhash calculations
 * @param username the username
 * @param realm the realm
 * @param[out] userhash_bin the output buffer for userhash as binary data;
 *                          if this function succeeds, then this buffer has
 *                          #MHD_digest_get_hash_size(algo3) bytes of userhash
 *                          upon return
 * @param bin_buf_size the size of the @a userhash_bin buffer, must be
 *                     at least #MHD_digest_get_hash_size(algo3) bytes long
 * @return MHD_YES on success,
 *         MHD_NO if @a bin_buf_size is too small or if @a algo3 algorithm is
 *         not supported (or external error has occurred,
 *         see #MHD_FEATURE_EXTERN_HASH)
 * @sa #MHD_digest_auth_calc_userhash_hex()
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup authentication
  }

function MHD_digest_auth_calc_userhash(algo3:TMHD_DigestAuthAlgo3; username:Pchar; realm:Pchar; userhash_bin:pointer; bin_buf_size:Tsize_t):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Calculate "userhash", return it as hexadecimal string.
 *
 * The "userhash" is the hash of the string "username:realm".
 *
 * The "userhash" could be used to avoid sending username in cleartext in Digest
 * Authorization client's header.
 *
 * Userhash is not designed to hide the username in local database or files,
 * as username in cleartext is required for #MHD_digest_auth_check3() function
 * to check the response, but it can be used to hide username in HTTP headers.
 *
 * This function could be used when the new username is added to the username
 * database to save the "userhash" alongside with the username (preferably) or
 * when loading list of the usernames to generate the userhash for every loaded
 * username (this will cause delays at the start with the long lists).
 *
 * Once "userhash" is generated it could be used to identify users by clients
 * with "userhash" support.
 * Avoid repetitive usage of this function for the same username/realm
 * combination as it will cause excessive CPU load; save and re-use the result
 * instead.
 *
 * @param algo3 the algorithm for userhash calculations
 * @param username the username
 * @param realm the realm
 * @param[out] userhash_hex the output buffer for userhash as hex string;
 *                          if this function succeeds, then this buffer has
 *                          #MHD_digest_get_hash_size(algo3)*2 chars long
 *                          userhash zero-terminated string
 * @param bin_buf_size the size of the @a userhash_bin buffer, must be
 *                     at least #MHD_digest_get_hash_size(algo3)*2+1 chars long
 * @return MHD_YES on success,
 *         MHD_NO if @a bin_buf_size is too small or if @a algo3 algorithm is
 *         not supported (or external error has occurred,
 *         see #MHD_FEATURE_EXTERN_HASH).
 * @sa #MHD_digest_auth_calc_userhash()
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup authentication
  }
function MHD_digest_auth_calc_userhash_hex(algo3:TMHD_DigestAuthAlgo3; username:Pchar; realm:Pchar; userhash_hex:Pchar; hex_buf_size:Tsize_t):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * The type of username used by client in Digest Authorization header
 *
 * Values are sorted so simplified checks could be used.
 * For example:
 * * (value <= MHD_DIGEST_AUTH_UNAME_TYPE_INVALID) is true if no valid username
 *   is provided by the client
 * * (value >= MHD_DIGEST_AUTH_UNAME_TYPE_USERHASH) is true if username is
 *   provided in any form
 * * (value >= MHD_DIGEST_AUTH_UNAME_TYPE_STANDARD) is true if username is
 *   provided in clear text (no userhash matching is needed)
 *
 * @note Available since #MHD_VERSION 0x00097701
  }
{*
   * No username parameter in in Digest Authorization header.
   * This should be treated as an error.
    }
{*
   * The 'username' parameter is used to specify the username.
    }
{*
   * The username is specified by 'username*' parameter with
   * the extended notation (see RFC 5987 #section-3.2.1).
   * The only difference between standard and extended types is
   * the way how username value is encoded in the header.
    }
{*
   * The username provided in form of 'userhash' as
   * specified by RFC 7616 #section-3.4.4.
   * @sa #MHD_digest_auth_calc_userhash_hex(), #MHD_digest_auth_calc_userhash()
    }
{*
   * The invalid combination of username parameters are used by client.
   * Either:
   * * both 'username' and 'username*' are used
   * * 'username*' is used with 'userhash=true'
   * * 'username*' used with invalid extended notation
   * * 'username' is not hexadecimal string, while 'userhash' set to 'true'
    }
type
  TMHD_DigestAuthUsernameType =  Longint;
  Const
    MHD_DIGEST_AUTH_UNAME_TYPE_MISSING = 0;
    MHD_DIGEST_AUTH_UNAME_TYPE_STANDARD = 1 shl 2;
    MHD_DIGEST_AUTH_UNAME_TYPE_EXTENDED = 1 shl 3;
    MHD_DIGEST_AUTH_UNAME_TYPE_USERHASH = 1 shl 1;
    MHD_DIGEST_AUTH_UNAME_TYPE_INVALID = 1 shl 0;

{*
 * The QOP ('quality of protection') types.
 * @note Available since #MHD_VERSION 0x00097701
  }
{*
   * Invalid/unknown QOP.
   * Used in struct MHD_DigestAuthInfo to indicate client value that
   * cannot by identified.
    }
{*
   * No QOP parameter.
   * As described in old RFC 2069 original specification.
   * This mode is not allowed by latest RFCs and should be used only to
   * communicate with clients that do not support more modern modes (with QOP
   * parameter).
   * This mode is less secure than other modes and inefficient.
    }
{*
   * The 'auth' QOP type.
    }
{*
   * The 'auth-int' QOP type.
   * Not supported by MHD for authentication.
    }
type
  TMHD_DigestAuthQOP =  Longint;
  Const
    MHD_DIGEST_AUTH_QOP_INVALID = 0;
    MHD_DIGEST_AUTH_QOP_NONE = 1 shl 0;
    MHD_DIGEST_AUTH_QOP_AUTH = 1 shl 1;
    MHD_DIGEST_AUTH_QOP_AUTH_INT = 1 shl 2;

{*
 * The QOP ('quality of protection') types, multiple selection.
 *
 * #MHD_DigestAuthQOP always can be casted to #MHD_DigestAuthMultiQOP, but
 * not vice versa.
 *
 * @note Available since #MHD_VERSION 0x00097701
  }
{*
   * Invalid/unknown QOP.
    }
{*
   * No QOP parameter.
   * As described in old RFC 2069 original specification.
   * This mode is not allowed by latest RFCs and should be used only to
   * communicate with clients that do not support more modern modes (with QOP
   * parameter).
   * This mode is less secure than other modes and inefficient.
    }
{*
   * The 'auth' QOP type.
    }
{*
   * The 'auth-int' QOP type.
   * Not supported by MHD.
   * Reserved value.
    }
{*
   * The 'auth' QOP type OR the old RFC2069 (no QOP) type.
   * In other words: any types except 'auth-int'.
   * RFC2069-compatible mode is allowed, thus this value should be used only
   * when it is really necessary.
    }
{*
   * Any 'auth' QOP type ('auth' or 'auth-int').
   * Currently supported as 'auth' QOP type only.
    }
type
  TMHD_DigestAuthMultiQOP =  Longint;
  Const
    MHD_DIGEST_AUTH_MULT_QOP_INVALID = MHD_DIGEST_AUTH_QOP_INVALID;
    MHD_DIGEST_AUTH_MULT_QOP_NONE = MHD_DIGEST_AUTH_QOP_NONE;
    MHD_DIGEST_AUTH_MULT_QOP_AUTH = MHD_DIGEST_AUTH_QOP_AUTH;
    MHD_DIGEST_AUTH_MULT_QOP_AUTH_INT = MHD_DIGEST_AUTH_QOP_AUTH_INT;
    MHD_DIGEST_AUTH_MULT_QOP_ANY_NON_INT = MHD_DIGEST_AUTH_QOP_NONE or MHD_DIGEST_AUTH_QOP_AUTH;
    MHD_DIGEST_AUTH_MULT_QOP_AUTH_ANY = MHD_DIGEST_AUTH_QOP_AUTH or MHD_DIGEST_AUTH_QOP_AUTH_INT;

{*
 * The invalid value of 'nc' parameter in client Digest Authorization header.
 * @note Available since #MHD_VERSION 0x00097701
  }
  MHD_DIGEST_AUTH_INVALID_NC_VALUE = 0;  
{*
 * Information from Digest Authorization client's header.
 *
 * All buffers pointed by any struct members are freed when #MHD_free() is
 * called for pointer to this structure.
 *
 * Application may modify buffers as needed until #MHD_free() is called for
 * pointer to this structure
 * @note Available since #MHD_VERSION 0x00097701
  }
{*
   * The algorithm as defined by client.
   * Set automatically to MD5 if not specified by client.
   * @warning Do not be confused with #MHD_DigestAuthAlgorithm,
   *          which uses other values!
    }
{*
   * The type of username used by client.
    }
{*
   * The username string.
   * Used only if username type is standard or extended, always NULL otherwise.
   * If extended notation is used, this string is pct-decoded string
   * with charset and language tag removed (i.e. it is original username
   * extracted from the extended notation).
   * When userhash is used by the client, this member is NULL and
   * @a userhash_hex and @a userhash_bin are set.
   * The buffer pointed by the @a username becomes invalid when the pointer
   * to the structure is freed by #MHD_free().
    }
{*
   * The length of the @a username.
   * When the @a username is NULL, this member is always zero.
    }
{*
   * The userhash string.
   * Valid only if username type is userhash.
   * This is unqoted string without decoding of the hexadecimal
   * digits (as provided by the client).
   * The buffer pointed by the @a userhash_hex becomes invalid when the pointer
   * to the structure is freed by #MHD_free().
   * @sa #MHD_digest_auth_calc_userhash_hex()
    }
{*
   * The length of the @a userhash_hex in characters.
   * The valid size should be #MHD_digest_get_hash_size(algo3) * 2 characters.
   * When the @a userhash_hex is NULL, this member is always zero.
    }
{*
   * The userhash decoded to binary form.
   * Used only if username type is userhash, always NULL otherwise.
   * When not NULL, this points to binary sequence @a userhash_hex_len /2 bytes
   * long.
   * The valid size should be #MHD_digest_get_hash_size(algo3) bytes.
   * The buffer pointed by the @a userhash_bin becomes invalid when the pointer
   * to the structure is freed by #MHD_free().
   * @warning This is a binary data, no zero termination.
   * @warning To avoid buffer overruns, always check the size of the data before
   *          use, because @a userhash_bin can point even to zero-sized
   *          data.
   * @sa #MHD_digest_auth_calc_userhash()
    }
{*
   * The 'opaque' parameter value, as specified by client.
   * NULL if not specified by client.
   * The buffer pointed by the @a opaque becomes invalid when the pointer
   * to the structure is freed by #MHD_free().
    }
{*
   * The length of the @a opaque.
   * When the @a opaque is NULL, this member is always zero.
    }
{*
   * The 'realm' parameter value, as specified by client.
   * NULL if not specified by client.
   * The buffer pointed by the @a realm becomes invalid when the pointer
   * to the structure is freed by #MHD_free().
    }
{*
   * The length of the @a realm.
   * When the @a realm is NULL, this member is always zero.
    }
{*
   * The 'qop' parameter value.
    }
{*
   * The length of the 'cnonce' parameter value, including possible
   * backslash-escape characters.
   * 'cnonce' is used in hash calculation, which is CPU-intensive procedure.
   * An application may want to reject too large cnonces to limit the CPU load.
   * A few kilobytes is a reasonable limit, typically cnonce is just 32-160
   * characters long.
    }
{*
   * The nc parameter value.
   * Can be used by application to limit the number of nonce re-uses. If @a nc
   * is higher than application wants to allow, then "auth required" response
   * with 'stale=true' could be used to force client to retry with the fresh
   * 'nonce'.
   * If not specified by client or does not have hexadecimal digits only, the
   * value is #MHD_DIGEST_AUTH_INVALID_NC_VALUE.
    }
type
  PMHD_DigestAuthInfo = ^TMHD_DigestAuthInfo;
  TMHD_DigestAuthInfo = record
      algo3 : TMHD_DigestAuthAlgo3;
      uname_type : TMHD_DigestAuthUsernameType;
      username : Pchar;
      username_len : Tsize_t;
      userhash_hex : Pchar;
      userhash_hex_len : Tsize_t;
      userhash_bin : Puint8_t;
      opaque : Pchar;
      opaque_len : Tsize_t;
      realm : Pchar;
      realm_len : Tsize_t;
      qop : TMHD_DigestAuthQOP;
      cnonce_len : Tsize_t;
      nc : Tuint32_t;
    end;

{*
 * Get information about Digest Authorization client's header.
 *
 * @param connection The MHD connection structure
 * @return NULL if no valid Digest Authorization header is used in the request;
 *         a pointer to the structure with information if the valid request
 *         header found, free using #MHD_free().
 * @sa #MHD_digest_auth_get_username3()
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup authentication
  }

function MHD_digest_auth_get_request_info3(connection:PMHD_Connection):PMHD_DigestAuthInfo;cdecl;external libmicrohttpd;
{*
 * Information from Digest Authorization client's header.
 *
 * All buffers pointed by any struct members are freed when #MHD_free() is
 * called for pointer to this structure.
 *
 * Application may modify buffers as needed until #MHD_free() is called for
 * pointer to this structure
 * @note Available since #MHD_VERSION 0x00097701
  }
{*
   * The algorithm as defined by client.
   * Set automatically to MD5 if not specified by client.
   * @warning Do not be confused with #MHD_DigestAuthAlgorithm,
   *          which uses other values!
    }
{*
   * The type of username used by client.
   * The 'invalid' and 'missing' types are not used in this structure,
   * instead NULL is returned by #MHD_digest_auth_get_username3().
    }
{*
   * The username string.
   * Used only if username type is standard or extended, always NULL otherwise.
   * If extended notation is used, this string is pct-decoded string
   * with charset and language tag removed (i.e. it is original username
   * extracted from the extended notation).
   * When userhash is used by the client, this member is NULL and
   * @a userhash_hex and @a userhash_bin are set.
   * The buffer pointed by the @a username becomes invalid when the pointer
   * to the structure is freed by #MHD_free().
    }
{*
   * The length of the @a username.
   * When the @a username is NULL, this member is always zero.
    }
{*
   * The userhash string.
   * Valid only if username type is userhash.
   * This is unqoted string without decoding of the hexadecimal
   * digits (as provided by the client).
   * The buffer pointed by the @a userhash_hex becomes invalid when the pointer
   * to the structure is freed by #MHD_free().
   * @sa #MHD_digest_auth_calc_userhash_hex()
    }
{*
   * The length of the @a userhash_hex in characters.
   * The valid size should be #MHD_digest_get_hash_size(algo3) * 2 characters.
   * When the @a userhash_hex is NULL, this member is always zero.
    }
{*
   * The userhash decoded to binary form.
   * Used only if username type is userhash, always NULL otherwise.
   * When not NULL, this points to binary sequence @a userhash_hex_len /2 bytes
   * long.
   * The valid size should be #MHD_digest_get_hash_size(algo3) bytes.
   * The buffer pointed by the @a userhash_bin becomes invalid when the pointer
   * to the structure is freed by #MHD_free().
   * @warning This is a binary data, no zero termination.
   * @warning To avoid buffer overruns, always check the size of the data before
   *          use, because @a userhash_bin can point even to zero-sized
   *          data.
   * @sa #MHD_digest_auth_calc_userhash()
    }
type
  PMHD_DigestAuthUsernameInfo = ^TMHD_DigestAuthUsernameInfo;
  TMHD_DigestAuthUsernameInfo = record
      algo3 : TMHD_DigestAuthAlgo3;
      uname_type : TMHD_DigestAuthUsernameType;
      username : Pchar;
      username_len : Tsize_t;
      userhash_hex : Pchar;
      userhash_hex_len : Tsize_t;
      userhash_bin : Puint8_t;
    end;

{*
 * Get the username from Digest Authorization client's header.
 *
 * @param connection The MHD connection structure
 * @return NULL if no valid Digest Authorization header is used in the request,
 *         or no username parameter is present in the header, or username is
 *         provided incorrectly by client (see description for
 *         #MHD_DIGEST_AUTH_UNAME_TYPE_INVALID);
 *         a pointer structure with information if the valid request header
 *         found, free using #MHD_free().
 * @sa #MHD_digest_auth_get_request_info3() provides more complete information
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup authentication
  }

function MHD_digest_auth_get_username3(connection:PMHD_Connection):PMHD_DigestAuthUsernameInfo;cdecl;external libmicrohttpd;
{*
 * The result of digest authentication of the client.
 *
 * All error values are zero or negative.
 *
 * @note Available since #MHD_VERSION 0x00097701
  }
{*
   * Authentication OK.
    }
{*
   * General error, like "out of memory".
    }
{*
   * No "Authorization" header or wrong format of the header.
   * Also may be returned if required parameters in client Authorisation header
   * are missing or broken (in invalid format).
    }
{*
   * Wrong 'username'.
    }
{*
   * Wrong 'realm'.
    }
{*
   * Wrong 'URI' (or URI parameters).
    }
{*
   * Wrong 'qop'.
    }
{*
   * Wrong 'algorithm'.
    }
{*
   * Too large (>64 KiB) Authorization parameter value.
    }
{ The different form of naming is intentionally used for the results below,
   * as they are more important  }
{*
   * The 'nonce' is too old. Suggest the client to retry with the same
   * username and password to get the fresh 'nonce'.
   * The validity of the 'nonce' may be not checked.
    }
{*
   * The 'nonce' was generated by MHD for other conditions.
   * This value is only returned if #MHD_OPTION_DIGEST_AUTH_NONCE_BIND_TYPE
   * is set to anything other than #MHD_DAUTH_BIND_NONCE_NONE.
   * The interpretation of this code could be different. For example, if
   * #MHD_DAUTH_BIND_NONCE_URI is set and client just used the same 'nonce' for
   * another URI, the code could be handled as #MHD_DAUTH_NONCE_STALE as
   * RFCs allow nonces re-using for other URIs in the same "protection
   * space". However, if only #MHD_DAUTH_BIND_NONCE_CLIENT_IP bit is set and
   * it is know that clients have fixed IP addresses, this return code could
   * be handled like #MHD_DAUTH_NONCE_WRONG.
    }
{*
   * The 'nonce' is wrong. May indicate an attack attempt.
    }
{*
   * The 'response' is wrong. Typically it means that wrong password used.
   * May indicate an attack attempt.
    }
type
  TMHD_DigestAuthResult =  Longint;
  Const
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

{*
 * Authenticates the authorization header sent by the client.
 *
 * If RFC2069 mode is allowed by setting bit #MHD_DIGEST_AUTH_QOP_NONE in
 * @a mqop and the client uses this mode, then server generated nonces are
 * used as one-time nonces because nonce-count is not supported in this old RFC.
 * Communication in this mode is very inefficient, especially if the client
 * requests several resources one-by-one as for every request a new nonce must
 * be generated and client repeats all requests twice (first time to get a new
 * nonce and second time to perform an authorised request).
 *
 * @param connection the MHD connection structure
 * @param realm the realm for authorization of the client
 * @param username the username to be authenticated, must be in clear text
 *                 even if userhash is used by the client
 * @param password the password matching the @a username (and the @a realm)
 * @param nonce_timeout the period of seconds since nonce generation, when
 *                      the nonce is recognised as valid and not stale;
 *                      if zero is specified then daemon default value is used.
 * @param max_nc the maximum allowed nc (Nonce Count) value, if client's nc
 *               exceeds the specified value then MHD_DAUTH_NONCE_STALE is
 *               returned;
 *               if zero is specified then daemon default value is used.
 * @param mqop the QOP to use
 * @param malgo3 digest algorithms allowed to use, fail if algorithm used
 *               by the client is not allowed by this parameter
 * @return #MHD_DAUTH_OK if authenticated,
 *         the error code otherwise
 * @note Available since #MHD_VERSION 0x00097708
 * @ingroup authentication
  }

function MHD_digest_auth_check3(connection:PMHD_Connection; realm:Pchar; username:Pchar; password:Pchar; nonce_timeout:dword; 
           max_nc:Tuint32_t; mqop:TMHD_DigestAuthMultiQOP; malgo3:TMHD_DigestAuthMultiAlgo3):TMHD_DigestAuthResult;cdecl;external libmicrohttpd;
{*
 * Calculate userdigest, return it as a binary data.
 *
 * The "userdigest" is the hash of the "username:realm:password" string.
 *
 * The "userdigest" can be used to avoid storing the password in clear text
 * in database/files
 *
 * This function is designed to improve security of stored credentials,
 * the "userdigest" does not improve security of the authentication process.
 *
 * The results can be used to store username & userdigest pairs instead of
 * username & password pairs. To further improve security, application may
 * store username & userhash & userdigest triplets.
 *
 * @param algo3 the digest algorithm
 * @param username the username
 * @param realm the realm
 * @param password the password
 * @param[out] userdigest_bin the output buffer for userdigest;
 *                            if this function succeeds, then this buffer has
 *                            #MHD_digest_get_hash_size(algo3) bytes of
 *                            userdigest upon return
 * @param bin_buf_size the size of the @a userdigest_bin buffer, must be
 *                     at least #MHD_digest_get_hash_size(algo3) bytes long
 * @return MHD_YES on success,
 *         MHD_NO if @a userdigest_bin is too small or if @a algo3 algorithm is
 *         not supported (or external error has occurred,
 *         see #MHD_FEATURE_EXTERN_HASH).
 * @sa #MHD_digest_auth_check_digest3()
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup authentication
  }
function MHD_digest_auth_calc_userdigest(algo3:TMHD_DigestAuthAlgo3; username:Pchar; realm:Pchar; password:Pchar; userdigest_bin:pointer; 
           bin_buf_size:Tsize_t):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Authenticates the authorization header sent by the client by using
 * hash of "username:realm:password".
 *
 * If RFC2069 mode is allowed by setting bit #MHD_DIGEST_AUTH_QOP_NONE in
 * @a mqop and the client uses this mode, then server generated nonces are
 * used as one-time nonces because nonce-count is not supported in this old RFC.
 * Communication in this mode is very inefficient, especially if the client
 * requests several resources one-by-one as for every request a new nonce must
 * be generated and client repeats all requests twice (first time to get a new
 * nonce and second time to perform an authorised request).
 *
 * @param connection the MHD connection structure
 * @param realm the realm for authorization of the client
 * @param username the username to be authenticated, must be in clear text
 *                 even if userhash is used by the client
 * @param userdigest the precalculated binary hash of the string
 *                   "username:realm:password",
 *                   see #MHD_digest_auth_calc_userdigest()
 * @param userdigest_size the size of the @a userdigest in bytes, must match the
 *                        hashing algorithm (see #MHD_MD5_DIGEST_SIZE,
 *                        #MHD_SHA256_DIGEST_SIZE, #MHD_SHA512_256_DIGEST_SIZE,
 *                        #MHD_digest_get_hash_size())
 * @param nonce_timeout the period of seconds since nonce generation, when
 *                      the nonce is recognised as valid and not stale;
 *                      if zero is specified then daemon default value is used.
 * @param max_nc the maximum allowed nc (Nonce Count) value, if client's nc
 *               exceeds the specified value then MHD_DAUTH_NONCE_STALE is
 *               returned;
 *               if zero is specified then daemon default value is used.
 * @param mqop the QOP to use
 * @param malgo3 digest algorithms allowed to use, fail if algorithm used
 *               by the client is not allowed by this parameter;
 *               more than one base algorithms (MD5, SHA-256, SHA-512/256)
 *               cannot be used at the same time for this function
 *               as @a userdigest must match specified algorithm
 * @return #MHD_DAUTH_OK if authenticated,
 *         the error code otherwise
 * @sa #MHD_digest_auth_calc_userdigest()
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup authentication
  }
function MHD_digest_auth_check_digest3(connection:PMHD_Connection; realm:Pchar; username:Pchar; userdigest:pointer; userdigest_size:Tsize_t; 
           nonce_timeout:dword; max_nc:Tuint32_t; mqop:TMHD_DigestAuthMultiQOP; malgo3:TMHD_DigestAuthMultiAlgo3):TMHD_DigestAuthResult;cdecl;external libmicrohttpd;
{*
 * Queues a response to request authentication from the client
 *
 * This function modifies provided @a response. The @a response must not be
 * reused and should be destroyed (by #MHD_destroy_response()) after call of
 * this function.
 *
 * If @a mqop allows both RFC 2069 (MHD_DIGEST_AUTH_QOP_NONE) and QOP with
 * value, then response is formed like if MHD_DIGEST_AUTH_QOP_NONE bit was
 * not set, because such response should be backward-compatible with RFC 2069.
 *
 * If @a mqop allows only MHD_DIGEST_AUTH_MULT_QOP_NONE, then the response is
 * formed in strict accordance with RFC 2069 (no 'qop', no 'userhash', no
 * 'charset'). For better compatibility with clients, it is recommended (but
 * not required) to set @a domain to NULL in this mode.
 *
 * @param connection the MHD connection structure
 * @param realm the realm presented to the client
 * @param opaque the string for opaque value, can be NULL, but NULL is
 *               not recommended for better compatibility with clients;
 *               the recommended format is hex or Base64 encoded string
 * @param domain the optional space-separated list of URIs for which the
 *               same authorisation could be used, URIs can be in form
 *               "path-absolute" (the path for the same host with initial slash)
 *               or in form "absolute-URI" (the full path with protocol), in
 *               any case client may assume that URI is in the same "protection
 *               space" if it starts with any of values specified here;
 *               could be NULL (clients typically assume that the same
 *               credentials could be used for any URI on the same host);
 *               this list provides information for the client only and does
 *               not actually restrict anything on the server side
 * @param response the reply to send; should contain the "access denied"
 *                 body;
 *                 note: this function sets the "WWW Authenticate" header and
 *                 the caller should not set this header;
 *                 the NULL is tolerated
 * @param signal_stale if set to #MHD_YES then indication of stale nonce used in
 *                     the client's request is signalled by adding 'stale=true'
 *                     to the authentication header, this instructs the client
 *                     to retry immediately with the new nonce and the same
 *                     credentials, without asking user for the new password
 * @param mqop the QOP to use
 * @param malgo3 digest algorithm to use; if several algorithms are allowed
 *               then MD5 is preferred (currently, may be changed in next
 *               versions)
 * @param userhash_support if set to non-zero value (#MHD_YES) then support of
 *                         userhash is indicated, allowing client to provide
 *                         hash("username:realm") instead of the username in
 *                         clear text;
 *                         note that clients are allowed to provide the username
 *                         in cleartext even if this parameter set to non-zero;
 *                         when userhash is used, application must be ready to
 *                         identify users by provided userhash value instead of
 *                         username; see #MHD_digest_auth_calc_userhash() and
 *                         #MHD_digest_auth_calc_userhash_hex()
 * @param prefer_utf8 if not set to #MHD_NO, parameter 'charset=UTF-8' is
 *                    added, indicating for the client that UTF-8 encoding for
 *                    the username is preferred
 * @return #MHD_YES on success, #MHD_NO otherwise
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup authentication
  }
function MHD_queue_auth_required_response3(connection:PMHD_Connection; realm:Pchar; opaque:Pchar; domain:Pchar; response:PMHD_Response; 
           signal_stale:longint; mqop:TMHD_DigestAuthMultiQOP; algo:TMHD_DigestAuthMultiAlgo3; userhash_support:longint; prefer_utf8:longint):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Constant to indicate that the nonce of the provided
 * authentication code was wrong.
 * Used as return code by #MHD_digest_auth_check(), #MHD_digest_auth_check2(),
 * #MHD_digest_auth_check_digest(), #MHD_digest_auth_check_digest2().
 * @ingroup authentication
  }
const
  MHD_INVALID_NONCE = -(1);  
{*
 * Get the username from the authorization header sent by the client
 *
 * This function supports username in standard and extended notations.
 * "userhash" is not supported by this function.
 *
 * @param connection The MHD connection structure
 * @return NULL if no username could be found, username provided as
 *         "userhash", extended notation broken or memory allocation error
 *         occurs;
 *         a pointer to the username if found, free using #MHD_free().
 * @warning Returned value must be freed by #MHD_free().
 * @sa #MHD_digest_auth_get_username3()
 * @ingroup authentication
  }

function MHD_digest_auth_get_username(connection:PMHD_Connection):Pchar;cdecl;external libmicrohttpd;
{*
 * Which digest algorithm should MHD use for HTTP digest authentication?
 * Used as parameter for #MHD_digest_auth_check2(),
 * #MHD_digest_auth_check_digest2(), #MHD_queue_auth_fail_response2().
  }
{*
   * MHD should pick (currently defaults to MD5).
    }
{*
   * Force use of MD5.
    }
{*
   * Force use of SHA-256.
    }
type
  TMHD_DigestAuthAlgorithm =  Longint;
  Const
    MHD_DIGEST_ALG_AUTO = 0;
    MHD_DIGEST_ALG_MD5 = 1;
    MHD_DIGEST_ALG_SHA256 = 2;

{*
 * Authenticates the authorization header sent by the client.
 *
 * @param connection The MHD connection structure
 * @param realm The realm presented to the client
 * @param username The username needs to be authenticated
 * @param password The password used in the authentication
 * @param nonce_timeout The amount of time for a nonce to be
 *      invalid in seconds
 * @param algo digest algorithms allowed for verification
 * @return #MHD_YES if authenticated, #MHD_NO if not,
 *         #MHD_INVALID_NONCE if nonce is invalid or stale
 * @note Available since #MHD_VERSION 0x00096200
 * @deprecated use MHD_digest_auth_check3()
 * @ingroup authentication
  }

function MHD_digest_auth_check2(connection:PMHD_Connection; realm:Pchar; username:Pchar; password:Pchar; nonce_timeout:dword; 
           algo:TMHD_DigestAuthAlgorithm):longint;cdecl;external libmicrohttpd;
{*
 * Authenticates the authorization header sent by the client.
 * Uses #MHD_DIGEST_ALG_MD5 (for now, for backwards-compatibility).
 * Note that this MAY change to #MHD_DIGEST_ALG_AUTO in the future.
 * If you want to be sure you get MD5, use #MHD_digest_auth_check2()
 * and specify MD5 explicitly.
 *
 * @param connection The MHD connection structure
 * @param realm The realm presented to the client
 * @param username The username needs to be authenticated
 * @param password The password used in the authentication
 * @param nonce_timeout The amount of time for a nonce to be
 *      invalid in seconds
 * @return #MHD_YES if authenticated, #MHD_NO if not,
 *         #MHD_INVALID_NONCE if nonce is invalid or stale
 * @deprecated use MHD_digest_auth_check3()
 * @ingroup authentication
  }
function MHD_digest_auth_check(connection:PMHD_Connection; realm:Pchar; username:Pchar; password:Pchar; nonce_timeout:dword):longint;cdecl;external libmicrohttpd;
{*
 * Authenticates the authorization header sent by the client.
 *
 * @param connection The MHD connection structure
 * @param realm The realm presented to the client
 * @param username The username needs to be authenticated
 * @param digest An `unsigned char *' pointer to the binary MD5 sum
 *      for the precalculated hash value "username:realm:password"
 *      of @a digest_size bytes
 * @param digest_size number of bytes in @a digest (size must match @a algo!)
 * @param nonce_timeout The amount of time for a nonce to be
 *      invalid in seconds
 * @param algo digest algorithms allowed for verification
 * @return #MHD_YES if authenticated, #MHD_NO if not,
 *         #MHD_INVALID_NONCE if nonce is invalid or stale
 * @note Available since #MHD_VERSION 0x00096200
 * @deprecated use MHD_digest_auth_check_digest3()
 * @ingroup authentication
  }
function MHD_digest_auth_check_digest2(connection:PMHD_Connection; realm:Pchar; username:Pchar; digest:Puint8_t; digest_size:Tsize_t; 
           nonce_timeout:dword; algo:TMHD_DigestAuthAlgorithm):longint;cdecl;external libmicrohttpd;
{*
 * Authenticates the authorization header sent by the client
 * Uses #MHD_DIGEST_ALG_MD5 (required, as @a digest is of fixed
 * size).
 *
 * @param connection The MHD connection structure
 * @param realm The realm presented to the client
 * @param username The username needs to be authenticated
 * @param digest An `unsigned char *' pointer to the binary hash
 *    for the precalculated hash value "username:realm:password";
 *    length must be #MHD_MD5_DIGEST_SIZE bytes
 * @param nonce_timeout The amount of time for a nonce to be
 *      invalid in seconds
 * @return #MHD_YES if authenticated, #MHD_NO if not,
 *         #MHD_INVALID_NONCE if nonce is invalid or stale
 * @note Available since #MHD_VERSION 0x00096000
 * @deprecated use #MHD_digest_auth_check_digest3()
 * @ingroup authentication
  }
function MHD_digest_auth_check_digest(connection:PMHD_Connection; realm:Pchar; username:Pchar; digest:Tdigest_arr; nonce_timeout:dword):longint;cdecl;external libmicrohttpd;
{*
 * Queues a response to request authentication from the client
 *
 * This function modifies provided @a response. The @a response must not be
 * reused and should be destroyed after call of this function.
 *
 * @param connection The MHD connection structure
 * @param realm the realm presented to the client
 * @param opaque string to user for opaque value
 * @param response reply to send; should contain the "access denied"
 *        body; note that this function will set the "WWW Authenticate"
 *        header and that the caller should not do this; the NULL is tolerated
 * @param signal_stale #MHD_YES if the nonce is stale to add
 *        'stale=true' to the authentication header
 * @param algo digest algorithm to use
 * @return #MHD_YES on success, #MHD_NO otherwise
 * @note Available since #MHD_VERSION 0x00096200
 * @deprecated use MHD_queue_auth_required_response3()
 * @ingroup authentication
  }
function MHD_queue_auth_fail_response2(connection:PMHD_Connection; realm:Pchar; opaque:Pchar; response:PMHD_Response; signal_stale:longint; 
           algo:TMHD_DigestAuthAlgorithm):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Queues a response to request authentication from the client.
 * For now uses MD5 (for backwards-compatibility). Still, if you
 * need to be sure, use #MHD_queue_auth_fail_response2().
 *
 * This function modifies provided @a response. The @a response must not be
 * reused and should be destroyed after call of this function.
 *
 * @param connection The MHD connection structure
 * @param realm the realm presented to the client
 * @param opaque string to user for opaque value
 * @param response reply to send; should contain the "access denied"
 *        body; note that this function will set the "WWW Authenticate"
 *        header and that the caller should not do this; the NULL is tolerated
 * @param signal_stale #MHD_YES if the nonce is stale to add
 *        'stale=true' to the authentication header
 * @return #MHD_YES on success, #MHD_NO otherwise
 * @deprecated use MHD_queue_auth_required_response3()
 * @ingroup authentication
  }
function MHD_queue_auth_fail_response(connection:PMHD_Connection; realm:Pchar; opaque:Pchar; response:PMHD_Response; signal_stale:longint):TMHD_Result;cdecl;external libmicrohttpd;
{ ********************* Basic Authentication functions ***************  }
{*
 * Information decoded from Basic Authentication client's header.
 *
 * The username and the password are technically allowed to have binary zeros,
 * username_len and password_len could be used to detect such situations.
 *
 * The buffers pointed by username and password members are freed
 * when #MHD_free() is called for pointer to this structure.
 *
 * Application may modify buffers as needed until #MHD_free() is called for
 * pointer to this structure
  }
{*
   * The username, cannot be NULL.
   * The buffer pointed by the @a username becomes invalid when the pointer
   * to the structure is freed by #MHD_free().
    }
{*
   * The length of the @a username, not including zero-termination
    }
{*
   * The password, may be NULL if password is not encoded by the client.
   * The buffer pointed by the @a password becomes invalid when the pointer
   * to the structure is freed by #MHD_free().
    }
{*
   * The length of the @a password, not including zero-termination;
   * when the @a password is NULL, the length is always zero.
    }
type
  PMHD_BasicAuthInfo = ^TMHD_BasicAuthInfo;
  TMHD_BasicAuthInfo = record
      username : Pchar;
      username_len : Tsize_t;
      password : Pchar;
      password_len : Tsize_t;
    end;

{*
 * Get the username and password from the Basic Authorisation header
 * sent by the client
 *
 * @param connection the MHD connection structure
 * @return NULL if no valid Basic Authentication header is present in
 *         current request, or
 *         pointer to structure with username and password, which must be
 *         freed by #MHD_free().
 * @note Available since #MHD_VERSION 0x00097701
 * @ingroup authentication
  }

function MHD_basic_auth_get_username_password3(connection:PMHD_Connection):PMHD_BasicAuthInfo;cdecl;external libmicrohttpd;
{*
 * Queues a response to request basic authentication from the client.
 *
 * The given response object is expected to include the payload for
 * the response; the "WWW-Authenticate" header will be added and the
 * response queued with the 'UNAUTHORIZED' status code.
 *
 * See RFC 7617#section-2 for details.
 *
 * The @a response is modified by this function. The modified response object
 * can be used to respond subsequent requests by #MHD_queue_response()
 * function with status code #MHD_HTTP_UNAUTHORIZED and must not be used again
 * with MHD_queue_basic_auth_required_response3() function. The response could
 * be destroyed right after call of this function.
 *
 * @param connection the MHD connection structure
 * @param realm the realm presented to the client
 * @param prefer_utf8 if not set to #MHD_NO, parameter'charset="UTF-8"' will
 *                    be added, indicating for client that UTF-8 encoding
 *                    is preferred
 * @param response the response object to modify and queue; the NULL
 *                 is tolerated
 * @return #MHD_YES on success, #MHD_NO otherwise
 * @note Available since #MHD_VERSION 0x00097704
 * @ingroup authentication
  }
function MHD_queue_basic_auth_required_response3(connection:PMHD_Connection; realm:Pchar; prefer_utf8:longint; response:PMHD_Response):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Get the username and password from the basic authorization header sent by the client
 *
 * @param connection The MHD connection structure
 * @param[out] password a pointer for the password, free using #MHD_free().
 * @return NULL if no username could be found, a pointer
 *      to the username if found, free using #MHD_free().
 * @deprecated use #MHD_basic_auth_get_username_password3()
 * @ingroup authentication
  }
function MHD_basic_auth_get_username_password(connection:PMHD_Connection; password:PPchar):Pchar;cdecl;external libmicrohttpd;
{*
 * Queues a response to request basic authentication from the client
 * The given response object is expected to include the payload for
 * the response; the "WWW-Authenticate" header will be added and the
 * response queued with the 'UNAUTHORIZED' status code.
 *
 * @param connection The MHD connection structure
 * @param realm the realm presented to the client
 * @param response response object to modify and queue; the NULL is tolerated
 * @return #MHD_YES on success, #MHD_NO otherwise
 * @deprecated use MHD_queue_basic_auth_required_response3()
 * @ingroup authentication
  }
function MHD_queue_basic_auth_fail_response(connection:PMHD_Connection; realm:Pchar; response:PMHD_Response):TMHD_Result;cdecl;external libmicrohttpd;
{ ********************** generic query functions **********************  }
{*
 * Obtain information about the given connection.
 * The returned pointer is invalidated with the next call of this function or
 * when the connection is closed.
 *
 * @param connection what connection to get information about
 * @param info_type what information is desired?
 * @param ... depends on @a info_type
 * @return NULL if this information is not available
 *         (or if the @a info_type is unknown)
 * @ingroup specialized
  }
function MHD_get_connection_info(connection:PMHD_Connection; info_type:TMHD_ConnectionInfoType; args:array of const):PMHD_ConnectionInfo;cdecl;external libmicrohttpd;
function MHD_get_connection_info(connection:PMHD_Connection; info_type:TMHD_ConnectionInfoType):PMHD_ConnectionInfo;cdecl;external libmicrohttpd;
{*
 * MHD connection options.  Given to #MHD_set_connection_option to
 * set custom options for a particular connection.
  }
{*
   * Set a custom timeout for the given connection.  Specified
   * as the number of seconds, given as an `unsigned int`.  Use
   * zero for no timeout.
   * If timeout was set to zero (or unset) before, setup of new value by
   * MHD_set_connection_option() will reset timeout timer.
   * Values larger than (UINT64_MAX / 2000 - 1) will
   * be clipped to this number.
    }
type
  TMHD_CONNECTION_OPTION =  Longint;
  Const
    MHD_CONNECTION_OPTION_TIMEOUT = 0;

{*
 * Set a custom option for the given connection, overriding defaults.
 *
 * @param connection connection to modify
 * @param option option to set
 * @param ... arguments to the option, depending on the option type
 * @return #MHD_YES on success, #MHD_NO if setting the option failed
 * @ingroup specialized
  }

function MHD_set_connection_option(connection:PMHD_Connection; option:TMHD_CONNECTION_OPTION; args:array of const):TMHD_Result;cdecl;external libmicrohttpd;
function MHD_set_connection_option(connection:PMHD_Connection; option:TMHD_CONNECTION_OPTION):TMHD_Result;cdecl;external libmicrohttpd;
{*
 * Information about an MHD daemon.
  }
{*
   * Size of the key, no longer supported.
   * @deprecated
    }
{*
   * Size of the mac key, no longer supported.
   * @deprecated
    }
{*
   * Socket, returned for #MHD_DAEMON_INFO_LISTEN_FD.
    }
{*
   * Bind port number, returned for #MHD_DAEMON_INFO_BIND_PORT.
    }
{*
   * epoll FD, returned for #MHD_DAEMON_INFO_EPOLL_FD.
    }
{*
   * Number of active connections, for #MHD_DAEMON_INFO_CURRENT_CONNECTIONS.
    }
{*
   * Combination of #MHD_FLAG values, for #MHD_DAEMON_INFO_FLAGS.
   * This value is actually a bitfield.
   * Note: flags may differ from original 'flags' specified for
   * daemon, especially if #MHD_USE_AUTO was set.
    }
type
  PMHD_DaemonInfo = ^TMHD_DaemonInfo;
  TMHD_DaemonInfo = record
      case longint of
        0 : ( key_size : Tsize_t );
        1 : ( mac_key_size : Tsize_t );
        2 : ( listen_fd : TMHD_socket );
        3 : ( port : Tuint16_t );
        4 : ( epoll_fd : longint );
        5 : ( num_connections : dword );
        6 : ( flags : TMHD_FLAG );
      end;

{*
 * Obtain information about the given daemon.
 * The returned pointer is invalidated with the next call of this function or
 * when the daemon is stopped.
 *
 * @param daemon what daemon to get information about
 * @param info_type what information is desired?
 * @param ... depends on @a info_type
 * @return NULL if this information is not available
 *         (or if the @a info_type is unknown)
 * @ingroup specialized
  }

function MHD_get_daemon_info(daemon:PMHD_Daemon; info_type:TMHD_DaemonInfoType; args:array of const):PMHD_DaemonInfo;cdecl;external libmicrohttpd;
function MHD_get_daemon_info(daemon:PMHD_Daemon; info_type:TMHD_DaemonInfoType):PMHD_DaemonInfo;cdecl;external libmicrohttpd;
{*
 * Obtain the version of this library
 *
 * @return static version string, e.g. "0.9.9"
 * @ingroup specialized
  }
function MHD_get_version:Pchar;cdecl;external libmicrohttpd;
{*
 * Obtain the version of this library as a binary value.
 *
 * @return version binary value, e.g. "0x00090900" (#MHD_VERSION of
 *         compiled MHD binary)
 * @note Available since #MHD_VERSION 0x00097601
 * @ingroup specialized
  }
function MHD_get_version_bin:Tuint32_t;cdecl;external libmicrohttpd;
{*
 * Types of information about MHD features,
 * used by #MHD_is_feature_supported().
  }
{*
   * Get whether messages are supported. If supported then in debug
   * mode messages can be printed to stderr or to external logger.
    }
{*
   * Get whether HTTPS is supported.  If supported then flag
   * #MHD_USE_TLS and options #MHD_OPTION_HTTPS_MEM_KEY,
   * #MHD_OPTION_HTTPS_MEM_CERT, #MHD_OPTION_HTTPS_MEM_TRUST,
   * #MHD_OPTION_HTTPS_MEM_DHPARAMS, #MHD_OPTION_HTTPS_CRED_TYPE,
   * #MHD_OPTION_HTTPS_PRIORITIES can be used.
    }
{*
   * Get whether option #MHD_OPTION_HTTPS_CERT_CALLBACK is
   * supported.
    }
{*
   * Get whether IPv6 is supported. If supported then flag
   * #MHD_USE_IPv6 can be used.
    }
{*
   * Get whether IPv6 without IPv4 is supported. If not supported
   * then IPv4 is always enabled in IPv6 sockets and
   * flag #MHD_USE_DUAL_STACK is always used when #MHD_USE_IPv6 is
   * specified.
    }
{*
   * Get whether `poll()` is supported. If supported then flag
   * #MHD_USE_POLL can be used.
    }
{*
   * Get whether `epoll()` is supported. If supported then Flags
   * #MHD_USE_EPOLL and
   * #MHD_USE_EPOLL_INTERNAL_THREAD can be used.
    }
{*
   * Get whether shutdown on listen socket to signal other
   * threads is supported. If not supported flag
   * #MHD_USE_ITC is automatically forced.
    }
{*
   * Get whether socketpair is used internally instead of pipe to
   * signal other threads.
    }
{*
   * Get whether TCP Fast Open is supported. If supported then
   * flag #MHD_USE_TCP_FASTOPEN and option
   * #MHD_OPTION_TCP_FASTOPEN_QUEUE_SIZE can be used.
    }
{*
   * Get whether HTTP Basic authorization is supported. If supported
   * then functions #MHD_basic_auth_get_username_password and
   * #MHD_queue_basic_auth_fail_response can be used.
    }
{*
   * Get whether HTTP Digest authorization is supported. If
   * supported then options #MHD_OPTION_DIGEST_AUTH_RANDOM,
   * #MHD_OPTION_NONCE_NC_SIZE and
   * #MHD_digest_auth_check() can be used.
    }
{*
   * Get whether postprocessor is supported. If supported then
   * functions #MHD_create_post_processor(), #MHD_post_process() and
   * #MHD_destroy_post_processor() can
   * be used.
    }
{*
  * Get whether password encrypted private key for HTTPS daemon is
  * supported. If supported then option
  * ::MHD_OPTION_HTTPS_KEY_PASSWORD can be used.
   }
{*
   * Get whether reading files beyond 2 GiB boundary is supported.
   * If supported then #MHD_create_response_from_fd(),
   * #MHD_create_response_from_fd64 #MHD_create_response_from_fd_at_offset()
   * and #MHD_create_response_from_fd_at_offset64() can be used with sizes and
   * offsets larger than 2 GiB. If not supported value of size+offset is
   * limited to 2 GiB.
    }
{*
   * Get whether MHD set names on generated threads.
    }
{*
   * Get whether HTTP "Upgrade" is supported.
   * If supported then #MHD_ALLOW_UPGRADE, #MHD_upgrade_action() and
   * #MHD_create_response_for_upgrade() can be used.
    }
{*
   * Get whether it's safe to use same FD for multiple calls of
   * #MHD_create_response_from_fd() and whether it's safe to use single
   * response generated by #MHD_create_response_from_fd() with multiple
   * connections at same time.
   * If #MHD_is_feature_supported() return #MHD_NO for this feature then
   * usage of responses with same file FD in multiple parallel threads may
   * results in incorrect data sent to remote client.
   * It's always safe to use same file FD in multiple responses if MHD
   * is run in any single thread mode.
    }
{*
   * Get whether MHD support automatic detection of bind port number.
   * @sa #MHD_DAEMON_INFO_BIND_PORT
    }
{*
   * Get whether MHD supports automatic SIGPIPE suppression.
   * If SIGPIPE suppression is not supported, application must handle
   * SIGPIPE signal by itself.
    }
{*
   * Get whether MHD use system's sendfile() function to send
   * file-FD based responses over non-TLS connections.
   * @note Since v0.9.56
    }
{*
   * Get whether MHD supports threads.
    }
{*
   * Get whether option #MHD_OPTION_HTTPS_CERT_CALLBACK2 is
   * supported.
    }
{*
   * Get whether automatic parsing of HTTP Cookie header is supported.
   * If disabled, no MHD_COOKIE_KIND will be generated by MHD.
   * MHD versions before 0x00097701 always support cookie parsing.
   * @note Available since #MHD_VERSION 0x00097701
    }
{*
   * Get whether the early version the Digest Authorization (RFC 2069) is
   * supported (digest authorisation without QOP parameter).
   * Since #MHD_VERSION 0x00097701 it is always supported if Digest Auth
   * module is built.
   * @note Available since #MHD_VERSION 0x00097701
    }
{*
   * Get whether the MD5-based hashing algorithms are supported for Digest
   * Authorization.
   * Currently it is always supported if Digest Auth module is built
   * unless manually disabled in a custom build.
   * @note Available since #MHD_VERSION 0x00097701
    }
{*
   * Get whether the SHA-256-based hashing algorithms are supported for Digest
   * Authorization.
   * It is always supported since #MHD_VERSION 0x00096200 if Digest Auth
   * module is built unless manually disabled in a custom build.
   * @note Available since #MHD_VERSION 0x00097701
    }
{*
   * Get whether the SHA-512/256-based hashing algorithms are supported
   * for Digest Authorization.
   * It it always supported since #MHD_VERSION 0x00097701 if Digest Auth
   * module is built unless manually disabled in a custom build.
   * @note Available since #MHD_VERSION 0x00097701
    }
{*
   * Get whether QOP with value 'auth-int' (authentication with integrity
   * protection) is supported for Digest Authorization.
   * Currently it is always not supported.
   * @note Available since #MHD_VERSION 0x00097701
    }
{*
   * Get whether 'session' algorithms (like 'MD5-sess') are supported for Digest
   * Authorization.
   * Currently it is always not supported.
   * @note Available since #MHD_VERSION 0x00097701
    }
{*
   * Get whether 'userhash' is supported for Digest Authorization.
   * It is always supported since #MHD_VERSION 0x00097701 if Digest Auth
   * module is built.
   * @note Available since #MHD_VERSION 0x00097701
    }
{*
   * Get whether any of hashing algorithms is implemented by external
   * function (like TLS library) and may fail due to external conditions,
   * like "out-of-memory".
   *
   * If result is #MHD_YES then functions which use hash calculations
   * like #MHD_digest_auth_calc_userhash(), #MHD_digest_auth_check3() and others
   * potentially may fail even with valid input because of out-of-memory error
   * or crypto accelerator device failure, however in practice such fails are
   * unlikely.
   * @note Available since #MHD_VERSION 0x00097701
    }
{*
   * Get whether MHD was built with asserts enabled.
   * For debug builds the error log is always enabled even if #MHD_USE_ERROR_LOG
   * is not specified for daemon.
   * @note Available since #MHD_VERSION 0x00097701
    }
{*
   * Get whether MHD was build with support for overridable FD_SETSIZE.
   * This feature should be always available when the relevant platform ability
   * is detected.
   * @sa #MHD_OPTION_APP_FD_SETSIZE
   * @note Available since #MHD_VERSION 0x00097705
    }
type
  TMHD_FEATURE =  Longint;
  Const
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

{*
 * Get information about supported MHD features.
 * Indicate that MHD was compiled with or without support for
 * particular feature. Some features require additional support
 * by kernel. Kernel support is not checked by this function.
 *
 * @param feature type of requested information
 * @return #MHD_YES if feature is supported by MHD, #MHD_NO if
 * feature is not supported or feature is unknown.
 * @ingroup specialized
  }

function MHD_is_feature_supported(feature:TMHD_FEATURE):TMHD_Result;cdecl;external libmicrohttpd;

implementation

{ was #define dname def_expr }
function MHD_CONTENT_READER_END_OF_STREAM : Tssize_t;
  begin
    MHD_CONTENT_READER_END_OF_STREAM:=Tssize_t(-(1));
  end;

{ was #define dname def_expr }
function MHD_CONTENT_READER_END_WITH_ERROR : Tssize_t;
  begin
    MHD_CONTENT_READER_END_WITH_ERROR:=Tssize_t(-(2));
  end;

{ was #define dname def_expr }
function MHD_ICY_FLAG : Tuint32_t;
  begin
    MHD_ICY_FLAG:=Tuint32_t((Tuint32_t(1)) shl 31);
  end;



end.
