
unit pk_enum;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_enum.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_enum.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
PPkAuthorizeEnum  = ^PkAuthorizeEnum;
PPkDistroUpgradeEnum  = ^PkDistroUpgradeEnum;
PPkEnumMatch  = ^PkEnumMatch;
PPkErrorEnum  = ^PkErrorEnum;
PPkExitEnum  = ^PkExitEnum;
PPkFilterEnum  = ^PkFilterEnum;
PPkGroupEnum  = ^PkGroupEnum;
PPkInfoEnum  = ^PkInfoEnum;
PPkMediaTypeEnum  = ^PkMediaTypeEnum;
PPkNetworkEnum  = ^PkNetworkEnum;
PPkRestartEnum  = ^PkRestartEnum;
PPkRoleEnum  = ^PkRoleEnum;
PPkSigTypeEnum  = ^PkSigTypeEnum;
PPkStatusEnum  = ^PkStatusEnum;
PPkTransactionFlagEnum  = ^PkTransactionFlagEnum;
PPkUpdateStateEnum  = ^PkUpdateStateEnum;
PPkUpgradeKindEnum  = ^PkUpgradeKindEnum;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2007-2014 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__PACKAGEKIT_H_INSIDE__) && !defined (PK_COMPILATION)}
{$error "Only <packagekit.h> can be included directly."}
{$endif}
{$ifndef __PK_ENUM_H}
{$define __PK_ENUM_H}
{$include <glib.h>}
{*
 * PkEnumMatch:
 * @value: enumerated value
 * @string: string for given value
 *
 * Matching an enumerated type to a string
 * }
