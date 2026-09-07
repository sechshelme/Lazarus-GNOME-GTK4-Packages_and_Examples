unit pk_enum;

interface

uses
  fp_glib2, fp_packagekit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPkEnumMatch = ^TPkEnumMatch;
  TPkEnumMatch = record
    value: Tguint;
    _string: Pgchar;
  end;

type
  PPkRoleEnum = ^TPkRoleEnum;
  TPkRoleEnum = longint;
const
  PK_ROLE_ENUM_UNKNOWN = 0;
  PK_ROLE_ENUM_CANCEL = 1;
  PK_ROLE_ENUM_DEPENDS_ON = 2;
  PK_ROLE_ENUM_GET_DETAILS = 3;
  PK_ROLE_ENUM_GET_FILES = 4;
  PK_ROLE_ENUM_GET_PACKAGES = 5;
  PK_ROLE_ENUM_GET_REPO_LIST = 6;
  PK_ROLE_ENUM_REQUIRED_BY = 7;
  PK_ROLE_ENUM_GET_UPDATE_DETAIL = 8;
  PK_ROLE_ENUM_GET_UPDATES = 9;
  PK_ROLE_ENUM_INSTALL_FILES = 10;
  PK_ROLE_ENUM_INSTALL_PACKAGES = 11;
  PK_ROLE_ENUM_INSTALL_SIGNATURE = 12;
  PK_ROLE_ENUM_REFRESH_CACHE = 13;
  PK_ROLE_ENUM_REMOVE_PACKAGES = 14;
  PK_ROLE_ENUM_REPO_ENABLE = 15;
  PK_ROLE_ENUM_REPO_SET_DATA = 16;
  PK_ROLE_ENUM_RESOLVE = 17;
  PK_ROLE_ENUM_SEARCH_DETAILS = 18;
  PK_ROLE_ENUM_SEARCH_FILE = 19;
  PK_ROLE_ENUM_SEARCH_GROUP = 20;
  PK_ROLE_ENUM_SEARCH_NAME = 21;
  PK_ROLE_ENUM_UPDATE_PACKAGES = 22;
  PK_ROLE_ENUM_WHAT_PROVIDES = 23;
  PK_ROLE_ENUM_ACCEPT_EULA = 24;
  PK_ROLE_ENUM_DOWNLOAD_PACKAGES = 25;
  PK_ROLE_ENUM_GET_DISTRO_UPGRADES = 26;
  PK_ROLE_ENUM_GET_CATEGORIES = 27;
  PK_ROLE_ENUM_GET_OLD_TRANSACTIONS = 28;
  PK_ROLE_ENUM_REPAIR_SYSTEM = 29;
  PK_ROLE_ENUM_GET_DETAILS_LOCAL = 30;
  PK_ROLE_ENUM_GET_FILES_LOCAL = 31;
  PK_ROLE_ENUM_REPO_REMOVE = 32;
  PK_ROLE_ENUM_UPGRADE_SYSTEM = 33;
  PK_ROLE_ENUM_PURGE_PACKAGES = 34;
  PK_ROLE_ENUM_LAST = 35;

type
  PPkStatusEnum = ^TPkStatusEnum;
  TPkStatusEnum = longint;
