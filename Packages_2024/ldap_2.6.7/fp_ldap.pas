unit fp_ldap;

interface

uses
  fp_lber;

const
  {$IFDEF Linux}
  libldap = 'ldap';
  {$ENDIF}

  {$IFDEF Windows}
  libldap = 'ldap.dll';  // ????
  {$ENDIF}

type
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  Tlong_double = extended;
  {$ENDIF}
  {$IFDEF windows}
  Tculong = uint32;
  Tclong = int64;
  Tlong_double = double;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;

  Tsize_t = SizeUInt;

  Twchar_t = DWord;
  Pwchar_t = ^Twchar_t;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

// ==== /usr/include/ldap_features.h

const
  LDAP_VENDOR_VERSION = 20607;
  LDAP_VENDOR_VERSION_MAJOR = 2;
  LDAP_VENDOR_VERSION_MINOR = 6;
  LDAP_VENDOR_VERSION_PATCH = 7;
  LDAP_API_FEATURE_X_OPENLDAP_REENTRANT = 1;
  LDAP_API_FEATURE_X_OPENLDAP_THREAD_SAFE = 1;


  // ==== /usr/include/ldap.h

const
  LDAP_VERSION1 = 1;
  LDAP_VERSION2 = 2;
  LDAP_VERSION3 = 3;
  LDAP_VERSION_MIN = LDAP_VERSION2;
  LDAP_VERSION = LDAP_VERSION2;
  LDAP_VERSION_MAX = LDAP_VERSION3;
  LDAP_API_VERSION = 3001;
  LDAP_VENDOR_NAME = 'OpenLDAP';
  LDAP_API_FEATURE_X_OPENLDAP = LDAP_VENDOR_VERSION;

const
  LDAP_API_FEATURE_THREAD_SAFE = 1;

const
  LDAP_API_FEATURE_SESSION_THREAD_SAFE = 1;
  LDAP_API_FEATURE_OPERATION_THREAD_SAFE = 1;

const
  LDAP_PORT = 389;
  LDAPS_PORT = 636;
  LDAP_ROOT_DSE = '';
  LDAP_NO_ATTRS = '1.1';
  LDAP_ALL_USER_ATTRIBUTES = '*';
  LDAP_ALL_OPERATIONAL_ATTRIBUTES = '+';
  LDAP_MAXINT = 2147483647;
  LDAP_OPT_API_INFO = $0000;
  LDAP_OPT_DESC = $0001;
  LDAP_OPT_DEREF = $0002;
  LDAP_OPT_SIZELIMIT = $0003;
  LDAP_OPT_TIMELIMIT = $0004;
  LDAP_OPT_REFERRALS = $0008;
  LDAP_OPT_RESTART = $0009;
  LDAP_OPT_PROTOCOL_VERSION = $0011;
  LDAP_OPT_SERVER_CONTROLS = $0012;
  LDAP_OPT_CLIENT_CONTROLS = $0013;
  LDAP_OPT_API_FEATURE_INFO = $0015;
  LDAP_OPT_HOST_NAME = $0030;
  LDAP_OPT_RESULT_CODE = $0031;
  LDAP_OPT_ERROR_NUMBER = LDAP_OPT_RESULT_CODE;
  LDAP_OPT_DIAGNOSTIC_MESSAGE = $0032;
  LDAP_OPT_ERROR_STRING = LDAP_OPT_DIAGNOSTIC_MESSAGE;
  LDAP_OPT_MATCHED_DN = $0033;
  LDAP_OPT_SSPI_FLAGS = $0092;
  LDAP_OPT_SIGN = $0095;
  LDAP_OPT_ENCRYPT = $0096;
  LDAP_OPT_SASL_METHOD = $0097;
  LDAP_OPT_SECURITY_CONTEXT = $0099;
  LDAP_OPT_API_EXTENSION_BASE = $4000;
  LDAP_OPT_DEBUG_LEVEL = $5001;
  LDAP_OPT_TIMEOUT = $5002;
  LDAP_OPT_REFHOPLIMIT = $5003;
  LDAP_OPT_NETWORK_TIMEOUT = $5005;
  LDAP_OPT_URI = $5006;
  LDAP_OPT_REFERRAL_URLS = $5007;
  LDAP_OPT_SOCKBUF = $5008;
  LDAP_OPT_DEFBASE = $5009;
  LDAP_OPT_CONNECT_ASYNC = $5010;
  LDAP_OPT_CONNECT_CB = $5011;
  LDAP_OPT_SESSION_REFCNT = $5012;
  LDAP_OPT_KEEPCONN = $5013;
  LDAP_OPT_SOCKET_BIND_ADDRESSES = $5014;
  LDAP_OPT_TCP_USER_TIMEOUT = $5015;
  LDAP_OPT_X_TLS = $6000;
  LDAP_OPT_X_TLS_CTX = $6001;
  LDAP_OPT_X_TLS_CACERTFILE = $6002;
  LDAP_OPT_X_TLS_CACERTDIR = $6003;
  LDAP_OPT_X_TLS_CERTFILE = $6004;
  LDAP_OPT_X_TLS_KEYFILE = $6005;
  LDAP_OPT_X_TLS_REQUIRE_CERT = $6006;
  LDAP_OPT_X_TLS_PROTOCOL_MIN = $6007;
  LDAP_OPT_X_TLS_CIPHER_SUITE = $6008;
  LDAP_OPT_X_TLS_RANDOM_FILE = $6009;
  LDAP_OPT_X_TLS_SSL_CTX = $600a;
  LDAP_OPT_X_TLS_CRLCHECK = $600b;
  LDAP_OPT_X_TLS_CONNECT_CB = $600c;
  LDAP_OPT_X_TLS_CONNECT_ARG = $600d;
  LDAP_OPT_X_TLS_DHFILE = $600e;
  LDAP_OPT_X_TLS_NEWCTX = $600f;
  LDAP_OPT_X_TLS_CRLFILE = $6010;
  LDAP_OPT_X_TLS_PACKAGE = $6011;
  LDAP_OPT_X_TLS_ECNAME = $6012;
  LDAP_OPT_X_TLS_VERSION = $6013;
  LDAP_OPT_X_TLS_CIPHER = $6014;
  LDAP_OPT_X_TLS_PEERCERT = $6015;
  LDAP_OPT_X_TLS_CACERT = $6016;
  LDAP_OPT_X_TLS_CERT = $6017;
  LDAP_OPT_X_TLS_KEY = $6018;
  LDAP_OPT_X_TLS_PEERKEY_HASH = $6019;
  LDAP_OPT_X_TLS_REQUIRE_SAN = $601a;
  LDAP_OPT_X_TLS_PROTOCOL_MAX = $601b;
  LDAP_OPT_X_TLS_NEVER = 0;
  LDAP_OPT_X_TLS_HARD = 1;
  LDAP_OPT_X_TLS_DEMAND = 2;
  LDAP_OPT_X_TLS_ALLOW = 3;
  LDAP_OPT_X_TLS_TRY = 4;
  LDAP_OPT_X_TLS_CRL_NONE = 0;
  LDAP_OPT_X_TLS_CRL_PEER = 1;
  LDAP_OPT_X_TLS_CRL_ALL = 2;

function LDAP_OPT_X_TLS_PROTOCOL(maj, min: longint): longint;

const
  LDAP_OPT_X_TLS_PROTOCOL_SSL2 = 2 shl 8;
  LDAP_OPT_X_TLS_PROTOCOL_SSL3 = 3 shl 8;
  LDAP_OPT_X_TLS_PROTOCOL_TLS1_0 = (3 shl 8) + 1;
  LDAP_OPT_X_TLS_PROTOCOL_TLS1_1 = (3 shl 8) + 2;
  LDAP_OPT_X_TLS_PROTOCOL_TLS1_2 = (3 shl 8) + 3;
  LDAP_OPT_X_TLS_PROTOCOL_TLS1_3 = (3 shl 8) + 4;
  LDAP_OPT_X_SASL_CBINDING_NONE = 0;
  LDAP_OPT_X_SASL_CBINDING_TLS_UNIQUE = 1;
  LDAP_OPT_X_SASL_CBINDING_TLS_ENDPOINT = 2;
  LDAP_OPT_X_SASL_MECH = $6100;
  LDAP_OPT_X_SASL_REALM = $6101;
  LDAP_OPT_X_SASL_AUTHCID = $6102;
  LDAP_OPT_X_SASL_AUTHZID = $6103;
  LDAP_OPT_X_SASL_SSF = $6104;
  LDAP_OPT_X_SASL_SSF_EXTERNAL = $6105;
  LDAP_OPT_X_SASL_SECPROPS = $6106;
  LDAP_OPT_X_SASL_SSF_MIN = $6107;
  LDAP_OPT_X_SASL_SSF_MAX = $6108;
  LDAP_OPT_X_SASL_MAXBUFSIZE = $6109;
  LDAP_OPT_X_SASL_MECHLIST = $610a;
  LDAP_OPT_X_SASL_NOCANON = $610b;
  LDAP_OPT_X_SASL_USERNAME = $610c;
  LDAP_OPT_X_SASL_GSS_CREDS = $610d;
  LDAP_OPT_X_SASL_CBINDING = $610e;
  LDAP_OPT_X_KEEPALIVE_IDLE = $6300;
  LDAP_OPT_X_KEEPALIVE_PROBES = $6301;
  LDAP_OPT_X_KEEPALIVE_INTERVAL = $6302;
  LDAP_OPT_PRIVATE_EXTENSION_BASE = $7000;
  LDAP_OPT_SUCCESS = 0;
  LDAP_OPT_ERROR = -(1);

const
  //    LDAP_OPT_ON = pointer(@ber_pvt_opt_on);

  LDAP_OPT_ON = Pointer(123); /// ????
  LDAP_OPT_OFF = pointer(0);

type
  Tldapapiinfo = record
    ldapai_info_version: longint;
    ldapai_api_version: longint;
    ldapai_protocol_version: longint;
    ldapai_extensions: ^pchar;
    ldapai_vendor_name: pchar;
    ldapai_vendor_version: longint;
  end;
  Pldapapiinfo = ^Tldapapiinfo;

const
  LDAP_API_INFO_VERSION = 1;

type
  Tldap_apifeature_info = record
    ldapaif_info_version: longint;
    ldapaif_name: pchar;
    ldapaif_version: longint;
  end;
  Pldap_apifeature_info = ^Tldap_apifeature_info;

  TLDAPAPIFeatureInfo = Tldap_apifeature_info;
  PLDAPAPIFeatureInfo = ^TLDAPAPIFeatureInfo;
  { apifeature_info struct version  }

const
  LDAP_FEATURE_INFO_VERSION = 1;

type
  Tldapcontrol = record
    ldctl_oid: pchar;
    ldctl_value: Tberval;
    ldctl_iscritical: char;
  end;
  Pldapcontrol = ^Tldapcontrol;
  PPldapcontrol = ^Pldapcontrol;
  PPPldapcontrol = ^PPldapcontrol;