(* Const before type ignored *)
type
  PPkEnumMatch = ^TPkEnumMatch;
  TPkEnumMatch = record
      value : Tguint;
      _string : Pgchar;
    end;
{*
 * PkRoleEnum:
 * @PK_ROLE_ENUM_UNKNOWN: Unknow request
 * @PK_ROLE_ENUM_CANCEL: Cancel transaction
 * @PK_ROLE_ENUM_DEPENDS_ON: Get package dependencies
 * @PK_ROLE_ENUM_GET_DETAILS: Get package details
 * @PK_ROLE_ENUM_GET_FILES:
 * @PK_ROLE_ENUM_GET_PACKAGES: Get available packages
 * @PK_ROLE_ENUM_GET_REPO_LIST: Get repository list
 * @PK_ROLE_ENUM_REQUIRED_BY: Get packages required by given package
 * @PK_ROLE_ENUM_GET_UPDATE_DETAIL: Get update details
 * @PK_ROLE_ENUM_GET_UPDATES: Get available updates
 * @PK_ROLE_ENUM_INSTALL_FILES: Install package files
 * @PK_ROLE_ENUM_INSTALL_PACKAGES: Install packages
 * @PK_ROLE_ENUM_INSTALL_SIGNATURE: Install signature
 * @PK_ROLE_ENUM_REFRESH_CACHE: Refresh cache
 * @PK_ROLE_ENUM_REMOVE_PACKAGES: Remove packages
 * @PK_ROLE_ENUM_REPO_ENABLE: Enable repository
 * @PK_ROLE_ENUM_REPO_SET_DATA:
 * @PK_ROLE_ENUM_RESOLVE: Resolve depdencies
 * @PK_ROLE_ENUM_SEARCH_DETAILS: Search for details
 * @PK_ROLE_ENUM_SEARCH_FILE: Search for file
 * @PK_ROLE_ENUM_SEARCH_GROUP: Search for group
 * @PK_ROLE_ENUM_SEARCH_NAME: Search for package name
 * @PK_ROLE_ENUM_UPDATE_PACKAGES: Update packages
 * @PK_ROLE_ENUM_WHAT_PROVIDES: Get what a package provides
 * @PK_ROLE_ENUM_ACCEPT_EULA: Accept an EULA
 * @PK_ROLE_ENUM_DOWNLOAD_PACKAGES: Download packages
 * @PK_ROLE_ENUM_GET_DISTRO_UPGRADES: Get available distribution upgrades
 * @PK_ROLE_ENUM_GET_CATEGORIES: Get available categories
 * @PK_ROLE_ENUM_GET_OLD_TRANSACTIONS: Get old transation information
 * @PK_ROLE_ENUM_REPAIR_SYSTEM: Repair system
 * @PK_ROLE_ENUM_GET_DETAILS_LOCAL: Get details on local package
 * @PK_ROLE_ENUM_GET_FILES_LOCAL: Get files provided by local package
 * @PK_ROLE_ENUM_REPO_REMOVE: Remove repository
 * @PK_ROLE_ENUM_UPGRADE_SYSTEM: Upgrade system
 * @PK_ROLE_ENUM_PURGE_PACKAGES: Same as PK_ROLE_ENUM_REMOVE_PACKAGES, but also purges (apt only)
 * @PK_ROLE_ENUM_LAST:
 *
 * What we were asked to do, this never changes for the lifetime of the
 * transaction.
 * Icons that have to represent the whole "aim" of the transaction will use
 * these constants
 * }
{ Since: 0.7.2  }
{ Since: 0.8.17  }
{ Since: 0.9.1  }
{ Since: 0.9.1  }
{ Since: 1.0.10  }

  PPkRoleEnum = ^TPkRoleEnum;
  TPkRoleEnum =  Longint;
  Const
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
;
{*
 * PkStatusEnum:
 * @PK_STATUS_ENUM_UNKNOWN: Unknown status
 * @PK_STATUS_ENUM_WAIT: Waiting
 * @PK_STATUS_ENUM_SETUP: Setting up
 * @PK_STATUS_ENUM_RUNNING: Running
 * @PK_STATUS_ENUM_QUERY:
 * @PK_STATUS_ENUM_INFO:
 * @PK_STATUS_ENUM_REMOVE: Removing
 * @PK_STATUS_ENUM_REFRESH_CACHE: Refreshing cache
 * @PK_STATUS_ENUM_DOWNLOAD: Downloading
 * @PK_STATUS_ENUM_INSTALL: Installing
 * @PK_STATUS_ENUM_UPDATE: Updating
 * @PK_STATUS_ENUM_CLEANUP: Cleaning up
 * @PK_STATUS_ENUM_OBSOLETE:
 * @PK_STATUS_ENUM_DEP_RESOLVE: Resolving dependencies
 * @PK_STATUS_ENUM_SIG_CHECK: Checking signatures
 * @PK_STATUS_ENUM_TEST_COMMIT: Testing commit
 * @PK_STATUS_ENUM_COMMIT: Committing
 * @PK_STATUS_ENUM_REQUEST:
 * @PK_STATUS_ENUM_FINISHED: Finished
 * @PK_STATUS_ENUM_CANCEL: Cancelling
 * @PK_STATUS_ENUM_DOWNLOAD_REPOSITORY: Downloading respository
 * @PK_STATUS_ENUM_DOWNLOAD_PACKAGELIST: Donwloading package list
 * @PK_STATUS_ENUM_DOWNLOAD_FILELIST: Downloading file list
 * @PK_STATUS_ENUM_DOWNLOAD_CHANGELOG: Downloading changelog information
 * @PK_STATUS_ENUM_DOWNLOAD_GROUP: Downloading group information
 * @PK_STATUS_ENUM_DOWNLOAD_UPDATEINFO: Downloading update information
 * @PK_STATUS_ENUM_REPACKAGING: Repackaging
 * @PK_STATUS_ENUM_LOADING_CACHE: Loading cache
 * @PK_STATUS_ENUM_SCAN_APPLICATIONS: Scanning for applications
 * @PK_STATUS_ENUM_GENERATE_PACKAGE_LIST: Generating package list
 * @PK_STATUS_ENUM_WAITING_FOR_LOCK: Waiting for lock
 * @PK_STATUS_ENUM_WAITING_FOR_AUTH: Waiting for authentication/authorization
 * @PK_STATUS_ENUM_SCAN_PROCESS_LIST: Scanning running processes
 * @PK_STATUS_ENUM_CHECK_EXECUTABLE_FILES: Checking executable files
 * @PK_STATUS_ENUM_CHECK_LIBRARIES: Checking libraries
 * @PK_STATUS_ENUM_COPY_FILES: Copying files
 * @PK_STATUS_ENUM_RUN_HOOK: Running package hook
 * @PK_STATUS_ENUM_PURGE: Purging
 * @PK_STATUS_ENUM_LAST:
 *
 * What status we are now; this can change for each transaction giving a
 * status of what sort of thing is happening
 * Icons that change to represent the current status of the transaction will
 * use these constants
 * If you add to these, make sure you add filenames in gpk-watch.c also
 *
 * A typical transaction will do:
 * - schedule task
 *	WAIT
 * - run task
 *	SETUP
 * - wait for lock
 *	RUNNING
 *
 * This means that backends should run pk_backend_set_status (backend, PK_STATUS_ENUM_RUNNING)
 * when they are ready to start running the transaction and after a lock has been got.
 * }