const
  PK_STATUS_ENUM_UNKNOWN = 0;
  PK_STATUS_ENUM_WAIT = 1;
  PK_STATUS_ENUM_SETUP = 2;
  PK_STATUS_ENUM_RUNNING = 3;
  PK_STATUS_ENUM_QUERY = 4;
  PK_STATUS_ENUM_INFO = 5;
  PK_STATUS_ENUM_REMOVE = 6;
  PK_STATUS_ENUM_REFRESH_CACHE = 7;
  PK_STATUS_ENUM_DOWNLOAD = 8;
  PK_STATUS_ENUM_INSTALL = 9;
  PK_STATUS_ENUM_UPDATE = 10;
  PK_STATUS_ENUM_CLEANUP = 11;
  PK_STATUS_ENUM_OBSOLETE = 12;
  PK_STATUS_ENUM_DEP_RESOLVE = 13;
  PK_STATUS_ENUM_SIG_CHECK = 14;
  PK_STATUS_ENUM_TEST_COMMIT = 15;
  PK_STATUS_ENUM_COMMIT = 16;
  PK_STATUS_ENUM_REQUEST = 17;
  PK_STATUS_ENUM_FINISHED = 18;
  PK_STATUS_ENUM_CANCEL = 19;
  PK_STATUS_ENUM_DOWNLOAD_REPOSITORY = 20;
  PK_STATUS_ENUM_DOWNLOAD_PACKAGELIST = 21;
  PK_STATUS_ENUM_DOWNLOAD_FILELIST = 22;
  PK_STATUS_ENUM_DOWNLOAD_CHANGELOG = 23;
  PK_STATUS_ENUM_DOWNLOAD_GROUP = 24;
  PK_STATUS_ENUM_DOWNLOAD_UPDATEINFO = 25;
  PK_STATUS_ENUM_REPACKAGING = 26;
  PK_STATUS_ENUM_LOADING_CACHE = 27;
  PK_STATUS_ENUM_SCAN_APPLICATIONS = 28;
  PK_STATUS_ENUM_GENERATE_PACKAGE_LIST = 29;
  PK_STATUS_ENUM_WAITING_FOR_LOCK = 30;
  PK_STATUS_ENUM_WAITING_FOR_AUTH = 31;
  PK_STATUS_ENUM_SCAN_PROCESS_LIST = 32;
  PK_STATUS_ENUM_CHECK_EXECUTABLE_FILES = 33;
  PK_STATUS_ENUM_CHECK_LIBRARIES = 34;
  PK_STATUS_ENUM_COPY_FILES = 35;
  PK_STATUS_ENUM_RUN_HOOK = 36;
  PK_STATUS_ENUM_PURGE = 37;
  PK_STATUS_ENUM_LAST = 38;

type
  PPkExitEnum = ^TPkExitEnum;
  TPkExitEnum = longint;
const
  PK_EXIT_ENUM_UNKNOWN = 0;
  PK_EXIT_ENUM_SUCCESS = 1;
  PK_EXIT_ENUM_FAILED = 2;
  PK_EXIT_ENUM_CANCELLED = 3;
  PK_EXIT_ENUM_KEY_REQUIRED = 4;
  PK_EXIT_ENUM_EULA_REQUIRED = 5;
  PK_EXIT_ENUM_KILLED = 6;
  PK_EXIT_ENUM_MEDIA_CHANGE_REQUIRED = 7;
  PK_EXIT_ENUM_NEED_UNTRUSTED = 8;
  PK_EXIT_ENUM_CANCELLED_PRIORITY = 9;
  PK_EXIT_ENUM_SKIP_TRANSACTION = 10;
  PK_EXIT_ENUM_REPAIR_REQUIRED = 11;
  PK_EXIT_ENUM_LAST = 12;

type
  PPkNetworkEnum = ^TPkNetworkEnum;
  TPkNetworkEnum = longint;
const
  PK_NETWORK_ENUM_UNKNOWN = 0;
  PK_NETWORK_ENUM_OFFLINE = 1;
  PK_NETWORK_ENUM_ONLINE = 2;
  PK_NETWORK_ENUM_WIRED = 3;
  PK_NETWORK_ENUM_WIFI = 4;
  PK_NETWORK_ENUM_MOBILE = 5;
  PK_NETWORK_ENUM_LAST = 6;

type
  PPkFilterEnum = ^TPkFilterEnum;
  TPkFilterEnum = longint;