const
  LDAP_CONTROL_MANAGEDSAIT = '2.16.840.1.113730.3.4.2';
  LDAP_CONTROL_PROXY_AUTHZ = '2.16.840.1.113730.3.4.18';
  LDAP_CONTROL_SUBENTRIES = '1.3.6.1.4.1.4203.1.10.1';

  LDAP_CONTROL_VALUESRETURNFILTER = '1.2.826.0.1.3344810.2.3';

  LDAP_CONTROL_ASSERT = '1.3.6.1.1.12';
  LDAP_CONTROL_PRE_READ = '1.3.6.1.1.13.1';
  LDAP_CONTROL_POST_READ = '1.3.6.1.1.13.2';

  LDAP_CONTROL_SORTREQUEST = '1.2.840.113556.1.4.473';
  LDAP_CONTROL_SORTRESPONSE = '1.2.840.113556.1.4.474';

  LDAP_CONTROL_PAGEDRESULTS = '1.2.840.113556.1.4.319';

  LDAP_CONTROL_AUTHZID_REQUEST = '2.16.840.1.113730.3.4.16';
  LDAP_CONTROL_AUTHZID_RESPONSE = '2.16.840.1.113730.3.4.15';

  LDAP_SYNC_OID = '1.3.6.1.4.1.4203.1.9.1';
  LDAP_CONTROL_SYNC = LDAP_SYNC_OID + '.1';
  LDAP_CONTROL_SYNC_STATE = LDAP_SYNC_OID + '.2';
  LDAP_CONTROL_SYNC_DONE = LDAP_SYNC_OID + '.3';
  LDAP_SYNC_INFO = LDAP_SYNC_OID + '.4';

  LDAP_SYNC_NONE = $00;
  LDAP_SYNC_REFRESH_ONLY = $01;
  LDAP_SYNC_RESERVED = $02;
  LDAP_SYNC_REFRESH_AND_PERSIST = $03;

  LDAP_SYNC_REFRESH_PRESENTS = 0;
  LDAP_SYNC_REFRESH_DELETES = 1;

  LDAP_TAG_SYNC_NEW_COOKIE = Tber_tag_t($80);
  LDAP_TAG_SYNC_REFRESH_DELETE = Tber_tag_t($A1);
  LDAP_TAG_SYNC_REFRESH_PRESENT = Tber_tag_t($A2);
  LDAP_TAG_SYNC_ID_SET = Tber_tag_t($A3);

  LDAP_TAG_SYNC_COOKIE = Tber_tag_t($04);
  LDAP_TAG_REFRESHDELETES = Tber_tag_t($01);
  LDAP_TAG_REFRESHDONE = Tber_tag_t($01);
  LDAP_TAG_RELOAD_HINT = Tber_tag_t($01);

  LDAP_SYNC_PRESENT = 0;
  LDAP_SYNC_ADD = 1;
  LDAP_SYNC_MODIFY = 2;
  LDAP_SYNC_DELETE = 3;
  LDAP_SYNC_NEW_COOKIE = 4;

  LDAP_CONTROL_DONTUSECOPY = '1.3.6.1.1.22';

  LDAP_CONTROL_PASSWORDPOLICYREQUEST = '1.3.6.1.4.1.42.2.27.8.5.1';
  LDAP_CONTROL_PASSWORDPOLICYRESPONSE = '1.3.6.1.4.1.42.2.27.8.5.1';

  LDAP_CONTROL_NOOP = '1.3.6.1.4.1.4203.666.5.2';
  LDAP_CONTROL_NO_SUBORDINATES = '1.3.6.1.4.1.4203.666.5.11';
  LDAP_CONTROL_RELAX = '1.3.6.1.4.1.4203.666.5.12';
  LDAP_CONTROL_MANAGEDIT = LDAP_CONTROL_RELAX;
  LDAP_CONTROL_SLURP = '1.3.6.1.4.1.4203.666.5.13';
  LDAP_CONTROL_VALSORT = '1.3.6.1.4.1.4203.666.5.14';
  LDAP_CONTROL_X_DEREF = '1.3.6.1.4.1.4203.666.5.16';
  LDAP_CONTROL_X_WHATFAILED = '1.3.6.1.4.1.4203.666.5.17';

  LDAP_CONTROL_X_CHAINING_BEHAVIOR = '1.3.6.1.4.1.4203.666.11.3';

  LDAP_CHAINING_PREFERRED = 0;
  LDAP_CHAINING_REQUIRED = 1;
  LDAP_REFERRALS_PREFERRED = 2;
  LDAP_REFERRALS_REQUIRED = 3;

  LDAP_CONTROL_X_LAZY_COMMIT = '1.2.840.113556.1.4.619';
  LDAP_CONTROL_X_INCREMENTAL_VALUES = '1.2.840.113556.1.4.802';
  LDAP_CONTROL_X_DOMAIN_SCOPE = '1.2.840.113556.1.4.1339';
  LDAP_CONTROL_X_PERMISSIVE_MODIFY = '1.2.840.113556.1.4.1413';
  LDAP_CONTROL_X_SEARCH_OPTIONS = '1.2.840.113556.1.4.1340';
  LDAP_SEARCH_FLAG_DOMAIN_SCOPE = 1;
  LDAP_SEARCH_FLAG_PHANTOM_ROOT = 2;
  LDAP_CONTROL_X_TREE_DELETE = '1.2.840.113556.1.4.805';

  LDAP_CONTROL_X_SERVER_NOTIFICATION = '1.2.840.113556.1.4.528';
  LDAP_CONTROL_X_EXTENDED_DN = '1.2.840.113556.1.4.529';
  LDAP_CONTROL_X_SHOW_DELETED = '1.2.840.113556.1.4.417';
  LDAP_CONTROL_X_DIRSYNC = '1.2.840.113556.1.4.841';

  LDAP_CONTROL_X_DIRSYNC_OBJECT_SECURITY = $00000001;
  LDAP_CONTROL_X_DIRSYNC_ANCESTORS_FIRST = $00000800;
  LDAP_CONTROL_X_DIRSYNC_PUBLIC_DATA_ONLY = $00002000;
  LDAP_CONTROL_X_DIRSYNC_INCREMENTAL_VALUES = $80000000;

  LDAP_CONTROL_X_SESSION_TRACKING = '1.3.6.1.4.1.21008.108.63.1';
  LDAP_CONTROL_X_SESSION_TRACKING_RADIUS_ACCT_SESSION_ID = LDAP_CONTROL_X_SESSION_TRACKING + '.1';
  LDAP_CONTROL_X_SESSION_TRACKING_RADIUS_ACCT_MULTI_SESSION_ID = LDAP_CONTROL_X_SESSION_TRACKING + '.2';
  LDAP_CONTROL_X_SESSION_TRACKING_USERNAME = LDAP_CONTROL_X_SESSION_TRACKING + '.3';

  LDAP_CONTROL_DUPENT_REQUEST = '2.16.840.1.113719.1.27.101.1';
  LDAP_CONTROL_DUPENT_RESPONSE = '2.16.840.1.113719.1.27.101.2';
  LDAP_CONTROL_DUPENT_ENTRY = '2.16.840.1.113719.1.27.101.3';
  LDAP_CONTROL_DUPENT = LDAP_CONTROL_DUPENT_REQUEST;

  LDAP_CONTROL_PERSIST_REQUEST = '2.16.840.1.113730.3.4.3';
  LDAP_CONTROL_PERSIST_ENTRY_CHANGE_NOTICE = '2.16.840.1.113730.3.4.7';
  LDAP_CONTROL_PERSIST_ENTRY_CHANGE_ADD = $1;
  LDAP_CONTROL_PERSIST_ENTRY_CHANGE_DELETE = $2;
  LDAP_CONTROL_PERSIST_ENTRY_CHANGE_MODIFY = $4;
  LDAP_CONTROL_PERSIST_ENTRY_CHANGE_RENAME = $8;

  LDAP_CONTROL_VLVREQUEST = '2.16.840.1.113730.3.4.9';
  LDAP_CONTROL_VLVRESPONSE = '2.16.840.1.113730.3.4.10';

  LDAP_CONTROL_X_ACCOUNT_USABILITY = '1.3.6.1.4.1.42.2.27.9.5.8';

  LDAP_TAG_X_ACCOUNT_USABILITY_AVAILABLE = Tber_tag_t($80);
  LDAP_TAG_X_ACCOUNT_USABILITY_NOT_AVAILABLE = Tber_tag_t($A1);

  LDAP_TAG_X_ACCOUNT_USABILITY_INACTIVE = Tber_tag_t($80);
  LDAP_TAG_X_ACCOUNT_USABILITY_RESET = Tber_tag_t($81);
  LDAP_TAG_X_ACCOUNT_USABILITY_EXPIRED = Tber_tag_t($82);
  LDAP_TAG_X_ACCOUNT_USABILITY_REMAINING_GRACE = Tber_tag_t($83);
  LDAP_TAG_X_ACCOUNT_USABILITY_UNTIL_UNLOCK = Tber_tag_t($84);

  LDAP_CONTROL_X_PASSWORD_EXPIRED = '2.16.840.1.113730.3.4.4';
  LDAP_CONTROL_X_PASSWORD_EXPIRING = '2.16.840.1.113730.3.4.5';

  LDAP_NOTICE_OF_DISCONNECTION = '1.3.6.1.4.1.1466.20036';
  LDAP_NOTICE_DISCONNECT = LDAP_NOTICE_OF_DISCONNECTION;

  LDAP_EXOP_START_TLS = '1.3.6.1.4.1.1466.20037';

  LDAP_EXOP_MODIFY_PASSWD = '1.3.6.1.4.1.4203.1.11.1';

  LDAP_TAG_EXOP_MODIFY_PASSWD_ID = Tber_tag_t($80);
  LDAP_TAG_EXOP_MODIFY_PASSWD_OLD = Tber_tag_t($81);
  LDAP_TAG_EXOP_MODIFY_PASSWD_NEW = Tber_tag_t($82);
  LDAP_TAG_EXOP_MODIFY_PASSWD_GEN = Tber_tag_t($80);

  LDAP_EXOP_CANCEL = '1.3.6.1.1.8';
  LDAP_EXOP_X_CANCEL = LDAP_EXOP_CANCEL;

  LDAP_EXOP_REFRESH = '1.3.6.1.4.1.1466.101.119.1';
  LDAP_TAG_EXOP_REFRESH_REQ_DN = Tber_tag_t($80);
  LDAP_TAG_EXOP_REFRESH_REQ_TTL = Tber_tag_t($81);
  LDAP_TAG_EXOP_REFRESH_RES_TTL = Tber_tag_t($81);

  LDAP_EXOP_VERIFY_CREDENTIALS = '1.3.6.1.4.1.4203.666.6.5';
  LDAP_EXOP_X_VERIFY_CREDENTIALS = LDAP_EXOP_VERIFY_CREDENTIALS;

  LDAP_TAG_EXOP_VERIFY_CREDENTIALS_COOKIE = Tber_tag_t($80);
  LDAP_TAG_EXOP_VERIFY_CREDENTIALS_SCREDS = Tber_tag_t($81);
  LDAP_TAG_EXOP_VERIFY_CREDENTIALS_CONTROLS = Tber_tag_t($A2); //

  LDAP_EXOP_WHO_AM_I = '1.3.6.1.4.1.4203.1.11.3';
  LDAP_EXOP_X_WHO_AM_I = LDAP_EXOP_WHO_AM_I;

  LDAP_EXOP_TURN = '1.3.6.1.1.19';
  LDAP_EXOP_X_TURN = LDAP_EXOP_TURN;

  LDAP_X_DISTPROC_BASE = '1.3.6.1.4.1.4203.666.11.6';
  LDAP_EXOP_X_CHAINEDREQUEST = LDAP_X_DISTPROC_BASE + '.1';
  LDAP_FEATURE_X_CANCHAINOPS = LDAP_X_DISTPROC_BASE + '.2';
  LDAP_CONTROL_X_RETURNCONTREF = LDAP_X_DISTPROC_BASE + '.3';
  LDAP_URLEXT_X_LOCALREFOID = LDAP_X_DISTPROC_BASE + '.4';
  LDAP_URLEXT_X_REFTYPEOID = LDAP_X_DISTPROC_BASE + '.5';
  LDAP_URLEXT_X_SEARCHEDSUBTREEOID = LDAP_X_DISTPROC_BASE + '.6';
  LDAP_URLEXT_X_FAILEDNAMEOID = LDAP_X_DISTPROC_BASE + '.7';
  LDAP_URLEXT_X_LOCALREF = 'x-localReference';
  LDAP_URLEXT_X_REFTYPE = 'x-referenceType';
  LDAP_URLEXT_X_SEARCHEDSUBTREE = 'x-searchedSubtree';
  LDAP_URLEXT_X_FAILEDNAME = 'x-failedName';

  LDAP_TXN = '1.3.6.1.1.21';
  LDAP_EXOP_TXN_START = LDAP_TXN + '.1';
  LDAP_CONTROL_TXN_SPEC = LDAP_TXN + '.2';
  LDAP_EXOP_TXN_END = LDAP_TXN + '.3';
  LDAP_EXOP_TXN_ABORTED_NOTICE = LDAP_TXN + '.4';

  LDAP_FEATURE_ALL_OP_ATTRS = '1.3.6.1.4.1.4203.1.5.1';
  LDAP_FEATURE_OBJECTCLASS_ATTRS = '1.3.6.1.4.1.4203.1.5.2';
  LDAP_FEATURE_ABSOLUTE_FILTERS = '1.3.6.1.4.1.4203.1.5.3';
  LDAP_FEATURE_LANGUAGE_TAG_OPTIONS = '1.3.6.1.4.1.4203.1.5.4';
  LDAP_FEATURE_LANGUAGE_RANGE_OPTIONS = '1.3.6.1.4.1.4203.1.5.5';
  LDAP_FEATURE_MODIFY_INCREMENT = '1.3.6.1.1.14';

  LDAP_FEATURE_SUBORDINATE_SCOPE = '1.3.6.1.4.1.4203.666.8.1';
  LDAP_FEATURE_CHILDREN_SCOPE = LDAP_FEATURE_SUBORDINATE_SCOPE;

  LDAP_TAG_MESSAGE = Tber_tag_t($30);
  LDAP_TAG_MSGID = Tber_tag_t($02);

  LDAP_TAG_LDAPDN = Tber_tag_t($04);
  LDAP_TAG_LDAPCRED = Tber_tag_t($04);

  LDAP_TAG_CONTROLS = Tber_tag_t($A0);
  LDAP_TAG_REFERRAL = Tber_tag_t($A3);

  LDAP_TAG_NEWSUPERIOR = Tber_tag_t($80);

  LDAP_TAG_EXOP_REQ_OID = Tber_tag_t($80);
  LDAP_TAG_EXOP_REQ_VALUE = Tber_tag_t($81);
  LDAP_TAG_EXOP_RES_OID = Tber_tag_t($8A);
  LDAP_TAG_EXOP_RES_VALUE = Tber_tag_t($8B);

  LDAP_TAG_IM_RES_OID = Tber_tag_t($80);
  LDAP_TAG_IM_RES_VALUE = Tber_tag_t($81);

  LDAP_TAG_SASL_RES_CREDS = Tber_tag_t($87);

  LDAP_REQ_BIND = Tber_tag_t($60);
  LDAP_REQ_UNBIND = Tber_tag_t($42);
  LDAP_REQ_SEARCH = Tber_tag_t($63);
  LDAP_REQ_MODIFY = Tber_tag_t($66);
  LDAP_REQ_ADD = Tber_tag_t($68);
  LDAP_REQ_DELETE = Tber_tag_t($4A);
  LDAP_REQ_MODDN = Tber_tag_t($6C);
  LDAP_REQ_MODRDN = LDAP_REQ_MODDN;
  LDAP_REQ_RENAME = LDAP_REQ_MODDN;
  LDAP_REQ_COMPARE = Tber_tag_t($6E);
  LDAP_REQ_ABANDON = Tber_tag_t($50);
  LDAP_REQ_EXTENDED = Tber_tag_t($77);

  LDAP_RES_BIND = Tber_tag_t($61);
  LDAP_RES_SEARCH_ENTRY = Tber_tag_t($64);
  LDAP_RES_SEARCH_REFERENCE = Tber_tag_t($73);
  LDAP_RES_SEARCH_RESULT = Tber_tag_t($65);
  LDAP_RES_MODIFY = Tber_tag_t($67);
  LDAP_RES_ADD = Tber_tag_t($69);
  LDAP_RES_DELETE = Tber_tag_t($6B);
  LDAP_RES_MODDN = Tber_tag_t($6D);
  LDAP_RES_MODRDN = LDAP_RES_MODDN;
  LDAP_RES_RENAME = LDAP_RES_MODDN;
  LDAP_RES_COMPARE = Tber_tag_t($6F);
  LDAP_RES_EXTENDED = Tber_tag_t($78);
  LDAP_RES_INTERMEDIATE = Tber_tag_t($79);

  LDAP_RES_ANY = Tber_int_t(-1);
  LDAP_RES_UNSOLICITED = Tber_int_t(0);

  LDAP_SASL_SIMPLE = pchar(0);
  LDAP_SASL_NULL = '';

  LDAP_AUTH_NONE = Tber_tag_t($00);
  LDAP_AUTH_SIMPLE = Tber_tag_t($80);
  LDAP_AUTH_SASL = Tber_tag_t($A3);
  LDAP_AUTH_KRBV4 = Tber_tag_t($FF);
  LDAP_AUTH_KRBV41 = Tber_tag_t($81);
  LDAP_AUTH_KRBV42 = Tber_tag_t($82);

  LDAP_AUTH_NEGOTIATE = Tber_tag_t($04FF);

  LDAP_FILTER_AND = Tber_tag_t($A0);
  LDAP_FILTER_OR = Tber_tag_t($A1);
  LDAP_FILTER_NOT = Tber_tag_t($A2);
  LDAP_FILTER_EQUALITY = Tber_tag_t($A3);
  LDAP_FILTER_SUBSTRINGS = Tber_tag_t($A4);
  LDAP_FILTER_GE = Tber_tag_t($A5);
  LDAP_FILTER_LE = Tber_tag_t($A6);
  LDAP_FILTER_PRESENT = Tber_tag_t($87);
  LDAP_FILTER_APPROX = Tber_tag_t($A8);
  LDAP_FILTER_EXT = Tber_tag_t($A9);

  LDAP_FILTER_EXT_OID = Tber_tag_t($81);
  LDAP_FILTER_EXT_TYPE = Tber_tag_t($82);
  LDAP_FILTER_EXT_VALUE = Tber_tag_t($83);
  LDAP_FILTER_EXT_DNATTRS = Tber_tag_t($84);

  LDAP_SUBSTRING_INITIAL = Tber_tag_t($80);
  LDAP_SUBSTRING_ANY = Tber_tag_t($81);
  LDAP_SUBSTRING_FINAL = Tber_tag_t($82);

  LDAP_SCOPE_BASE = Tber_int_t(0);
  LDAP_SCOPE_BASEOBJECT = LDAP_SCOPE_BASE;
  LDAP_SCOPE_ONELEVEL = Tber_int_t(1);
  LDAP_SCOPE_ONE = LDAP_SCOPE_ONELEVEL;
  LDAP_SCOPE_SUBTREE = Tber_int_t(2);
  LDAP_SCOPE_SUB = LDAP_SCOPE_SUBTREE;
  LDAP_SCOPE_SUBORDINATE = Tber_int_t(3);
  LDAP_SCOPE_CHILDREN = LDAP_SCOPE_SUBORDINATE;
  LDAP_SCOPE_DEFAULT = Tber_int_t(-1);

  LDAP_SUCCESS = $00;