type
  PPkStatusEnum = ^TPkStatusEnum;
  TPkStatusEnum =  Longint;
  Const
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
;
{*
 * PkExitEnum:
 * @PK_EXIT_ENUM_UNKNOWN: Unknown exit status
 * @PK_EXIT_ENUM_SUCCESS: Backend exited successfully
 * @PK_EXIT_ENUM_FAILED: Backend failed
 * @PK_EXIT_ENUM_CANCELLED: Backend was cancelled
 * @PK_EXIT_ENUM_KEY_REQUIRED: A repository encryption key needs installing
 * @PK_EXIT_ENUM_EULA_REQUIRED: A EULA is required to be accepted
 * @PK_EXIT_ENUM_KILLED: Backend was killed
 * @PK_EXIT_ENUM_MEDIA_CHANGE_REQUIRED: Media change required
 * @PK_EXIT_ENUM_NEED_UNTRUSTED:
 * @PK_EXIT_ENUM_CANCELLED_PRIORITY: Cancelled due to higher priority task
 * @PK_EXIT_ENUM_SKIP_TRANSACTION:
 * @PK_EXIT_ENUM_REPAIR_REQUIRED: Package database requires repairing
 * @PK_EXIT_ENUM_LAST:
 *
 * How the backend exited
 * }
{ when we forced the cancel, but had to SIGKILL  }
type
  PPkExitEnum = ^TPkExitEnum;
  TPkExitEnum =  Longint;
  Const
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
;
{*
 * PkNetworkEnum:
 * @PK_NETWORK_ENUM_UNKNOWN: Unknown network
 * @PK_NETWORK_ENUM_OFFLINE: Offline (no network)
 * @PK_NETWORK_ENUM_ONLINE: Online (network type unknown)
 * @PK_NETWORK_ENUM_WIRED: Wired network
 * @PK_NETWORK_ENUM_WIFI: WiFi network
 * @PK_NETWORK_ENUM_MOBILE: Mobile network
 * @PK_NETWORK_ENUM_LAST:
 *
 * Network type
 * }
type
  PPkNetworkEnum = ^TPkNetworkEnum;
  TPkNetworkEnum =  Longint;
  Const
    PK_NETWORK_ENUM_UNKNOWN = 0;
    PK_NETWORK_ENUM_OFFLINE = 1;
    PK_NETWORK_ENUM_ONLINE = 2;
    PK_NETWORK_ENUM_WIRED = 3;
    PK_NETWORK_ENUM_WIFI = 4;
    PK_NETWORK_ENUM_MOBILE = 5;
    PK_NETWORK_ENUM_LAST = 6;
;
{*
 * PkFilterEnum:
 * @PK_FILTER_ENUM_UNKNOWN: Unknown filter
 * @PK_FILTER_ENUM_NONE: No filter
 * @PK_FILTER_ENUM_INSTALLED: Filter for installed packages
 * @PK_FILTER_ENUM_NOT_INSTALLED: Filter for not installed packages
 * @PK_FILTER_ENUM_DEVELOPMENT: Filter for development packages
 * @PK_FILTER_ENUM_NOT_DEVELOPMENT: Filter for non-development packages
 * @PK_FILTER_ENUM_GUI: Filter for GUI packages
 * @PK_FILTER_ENUM_NOT_GUI: Filter for non-GUI packages
 * @PK_FILTER_ENUM_FREE: Filter for free packages
 * @PK_FILTER_ENUM_NOT_FREE: Filter for non-free packages
 * @PK_FILTER_ENUM_VISIBLE: Filter for visible packages
 * @PK_FILTER_ENUM_NOT_VISIBLE: Filter for invisible packages
 * @PK_FILTER_ENUM_SUPPORTED: Filter for supported packages
 * @PK_FILTER_ENUM_NOT_SUPPORTED: Filter for not supported packages
 * @PK_FILTER_ENUM_BASENAME: Filter for packages that match basename
 * @PK_FILTER_ENUM_NOT_BASENAME: Filter for packages that don't match basename
 * @PK_FILTER_ENUM_NEWEST: Filter for newest packages
 * @PK_FILTER_ENUM_NOT_NEWEST: Filter for not newest packages
 * @PK_FILTER_ENUM_ARCH: Filter for packages that match architecture
 * @PK_FILTER_ENUM_NOT_ARCH: Filter for packages that don't match architecture
 * @PK_FILTER_ENUM_SOURCE: Filter for source packages
 * @PK_FILTER_ENUM_NOT_SOURCE: Filter for non-source packages
 * @PK_FILTER_ENUM_COLLECTIONS: Filter for collections
 * @PK_FILTER_ENUM_NOT_COLLECTIONS: Filter for not collections
 * @PK_FILTER_ENUM_APPLICATION: Filter for application packages
 * @PK_FILTER_ENUM_NOT_APPLICATION: Filter for non-application packages
 * @PK_FILTER_ENUM_DOWNLOADED: Filter for downloaded packages
 * @PK_FILTER_ENUM_NOT_DOWNLOADED: Filter for not downloaded packages
 * @PK_FILTER_ENUM_LAST:
 *
 * The filter types
 * }
{ Since: 0.8.10  }
{ Since: 0.8.10  }
type
  PPkFilterEnum = ^TPkFilterEnum;
  TPkFilterEnum =  Longint;
  Const
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
;
{*
 * PkRestartEnum:
 * @PK_RESTART_ENUM_UNKNOWN: Unknown restart state
 * @PK_RESTART_ENUM_NONE: No restart required
 * @PK_RESTART_ENUM_APPLICATION: Need to restart the application
 * @PK_RESTART_ENUM_SESSION: Need to restart the session
 * @PK_RESTART_ENUM_SYSTEM: Need to restart the system
 * @PK_RESTART_ENUM_SECURITY_SESSION:
 * @PK_RESTART_ENUM_SECURITY_SYSTEM:
 * @PK_RESTART_ENUM_LAST:
 *
 * What restart we need to after a transaction, ordered by severity
 * }
{ a library that is being used by this package has been updated for security  }
type
  PPkRestartEnum = ^TPkRestartEnum;
  TPkRestartEnum =  Longint;
  Const
    PK_RESTART_ENUM_UNKNOWN = 0;
    PK_RESTART_ENUM_NONE = 1;
    PK_RESTART_ENUM_APPLICATION = 2;
    PK_RESTART_ENUM_SESSION = 3;
    PK_RESTART_ENUM_SYSTEM = 4;
    PK_RESTART_ENUM_SECURITY_SESSION = 5;
    PK_RESTART_ENUM_SECURITY_SYSTEM = 6;
    PK_RESTART_ENUM_LAST = 7;
