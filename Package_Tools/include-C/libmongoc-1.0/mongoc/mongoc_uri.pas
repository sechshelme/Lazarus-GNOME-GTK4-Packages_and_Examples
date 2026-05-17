unit mongoc_uri;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc, mongoc_host_list, mongoc_read_prefs, mongoc_write_concern, mongoc_read_concern;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  MONGOC_DEFAULT_PORT = 27017;

const
  MONGOC_URI_APPNAME = 'appname';
  MONGOC_URI_AUTHMECHANISM = 'authmechanism';
  MONGOC_URI_AUTHMECHANISMPROPERTIES = 'authmechanismproperties';
  MONGOC_URI_AUTHSOURCE = 'authsource';
  MONGOC_URI_CANONICALIZEHOSTNAME = 'canonicalizehostname';
  MONGOC_URI_CONNECTTIMEOUTMS = 'connecttimeoutms';
  MONGOC_URI_COMPRESSORS = 'compressors';
  MONGOC_URI_DIRECTCONNECTION = 'directconnection';
  MONGOC_URI_GSSAPISERVICENAME = 'gssapiservicename';
  MONGOC_URI_HEARTBEATFREQUENCYMS = 'heartbeatfrequencyms';
  MONGOC_URI_JOURNAL = 'journal';
  MONGOC_URI_LOADBALANCED = 'loadbalanced';
  MONGOC_URI_LOCALTHRESHOLDMS = 'localthresholdms';
  MONGOC_URI_MAXIDLETIMEMS = 'maxidletimems';
  MONGOC_URI_MAXPOOLSIZE = 'maxpoolsize';
  MONGOC_URI_MAXSTALENESSSECONDS = 'maxstalenessseconds';
  MONGOC_URI_MINPOOLSIZE = 'minpoolsize';
  MONGOC_URI_READCONCERNLEVEL = 'readconcernlevel';
  MONGOC_URI_READPREFERENCE = 'readpreference';
  MONGOC_URI_READPREFERENCETAGS = 'readpreferencetags';
  MONGOC_URI_REPLICASET = 'replicaset';
  MONGOC_URI_RETRYREADS = 'retryreads';
  MONGOC_URI_RETRYWRITES = 'retrywrites';
  MONGOC_URI_SAFE = 'safe';
  MONGOC_URI_SERVERSELECTIONTIMEOUTMS = 'serverselectiontimeoutms';
  MONGOC_URI_SERVERSELECTIONTRYONCE = 'serverselectiontryonce';
  MONGOC_URI_SLAVEOK = 'slaveok';
  MONGOC_URI_SOCKETCHECKINTERVALMS = 'socketcheckintervalms';
  MONGOC_URI_SOCKETTIMEOUTMS = 'sockettimeoutms';
  MONGOC_URI_SRVSERVICENAME = 'srvservicename';
  MONGOC_URI_SRVMAXHOSTS = 'srvmaxhosts';
  MONGOC_URI_TLS = 'tls';
  MONGOC_URI_TLSCERTIFICATEKEYFILE = 'tlscertificatekeyfile';
  MONGOC_URI_TLSCERTIFICATEKEYFILEPASSWORD = 'tlscertificatekeyfilepassword';
  MONGOC_URI_TLSCAFILE = 'tlscafile';
  MONGOC_URI_TLSALLOWINVALIDCERTIFICATES = 'tlsallowinvalidcertificates';
  MONGOC_URI_TLSALLOWINVALIDHOSTNAMES = 'tlsallowinvalidhostnames';
  MONGOC_URI_TLSINSECURE = 'tlsinsecure';
  MONGOC_URI_TLSDISABLECERTIFICATEREVOCATIONCHECK = 'tlsdisablecertificaterevocationcheck';
  MONGOC_URI_TLSDISABLEOCSPENDPOINTCHECK = 'tlsdisableocspendpointcheck';
  MONGOC_URI_W = 'w';
  MONGOC_URI_WAITQUEUEMULTIPLE = 'waitqueuemultiple';
  MONGOC_URI_WAITQUEUETIMEOUTMS = 'waitqueuetimeoutms';
  MONGOC_URI_WTIMEOUTMS = 'wtimeoutms';
  MONGOC_URI_ZLIBCOMPRESSIONLEVEL = 'zlibcompressionlevel';
  MONGOC_URI_SSL = 'ssl';
  MONGOC_URI_SSLCLIENTCERTIFICATEKEYFILE = 'sslclientcertificatekeyfile';
  MONGOC_URI_SSLCLIENTCERTIFICATEKEYPASSWORD = 'sslclientcertificatekeypassword';
  MONGOC_URI_SSLCERTIFICATEAUTHORITYFILE = 'sslcertificateauthorityfile';
  MONGOC_URI_SSLALLOWINVALIDCERTIFICATES = 'sslallowinvalidcertificates';
  MONGOC_URI_SSLALLOWINVALIDHOSTNAMES = 'sslallowinvalidhostnames';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Pmongoc_uri_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_uri_copy(uri: Pmongoc_uri_t): Pmongoc_uri_t; cdecl; external libmongoc;