function LDAP_RANGE(n, x, y: longint): boolean;

const
  LDAP_OPERATIONS_ERROR = $01;
  LDAP_PROTOCOL_ERROR = $02;
  LDAP_TIMELIMIT_EXCEEDED = $03;
  LDAP_SIZELIMIT_EXCEEDED = $04;
  LDAP_COMPARE_FALSE = $05;
  LDAP_COMPARE_TRUE = $06;
  LDAP_AUTH_METHOD_NOT_SUPPORTED = $07;
  LDAP_STRONG_AUTH_NOT_SUPPORTED = LDAP_AUTH_METHOD_NOT_SUPPORTED;
  LDAP_STRONG_AUTH_REQUIRED = $08;
  LDAP_STRONGER_AUTH_REQUIRED = LDAP_STRONG_AUTH_REQUIRED;
  LDAP_PARTIAL_RESULTS = $09;
  LDAP_REFERRAL = $0a;
  LDAP_ADMINLIMIT_EXCEEDED = $0b;
  LDAP_UNAVAILABLE_CRITICAL_EXTENSION = $0c;
  LDAP_CONFIDENTIALITY_REQUIRED = $0d;
  LDAP_SASL_BIND_IN_PROGRESS = $0e;

function LDAP_ATTR_ERROR(n: longint): boolean;

const
  LDAP_NO_SUCH_ATTRIBUTE = $10;
  LDAP_UNDEFINED_TYPE = $11;
  LDAP_INAPPROPRIATE_MATCHING = $12;
  RAINT_VIOLATION = $13;
  LDAP_TYPE_OR_VALUE_EXISTS = $14;
  LDAP_INVALID_SYNTAX = $15;

function LDAP_NAME_ERROR(n: longint): boolean;

const
  LDAP_NO_SUCH_OBJECT = $20;
  LDAP_ALIAS_PROBLEM = $21;
  LDAP_INVALID_DN_SYNTAX = $22;
  LDAP_IS_LEAF = $23;
  LDAP_ALIAS_DEREF_PROBLEM = $24;

function LDAP_SECURITY_ERROR(n: longint): boolean;

const
  LDAP_X_PROXY_AUTHZ_FAILURE = $2F;
  LDAP_INAPPROPRIATE_AUTH = $30;
  LDAP_INVALID_CREDENTIALS = $31;
  LDAP_INSUFFICIENT_ACCESS = $32;

function LDAP_SERVICE_ERROR(n: longint): boolean;

const
  LDAP_BUSY = $33;
  LDAP_UNAVAILABLE = $34;
  LDAP_UNWILLING_TO_PERFORM = $35;
  LDAP_LOOP_DETECT = $36;

function LDAP_UPDATE_ERROR(n: longint): boolean;

const
  LDAP_NAMING_VIOLATION = $40;
  LDAP_OBJECT_CLASS_VIOLATION = $41;
  LDAP_NOT_ALLOWED_ON_NONLEAF = $42;
  LDAP_NOT_ALLOWED_ON_RDN = $43;
  LDAP_ALREADY_EXISTS = $44;
  LDAP_NO_OBJECT_CLASS_MODS = $45;
  LDAP_RESULTS_TOO_LARGE = $46;
  LDAP_AFFECTS_MULTIPLE_DSAS = $47;
  LDAP_VLV_ERROR = $4C;
  LDAP_OTHER = $50;
  LDAP_CUP_RESOURCES_EXHAUSTED = $71;
  LDAP_CUP_SECURITY_VIOLATION = $72;
  LDAP_CUP_INVALID_DATA = $73;
  LDAP_CUP_UNSUPPORTED_SCHEME = $74;
  LDAP_CUP_RELOAD_REQUIRED = $75;
  LDAP_CANCELLED = $76;
  LDAP_NO_SUCH_OPERATION = $77;
  LDAP_TOO_LATE = $78;
  LDAP_CANNOT_CANCEL = $79;
  LDAP_ASSERTION_FAILED = $7A;
  LDAP_PROXIED_AUTHORIZATION_DENIED = $7B;

function LDAP_E_ERROR(n: longint): boolean;

const
  LDAP_SYNC_REFRESH_REQUIRED = $1000;

function LDAP_X_ERROR(n: longint): boolean;

const
  LDAP_X_SYNC_REFRESH_REQUIRED = $4100;
  LDAP_X_ASSERTION_FAILED = $410f;
  LDAP_X_NO_OPERATION = $410e;
  LDAP_X_NO_REFERRALS_FOUND = $4110;
  LDAP_X_CANNOT_CHAIN = $4111;
  LDAP_X_INVALIDREFERENCE = $4112;

const
  LDAP_TXN_SPECIFY_OKAY = $4120;
  LDAP_TXN_ID_INVALID = $4121;

function LDAP_API_ERROR(n: longint): boolean;
function LDAP_API_RESULT(n: longint): boolean;