const
  PK_FILTER_ENUM_UNKNOWN = 0;
  PK_FILTER_ENUM_NONE = 1;
  PK_FILTER_ENUM_INSTALLED = 2;
  PK_FILTER_ENUM_NOT_INSTALLED = 3;
  PK_FILTER_ENUM_DEVELOPMENT = 4;
  PK_FILTER_ENUM_NOT_DEVELOPMENT = 5;
  PK_FILTER_ENUM_GUI = 6;
  PK_FILTER_ENUM_NOT_GUI = 7;
  PK_FILTER_ENUM_FREE = 8;
  PK_FILTER_ENUM_NOT_FREE = 9;
  PK_FILTER_ENUM_VISIBLE = 10;
  PK_FILTER_ENUM_NOT_VISIBLE = 11;
  PK_FILTER_ENUM_SUPPORTED = 12;
  PK_FILTER_ENUM_NOT_SUPPORTED = 13;
  PK_FILTER_ENUM_BASENAME = 14;
  PK_FILTER_ENUM_NOT_BASENAME = 15;
  PK_FILTER_ENUM_NEWEST = 16;
  PK_FILTER_ENUM_NOT_NEWEST = 17;
  PK_FILTER_ENUM_ARCH = 18;
  PK_FILTER_ENUM_NOT_ARCH = 19;
  PK_FILTER_ENUM_SOURCE = 20;
  PK_FILTER_ENUM_NOT_SOURCE = 21;
  PK_FILTER_ENUM_COLLECTIONS = 22;
  PK_FILTER_ENUM_NOT_COLLECTIONS = 23;
  PK_FILTER_ENUM_APPLICATION = 24;
  PK_FILTER_ENUM_NOT_APPLICATION = 25;
  PK_FILTER_ENUM_DOWNLOADED = 26;
  PK_FILTER_ENUM_NOT_DOWNLOADED = 27;
  PK_FILTER_ENUM_LAST = 28;

type
  PPkRestartEnum = ^TPkRestartEnum;
  TPkRestartEnum = longint;
const
  PK_RESTART_ENUM_UNKNOWN = 0;
  PK_RESTART_ENUM_NONE = 1;
  PK_RESTART_ENUM_APPLICATION = 2;
  PK_RESTART_ENUM_SESSION = 3;
  PK_RESTART_ENUM_SYSTEM = 4;
  PK_RESTART_ENUM_SECURITY_SESSION = 5;
  PK_RESTART_ENUM_SECURITY_SYSTEM = 6;
  PK_RESTART_ENUM_LAST = 7;

type
  PPkErrorEnum = ^TPkErrorEnum;
  TPkErrorEnum = longint;
