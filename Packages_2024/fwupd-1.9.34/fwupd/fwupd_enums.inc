
  {$IFDEF read_enum}
type
  PFwupdStatus = ^TFwupdStatus;
  TFwupdStatus = longint;

const
  FWUPD_STATUS_UNKNOWN = 0;
  FWUPD_STATUS_IDLE = 1;
  FWUPD_STATUS_LOADING = 2;
  FWUPD_STATUS_DECOMPRESSING = 3;
  FWUPD_STATUS_DEVICE_RESTART = 4;
  FWUPD_STATUS_DEVICE_WRITE = 5;
  FWUPD_STATUS_DEVICE_VERIFY = 6;
  FWUPD_STATUS_SCHEDULING = 7;
  FWUPD_STATUS_DOWNLOADING = 8;
  FWUPD_STATUS_DEVICE_READ = 9;
  FWUPD_STATUS_DEVICE_ERASE = 10;
  FWUPD_STATUS_WAITING_FOR_AUTH = 11;
  FWUPD_STATUS_DEVICE_BUSY = 12;
  FWUPD_STATUS_SHUTDOWN = 13;
  FWUPD_STATUS_WAITING_FOR_USER = 14;
  FWUPD_STATUS_LAST = 15;

type
  PFwupdTrustFlags = ^TFwupdTrustFlags;
  TFwupdTrustFlags = longint;

const
  FWUPD_TRUST_FLAG_NONE = 0;
  FWUPD_TRUST_FLAG_PAYLOAD = 1 shl 0;
  FWUPD_TRUST_FLAG_METADATA = 1 shl 1;
  FWUPD_TRUST_FLAG_LAST = (1 shl 1) + 1;

type
  PFwupdFeatureFlags = ^TFwupdFeatureFlags;
  TFwupdFeatureFlags = longint;

const
  FWUPD_FEATURE_FLAG_NONE = 0;
  FWUPD_FEATURE_FLAG_CAN_REPORT = 1 shl 0;
  FWUPD_FEATURE_FLAG_DETACH_ACTION = 1 shl 1;
  FWUPD_FEATURE_FLAG_UPDATE_ACTION = 1 shl 2;
  FWUPD_FEATURE_FLAG_SWITCH_BRANCH = 1 shl 3;
  FWUPD_FEATURE_FLAG_REQUESTS = 1 shl 4;
  FWUPD_FEATURE_FLAG_FDE_WARNING = 1 shl 5;
  FWUPD_FEATURE_FLAG_COMMUNITY_TEXT = 1 shl 6;
  FWUPD_FEATURE_FLAG_SHOW_PROBLEMS = 1 shl 7;
  FWUPD_FEATURE_FLAG_ALLOW_AUTHENTICATION = 1 shl 8;
  FWUPD_FEATURE_FLAG_REQUESTS_NON_GENERIC = 1 shl 9;
  FWUPD_FEATURE_FLAG_LAST = (1 shl 9) + 1;