const
  LDAP_SERVER_DOWN = -(1);
  LDAP_LOCAL_ERROR = -(2);
  LDAP_ENCODING_ERROR = -(3);
  LDAP_DECODING_ERROR = -(4);
  LDAP_TIMEOUT = -(5);
  LDAP_AUTH_UNKNOWN = -(6);
  LDAP_FILTER_ERROR = -(7);
  LDAP_USER_CANCELLED = -(8);
  LDAP_PARAM_ERROR = -(9);
  LDAP_NO_MEMORY = -(10);
  LDAP_CONNECT_ERROR = -(11);
  LDAP_NOT_SUPPORTED = -(12);
  LDAP_CONTROL_NOT_FOUND = -(13);
  LDAP_NO_RESULTS_RETURNED = -(14);
  LDAP_MORE_RESULTS_TO_RETURN = -(15);
  LDAP_CLIENT_LOOP = -(16);
  LDAP_REFERRAL_LIMIT_EXCEEDED = -(17);
  LDAP_X_CONNECTING = -(18);

type
  PLDAPMessage = type Pointer;
  PPLDAPMessage = ^PLDAPMessage;

const
  LDAP_MOD_OP = $0007;
  LDAP_MOD_ADD = $0000;
  LDAP_MOD_DELETE = $0001;
  LDAP_MOD_REPLACE = $0002;
  LDAP_MOD_INCREMENT = $0003;
  LDAP_MOD_BVALUES = $0080;

type
  Tldapmod = record
    mod_op: longint;
    mod_type: pchar;
    mod_vals: record
      case longint of
        0: (modv_strvals: ^pchar);
        1: (modv_bvals: ^Pberval);
      end;
  end;
  Pldapmod = ^Tldapmod;
  PPldapmod = ^Pldapmod;

  PLDAP = type Pointer;
  PPLDAP = ^PLDAP;

const
  LDAP_DEREF_NEVER = $00;
  LDAP_DEREF_SEARCHING = $01;
  LDAP_DEREF_FINDING = $02;
  LDAP_DEREF_ALWAYS = $03;
  LDAP_NO_LIMIT = 0;
  LDAP_MSG_ONE = $00;
  LDAP_MSG_ALL = $01;
  LDAP_MSG_RECEIVED = $02;

type
  Pldap_url_desc = ^Tldap_url_desc;

  Tldap_url_desc = record
    lud_next: Pldap_url_desc;
    lud_scheme: pchar;
    lud_host: pchar;
    lud_port: longint;
    lud_dn: pchar;
    lud_attrs: ^pchar;
    lud_scope: longint;
    lud_filter: pchar;
    lud_exts: ^pchar;
    lud_crit_exts: longint;
  end;
  TLDAPURLDesc = Tldap_url_desc;
  PLDAPURLDesc = ^TLDAPURLDesc;
  PPLDAPURLDesc = ^PLDAPURLDesc;

const
  LDAP_URL_SUCCESS = $00;
  LDAP_URL_ERR_MEM = $01;
  LDAP_URL_ERR_PARAM = $02;
  LDAP_URL_ERR_BADSCHEME = $03;
  LDAP_URL_ERR_BADENCLOSURE = $04;
  LDAP_URL_ERR_BADURL = $05;
  LDAP_URL_ERR_BADHOST = $06;
  LDAP_URL_ERR_BADATTRS = $07;
  LDAP_URL_ERR_BADSCOPE = $08;
  LDAP_URL_ERR_BADFILTER = $09;
  LDAP_URL_ERR_BADEXTS = $0a;

type
  Pldap_sync_refresh_t = ^Tldap_sync_refresh_t;
  Tldap_sync_refresh_t = longint;

const
  LDAP_SYNC_CAPI_NONE = -(1);
  LDAP_SYNC_CAPI_PHASE_FLAG = $10;
  LDAP_SYNC_CAPI_IDSET_FLAG = $20;
  LDAP_SYNC_CAPI_DONE_FLAG = $40;
  LDAP_SYNC_CAPI_PRESENT = LDAP_SYNC_PRESENT;
  LDAP_SYNC_CAPI_ADD = LDAP_SYNC_ADD;
  LDAP_SYNC_CAPI_MODIFY = LDAP_SYNC_MODIFY;
  LDAP_SYNC_CAPI_DELETE = LDAP_SYNC_DELETE;
  LDAP_SYNC_CAPI_PRESENTS = LDAP_SYNC_CAPI_PHASE_FLAG or LDAP_SYNC_CAPI_PRESENT;
  LDAP_SYNC_CAPI_DELETES = LDAP_SYNC_CAPI_PHASE_FLAG or LDAP_SYNC_CAPI_DELETE;
  LDAP_SYNC_CAPI_PRESENTS_IDSET = LDAP_SYNC_CAPI_PRESENTS or LDAP_SYNC_CAPI_IDSET_FLAG;
  LDAP_SYNC_CAPI_DELETES_IDSET = LDAP_SYNC_CAPI_DELETES or LDAP_SYNC_CAPI_IDSET_FLAG;
  LDAP_SYNC_CAPI_DONE = LDAP_SYNC_CAPI_DONE_FLAG or LDAP_SYNC_CAPI_PRESENTS;

type
  Pldap_sync_t = ^Tldap_sync_t;
  Tldap_sync_search_entry_f = function(ls: Pldap_sync_t; msg: PLDAPMessage; entryUUID: Pberval; phase: Tldap_sync_refresh_t): longint; cdecl;
  Tldap_sync_search_reference_f = function(ls: Pldap_sync_t; msg: PLDAPMessage): longint; cdecl;
  Tldap_sync_intermediate_f = function(ls: Pldap_sync_t; msg: PLDAPMessage; syncUUIDs: TBerVarray; phase: Tldap_sync_refresh_t): longint; cdecl;
  Tldap_sync_search_result_f = function(ls: Pldap_sync_t; msg: PLDAPMessage; refreshDeletes: longint): longint; cdecl;

  Tldap_sync_t = record
    ls_base: pchar;
    ls_scope: longint;
    ls_filter: pchar;
    ls_attrs: ^pchar;
    ls_timelimit: longint;
    ls_sizelimit: longint;
    ls_timeout: longint;
    ls_search_entry: Tldap_sync_search_entry_f;
    ls_search_reference: Tldap_sync_search_reference_f;
    ls_intermediate: Tldap_sync_intermediate_f;
    ls_search_result: Tldap_sync_search_result_f;
    ls_private: pointer;
    ls_ld: PLDAP;
    ls_msgid: longint;
    ls_reloadHint: longint;
    ls_cookie: Tberval;
    ls_refreshPhase: Tldap_sync_refresh_t;
  end;

  Psockaddr = type Pointer;

type
  Pldap_conncb = ^Tldap_conncb;
  Tldap_conn_add_f = function(ld: PLDAP; sb: PSockbuf; srv: PLDAPURLDesc; addr: Psockaddr; ctx: Pldap_conncb): integer; cdecl;
  Tldap_conn_del_f = procedure(ld: PLDAP; sb: PSockbuf; ctx: Pldap_conncb); cdecl;

  Tldap_conncb = record
    lc_add: Tldap_conn_add_f;
    lc_del: Tldap_conn_del_f;
    lc_arg: pointer;
  end;

  Ptimeval = type Pointer;

function ldap_get_option(ld: PLDAP; option: longint; outvalue: pointer): longint; cdecl; external libldap;
function ldap_set_option(ld: PLDAP; option: longint; invalue: pointer): longint; cdecl; external libldap;

type
  TLDAP_REBIND_PROC = function(ld: PLDAP; url: pchar; request: Tber_tag_t; msgid: Tber_int_t; params: Pointer): integer; cdecl;

function ldap_set_rebind_proc(ld: PLDAP; rebind_proc: TLDAP_REBIND_PROC; params: pointer): longint; cdecl; external libldap;

type
  TLDAP_NEXTREF_PROC = function(ld: PLDAP; refsp: PPPChar; cntp: PInteger; params: Pointer): integer; cdecl;

function ldap_set_nextref_proc(ld: PLDAP; nextref_proc: TLDAP_NEXTREF_PROC; params: pointer): longint; cdecl; external libldap;

type
  TLDAP_URLLIST_PROC = function(ld: PLDAP; urllist: PPLDAPURLDesc; url: PPLDAPURLDesc;
    params: Pointer): integer; cdecl;

function ldap_set_urllist_proc(ld: PLDAP; urllist_proc: TLDAP_URLLIST_PROC; params: pointer): longint; cdecl; external libldap;

function ldap_create_control(requestOID: pchar; ber: PBerElement; iscritical: longint; ctrlp: PPLDAPControl): longint; cdecl; external libldap;
function ldap_find_control(oid: pchar; ctrls: PPLDAPControl): PLDAPControl; cdecl; external libldap;

function ldap_control_create(requestOID: pchar; iscritical: longint; value: Pberval; dupval: longint; ctrlp: PPLDAPControl): longint; cdecl; external libldap;
function ldap_control_find(oid: pchar; ctrls: PPLDAPControl; nextctrlp: PPPLDAPControl): PLDAPControl; cdecl; external libldap;
procedure ldap_control_free(ctrl: PLDAPControl); cdecl; external libldap;
procedure ldap_controls_free(ctrls: PPLDAPControl); cdecl; external libldap;
function ldap_controls_dup(controls: PPLDAPControl): PPLDAPControl; cdecl; external libldap;
function ldap_control_dup(c: PLDAPControl): PLDAPControl; cdecl; external libldap;

function ldap_domain2dn(domain: pchar; dn: PPchar): longint; cdecl; external libldap;
function ldap_dn2domain(dn: pchar; domain: PPchar): longint; cdecl; external libldap;
function ldap_domain2hostlist(domain: pchar; hostlist: PPchar): longint; cdecl; external libldap;

function ldap_extended_operation(ld: PLDAP; reqoid: pchar; reqdata: Pberval; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl;
  msgidp: Plongint): longint; cdecl; external libldap;
function ldap_extended_operation_s(ld: PLDAP; reqoid: pchar; reqdata: Pberval; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl;
  retoidp: PPchar; retdatap: PPberval): longint; cdecl; external libldap;
function ldap_parse_extended_result(ld: PLDAP; res: PLDAPMessage; retoidp: PPchar; retdatap: PPberval; freeit: longint): longint; cdecl; external libldap;
function ldap_parse_intermediate(ld: PLDAP; res: PLDAPMessage; retoidp: PPchar; retdatap: PPberval; serverctrls: PPPLDAPControl;
  freeit: longint): longint; cdecl; external libldap;

function ldap_abandon_ext(ld: PLDAP; msgid: longint; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl): longint; cdecl; external libldap;
function ldap_abandon(ld: PLDAP; msgid: longint): longint; cdecl; external libldap;

function ldap_add_ext(ld: PLDAP; dn: pchar; attrs: PPLDAPMod; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl;
  msgidp: Plongint): longint; cdecl; external libldap;
function ldap_add_ext_s(ld: PLDAP; dn: pchar; attrs: PPLDAPMod; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl): longint; cdecl; external libldap;
function ldap_add(ld: PLDAP; dn: pchar; attrs: PPLDAPMod): longint; cdecl; external libldap;
function ldap_add_s(ld: PLDAP; dn: pchar; attrs: PPLDAPMod): longint; cdecl; external libldap;

function ldap_sasl_bind(ld: PLDAP; dn: pchar; mechanism: pchar; cred: Pberval; serverctrls: PPLDAPControl;
  clientctrls: PPLDAPControl; msgidp: Plongint): longint; cdecl; external libldap;

const
  LDAP_SASL_AUTOMATIC = 0;
  LDAP_SASL_INTERACTIVE = 1;
  LDAP_SASL_QUIET = 2;

type
  TLDAP_SASL_INTERACT_PROC = function(ld: PLDAP; flags: integer; defaults: Pointer; interact: Pointer): integer; cdecl;

function ldap_sasl_interactive_bind(ld: PLDAP; dn: pchar; saslMechanism: pchar; serverControls: PPLDAPControl; clientControls: PPLDAPControl;
  flags: dword; proc: TLDAP_SASL_INTERACT_PROC; defaults: pointer; result: PLDAPMessage; rmech: PPchar;
  msgid: Plongint): longint; cdecl; external libldap;
function ldap_sasl_interactive_bind_s(ld: PLDAP; dn: pchar; saslMechanism: pchar; serverControls: PPLDAPControl; clientControls: PPLDAPControl;
  flags: dword; proc: TLDAP_SASL_INTERACT_PROC; defaults: pointer): longint; cdecl; external libldap;
