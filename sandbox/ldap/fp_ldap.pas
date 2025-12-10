unit fp_ldap;

interface

uses
 ldap_features;

const
  {$IFDEF Linux}
  libldap = 'ldap';
  {$ENDIF}

  {$IFDEF Windows}
  // no suported
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


  type
  PPLDAP=Pointer; // ?????

  type // /usr/include/lber_types.h
  Tber_socket_t=Integer;
  Tber_len_t=Tculong;
  Tber_tag_t=Tclong   ;

  type // /usr/include/lber.h
  Tberval = record
 	bv_len: 	Tber_len_t;
		bv_val:PChar;
        end;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


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

function LDAP_OPT_X_TLS_PROTOCOL(maj,min : longint) : longint;

const
  LDAP_OPT_X_TLS_PROTOCOL_SSL2 = 2 shl 8;  
  LDAP_OPT_X_TLS_PROTOCOL_SSL3 = 3 shl 8;  
  LDAP_OPT_X_TLS_PROTOCOL_TLS1_0 = (3 shl 8)+1;  
  LDAP_OPT_X_TLS_PROTOCOL_TLS1_1 = (3 shl 8)+2;  
  LDAP_OPT_X_TLS_PROTOCOL_TLS1_2 = (3 shl 8)+3;  
  LDAP_OPT_X_TLS_PROTOCOL_TLS1_3 = (3 shl 8)+4;  
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

  function LDAP_OPT_ON : pointer;
function LDAP_OPT_OFF : pointer;

type
  Tldapapiinfo = record
      ldapai_info_version : longint;
      ldapai_api_version : longint;
      ldapai_protocol_version : longint;
      ldapai_extensions : ^Pchar;
      ldapai_vendor_name : Pchar;
      ldapai_vendor_version : longint;
    end;
  Pldapapiinfo = ^Tldapapiinfo;

const
  LDAP_API_INFO_VERSION = 1;  
type
  Tldap_apifeature_info = record
      ldapaif_info_version : longint;
      ldapaif_name : Pchar;
      ldapaif_version : longint;
    end;
  Pldap_apifeature_info = ^Tldap_apifeature_info;

  TLDAPAPIFeatureInfo = Tldap_apifeature_info;
  PLDAPAPIFeatureInfo = ^TLDAPAPIFeatureInfo;
{ apifeature_info struct version  }

const
  LDAP_FEATURE_INFO_VERSION = 1;  
type
  Tldapcontrol = record
      ldctl_oid : Pchar;
      ldctl_value : Tberval;
      ldctl_iscritical : char;
    end;
  Pldapcontrol = ^Tldapcontrol;

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
LDAP_CONTROL_SYNC	=	LDAP_SYNC_OID +'.1';
LDAP_CONTROL_SYNC_STATE	=LDAP_SYNC_OID+ '.2';
 LDAP_CONTROL_SYNC_DONE=	LDAP_SYNC_OID +'.3';
 LDAP_SYNC_INFO	=		LDAP_SYNC_OID +'.4';

LDAP_SYNC_NONE = $00;
  LDAP_SYNC_REFRESH_ONLY = $01;  
  LDAP_SYNC_RESERVED = $02;  
  LDAP_SYNC_REFRESH_AND_PERSIST = $03;  
  LDAP_SYNC_REFRESH_PRESENTS = 0;  
  LDAP_SYNC_REFRESH_DELETES = 1;  