;
{*
 * PkErrorEnum:
 * @PK_ERROR_ENUM_UNKNOWN:
 * @PK_ERROR_ENUM_OOM: Out of memory
 * @PK_ERROR_ENUM_NO_NETWORK: No network access available
 * @PK_ERROR_ENUM_NOT_SUPPORTED: Request not supported
 * @PK_ERROR_ENUM_INTERNAL_ERROR: Undefined internal error
 * @PK_ERROR_ENUM_GPG_FAILURE: GPG encryption failure
 * @PK_ERROR_ENUM_PACKAGE_ID_INVALID: Invalid package ID provided
 * @PK_ERROR_ENUM_PACKAGE_NOT_INSTALLED: Requested package not installed
 * @PK_ERROR_ENUM_PACKAGE_NOT_FOUND: Requested package not found
 * @PK_ERROR_ENUM_PACKAGE_ALREADY_INSTALLED: Requested package already installed
 * @PK_ERROR_ENUM_PACKAGE_DOWNLOAD_FAILED: Failed to download package
 * @PK_ERROR_ENUM_GROUP_NOT_FOUND: Requested group not gound
 * @PK_ERROR_ENUM_GROUP_LIST_INVALID: Invalid group list provided
 * @PK_ERROR_ENUM_DEP_RESOLUTION_FAILED: Failed to resolve dependencies
 * @PK_ERROR_ENUM_FILTER_INVALID: Invalid filter provides
 * @PK_ERROR_ENUM_CREATE_THREAD_FAILED: Failed to create thread
 * @PK_ERROR_ENUM_TRANSACTION_ERROR: Error occurred during transaction
 * @PK_ERROR_ENUM_TRANSACTION_CANCELLED: Transaction was cancelled
 * @PK_ERROR_ENUM_NO_CACHE: No cache available
 * @PK_ERROR_ENUM_REPO_NOT_FOUND: Requested repository not found
 * @PK_ERROR_ENUM_CANNOT_REMOVE_SYSTEM_PACKAGE: Not allowed to remove system package
 * @PK_ERROR_ENUM_PROCESS_KILL: Process killed
 * @PK_ERROR_ENUM_FAILED_INITIALIZATION:
 * @PK_ERROR_ENUM_FAILED_FINALISE:
 * @PK_ERROR_ENUM_FAILED_CONFIG_PARSING: Configuration is not valid
 * @PK_ERROR_ENUM_CANNOT_CANCEL:
 * @PK_ERROR_ENUM_CANNOT_GET_LOCK: Cannot get lock
 * @PK_ERROR_ENUM_NO_PACKAGES_TO_UPDATE: No packages to update
 * @PK_ERROR_ENUM_CANNOT_WRITE_REPO_CONFIG: Cannot write repository configuration
 * @PK_ERROR_ENUM_LOCAL_INSTALL_FAILED:
 * @PK_ERROR_ENUM_BAD_GPG_SIGNATURE: Bad GPG signature found
 * @PK_ERROR_ENUM_MISSING_GPG_SIGNATURE: Required GPG signature not found
 * @PK_ERROR_ENUM_CANNOT_INSTALL_SOURCE_PACKAGE: Cannot install source package
 * @PK_ERROR_ENUM_REPO_CONFIGURATION_ERROR:
 * @PK_ERROR_ENUM_NO_LICENSE_AGREEMENT:
 * @PK_ERROR_ENUM_FILE_CONFLICTS: File conflicts detected
 * @PK_ERROR_ENUM_PACKAGE_CONFLICTS: Package conflict
 * @PK_ERROR_ENUM_REPO_NOT_AVAILABLE: Repository not available
 * @PK_ERROR_ENUM_INVALID_PACKAGE_FILE:
 * @PK_ERROR_ENUM_PACKAGE_INSTALL_BLOCKED: Package installation blocked
 * @PK_ERROR_ENUM_PACKAGE_CORRUPT: Package corruption occurred
 * @PK_ERROR_ENUM_ALL_PACKAGES_ALREADY_INSTALLED: All packages already installed
 * @PK_ERROR_ENUM_FILE_NOT_FOUND: Required file not found
 * @PK_ERROR_ENUM_NO_MORE_MIRRORS_TO_TRY: Out of repository mirrors to try
 * @PK_ERROR_ENUM_NO_DISTRO_UPGRADE_DATA: No distribution upgrade path found
 * @PK_ERROR_ENUM_INCOMPATIBLE_ARCHITECTURE: Incompatible architecture found
 * @PK_ERROR_ENUM_NO_SPACE_ON_DEVICE: Out of required disk space
 * @PK_ERROR_ENUM_MEDIA_CHANGE_REQUIRED: Need to change media
 * @PK_ERROR_ENUM_NOT_AUTHORIZED: Authorization failed
 * @PK_ERROR_ENUM_UPDATE_NOT_FOUND: Update not found
 * @PK_ERROR_ENUM_CANNOT_INSTALL_REPO_UNSIGNED: Installation repository missing signature
 * @PK_ERROR_ENUM_CANNOT_UPDATE_REPO_UNSIGNED: Update repository missing signature
 * @PK_ERROR_ENUM_CANNOT_GET_FILELIST: Cannot get file list
 * @PK_ERROR_ENUM_CANNOT_GET_REQUIRES: Cannot get package requirements
 * @PK_ERROR_ENUM_CANNOT_DISABLE_REPOSITORY: Cannot disable reposoitory
 * @PK_ERROR_ENUM_RESTRICTED_DOWNLOAD:
 * @PK_ERROR_ENUM_PACKAGE_FAILED_TO_CONFIGURE: Package failed to configure
 * @PK_ERROR_ENUM_PACKAGE_FAILED_TO_BUILD: Package failed to build
 * @PK_ERROR_ENUM_PACKAGE_FAILED_TO_INSTALL: Package failed to install
 * @PK_ERROR_ENUM_PACKAGE_FAILED_TO_REMOVE: Package failed to remove
 * @PK_ERROR_ENUM_UPDATE_FAILED_DUE_TO_RUNNING_PROCESS:
 * @PK_ERROR_ENUM_PACKAGE_DATABASE_CHANGED:
 * @PK_ERROR_ENUM_PROVIDE_TYPE_NOT_SUPPORTED:
 * @PK_ERROR_ENUM_INSTALL_ROOT_INVALID: Installtion root not suitable
 * @PK_ERROR_ENUM_CANNOT_FETCH_SOURCES: Cannot fetch sources
 * @PK_ERROR_ENUM_CANCELLED_PRIORITY: Cancelled due to higher priority task
 * @PK_ERROR_ENUM_UNFINISHED_TRANSACTION: Transaction unfinished
 * @PK_ERROR_ENUM_LOCK_REQUIRED: Required lock not available
 * @PK_ERROR_ENUM_REPO_ALREADY_SET:
 * @PK_ERROR_ENUM_PACKAGE_FAILED_TO_PURGE: Package failed to purge
 * @PK_ERROR_ENUM_LAST:
 *
 * The error type
 * }