function ldap_sasl_bind_s(ld: PLDAP; dn: pchar; mechanism: pchar; cred: Pberval; serverctrls: PPLDAPControl;
  clientctrls: PPLDAPControl; servercredp: PPberval): longint; cdecl; external libldap;
function ldap_parse_sasl_bind_result(ld: PLDAP; res: PLDAPMessage; servercredp: PPberval; freeit: longint): longint; cdecl; external libldap;

function ldap_bind(ld: PLDAP; who: pchar; passwd: pchar; authmethod: longint): longint; cdecl; external libldap;
function ldap_bind_s(ld: PLDAP; who: pchar; cred: pchar; authmethod: longint): longint; cdecl; external libldap;
function ldap_simple_bind(ld: PLDAP; who: pchar; passwd: pchar): longint; cdecl; external libldap;
function ldap_simple_bind_s(ld: PLDAP; who: pchar; passwd: pchar): longint; cdecl; external libldap;
function ldap_compare_ext(ld: PLDAP; dn: pchar; attr: pchar; bvalue: Pberval; serverctrls: PPLDAPControl;
  clientctrls: PPLDAPControl; msgidp: Plongint): longint; cdecl; external libldap;
function ldap_compare_ext_s(ld: PLDAP; dn: pchar; attr: pchar; bvalue: Pberval; serverctrls: PPLDAPControl;
  clientctrls: PPLDAPControl): longint; cdecl; external libldap;
function ldap_compare(ld: PLDAP; dn: pchar; attr: pchar; value: pchar): longint; cdecl; external libldap;
function ldap_compare_s(ld: PLDAP; dn: pchar; attr: pchar; value: pchar): longint; cdecl; external libldap;

function ldap_delete_ext(ld: PLDAP; dn: pchar; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl; msgidp: Plongint): longint; cdecl; external libldap;
function ldap_delete_ext_s(ld: PLDAP; dn: pchar; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl): longint; cdecl; external libldap;

function ldap_delete(ld: PLDAP; dn: pchar): longint; cdecl; external libldap;
function ldap_delete_s(ld: PLDAP; dn: pchar): longint; cdecl; external libldap;

function ldap_parse_result(ld: PLDAP; res: PLDAPMessage; errcodep: Plongint; matcheddnp: PPchar; diagmsgp: PPchar;
  referralsp: PPPchar; serverctrls: PPPLDAPControl; freeit: longint): longint; cdecl; external libldap;
function ldap_err2string(err: longint): pchar; cdecl; external libldap;

function ldap_result2error(ld: PLDAP; r: PLDAPMessage; freeit: longint): longint; cdecl; external libldap;
procedure ldap_perror(ld: PLDAP; s: pchar); cdecl; external libldap;

function ldap_modify_ext(ld: PLDAP; dn: pchar; mods: PPLDAPMod; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl;
  msgidp: Plongint): longint; cdecl; external libldap;
function ldap_modify_ext_s(ld: PLDAP; dn: pchar; mods: PPLDAPMod; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl): longint; cdecl; external libldap;

function ldap_modify(ld: PLDAP; dn: pchar; mods: PPLDAPMod): longint; cdecl; external libldap;
function ldap_modify_s(ld: PLDAP; dn: pchar; mods: PPLDAPMod): longint; cdecl; external libldap;

function ldap_rename(ld: PLDAP; dn: pchar; newrdn: pchar; newSuperior: pchar; deleteoldrdn: longint;
  sctrls: PPLDAPControl; cctrls: PPLDAPControl; msgidp: Plongint): longint; cdecl; external libldap;
function ldap_rename_s(ld: PLDAP; dn: pchar; newrdn: pchar; newSuperior: pchar; deleteoldrdn: longint;
  sctrls: PPLDAPControl; cctrls: PPLDAPControl): longint; cdecl; external libldap;

function ldap_rename2(ld: PLDAP; dn: pchar; newrdn: pchar; newSuperior: pchar; deleteoldrdn: longint): longint; cdecl; external libldap;
function ldap_rename2_s(ld: PLDAP; dn: pchar; newrdn: pchar; newSuperior: pchar; deleteoldrdn: longint): longint; cdecl; external libldap;
function ldap_modrdn(ld: PLDAP; dn: pchar; newrdn: pchar): longint; cdecl; external libldap;
function ldap_modrdn_s(ld: PLDAP; dn: pchar; newrdn: pchar): longint; cdecl; external libldap;
function ldap_modrdn2(ld: PLDAP; dn: pchar; newrdn: pchar; deleteoldrdn: longint): longint; cdecl; external libldap;
function ldap_modrdn2_s(ld: PLDAP; dn: pchar; newrdn: pchar; deleteoldrdn: longint): longint; cdecl; external libldap;

function ldap_init(host: pchar; port: longint): PLDAP; cdecl; external libldap;
function ldap_open(host: pchar; port: longint): PLDAP; cdecl; external libldap;

function ldap_create(ldp: PPLDAP): longint; cdecl; external libldap;
function ldap_initialize(ldp: PPLDAP; url: pchar): longint; cdecl; external libldap;
function ldap_dup(old: PLDAP): PLDAP; cdecl; external libldap;
function ldap_connect(ld: PLDAP): longint; cdecl; external libldap;

function ldap_tls_inplace(ld: PLDAP): longint; cdecl; external libldap;
function ldap_start_tls(ld: PLDAP; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl; msgidp: Plongint): longint; cdecl; external libldap;
function ldap_install_tls(ld: PLDAP): longint; cdecl; external libldap;
function ldap_start_tls_s(ld: PLDAP; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl): longint; cdecl; external libldap;

function ldap_first_message(ld: PLDAP; chain: PLDAPMessage): PLDAPMessage; cdecl; external libldap;
function ldap_next_message(ld: PLDAP; msg: PLDAPMessage): PLDAPMessage; cdecl; external libldap;
function ldap_count_messages(ld: PLDAP; chain: PLDAPMessage): longint; cdecl; external libldap;

function ldap_first_reference(ld: PLDAP; chain: PLDAPMessage): PLDAPMessage; cdecl; external libldap;
function ldap_next_reference(ld: PLDAP; ref: PLDAPMessage): PLDAPMessage; cdecl; external libldap;
function ldap_count_references(ld: PLDAP; chain: PLDAPMessage): longint; cdecl; external libldap;
function ldap_parse_reference(ld: PLDAP; ref: PLDAPMessage; referralsp: PPPchar; serverctrls: PPPLDAPControl; freeit: longint): longint; cdecl; external libldap;

function ldap_first_entry(ld: PLDAP; chain: PLDAPMessage): PLDAPMessage; cdecl; external libldap;
function ldap_next_entry(ld: PLDAP; entry: PLDAPMessage): PLDAPMessage; cdecl; external libldap;
function ldap_count_entries(ld: PLDAP; chain: PLDAPMessage): longint; cdecl; external libldap;
function ldap_get_entry_controls(ld: PLDAP; entry: PLDAPMessage; serverctrls: PPPLDAPControl): longint; cdecl; external libldap;

function ldap_delete_result_entry(list: PPLDAPMessage; e: PLDAPMessage): PLDAPMessage; cdecl; external libldap;
procedure ldap_add_result_entry(list: PPLDAPMessage; e: PLDAPMessage); cdecl; external libldap;

function ldap_get_dn(ld: PLDAP; entry: PLDAPMessage): pchar; cdecl; external libldap;

type
  Tldap_ava = record
    la_attr: Tberval;
    la_value: Tberval;
    la_flags: dword;
    la_private: pointer;
  end;
  Pldap_ava = ^Tldap_ava;
  TLDAPAVA = Tldap_ava;
  PLDAPAVA = ^TLDAPAVA;

const
  LDAP_AVA_NULL = $0000;
  LDAP_AVA_STRING = $0001;
  LDAP_AVA_BINARY = $0002;
  LDAP_AVA_NONPRINTABLE = $0004;
  LDAP_AVA_FREE_ATTR = $0010;
  LDAP_AVA_FREE_VALUE = $0020;

type
  PLDAPRDN = ^TLDAPRDN;
  TLDAPRDN = ^PLDAPAVA;

  PLDAPDN = ^TLDAPDN;
  TLDAPDN = PLDAPRDN;

const
  LDAP_DN_FORMAT_LDAP = $0000;
  LDAP_DN_FORMAT_LDAPV3 = $0010;
  LDAP_DN_FORMAT_LDAPV2 = $0020;
  LDAP_DN_FORMAT_DCE = $0030;
  LDAP_DN_FORMAT_UFN = $0040;
  LDAP_DN_FORMAT_AD_CANONICAL = $0050;
  LDAP_DN_FORMAT_LBER = $00F0;
  LDAP_DN_FORMAT_MASK = $00F0;
  LDAP_DN_PRETTY = $0100;
  LDAP_DN_SKIP = $0200;
  LDAP_DN_P_NOLEADTRAILSPACES = $1000;
  LDAP_DN_P_NOSPACEAFTERRDN = $2000;
  LDAP_DN_PEDANTIC = $F000;

procedure ldap_rdnfree(rdn: TLDAPRDN); cdecl; external libldap;
procedure ldap_dnfree(dn: TLDAPDN); cdecl; external libldap;
function ldap_bv2dn(bv: Pberval; dn: PLDAPDN; flags: dword): longint; cdecl; external libldap;
function ldap_str2dn(str: pchar; dn: PLDAPDN; flags: dword): longint; cdecl; external libldap;
function ldap_dn2bv(dn: TLDAPDN; bv: Pberval; flags: dword): longint; cdecl; external libldap;
function ldap_dn2str(dn: TLDAPDN; str: PPchar; flags: dword): longint; cdecl; external libldap;
function ldap_bv2rdn(bv: Pberval; rdn: PLDAPRDN; next: PPchar; flags: dword): longint; cdecl; external libldap;
function ldap_str2rdn(str: pchar; rdn: PLDAPRDN; next: PPchar; flags: dword): longint; cdecl; external libldap;
function ldap_rdn2bv(rdn: TLDAPRDN; bv: Pberval; flags: dword): longint; cdecl; external libldap;
function ldap_rdn2str(rdn: TLDAPRDN; str: PPchar; flags: dword): longint; cdecl; external libldap;
function ldap_dn_normalize(in_: pchar; iflags: dword; out_: PPchar; oflags: dword): longint; cdecl; external libldap;
function ldap_dn2ufn(dn: pchar): pchar; cdecl; external libldap;
function ldap_explode_dn(dn: pchar; notypes: longint): PPchar; cdecl; external libldap;
function ldap_explode_rdn(rdn: pchar; notypes: longint): PPchar; cdecl; external libldap;

type
  TLDAPDN_rewrite_func = function(dn: TLDAPDN; flags: dword; ctx: pointer): longint; cdecl;

function ldap_X509dn2bv(x509_name: pointer; dn: Pberval; func: TLDAPDN_rewrite_func; flags: dword): longint; cdecl; external libldap;
function ldap_dn2dcedn(dn: pchar): pchar; cdecl; external libldap;
function ldap_dcedn2dn(dce: pchar): pchar; cdecl; external libldap;
function ldap_dn2ad_canonical(dn: pchar): pchar; cdecl; external libldap;
function ldap_get_dn_ber(ld: PLDAP; e: PLDAPMessage; berout: PPBerElement; dn: Pberval): longint; cdecl; external libldap;
function ldap_get_attribute_ber(ld: PLDAP; e: PLDAPMessage; ber: PBerElement; attr: Pberval; vals: PPberval): longint; cdecl; external libldap;

function ldap_first_attribute(ld: PLDAP; entry: PLDAPMessage; ber: PPBerElement): pchar; cdecl; external libldap;
function ldap_next_attribute(ld: PLDAP; entry: PLDAPMessage; ber: PBerElement): pchar; cdecl; external libldap;

