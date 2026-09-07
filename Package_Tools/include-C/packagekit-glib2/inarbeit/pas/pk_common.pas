unit pk_common;

interface

uses
  fp_glib2, fp_packagekit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  PK_DBUS_SERVICE = 'org.freedesktop.PackageKit';
  PK_DBUS_PATH = '/org/freedesktop/PackageKit';
  PK_DBUS_INTERFACE = 'org.freedesktop.PackageKit';
  PK_DBUS_INTERFACE_TRANSACTION = 'org.freedesktop.PackageKit.Transaction';
  PK_DBUS_INTERFACE_OFFLINE = 'org.freedesktop.PackageKit.Offline';
  PK_SYSTEM_PACKAGE_LIST_FILENAME = '/var/lib/PackageKit/system.package-list';
  PK_SYSTEM_PACKAGE_CACHE_FILENAME = '/var/lib/PackageKit/package-cache.db';

function pk_ptr_array_to_strv(arr: PGPtrArray):PPgchar; cdecl; external libpackagekit;
function pk_iso8601_present: Pgchar; cdecl; external libpackagekit;
function pk_iso8601_from_date(date: PGDate): Pgchar; cdecl; external libpackagekit;
function pk_iso8601_to_date(iso_date: Pgchar): PGDate; cdecl; external libpackagekit;
function pk_iso8601_to_datetime(iso_date: Pgchar): PGDateTime; cdecl; external libpackagekit;
function pk_get_distro_id: Pgchar; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:04:00 ===


implementation



end.