const
  FWUPD_DEVICE_FLAG_NONE = 0;
  FWUPD_DEVICE_FLAG_INTERNAL = 1 shl 0;
  FWUPD_DEVICE_FLAG_UPDATABLE = 1 shl 1;
  FWUPD_DEVICE_FLAG_ONLY_OFFLINE = 1 shl 2;
  FWUPD_DEVICE_FLAG_REQUIRE_AC = 1 shl 3;
  FWUPD_DEVICE_FLAG_LOCKED = 1 shl 4;
  FWUPD_DEVICE_FLAG_SUPPORTED = 1 shl 5;
  FWUPD_DEVICE_FLAG_NEEDS_BOOTLOADER = 1 shl 6;
  FWUPD_DEVICE_FLAG_REGISTERED = 1 shl 7;
  FWUPD_DEVICE_FLAG_NEEDS_REBOOT = 1 shl 8;
  FWUPD_DEVICE_FLAG_REPORTED = 1 shl 9;
  FWUPD_DEVICE_FLAG_NOTIFIED = 1 shl 10;
  FWUPD_DEVICE_FLAG_USE_RUNTIME_VERSION = 1 shl 11;
  FWUPD_DEVICE_FLAG_INSTALL_PARENT_FIRST = 1 shl 12;
  FWUPD_DEVICE_FLAG_IS_BOOTLOADER = 1 shl 13;
  FWUPD_DEVICE_FLAG_WAIT_FOR_REPLUG = 1 shl 14;
  FWUPD_DEVICE_FLAG_IGNORE_VALIDATION = 1 shl 15;
  FWUPD_DEVICE_FLAG_TRUSTED = 1 shl 16;
  FWUPD_DEVICE_FLAG_NEEDS_SHUTDOWN = 1 shl 17;
  FWUPD_DEVICE_FLAG_ANOTHER_WRITE_REQUIRED = 1 shl 18;
  FWUPD_DEVICE_FLAG_NO_AUTO_INSTANCE_IDS = 1 shl 19;
  FWUPD_DEVICE_FLAG_NEEDS_ACTIVATION = 1 shl 20;
  FWUPD_DEVICE_FLAG_ENSURE_SEMVER = 1 shl 21;
  FWUPD_DEVICE_FLAG_HISTORICAL = 1 shl 22;
  FWUPD_DEVICE_FLAG_ONLY_SUPPORTED = 1 shl 23;
  FWUPD_DEVICE_FLAG_WILL_DISAPPEAR = 1 shl 24;
  FWUPD_DEVICE_FLAG_CAN_VERIFY = 1 shl 25;
  FWUPD_DEVICE_FLAG_CAN_VERIFY_IMAGE = 1 shl 26;
  FWUPD_DEVICE_FLAG_DUAL_IMAGE = 1 shl 27;
  FWUPD_DEVICE_FLAG_SELF_RECOVERY = 1 shl 28;
  FWUPD_DEVICE_FLAG_USABLE_DURING_UPDATE = 1 shl 29;
  FWUPD_DEVICE_FLAG_VERSION_CHECK_REQUIRED = 1 shl 30;
  FWUPD_DEVICE_FLAG_INSTALL_ALL_RELEASES = 1 shl 31;
  FWUPD_DEVICE_FLAG_MD_SET_NAME = 1 shl 32;
  FWUPD_DEVICE_FLAG_MD_SET_NAME_CATEGORY = 1 shl 33;
  FWUPD_DEVICE_FLAG_MD_SET_VERFMT = 1 shl 34;
  FWUPD_DEVICE_FLAG_ADD_COUNTERPART_GUIDS = 1 shl 35;
  FWUPD_DEVICE_FLAG_NO_GUID_MATCHING = 1 shl 36;
  FWUPD_DEVICE_FLAG_UPDATABLE_HIDDEN = 1 shl 37;
  FWUPD_DEVICE_FLAG_SKIPS_RESTART = 1 shl 38;
  FWUPD_DEVICE_FLAG_HAS_MULTIPLE_BRANCHES = 1 shl 39;
  FWUPD_DEVICE_FLAG_BACKUP_BEFORE_INSTALL = 1 shl 40;
  FWUPD_DEVICE_FLAG_MD_SET_ICON = 1 shl 41;
  FWUPD_DEVICE_FLAG_WILDCARD_INSTALL = 1 shl 42;
  FWUPD_DEVICE_FLAG_ONLY_VERSION_UPGRADE = 1 shl 43;
  FWUPD_DEVICE_FLAG_UNREACHABLE = 1 shl 44;
  FWUPD_DEVICE_FLAG_AFFECTS_FDE = 1 shl 45;
  FWUPD_DEVICE_FLAG_END_OF_LIFE = 1 shl 46;
  FWUPD_DEVICE_FLAG_SIGNED_PAYLOAD = 1 shl 47;
  FWUPD_DEVICE_FLAG_UNSIGNED_PAYLOAD = 1 shl 48;
  FWUPD_DEVICE_FLAG_EMULATED = 1 shl 49;
  FWUPD_DEVICE_FLAG_EMULATION_TAG = 1 shl 50;
  FWUPD_DEVICE_FLAG_ONLY_EXPLICIT_UPDATES = 1 shl 51;
  FWUPD_DEVICE_FLAG_INSTALL_SKIP_VERSION_CHECK = 1 shl 53;
  FWUPD_DEVICE_FLAG_UNKNOWN = G_MAXUINT64;

type
  PFwupdDeviceFlags = ^TFwupdDeviceFlags;
  TFwupdDeviceFlags = Tguint64;