function ldap_get_values_len(ld: PLDAP; entry: PLDAPMessage; target: pchar): PPberval; cdecl; external libldap;
function ldap_count_values_len(vals: PPberval): longint; cdecl; external libldap;
procedure ldap_value_free_len(vals: PPberval); cdecl; external libldap;
function ldap_get_values(ld: PLDAP; entry: PLDAPMessage; target: pchar): PPchar; cdecl; external libldap;
function ldap_count_values(vals: PPchar): longint; cdecl; external libldap;
procedure ldap_value_free(vals: PPchar); cdecl; external libldap;

function ldap_result(ld: PLDAP; msgid: longint; all: longint; timeout: Ptimeval; result: PPLDAPMessage): longint; cdecl; external libldap;
function ldap_msgtype(lm: PLDAPMessage): longint; cdecl; external libldap;
function ldap_msgid(lm: PLDAPMessage): longint; cdecl; external libldap;
function ldap_msgfree(lm: PLDAPMessage): longint; cdecl; external libldap;
function ldap_msgdelete(ld: PLDAP; msgid: longint): longint; cdecl; external libldap;

function ldap_bv2escaped_filter_value(in_: Pberval; out_: Pberval): longint; cdecl; external libldap;
function ldap_search_ext(ld: PLDAP; base: pchar; scope: longint; filter: pchar; attrs: PPchar;
  attrsonly: longint; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl; timeout: Ptimeval; sizelimit: longint;
  msgidp: Plongint): longint; cdecl; external libldap;
function ldap_search_ext_s(ld: PLDAP; base: pchar; scope: longint; filter: pchar; attrs: PPchar;
  attrsonly: longint; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl; timeout: Ptimeval; sizelimit: longint;
  res: PPLDAPMessage): longint; cdecl; external libldap;
function ldap_search(ld: PLDAP; base: pchar; scope: longint; filter: pchar; attrs: PPchar;
  attrsonly: longint): longint; cdecl; external libldap;
function ldap_search_s(ld: PLDAP; base: pchar; scope: longint; filter: pchar; attrs: PPchar;
  attrsonly: longint; res: PPLDAPMessage): longint; cdecl; external libldap;
function ldap_search_st(ld: PLDAP; base: pchar; scope: longint; filter: pchar; attrs: PPchar;
  attrsonly: longint; timeout: Ptimeval; res: PPLDAPMessage): longint; cdecl; external libldap;

function ldap_unbind_ext(ld: PLDAP; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl): longint; cdecl; external libldap;
function ldap_unbind_ext_s(ld: PLDAP; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl): longint; cdecl; external libldap;
function ldap_destroy(ld: PLDAP): longint; cdecl; external libldap;
function ldap_unbind(ld: PLDAP): longint; cdecl; external libldap;
function ldap_unbind_s(ld: PLDAP): longint; cdecl; external libldap;

function ldap_put_vrFilter(ber: PBerElement; vrf: pchar): longint; cdecl; external libldap;

function ldap_memalloc(s: Tber_len_t): pointer; cdecl; external libldap;
function ldap_memrealloc(p: pointer; s: Tber_len_t): pointer; cdecl; external libldap;
function ldap_memcalloc(n: Tber_len_t; s: Tber_len_t): pointer; cdecl; external libldap;
procedure ldap_memfree(p: pointer); cdecl; external libldap;
procedure ldap_memvfree(v: Ppointer); cdecl; external libldap;
function ldap_strdup(para1: pchar): pchar; cdecl; external libldap;
procedure ldap_mods_free(mods: PPLDAPMod; freemods: longint); cdecl; external libldap;

type
  TLDAP_SORT_AD_CMP_PROC = function(left: pchar; right: pchar): integer; cdecl;
  TLDAP_SORT_AV_CMP_PROC = function(left: Pointer; right: Pointer): integer; cdecl;

function ldap_sort_entries(ld: PLDAP; chain: PPLDAPMessage; attr: pchar; cmp: TLDAP_SORT_AD_CMP_PROC): longint; cdecl; external libldap;
function ldap_sort_values(ld: PLDAP; vals: PPchar; cmp: TLDAP_SORT_AV_CMP_PROC): longint; cdecl; external libldap;
function ldap_sort_strcasecmp(a: pointer; b: pointer): longint; cdecl; external libldap;

function ldap_is_ldap_url(url: pchar): longint; cdecl; external libldap;
function ldap_is_ldaps_url(url: pchar): longint; cdecl; external libldap;
function ldap_is_ldapi_url(url: pchar): longint; cdecl; external libldap;
function ldap_is_ldapc_url(url: pchar): longint; cdecl; external libldap;

function ldap_url_parse(url: pchar; ludpp: PPLDAPURLDesc): longint; cdecl; external libldap;
function ldap_url_desc2str(ludp: PLDAPURLDesc): pchar; cdecl; external libldap;
procedure ldap_free_urldesc(ludp: PLDAPURLDesc); cdecl; external libldap;

const
  LDAP_API_FEATURE_CANCEL = 1000;

function ldap_cancel(ld: PLDAP; cancelid: longint; sctrls: PPLDAPControl; cctrls: PPLDAPControl; msgidp: Plongint): longint; cdecl; external libldap;
function ldap_cancel_s(ld: PLDAP; cancelid: longint; sctrl: PPLDAPControl; cctrl: PPLDAPControl): longint; cdecl; external libldap;

const
  LDAP_API_FEATURE_TURN = 1000;

function ldap_turn(ld: PLDAP; mutual: longint; identifier: pchar; sctrls: PPLDAPControl; cctrls: PPLDAPControl;
  msgidp: Plongint): longint; cdecl; external libldap;
function ldap_turn_s(ld: PLDAP; mutual: longint; identifier: pchar; sctrl: PPLDAPControl; cctrl: PPLDAPControl): longint; cdecl; external libldap;

const
  LDAP_API_FEATURE_PAGED_RESULTS = 2000;

function ldap_create_page_control_value(ld: PLDAP; pagesize: Tber_int_t; cookie: Pberval; value: Pberval): longint; cdecl; external libldap;
function ldap_create_page_control(ld: PLDAP; pagesize: Tber_int_t; cookie: Pberval; iscritical: longint; ctrlp: PPLDAPControl): longint; cdecl; external libldap;
function ldap_parse_page_control(ld: PLDAP; ctrls: PPLDAPControl; count: Pber_int_t; cookie: PPberval): longint; cdecl; external libldap;
function ldap_parse_pageresponse_control(ld: PLDAP; ctrl: PLDAPControl; count: Pber_int_t; cookie: Pberval): longint; cdecl; external libldap;

const
  LDAP_API_FEATURE_SERVER_SIDE_SORT = 2000;

type
  Tldapsortkey = record
    attributeType: pchar;
    orderingRule: pchar;
    reverseOrder: longint;
  end;
  Pldapsortkey = ^Tldapsortkey;
  PPldapsortkey = ^Pldapsortkey;
  PPPldapsortkey = ^PPldapsortkey;

function ldap_create_sort_keylist(sortKeyList: PPPLDAPSortKey; keyString: pchar): longint; cdecl; external libldap;
procedure ldap_free_sort_keylist(sortkeylist: PPLDAPSortKey); cdecl; external libldap;
function ldap_create_sort_control_value(ld: PLDAP; keyList: PPLDAPSortKey; value: Pberval): longint; cdecl; external libldap;
function ldap_create_sort_control(ld: PLDAP; keyList: PPLDAPSortKey; iscritical: longint; ctrlp: PPLDAPControl): longint; cdecl; external libldap;
function ldap_parse_sortresponse_control(ld: PLDAP; ctrl: PLDAPControl; result: Pber_int_t; attribute: PPchar): longint; cdecl; external libldap;

const
  LDAP_API_FEATURE_VIRTUAL_LIST_VIEW = 2000;

type
  Tldapvlvinfo = record
    ldvlv_version: Tber_int_t;
    ldvlv_before_count: Tber_int_t;
    ldvlv_after_count: Tber_int_t;
    ldvlv_offset: Tber_int_t;
    ldvlv_count: Tber_int_t;
    ldvlv_attrvalue: Pberval;
    ldvlv_context: Pberval;
    ldvlv_extradata: pointer;
  end;
  Pldapvlvinfo = ^Tldapvlvinfo;

function ldap_create_vlv_control_value(ld: PLDAP; ldvlistp: PLDAPVLVInfo; value: Pberval): longint; cdecl; external libldap;
function ldap_create_vlv_control(ld: PLDAP; ldvlistp: PLDAPVLVInfo; ctrlp: PPLDAPControl): longint; cdecl; external libldap;
function ldap_parse_vlvresponse_control(ld: PLDAP; ctrls: PLDAPControl; target_posp: Pber_int_t; list_countp: Pber_int_t; contextp: PPberval;
  errcodep: Plongint): longint; cdecl; external libldap;

const
  LDAP_API_FEATURE_VERIFY_CREDENTIALS = 1000;

function ldap_verify_credentials(ld: PLDAP; cookie: Pberval; dn: pchar; mechanism: pchar; cred: Pberval;
  ctrls: PPLDAPControl; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl; msgidp: Plongint): longint; cdecl; external libldap;
function ldap_verify_credentials_s(ld: PLDAP; cookie: Pberval; dn: pchar; mechanism: pchar; cred: Pberval;
  vcictrls: PPLDAPControl; serverctrls: PPLDAPControl; clientctrls: PPLDAPControl; code: Plongint; diagmsgp: PPchar;
  scookie: PPberval; servercredp: PPberval; vcoctrls: PPPLDAPControl): longint; cdecl; external libldap;
function ldap_parse_verify_credentials(ld: PLDAP; res: PLDAPMessage; code: Plongint; diagmsgp: PPchar; cookie: PPberval;
  servercredp: PPberval; vcctrls: PPPLDAPControl): longint; cdecl; external libldap;
function ldap_verify_credentials_interactive(ld: PLDAP; dn: pchar; saslMechanism: pchar; vcControls: PPLDAPControl; serverControls: PPLDAPControl;
  clientControls: PPLDAPControl; flags: dword; proc: TLDAP_SASL_INTERACT_PROC; defaults: pointer; context: pointer;
  result: PLDAPMessage; rmech: PPchar; msgid: Plongint): longint; cdecl; external libldap;

const
  LDAP_API_FEATURE_WHOAMI = 1000;

function ldap_parse_whoami(ld: PLDAP; res: PLDAPMessage; authzid: PPberval): longint; cdecl; external libldap;
function ldap_whoami(ld: PLDAP; sctrls: PPLDAPControl; cctrls: PPLDAPControl; msgidp: Plongint): longint; cdecl; external libldap;
function ldap_whoami_s(ld: PLDAP; authzid: PPberval; sctrls: PPLDAPControl; cctrls: PPLDAPControl): longint; cdecl; external libldap;

const
  LDAP_API_FEATURE_PASSWD_MODIFY = 1000;

function ldap_parse_passwd(ld: PLDAP; res: PLDAPMessage; newpasswd: Pberval): longint; cdecl; external libldap;
function ldap_passwd(ld: PLDAP; user: Pberval; oldpw: Pberval; newpw: Pberval; sctrls: PPLDAPControl;
  cctrls: PPLDAPControl; msgidp: Plongint): longint; cdecl; external libldap;
function ldap_passwd_s(ld: PLDAP; user: Pberval; oldpw: Pberval; newpw: Pberval; newpasswd: Pberval;
  sctrls: PPLDAPControl; cctrls: PPLDAPControl): longint; cdecl; external libldap;

const
  LDAP_API_FEATURE_PASSWORD_POLICY = 1000;

type
  Ppasspolicyerror_enum = ^Tpasspolicyerror_enum;
  Tpasspolicyerror_enum = longint;

const
  PP_passwordExpired = 0;
  PP_accountLocked = 1;
  PP_changeAfterReset = 2;
  PP_passwordModNotAllowed = 3;
  PP_mustSupplyOldPassword = 4;
  PP_insufficientPasswordQuality = 5;
  PP_passwordTooShort = 6;
  PP_passwordTooYoung = 7;
  PP_passwordInHistory = 8;
  PP_passwordTooLong = 9;
  PP_noError = 65535;