const
  PK_ERROR_ENUM_UNKNOWN = 0;
  PK_ERROR_ENUM_OOM = 1;
  PK_ERROR_ENUM_NO_NETWORK = 2;
  PK_ERROR_ENUM_NOT_SUPPORTED = 3;
  PK_ERROR_ENUM_INTERNAL_ERROR = 4;
  PK_ERROR_ENUM_GPG_FAILURE = 5;
  PK_ERROR_ENUM_PACKAGE_ID_INVALID = 6;
  PK_ERROR_ENUM_PACKAGE_NOT_INSTALLED = 7;
  PK_ERROR_ENUM_PACKAGE_NOT_FOUND = 8;
  PK_ERROR_ENUM_PACKAGE_ALREADY_INSTALLED = 9;
  PK_ERROR_ENUM_PACKAGE_DOWNLOAD_FAILED = 10;
  PK_ERROR_ENUM_GROUP_NOT_FOUND = 11;
  PK_ERROR_ENUM_GROUP_LIST_INVALID = 12;
  PK_ERROR_ENUM_DEP_RESOLUTION_FAILED = 13;
  PK_ERROR_ENUM_FILTER_INVALID = 14;
  PK_ERROR_ENUM_CREATE_THREAD_FAILED = 15;
  PK_ERROR_ENUM_TRANSACTION_ERROR = 16;
  PK_ERROR_ENUM_TRANSACTION_CANCELLED = 17;
  PK_ERROR_ENUM_NO_CACHE = 18;
  PK_ERROR_ENUM_REPO_NOT_FOUND = 19;
  PK_ERROR_ENUM_CANNOT_REMOVE_SYSTEM_PACKAGE = 20;
  PK_ERROR_ENUM_PROCESS_KILL = 21;
  PK_ERROR_ENUM_FAILED_INITIALIZATION = 22;
  PK_ERROR_ENUM_FAILED_FINALISE = 23;
  PK_ERROR_ENUM_FAILED_CONFIG_PARSING = 24;
  PK_ERROR_ENUM_CANNOT_CANCEL = 25;
  PK_ERROR_ENUM_CANNOT_GET_LOCK = 26;
  PK_ERROR_ENUM_NO_PACKAGES_TO_UPDATE = 27;
  PK_ERROR_ENUM_CANNOT_WRITE_REPO_CONFIG = 28;
  PK_ERROR_ENUM_LOCAL_INSTALL_FAILED = 29;
  PK_ERROR_ENUM_BAD_GPG_SIGNATURE = 30;
  PK_ERROR_ENUM_MISSING_GPG_SIGNATURE = 31;
  PK_ERROR_ENUM_CANNOT_INSTALL_SOURCE_PACKAGE = 32;
  PK_ERROR_ENUM_REPO_CONFIGURATION_ERROR = 33;
  PK_ERROR_ENUM_NO_LICENSE_AGREEMENT = 34;
  PK_ERROR_ENUM_FILE_CONFLICTS = 35;
  PK_ERROR_ENUM_PACKAGE_CONFLICTS = 36;
  PK_ERROR_ENUM_REPO_NOT_AVAILABLE = 37;
  PK_ERROR_ENUM_INVALID_PACKAGE_FILE = 38;
  PK_ERROR_ENUM_PACKAGE_INSTALL_BLOCKED = 39;
  PK_ERROR_ENUM_PACKAGE_CORRUPT = 40;
  PK_ERROR_ENUM_ALL_PACKAGES_ALREADY_INSTALLED = 41;
  PK_ERROR_ENUM_FILE_NOT_FOUND = 42;
  PK_ERROR_ENUM_NO_MORE_MIRRORS_TO_TRY = 43;
  PK_ERROR_ENUM_NO_DISTRO_UPGRADE_DATA = 44;
  PK_ERROR_ENUM_INCOMPATIBLE_ARCHITECTURE = 45;
  PK_ERROR_ENUM_NO_SPACE_ON_DEVICE = 46;
  PK_ERROR_ENUM_MEDIA_CHANGE_REQUIRED = 47;
  PK_ERROR_ENUM_NOT_AUTHORIZED = 48;
  PK_ERROR_ENUM_UPDATE_NOT_FOUND = 49;
  PK_ERROR_ENUM_CANNOT_INSTALL_REPO_UNSIGNED = 50;
  PK_ERROR_ENUM_CANNOT_UPDATE_REPO_UNSIGNED = 51;
  PK_ERROR_ENUM_CANNOT_GET_FILELIST = 52;
  PK_ERROR_ENUM_CANNOT_GET_REQUIRES = 53;
  PK_ERROR_ENUM_CANNOT_DISABLE_REPOSITORY = 54;
  PK_ERROR_ENUM_RESTRICTED_DOWNLOAD = 55;
  PK_ERROR_ENUM_PACKAGE_FAILED_TO_CONFIGURE = 56;
  PK_ERROR_ENUM_PACKAGE_FAILED_TO_BUILD = 57;
  PK_ERROR_ENUM_PACKAGE_FAILED_TO_INSTALL = 58;
  PK_ERROR_ENUM_PACKAGE_FAILED_TO_REMOVE = 59;
  PK_ERROR_ENUM_UPDATE_FAILED_DUE_TO_RUNNING_PROCESS = 60;
  PK_ERROR_ENUM_PACKAGE_DATABASE_CHANGED = 61;
  PK_ERROR_ENUM_PROVIDE_TYPE_NOT_SUPPORTED = 62;
  PK_ERROR_ENUM_INSTALL_ROOT_INVALID = 63;
  PK_ERROR_ENUM_CANNOT_FETCH_SOURCES = 64;
  PK_ERROR_ENUM_CANCELLED_PRIORITY = 65;
  PK_ERROR_ENUM_UNFINISHED_TRANSACTION = 66;
  PK_ERROR_ENUM_LOCK_REQUIRED = 67;
  PK_ERROR_ENUM_REPO_ALREADY_SET = 68;
  PK_ERROR_ENUM_PACKAGE_FAILED_TO_PURGE = 69;
  PK_ERROR_ENUM_LAST = 70;

type
  PPkGroupEnum = ^TPkGroupEnum;
  TPkGroupEnum = longint;