type
  PPkErrorEnum = ^TPkErrorEnum;
  TPkErrorEnum =  Longint;
  Const
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
;
{*
 * PkGroupEnum:
 * @PK_GROUP_ENUM_UNKNOWN: Unknown group
 * @PK_GROUP_ENUM_ACCESSIBILITY: Accessibility related packages
 * @PK_GROUP_ENUM_ACCESSORIES: Accessory packages
 * @PK_GROUP_ENUM_ADMIN_TOOLS: Administration tools packages
 * @PK_GROUP_ENUM_COMMUNICATION: Communication packages
 * @PK_GROUP_ENUM_DESKTOP_GNOME: GNOME packages
 * @PK_GROUP_ENUM_DESKTOP_KDE: KDE packages
 * @PK_GROUP_ENUM_DESKTOP_OTHER: Other desktop packages
 * @PK_GROUP_ENUM_DESKTOP_XFCE: XFCE packages
 * @PK_GROUP_ENUM_EDUCATION: Education packages
 * @PK_GROUP_ENUM_FONTS: Fonts
 * @PK_GROUP_ENUM_GAMES: Games
 * @PK_GROUP_ENUM_GRAPHICS: Graphics related packages
 * @PK_GROUP_ENUM_INTERNET: Internet related packages
 * @PK_GROUP_ENUM_LEGACY: Legacy packages
 * @PK_GROUP_ENUM_LOCALIZATION: Localization related packages
 * @PK_GROUP_ENUM_MAPS: Map related packages
 * @PK_GROUP_ENUM_MULTIMEDIA: Multimedia packages
 * @PK_GROUP_ENUM_NETWORK: Network related packages
 * @PK_GROUP_ENUM_OFFICE: Office packages
 * @PK_GROUP_ENUM_OTHER:
 * @PK_GROUP_ENUM_POWER_MANAGEMENT: Power-management related packages
 * @PK_GROUP_ENUM_PROGRAMMING: Programming packages
 * @PK_GROUP_ENUM_PUBLISHING: Publishing related packages
 * @PK_GROUP_ENUM_REPOS:
 * @PK_GROUP_ENUM_SECURITY: Security packages
 * @PK_GROUP_ENUM_SERVERS: Server related packages
 * @PK_GROUP_ENUM_SYSTEM: System packages
 * @PK_GROUP_ENUM_VIRTUALIZATION: Virtualization packages
 * @PK_GROUP_ENUM_SCIENCE: Science related packages
 * @PK_GROUP_ENUM_DOCUMENTATION: Documentation
 * @PK_GROUP_ENUM_ELECTRONICS: Electronics package
 * @PK_GROUP_ENUM_COLLECTIONS:
 * @PK_GROUP_ENUM_VENDOR: Vendor defined group
 * @PK_GROUP_ENUM_NEWEST: Special group for recently updated packages
 * @PK_GROUP_ENUM_DESKTOP_DDE: DDE packages
 * @PK_GROUP_ENUM_LAST:
 *
 * The group type
 * }