type
  TLDAPPasswordPolicyError = Tpasspolicyerror_enum;
  PLDAPPasswordPolicyError = ^TLDAPPasswordPolicyError;

function ldap_create_passwordpolicy_control(ld: PLDAP; ctrlp: PPLDAPControl): longint; cdecl; external libldap;
function ldap_parse_passwordpolicy_control(ld: PLDAP; ctrl: PLDAPControl; expirep: Pber_int_t; gracep: Pber_int_t; errorp: PLDAPPasswordPolicyError): longint; cdecl; external libldap;
function ldap_passwordpolicy_err2txt(para1: TLDAPPasswordPolicyError): pchar; cdecl; external libldap;

function ldap_parse_password_expiring_control(ld: PLDAP; ctrl: PLDAPControl; secondsp: Pclong): longint; cdecl; external libldap;

const
  LDAP_API_FEATURE_REFRESH = 1000;

function ldap_parse_refresh(ld: PLDAP; res: PLDAPMessage; newttl: Pber_int_t): longint; cdecl; external libldap;
function ldap_refresh(ld: PLDAP; dn: Pberval; ttl: Tber_int_t; sctrls: PPLDAPControl; cctrls: PPLDAPControl;
  msgidp: Plongint): longint; cdecl; external libldap;
function ldap_refresh_s(ld: PLDAP; dn: Pberval; ttl: Tber_int_t; newttl: Pber_int_t; sctrls: PPLDAPControl;
  cctrls: PPLDAPControl): longint; cdecl; external libldap;
function ldap_txn_start(ld: PLDAP; sctrls: PPLDAPControl; cctrls: PPLDAPControl; msgidp: Plongint): longint; cdecl; external libldap;
function ldap_txn_start_s(ld: PLDAP; sctrl: PPLDAPControl; cctrl: PPLDAPControl; rettxnid: PPberval): longint; cdecl; external libldap;
function ldap_txn_end(ld: PLDAP; commit: longint; txnid: Pberval; sctrls: PPLDAPControl; cctrls: PPLDAPControl;
  msgidp: Plongint): longint; cdecl; external libldap;
function ldap_txn_end_s(ld: PLDAP; commit: longint; txnid: Pberval; sctrl: PPLDAPControl; cctrl: PPLDAPControl;
  retidp: Plongint): longint; cdecl; external libldap;
function ldap_sync_initialize(ls: Pldap_sync_t): Pldap_sync_t; cdecl; external libldap;
procedure ldap_sync_destroy(ls: Pldap_sync_t; freeit: longint); cdecl; external libldap;
function ldap_sync_init(ls: Pldap_sync_t; mode: longint): longint; cdecl; external libldap;
function ldap_sync_init_refresh_only(ls: Pldap_sync_t): longint; cdecl; external libldap;
function ldap_sync_init_refresh_and_persist(ls: Pldap_sync_t): longint; cdecl; external libldap;

function ldap_create_session_tracking_value(ld: PLDAP; sessionSourceIp: pchar; sessionSourceName: pchar; formatOID: pchar; sessionTrackingIdentifier: Pberval;
  value: Pberval): longint; cdecl; external libldap;
function ldap_create_session_tracking_control(ld: PLDAP; sessionSourceIp: pchar; sessionSourceName: pchar; formatOID: pchar; sessionTrackingIdentifier: Pberval;
  ctrlp: PPLDAPControl): longint; cdecl; external libldap;
function ldap_parse_session_tracking_control(ld: PLDAP; ctrl: PLDAPControl; ip: Pberval; name: Pberval; oid: Pberval;
  id: Pberval): longint; cdecl; external libldap;

function ldap_create_dirsync_value(ld: PLDAP; flags: longint; maxAttrCount: longint; cookie: Pberval; value: Pberval): longint; cdecl; external libldap;
function ldap_create_dirsync_control(ld: PLDAP; flags: longint; maxAttrCount: longint; cookie: Pberval; ctrlp: PPLDAPControl): longint; cdecl; external libldap;
function ldap_parse_dirsync_control(ld: PLDAP; ctrl: PLDAPControl; continueFlag: Plongint; cookie: Pberval): longint; cdecl; external libldap;
function ldap_create_extended_dn_value(ld: PLDAP; flag: longint; value: Pberval): longint; cdecl; external libldap;
function ldap_create_extended_dn_control(ld: PLDAP; flag: longint; ctrlp: PPLDAPControl): longint; cdecl; external libldap;
function ldap_create_show_deleted_control(ld: PLDAP; ctrlp: PPLDAPControl): longint; cdecl; external libldap;
function ldap_create_server_notification_control(ld: PLDAP; ctrlp: PPLDAPControl): longint; cdecl; external libldap;
function ldap_create_assertion_control_value(ld: PLDAP; assertion: pchar; value: Pberval): longint; cdecl; external libldap;
function ldap_create_assertion_control(ld: PLDAP; filter: pchar; iscritical: longint; ctrlp: PPLDAPControl): longint; cdecl; external libldap;

type
  TLDAPDerefSpec = record
    derefAttr: pchar;
    attributes: ^pchar;
  end;
  PLDAPDerefSpec = ^TLDAPDerefSpec;

  PLDAPDerefVal = ^TLDAPDerefVal;

  TLDAPDerefVal = record
    _type: pchar;
    vals: TBerVarray;
    next: PLDAPDerefVal;
  end;

  PPLDAPDerefRes = ^PLDAPDerefRes;
  PLDAPDerefRes = ^TLDAPDerefRes;

  TLDAPDerefRes = record
    derefAttr: pchar;
    derefVal: Tberval;
    attrVals: PLDAPDerefVal;
    next: PLDAPDerefRes;
  end;

function ldap_create_deref_control_value(ld: PLDAP; ds: PLDAPDerefSpec; value: Pberval): longint; cdecl; external libldap;
function ldap_create_deref_control(ld: PLDAP; ds: PLDAPDerefSpec; iscritical: longint; ctrlp: PPLDAPControl): longint; cdecl; external libldap;
procedure ldap_derefresponse_free(dr: PLDAPDerefRes); cdecl; external libldap;
function ldap_parse_derefresponse_control(ld: PLDAP; ctrl: PLDAPControl; drp: PPLDAPDerefRes): longint; cdecl; external libldap;
function ldap_parse_deref_control(ld: PLDAP; ctrls: PPLDAPControl; drp: PPLDAPDerefRes): longint; cdecl; external libldap;

function ldap_create_persistentsearch_control_value(ld: PLDAP; changetypes: longint; changesonly: longint; return_echg_ctls: longint; value: Pberval): longint; cdecl; external libldap;
function ldap_create_persistentsearch_control(ld: PLDAP; changetypes: longint; changesonly: longint; return_echg_ctls: longint; isCritical: longint;
  ctrlp: PPLDAPControl): longint; cdecl; external libldap;
function ldap_parse_entrychange_control(ld: PLDAP; ctrl: PLDAPControl; chgtypep: Plongint; prevdnp: Pberval; chgnumpresentp: Plongint;
  chgnump: Pculong): longint; cdecl; external libldap;
function ldap_create_accountusability_control(ld: PLDAP; ctrlp: PPLDAPControl): longint; cdecl; external libldap;

type
  TLDAPAccountUsabilityMoreInfo = record
    inactive: Tber_int_t;
    reset: Tber_int_t;
    expired: Tber_int_t;
    remaining_grace: Tber_int_t;
    seconds_before_unlock: Tber_int_t;
  end;
  PLDAPAccountUsabilityMoreInfo = ^TLDAPAccountUsabilityMoreInfo;

  TLDAPAccountUsability = record
    case longint of
      0: (seconds_remaining: Tber_int_t);
      1: (more_info: TLDAPAccountUsabilityMoreInfo);
  end;
  PLDAPAccountUsability = ^TLDAPAccountUsability;

function ldap_parse_accountusability_control(ld: PLDAP; ctrl: PLDAPControl; availablep: Plongint; usabilityp: PLDAPAccountUsability): longint; cdecl; external libldap;

const
  LDIF_DEFAULT_ADD = $01;
  LDIF_ENTRIES_ONLY = $02;
  LDIF_NO_CONTROLS = $04;
  LDIF_MODS_ONLY = $08;
  LDIF_NO_DN = $10;

type
  Tldifrecord = record
    lr_op: Tber_tag_t;
    lr_dn: Tberval;
    lr_ctrls: ^PLDAPControl;
    ldif_ops: record
      case longint of
        0: (lr_mods: ^PLDAPMod);
        1: (ldif_op_rename: record
            lr_newrdn: Tberval;
            lr_newsuperior: Tberval;
            lr_deleteoldrdn: longint;
            end);
        2: (ldif_op_ext: record
            lr_extop_oid: Tberval;
            lr_extop_data: Tberval;
            end);
        3: (ldif_op_cmp: record
            lr_cmp_attr: Tberval;
            lr_cmp_bvalue: Tberval;
            end);
      end;
    lr_ctx: pointer;
    lr_lines: longint;
    lr_lm: PLDAPMod;
    lr_mops: pbyte;
    lr_freeval: pchar;
    lr_vals: Pberval;
    lr_btype: Pberval;
  end;
  Pldifrecord = ^Tldifrecord;

procedure ldap_ldif_record_done(lr: PLDIFRecord); cdecl; external libldap;
function ldap_parse_ldif_record(rbuf: Pberval; linenum: dword; lr: PLDIFRecord; errstr: pchar; flags: dword): longint; cdecl; external libldap;


// /usr/include/ldap_utf8.h

const
  LDAP_UCS4_INVALID = $80000000;

type
  Pldap_ucs4_t = ^Tldap_ucs4_t;
  Tldap_ucs4_t = Tber_int_t;

function LDAP_MAX_UTF8_LEN: SizeUInt;

function ldap_x_utf8_to_ucs4(p: pchar): Tldap_ucs4_t; cdecl; external libldap;
function ldap_x_ucs4_to_utf8(c: Tldap_ucs4_t; buf: pchar): longint; cdecl; external libldap;
function ldap_x_utf8_to_wc(wchar: Pwchar_t; utf8char: pchar): longint; cdecl; external libldap;
function ldap_x_utf8s_to_wcs(wcstr: Pwchar_t; utf8str: pchar; count: Tsize_t): longint; cdecl; external libldap;
function ldap_x_wc_to_utf8(utf8char: pchar; wchar: Twchar_t; count: Tsize_t): longint; cdecl; external libldap;
function ldap_x_wcs_to_utf8s(utf8str: pchar; wcstr: Pwchar_t; count: Tsize_t): longint; cdecl; external libldap;

type
  Tutf8_to_mb_func = function(mbchar: pchar; wchar: Twchar_t): longint; cdecl;
  Tutf8s_to_mbs_func = function(mbstr: pchar; wcstr: Pwchar_t; count: Tsize_t): Tsize_t; cdecl;
  Tmb_to_utf8_func = function(wchar: Pwchar_t; mbchar: pchar; count: Tsize_t): longint; cdecl;
  Tmbs_to_utf8s_func = function(wcstr: Pwchar_t; mbstr: pchar; count: Tsize_t): Tsize_t; cdecl;

function ldap_x_utf8_to_mb(mbchar: pchar; utf8char: pchar; ldap_f_wctomb: Tutf8_to_mb_func): longint; cdecl; external libldap;
function ldap_x_utf8s_to_mbs(mbstr: pchar; utf8str: pchar; count: Tsize_t; ldap_f_wcstombs: Tutf8s_to_mbs_func): longint; cdecl; external libldap;
function ldap_x_mb_to_utf8(utf8char: pchar; mbchar: pchar; mbsize: Tsize_t; ldap_f_mbtowc: Tmb_to_utf8_func): longint; cdecl; external libldap;
function ldap_x_mbs_to_utf8s(utf8str: pchar; mbstr: pchar; count: Tsize_t; ldap_f_mbstowcs: Tmbs_to_utf8s_func): longint; cdecl; external libldap;


// ==== /usr/include/ldap_schema.h