{ was #define dname def_expr }
function LDAP_TAG_SYNC_NEW_COOKIE : Tber_tag_t;  

{ was #define dname def_expr }
function LDAP_TAG_SYNC_REFRESH_DELETE : Tber_tag_t;  

{ was #define dname def_expr }
function LDAP_TAG_SYNC_REFRESH_PRESENT : Tber_tag_t;  

{ was #define dname def_expr }
function LDAP_TAG_SYNC_ID_SET : Tber_tag_t;  

{ was #define dname def_expr }
function LDAP_TAG_SYNC_COOKIE : Tber_tag_t;  

{ was #define dname def_expr }
function LDAP_TAG_REFRESHDELETES : Tber_tag_t;  

{ was #define dname def_expr }
function LDAP_TAG_REFRESHDONE : Tber_tag_t;  

{ was #define dname def_expr }
function LDAP_TAG_RELOAD_HINT : Tber_tag_t;  

const
  LDAP_SYNC_PRESENT = 0;  
  LDAP_SYNC_ADD = 1;  
  LDAP_SYNC_MODIFY = 2;  
  LDAP_SYNC_DELETE = 3;  
  LDAP_SYNC_NEW_COOKIE = 4;  
{ LDAP Don't Use Copy Control (RFC 6171)  }
  LDAP_CONTROL_DONTUSECOPY = '1.3.6.1.1.22';  
{ Password policy Controls  }{ work in progress  }
{ ITS#3458: released; disabled by default  }
  LDAP_CONTROL_PASSWORDPOLICYREQUEST = '1.3.6.1.4.1.42.2.27.8.5.1';  
  LDAP_CONTROL_PASSWORDPOLICYRESPONSE = '1.3.6.1.4.1.42.2.27.8.5.1';  
{ various works in progress  }
  LDAP_CONTROL_NOOP = '1.3.6.1.4.1.4203.666.5.2';  
  LDAP_CONTROL_NO_SUBORDINATES = '1.3.6.1.4.1.4203.666.5.11';  
  LDAP_CONTROL_RELAX = '1.3.6.1.4.1.4203.666.5.12';  
  LDAP_CONTROL_MANAGEDIT = LDAP_CONTROL_RELAX;  
  LDAP_CONTROL_SLURP = '1.3.6.1.4.1.4203.666.5.13';  
  LDAP_CONTROL_VALSORT = '1.3.6.1.4.1.4203.666.5.14';  
  LDAP_CONTROL_X_DEREF = '1.3.6.1.4.1.4203.666.5.16';  
  LDAP_CONTROL_X_WHATFAILED = '1.3.6.1.4.1.4203.666.5.17';  
{ LDAP Chaining Behavior Control  }{ work in progress  }
{ <draft-sermersheim-ldap-chaining>;
 * see also LDAP_NO_REFERRALS_FOUND, LDAP_CANNOT_CHAIN  }
  LDAP_CONTROL_X_CHAINING_BEHAVIOR = '1.3.6.1.4.1.4203.666.11.3';  
  LDAP_CHAINING_PREFERRED = 0;  
  LDAP_CHAINING_REQUIRED = 1;  
  LDAP_REFERRALS_PREFERRED = 2;  
  LDAP_REFERRALS_REQUIRED = 3;  
{ MS Active Directory controls (for compatibility)  }
  LDAP_CONTROL_X_LAZY_COMMIT = '1.2.840.113556.1.4.619';  
  LDAP_CONTROL_X_INCREMENTAL_VALUES = '1.2.840.113556.1.4.802';  
  LDAP_CONTROL_X_DOMAIN_SCOPE = '1.2.840.113556.1.4.1339';  
  LDAP_CONTROL_X_PERMISSIVE_MODIFY = '1.2.840.113556.1.4.1413';  
  LDAP_CONTROL_X_SEARCH_OPTIONS = '1.2.840.113556.1.4.1340';  
{ do not generate referrals  }
  LDAP_SEARCH_FLAG_DOMAIN_SCOPE = 1;  
{ search all subordinate NCs  }
  LDAP_SEARCH_FLAG_PHANTOM_ROOT = 2;  
  LDAP_CONTROL_X_TREE_DELETE = '1.2.840.113556.1.4.805';  
{ MS Active Directory controls - not implemented in slapd(8)  }
  LDAP_CONTROL_X_SERVER_NOTIFICATION = '1.2.840.113556.1.4.528';  
  LDAP_CONTROL_X_EXTENDED_DN = '1.2.840.113556.1.4.529';  
  LDAP_CONTROL_X_SHOW_DELETED = '1.2.840.113556.1.4.417';  
  LDAP_CONTROL_X_DIRSYNC = '1.2.840.113556.1.4.841';  
  LDAP_CONTROL_X_DIRSYNC_OBJECT_SECURITY = $00000001;  
  LDAP_CONTROL_X_DIRSYNC_ANCESTORS_FIRST = $00000800;  
  LDAP_CONTROL_X_DIRSYNC_PUBLIC_DATA_ONLY = $00002000;  
  LDAP_CONTROL_X_DIRSYNC_INCREMENTAL_VALUES = $80000000;  
{ <draft-wahl-ldap-session>  }
  LDAP_CONTROL_X_SESSION_TRACKING = '1.3.6.1.4.1.21008.108.63.1';  
{xxxxxxxxx
#define LDAP_CONTROL_X_SESSION_TRACKING_RADIUS_ACCT_SESSION_ID \
						LDAP_CONTROL_X_SESSION_TRACKING ".1"
#define LDAP_CONTROL_X_SESSION_TRACKING_RADIUS_ACCT_MULTI_SESSION_ID \
						LDAP_CONTROL_X_SESSION_TRACKING ".2"
#define LDAP_CONTROL_X_SESSION_TRACKING_USERNAME \
						LDAP_CONTROL_X_SESSION_TRACKING ".3"
 }
{ various expired works  }
{ LDAP Duplicated Entry Control Extension  }{ not implemented in slapd(8)  }
  LDAP_CONTROL_DUPENT_REQUEST = '2.16.840.1.113719.1.27.101.1';  
  LDAP_CONTROL_DUPENT_RESPONSE = '2.16.840.1.113719.1.27.101.2';  
  LDAP_CONTROL_DUPENT_ENTRY = '2.16.840.1.113719.1.27.101.3';  
  LDAP_CONTROL_DUPENT = LDAP_CONTROL_DUPENT_REQUEST;  
{ LDAP Persistent Search Control  }{ not implemented in slapd(8)  }
  LDAP_CONTROL_PERSIST_REQUEST = '2.16.840.1.113730.3.4.3';  
  LDAP_CONTROL_PERSIST_ENTRY_CHANGE_NOTICE = '2.16.840.1.113730.3.4.7';  
  LDAP_CONTROL_PERSIST_ENTRY_CHANGE_ADD = $1;  
  LDAP_CONTROL_PERSIST_ENTRY_CHANGE_DELETE = $2;  
  LDAP_CONTROL_PERSIST_ENTRY_CHANGE_MODIFY = $4;  
  LDAP_CONTROL_PERSIST_ENTRY_CHANGE_RENAME = $8;  
{ LDAP VLV  }
  LDAP_CONTROL_VLVREQUEST = '2.16.840.1.113730.3.4.9';  
  LDAP_CONTROL_VLVRESPONSE = '2.16.840.1.113730.3.4.10';  
{ Sun's analogue to ppolicy  }
  LDAP_CONTROL_X_ACCOUNT_USABILITY = '1.3.6.1.4.1.42.2.27.9.5.8';  
{ primitive + 0  }

{ was #define dname def_expr }
function LDAP_TAG_X_ACCOUNT_USABILITY_AVAILABLE : Tber_tag_t;  

{ constructed + 1  }
{ was #define dname def_expr }
function LDAP_TAG_X_ACCOUNT_USABILITY_NOT_AVAILABLE : Tber_tag_t;  

{ primitive + 0  }
{ was #define dname def_expr }
function LDAP_TAG_X_ACCOUNT_USABILITY_INACTIVE : Tber_tag_t;  

{ primitive + 1  }
{ was #define dname def_expr }
function LDAP_TAG_X_ACCOUNT_USABILITY_RESET : Tber_tag_t;  

{ primitive + 2  }
{ was #define dname def_expr }
function LDAP_TAG_X_ACCOUNT_USABILITY_EXPIRED : Tber_tag_t;  

{ primitive + 3  }
{ was #define dname def_expr }
function LDAP_TAG_X_ACCOUNT_USABILITY_REMAINING_GRACE : Tber_tag_t;  

{ primitive + 4  }
{ was #define dname def_expr }
function LDAP_TAG_X_ACCOUNT_USABILITY_UNTIL_UNLOCK : Tber_tag_t;  

{ Netscape Password policy response controls  }
{ <draft-vchu-ldap-pwd-policy>  }
const
  LDAP_CONTROL_X_PASSWORD_EXPIRED = '2.16.840.1.113730.3.4.4';  
  LDAP_CONTROL_X_PASSWORD_EXPIRING = '2.16.840.1.113730.3.4.5';  
{ LDAP Unsolicited Notifications  }
{ RFC 4511  }
  LDAP_NOTICE_OF_DISCONNECTION = '1.3.6.1.4.1.1466.20036';  
  LDAP_NOTICE_DISCONNECT = LDAP_NOTICE_OF_DISCONNECTION;  
{ LDAP Extended Operations  }
{ RFC 4511  }
  LDAP_EXOP_START_TLS = '1.3.6.1.4.1.1466.20037';  
{ RFC 3062  }
  LDAP_EXOP_MODIFY_PASSWD = '1.3.6.1.4.1.4203.1.11.1';  

{ was #define dname def_expr }
function LDAP_TAG_EXOP_MODIFY_PASSWD_ID : Tber_tag_t;  

{ was #define dname def_expr }
function LDAP_TAG_EXOP_MODIFY_PASSWD_OLD : Tber_tag_t;  

{ was #define dname def_expr }
function LDAP_TAG_EXOP_MODIFY_PASSWD_NEW : Tber_tag_t;  

{ was #define dname def_expr }
function LDAP_TAG_EXOP_MODIFY_PASSWD_GEN : Tber_tag_t;  

{ RFC 3909  }
const
  LDAP_EXOP_CANCEL = '1.3.6.1.1.8';  
  LDAP_EXOP_X_CANCEL = LDAP_EXOP_CANCEL;  
{ RFC 2589  }
  LDAP_EXOP_REFRESH = '1.3.6.1.4.1.1466.101.119.1';  

{ was #define dname def_expr }
function LDAP_TAG_EXOP_REFRESH_REQ_DN : Tber_tag_t;  

{ was #define dname def_expr }
function LDAP_TAG_EXOP_REFRESH_REQ_TTL : Tber_tag_t;  

{ was #define dname def_expr }
function LDAP_TAG_EXOP_REFRESH_RES_TTL : Tber_tag_t;  

const
  LDAP_EXOP_VERIFY_CREDENTIALS = '1.3.6.1.4.1.4203.666.6.5';  
  LDAP_EXOP_X_VERIFY_CREDENTIALS = LDAP_EXOP_VERIFY_CREDENTIALS;  

{ was #define dname def_expr }
function LDAP_TAG_EXOP_VERIFY_CREDENTIALS_COOKIE : Tber_tag_t;  

{ was #define dname def_expr }
function LDAP_TAG_EXOP_VERIFY_CREDENTIALS_SCREDS : Tber_tag_t;  

{ context specific + constructed + 2  }
{ was #define dname def_expr }
function LDAP_TAG_EXOP_VERIFY_CREDENTIALS_CONTROLS : Tber_tag_t;  

{ RFC 4532  }
const
  LDAP_EXOP_WHO_AM_I = '1.3.6.1.4.1.4203.1.11.3';  
  LDAP_EXOP_X_WHO_AM_I = LDAP_EXOP_WHO_AM_I;  
{ various works in progress  }
{ RFC 4531  }
  LDAP_EXOP_TURN = '1.3.6.1.1.19';  
  LDAP_EXOP_X_TURN = LDAP_EXOP_TURN;  
{ LDAP Distributed Procedures <draft-sermersheim-ldap-distproc>  }
{ a work in progress  }
  LDAP_X_DISTPROC_BASE = '1.3.6.1.4.1.4203.666.11.6';  
{xxxxxx
#define LDAP_EXOP_X_CHAINEDREQUEST	LDAP_X_DISTPROC_BASE ".1"
#define LDAP_FEATURE_X_CANCHAINOPS	LDAP_X_DISTPROC_BASE ".2"
#define LDAP_CONTROL_X_RETURNCONTREF	LDAP_X_DISTPROC_BASE ".3"
#define LDAP_URLEXT_X_LOCALREFOID	LDAP_X_DISTPROC_BASE ".4"
#define LDAP_URLEXT_X_REFTYPEOID	LDAP_X_DISTPROC_BASE ".5"
#define LDAP_URLEXT_X_SEARCHEDSUBTREEOID LDAP_X_DISTPROC_BASE ".6"
#define LDAP_URLEXT_X_FAILEDNAMEOID	LDAP_X_DISTPROC_BASE ".7"
 }
  LDAP_URLEXT_X_LOCALREF = 'x-localReference';  
  LDAP_URLEXT_X_REFTYPE = 'x-referenceType';  
  LDAP_URLEXT_X_SEARCHEDSUBTREE = 'x-searchedSubtree';  
  LDAP_URLEXT_X_FAILEDNAME = 'x-failedName';  
{ RFC 5805  }
  LDAP_TXN = '1.3.6.1.1.21';  
{xxxxxxxxxx
#define LDAP_EXOP_TXN_START				LDAP_TXN ".1"
#define LDAP_CONTROL_TXN_SPEC			LDAP_TXN ".2"
#define LDAP_EXOP_TXN_END				LDAP_TXN ".3"
#define LDAP_EXOP_TXN_ABORTED_NOTICE	LDAP_TXN ".4"
 }
{ LDAP Features  }
{ RFC 3673  }
  LDAP_FEATURE_ALL_OP_ATTRS = '1.3.6.1.4.1.4203.1.5.1';  
{  @objectClass - new number to be assigned  }
  LDAP_FEATURE_OBJECTCLASS_ATTRS = '1.3.6.1.4.1.4203.1.5.2';  
{ (&) (|)  }
  LDAP_FEATURE_ABSOLUTE_FILTERS = '1.3.6.1.4.1.4203.1.5.3';  
  LDAP_FEATURE_LANGUAGE_TAG_OPTIONS = '1.3.6.1.4.1.4203.1.5.4';  
  LDAP_FEATURE_LANGUAGE_RANGE_OPTIONS = '1.3.6.1.4.1.4203.1.5.5';  
  LDAP_FEATURE_MODIFY_INCREMENT = '1.3.6.1.1.14';  
{ LDAP Experimental (works in progress) Features  }
{ "children"  }
  LDAP_FEATURE_SUBORDINATE_SCOPE = '1.3.6.1.4.1.4203.666.8.1';  
  LDAP_FEATURE_CHILDREN_SCOPE = LDAP_FEATURE_SUBORDINATE_SCOPE;  
{
 * specific LDAP instantiations of BER types we know about
  }
{ Overview of LBER tag construction
 *
 *	Bits
 *	______
 *	8 7 | CLASS
 *	0 0 = UNIVERSAL
 *	0 1 = APPLICATION
 *	1 0 = CONTEXT-SPECIFIC
 *	1 1 = PRIVATE
 *		_____
 *		| 6 | DATA-TYPE
 *		  0 = PRIMITIVE
 *		  1 = CONSTRUCTED
 *			___________
 *			| 5 ... 1 | TAG-NUMBER
  }
{ general stuff  }
{ constructed + 16  }

{ was #define dname def_expr }
function LDAP_TAG_MESSAGE : Tber_tag_t;  

{ integer  }
{ was #define dname def_expr }
function LDAP_TAG_MSGID : Tber_tag_t;  

{ octet string  }
{ was #define dname def_expr }
function LDAP_TAG_LDAPDN : Tber_tag_t;  

{ octet string  }
{ was #define dname def_expr }
function LDAP_TAG_LDAPCRED : Tber_tag_t;  

{ context specific + constructed + 0  }
{ was #define dname def_expr }
function LDAP_TAG_CONTROLS : Tber_tag_t;  

{ context specific + constructed + 3  }
{ was #define dname def_expr }
function LDAP_TAG_REFERRAL : Tber_tag_t;  

{ context-specific + primitive + 0  }
{ was #define dname def_expr }
function LDAP_TAG_NEWSUPERIOR : Tber_tag_t;  

{ context specific + primitive  }
{ was #define dname def_expr }
function LDAP_TAG_EXOP_REQ_OID : Tber_tag_t;  

{ context specific + primitive  }
{ was #define dname def_expr }
function LDAP_TAG_EXOP_REQ_VALUE : Tber_tag_t;  

{ context specific + primitive  }
{ was #define dname def_expr }
function LDAP_TAG_EXOP_RES_OID : Tber_tag_t;  

{ context specific + primitive  }
{ was #define dname def_expr }
function LDAP_TAG_EXOP_RES_VALUE : Tber_tag_t;  

{ context specific + primitive  }
{ was #define dname def_expr }
function LDAP_TAG_IM_RES_OID : Tber_tag_t;  

{ context specific + primitive  }
{ was #define dname def_expr }
function LDAP_TAG_IM_RES_VALUE : Tber_tag_t;  

{ context specific + primitive  }
{ was #define dname def_expr }
function LDAP_TAG_SASL_RES_CREDS : Tber_tag_t;  

{ LDAP Request Messages  }
{ application + constructed  }
{ was #define dname def_expr }
function LDAP_REQ_BIND : Tber_tag_t;  

{ application + primitive    }
{ was #define dname def_expr }
function LDAP_REQ_UNBIND : Tber_tag_t;  

{ application + constructed  }
{ was #define dname def_expr }
function LDAP_REQ_SEARCH : Tber_tag_t;  

{ application + constructed  }
{ was #define dname def_expr }
function LDAP_REQ_MODIFY : Tber_tag_t;  

{ application + constructed  }
{ was #define dname def_expr }
function LDAP_REQ_ADD : Tber_tag_t;  

{ application + primitive    }
{ was #define dname def_expr }
function LDAP_REQ_DELETE : Tber_tag_t;  

{ application + constructed  }
{ was #define dname def_expr }
function LDAP_REQ_MODDN : Tber_tag_t;  

const
  LDAP_REQ_MODRDN = LDAP_REQ_MODDN;  
  LDAP_REQ_RENAME = LDAP_REQ_MODDN;  
{ application + constructed  }

{ was #define dname def_expr }
function LDAP_REQ_COMPARE : Tber_tag_t;  

{ application + primitive    }
{ was #define dname def_expr }
function LDAP_REQ_ABANDON : Tber_tag_t;  

{ application + constructed  }
{ was #define dname def_expr }
function LDAP_REQ_EXTENDED : Tber_tag_t;  

{ LDAP Response Messages  }
{ application + constructed  }
{ was #define dname def_expr }
function LDAP_RES_BIND : Tber_tag_t;  

{ application + constructed  }
{ was #define dname def_expr }
function LDAP_RES_SEARCH_ENTRY : Tber_tag_t;  

{ V3: application + constructed  }
{ was #define dname def_expr }
function LDAP_RES_SEARCH_REFERENCE : Tber_tag_t;  

{ application + constructed  }
{ was #define dname def_expr }
function LDAP_RES_SEARCH_RESULT : Tber_tag_t;  

{ application + constructed  }
{ was #define dname def_expr }
function LDAP_RES_MODIFY : Tber_tag_t;  

{ application + constructed  }
{ was #define dname def_expr }
function LDAP_RES_ADD : Tber_tag_t;  

{ application + constructed  }
{ was #define dname def_expr }
function LDAP_RES_DELETE : Tber_tag_t;  

{ application + constructed  }
{ was #define dname def_expr }
function LDAP_RES_MODDN : Tber_tag_t;  

{ application + constructed  }
const
  LDAP_RES_MODRDN = LDAP_RES_MODDN;  
{ application + constructed  }
  LDAP_RES_RENAME = LDAP_RES_MODDN;  
{ application + constructed  }

{ was #define dname def_expr }
function LDAP_RES_COMPARE : Tber_tag_t;  

{ V3: application + constructed  }
{ was #define dname def_expr }
function LDAP_RES_EXTENDED : Tber_tag_t;  

{ V3+: application + constructed  }
{ was #define dname def_expr }
function LDAP_RES_INTERMEDIATE : Tber_tag_t;  

const
  LDAP_RES_ANY = -(1);  
  LDAP_RES_UNSOLICITED = 0;  
{ sasl methods  }

{ was #define dname def_expr }
function LDAP_SASL_SIMPLE : Pchar;  

const
  LDAP_SASL_NULL = '';  
{ authentication methods available  }
{ no authentication  }

{ was #define dname def_expr }
function LDAP_AUTH_NONE : Tber_tag_t;  

{ context specific + primitive  }
{ was #define dname def_expr }
function LDAP_AUTH_SIMPLE : Tber_tag_t;  

{ context specific + constructed  }
{ was #define dname def_expr }
function LDAP_AUTH_SASL : Tber_tag_t;  

{ means do both of the following  }
{ was #define dname def_expr }
function LDAP_AUTH_KRBV4 : Tber_tag_t;  

{ context specific + primitive  }
{ was #define dname def_expr }
function LDAP_AUTH_KRBV41 : Tber_tag_t;  

{ context specific + primitive  }
{ was #define dname def_expr }
function LDAP_AUTH_KRBV42 : Tber_tag_t;  

{ used by the Windows API but not used on the wire  }
{ was #define dname def_expr }
function LDAP_AUTH_NEGOTIATE : Tber_tag_t;  

{ filter types  }
{ context specific + constructed  }
{ was #define dname def_expr }
function LDAP_FILTER_AND : Tber_tag_t;  

{ context specific + constructed  }
{ was #define dname def_expr }
function LDAP_FILTER_OR : Tber_tag_t;  

{ context specific + constructed  }
{ was #define dname def_expr }
function LDAP_FILTER_NOT : Tber_tag_t;  

{ context specific + constructed  }
{ was #define dname def_expr }
function LDAP_FILTER_EQUALITY : Tber_tag_t;  

{ context specific + constructed  }
{ was #define dname def_expr }
function LDAP_FILTER_SUBSTRINGS : Tber_tag_t;  

{ context specific + constructed  }
{ was #define dname def_expr }
function LDAP_FILTER_GE : Tber_tag_t;  

{ context specific + constructed  }
{ was #define dname def_expr }
function LDAP_FILTER_LE : Tber_tag_t;  

{ context specific + primitive    }
{ was #define dname def_expr }
function LDAP_FILTER_PRESENT : Tber_tag_t;  

{ context specific + constructed  }
{ was #define dname def_expr }
function LDAP_FILTER_APPROX : Tber_tag_t;  

{ context specific + constructed  }
{ was #define dname def_expr }
function LDAP_FILTER_EXT : Tber_tag_t;  

{ extended filter component types  }
{ context specific  }
{ was #define dname def_expr }
function LDAP_FILTER_EXT_OID : Tber_tag_t;  

{ context specific  }
{ was #define dname def_expr }
function LDAP_FILTER_EXT_TYPE : Tber_tag_t;  

{ context specific  }
{ was #define dname def_expr }
function LDAP_FILTER_EXT_VALUE : Tber_tag_t;  

{ context specific  }
{ was #define dname def_expr }
function LDAP_FILTER_EXT_DNATTRS : Tber_tag_t;  

{ substring filter component types  }
{ context specific  }
{ was #define dname def_expr }
function LDAP_SUBSTRING_INITIAL : Tber_tag_t;  

{ context specific  }
{ was #define dname def_expr }
function LDAP_SUBSTRING_ANY : Tber_tag_t;  

{ context specific  }
{ was #define dname def_expr }
function LDAP_SUBSTRING_FINAL : Tber_tag_t;  

{ search scopes  }
{ was #define dname def_expr }
function LDAP_SCOPE_BASE : Tber_int_t;  

const
  LDAP_SCOPE_BASEOBJECT = LDAP_SCOPE_BASE;  

{ was #define dname def_expr }
function LDAP_SCOPE_ONELEVEL : Tber_int_t;  

const
  LDAP_SCOPE_ONE = LDAP_SCOPE_ONELEVEL;  

{ was #define dname def_expr }
function LDAP_SCOPE_SUBTREE : Tber_int_t;  

const
  LDAP_SCOPE_SUB = LDAP_SCOPE_SUBTREE;  
{ OpenLDAP extension  }

{ was #define dname def_expr }
function LDAP_SCOPE_SUBORDINATE : Tber_int_t;  

const
  LDAP_SCOPE_CHILDREN = LDAP_SCOPE_SUBORDINATE;  
{ OpenLDAP extension  }

{ was #define dname def_expr }
function LDAP_SCOPE_DEFAULT : Tber_int_t;  

{ substring filter component types  }
{ context specific  }
{ was #define dname def_expr }
function LDAP_SUBSTRING_INITIAL : Tber_tag_t;  

{ context specific  }
{ was #define dname def_expr }
function LDAP_SUBSTRING_ANY : Tber_tag_t;  

{ context specific  }
{ was #define dname def_expr }
function LDAP_SUBSTRING_FINAL : Tber_tag_t;  

{
 * LDAP Result Codes
  }
const
  LDAP_SUCCESS = $00;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LDAP_RANGE(n,x,y : longint) : longint;

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
{ LDAPv2+ (not LDAPv3)  }
  LDAP_PARTIAL_RESULTS = $09;  
{ LDAPv3  }
  LDAP_REFERRAL = $0a;  
{ LDAPv3  }
  LDAP_ADMINLIMIT_EXCEEDED = $0b;  
{ LDAPv3  }
  LDAP_UNAVAILABLE_CRITICAL_EXTENSION = $0c;  
{ LDAPv3  }
  LDAP_CONFIDENTIALITY_REQUIRED = $0d;  
{ LDAPv3  }
  LDAP_SASL_BIND_IN_PROGRESS = $0e;  
{ 16-21  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LDAP_ATTR_ERROR(n : longint) : longint;

const
  LDAP_NO_SUCH_ATTRIBUTE = $10;  
  LDAP_UNDEFINED_TYPE = $11;  
  LDAP_INAPPROPRIATE_MATCHING = $12;  
  RAINT_VIOLATION = $13;  
  LDAP_TYPE_OR_VALUE_EXISTS = $14;  
  LDAP_INVALID_SYNTAX = $15;  
{ 32-34,36  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LDAP_NAME_ERROR(n : longint) : longint;

const
  LDAP_NO_SUCH_OBJECT = $20;  
  LDAP_ALIAS_PROBLEM = $21;  
  LDAP_INVALID_DN_SYNTAX = $22;  
{ not LDAPv3  }
  LDAP_IS_LEAF = $23;  
  LDAP_ALIAS_DEREF_PROBLEM = $24;  
{ 47-50  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LDAP_SECURITY_ERROR(n : longint) : longint;

{ LDAPv3 proxy authorization  }
const
  LDAP_X_PROXY_AUTHZ_FAILURE = $2F;  
  LDAP_INAPPROPRIATE_AUTH = $30;  
  LDAP_INVALID_CREDENTIALS = $31;  
  LDAP_INSUFFICIENT_ACCESS = $32;  
{ 51-54  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LDAP_SERVICE_ERROR(n : longint) : longint;

const
  LDAP_BUSY = $33;  
  LDAP_UNAVAILABLE = $34;  
  LDAP_UNWILLING_TO_PERFORM = $35;  
  LDAP_LOOP_DETECT = $36;  
{ 64-69,71  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LDAP_UPDATE_ERROR(n : longint) : longint;

const
  LDAP_NAMING_VIOLATION = $40;  
  LDAP_OBJECT_CLASS_VIOLATION = $41;  
  LDAP_NOT_ALLOWED_ON_NONLEAF = $42;  
  LDAP_NOT_ALLOWED_ON_RDN = $43;  
  LDAP_ALREADY_EXISTS = $44;  
  LDAP_NO_OBJECT_CLASS_MODS = $45;  
{ CLDAP  }
  LDAP_RESULTS_TOO_LARGE = $46;  
  LDAP_AFFECTS_MULTIPLE_DSAS = $47;  
  LDAP_VLV_ERROR = $4C;  
  LDAP_OTHER = $50;  
{ LCUP operation codes (113-117) - not implemented  }
  LDAP_CUP_RESOURCES_EXHAUSTED = $71;  
  LDAP_CUP_SECURITY_VIOLATION = $72;  
  LDAP_CUP_INVALID_DATA = $73;  
  LDAP_CUP_UNSUPPORTED_SCHEME = $74;  
  LDAP_CUP_RELOAD_REQUIRED = $75;  
{ Cancel operation codes (118-121)  }
  LDAP_CANCELLED = $76;  
  LDAP_NO_SUCH_OPERATION = $77;  
  LDAP_TOO_LATE = $78;  
  LDAP_CANNOT_CANCEL = $79;  
{ Assertion control (122)  }  LDAP_ASSERTION_FAILED = $7A;  
{ Proxied Authorization Denied (123)  }  LDAP_PROXIED_AUTHORIZATION_DENIED = $7B;  
{ Experimental result codes  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LDAP_E_ERROR(n : longint) : longint;

{ LDAP Sync (4096)  }
const
  LDAP_SYNC_REFRESH_REQUIRED = $1000;  
{ Private Use result codes  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LDAP_X_ERROR(n : longint) : longint;

{ defunct  }
const
  LDAP_X_SYNC_REFRESH_REQUIRED = $4100;  
{ defunct  }
  LDAP_X_ASSERTION_FAILED = $410f;  
{ for the LDAP No-Op control  }
  LDAP_X_NO_OPERATION = $410e;  
{ for the Chaining Behavior control (consecutive result codes requested;
 * see <draft-sermersheim-ldap-chaining> )  }
{$ifdef LDAP_CONTROL_X_CHAINING_BEHAVIOR}
  LDAP_X_NO_REFERRALS_FOUND = $4110;  
  LDAP_X_CANNOT_CHAIN = $4111;  
{$endif}
{ for Distributed Procedures (see <draft-sermersheim-ldap-distproc>)  }
{$ifdef LDAP_X_DISTPROC_BASE}

const
  LDAP_X_INVALIDREFERENCE = $4112;  
{$endif}

const
  LDAP_TXN_SPECIFY_OKAY = $4120;  
  LDAP_TXN_ID_INVALID = $4121;  
{ API Error Codes
 *
 * Based on draft-ietf-ldap-c-api-xx
 * but with new negative code values
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LDAP_API_ERROR(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LDAP_API_RESULT(n : longint) : longint;

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
{ Obsolete  }
  LDAP_MORE_RESULTS_TO_RETURN = -(15);  
  LDAP_CLIENT_LOOP = -(16);  
  LDAP_REFERRAL_LIMIT_EXCEEDED = -(17);  
  LDAP_X_CONNECTING = -(18);  
{
 * This structure represents both ldap messages and ldap responses.
 * These are really the same, except in the case of search responses,
 * where a response has multiple messages.
  }
type
  Tldapmsg = TLDAPMessage;
{ for modifications  }
{xxxxxxxxxxx
#define LDAP_MOD_OP			(0x0007)
#define LDAP_MOD_ADD		(0x0000)
#define LDAP_MOD_DELETE		(0x0001)
#define LDAP_MOD_REPLACE	(0x0002)
#define LDAP_MOD_INCREMENT	(0x0003) 
#define LDAP_MOD_BVALUES	(0x0080)
  }

  Pldapmod = ^Tldapmod;
  Tldapmod = record
      mod_op : longint;
      mod_type : Pchar;
      mod_vals : record
          case longint of
            0 : ( modv_strvals : ^Pchar );
            1 : ( modv_bvals : ^Pberval );
          end;
    end;
{
 * structure representing an ldap session which can
 * encompass connections to multiple servers (in the
 * face of referrals).
  }

const
  LDAP_DEREF_NEVER = $00;  
  LDAP_DEREF_SEARCHING = $01;  
  LDAP_DEREF_FINDING = $02;  
  LDAP_DEREF_ALWAYS = $03;  
  LDAP_NO_LIMIT = 0;  
{ how many messages to retrieve results for  }
  LDAP_MSG_ONE = $00;  
  LDAP_MSG_ALL = $01;  
  LDAP_MSG_RECEIVED = $02;  
{
 * types for ldap URL handling
  }
type
  Pldap_url_desc = ^Tldap_url_desc;
  Tldap_url_desc = record
      lud_next : Pldap_url_desc;
      lud_scheme : Pchar;
      lud_host : Pchar;
      lud_port : longint;
      lud_dn : Pchar;
      lud_attrs : ^Pchar;
      lud_scope : longint;
      lud_filter : Pchar;
      lud_exts : ^Pchar;
      lud_crit_exts : longint;
    end;
  TLDAPURLDesc = Tldap_url_desc;
  PLDAPURLDesc = ^TLDAPURLDesc;
{ Success  }

const
  LDAP_URL_SUCCESS = $00;  
{ can't allocate memory space  }
  LDAP_URL_ERR_MEM = $01;  
{ parameter is bad  }
  LDAP_URL_ERR_PARAM = $02;  
{ URL doesn't begin with "ldap[si]://"  }
  LDAP_URL_ERR_BADSCHEME = $03;  
{ URL is missing trailing ">"  }
  LDAP_URL_ERR_BADENCLOSURE = $04;  
{ URL is bad  }
  LDAP_URL_ERR_BADURL = $05;  
{ host port is bad  }
  LDAP_URL_ERR_BADHOST = $06;  
{ bad (or missing) attributes  }
  LDAP_URL_ERR_BADATTRS = $07;  
{ scope string is invalid (or missing)  }
  LDAP_URL_ERR_BADSCOPE = $08;  
{ bad or missing filter  }
  LDAP_URL_ERR_BADFILTER = $09;  
{ bad or missing extensions  }
  LDAP_URL_ERR_BADEXTS = $0a;  
{
 * LDAP sync (RFC4533) API
  }
type
{ these are private - the client should never see them  }
{ these are passed to ls_search_entry()  }
{ these are passed to ls_intermediate()  }

  Pldap_sync_refresh_t = ^Tldap_sync_refresh_t;
  Tldap_sync_refresh_t =  Longint;
  Const
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
;
{
 * Called when an entry is returned by ldap_result().
 * If phase is LDAP_SYNC_CAPI_ADD or LDAP_SYNC_CAPI_MODIFY,
 * the entry has been either added or modified, and thus
 * the complete view of the entry should be in the LDAPMessage.
 * If phase is LDAP_SYNC_CAPI_PRESENT or LDAP_SYNC_CAPI_DELETE,
 * only the DN should be in the LDAPMessage.
  }
type

  Tldap_sync_search_entry_f = function (ls:Pldap_sync_t; msg:PLDAPMessage; entryUUID:Pberval; phase:Tldap_sync_refresh_t):longint;cdecl;
{
 * Called when a reference is returned; the client should know 
 * what to do with it.
  }

  Tldap_sync_search_reference_f = function (ls:Pldap_sync_t; msg:PLDAPMessage):longint;cdecl;
{
 * Called when specific intermediate/final messages are returned.
 * If phase is LDAP_SYNC_CAPI_PRESENTS or LDAP_SYNC_CAPI_DELETES,
 * a "presents" or "deletes" phase begins.
 * If phase is LDAP_SYNC_CAPI_DONE, a special "presents" phase
 * with refreshDone set to "TRUE" has been returned, to indicate
 * that the refresh phase of a refreshAndPersist is complete.
 * In the above cases, syncUUIDs is NULL.
 *
 * If phase is LDAP_SYNC_CAPI_PRESENTS_IDSET or 
 * LDAP_SYNC_CAPI_DELETES_IDSET, syncUUIDs is an array of UUIDs
 * that are either present or have been deleted.
  }

  Tldap_sync_intermediate_f = function (ls:Pldap_sync_t; msg:PLDAPMessage; syncUUIDs:TBerVarray; phase:Tldap_sync_refresh_t):longint;cdecl;
{
 * Called when a searchResultDone is returned.  In refreshAndPersist,
 * this can only occur if the search for any reason is being terminated
 * by the server.
  }

  Tldap_sync_search_result_f = function (ls:Pldap_sync_t; msg:PLDAPMessage; refreshDeletes:longint):longint;cdecl;
{
 * This structure contains all information about the persistent search;
 * the caller is responsible for connecting, setting version, binding, tls...
  }
{ conf search params  }
{ poll timeout  }
{ helpers - add as appropriate  }
{ set by the caller as appropriate  }
{ conn stuff  }
{ --- the parameters below are private - do not modify ---  }
{ FIXME: make the structure opaque, and provide an interface
	 * to modify the public values?  }
{ result stuff  }
{ sync stuff  }
{ needed by refreshOnly  }
{ opaque - need to pass between sessions, updated by the API  }
{ state variable - do not modify  }
  Pldap_sync_t = ^Tldap_sync_t;
  Tldap_sync_t = record
      ls_base : Pchar;
      ls_scope : longint;
      ls_filter : Pchar;
      ls_attrs : ^Pchar;
      ls_timelimit : longint;
      ls_sizelimit : longint;
      ls_timeout : longint;
      ls_search_entry : Tldap_sync_search_entry_f;
      ls_search_reference : Tldap_sync_search_reference_f;
      ls_intermediate : Tldap_sync_intermediate_f;
      ls_search_result : Tldap_sync_search_result_f;
      ls_private : pointer;
      ls_ld : PLDAP;
      ls_msgid : longint;
      ls_reloadHint : longint;
      ls_cookie : Tberval;
      ls_refreshPhase : Tldap_sync_refresh_t;
    end;

{
 * End of LDAP sync (RFC4533) API
  }
{
 * Connection callbacks...
  }
  Pldap_conncb = ^Tldap_conncb;
  Tldap_conncb = record
      {undefined structure}
    end;

  Psockaddr = ^Tsockaddr;
  Tsockaddr = record
      {undefined structure}
    end;

{ Called after a connection is established  }
{ Called before a connection is closed  }
{ Callbacks are pushed on a stack. Last one pushed is first one executed. The
 * delete callback is called with a NULL Sockbuf just before freeing the LDAP handle.
  }

  Pldap_conncb = ^Tldap_conncb;
  Tldap_conncb = record
      lc_add : Pldap_conn_add_f;
      lc_del : Pldap_conn_del_f;
      lc_arg : pointer;
    end;
{
 * The API draft spec says we should declare (or cause to be declared)
 * 'struct timeval'.   We don't.  See IETF LDAPext discussions.
  }
  Ptimeval = ^Ttimeval;
  Ttimeval = record
      {undefined structure}
    end;

{
 * in options.c:
  }

function ldap_get_option(ld:PLDAP; option:longint; outvalue:pointer):longint;cdecl;external libldap;
function ldap_set_option(ld:PLDAP; option:longint; invalue:pointer):longint;cdecl;external libldap;
{ V3 REBIND Function Callback Prototype  }
type

function ldap_set_rebind_proc(ld:PLDAP; rebind_proc:PLDAP_REBIND_PROC; params:pointer):longint;cdecl;external libldap;
{ V3 referral selection Function Callback Prototype  }
type

function ldap_set_nextref_proc(ld:PLDAP; nextref_proc:PLDAP_NEXTREF_PROC; params:pointer):longint;cdecl;external libldap;
{ V3 URLLIST Function Callback Prototype  }
type

function ldap_set_urllist_proc(ld:PLDAP; urllist_proc:PLDAP_URLLIST_PROC; params:pointer):longint;cdecl;external libldap;
{
 * in controls.c:
  }
{$if LDAP_DEPRECATED	}
{ deprecated, use ldap_control_create  }

function ldap_create_control(requestOID:Pchar; ber:PBerElement; iscritical:longint; ctrlp:PPLDAPControl):longint;cdecl;external libldap;
{ deprecated, use ldap_control_find  }
function ldap_find_control(oid:Pchar; ctrls:PPLDAPControl):PLDAPControl;cdecl;external libldap;
{$endif}

function ldap_control_create(requestOID:Pchar; iscritical:longint; value:Pberval; dupval:longint; ctrlp:PPLDAPControl):longint;cdecl;external libldap;
function ldap_control_find(oid:Pchar; ctrls:PPLDAPControl; nextctrlp:PPPLDAPControl):PLDAPControl;cdecl;external libldap;
procedure ldap_control_free(ctrl:PLDAPControl);cdecl;external libldap;
procedure ldap_controls_free(ctrls:PPLDAPControl);cdecl;external libldap;
function ldap_controls_dup(controls:PPLDAPControl):^PLDAPControl;cdecl;external libldap;
function ldap_control_dup(c:PLDAPControl):PLDAPControl;cdecl;external libldap;
{
 * in dnssrv.c:
  }
function ldap_domain2dn(domain:Pchar; dn:PPchar):longint;cdecl;external libldap;
function ldap_dn2domain(dn:Pchar; domain:PPchar):longint;cdecl;external libldap;
function ldap_domain2hostlist(domain:Pchar; hostlist:PPchar):longint;cdecl;external libldap;
{
 * in extended.c:
  }
function ldap_extended_operation(ld:PLDAP; reqoid:Pchar; reqdata:Pberval; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl; 
           msgidp:Plongint):longint;cdecl;external libldap;
function ldap_extended_operation_s(ld:PLDAP; reqoid:Pchar; reqdata:Pberval; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl; 
           retoidp:PPchar; retdatap:PPberval):longint;cdecl;external libldap;
function ldap_parse_extended_result(ld:PLDAP; res:PLDAPMessage; retoidp:PPchar; retdatap:PPberval; freeit:longint):longint;cdecl;external libldap;
function ldap_parse_intermediate(ld:PLDAP; res:PLDAPMessage; retoidp:PPchar; retdatap:PPberval; serverctrls:PPPLDAPControl; 
           freeit:longint):longint;cdecl;external libldap;
{
 * in abandon.c:
  }
function ldap_abandon_ext(ld:PLDAP; msgid:longint; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl):longint;cdecl;external libldap;
{$if LDAP_DEPRECATED	}
{ deprecated, use ldap_abandon_ext  }

function ldap_abandon(ld:PLDAP; msgid:longint):longint;cdecl;external libldap;
{$endif}
{
 * in add.c:
  }

function ldap_add_ext(ld:PLDAP; dn:Pchar; attrs:PPLDAPMod; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl; 
           msgidp:Plongint):longint;cdecl;external libldap;
function ldap_add_ext_s(ld:PLDAP; dn:Pchar; attrs:PPLDAPMod; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl):longint;cdecl;external libldap;
{$if LDAP_DEPRECATED}
{ deprecated, use ldap_add_ext  }

function ldap_add(ld:PLDAP; dn:Pchar; attrs:PPLDAPMod):longint;cdecl;external libldap;
{ deprecated, use ldap_add_ext_s  }
function ldap_add_s(ld:PLDAP; dn:Pchar; attrs:PPLDAPMod):longint;cdecl;external libldap;
{$endif}
{
 * in sasl.c:
  }

function ldap_sasl_bind(ld:PLDAP; dn:Pchar; mechanism:Pchar; cred:Pberval; serverctrls:PPLDAPControl; 
           clientctrls:PPLDAPControl; msgidp:Plongint):longint;cdecl;external libldap;
{ Interaction flags (should be passed about in a control)
 *  Automatic (default): use defaults, prompt otherwise
 *  Interactive: prompt always
 *  Quiet: never prompt
  }
const
  LDAP_SASL_AUTOMATIC = 0;  
  LDAP_SASL_INTERACTIVE = 1;  
  LDAP_SASL_QUIET = 2;  
{
 * V3 SASL Interaction Function Callback Prototype
 *	when using Cyrus SASL, interact is pointer to sasl_interact_t
 *  should likely passed in a control (and provided controls)
  }
type
{ usually NULL  }
{ should be client controls  }
{ as obtained from ldap_result()  }
{ returned during bind processing  }

function ldap_sasl_interactive_bind(ld:PLDAP; dn:Pchar; saslMechanism:Pchar; serverControls:PPLDAPControl; clientControls:PPLDAPControl; 
           flags:dword; proc:PLDAP_SASL_INTERACT_PROC; defaults:pointer; result:PLDAPMessage; rmech:PPchar; 
           msgid:Plongint):longint;cdecl;external libldap;
{ usually NULL  }
{ should be client controls  }
function ldap_sasl_interactive_bind_s(ld:PLDAP; dn:Pchar; saslMechanism:Pchar; serverControls:PPLDAPControl; clientControls:PPLDAPControl; 
           flags:dword; proc:PLDAP_SASL_INTERACT_PROC; defaults:pointer):longint;cdecl;external libldap;
function ldap_sasl_bind_s(ld:PLDAP; dn:Pchar; mechanism:Pchar; cred:Pberval; serverctrls:PPLDAPControl; 
           clientctrls:PPLDAPControl; servercredp:PPberval):longint;cdecl;external libldap;
function ldap_parse_sasl_bind_result(ld:PLDAP; res:PLDAPMessage; servercredp:PPberval; freeit:longint):longint;cdecl;external libldap;
{$if LDAP_DEPRECATED}
{
 * in bind.c:
 *	(deprecated)
  }
{ deprecated, use ldap_sasl_bind  }

function ldap_bind(ld:PLDAP; who:Pchar; passwd:Pchar; authmethod:longint):longint;cdecl;external libldap;
{ deprecated, use ldap_sasl_bind_s  }
function ldap_bind_s(ld:PLDAP; who:Pchar; cred:Pchar; authmethod:longint):longint;cdecl;external libldap;
{
 * in sbind.c:
  }
{ deprecated, use ldap_sasl_bind  }
function ldap_simple_bind(ld:PLDAP; who:Pchar; passwd:Pchar):longint;cdecl;external libldap;
{ deprecated, use ldap_sasl_bind_s  }
function ldap_simple_bind_s(ld:PLDAP; who:Pchar; passwd:Pchar):longint;cdecl;external libldap;
{$endif}
{
 * in compare.c:
  }

function ldap_compare_ext(ld:PLDAP; dn:Pchar; attr:Pchar; bvalue:Pberval; serverctrls:PPLDAPControl; 
           clientctrls:PPLDAPControl; msgidp:Plongint):longint;cdecl;external libldap;
function ldap_compare_ext_s(ld:PLDAP; dn:Pchar; attr:Pchar; bvalue:Pberval; serverctrls:PPLDAPControl; 
           clientctrls:PPLDAPControl):longint;cdecl;external libldap;
{$if LDAP_DEPRECATED}
{ deprecated, use ldap_compare_ext  }

function ldap_compare(ld:PLDAP; dn:Pchar; attr:Pchar; value:Pchar):longint;cdecl;external libldap;
{ deprecated, use ldap_compare_ext_s  }
function ldap_compare_s(ld:PLDAP; dn:Pchar; attr:Pchar; value:Pchar):longint;cdecl;external libldap;
{$endif}
{
 * in delete.c:
  }

function ldap_delete_ext(ld:PLDAP; dn:Pchar; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl; msgidp:Plongint):longint;cdecl;external libldap;
function ldap_delete_ext_s(ld:PLDAP; dn:Pchar; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl):longint;cdecl;external libldap;
{$if LDAP_DEPRECATED}
{ deprecated, use ldap_delete_ext  }

function ldap_delete(ld:PLDAP; dn:Pchar):longint;cdecl;external libldap;
{ deprecated, use ldap_delete_ext_s  }
function ldap_delete_s(ld:PLDAP; dn:Pchar):longint;cdecl;external libldap;
{$endif}
{
 * in error.c:
  }

function ldap_parse_result(ld:PLDAP; res:PLDAPMessage; errcodep:Plongint; matcheddnp:PPchar; diagmsgp:PPchar; 
           referralsp:PPPchar; serverctrls:PPPLDAPControl; freeit:longint):longint;cdecl;external libldap;
function ldap_err2string(err:longint):Pchar;cdecl;external libldap;
{$if LDAP_DEPRECATED}
{ deprecated, use ldap_parse_result  }

function ldap_result2error(ld:PLDAP; r:PLDAPMessage; freeit:longint):longint;cdecl;external libldap;
{ deprecated, use ldap_err2string  }
procedure ldap_perror(ld:PLDAP; s:Pchar);cdecl;external libldap;
{$endif}
{
 * in modify.c:
  }

function ldap_modify_ext(ld:PLDAP; dn:Pchar; mods:PPLDAPMod; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl; 
           msgidp:Plongint):longint;cdecl;external libldap;
function ldap_modify_ext_s(ld:PLDAP; dn:Pchar; mods:PPLDAPMod; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl):longint;cdecl;external libldap;
{$if LDAP_DEPRECATED}
{ deprecated, use ldap_modify_ext  }

function ldap_modify(ld:PLDAP; dn:Pchar; mods:PPLDAPMod):longint;cdecl;external libldap;
{ deprecated, use ldap_modify_ext_s  }
function ldap_modify_s(ld:PLDAP; dn:Pchar; mods:PPLDAPMod):longint;cdecl;external libldap;
{$endif}
{
 * in modrdn.c:
  }

function ldap_rename(ld:PLDAP; dn:Pchar; newrdn:Pchar; newSuperior:Pchar; deleteoldrdn:longint; 
           sctrls:PPLDAPControl; cctrls:PPLDAPControl; msgidp:Plongint):longint;cdecl;external libldap;
function ldap_rename_s(ld:PLDAP; dn:Pchar; newrdn:Pchar; newSuperior:Pchar; deleteoldrdn:longint; 
           sctrls:PPLDAPControl; cctrls:PPLDAPControl):longint;cdecl;external libldap;
{$if LDAP_DEPRECATED}
{ deprecated, use ldap_rename  }

function ldap_rename2(ld:PLDAP; dn:Pchar; newrdn:Pchar; newSuperior:Pchar; deleteoldrdn:longint):longint;cdecl;external libldap;
{ deprecated, use ldap_rename_s  }
function ldap_rename2_s(ld:PLDAP; dn:Pchar; newrdn:Pchar; newSuperior:Pchar; deleteoldrdn:longint):longint;cdecl;external libldap;
{ deprecated, use ldap_rename  }
function ldap_modrdn(ld:PLDAP; dn:Pchar; newrdn:Pchar):longint;cdecl;external libldap;
{ deprecated, use ldap_rename_s  }
function ldap_modrdn_s(ld:PLDAP; dn:Pchar; newrdn:Pchar):longint;cdecl;external libldap;
{ deprecated, use ldap_rename  }
function ldap_modrdn2(ld:PLDAP; dn:Pchar; newrdn:Pchar; deleteoldrdn:longint):longint;cdecl;external libldap;
{ deprecated, use ldap_rename_s  }
function ldap_modrdn2_s(ld:PLDAP; dn:Pchar; newrdn:Pchar; deleteoldrdn:longint):longint;cdecl;external libldap;
{$endif}
{
 * in open.c:
  }
{$if LDAP_DEPRECATED}
{ deprecated, use ldap_create or ldap_initialize  }

function ldap_init(host:Pchar; port:longint):PLDAP;cdecl;external libldap;
{ deprecated, use ldap_create or ldap_initialize  }
function ldap_open(host:Pchar; port:longint):PLDAP;cdecl;external libldap;
{$endif}

function ldap_create(ldp:PPLDAP):longint;cdecl;external libldap;
function ldap_initialize(ldp:PPLDAP; url:Pchar):longint;cdecl;external libldap;
function ldap_dup(old:PLDAP):PLDAP;cdecl;external libldap;
function ldap_connect(ld:PLDAP):longint;cdecl;external libldap;
{
 * in tls.c
  }
function ldap_tls_inplace(ld:PLDAP):longint;cdecl;external libldap;
function ldap_start_tls(ld:PLDAP; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl; msgidp:Plongint):longint;cdecl;external libldap;
function ldap_install_tls(ld:PLDAP):longint;cdecl;external libldap;
function ldap_start_tls_s(ld:PLDAP; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl):longint;cdecl;external libldap;
{
 * in messages.c:
  }
function ldap_first_message(ld:PLDAP; chain:PLDAPMessage):PLDAPMessage;cdecl;external libldap;
function ldap_next_message(ld:PLDAP; msg:PLDAPMessage):PLDAPMessage;cdecl;external libldap;
function ldap_count_messages(ld:PLDAP; chain:PLDAPMessage):longint;cdecl;external libldap;
{
 * in references.c:
  }
function ldap_first_reference(ld:PLDAP; chain:PLDAPMessage):PLDAPMessage;cdecl;external libldap;
function ldap_next_reference(ld:PLDAP; ref:PLDAPMessage):PLDAPMessage;cdecl;external libldap;
function ldap_count_references(ld:PLDAP; chain:PLDAPMessage):longint;cdecl;external libldap;
function ldap_parse_reference(ld:PLDAP; ref:PLDAPMessage; referralsp:PPPchar; serverctrls:PPPLDAPControl; freeit:longint):longint;cdecl;external libldap;
{
 * in getentry.c:
  }
function ldap_first_entry(ld:PLDAP; chain:PLDAPMessage):PLDAPMessage;cdecl;external libldap;
function ldap_next_entry(ld:PLDAP; entry:PLDAPMessage):PLDAPMessage;cdecl;external libldap;
function ldap_count_entries(ld:PLDAP; chain:PLDAPMessage):longint;cdecl;external libldap;
function ldap_get_entry_controls(ld:PLDAP; entry:PLDAPMessage; serverctrls:PPPLDAPControl):longint;cdecl;external libldap;
{
 * in addentry.c
  }
function ldap_delete_result_entry(list:PPLDAPMessage; e:PLDAPMessage):PLDAPMessage;cdecl;external libldap;
procedure ldap_add_result_entry(list:PPLDAPMessage; e:PLDAPMessage);cdecl;external libldap;
{
 * in getdn.c
  }
function ldap_get_dn(ld:PLDAP; entry:PLDAPMessage):Pchar;cdecl;external libldap;
type
  Pldap_ava = ^Tldap_ava;
  Tldap_ava = record
      la_attr : Tberval;
      la_value : Tberval;
      la_flags : dword;
      la_private : pointer;
    end;
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
{ DN formats  }

const
  LDAP_DN_FORMAT_LDAP = $0000;  
  LDAP_DN_FORMAT_LDAPV3 = $0010;  
  LDAP_DN_FORMAT_LDAPV2 = $0020;  
  LDAP_DN_FORMAT_DCE = $0030;  
{ dn2str only  }
  LDAP_DN_FORMAT_UFN = $0040;  
{ dn2str only  }
  LDAP_DN_FORMAT_AD_CANONICAL = $0050;  
{ for testing only  }
  LDAP_DN_FORMAT_LBER = $00F0;  
  LDAP_DN_FORMAT_MASK = $00F0;  
{ DN flags  }
  LDAP_DN_PRETTY = $0100;  
  LDAP_DN_SKIP = $0200;  
  LDAP_DN_P_NOLEADTRAILSPACES = $1000;  
  LDAP_DN_P_NOSPACEAFTERRDN = $2000;  
  LDAP_DN_PEDANTIC = $F000;  

procedure ldap_rdnfree(rdn:TLDAPRDN);cdecl;external libldap;
procedure ldap_dnfree(dn:TLDAPDN);cdecl;external libldap;
function ldap_bv2dn(bv:Pberval; dn:PLDAPDN; flags:dword):longint;cdecl;external libldap;
function ldap_str2dn(str:Pchar; dn:PLDAPDN; flags:dword):longint;cdecl;external libldap;
function ldap_dn2bv(dn:TLDAPDN; bv:Pberval; flags:dword):longint;cdecl;external libldap;
function ldap_dn2str(dn:TLDAPDN; str:PPchar; flags:dword):longint;cdecl;external libldap;
function ldap_bv2rdn(bv:Pberval; rdn:PLDAPRDN; next:PPchar; flags:dword):longint;cdecl;external libldap;
function ldap_str2rdn(str:Pchar; rdn:PLDAPRDN; next:PPchar; flags:dword):longint;cdecl;external libldap;
function ldap_rdn2bv(rdn:TLDAPRDN; bv:Pberval; flags:dword):longint;cdecl;external libldap;
function ldap_rdn2str(rdn:TLDAPRDN; str:PPchar; flags:dword):longint;cdecl;external libldap;
function ldap_dn_normalize(in:Pchar; iflags:dword; out:PPchar; oflags:dword):longint;cdecl;external libldap;
{ deprecated, use ldap_str2dn/dn2str  }
function ldap_dn2ufn(dn:Pchar):Pchar;cdecl;external libldap;
{ deprecated, ldap_str2dn  }
function ldap_explode_dn(dn:Pchar; notypes:longint):^Pchar;cdecl;external libldap;
{ deprecated, ldap_str2rdn  }
function ldap_explode_rdn(rdn:Pchar; notypes:longint):^Pchar;cdecl;external libldap;
{ xxxxxxxxxxxxxxxxxxxxxxxxx }
type

  TLDAPDN_rewrite_func = function (dn:TLDAPDN; flags:dword; ctx:pointer):longint;cdecl;

function ldap_X509dn2bv(x509_name:pointer; dn:Pberval; func:PLDAPDN_rewrite_func; flags:dword):longint;cdecl;external libldap;
{ deprecated, ldap_str2dn/dn2str  }
function ldap_dn2dcedn(dn:Pchar):Pchar;cdecl;external libldap;
{ deprecated, ldap_str2dn/dn2str  }
function ldap_dcedn2dn(dce:Pchar):Pchar;cdecl;external libldap;
{ deprecated, ldap_str2dn/dn2str  }
function ldap_dn2ad_canonical(dn:Pchar):Pchar;cdecl;external libldap;
function ldap_get_dn_ber(ld:PLDAP; e:PLDAPMessage; berout:PPBerElement; dn:Pberval):longint;cdecl;external libldap;
function ldap_get_attribute_ber(ld:PLDAP; e:PLDAPMessage; ber:PBerElement; attr:Pberval; vals:PPberval):longint;cdecl;external libldap;
{
 * in getattr.c
  }
function ldap_first_attribute(ld:PLDAP; entry:PLDAPMessage; ber:PPBerElement):Pchar;cdecl;external libldap;
function ldap_next_attribute(ld:PLDAP; entry:PLDAPMessage; ber:PBerElement):Pchar;cdecl;external libldap;
{
 * in getvalues.c
  }
function ldap_get_values_len(ld:PLDAP; entry:PLDAPMessage; target:Pchar):^Pberval;cdecl;external libldap;
function ldap_count_values_len(vals:PPberval):longint;cdecl;external libldap;
procedure ldap_value_free_len(vals:PPberval);cdecl;external libldap;
{$if LDAP_DEPRECATED}
{ deprecated, use ldap_get_values_len  }

function ldap_get_values(ld:PLDAP; entry:PLDAPMessage; target:Pchar):^Pchar;cdecl;external libldap;
{ deprecated, use ldap_count_values_len  }
function ldap_count_values(vals:PPchar):longint;cdecl;external libldap;
{ deprecated, use ldap_value_free_len  }
procedure ldap_value_free(vals:PPchar);cdecl;external libldap;
{$endif}
{
 * in result.c:
  }

function ldap_result(ld:PLDAP; msgid:longint; all:longint; timeout:Ptimeval; result:PPLDAPMessage):longint;cdecl;external libldap;
function ldap_msgtype(lm:PLDAPMessage):longint;cdecl;external libldap;
function ldap_msgid(lm:PLDAPMessage):longint;cdecl;external libldap;
function ldap_msgfree(lm:PLDAPMessage):longint;cdecl;external libldap;
function ldap_msgdelete(ld:PLDAP; msgid:longint):longint;cdecl;external libldap;
{
 * in search.c:
  }
function ldap_bv2escaped_filter_value(in:Pberval; out:Pberval):longint;cdecl;external libldap;
function ldap_search_ext(ld:PLDAP; base:Pchar; scope:longint; filter:Pchar; attrs:PPchar; 
           attrsonly:longint; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl; timeout:Ptimeval; sizelimit:longint; 
           msgidp:Plongint):longint;cdecl;external libldap;
function ldap_search_ext_s(ld:PLDAP; base:Pchar; scope:longint; filter:Pchar; attrs:PPchar; 
           attrsonly:longint; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl; timeout:Ptimeval; sizelimit:longint; 
           res:PPLDAPMessage):longint;cdecl;external libldap;
{$if LDAP_DEPRECATED}
{ deprecated, use ldap_search_ext  }

function ldap_search(ld:PLDAP; base:Pchar; scope:longint; filter:Pchar; attrs:PPchar; 
           attrsonly:longint):longint;cdecl;external libldap;
{ deprecated, use ldap_search_ext_s  }
function ldap_search_s(ld:PLDAP; base:Pchar; scope:longint; filter:Pchar; attrs:PPchar; 
           attrsonly:longint; res:PPLDAPMessage):longint;cdecl;external libldap;
{ deprecated, use ldap_search_ext_s  }
function ldap_search_st(ld:PLDAP; base:Pchar; scope:longint; filter:Pchar; attrs:PPchar; 
           attrsonly:longint; timeout:Ptimeval; res:PPLDAPMessage):longint;cdecl;external libldap;
{$endif}
{
 * in unbind.c
  }

function ldap_unbind_ext(ld:PLDAP; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl):longint;cdecl;external libldap;
function ldap_unbind_ext_s(ld:PLDAP; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl):longint;cdecl;external libldap;
function ldap_destroy(ld:PLDAP):longint;cdecl;external libldap;
{$if LDAP_DEPRECATED}
{ deprecated, use ldap_unbind_ext  }

function ldap_unbind(ld:PLDAP):longint;cdecl;external libldap;
{ deprecated, use ldap_unbind_ext_s  }
function ldap_unbind_s(ld:PLDAP):longint;cdecl;external libldap;
{$endif}
{
 * in filter.c
  }

function ldap_put_vrFilter(ber:PBerElement; vrf:Pchar):longint;cdecl;external libldap;
{
 * in free.c
  }
function ldap_memalloc(s:Tber_len_t):pointer;cdecl;external libldap;
function ldap_memrealloc(p:pointer; s:Tber_len_t):pointer;cdecl;external libldap;
function ldap_memcalloc(n:Tber_len_t; s:Tber_len_t):pointer;cdecl;external libldap;
procedure ldap_memfree(p:pointer);cdecl;external libldap;
procedure ldap_memvfree(v:Ppointer);cdecl;external libldap;
function ldap_strdup(para1:Pchar):Pchar;cdecl;external libldap;
procedure ldap_mods_free(mods:PPLDAPMod; freemods:longint);cdecl;external libldap;
{$if LDAP_DEPRECATED}
{
 * in sort.c (deprecated, use custom code instead)
  }
{ deprecated  }
type
{ deprecated  }
{ deprecated  }

function ldap_sort_entries(ld:PLDAP; chain:PPLDAPMessage; attr:Pchar; cmp:PLDAP_SORT_AD_CMP_PROC):longint;cdecl;external libldap;
{ deprecated  }
function ldap_sort_values(ld:PLDAP; vals:PPchar; cmp:PLDAP_SORT_AV_CMP_PROC):longint;cdecl;external libldap;
{ deprecated  }
function ldap_sort_strcasecmp(a:pointer; b:pointer):longint;cdecl;external libldap;
{$endif}
{
 * in url.c
  }

function ldap_is_ldap_url(url:Pchar):longint;cdecl;external libldap;
function ldap_is_ldaps_url(url:Pchar):longint;cdecl;external libldap;
function ldap_is_ldapi_url(url:Pchar):longint;cdecl;external libldap;
{$ifdef LDAP_CONNECTIONLESS}
function ldap_is_ldapc_url(url:Pchar):longint;cdecl;external libldap;
{$endif}

function ldap_url_parse(url:Pchar; ludpp:PPLDAPURLDesc):longint;cdecl;external libldap;
function ldap_url_desc2str(ludp:PLDAPURLDesc):Pchar;cdecl;external libldap;
procedure ldap_free_urldesc(ludp:PLDAPURLDesc);cdecl;external libldap;
{
 * LDAP Cancel Extended Operation <draft-zeilenga-ldap-cancel-xx.txt>
 *  in cancel.c
  }
const
  LDAP_API_FEATURE_CANCEL = 1000;  

function ldap_cancel(ld:PLDAP; cancelid:longint; sctrls:PPLDAPControl; cctrls:PPLDAPControl; msgidp:Plongint):longint;cdecl;external libldap;
function ldap_cancel_s(ld:PLDAP; cancelid:longint; sctrl:PPLDAPControl; cctrl:PPLDAPControl):longint;cdecl;external libldap;
{
 * LDAP Turn Extended Operation <draft-zeilenga-ldap-turn-xx.txt>
 *  in turn.c
  }
const
  LDAP_API_FEATURE_TURN = 1000;  

function ldap_turn(ld:PLDAP; mutual:longint; identifier:Pchar; sctrls:PPLDAPControl; cctrls:PPLDAPControl; 
           msgidp:Plongint):longint;cdecl;external libldap;
function ldap_turn_s(ld:PLDAP; mutual:longint; identifier:Pchar; sctrl:PPLDAPControl; cctrl:PPLDAPControl):longint;cdecl;external libldap;
{
 * LDAP Paged Results
 *	in pagectrl.c
  }
const
  LDAP_API_FEATURE_PAGED_RESULTS = 2000;  

function ldap_create_page_control_value(ld:PLDAP; pagesize:Tber_int_t; cookie:Pberval; value:Pberval):longint;cdecl;external libldap;
function ldap_create_page_control(ld:PLDAP; pagesize:Tber_int_t; cookie:Pberval; iscritical:longint; ctrlp:PPLDAPControl):longint;cdecl;external libldap;
{$if LDAP_DEPRECATED}
{ deprecated, use ldap_parse_pageresponse_control  }

function ldap_parse_page_control(ld:PLDAP; ctrls:PPLDAPControl; count:Pber_int_t; cookie:PPberval):longint;cdecl;external libldap;
{$endif}

function ldap_parse_pageresponse_control(ld:PLDAP; ctrl:PLDAPControl; count:Pber_int_t; cookie:Pberval):longint;cdecl;external libldap;
{
 * LDAP Server Side Sort
 *	in sortctrl.c
  }
const
  LDAP_API_FEATURE_SERVER_SIDE_SORT = 2000;  
{ structure for a sort-key  }
type
  Pldapsortkey = ^Tldapsortkey;
  Tldapsortkey = record
      attributeType : Pchar;
      orderingRule : Pchar;
      reverseOrder : longint;
    end;

function ldap_create_sort_keylist(sortKeyList:PPPLDAPSortKey; keyString:Pchar):longint;cdecl;external libldap;
procedure ldap_free_sort_keylist(sortkeylist:PPLDAPSortKey);cdecl;external libldap;
function ldap_create_sort_control_value(ld:PLDAP; keyList:PPLDAPSortKey; value:Pberval):longint;cdecl;external libldap;
function ldap_create_sort_control(ld:PLDAP; keyList:PPLDAPSortKey; iscritical:longint; ctrlp:PPLDAPControl):longint;cdecl;external libldap;
function ldap_parse_sortresponse_control(ld:PLDAP; ctrl:PLDAPControl; result:Pber_int_t; attribute:PPchar):longint;cdecl;external libldap;
{
 * LDAP Virtual List View
 *	in vlvctrl.c
  }
const
  LDAP_API_FEATURE_VIRTUAL_LIST_VIEW = 2000;  
{ structure for virtual list  }
type
  Pldapvlvinfo = ^Tldapvlvinfo;
  Tldapvlvinfo = record
      ldvlv_version : Tber_int_t;
      ldvlv_before_count : Tber_int_t;
      ldvlv_after_count : Tber_int_t;
      ldvlv_offset : Tber_int_t;
      ldvlv_count : Tber_int_t;
      ldvlv_attrvalue : Pberval;
      ldvlv_context : Pberval;
      ldvlv_extradata : pointer;
    end;

function ldap_create_vlv_control_value(ld:PLDAP; ldvlistp:PLDAPVLVInfo; value:Pberval):longint;cdecl;external libldap;
function ldap_create_vlv_control(ld:PLDAP; ldvlistp:PLDAPVLVInfo; ctrlp:PPLDAPControl):longint;cdecl;external libldap;
function ldap_parse_vlvresponse_control(ld:PLDAP; ctrls:PLDAPControl; target_posp:Pber_int_t; list_countp:Pber_int_t; contextp:PPberval; 
           errcodep:Plongint):longint;cdecl;external libldap;
{
 * LDAP Verify Credentials
  }
const
  LDAP_API_FEATURE_VERIFY_CREDENTIALS = 1000;  

function ldap_verify_credentials(ld:PLDAP; cookie:Pberval; dn:Pchar; mechanism:Pchar; cred:Pberval; 
           ctrls:PPLDAPControl; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl; msgidp:Plongint):longint;cdecl;external libldap;
function ldap_verify_credentials_s(ld:PLDAP; cookie:Pberval; dn:Pchar; mechanism:Pchar; cred:Pberval; 
           vcictrls:PPLDAPControl; serverctrls:PPLDAPControl; clientctrls:PPLDAPControl; code:Plongint; diagmsgp:PPchar; 
           scookie:PPberval; servercredp:PPberval; vcoctrls:PPPLDAPControl):longint;cdecl;external libldap;
function ldap_parse_verify_credentials(ld:PLDAP; res:PLDAPMessage; code:Plongint; diagmsgp:PPchar; cookie:PPberval; 
           servercredp:PPberval; vcctrls:PPPLDAPControl):longint;cdecl;external libldap;
{ not yet implemented  }
{ #define LDAP_API_FEATURE_VERIFY_CREDENTIALS_INTERACTIVE 1000  }
{$ifdef LDAP_API_FEATURE_VERIFY_CREDENTIALS_INTERACTIVE}
{ usually NULL  }
{ should be client controls  }
{ as obtained from ldap_result()  }
{ returned during bind processing  }
function ldap_verify_credentials_interactive(ld:PLDAP; dn:Pchar; saslMechanism:Pchar; vcControls:PPLDAPControl; serverControls:PPLDAPControl; 
           clientControls:PPLDAPControl; flags:dword; proc:PLDAP_SASL_INTERACT_PROC; defaults:pointer; context:pointer; 
           result:PLDAPMessage; rmech:PPchar; msgid:Plongint):longint;cdecl;external libldap;
{$endif}
{
 * LDAP Who Am I?
 *	in whoami.c
  }

const
  LDAP_API_FEATURE_WHOAMI = 1000;  

function ldap_parse_whoami(ld:PLDAP; res:PLDAPMessage; authzid:PPberval):longint;cdecl;external libldap;
function ldap_whoami(ld:PLDAP; sctrls:PPLDAPControl; cctrls:PPLDAPControl; msgidp:Plongint):longint;cdecl;external libldap;
function ldap_whoami_s(ld:PLDAP; authzid:PPberval; sctrls:PPLDAPControl; cctrls:PPLDAPControl):longint;cdecl;external libldap;
{
 * LDAP Password Modify
 *	in passwd.c
  }
const
  LDAP_API_FEATURE_PASSWD_MODIFY = 1000;  

function ldap_parse_passwd(ld:PLDAP; res:PLDAPMessage; newpasswd:Pberval):longint;cdecl;external libldap;
function ldap_passwd(ld:PLDAP; user:Pberval; oldpw:Pberval; newpw:Pberval; sctrls:PPLDAPControl; 
           cctrls:PPLDAPControl; msgidp:Plongint):longint;cdecl;external libldap;
function ldap_passwd_s(ld:PLDAP; user:Pberval; oldpw:Pberval; newpw:Pberval; newpasswd:Pberval; 
           sctrls:PPLDAPControl; cctrls:PPLDAPControl):longint;cdecl;external libldap;
{$ifdef LDAP_CONTROL_PASSWORDPOLICYREQUEST}
{
 * LDAP Password Policy controls
 *	in ppolicy.c
  }
const
  LDAP_API_FEATURE_PASSWORD_POLICY = 1000;  
type
  Ppasspolicyerror_enum = ^Tpasspolicyerror_enum;
  Tpasspolicyerror_enum =  Longint;
  Const
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
;
  TLDAPPasswordPolicyError = Tpasspolicyerror_enum;
  PLDAPPasswordPolicyError = ^TLDAPPasswordPolicyError;

function ldap_create_passwordpolicy_control(ld:PLDAP; ctrlp:PPLDAPControl):longint;cdecl;external libldap;
function ldap_parse_passwordpolicy_control(ld:PLDAP; ctrl:PLDAPControl; expirep:Pber_int_t; gracep:Pber_int_t; errorp:PLDAPPasswordPolicyError):longint;cdecl;external libldap;
function ldap_passwordpolicy_err2txt(para1:TLDAPPasswordPolicyError):Pchar;cdecl;external libldap;
{$endif}
{ LDAP_CONTROL_PASSWORDPOLICYREQUEST  }

function ldap_parse_password_expiring_control(ld:PLDAP; ctrl:PLDAPControl; secondsp:Plongint):longint;cdecl;external libldap;
{
 * LDAP Dynamic Directory Services Refresh -- RFC 2589
 *	in dds.c
  }
const
  LDAP_API_FEATURE_REFRESH = 1000;  

function ldap_parse_refresh(ld:PLDAP; res:PLDAPMessage; newttl:Pber_int_t):longint;cdecl;external libldap;
function ldap_refresh(ld:PLDAP; dn:Pberval; ttl:Tber_int_t; sctrls:PPLDAPControl; cctrls:PPLDAPControl; 
           msgidp:Plongint):longint;cdecl;external libldap;
function ldap_refresh_s(ld:PLDAP; dn:Pberval; ttl:Tber_int_t; newttl:Pber_int_t; sctrls:PPLDAPControl; 
           cctrls:PPLDAPControl):longint;cdecl;external libldap;
{
 * LDAP Transactions
  }
function ldap_txn_start(ld:PLDAP; sctrls:PPLDAPControl; cctrls:PPLDAPControl; msgidp:Plongint):longint;cdecl;external libldap;
function ldap_txn_start_s(ld:PLDAP; sctrl:PPLDAPControl; cctrl:PPLDAPControl; rettxnid:PPberval):longint;cdecl;external libldap;
function ldap_txn_end(ld:PLDAP; commit:longint; txnid:Pberval; sctrls:PPLDAPControl; cctrls:PPLDAPControl; 
           msgidp:Plongint):longint;cdecl;external libldap;
function ldap_txn_end_s(ld:PLDAP; commit:longint; txnid:Pberval; sctrl:PPLDAPControl; cctrl:PPLDAPControl; 
           retidp:Plongint):longint;cdecl;external libldap;
{
 * in ldap_sync.c
  }
{
 * initialize the persistent search structure
  }
function ldap_sync_initialize(ls:Pldap_sync_t):Pldap_sync_t;cdecl;external libldap;
{
 * destroy the persistent search structure
  }
procedure ldap_sync_destroy(ls:Pldap_sync_t; freeit:longint);cdecl;external libldap;
{
 * initialize a refreshOnly sync
  }
function ldap_sync_init(ls:Pldap_sync_t; mode:longint):longint;cdecl;external libldap;
{
 * initialize a refreshOnly sync
  }
function ldap_sync_init_refresh_only(ls:Pldap_sync_t):longint;cdecl;external libldap;
{
 * initialize a refreshAndPersist sync
  }
function ldap_sync_init_refresh_and_persist(ls:Pldap_sync_t):longint;cdecl;external libldap;
{
 * poll for new responses
  }
function ldap_sync_poll(ls:Pldap_sync_t):longint;cdecl;external libldap;
{$ifdef LDAP_CONTROL_X_SESSION_TRACKING}
{
 * in stctrl.c
  }
function ldap_create_session_tracking_value(ld:PLDAP; sessionSourceIp:Pchar; sessionSourceName:Pchar; formatOID:Pchar; sessionTrackingIdentifier:Pberval; 
           value:Pberval):longint;cdecl;external libldap;
function ldap_create_session_tracking_control(ld:PLDAP; sessionSourceIp:Pchar; sessionSourceName:Pchar; formatOID:Pchar; sessionTrackingIdentifier:Pberval; 
           ctrlp:PPLDAPControl):longint;cdecl;external libldap;
function ldap_parse_session_tracking_control(ld:PLDAP; ctrl:PLDAPControl; ip:Pberval; name:Pberval; oid:Pberval; 
           id:Pberval):longint;cdecl;external libldap;
{$endif}
{ LDAP_CONTROL_X_SESSION_TRACKING  }
{
 * in msctrl.c
  }
{$ifdef LDAP_CONTROL_X_DIRSYNC}

function ldap_create_dirsync_value(ld:PLDAP; flags:longint; maxAttrCount:longint; cookie:Pberval; value:Pberval):longint;cdecl;external libldap;
function ldap_create_dirsync_control(ld:PLDAP; flags:longint; maxAttrCount:longint; cookie:Pberval; ctrlp:PPLDAPControl):longint;cdecl;external libldap;
function ldap_parse_dirsync_control(ld:PLDAP; ctrl:PLDAPControl; continueFlag:Plongint; cookie:Pberval):longint;cdecl;external libldap;
{$endif}
{ LDAP_CONTROL_X_DIRSYNC  }
{$ifdef LDAP_CONTROL_X_EXTENDED_DN}

function ldap_create_extended_dn_value(ld:PLDAP; flag:longint; value:Pberval):longint;cdecl;external libldap;
function ldap_create_extended_dn_control(ld:PLDAP; flag:longint; ctrlp:PPLDAPControl):longint;cdecl;external libldap;
{$endif}
{ LDAP_CONTROL_X_EXTENDED_DN  }
{$ifdef LDAP_CONTROL_X_SHOW_DELETED}

function ldap_create_show_deleted_control(ld:PLDAP; ctrlp:PPLDAPControl):longint;cdecl;external libldap;
{$endif}
{ LDAP_CONTROL_X_SHOW_DELETED  }
{$ifdef LDAP_CONTROL_X_SERVER_NOTIFICATION}

function ldap_create_server_notification_control(ld:PLDAP; ctrlp:PPLDAPControl):longint;cdecl;external libldap;
{$endif}
{ LDAP_CONTROL_X_SERVER_NOTIFICATION  }
{
 * in assertion.c
  }

function ldap_create_assertion_control_value(ld:PLDAP; assertion:Pchar; value:Pberval):longint;cdecl;external libldap;
function ldap_create_assertion_control(ld:PLDAP; filter:Pchar; iscritical:longint; ctrlp:PPLDAPControl):longint;cdecl;external libldap;
{
 * in deref.c
  }
type
  PLDAPDerefSpec = ^TLDAPDerefSpec;
  TLDAPDerefSpec = record
      derefAttr : Pchar;
      attributes : ^Pchar;
    end;

  PLDAPDerefVal = ^TLDAPDerefVal;
  TLDAPDerefVal = record
      _type : Pchar;
      vals : TBerVarray;
      next : PLDAPDerefVal;
    end;

  PLDAPDerefRes = ^TLDAPDerefRes;
  TLDAPDerefRes = record
      derefAttr : Pchar;
      derefVal : Tberval;
      attrVals : PLDAPDerefVal;
      next : PLDAPDerefRes;
    end;

function ldap_create_deref_control_value(ld:PLDAP; ds:PLDAPDerefSpec; value:Pberval):longint;cdecl;external libldap;
function ldap_create_deref_control(ld:PLDAP; ds:PLDAPDerefSpec; iscritical:longint; ctrlp:PPLDAPControl):longint;cdecl;external libldap;
procedure ldap_derefresponse_free(dr:PLDAPDerefRes);cdecl;external libldap;
function ldap_parse_derefresponse_control(ld:PLDAP; ctrl:PLDAPControl; drp:PPLDAPDerefRes):longint;cdecl;external libldap;
function ldap_parse_deref_control(ld:PLDAP; ctrls:PPLDAPControl; drp:PPLDAPDerefRes):longint;cdecl;external libldap;
{
 * in psearch.c
  }
function ldap_create_persistentsearch_control_value(ld:PLDAP; changetypes:longint; changesonly:longint; return_echg_ctls:longint; value:Pberval):longint;cdecl;external libldap;
function ldap_create_persistentsearch_control(ld:PLDAP; changetypes:longint; changesonly:longint; return_echg_ctls:longint; isCritical:longint; 
           ctrlp:PPLDAPControl):longint;cdecl;external libldap;
function ldap_parse_entrychange_control(ld:PLDAP; ctrl:PLDAPControl; chgtypep:Plongint; prevdnp:Pberval; chgnumpresentp:Plongint; 
           chgnump:Plongint):longint;cdecl;external libldap;
{ in account_usability.c  }
function ldap_create_accountusability_control(ld:PLDAP; ctrlp:PPLDAPControl):longint;cdecl;external libldap;
type
  PLDAPAccountUsabilityMoreInfo = ^TLDAPAccountUsabilityMoreInfo;
  TLDAPAccountUsabilityMoreInfo = record
      inactive : Tber_int_t;
      reset : Tber_int_t;
      expired : Tber_int_t;
      remaining_grace : Tber_int_t;
      seconds_before_unlock : Tber_int_t;
    end;

  PLDAPAccountUsability = ^TLDAPAccountUsability;
  TLDAPAccountUsability = record
      case longint of
        0 : ( seconds_remaining : Tber_int_t );
        1 : ( more_info : TLDAPAccountUsabilityMoreInfo );
      end;

function ldap_parse_accountusability_control(ld:PLDAP; ctrl:PLDAPControl; availablep:Plongint; usabilityp:PLDAPAccountUsability):longint;cdecl;external libldap;
{
 * high level LDIF to LDAP structure support
  }
{ if changetype missing, assume LDAP_ADD  }
const
  LDIF_DEFAULT_ADD = $01;  
{ ignore changetypes other than add  }
  LDIF_ENTRIES_ONLY = $02;  
{ ignore control specifications  }
  LDIF_NO_CONTROLS = $04;  
{ no changetypes, assume LDAP_MODIFY  }
  LDIF_MODS_ONLY = $08;  
{ dn is not present  }
  LDIF_NO_DN = $10;  
{ type of operation - LDAP_REQ_MODIFY, LDAP_REQ_ADD, etc.  }
{ DN of operation  }
{ controls specified for operation  }
{ some ops such as LDAP_REQ_DELETE require only a DN  }
{ other ops require different data - the ldif_ops union
	   is used to specify the data for each type of operation  }
{ list of mods for LDAP_REQ_MODIFY, LDAP_REQ_ADD  }
{ LDAP_REQ_MODDN, LDAP_REQ_MODRDN, LDAP_REQ_RENAME  }
{ LDAP_REQ_MODDN, LDAP_REQ_MODRDN, LDAP_REQ_RENAME  }
{ LDAP_REQ_MODDN, LDAP_REQ_MODRDN, LDAP_REQ_RENAME  }
{ rename/moddn/modrdn  }
{ the following are for future support  }
{ LDAP_REQ_EXTENDED  }
{ LDAP_REQ_EXTENDED  }
{ extended operation  }
{ LDAP_REQ_COMPARE  }
{ LDAP_REQ_COMPARE  }
{ compare operation  }
{ PRIVATE STUFF - DO NOT TOUCH  }
{ for efficiency, the implementation allocates memory  }
{ in large blobs, and makes the above fields point to  }
{ locations inside those blobs - one consequence is that  }
{ you cannot simply free the above allocated fields, nor  }
{ assign them to be owned by another memory context which  }
{ might free them (unless providing your own mem ctx)  }
{ we use the fields below to keep track of those blobs  }
{ so we that we can free them later  }
{ the memory context or NULL  }
type
  Pldifrecord = ^Tldifrecord;
  Tldifrecord = record
      lr_op : Tber_tag_t;
      lr_dn : Tberval;
      lr_ctrls : ^PLDAPControl;
      ldif_ops : record
          case longint of
            0 : ( lr_mods : ^PLDAPMod );
            1 : ( ldif_op_rename : record
                lr_newrdn : Tberval;
                lr_newsuperior : Tberval;
                lr_deleteoldrdn : longint;
              end );
            2 : ( ldif_op_ext : record
                lr_extop_oid : Tberval;
                lr_extop_data : Tberval;
              end );
            3 : ( ldif_op_cmp : record
                lr_cmp_attr : Tberval;
                lr_cmp_bvalue : Tberval;
              end );
          end;
      lr_ctx : pointer;
      lr_lines : longint;
      lr_lm : PLDAPMod;
      lr_mops : Pbyte;
      lr_freeval : Pchar;
      lr_vals : Pberval;
      lr_btype : Pberval;
    end;
{ free internal fields - does not free the LDIFRecord  }

procedure ldap_ldif_record_done(lr:PLDIFRecord);cdecl;external libldap;
function ldap_parse_ldif_record(rbuf:Pberval; linenum:dword; lr:PLDIFRecord; errstr:Pchar; flags:dword):longint;cdecl;external libldap;
{$endif}
{ _LDAP_H  }

// === Konventiert am: 10-12-25 16:58:16 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LDAP_OPT_X_TLS_PROTOCOL(maj,min : longint) : longint;
begin
  LDAP_OPT_X_TLS_PROTOCOL:=(maj shl 8)+min;
end;

{ was #define dname def_expr }
function LDAP_OPT_ON : pointer;
  begin
    LDAP_OPT_ON:=pointer(@(ber_pvt_opt_on));
  end;

{ was #define dname def_expr }
function LDAP_OPT_OFF : pointer;
  begin
    LDAP_OPT_OFF:=pointer(0);
  end;

{ was #define dname def_expr }
function LDAP_TAG_SYNC_NEW_COOKIE : Tber_tag_t;
  begin
    LDAP_TAG_SYNC_NEW_COOKIE:=Tber_tag_t($80);
  end;

{ was #define dname def_expr }
function LDAP_TAG_SYNC_REFRESH_DELETE : Tber_tag_t;
  begin
    LDAP_TAG_SYNC_REFRESH_DELETE:=Tber_tag_t($a1);
  end;

{ was #define dname def_expr }
function LDAP_TAG_SYNC_REFRESH_PRESENT : Tber_tag_t;
  begin
    LDAP_TAG_SYNC_REFRESH_PRESENT:=Tber_tag_t($a2);
  end;

{ was #define dname def_expr }
function LDAP_TAG_SYNC_ID_SET : Tber_tag_t;
  begin
    LDAP_TAG_SYNC_ID_SET:=Tber_tag_t($a3);
  end;

{ was #define dname def_expr }
function LDAP_TAG_SYNC_COOKIE : Tber_tag_t;
  begin
    LDAP_TAG_SYNC_COOKIE:=Tber_tag_t($04);
  end;

{ was #define dname def_expr }
function LDAP_TAG_REFRESHDELETES : Tber_tag_t;
  begin
    LDAP_TAG_REFRESHDELETES:=Tber_tag_t($01);
  end;

{ was #define dname def_expr }
function LDAP_TAG_REFRESHDONE : Tber_tag_t;
  begin
    LDAP_TAG_REFRESHDONE:=Tber_tag_t($01);
  end;

{ was #define dname def_expr }
function LDAP_TAG_RELOAD_HINT : Tber_tag_t;
  begin
    LDAP_TAG_RELOAD_HINT:=Tber_tag_t($01);
  end;

{ was #define dname def_expr }
function LDAP_TAG_X_ACCOUNT_USABILITY_AVAILABLE : Tber_tag_t;
  begin
    LDAP_TAG_X_ACCOUNT_USABILITY_AVAILABLE:=Tber_tag_t($80);
  end;

{ was #define dname def_expr }
function LDAP_TAG_X_ACCOUNT_USABILITY_NOT_AVAILABLE : Tber_tag_t;
  begin
    LDAP_TAG_X_ACCOUNT_USABILITY_NOT_AVAILABLE:=Tber_tag_t($A1);
  end;

{ was #define dname def_expr }
function LDAP_TAG_X_ACCOUNT_USABILITY_INACTIVE : Tber_tag_t;
  begin
    LDAP_TAG_X_ACCOUNT_USABILITY_INACTIVE:=Tber_tag_t($80);
  end;

{ was #define dname def_expr }
function LDAP_TAG_X_ACCOUNT_USABILITY_RESET : Tber_tag_t;
  begin
    LDAP_TAG_X_ACCOUNT_USABILITY_RESET:=Tber_tag_t($81);
  end;

{ was #define dname def_expr }
function LDAP_TAG_X_ACCOUNT_USABILITY_EXPIRED : Tber_tag_t;
  begin
    LDAP_TAG_X_ACCOUNT_USABILITY_EXPIRED:=Tber_tag_t($82);
  end;

{ was #define dname def_expr }
function LDAP_TAG_X_ACCOUNT_USABILITY_REMAINING_GRACE : Tber_tag_t;
  begin
    LDAP_TAG_X_ACCOUNT_USABILITY_REMAINING_GRACE:=Tber_tag_t($83);
  end;

{ was #define dname def_expr }
function LDAP_TAG_X_ACCOUNT_USABILITY_UNTIL_UNLOCK : Tber_tag_t;
  begin
    LDAP_TAG_X_ACCOUNT_USABILITY_UNTIL_UNLOCK:=Tber_tag_t($84);
  end;

{ was #define dname def_expr }
function LDAP_TAG_EXOP_MODIFY_PASSWD_ID : Tber_tag_t;
  begin
    LDAP_TAG_EXOP_MODIFY_PASSWD_ID:=Tber_tag_t($80);
  end;

{ was #define dname def_expr }
function LDAP_TAG_EXOP_MODIFY_PASSWD_OLD : Tber_tag_t;
  begin
    LDAP_TAG_EXOP_MODIFY_PASSWD_OLD:=Tber_tag_t($81);
  end;

{ was #define dname def_expr }
function LDAP_TAG_EXOP_MODIFY_PASSWD_NEW : Tber_tag_t;
  begin
    LDAP_TAG_EXOP_MODIFY_PASSWD_NEW:=Tber_tag_t($82);
  end;

{ was #define dname def_expr }
function LDAP_TAG_EXOP_MODIFY_PASSWD_GEN : Tber_tag_t;
  begin
    LDAP_TAG_EXOP_MODIFY_PASSWD_GEN:=Tber_tag_t($80);
  end;

{ was #define dname def_expr }
function LDAP_TAG_EXOP_REFRESH_REQ_DN : Tber_tag_t;
  begin
    LDAP_TAG_EXOP_REFRESH_REQ_DN:=Tber_tag_t($80);
  end;

{ was #define dname def_expr }
function LDAP_TAG_EXOP_REFRESH_REQ_TTL : Tber_tag_t;
  begin
    LDAP_TAG_EXOP_REFRESH_REQ_TTL:=Tber_tag_t($81);
  end;

{ was #define dname def_expr }
function LDAP_TAG_EXOP_REFRESH_RES_TTL : Tber_tag_t;
  begin
    LDAP_TAG_EXOP_REFRESH_RES_TTL:=Tber_tag_t($81);
  end;

{ was #define dname def_expr }
function LDAP_TAG_EXOP_VERIFY_CREDENTIALS_COOKIE : Tber_tag_t;
  begin
    LDAP_TAG_EXOP_VERIFY_CREDENTIALS_COOKIE:=Tber_tag_t($80);
  end;

{ was #define dname def_expr }
function LDAP_TAG_EXOP_VERIFY_CREDENTIALS_SCREDS : Tber_tag_t;
  begin
    LDAP_TAG_EXOP_VERIFY_CREDENTIALS_SCREDS:=Tber_tag_t($81);
  end;

{ was #define dname def_expr }
function LDAP_TAG_EXOP_VERIFY_CREDENTIALS_CONTROLS : Tber_tag_t;
  begin
    LDAP_TAG_EXOP_VERIFY_CREDENTIALS_CONTROLS:=Tber_tag_t($a2);
  end;

{ was #define dname def_expr }
function LDAP_TAG_MESSAGE : Tber_tag_t;
  begin
    LDAP_TAG_MESSAGE:=Tber_tag_t($30);
  end;

{ was #define dname def_expr }
function LDAP_TAG_MSGID : Tber_tag_t;
  begin
    LDAP_TAG_MSGID:=Tber_tag_t($02);
  end;

{ was #define dname def_expr }
function LDAP_TAG_LDAPDN : Tber_tag_t;
  begin
    LDAP_TAG_LDAPDN:=Tber_tag_t($04);
  end;

{ was #define dname def_expr }
function LDAP_TAG_LDAPCRED : Tber_tag_t;
  begin
    LDAP_TAG_LDAPCRED:=Tber_tag_t($04);
  end;

{ was #define dname def_expr }
function LDAP_TAG_CONTROLS : Tber_tag_t;
  begin
    LDAP_TAG_CONTROLS:=Tber_tag_t($a0);
  end;

{ was #define dname def_expr }
function LDAP_TAG_REFERRAL : Tber_tag_t;
  begin
    LDAP_TAG_REFERRAL:=Tber_tag_t($a3);
  end;

{ was #define dname def_expr }
function LDAP_TAG_NEWSUPERIOR : Tber_tag_t;
  begin
    LDAP_TAG_NEWSUPERIOR:=Tber_tag_t($80);
  end;

{ was #define dname def_expr }
function LDAP_TAG_EXOP_REQ_OID : Tber_tag_t;
  begin
    LDAP_TAG_EXOP_REQ_OID:=Tber_tag_t($80);
  end;

{ was #define dname def_expr }
function LDAP_TAG_EXOP_REQ_VALUE : Tber_tag_t;
  begin
    LDAP_TAG_EXOP_REQ_VALUE:=Tber_tag_t($81);
  end;

{ was #define dname def_expr }
function LDAP_TAG_EXOP_RES_OID : Tber_tag_t;
  begin
    LDAP_TAG_EXOP_RES_OID:=Tber_tag_t($8a);
  end;

{ was #define dname def_expr }
function LDAP_TAG_EXOP_RES_VALUE : Tber_tag_t;
  begin
    LDAP_TAG_EXOP_RES_VALUE:=Tber_tag_t($8b);
  end;

{ was #define dname def_expr }
function LDAP_TAG_IM_RES_OID : Tber_tag_t;
  begin
    LDAP_TAG_IM_RES_OID:=Tber_tag_t($80);
  end;

{ was #define dname def_expr }
function LDAP_TAG_IM_RES_VALUE : Tber_tag_t;
  begin
    LDAP_TAG_IM_RES_VALUE:=Tber_tag_t($81);
  end;

{ was #define dname def_expr }
function LDAP_TAG_SASL_RES_CREDS : Tber_tag_t;
  begin
    LDAP_TAG_SASL_RES_CREDS:=Tber_tag_t($87);
  end;

{ was #define dname def_expr }
function LDAP_REQ_BIND : Tber_tag_t;
  begin
    LDAP_REQ_BIND:=Tber_tag_t($60);
  end;

{ was #define dname def_expr }
function LDAP_REQ_UNBIND : Tber_tag_t;
  begin
    LDAP_REQ_UNBIND:=Tber_tag_t($42);
  end;

{ was #define dname def_expr }
function LDAP_REQ_SEARCH : Tber_tag_t;
  begin
    LDAP_REQ_SEARCH:=Tber_tag_t($63);
  end;

{ was #define dname def_expr }
function LDAP_REQ_MODIFY : Tber_tag_t;
  begin
    LDAP_REQ_MODIFY:=Tber_tag_t($66);
  end;

{ was #define dname def_expr }
function LDAP_REQ_ADD : Tber_tag_t;
  begin
    LDAP_REQ_ADD:=Tber_tag_t($68);
  end;

{ was #define dname def_expr }
function LDAP_REQ_DELETE : Tber_tag_t;
  begin
    LDAP_REQ_DELETE:=Tber_tag_t($4a);
  end;

{ was #define dname def_expr }
function LDAP_REQ_MODDN : Tber_tag_t;
  begin
    LDAP_REQ_MODDN:=Tber_tag_t($6c);
  end;

{ was #define dname def_expr }
function LDAP_REQ_COMPARE : Tber_tag_t;
  begin
    LDAP_REQ_COMPARE:=Tber_tag_t($6e);
  end;

{ was #define dname def_expr }
function LDAP_REQ_ABANDON : Tber_tag_t;
  begin
    LDAP_REQ_ABANDON:=Tber_tag_t($50);
  end;

{ was #define dname def_expr }
function LDAP_REQ_EXTENDED : Tber_tag_t;
  begin
    LDAP_REQ_EXTENDED:=Tber_tag_t($77);
  end;

{ was #define dname def_expr }
function LDAP_RES_BIND : Tber_tag_t;
  begin
    LDAP_RES_BIND:=Tber_tag_t($61);
  end;

{ was #define dname def_expr }
function LDAP_RES_SEARCH_ENTRY : Tber_tag_t;
  begin
    LDAP_RES_SEARCH_ENTRY:=Tber_tag_t($64);
  end;

{ was #define dname def_expr }
function LDAP_RES_SEARCH_REFERENCE : Tber_tag_t;
  begin
    LDAP_RES_SEARCH_REFERENCE:=Tber_tag_t($73);
  end;

{ was #define dname def_expr }
function LDAP_RES_SEARCH_RESULT : Tber_tag_t;
  begin
    LDAP_RES_SEARCH_RESULT:=Tber_tag_t($65);
  end;

{ was #define dname def_expr }
function LDAP_RES_MODIFY : Tber_tag_t;
  begin
    LDAP_RES_MODIFY:=Tber_tag_t($67);
  end;

{ was #define dname def_expr }
function LDAP_RES_ADD : Tber_tag_t;
  begin
    LDAP_RES_ADD:=Tber_tag_t($69);
  end;

{ was #define dname def_expr }
function LDAP_RES_DELETE : Tber_tag_t;
  begin
    LDAP_RES_DELETE:=Tber_tag_t($6b);
  end;

{ was #define dname def_expr }
function LDAP_RES_MODDN : Tber_tag_t;
  begin
    LDAP_RES_MODDN:=Tber_tag_t($6d);
  end;

{ was #define dname def_expr }
function LDAP_RES_COMPARE : Tber_tag_t;
  begin
    LDAP_RES_COMPARE:=Tber_tag_t($6f);
  end;

{ was #define dname def_expr }
function LDAP_RES_EXTENDED : Tber_tag_t;
  begin
    LDAP_RES_EXTENDED:=Tber_tag_t($78);
  end;

{ was #define dname def_expr }
function LDAP_RES_INTERMEDIATE : Tber_tag_t;
  begin
    LDAP_RES_INTERMEDIATE:=Tber_tag_t($79);
  end;

{ was #define dname def_expr }
function LDAP_SASL_SIMPLE : Pchar;
  begin
    LDAP_SASL_SIMPLE:=Pchar(0);
  end;

{ was #define dname def_expr }
function LDAP_AUTH_NONE : Tber_tag_t;
  begin
    LDAP_AUTH_NONE:=Tber_tag_t($00);
  end;

{ was #define dname def_expr }
function LDAP_AUTH_SIMPLE : Tber_tag_t;
  begin
    LDAP_AUTH_SIMPLE:=Tber_tag_t($80);
  end;

{ was #define dname def_expr }
function LDAP_AUTH_SASL : Tber_tag_t;
  begin
    LDAP_AUTH_SASL:=Tber_tag_t($a3);
  end;

{ was #define dname def_expr }
function LDAP_AUTH_KRBV4 : Tber_tag_t;
  begin
    LDAP_AUTH_KRBV4:=Tber_tag_t($ff);
  end;

{ was #define dname def_expr }
function LDAP_AUTH_KRBV41 : Tber_tag_t;
  begin
    LDAP_AUTH_KRBV41:=Tber_tag_t($81);
  end;

{ was #define dname def_expr }
function LDAP_AUTH_KRBV42 : Tber_tag_t;
  begin
    LDAP_AUTH_KRBV42:=Tber_tag_t($82);
  end;

{ was #define dname def_expr }
function LDAP_AUTH_NEGOTIATE : Tber_tag_t;
  begin
    LDAP_AUTH_NEGOTIATE:=Tber_tag_t($04FF);
  end;

{ was #define dname def_expr }
function LDAP_FILTER_AND : Tber_tag_t;
  begin
    LDAP_FILTER_AND:=Tber_tag_t($a0);
  end;

{ was #define dname def_expr }
function LDAP_FILTER_OR : Tber_tag_t;
  begin
    LDAP_FILTER_OR:=Tber_tag_t($a1);
  end;

{ was #define dname def_expr }
function LDAP_FILTER_NOT : Tber_tag_t;
  begin
    LDAP_FILTER_NOT:=Tber_tag_t($a2);
  end;

{ was #define dname def_expr }
function LDAP_FILTER_EQUALITY : Tber_tag_t;
  begin
    LDAP_FILTER_EQUALITY:=Tber_tag_t($a3);
  end;

{ was #define dname def_expr }
function LDAP_FILTER_SUBSTRINGS : Tber_tag_t;
  begin
    LDAP_FILTER_SUBSTRINGS:=Tber_tag_t($a4);
  end;

{ was #define dname def_expr }
function LDAP_FILTER_GE : Tber_tag_t;
  begin
    LDAP_FILTER_GE:=Tber_tag_t($a5);
  end;

{ was #define dname def_expr }
function LDAP_FILTER_LE : Tber_tag_t;
  begin
    LDAP_FILTER_LE:=Tber_tag_t($a6);
  end;

{ was #define dname def_expr }
function LDAP_FILTER_PRESENT : Tber_tag_t;
  begin
    LDAP_FILTER_PRESENT:=Tber_tag_t($87);
  end;

{ was #define dname def_expr }
function LDAP_FILTER_APPROX : Tber_tag_t;
  begin
    LDAP_FILTER_APPROX:=Tber_tag_t($a8);
  end;

{ was #define dname def_expr }
function LDAP_FILTER_EXT : Tber_tag_t;
  begin
    LDAP_FILTER_EXT:=Tber_tag_t($a9);
  end;

{ was #define dname def_expr }
function LDAP_FILTER_EXT_OID : Tber_tag_t;
  begin
    LDAP_FILTER_EXT_OID:=Tber_tag_t($81);
  end;

{ was #define dname def_expr }
function LDAP_FILTER_EXT_TYPE : Tber_tag_t;
  begin
    LDAP_FILTER_EXT_TYPE:=Tber_tag_t($82);
  end;

{ was #define dname def_expr }
function LDAP_FILTER_EXT_VALUE : Tber_tag_t;
  begin
    LDAP_FILTER_EXT_VALUE:=Tber_tag_t($83);
  end;

{ was #define dname def_expr }
function LDAP_FILTER_EXT_DNATTRS : Tber_tag_t;
  begin
    LDAP_FILTER_EXT_DNATTRS:=Tber_tag_t($84);
  end;

{ was #define dname def_expr }
function LDAP_SUBSTRING_INITIAL : Tber_tag_t;
  begin
    LDAP_SUBSTRING_INITIAL:=Tber_tag_t($80);
  end;

{ was #define dname def_expr }
function LDAP_SUBSTRING_ANY : Tber_tag_t;
  begin
    LDAP_SUBSTRING_ANY:=Tber_tag_t($81);
  end;

{ was #define dname def_expr }
function LDAP_SUBSTRING_FINAL : Tber_tag_t;
  begin
    LDAP_SUBSTRING_FINAL:=Tber_tag_t($82);
  end;

{ was #define dname def_expr }
function LDAP_SCOPE_BASE : Tber_int_t;
  begin
    LDAP_SCOPE_BASE:=Tber_int_t($0000);
  end;

{ was #define dname def_expr }
function LDAP_SCOPE_ONELEVEL : Tber_int_t;
  begin
    LDAP_SCOPE_ONELEVEL:=Tber_int_t($0001);
  end;

{ was #define dname def_expr }
function LDAP_SCOPE_SUBTREE : Tber_int_t;
  begin
    LDAP_SCOPE_SUBTREE:=Tber_int_t($0002);
  end;

{ was #define dname def_expr }
function LDAP_SCOPE_SUBORDINATE : Tber_int_t;
  begin
    LDAP_SCOPE_SUBORDINATE:=Tber_int_t($0003);
  end;

{ was #define dname def_expr }
function LDAP_SCOPE_DEFAULT : Tber_int_t;
  begin
    LDAP_SCOPE_DEFAULT:=Tber_int_t(-(1));
  end;

{ was #define dname def_expr }
function LDAP_SUBSTRING_INITIAL : Tber_tag_t;
  begin
    LDAP_SUBSTRING_INITIAL:=Tber_tag_t($80);
  end;

{ was #define dname def_expr }
function LDAP_SUBSTRING_ANY : Tber_tag_t;
  begin
    LDAP_SUBSTRING_ANY:=Tber_tag_t($81);
  end;

{ was #define dname def_expr }
function LDAP_SUBSTRING_FINAL : Tber_tag_t;
  begin
    LDAP_SUBSTRING_FINAL:=Tber_tag_t($82);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LDAP_RANGE(n,x,y : longint) : longint;
begin
  LDAP_RANGE:=(x<=n) and (@(n<=y));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LDAP_ATTR_ERROR(n : longint) : longint;
begin
  LDAP_ATTR_ERROR:=LDAP_RANGE(n,$10,$15);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LDAP_NAME_ERROR(n : longint) : longint;
begin
  LDAP_NAME_ERROR:=LDAP_RANGE(n,$20,$24);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LDAP_SECURITY_ERROR(n : longint) : longint;
begin
  LDAP_SECURITY_ERROR:=LDAP_RANGE(n,$2F,$32);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LDAP_SERVICE_ERROR(n : longint) : longint;
begin
  LDAP_SERVICE_ERROR:=LDAP_RANGE(n,$33,$36);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LDAP_UPDATE_ERROR(n : longint) : longint;
begin
  LDAP_UPDATE_ERROR:=LDAP_RANGE(n,$40,$47);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LDAP_E_ERROR(n : longint) : longint;
begin
  LDAP_E_ERROR:=LDAP_RANGE(n,$1000,$3FFF);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LDAP_X_ERROR(n : longint) : longint;
begin
  LDAP_X_ERROR:=LDAP_RANGE(n,$4000,$FFFF);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LDAP_API_ERROR(n : longint) : longint;
begin
  LDAP_API_ERROR:=n<0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LDAP_API_RESULT(n : longint) : longint;
begin
  LDAP_API_RESULT:=n<=0;
end;


end.