const
  FWUPD_DEVICE_PROBLEM_NONE = 0;
  FWUPD_DEVICE_PROBLEM_SYSTEM_POWER_TOO_LOW = 1 shl 0;
  FWUPD_DEVICE_PROBLEM_UNREACHABLE = 1 shl 1;
  FWUPD_DEVICE_PROBLEM_POWER_TOO_LOW = 1 shl 2;
  FWUPD_DEVICE_PROBLEM_UPDATE_PENDING = 1 shl 3;
  FWUPD_DEVICE_PROBLEM_REQUIRE_AC_POWER = 1 shl 4;
  FWUPD_DEVICE_PROBLEM_LID_IS_CLOSED = 1 shl 5;
  FWUPD_DEVICE_PROBLEM_IS_EMULATED = 1 shl 6;
  FWUPD_DEVICE_PROBLEM_MISSING_LICENSE = 1 shl 7;
  FWUPD_DEVICE_PROBLEM_SYSTEM_INHIBIT = 1 shl 8;
  FWUPD_DEVICE_PROBLEM_UPDATE_IN_PROGRESS = 1 shl 9;
  FWUPD_DEVICE_PROBLEM_IN_USE = 1 shl 10;
  FWUPD_DEVICE_PROBLEM_DISPLAY_REQUIRED = 1 shl 11;
  FWUPD_DEVICE_PROBLEM_UNKNOWN = G_MAXUINT64;

type
  PFwupdDeviceProblem = ^TFwupdDeviceProblem;
  TFwupdDeviceProblem = Tguint64;

const
  FWUPD_RELEASE_FLAG_NONE = 0;
  FWUPD_RELEASE_FLAG_TRUSTED_PAYLOAD = 1 shl 0;
  FWUPD_RELEASE_FLAG_TRUSTED_METADATA = 1 shl 1;
  FWUPD_RELEASE_FLAG_IS_UPGRADE = 1 shl 2;
  FWUPD_RELEASE_FLAG_IS_DOWNGRADE = 1 shl 3;
  FWUPD_RELEASE_FLAG_BLOCKED_VERSION = 1 shl 4;
  FWUPD_RELEASE_FLAG_BLOCKED_APPROVAL = 1 shl 5;
  FWUPD_RELEASE_FLAG_IS_ALTERNATE_BRANCH = 1 shl 6;
  FWUPD_RELEASE_FLAG_IS_COMMUNITY = 1 shl 7;
  FWUPD_RELEASE_FLAG_TRUSTED_REPORT = 1 shl 8;
  FWUPD_RELEASE_FLAG_UNKNOWN = G_MAXUINT64;

type
  PFwupdReleaseFlags = ^TFwupdReleaseFlags;
  TFwupdReleaseFlags = Tguint64;

type
  PFwupdReleaseUrgency = ^TFwupdReleaseUrgency;
  TFwupdReleaseUrgency = longint;

const
  FWUPD_RELEASE_URGENCY_UNKNOWN = 0;
  FWUPD_RELEASE_URGENCY_LOW = 1;
  FWUPD_RELEASE_URGENCY_MEDIUM = 2;
  FWUPD_RELEASE_URGENCY_HIGH = 3;
  FWUPD_RELEASE_URGENCY_CRITICAL = 4;
  FWUPD_RELEASE_URGENCY_LAST = 5;