const
  PK_GROUP_ENUM_UNKNOWN = 0;
  PK_GROUP_ENUM_ACCESSIBILITY = 1;
  PK_GROUP_ENUM_ACCESSORIES = 2;
  PK_GROUP_ENUM_ADMIN_TOOLS = 3;
  PK_GROUP_ENUM_COMMUNICATION = 4;
  PK_GROUP_ENUM_DESKTOP_GNOME = 5;
  PK_GROUP_ENUM_DESKTOP_KDE = 6;
  PK_GROUP_ENUM_DESKTOP_OTHER = 7;
  PK_GROUP_ENUM_DESKTOP_XFCE = 8;
  PK_GROUP_ENUM_EDUCATION = 9;
  PK_GROUP_ENUM_FONTS = 10;
  PK_GROUP_ENUM_GAMES = 11;
  PK_GROUP_ENUM_GRAPHICS = 12;
  PK_GROUP_ENUM_INTERNET = 13;
  PK_GROUP_ENUM_LEGACY = 14;
  PK_GROUP_ENUM_LOCALIZATION = 15;
  PK_GROUP_ENUM_MAPS = 16;
  PK_GROUP_ENUM_MULTIMEDIA = 17;
  PK_GROUP_ENUM_NETWORK = 18;
  PK_GROUP_ENUM_OFFICE = 19;
  PK_GROUP_ENUM_OTHER = 20;
  PK_GROUP_ENUM_POWER_MANAGEMENT = 21;
  PK_GROUP_ENUM_PROGRAMMING = 22;
  PK_GROUP_ENUM_PUBLISHING = 23;
  PK_GROUP_ENUM_REPOS = 24;
  PK_GROUP_ENUM_SECURITY = 25;
  PK_GROUP_ENUM_SERVERS = 26;
  PK_GROUP_ENUM_SYSTEM = 27;
  PK_GROUP_ENUM_VIRTUALIZATION = 28;
  PK_GROUP_ENUM_SCIENCE = 29;
  PK_GROUP_ENUM_DOCUMENTATION = 30;
  PK_GROUP_ENUM_ELECTRONICS = 31;
  PK_GROUP_ENUM_COLLECTIONS = 32;
  PK_GROUP_ENUM_VENDOR = 33;
  PK_GROUP_ENUM_NEWEST = 34;
  PK_GROUP_ENUM_DESKTOP_DDE = 35;
  PK_GROUP_ENUM_LAST = 36;

type
  PPkUpdateStateEnum = ^TPkUpdateStateEnum;
  TPkUpdateStateEnum = longint;
const
  PK_UPDATE_STATE_ENUM_UNKNOWN = 0;
  PK_UPDATE_STATE_ENUM_STABLE = 1;
  PK_UPDATE_STATE_ENUM_UNSTABLE = 2;
  PK_UPDATE_STATE_ENUM_TESTING = 3;
  PK_UPDATE_STATE_ENUM_LAST = 4;

type
  PPkInfoEnum = ^TPkInfoEnum;
  TPkInfoEnum = longint;
const
  PK_INFO_ENUM_UNKNOWN = 0;
  PK_INFO_ENUM_INSTALLED = 1;
  PK_INFO_ENUM_AVAILABLE = 2;
  PK_INFO_ENUM_LOW = 3;
  PK_INFO_ENUM_ENHANCEMENT = 4;
  PK_INFO_ENUM_NORMAL = 5;
  PK_INFO_ENUM_BUGFIX = 6;
  PK_INFO_ENUM_IMPORTANT = 7;
  PK_INFO_ENUM_SECURITY = 8;
  PK_INFO_ENUM_BLOCKED = 9;
  PK_INFO_ENUM_DOWNLOADING = 10;
  PK_INFO_ENUM_UPDATING = 11;
  PK_INFO_ENUM_INSTALLING = 12;
  PK_INFO_ENUM_REMOVING = 13;
  PK_INFO_ENUM_CLEANUP = 14;
  PK_INFO_ENUM_OBSOLETING = 15;
  PK_INFO_ENUM_COLLECTION_INSTALLED = 16;
  PK_INFO_ENUM_COLLECTION_AVAILABLE = 17;
  PK_INFO_ENUM_FINISHED = 18;
  PK_INFO_ENUM_REINSTALLING = 19;
  PK_INFO_ENUM_DOWNGRADING = 20;
  PK_INFO_ENUM_PREPARING = 21;
  PK_INFO_ENUM_DECOMPRESSING = 22;
  PK_INFO_ENUM_UNTRUSTED = 23;
  PK_INFO_ENUM_TRUSTED = 24;
  PK_INFO_ENUM_UNAVAILABLE = 25;
  PK_INFO_ENUM_CRITICAL = 26;
  PK_INFO_ENUM_PURGING = 27;
  PK_INFO_ENUM_LAST = 28;