procedure mongoc_uri_destroy(uri: Pmongoc_uri_t); cdecl; external libmongoc;
function mongoc_uri_new(uri_string: pchar): Pmongoc_uri_t; cdecl; external libmongoc;
function mongoc_uri_new_with_error(uri_string: pchar; error: Pbson_error_t): Pmongoc_uri_t; cdecl; external libmongoc;
function mongoc_uri_new_for_host_port(hostname: pchar; port: Tuint16_t): Pmongoc_uri_t; cdecl; external libmongoc;
function mongoc_uri_get_hosts(uri: Pmongoc_uri_t): Pmongoc_host_list_t; cdecl; external libmongoc;
function mongoc_uri_get_service(uri: Pmongoc_uri_t): pchar; cdecl; external libmongoc; deprecated;
function mongoc_uri_get_srv_hostname(uri: Pmongoc_uri_t): pchar; cdecl; external libmongoc;
function mongoc_uri_get_srv_service_name(uri: Pmongoc_uri_t): pchar; cdecl; external libmongoc;
function mongoc_uri_get_database(uri: Pmongoc_uri_t): pchar; cdecl; external libmongoc;
function mongoc_uri_set_database(uri: Pmongoc_uri_t; database: pchar): Boolean; cdecl; external libmongoc;
function mongoc_uri_get_compressors(uri: Pmongoc_uri_t): Pbson_t; cdecl; external libmongoc;
function mongoc_uri_get_options(uri: Pmongoc_uri_t): Pbson_t; cdecl; external libmongoc;
function mongoc_uri_get_password(uri: Pmongoc_uri_t): pchar; cdecl; external libmongoc;
function mongoc_uri_set_password(uri: Pmongoc_uri_t; password: pchar): Boolean; cdecl; external libmongoc;
function mongoc_uri_has_option(uri: Pmongoc_uri_t; key: pchar): Boolean; cdecl; external libmongoc;
function mongoc_uri_option_is_int32(key: pchar): Boolean; cdecl; external libmongoc;
function mongoc_uri_option_is_int64(key: pchar): Boolean; cdecl; external libmongoc;
function mongoc_uri_option_is_bool(key: pchar): Boolean; cdecl; external libmongoc;
function mongoc_uri_option_is_utf8(key: pchar): Boolean; cdecl; external libmongoc;
function mongoc_uri_get_option_as_int32(uri: Pmongoc_uri_t; option: pchar; fallback: Tint32_t): Tint32_t; cdecl; external libmongoc;
function mongoc_uri_get_option_as_int64(uri: Pmongoc_uri_t; option: pchar; fallback: Tint64_t): Tint64_t; cdecl; external libmongoc;
function mongoc_uri_get_option_as_bool(uri: Pmongoc_uri_t; option: pchar; fallback: Boolean): Boolean; cdecl; external libmongoc;
function mongoc_uri_get_option_as_utf8(uri: Pmongoc_uri_t; option: pchar; fallback: pchar): pchar; cdecl; external libmongoc;
function mongoc_uri_set_option_as_int32(uri: Pmongoc_uri_t; option: pchar; value: Tint32_t): Boolean; cdecl; external libmongoc;
function mongoc_uri_set_option_as_int64(uri: Pmongoc_uri_t; option: pchar; value: Tint64_t): Boolean; cdecl; external libmongoc;
function mongoc_uri_set_option_as_bool(uri: Pmongoc_uri_t; option: pchar; value: Boolean): Boolean; cdecl; external libmongoc;
function mongoc_uri_set_option_as_utf8(uri: Pmongoc_uri_t; option: pchar; value: pchar): Boolean; cdecl; external libmongoc;
function mongoc_uri_get_read_prefs(uri: Pmongoc_uri_t): Pbson_t; cdecl; external libmongoc; deprecated;
function mongoc_uri_get_replica_set(uri: Pmongoc_uri_t): pchar; cdecl; external libmongoc;
function mongoc_uri_get_string(uri: Pmongoc_uri_t): pchar; cdecl; external libmongoc;
function mongoc_uri_get_username(uri: Pmongoc_uri_t): pchar; cdecl; external libmongoc;
function mongoc_uri_set_username(uri: Pmongoc_uri_t; username: pchar): Boolean; cdecl; external libmongoc;
function mongoc_uri_get_credentials(uri: Pmongoc_uri_t): Pbson_t; cdecl; external libmongoc;
function mongoc_uri_get_auth_source(uri: Pmongoc_uri_t): pchar; cdecl; external libmongoc;
function mongoc_uri_set_auth_source(uri: Pmongoc_uri_t; value: pchar): Boolean; cdecl; external libmongoc;
function mongoc_uri_get_appname(uri: Pmongoc_uri_t): pchar; cdecl; external libmongoc;
function mongoc_uri_set_appname(uri: Pmongoc_uri_t; value: pchar): Boolean; cdecl; external libmongoc;
function mongoc_uri_set_compressors(uri: Pmongoc_uri_t; value: pchar): Boolean; cdecl; external libmongoc;
function mongoc_uri_get_auth_mechanism(uri: Pmongoc_uri_t): pchar; cdecl; external libmongoc;
function mongoc_uri_set_auth_mechanism(uri: Pmongoc_uri_t; value: pchar): Boolean; cdecl; external libmongoc;
function mongoc_uri_get_mechanism_properties(uri: Pmongoc_uri_t; properties: Pbson_t): Boolean; cdecl; external libmongoc;
function mongoc_uri_set_mechanism_properties(uri: Pmongoc_uri_t; properties: Pbson_t): Boolean; cdecl; external libmongoc;
function mongoc_uri_get_ssl(uri: Pmongoc_uri_t): Boolean; cdecl; external libmongoc; deprecated;
function mongoc_uri_get_tls(uri: Pmongoc_uri_t): Boolean; cdecl; external libmongoc;
function mongoc_uri_unescape(escaped_string: pchar): pchar; cdecl; external libmongoc;
function mongoc_uri_get_read_prefs_t(uri: Pmongoc_uri_t): Pmongoc_read_prefs_t; cdecl; external libmongoc;
procedure mongoc_uri_set_read_prefs_t(uri: Pmongoc_uri_t; prefs: Pmongoc_read_prefs_t); cdecl; external libmongoc;
function mongoc_uri_get_write_concern(uri: Pmongoc_uri_t): Pmongoc_write_concern_t; cdecl; external libmongoc;
procedure mongoc_uri_set_write_concern(uri: Pmongoc_uri_t; wc: Pmongoc_write_concern_t); cdecl; external libmongoc;
function mongoc_uri_get_read_concern(uri: Pmongoc_uri_t): Pmongoc_read_concern_t; cdecl; external libmongoc;
procedure mongoc_uri_set_read_concern(uri: Pmongoc_uri_t; rc: Pmongoc_read_concern_t); cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:14:19 ===


implementation



end.
