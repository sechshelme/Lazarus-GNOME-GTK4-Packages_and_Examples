{$IFDEF read_interface}

type
  PWebKitNetworkProxyMode = ^TWebKitNetworkProxyMode;
  TWebKitNetworkProxyMode = longint;

const
  WEBKIT_NETWORK_PROXY_MODE_DEFAULT = 0;
  WEBKIT_NETWORK_PROXY_MODE_NO_PROXY = 1;
  WEBKIT_NETWORK_PROXY_MODE_CUSTOM = 2;

type
  TWebKitNetworkProxySettings = record
  end;
  PWebKitNetworkProxySettings = ^TWebKitNetworkProxySettings;

function webkit_network_proxy_settings_get_type: TGType; cdecl; external libwebkit;
function webkit_network_proxy_settings_new(default_proxy_uri: Pgchar; ignore_hosts: PPgchar): PWebKitNetworkProxySettings; cdecl; external libwebkit;
function webkit_network_proxy_settings_copy(proxy_settings: PWebKitNetworkProxySettings): PWebKitNetworkProxySettings; cdecl; external libwebkit;
procedure webkit_network_proxy_settings_free(proxy_settings: PWebKitNetworkProxySettings); cdecl; external libwebkit;
procedure webkit_network_proxy_settings_add_proxy_for_scheme(proxy_settings: PWebKitNetworkProxySettings; scheme: Pgchar; proxy_uri: Pgchar); cdecl; external libwebkit;

// === Konventiert am: 3-1-25 19:21:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_NETWORK_NETWORK_PROXY_SETTINGS: TGType;
begin
  WEBKIT_TYPE_NETWORK_NETWORK_PROXY_SETTINGS := webkit_network_proxy_settings_get_type;
end;



{$ENDIF read_implementation}