type
  PPkDistroUpgradeEnum = ^TPkDistroUpgradeEnum;
  TPkDistroUpgradeEnum = longint;
const
  PK_DISTRO_UPGRADE_ENUM_UNKNOWN = 0;
  PK_DISTRO_UPGRADE_ENUM_STABLE = 1;
  PK_DISTRO_UPGRADE_ENUM_UNSTABLE = 2;
  PK_DISTRO_UPGRADE_ENUM_LAST = 3;

type
  PPkSigTypeEnum = ^TPkSigTypeEnum;
  TPkSigTypeEnum = longint;
const
  PK_SIGTYPE_ENUM_UNKNOWN = 0;
  PK_SIGTYPE_ENUM_GPG = 1;
  PK_SIGTYPE_ENUM_LAST = 2;

type
  PPkMediaTypeEnum = ^TPkMediaTypeEnum;
  TPkMediaTypeEnum = longint;
const
  PK_MEDIA_TYPE_ENUM_UNKNOWN = 0;
  PK_MEDIA_TYPE_ENUM_CD = 1;
  PK_MEDIA_TYPE_ENUM_DVD = 2;
  PK_MEDIA_TYPE_ENUM_DISC = 3;
  PK_MEDIA_TYPE_ENUM_LAST = 4;

type
  PPkAuthorizeEnum = ^TPkAuthorizeEnum;
  TPkAuthorizeEnum = longint;
const
  PK_AUTHORIZE_ENUM_UNKNOWN = 0;
  PK_AUTHORIZE_ENUM_YES = 1;
  PK_AUTHORIZE_ENUM_NO = 2;
  PK_AUTHORIZE_ENUM_INTERACTIVE = 3;
  PK_AUTHORIZE_ENUM_LAST = 4;

type
  PPkUpgradeKindEnum = ^TPkUpgradeKindEnum;
  TPkUpgradeKindEnum = longint;
const
  PK_UPGRADE_KIND_ENUM_UNKNOWN = 0;
  PK_UPGRADE_KIND_ENUM_MINIMAL = 1;
  PK_UPGRADE_KIND_ENUM_DEFAULT = 2;
  PK_UPGRADE_KIND_ENUM_COMPLETE = 3;
  PK_UPGRADE_KIND_ENUM_LAST = 4;

type
  PPkTransactionFlagEnum = ^TPkTransactionFlagEnum;
  TPkTransactionFlagEnum = longint;
const
  PK_TRANSACTION_FLAG_ENUM_NONE = 0;
  PK_TRANSACTION_FLAG_ENUM_ONLY_TRUSTED = 1;
  PK_TRANSACTION_FLAG_ENUM_SIMULATE = 2;
  PK_TRANSACTION_FLAG_ENUM_ONLY_DOWNLOAD = 3;
  PK_TRANSACTION_FLAG_ENUM_ALLOW_REINSTALL = 4;
  PK_TRANSACTION_FLAG_ENUM_JUST_REINSTALL = 5;
  PK_TRANSACTION_FLAG_ENUM_ALLOW_DOWNGRADE = 6;
  PK_TRANSACTION_FLAG_ENUM_LAST = 7;