type
  PPkGroupEnum = ^TPkGroupEnum;
  TPkGroupEnum =  Longint;
  Const
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
;
{*
 * PkUpdateStateEnum:
 * @PK_UPDATE_STATE_ENUM_UNKNOWN: Update stability unknown
 * @PK_UPDATE_STATE_ENUM_STABLE: Update is a stable release
 * @PK_UPDATE_STATE_ENUM_UNSTABLE: Update is an unstable release
 * @PK_UPDATE_STATE_ENUM_TESTING: Update is a testing release
 * @PK_UPDATE_STATE_ENUM_LAST:
 *
 * What state the update is in
 * }
type
  PPkUpdateStateEnum = ^TPkUpdateStateEnum;
  TPkUpdateStateEnum =  Longint;
  Const
    PK_UPDATE_STATE_ENUM_UNKNOWN = 0;
    PK_UPDATE_STATE_ENUM_STABLE = 1;
    PK_UPDATE_STATE_ENUM_UNSTABLE = 2;
    PK_UPDATE_STATE_ENUM_TESTING = 3;
    PK_UPDATE_STATE_ENUM_LAST = 4;
;
{*
 * PkInfoEnum:
 * @PK_INFO_ENUM_UNKNOWN: Package status is unknown
 * @PK_INFO_ENUM_INSTALLED: Package is installed
 * @PK_INFO_ENUM_AVAILABLE: Package is available to be installed
 * @PK_INFO_ENUM_LOW:
 * @PK_INFO_ENUM_ENHANCEMENT:
 * @PK_INFO_ENUM_NORMAL:
 * @PK_INFO_ENUM_BUGFIX:
 * @PK_INFO_ENUM_IMPORTANT:
 * @PK_INFO_ENUM_SECURITY:
 * @PK_INFO_ENUM_BLOCKED: Package is blocked
 * @PK_INFO_ENUM_DOWNLOADING: Package is downloading
 * @PK_INFO_ENUM_UPDATING: Package is updating
 * @PK_INFO_ENUM_INSTALLING: Package is being installed
 * @PK_INFO_ENUM_REMOVING: Package is being removed
 * @PK_INFO_ENUM_CLEANUP: Package is running cleanup
 * @PK_INFO_ENUM_OBSOLETING:
 * @PK_INFO_ENUM_COLLECTION_INSTALLED:
 * @PK_INFO_ENUM_COLLECTION_AVAILABLE:
 * @PK_INFO_ENUM_FINISHED:
 * @PK_INFO_ENUM_REINSTALLING: Package is being reinstalled
 * @PK_INFO_ENUM_DOWNGRADING: Package is being downgraded
 * @PK_INFO_ENUM_PREPARING: Package is preparing for installation/removal
 * @PK_INFO_ENUM_DECOMPRESSING: Package is decompressing
 * @PK_INFO_ENUM_UNTRUSTED:
 * @PK_INFO_ENUM_TRUSTED:
 * @PK_INFO_ENUM_UNAVAILABLE: Package is unavailable
 * @PK_INFO_ENUM_CRITICAL: Update severity is critical; Since: 1.2.4
 * @PK_INFO_ENUM_PURGING: Package is being purged
 * @PK_INFO_ENUM_LAST:
 *
 * The enumerated types used in Package() - these have to refer to a specific
 * package action, rather than a general state
 * }
{ Since: 1.2.4  }
type
  PPkInfoEnum = ^TPkInfoEnum;
  TPkInfoEnum =  Longint;
  Const
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
;
{*
 * PkDistroUpgradeEnum:
 * @PK_DISTRO_UPGRADE_ENUM_UNKNOWN: Unknown disto upgrade state
 * @PK_DISTRO_UPGRADE_ENUM_STABLE: Upgraded to stable release
 * @PK_DISTRO_UPGRADE_ENUM_UNSTABLE: Upgraded to unstable release
 * @PK_DISTRO_UPGRADE_ENUM_LAST:
 *
 * The distro upgrade status
 * }