const
  FWUPD_PLUGIN_FLAG_NONE = 0;
  FWUPD_PLUGIN_FLAG_DISABLED = 1 shl 0;
  FWUPD_PLUGIN_FLAG_USER_WARNING = 1 shl 1;
  FWUPD_PLUGIN_FLAG_CLEAR_UPDATABLE = 1 shl 2;
  FWUPD_PLUGIN_FLAG_NO_HARDWARE = 1 shl 3;
  FWUPD_PLUGIN_FLAG_CAPSULES_UNSUPPORTED = 1 shl 4;
  FWUPD_PLUGIN_FLAG_UNLOCK_REQUIRED = 1 shl 5;
  FWUPD_PLUGIN_FLAG_EFIVAR_NOT_MOUNTED = 1 shl 6;
  FWUPD_PLUGIN_FLAG_ESP_NOT_FOUND = 1 shl 7;
  FWUPD_PLUGIN_FLAG_LEGACY_BIOS = 1 shl 8;
  FWUPD_PLUGIN_FLAG_FAILED_OPEN = 1 shl 9;
  FWUPD_PLUGIN_FLAG_REQUIRE_HWID = 1 shl 10;
  FWUPD_PLUGIN_FLAG_KERNEL_TOO_OLD = 1 shl 11;
  FWUPD_PLUGIN_FLAG_AUTH_REQUIRED = 1 shl 12;
  FWUPD_PLUGIN_FLAG_SECURE_CONFIG = 1 shl 13;
  FWUPD_PLUGIN_FLAG_MODULAR = 1 shl 14;
  FWUPD_PLUGIN_FLAG_MEASURE_SYSTEM_INTEGRITY = 1 shl 15;
  FWUPD_PLUGIN_FLAG_ESP_NOT_VALID = 1 shl 16;
  FWUPD_PLUGIN_FLAG_READY = 1 shl 17;
  FWUPD_PLUGIN_FLAG_TEST_ONLY = 1 shl 18;
  FWUPD_PLUGIN_FLAG_UNKNOWN = G_MAXUINT64;

type
  PFwupdPluginFlags = ^TFwupdPluginFlags;
  TFwupdPluginFlags = Tguint64;

type
  PFwupdInstallFlags = ^TFwupdInstallFlags;
  TFwupdInstallFlags = longint;

const
  FWUPD_INSTALL_FLAG_NONE = 0;
  FWUPD_INSTALL_FLAG_OFFLINE = 1 shl 0;
  FWUPD_INSTALL_FLAG_ALLOW_REINSTALL = 1 shl 1;
  FWUPD_INSTALL_FLAG_ALLOW_OLDER = 1 shl 2;
  FWUPD_INSTALL_FLAG_FORCE = 1 shl 3;
  FWUPD_INSTALL_FLAG_NO_HISTORY = 1 shl 4;
  FWUPD_INSTALL_FLAG_ALLOW_BRANCH_SWITCH = 1 shl 5;
  FWUPD_INSTALL_FLAG_IGNORE_CHECKSUM = 1 shl 6;
  FWUPD_INSTALL_FLAG_IGNORE_VID_PID = 1 shl 7;
  FWUPD_INSTALL_FLAG_IGNORE_POWER = 1 shl 8;
  FWUPD_INSTALL_FLAG_NO_SEARCH = 1 shl 9;
  FWUPD_INSTALL_FLAG_IGNORE_REQUIREMENTS = 1 shl 10;
  FWUPD_INSTALL_FLAG_LAST = (1 shl 10) + 1;

type
  PFwupdSelfSignFlags = ^TFwupdSelfSignFlags;
  TFwupdSelfSignFlags = longint;

const
  FWUPD_SELF_SIGN_FLAG_NONE = 0;
  FWUPD_SELF_SIGN_FLAG_ADD_TIMESTAMP = 1 shl 0;
  FWUPD_SELF_SIGN_FLAG_ADD_CERT = 1 shl 1;
  FWUPD_SELF_SIGN_FLAG_LAST = (1 shl 1) + 1;

type
  PFwupdUpdateState = ^TFwupdUpdateState;
  TFwupdUpdateState = longint;

const
  FWUPD_UPDATE_STATE_UNKNOWN = 0;
  FWUPD_UPDATE_STATE_PENDING = 1;
  FWUPD_UPDATE_STATE_SUCCESS = 2;
  FWUPD_UPDATE_STATE_FAILED = 3;
  FWUPD_UPDATE_STATE_NEEDS_REBOOT = 4;
  FWUPD_UPDATE_STATE_FAILED_TRANSIENT = 5;
  FWUPD_UPDATE_STATE_LAST = 6;

type
  PFwupdKeyringKind = ^TFwupdKeyringKind;
  TFwupdKeyringKind = longint;

const
  FWUPD_KEYRING_KIND_UNKNOWN = 0;
  FWUPD_KEYRING_KIND_NONE = 1;
  FWUPD_KEYRING_KIND_GPG = 2;
  FWUPD_KEYRING_KIND_PKCS7 = 3;
  FWUPD_KEYRING_KIND_JCAT = 4;
  FWUPD_KEYRING_KIND_LAST = 5;

type
  PFwupdVersionFormat = ^TFwupdVersionFormat;
  TFwupdVersionFormat = longint;