function pk_enum_find_value(table: PPkEnumMatch; _string: Pgchar): Tguint; cdecl; external libpackagekit;
function pk_enum_find_string(table: PPkEnumMatch; value: Tguint): Pgchar; cdecl; external libpackagekit;
function pk_sig_type_enum_from_string(sig_type: Pgchar): TPkSigTypeEnum; cdecl; external libpackagekit;
function pk_sig_type_enum_to_string(sig_type: TPkSigTypeEnum): Pgchar; cdecl; external libpackagekit;
function pk_info_enum_from_string(info: Pgchar): TPkInfoEnum; cdecl; external libpackagekit;
function pk_info_enum_to_string(info: TPkInfoEnum): Pgchar; cdecl; external libpackagekit;
function pk_update_state_enum_from_string(update_state: Pgchar): TPkUpdateStateEnum; cdecl; external libpackagekit;
function pk_update_state_enum_to_string(update_state: TPkUpdateStateEnum): Pgchar; cdecl; external libpackagekit;
function pk_exit_enum_from_string(exit: Pgchar): TPkExitEnum; cdecl; external libpackagekit;
function pk_exit_enum_to_string(exit: TPkExitEnum): Pgchar; cdecl; external libpackagekit;
function pk_network_enum_from_string(network: Pgchar): TPkNetworkEnum; cdecl; external libpackagekit;
function pk_network_enum_to_string(network: TPkNetworkEnum): Pgchar; cdecl; external libpackagekit;
function pk_status_enum_from_string(status: Pgchar): TPkStatusEnum; cdecl; external libpackagekit;
function pk_status_enum_to_string(status: TPkStatusEnum): Pgchar; cdecl; external libpackagekit;
function pk_role_enum_from_string(role: Pgchar): TPkRoleEnum; cdecl; external libpackagekit;
function pk_role_enum_to_string(role: TPkRoleEnum): Pgchar; cdecl; external libpackagekit;
function pk_error_enum_from_string(code: Pgchar): TPkErrorEnum; cdecl; external libpackagekit;
function pk_error_enum_to_string(code: TPkErrorEnum): Pgchar; cdecl; external libpackagekit;
function pk_restart_enum_from_string(restart: Pgchar): TPkRestartEnum; cdecl; external libpackagekit;
function pk_restart_enum_to_string(restart: TPkRestartEnum): Pgchar; cdecl; external libpackagekit;
function pk_group_enum_from_string(group: Pgchar): TPkGroupEnum; cdecl; external libpackagekit;
function pk_group_enum_to_string(group: TPkGroupEnum): Pgchar; cdecl; external libpackagekit;
function pk_filter_enum_from_string(filter: Pgchar): TPkFilterEnum; cdecl; external libpackagekit;
function pk_filter_enum_to_string(filter: TPkFilterEnum): Pgchar; cdecl; external libpackagekit;
function pk_distro_upgrade_enum_from_string(upgrade: Pgchar): TPkDistroUpgradeEnum; cdecl; external libpackagekit;
function pk_distro_upgrade_enum_to_string(upgrade: TPkDistroUpgradeEnum): Pgchar; cdecl; external libpackagekit;
function pk_media_type_enum_from_string(media_type: Pgchar): TPkMediaTypeEnum; cdecl; external libpackagekit;
function pk_media_type_enum_to_string(media_type: TPkMediaTypeEnum): Pgchar; cdecl; external libpackagekit;
function pk_authorize_type_enum_from_string(authorize_type: Pgchar): TPkAuthorizeEnum; cdecl; external libpackagekit;
function pk_authorize_type_enum_to_string(authorize_type: TPkAuthorizeEnum): Pgchar; cdecl; external libpackagekit;
function pk_upgrade_kind_enum_from_string(upgrade_kind: Pgchar): TPkUpgradeKindEnum; cdecl; external libpackagekit;
function pk_upgrade_kind_enum_to_string(upgrade_kind: TPkUpgradeKindEnum): Pgchar; cdecl; external libpackagekit;
function pk_transaction_flag_enum_from_string(transaction_flag: Pgchar): TPkTransactionFlagEnum; cdecl; external libpackagekit;
function pk_transaction_flag_enum_to_string(transaction_flag: TPkTransactionFlagEnum): Pgchar; cdecl; external libpackagekit;
function pk_status_enum_to_localised_text(status: TPkStatusEnum): Pgchar; cdecl; external libpackagekit;
function pk_info_enum_to_localised_past(info: TPkInfoEnum): Pgchar; cdecl; external libpackagekit;
function pk_info_enum_to_localised_present(info: TPkInfoEnum): Pgchar; cdecl; external libpackagekit;
function pk_role_enum_to_localised_present(role: TPkRoleEnum): Pgchar; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:09:02 ===


implementation



end.