type
  PPkDistroUpgradeEnum = ^TPkDistroUpgradeEnum;
  TPkDistroUpgradeEnum =  Longint;
  Const
    PK_DISTRO_UPGRADE_ENUM_UNKNOWN = 0;
    PK_DISTRO_UPGRADE_ENUM_STABLE = 1;
    PK_DISTRO_UPGRADE_ENUM_UNSTABLE = 2;
    PK_DISTRO_UPGRADE_ENUM_LAST = 3;
;
{*
 * PkSigTypeEnum:
 * @PK_SIGTYPE_ENUM_UNKNOWN: Unkwown signature type
 * @PK_SIGTYPE_ENUM_GPG: GPG signature
 * @PK_SIGTYPE_ENUM_LAST:
 *
 * The signature type type
 * }
type
  PPkSigTypeEnum = ^TPkSigTypeEnum;
  TPkSigTypeEnum =  Longint;
  Const
    PK_SIGTYPE_ENUM_UNKNOWN = 0;
    PK_SIGTYPE_ENUM_GPG = 1;
    PK_SIGTYPE_ENUM_LAST = 2;
;
{*
 * PkMediaTypeEnum:
 * @PK_MEDIA_TYPE_ENUM_UNKNOWN: Unknown media type
 * @PK_MEDIA_TYPE_ENUM_CD: Media is a CD
 * @PK_MEDIA_TYPE_ENUM_DVD: Media is a DVD
 * @PK_MEDIA_TYPE_ENUM_DISC: Media is a disc (not CD or DVD)
 * @PK_MEDIA_TYPE_ENUM_LAST:
 *
 * The media type
 * }
type
  PPkMediaTypeEnum = ^TPkMediaTypeEnum;
  TPkMediaTypeEnum =  Longint;
  Const
    PK_MEDIA_TYPE_ENUM_UNKNOWN = 0;
    PK_MEDIA_TYPE_ENUM_CD = 1;
    PK_MEDIA_TYPE_ENUM_DVD = 2;
    PK_MEDIA_TYPE_ENUM_DISC = 3;
    PK_MEDIA_TYPE_ENUM_LAST = 4;
;
{*
 * PkAuthorizeEnum:
 * @PK_AUTHORIZE_ENUM_UNKNOWN: Unknown authorization status
 * @PK_AUTHORIZE_ENUM_YES: Authorized
 * @PK_AUTHORIZE_ENUM_NO: Not authorized
 * @PK_AUTHORIZE_ENUM_INTERACTIVE: Interaction required for authorization
 * @PK_AUTHORIZE_ENUM_LAST:
 *
 * The authorization result
 * }
type
  PPkAuthorizeEnum = ^TPkAuthorizeEnum;
  TPkAuthorizeEnum =  Longint;
  Const
    PK_AUTHORIZE_ENUM_UNKNOWN = 0;
    PK_AUTHORIZE_ENUM_YES = 1;
    PK_AUTHORIZE_ENUM_NO = 2;
    PK_AUTHORIZE_ENUM_INTERACTIVE = 3;
    PK_AUTHORIZE_ENUM_LAST = 4;
;
{*
 * PkUpgradeKindEnum:
 * @PK_UPGRADE_KIND_ENUM_UNKNOWN:
 * @PK_UPGRADE_KIND_ENUM_MINIMAL: Perform minimal upgrade
 * @PK_UPGRADE_KIND_ENUM_DEFAULT: Perform default upgrade
 * @PK_UPGRADE_KIND_ENUM_COMPLETE: Perform complete upgrade
 * @PK_UPGRADE_KIND_ENUM_LAST:
 *
 * The type of distribution upgrade to perform
 * }
type
  PPkUpgradeKindEnum = ^TPkUpgradeKindEnum;
  TPkUpgradeKindEnum =  Longint;
  Const
    PK_UPGRADE_KIND_ENUM_UNKNOWN = 0;
    PK_UPGRADE_KIND_ENUM_MINIMAL = 1;
    PK_UPGRADE_KIND_ENUM_DEFAULT = 2;
    PK_UPGRADE_KIND_ENUM_COMPLETE = 3;
    PK_UPGRADE_KIND_ENUM_LAST = 4;