const
  LDAP_SCHERR_OUTOFMEM = 1;
  LDAP_SCHERR_UNEXPTOKEN = 2;
  LDAP_SCHERR_NOLEFTPAREN = 3;
  LDAP_SCHERR_NORIGHTPAREN = 4;
  LDAP_SCHERR_NODIGIT = 5;
  LDAP_SCHERR_BADNAME = 6;
  LDAP_SCHERR_BADDESC = 7;
  LDAP_SCHERR_BADSUP = 8;
  LDAP_SCHERR_DUPOPT = 9;
  LDAP_SCHERR_EMPTY = 10;
  LDAP_SCHERR_MISSING = 11;
  LDAP_SCHERR_OUT_OF_ORDER = 12;

type
  Tldap_schema_extension_item = record
    lsei_name: pchar;
    lsei_values: ^pchar;
  end;
  Pldap_schema_extension_item = ^Tldap_schema_extension_item;
  TLDAPSchemaExtensionItem = Tldap_schema_extension_item;
  PLDAPSchemaExtensionItem = ^TLDAPSchemaExtensionItem;

  Tldap_syntax = record
    syn_oid: pchar;
    syn_names: ^pchar;
    syn_desc: pchar;
    syn_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_syntax = ^Tldap_syntax;
  TLDAPSyntax = Tldap_syntax;
  PLDAPSyntax = ^TLDAPSyntax;

  Tldap_matchingrule = record
    mr_oid: pchar;
    mr_names: ^pchar;
    mr_desc: pchar;
    mr_obsolete: longint;
    mr_syntax_oid: pchar;
    mr_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_matchingrule = ^Tldap_matchingrule;
  TLDAPMatchingRule = Tldap_matchingrule;
  PLDAPMatchingRule = ^TLDAPMatchingRule;

  Tldap_matchingruleuse = record
    mru_oid: pchar;
    mru_names: ^pchar;
    mru_desc: pchar;
    mru_obsolete: longint;
    mru_applies_oids: ^pchar;
    mru_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_matchingruleuse = ^Tldap_matchingruleuse;
  TLDAPMatchingRuleUse = Tldap_matchingruleuse;
  PLDAPMatchingRuleUse = ^TLDAPMatchingRuleUse;

  Tldap_attributetype = record
    at_oid: pchar;
    at_names: ^pchar;
    at_desc: pchar;
    at_obsolete: longint;
    at_sup_oid: pchar;
    at_equality_oid: pchar;
    at_ordering_oid: pchar;
    at_substr_oid: pchar;
    at_syntax_oid: pchar;
    at_syntax_len: longint;
    at_single_value: longint;
    at_collective: longint;
    at_no_user_mod: longint;
    at_usage: longint;
    at_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_attributetype = ^Tldap_attributetype;
  TLDAPAttributeType = Tldap_attributetype;
  PLDAPAttributeType = ^TLDAPAttributeType;

  Tldap_objectclass = record
    oc_oid: pchar;
    oc_names: ^pchar;
    oc_desc: pchar;
    oc_obsolete: longint;
    oc_sup_oids: ^pchar;
    oc_kind: longint;
    oc_at_oids_must: ^pchar;
    oc_at_oids_may: ^pchar;
    oc_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_objectclass = ^Tldap_objectclass;
  TLDAPObjectClass = Tldap_objectclass;
  PLDAPObjectClass = ^TLDAPObjectClass;

  Tldap_contentrule = record
    cr_oid: pchar;
    cr_names: ^pchar;
    cr_desc: pchar;
    cr_sup_oids: ^pchar;
    cr_obsolete: longint;
    cr_oc_oids_aux: ^pchar;
    cr_at_oids_must: ^pchar;
    cr_at_oids_may: ^pchar;
    cr_at_oids_not: ^pchar;
    cr_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_contentrule = ^Tldap_contentrule;
  TLDAPContentRule = Tldap_contentrule;
  PLDAPContentRule = ^TLDAPContentRule;

  Tldap_nameform = record
    nf_oid: pchar;
    nf_names: ^pchar;
    nf_desc: pchar;
    nf_obsolete: longint;
    nf_objectclass: pchar;
    nf_at_oids_must: ^pchar;
    nf_at_oids_may: ^pchar;
    nf_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_nameform = ^Tldap_nameform;
  TLDAPNameForm = Tldap_nameform;
  PLDAPNameForm = ^TLDAPNameForm;

  Tldap_structurerule = record
    sr_ruleid: longint;
    sr_names: ^pchar;
    sr_desc: pchar;
    sr_obsolete: longint;
    sr_nameform: pchar;
    sr_nsup_ruleids: longint;
    sr_sup_ruleids: Plongint;
    sr_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_structurerule = ^Tldap_structurerule;
  TLDAPStructureRule = Tldap_structurerule;
  PLDAPStructureRule = ^TLDAPStructureRule;

const
  LDAP_SCHEMA_NO = 0;
  LDAP_SCHEMA_YES = 1;
  LDAP_SCHEMA_USER_APPLICATIONS = 0;
  LDAP_SCHEMA_DIRECTORY_OPERATION = 1;
  LDAP_SCHEMA_DISTRIBUTED_OPERATION = 2;
  LDAP_SCHEMA_DSA_OPERATION = 3;
  LDAP_SCHEMA_ABSTRACT = 0;
  LDAP_SCHEMA_STRUCTURAL = 1;
  LDAP_SCHEMA_AUXILIARY = 2;
  LDAP_SCHEMA_ALLOW_NONE = $00;
  LDAP_SCHEMA_ALLOW_NO_OID = $01;
  LDAP_SCHEMA_ALLOW_QUOTED = $02;
  LDAP_SCHEMA_ALLOW_DESCR = $04;
  LDAP_SCHEMA_ALLOW_DESCR_PREFIX = $08;
  LDAP_SCHEMA_ALLOW_OID_MACRO = $10;
  LDAP_SCHEMA_ALLOW_OUT_OF_ORDER_FIELDS = $20;
  LDAP_SCHEMA_ALLOW_ALL = $3f;
  LDAP_SCHEMA_SKIP = $80;

function ldap_syntax2name(syn: PLDAPSyntax): pchar; cdecl; external libldap;
function ldap_matchingrule2name(mr: PLDAPMatchingRule): pchar; cdecl; external libldap;
function ldap_matchingruleuse2name(mru: PLDAPMatchingRuleUse): pchar; cdecl; external libldap;
function ldap_attributetype2name(at: PLDAPAttributeType): pchar; cdecl; external libldap;
function ldap_objectclass2name(oc: PLDAPObjectClass): pchar; cdecl; external libldap;
function ldap_contentrule2name(cr: PLDAPContentRule): pchar; cdecl; external libldap;
function ldap_nameform2name(nf: PLDAPNameForm): pchar; cdecl; external libldap;
function ldap_structurerule2name(sr: PLDAPStructureRule): pchar; cdecl; external libldap;
procedure ldap_syntax_free(syn: PLDAPSyntax); cdecl; external libldap;
procedure ldap_matchingrule_free(mr: PLDAPMatchingRule); cdecl; external libldap;
procedure ldap_matchingruleuse_free(mr: PLDAPMatchingRuleUse); cdecl; external libldap;
procedure ldap_attributetype_free(at: PLDAPAttributeType); cdecl; external libldap;
procedure ldap_objectclass_free(oc: PLDAPObjectClass); cdecl; external libldap;
procedure ldap_contentrule_free(cr: PLDAPContentRule); cdecl; external libldap;
procedure ldap_nameform_free(nf: PLDAPNameForm); cdecl; external libldap;
procedure ldap_structurerule_free(sr: PLDAPStructureRule); cdecl; external libldap;
function ldap_str2structurerule(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPStructureRule; cdecl; external libldap;
function ldap_str2nameform(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPNameForm; cdecl; external libldap;
function ldap_str2contentrule(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPContentRule; cdecl; external libldap;
function ldap_str2objectclass(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPObjectClass; cdecl; external libldap;
function ldap_str2attributetype(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPAttributeType; cdecl; external libldap;
function ldap_str2syntax(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPSyntax; cdecl; external libldap;
function ldap_str2matchingrule(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPMatchingRule; cdecl; external libldap;
function ldap_str2matchingruleuse(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPMatchingRuleUse; cdecl; external libldap;
function ldap_structurerule2str(sr: PLDAPStructureRule): pchar; cdecl; external libldap;
function ldap_structurerule2bv(sr: PLDAPStructureRule; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_nameform2str(nf: PLDAPNameForm): pchar; cdecl; external libldap;
function ldap_nameform2bv(nf: PLDAPNameForm; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_contentrule2str(cr: PLDAPContentRule): pchar; cdecl; external libldap;
function ldap_contentrule2bv(cr: PLDAPContentRule; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_objectclass2str(oc: PLDAPObjectClass): pchar; cdecl; external libldap;
function ldap_objectclass2bv(oc: PLDAPObjectClass; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_attributetype2str(at: PLDAPAttributeType): pchar; cdecl; external libldap;
function ldap_attributetype2bv(at: PLDAPAttributeType; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_syntax2str(syn: PLDAPSyntax): pchar; cdecl; external libldap;
function ldap_syntax2bv(syn: PLDAPSyntax; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_matchingrule2str(mr: PLDAPMatchingRule): pchar; cdecl; external libldap;
function ldap_matchingrule2bv(mr: PLDAPMatchingRule; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_matchingruleuse2str(mru: PLDAPMatchingRuleUse): pchar; cdecl; external libldap;
function ldap_matchingruleuse2bv(mru: PLDAPMatchingRuleUse; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_scherr2str(code: longint): pchar; cdecl; external libldap;


// ==== /usr/include/openldap.h

const
  LDAP_PROTO_TCP = 1;
  LDAP_PROTO_UDP = 2;
  LDAP_PROTO_IPC = 3;
  LDAP_PROTO_EXT = 4;

function ldap_init_fd(fd: Tber_socket_t; proto: longint; url: pchar; ldp: PPLDAP): longint; cdecl; external libldap;



// === Konventiert am: 10-12-25 16:58:16 ===


implementation


// ==== /usr/include/ldap.h

function LDAP_OPT_X_TLS_PROTOCOL(maj, min: longint): longint;
begin
  LDAP_OPT_X_TLS_PROTOCOL := (maj shl 8) + min;
end;

function LDAP_RANGE(n, x, y: longint): boolean;
begin
  LDAP_RANGE := (x <= n) and (n <= y);
end;

function LDAP_ATTR_ERROR(n: longint): boolean;
begin
  LDAP_ATTR_ERROR := LDAP_RANGE(n, $10, $15);
end;

function LDAP_NAME_ERROR(n: longint): boolean;
begin
  LDAP_NAME_ERROR := LDAP_RANGE(n, $20, $24);
end;

function LDAP_SECURITY_ERROR(n: longint): boolean;
begin
  LDAP_SECURITY_ERROR := LDAP_RANGE(n, $2F, $32);
end;

function LDAP_SERVICE_ERROR(n: longint): boolean;
begin
  LDAP_SERVICE_ERROR := LDAP_RANGE(n, $33, $36);
end;

function LDAP_UPDATE_ERROR(n: longint): boolean;
begin
  LDAP_UPDATE_ERROR := LDAP_RANGE(n, $40, $47);
end;

function LDAP_E_ERROR(n: longint): boolean;
begin
  LDAP_E_ERROR := LDAP_RANGE(n, $1000, $3FFF);
end;

function LDAP_X_ERROR(n: longint): boolean;
begin
  LDAP_X_ERROR := LDAP_RANGE(n, $4000, $FFFF);
end;

function LDAP_API_ERROR(n: longint): boolean;
begin
  LDAP_API_ERROR := n < 0;
end;

function LDAP_API_RESULT(n: longint): boolean;
begin
  LDAP_API_RESULT := n <= 0;
end;


// /usr/include/ldap_utf8.h

function LDAP_MAX_UTF8_LEN: SizeUInt;
begin
  LDAP_MAX_UTF8_LEN := ((sizeof(Twchar_t)) * 3) div 2;
end;




end.