const
  FWUPD_VERSION_FORMAT_UNKNOWN = 0;
  FWUPD_VERSION_FORMAT_PLAIN = 1;
  FWUPD_VERSION_FORMAT_NUMBER = 2;
  FWUPD_VERSION_FORMAT_PAIR = 3;
  FWUPD_VERSION_FORMAT_TRIPLET = 4;
  FWUPD_VERSION_FORMAT_QUAD = 5;
  FWUPD_VERSION_FORMAT_BCD = 6;
  FWUPD_VERSION_FORMAT_INTEL_ME = 7;
  FWUPD_VERSION_FORMAT_INTEL_ME2 = 8;
  FWUPD_VERSION_FORMAT_SURFACE_LEGACY = 9;
  FWUPD_VERSION_FORMAT_SURFACE = 10;
  FWUPD_VERSION_FORMAT_DELL_BIOS = 11;
  FWUPD_VERSION_FORMAT_HEX = 12;
  FWUPD_VERSION_FORMAT_DELL_BIOS_MSB = 13;
  FWUPD_VERSION_FORMAT_INTEL_CSME19 = 14;
  FWUPD_VERSION_FORMAT_LAST = 15;

const
  FWUPD_BATTERY_LEVEL_INVALID = 101;
  {$ENDIF read_enum}

{$IFDEF read_function}
function fwupd_status_to_string(status: TFwupdStatus): Pgchar; cdecl; external libfwupd;
function fwupd_status_from_string(status: Pgchar): TFwupdStatus; cdecl; external libfwupd;
function fwupd_device_flag_to_string(device_flag: TFwupdDeviceFlags): Pgchar; cdecl; external libfwupd;
function fwupd_device_flag_from_string(device_flag: Pgchar): TFwupdDeviceFlags; cdecl; external libfwupd;
function fwupd_device_problem_to_string(device_problem: TFwupdDeviceProblem): Pgchar; cdecl; external libfwupd;
function fwupd_device_problem_from_string(device_problem: Pgchar): TFwupdDeviceProblem; cdecl; external libfwupd;
function fwupd_plugin_flag_to_string(plugin_flag: TFwupdPluginFlags): Pgchar; cdecl; external libfwupd;
function fwupd_plugin_flag_from_string(plugin_flag: Pgchar): TFwupdPluginFlags; cdecl; external libfwupd;
function fwupd_release_flag_to_string(release_flag: TFwupdReleaseFlags): Pgchar; cdecl; external libfwupd;
function fwupd_release_flag_from_string(release_flag: Pgchar): TFwupdReleaseFlags; cdecl; external libfwupd;
function fwupd_release_urgency_to_string(release_urgency: TFwupdReleaseUrgency): Pgchar; cdecl; external libfwupd;
function fwupd_release_urgency_from_string(release_urgency: Pgchar): TFwupdReleaseUrgency; cdecl; external libfwupd;
function fwupd_update_state_to_string(update_state: TFwupdUpdateState): Pgchar; cdecl; external libfwupd;
function fwupd_update_state_from_string(update_state: Pgchar): TFwupdUpdateState; cdecl; external libfwupd;
function fwupd_trust_flag_to_string(trust_flag: TFwupdTrustFlags): Pgchar; cdecl; external libfwupd;
function fwupd_trust_flag_from_string(trust_flag: Pgchar): TFwupdTrustFlags; cdecl; external libfwupd;
function fwupd_feature_flag_to_string(feature_flag: TFwupdFeatureFlags): Pgchar; cdecl; external libfwupd;
function fwupd_feature_flag_from_string(feature_flag: Pgchar): TFwupdFeatureFlags; cdecl; external libfwupd;
function fwupd_keyring_kind_from_string(keyring_kind: Pgchar): TFwupdKeyringKind; cdecl; external libfwupd;
function fwupd_keyring_kind_to_string(keyring_kind: TFwupdKeyringKind): Pgchar; cdecl; external libfwupd;
function fwupd_version_format_from_string(str: Pgchar): TFwupdVersionFormat; cdecl; external libfwupd;
function fwupd_version_format_to_string(kind: TFwupdVersionFormat): Pgchar; cdecl; external libfwupd;
{$ENDIF read_function}

// === Konventiert am: 21-4-26 15:35:29 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
