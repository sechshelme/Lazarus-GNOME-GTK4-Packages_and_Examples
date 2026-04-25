

  {$IFDEF read_enum}
type
  PNMAgentManagerError = ^TNMAgentManagerError;
  TNMAgentManagerError = longint;

const
  NM_AGENT_MANAGER_ERROR_FAILED = 0;
  NM_AGENT_MANAGER_ERROR_PERMISSION_DENIED = 1;
  NM_AGENT_MANAGER_ERROR_INVALID_IDENTIFIER = 2;
  NM_AGENT_MANAGER_ERROR_NOT_REGISTERED = 3;
  NM_AGENT_MANAGER_ERROR_NO_SECRETS = 4;
  NM_AGENT_MANAGER_ERROR_USER_CANCELED = 5;
  {$ENDIF read_enum}

{$IFDEF read_function}
function nm_agent_manager_error_quark: TGQuark; cdecl; external libnm;
function NM_AGENT_MANAGER_ERROR: TGQuark;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PNMConnectionError = ^TNMConnectionError;
  TNMConnectionError = longint;

const
  NM_CONNECTION_ERROR_FAILED = 0;
  NM_CONNECTION_ERROR_SETTING_NOT_FOUND = 1;
  NM_CONNECTION_ERROR_PROPERTY_NOT_FOUND = 2;
  NM_CONNECTION_ERROR_PROPERTY_NOT_SECRET = 3;
  NM_CONNECTION_ERROR_MISSING_SETTING = 4;
  NM_CONNECTION_ERROR_INVALID_SETTING = 5;
  NM_CONNECTION_ERROR_MISSING_PROPERTY = 6;
  NM_CONNECTION_ERROR_INVALID_PROPERTY = 7;
  {$ENDIF read_enum}

{$IFDEF read_function}
function NM_CONNECTION_ERROR: TGQuark;
function nm_connection_error_quark: TGQuark; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PNMCryptoError = ^TNMCryptoError;
  TNMCryptoError = longint;

const
  NM_CRYPTO_ERROR_FAILED = 0;
  NM_CRYPTO_ERROR_INVALID_DATA = 1;
  NM_CRYPTO_ERROR_INVALID_PASSWORD = 2;
  NM_CRYPTO_ERROR_UNKNOWN_CIPHER = 3;
  NM_CRYPTO_ERROR_DECRYPTION_FAILED = 4;
  NM_CRYPTO_ERROR_ENCRYPTION_FAILED = 5;
  {$ENDIF read_enum}

{$IFDEF read_function}
function NM_CRYPTO_ERROR: TGQuark;
function nm_crypto_error_quark: TGQuark; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PNMDeviceError = ^TNMDeviceError;
  TNMDeviceError = longint;

const
  NM_DEVICE_ERROR_FAILED = 0;
  NM_DEVICE_ERROR_CREATION_FAILED = 1;
  NM_DEVICE_ERROR_INVALID_CONNECTION = 2;
  NM_DEVICE_ERROR_INCOMPATIBLE_CONNECTION = 3;
  NM_DEVICE_ERROR_NOT_ACTIVE = 4;
  NM_DEVICE_ERROR_NOT_SOFTWARE = 5;
  NM_DEVICE_ERROR_NOT_ALLOWED = 6;
  NM_DEVICE_ERROR_SPECIFIC_OBJECT_NOT_FOUND = 7;
  NM_DEVICE_ERROR_VERSION_ID_MISMATCH = 8;
  NM_DEVICE_ERROR_MISSING_DEPENDENCIES = 9;
  NM_DEVICE_ERROR_INVALID_ARGUMENT = 10;
  {$ENDIF read_enum}

{$IFDEF read_function}
function NM_DEVICE_ERROR: TGQuark;
function nm_device_error_quark: TGQuark; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PNMManagerError = ^TNMManagerError;
  TNMManagerError = longint;

const
  NM_MANAGER_ERROR_FAILED = 0;
  NM_MANAGER_ERROR_PERMISSION_DENIED = 1;
  NM_MANAGER_ERROR_UNKNOWN_CONNECTION = 2;
  NM_MANAGER_ERROR_UNKNOWN_DEVICE = 3;
  NM_MANAGER_ERROR_CONNECTION_NOT_AVAILABLE = 4;
  NM_MANAGER_ERROR_CONNECTION_NOT_ACTIVE = 5;
  NM_MANAGER_ERROR_CONNECTION_ALREADY_ACTIVE = 6;
  NM_MANAGER_ERROR_DEPENDENCY_FAILED = 7;
  NM_MANAGER_ERROR_ALREADY_ASLEEP_OR_AWAKE = 8;
  NM_MANAGER_ERROR_ALREADY_ENABLED_OR_DISABLED = 9;
  NM_MANAGER_ERROR_UNKNOWN_LOG_LEVEL = 10;
  NM_MANAGER_ERROR_UNKNOWN_LOG_DOMAIN = 11;
  NM_MANAGER_ERROR_INVALID_ARGUMENTS = 12;
  NM_MANAGER_ERROR_MISSING_PLUGIN = 13;
  {$ENDIF read_enum}