;
{*
 * PkTransactionFlagEnum:
 * @PK_TRANSACTION_FLAG_ENUM_NONE: No transaction flag
 * @PK_TRANSACTION_FLAG_ENUM_ONLY_TRUSTED: Only allow trusted packages
 * @PK_TRANSACTION_FLAG_ENUM_SIMULATE: Simulate transaction
 * @PK_TRANSACTION_FLAG_ENUM_ONLY_DOWNLOAD: Only download packages
 * @PK_TRANSACTION_FLAG_ENUM_ALLOW_REINSTALL: Allow package reinstallation
 * @PK_TRANSACTION_FLAG_ENUM_JUST_REINSTALL: Only allow package reinstallation
 * @PK_TRANSACTION_FLAG_ENUM_ALLOW_DOWNGRADE: Allow packages to be downgraded
 * @PK_TRANSACTION_FLAG_ENUM_LAST:
 *
 * The transaction flags that alter how the transaction is handled
 * }
{ Since: 0.8.1  }
{ Since: 0.8.1  }
{ Since: 0.8.1  }
{ Since: 0.8.1  }
{ Since: 1.0.2  }
{ Since: 1.0.2  }
{ Since: 1.0.2  }
{ Since: 0.8.1  }
type
  PPkTransactionFlagEnum = ^TPkTransactionFlagEnum;
  TPkTransactionFlagEnum =  Longint;
  Const
    PK_TRANSACTION_FLAG_ENUM_NONE = 0;
    PK_TRANSACTION_FLAG_ENUM_ONLY_TRUSTED = 1;
    PK_TRANSACTION_FLAG_ENUM_SIMULATE = 2;
    PK_TRANSACTION_FLAG_ENUM_ONLY_DOWNLOAD = 3;
    PK_TRANSACTION_FLAG_ENUM_ALLOW_REINSTALL = 4;
    PK_TRANSACTION_FLAG_ENUM_JUST_REINSTALL = 5;
    PK_TRANSACTION_FLAG_ENUM_ALLOW_DOWNGRADE = 6;
    PK_TRANSACTION_FLAG_ENUM_LAST = 7;
;
{ general  }
(* Const before type ignored *)
(* Const before type ignored *)

function pk_enum_find_value(table:PPkEnumMatch; _string:Pgchar):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pk_enum_find_string(table:PPkEnumMatch; value:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_sig_type_enum_from_string(sig_type:Pgchar):TPkSigTypeEnum;cdecl;external;
(* Const before type ignored *)
function pk_sig_type_enum_to_string(sig_type:TPkSigTypeEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_info_enum_from_string(info:Pgchar):TPkInfoEnum;cdecl;external;
(* Const before type ignored *)
function pk_info_enum_to_string(info:TPkInfoEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_update_state_enum_from_string(update_state:Pgchar):TPkUpdateStateEnum;cdecl;external;
(* Const before type ignored *)
function pk_update_state_enum_to_string(update_state:TPkUpdateStateEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_exit_enum_from_string(exit:Pgchar):TPkExitEnum;cdecl;external;
(* Const before type ignored *)
function pk_exit_enum_to_string(exit:TPkExitEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_network_enum_from_string(network:Pgchar):TPkNetworkEnum;cdecl;external;
(* Const before type ignored *)
function pk_network_enum_to_string(network:TPkNetworkEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_status_enum_from_string(status:Pgchar):TPkStatusEnum;cdecl;external;
(* Const before type ignored *)
function pk_status_enum_to_string(status:TPkStatusEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_role_enum_from_string(role:Pgchar):TPkRoleEnum;cdecl;external;
(* Const before type ignored *)
function pk_role_enum_to_string(role:TPkRoleEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_error_enum_from_string(code:Pgchar):TPkErrorEnum;cdecl;external;
(* Const before type ignored *)
function pk_error_enum_to_string(code:TPkErrorEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_restart_enum_from_string(restart:Pgchar):TPkRestartEnum;cdecl;external;
(* Const before type ignored *)
function pk_restart_enum_to_string(restart:TPkRestartEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_group_enum_from_string(group:Pgchar):TPkGroupEnum;cdecl;external;
(* Const before type ignored *)
function pk_group_enum_to_string(group:TPkGroupEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_filter_enum_from_string(filter:Pgchar):TPkFilterEnum;cdecl;external;
(* Const before type ignored *)
function pk_filter_enum_to_string(filter:TPkFilterEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_distro_upgrade_enum_from_string(upgrade:Pgchar):TPkDistroUpgradeEnum;cdecl;external;
(* Const before type ignored *)
function pk_distro_upgrade_enum_to_string(upgrade:TPkDistroUpgradeEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_media_type_enum_from_string(media_type:Pgchar):TPkMediaTypeEnum;cdecl;external;
(* Const before type ignored *)
function pk_media_type_enum_to_string(media_type:TPkMediaTypeEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_authorize_type_enum_from_string(authorize_type:Pgchar):TPkAuthorizeEnum;cdecl;external;
(* Const before type ignored *)
function pk_authorize_type_enum_to_string(authorize_type:TPkAuthorizeEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_upgrade_kind_enum_from_string(upgrade_kind:Pgchar):TPkUpgradeKindEnum;cdecl;external;
(* Const before type ignored *)
function pk_upgrade_kind_enum_to_string(upgrade_kind:TPkUpgradeKindEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_transaction_flag_enum_from_string(transaction_flag:Pgchar):TPkTransactionFlagEnum;cdecl;external;
(* Const before type ignored *)
function pk_transaction_flag_enum_to_string(transaction_flag:TPkTransactionFlagEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_status_enum_to_localised_text(status:TPkStatusEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_info_enum_to_localised_past(info:TPkInfoEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_info_enum_to_localised_present(info:TPkInfoEnum):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_role_enum_to_localised_present(role:TPkRoleEnum):Pgchar;cdecl;external;
{$endif}
{ __PK_ENUM_H  }

implementation


end.
