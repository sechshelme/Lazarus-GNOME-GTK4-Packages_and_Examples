{$IFDEF read_interface}


type
  PAvahiServerState = ^TAvahiServerState;
  TAvahiServerState = longint;

const
  AVAHI_SERVER_INVALID = 0;
  AVAHI_SERVER_REGISTERING = 1;
  AVAHI_SERVER_RUNNING = 2;
  AVAHI_SERVER_COLLISION = 3;
  AVAHI_SERVER_FAILURE = 4;

type
  PAvahiEntryGroupState = ^TAvahiEntryGroupState;
  TAvahiEntryGroupState = longint;

const
  AVAHI_ENTRY_GROUP_UNCOMMITED = 0;
  AVAHI_ENTRY_GROUP_REGISTERING = 1;
  AVAHI_ENTRY_GROUP_ESTABLISHED = 2;
  AVAHI_ENTRY_GROUP_COLLISION = 3;
  AVAHI_ENTRY_GROUP_FAILURE = 4;

type
  PAvahiPublishFlags = ^TAvahiPublishFlags;
  TAvahiPublishFlags = longint;

const
  AVAHI_PUBLISH_UNIQUE = 1;
  AVAHI_PUBLISH_NO_PROBE = 2;
  AVAHI_PUBLISH_NO_ANNOUNCE = 4;
  AVAHI_PUBLISH_ALLOW_MULTIPLE = 8;
  AVAHI_PUBLISH_NO_REVERSE = 16;
  AVAHI_PUBLISH_NO_COOKIE = 32;
  AVAHI_PUBLISH_UPDATE = 64;
  AVAHI_PUBLISH_USE_WIDE_AREA = 128;
  AVAHI_PUBLISH_USE_MULTICAST = 256;

type
  PAvahiLookupFlags = ^TAvahiLookupFlags;
  TAvahiLookupFlags = longint;

const
  AVAHI_LOOKUP_USE_WIDE_AREA = 1;
  AVAHI_LOOKUP_USE_MULTICAST = 2;
  AVAHI_LOOKUP_NO_TXT = 4;
  AVAHI_LOOKUP_NO_ADDRESS = 8;

type
  PAvahiLookupResultFlags = ^TAvahiLookupResultFlags;
  TAvahiLookupResultFlags = longint;

const
  AVAHI_LOOKUP_RESULT_CACHED = 1;
  AVAHI_LOOKUP_RESULT_WIDE_AREA = 2;
  AVAHI_LOOKUP_RESULT_MULTICAST = 4;
  AVAHI_LOOKUP_RESULT_LOCAL = 8;
  AVAHI_LOOKUP_RESULT_OUR_OWN = 16;
  AVAHI_LOOKUP_RESULT_STATIC = 32;

type
  PAvahiBrowserEvent = ^TAvahiBrowserEvent;
  TAvahiBrowserEvent = longint;

const
  AVAHI_BROWSER_NEW = 0;
  AVAHI_BROWSER_REMOVE = 1;
  AVAHI_BROWSER_CACHE_EXHAUSTED = 2;
  AVAHI_BROWSER_ALL_FOR_NOW = 3;
  AVAHI_BROWSER_FAILURE = 4;

type
  PAvahiResolverEvent = ^TAvahiResolverEvent;
  TAvahiResolverEvent = longint;

const
  AVAHI_RESOLVER_FOUND = 0;
  AVAHI_RESOLVER_FAILURE = 1;

type
  PAvahiDomainBrowserType = ^TAvahiDomainBrowserType;
  TAvahiDomainBrowserType = longint;

const
  AVAHI_DOMAIN_BROWSER_BROWSE = 0;
  AVAHI_DOMAIN_BROWSER_BROWSE_DEFAULT = 1;
  AVAHI_DOMAIN_BROWSER_REGISTER = 2;
  AVAHI_DOMAIN_BROWSER_REGISTER_DEFAULT = 3;
  AVAHI_DOMAIN_BROWSER_BROWSE_LEGACY = 4;
  AVAHI_DOMAIN_BROWSER_MAX = 5;

const
  AVAHI_SERVICE_COOKIE = 'org.freedesktop.Avahi.cookie';
  AVAHI_SERVICE_COOKIE_INVALID = 0;

const
  AVAHI_DNS_TYPE_A = $01;
  AVAHI_DNS_TYPE_NS = $02;
  AVAHI_DNS_TYPE_CNAME = $05;
  AVAHI_DNS_TYPE_SOA = $06;
  AVAHI_DNS_TYPE_PTR = $0C;
  AVAHI_DNS_TYPE_HINFO = $0D;
  AVAHI_DNS_TYPE_MX = $0F;
  AVAHI_DNS_TYPE_TXT = $10;
  AVAHI_DNS_TYPE_AAAA = $1C;
  AVAHI_DNS_TYPE_SRV = $21;

const
  AVAHI_DNS_CLASS_IN = $01;

  AVAHI_DEFAULT_TTL_HOST_NAME = 120;
  AVAHI_DEFAULT_TTL = 75 * 60;

  // === Konventiert am: 24-12-25 15:58:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