{$IFDEF read_function}
function nm_manager_error_quark: TGQuark; cdecl; external libnm;
function NM_MANAGER_ERROR: TGQuark;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PNMSecretAgentError = ^TNMSecretAgentError;
  TNMSecretAgentError = longint;

const
  NM_SECRET_AGENT_ERROR_FAILED = 0;
  NM_SECRET_AGENT_ERROR_PERMISSION_DENIED = 1;
  NM_SECRET_AGENT_ERROR_INVALID_CONNECTION = 2;
  NM_SECRET_AGENT_ERROR_USER_CANCELED = 3;
  NM_SECRET_AGENT_ERROR_AGENT_CANCELED = 4;
  NM_SECRET_AGENT_ERROR_NO_SECRETS = 5;
  {$ENDIF read_enum}

{$IFDEF read_function}
function nm_secret_agent_error_quark: TGQuark; cdecl; external libnm;
function NM_SECRET_AGENT_ERROR: TGQuark;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PNMSettingsError = ^TNMSettingsError;
  TNMSettingsError = longint;

const
  NM_SETTINGS_ERROR_FAILED = 0;
  NM_SETTINGS_ERROR_PERMISSION_DENIED = 1;
  NM_SETTINGS_ERROR_NOT_SUPPORTED = 2;
  NM_SETTINGS_ERROR_INVALID_CONNECTION = 3;
  NM_SETTINGS_ERROR_READ_ONLY_CONNECTION = 4;
  NM_SETTINGS_ERROR_UUID_EXISTS = 5;
  NM_SETTINGS_ERROR_INVALID_HOSTNAME = 6;
  NM_SETTINGS_ERROR_INVALID_ARGUMENTS = 7;
  NM_SETTINGS_ERROR_VERSION_ID_MISMATCH = 8;
  NM_SETTINGS_ERROR_NOT_SUPPORTED_BY_PLUGIN = 9;
  {$ENDIF read_enum}

{$IFDEF read_function}
function nm_settings_error_quark: TGQuark; cdecl; external libnm;
function NM_SETTINGS_ERROR: TGQuark;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PNMVpnPluginError = ^TNMVpnPluginError;
  TNMVpnPluginError = longint;

const
  NM_VPN_PLUGIN_ERROR_FAILED = 0;
  NM_VPN_PLUGIN_ERROR_STARTING_IN_PROGRESS = 1;
  NM_VPN_PLUGIN_ERROR_ALREADY_STARTED = 2;
  NM_VPN_PLUGIN_ERROR_STOPPING_IN_PROGRESS = 3;
  NM_VPN_PLUGIN_ERROR_ALREADY_STOPPED = 4;
  NM_VPN_PLUGIN_ERROR_WRONG_STATE = 5;
  NM_VPN_PLUGIN_ERROR_BAD_ARGUMENTS = 6;
  NM_VPN_PLUGIN_ERROR_LAUNCH_FAILED = 7;
  NM_VPN_PLUGIN_ERROR_INVALID_CONNECTION = 8;
  NM_VPN_PLUGIN_ERROR_INTERACTIVE_NOT_SUPPORTED = 9;
  {$ENDIF read_enum}

{$IFDEF read_function}
function NM_VPN_PLUGIN_ERROR: TGQuark;
function nm_vpn_plugin_error_quark: TGQuark; cdecl; external libnm;
{$ENDIF read_function}

// === Konventiert am: 19-4-26 19:29:07 ===



{$IFDEF read_implementation}


function NM_AGENT_MANAGER_ERROR: TGQuark;
begin
  NM_AGENT_MANAGER_ERROR := nm_agent_manager_error_quark;
end;

function NM_CONNECTION_ERROR: TGQuark;
begin
  NM_CONNECTION_ERROR := nm_connection_error_quark;
end;

function NM_CRYPTO_ERROR: TGQuark;
begin
  NM_CRYPTO_ERROR := nm_crypto_error_quark;
end;

function NM_DEVICE_ERROR: TGQuark;
begin
  NM_DEVICE_ERROR := nm_device_error_quark;
end;

function NM_MANAGER_ERROR: TGQuark;
begin
  NM_MANAGER_ERROR := nm_manager_error_quark;
end;

function NM_SECRET_AGENT_ERROR: TGQuark;
begin
  NM_SECRET_AGENT_ERROR := nm_secret_agent_error_quark;
end;

function NM_SETTINGS_ERROR: TGQuark;
begin
  NM_SETTINGS_ERROR := nm_settings_error_quark;
end;

function NM_VPN_PLUGIN_ERROR: TGQuark;
begin
  NM_VPN_PLUGIN_ERROR := nm_vpn_plugin_error_quark;
end;


{$ENDIF read_implementation}
