
unit Eeze_Disk;
interface

{
  Automatically converted by H2Pas 1.0.0 from Eeze_Disk.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Eeze_Disk.h
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
Pchar  = ^char;
PEeze_Disk  = ^Eeze_Disk;
PEeze_Disk_Type  = ^Eeze_Disk_Type;
PEeze_Event_Disk  = ^Eeze_Event_Disk;
PEeze_Event_Disk_Error  = ^Eeze_Event_Disk_Error;
PEeze_Mount_Opts  = ^Eeze_Mount_Opts;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EEZE_DISK_H}
{$define EEZE_DISK_H}
{$include <Eina.h>}
{$include <Ecore.h>}
{$ifdef extern}
{$undef extern}
{$endif}
{*
 * @file Eeze_Disk.h
 * @brief Disk manipulation
 * @since 1.1
 *
 * Eeze disk functions allow you to quickly and efficiently manipulate disks
 * through simple function calls.
 *
 * @defgroup Eeze_Disk Disk
 * Scan and query information about disks. Manipulate them with moun,
 * unmount and eject.
 *
 * @ingroup Eeze
 * @
  }
{ C++ extern C conditionnal removed }
{*
 * @enum Eeze_Disk_Type
 * @since 1.1
 *
 * All disk types known to Eeze.
  }
{*< type could not be determined  }
{*< internal drive  }
{*< cdrom drive  }
{*< usb drive  }
{*< flash disk  }
type
  PEeze_Disk_Type = ^TEeze_Disk_Type;
  TEeze_Disk_Type =  Longint;
  Const
    EEZE_DISK_TYPE_UNKNOWN = 0;
    EEZE_DISK_TYPE_INTERNAL = 1 shl 0;
    EEZE_DISK_TYPE_CDROM = 1 shl 1;
    EEZE_DISK_TYPE_USB = 1 shl 2;
    EEZE_DISK_TYPE_FLASH = 1 shl 3;
;
{*
 * @enum Eeze_Mount_Opts
 * @since 1.1
 *
 * All mount options known to Eeze.
  }
  EEZE_DISK_MOUNTOPT_DEFAULTS = (EEZE_DISK_MOUNTOPT_UTF8 or EEZE_DISK_MOUNTOPT_NOEXEC) or EEZE_DISK_MOUNTOPT_NOSUID;  
{*< use current user's uid  }
{*< @since 1.7  }
type
  PEeze_Mount_Opts = ^TEeze_Mount_Opts;
  TEeze_Mount_Opts =  Longint;
  Const
    EEZE_DISK_MOUNTOPT_LOOP = 1 shl 1;
    EEZE_DISK_MOUNTOPT_UTF8 = 1 shl 2;
    EEZE_DISK_MOUNTOPT_NOEXEC = 1 shl 3;
    EEZE_DISK_MOUNTOPT_NOSUID = 1 shl 4;
    EEZE_DISK_MOUNTOPT_REMOUNT = 1 shl 5;
    EEZE_DISK_MOUNTOPT_UID = 1 shl 6;
    EEZE_DISK_MOUNTOPT_NODEV = 1 shl 7;
;
  var
    EEZE_EVENT_DISK_MOUNT : longint;cvar;external;
    EEZE_EVENT_DISK_UNMOUNT : longint;cvar;external;
    EEZE_EVENT_DISK_EJECT : longint;cvar;external;
    EEZE_EVENT_DISK_ERROR : longint;cvar;external;
type
  TEeze_Event_Disk = TEeze_Event_Disk_Mount;
  TEeze_Event_Disk = TEeze_Event_Disk_Unmount;
  TEeze_Event_Disk = TEeze_Event_Disk_Eject;
{*
 * @typedef Eeze_Disk
 * @since 1.1
 *
 * Handle for an Eeze Disk.
  }
  PEeze_Event_Disk = ^TEeze_Event_Disk;
  TEeze_Event_Disk = record
      disk : PEeze_Disk;
    end;

{*
 * @typedef Eeze_Event_Disk_Error
 * @since 1.1
 *
 * Contains the human readable error message.
  }
(* Const before type ignored *)
  PEeze_Event_Disk_Error = ^TEeze_Event_Disk_Error;
  TEeze_Event_Disk_Error = record
      disk : PEeze_Disk;
      message : Pchar;
    end;

{*
 * @brief Use this function to determine whether your eeze is disk-capable
 *
 * Since applications will die if they run/compile against a function that doesn't exist,
 * if your application successfully runs/compiles with this function then you have eeze_disk.
 * @since 1.1
  }

procedure eeze_disk_function;cdecl;external;
{*
 * @brief Return whether mount support is available in eeze
 *
 * Use this function to determine whether your Eeze library was compiled with a mount
 * binary available.
 * @since 1.1
  }
function eeze_disk_can_mount:TEina_Bool;cdecl;external;
{*
 * @brief Return whether unmount support is available in eeze
 *
 * Use this function to determine whether your Eeze library was compiled with an unmount
 * binary available.
 * @since 1.1
  }
function eeze_disk_can_unmount:TEina_Bool;cdecl;external;
{*
 * @brief Return whether eject support is available in eeze
 *
 * Use this function to determine whether your Eeze library was compiled with an eject
 * binary available.
 * @since 1.1
  }
function eeze_disk_can_eject:TEina_Bool;cdecl;external;
{*
 * @brief Create a new disk object from a /sys/ path or /dev/ path
 * @param path The /sys/ or /dev path of the disk; CANNOT be @c NULL.
 * @return The new disk object
 *
 * This function creates a new #Eeze_Disk from @p path.  Note that this function
 * does the minimal amount of work in order to save memory, and udev info about the disk
 * is not retrieved in this call.
 * @since 1.1
  }
(* Const before type ignored *)
function eeze_disk_new(path:Pchar):PEeze_Disk;cdecl;external;
{*
 * @brief Create a new disk object from a mount point
 * @param mount_point The mount point of the disk; CANNOT be @c NULL
 * @return The new disk object
 *
 * This function creates a new #Eeze_Disk from @p mount_point.  Note that this function
 * does the minimal amount of work in order to save memory, and udev info about the disk
 * is not retrieved in this call.  If the disk is not currently mounted, it must have an entry
 * in /etc/fstab.
 * @since 1.1
  }
(* Const before type ignored *)
function eeze_disk_new_from_mount(mount_point:Pchar):PEeze_Disk;cdecl;external;
{*
 * @brief Frees a disk object
 * @param disk The disk object to free
 *
 * This call frees an #Eeze_Disk.  Once freed, the disk can no longer be used.
 * @since 1.1
  }
procedure eeze_disk_free(disk:PEeze_Disk);cdecl;external;
{*
 * @brief Retrieve all disk information
 * @param disk
 *
 * Use this function to retrieve all of a disk's information at once, then use
 * a "get" function to retrieve the value.  Data retrieved in this call is cached,
 * meaning that subsequent calls will return immediately without performing any work.
 * @since 1.1
  }
procedure eeze_disk_scan(disk:PEeze_Disk);cdecl;external;
{*
 * @brief Associate data with a disk
 * @param disk The disk
 * @param data The data
 *
 * Data can be associated with @p disk with this function.
 * @see eeze_disk_data_get
 * @since 1.1
  }
procedure eeze_disk_data_set(disk:PEeze_Disk; data:pointer);cdecl;external;
{*
 * @brief Retrieve data previously associated with a disk
 * @param disk The disk
 * @return The data
 *
 * Data that has been previously associated with @p disk
 * is returned with this function.
 * @see eeze_disk_data_set
 * @since 1.1
  }
function eeze_disk_data_get(disk:PEeze_Disk):pointer;cdecl;external;
{*
 * @brief Return the /sys/ path of a disk
 * @param disk The disk
 * @return The /sys/ path
 *
 * This retrieves the /sys/ path that udev associates with @p disk.
 * @since 1.1
  }
(* Const before type ignored *)
function eeze_disk_syspath_get(disk:PEeze_Disk):Pchar;cdecl;external;
{*
 * @brief Return the /dev/ path of a disk
 * @param disk The disk
 * @return The /dev/ path
 *
 * This retrieves the /dev/ path that udev has created a device node at for @p disk.
 * @since 1.1
  }
(* Const before type ignored *)
function eeze_disk_devpath_get(disk:PEeze_Disk):Pchar;cdecl;external;
{*
 * @brief Return the filesystem of the disk (if known)
 * @param disk The disk
 * @return The filesystem type
 *
 * This retrieves the filesystem that the disk is using, or @c NULL if unknown.
 * @since 1.1
  }
(* Const before type ignored *)
function eeze_disk_fstype_get(disk:PEeze_Disk):Pchar;cdecl;external;
{*
 * @brief Return the manufacturing vendor of the disk
 * @param disk The disk
 * @return The vendor
 *
 * This retrieves the vendor which manufactured the disk, or @c NULL if unknown.
 * @since 1.1
  }
(* Const before type ignored *)
function eeze_disk_vendor_get(disk:PEeze_Disk):Pchar;cdecl;external;
{*
 * @brief Return the model of the disk
 * @param disk The disk
 * @return The model
 *
 * This retrieves the model of the disk, or @c NULL if unknown.
 * @since 1.1
  }
(* Const before type ignored *)
function eeze_disk_model_get(disk:PEeze_Disk):Pchar;cdecl;external;
{*
 * @brief Return the serial number of the disk
 * @param disk The disk
 * @return The serial number
 *
 * This retrieves the serial number the disk, or @c NULL if unknown.
 * @since 1.1
  }
(* Const before type ignored *)
function eeze_disk_serial_get(disk:PEeze_Disk):Pchar;cdecl;external;
{*
 * @brief Return the UUID of the disk
 * @param disk The disk
 * @return The UUID
 *
 * This retrieves the UUID of the disk, or @c NULL if unknown.
 * A UUID is a 36 character (hopefully) unique identifier which can
 * be used to store persistent information about a disk.
 * @since 1.1
  }
(* Const before type ignored *)
function eeze_disk_uuid_get(disk:PEeze_Disk):Pchar;cdecl;external;
{*
 * @brief Return the label of the disk
 * @param disk The disk
 * @return The label
 *
 * This retrieves the label (name) of the disk, or @c NULL if unknown.
 * @since 1.1
  }
(* Const before type ignored *)
function eeze_disk_label_get(disk:PEeze_Disk):Pchar;cdecl;external;
{*
 * @brief Return the #Eeze_Disk_Type of the disk
 * @param disk The disk
 * @return The type
 *
 * This retrieves the #Eeze_Disk_Type of the disk.  This call is useful for determining
 * the bus that the disk is connected through.
 * @since 1.1
  }
function eeze_disk_type_get(disk:PEeze_Disk):TEeze_Disk_Type;cdecl;external;
{*
 * @brief Return whether the disk is removable
 * @param disk The disk
 * @return @c EINA_TRUE if removable, @c EINA_FALSE otherwise.
 * @since 1.1
  }
function eeze_disk_removable_get(disk:PEeze_Disk):TEina_Bool;cdecl;external;
{*
 * @brief Return the mount state of a disk
 * @param disk The disk
 * @return The mount state
 *
 * This returns the mounted state of the disk.  @c EINA_TRUE if mounted,
 * @c EINA_FALSE otherwise.
 * @since 1.1
  }
function eeze_disk_mounted_get(disk:PEeze_Disk):TEina_Bool;cdecl;external;
{*
 * @brief Get the previously set mount wrapper for a disk
 * @param disk The disk
 * @return The wrapper, or @c NULL on failure.
 *
 * This returns the wrapper previously set with eeze_disk_mount_wrapper_set
 * @since 1.1
  }
(* Const before type ignored *)
function eeze_disk_mount_wrapper_get(disk:PEeze_Disk):Pchar;cdecl;external;
{*
 * @brief Set a wrapper to run mount commands with
 * @param disk The disk to wrap mount commands for
 * @param wrapper The wrapper executable
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * Use this function to set up a wrapper for running mount/umount commands. The wrapper must
 * NOT use any of the standard mount/umount error code return values, and it must return 0 on success.
 * Note that this function will call stat() on @p wrapper if not @c NULL to test for existence.
 * @since 1.1
  }
(* Const before type ignored *)
function eeze_disk_mount_wrapper_set(disk:PEeze_Disk; wrapper:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Begin a mount operation on the disk
 * @param disk The disk
 * @return @c EINA_TRUE if the operation was started, @c EINA_FALSE otherwise.
 *
 * This call is used to begin a mount operation on @p disk.  The operation will
 * run asynchronously in a pipe, emitting an EEZE_EVENT_DISK_MOUNT event with the disk object
 * as its event on completion.  If any errors are encountered, they will automatically logged
 * to the eeze_disk domain and an EEZE_EVENT_DISK_ERROR event will be generated with an #Eeze_Event_Disk_Error
 * struct as its event.
 *
 * NOTE: The return value of this function does not in any way reflect the mount state of a disk.
 * @since 1.1
  }
function eeze_disk_mount(disk:PEeze_Disk):TEina_Bool;cdecl;external;
{*
 * @brief Begin an unmount operation on the disk
 * @param disk The disk
 * @return @c EINA_TRUE if the operation was started, @c EINA_FALSE otherwise.
 *
 * This call is used to begin an unmount operation on @p disk.  The operation will
 * run asynchronously in a pipe, emitting an EEZE_EVENT_DISK_UNMOUNT event with the disk object
 * as its event on completion.  If any errors are encountered, they will automatically logged
 * to the eeze_disk domain and an EEZE_EVENT_DISK_ERROR event will be generated with
 * an #Eeze_Event_Disk_Error struct as its event.
 *
 * NOTE: The return value of this function does not in any way reflect the mount state of a disk.
 * @since 1.1
  }
function eeze_disk_unmount(disk:PEeze_Disk):TEina_Bool;cdecl;external;
{*
 * @brief Begin an eject operation on the disk
 * @param disk The disk
 * @return @c EINA_TRUE if the operation was started, @c EINA_FALSE otherwise.
 *
 * This call is used to begin an eject operation on @p disk.  The operation will
 * run asynchronously in a pipe, emitting an EEZE_EVENT_DISK_EJECT event with the disk object
 * as its event on completion.  If any errors are encountered, they will automatically logged
 * to the eeze_disk domain and an EEZE_EVENT_DISK_ERROR event will be generated with
 * an #Eeze_Event_Disk_Error struct as its event.
 *
 * NOTE: The return value of this function does not in any way reflect the mount state of a disk.
 * @since 1.1
  }
function eeze_disk_eject(disk:PEeze_Disk):TEina_Bool;cdecl;external;
{*
 * @brief Cancel a pending operation on the disk
 * @param disk The disk
 *
 * This function cancels the current pending operation on @p disk which was previously
 * started with eeze_disk_mount or eeze_disk_unmount.
 * @since 1.1
  }
procedure eeze_disk_cancel(disk:PEeze_Disk);cdecl;external;
{*
 * @brief Return the mount point of a disk
 * @param disk The disk
 * @return The mount point
 *
 * This function returns the mount point associated with @p disk.
 * Note that to determine whether the disk is actually mounted, eeze_disk_mounted_get should be used.
 * @since 1.1
  }
(* Const before type ignored *)
function eeze_disk_mount_point_get(disk:PEeze_Disk):Pchar;cdecl;external;
{*
 * @brief Set the mount point of a disk
 * @param disk The disk
 * @param mount_point The mount point
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * This function sets the mount point associated with @p disk.
 * Note that to determine whether the disk is actually mounted, eeze_disk_mounted_get should be used.
 * Also note that this function cannot be used while the disk is mounted to avoid losing the current mount point.
 * @since 1.1
  }
(* Const before type ignored *)
function eeze_disk_mount_point_set(disk:PEeze_Disk; mount_point:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Set the mount options using flags
 * @param disk The disk
 * @param opts An ORed set of #Eeze_Mount_Opts
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * This function replaces the current mount opts of a disk with the ones in @p opts.
 * @since 1.1
  }
function eeze_disk_mountopts_set(disk:PEeze_Disk; opts:dword):TEina_Bool;cdecl;external;
{*
 * @brief Get the flags of a disk's current mount options
 * @param disk The disk
 * @return An ORed set of #Eeze_Mount_Opts, 0 on failure
 *
 * This function returns the current mount opts of a disk.
 * @since 1.1
  }
function eeze_disk_mountopts_get(disk:PEeze_Disk):dword;cdecl;external;
{*
 * @brief Begin watching mtab and fstab
 * @return @c EINA_TRUE if watching was started, @c EINA_FALSE otherwise.
 *
 * This function creates inotify watches on /etc/mtab and /etc/fstab and watches
 * them for changes.  This function should be used when expecting a lot of disk
 * mounting/unmounting while you need disk data since it will automatically update
 * certain necessary data instead of waiting.
 * @see eeze_mount_mtab_scan, eeze_mount_fstab_scan
 * @since 1.1
  }
function eeze_mount_tabs_watch:TEina_Bool;cdecl;external;
{*
 * @brief Stop watching /etc/fstab and /etc/mtab
 *
 * This function stops watching fstab and mtab.  Data obtained previously will be saved.
 * @since 1.1
  }
procedure eeze_mount_tabs_unwatch;cdecl;external;
{*
 * @brief Scan /etc/mtab a single time
 * @return @c EINA_TRUE if mtab could be scanned, @c EINA_FALSE otherwise.
 *
 * This function is used to perform a single scan on /etc/mtab.  It is used to gather
 * information about mounted filesystems which can then be used with your #Eeze_Disk objects
 * where appropriate.  These files will automatically be scanned any time a mount point or mount state
 * is requested unless eeze_mount_tabs_watch has been called previously, in which case data is stored for
 * use.
 * If this function is called after eeze_mount_tabs_watch, @c EINA_TRUE will be returned.
 * @see eeze_mount_tabs_watch, eeze_mount_fstab_scan
 * @since 1.1
  }
function eeze_mount_mtab_scan:TEina_Bool;cdecl;external;
{*
 * @brief Scan /etc/fstab a single time
 * @return @c EINA_TRUE if mtab could be scanned, @c EINA_FALSE otherwise.
 *
 * This function is used to perform a single scan on /etc/fstab.  It is used to gather
 * information about mounted filesystems which can then be used with your #Eeze_Disk objects
 * where appropriate.  These files will automatically be scanned any time a mount point or mount state
 * is requested unless eeze_mount_tabs_watch has been called previously, in which case data is stored for
 * use.
 * If this function is called after eeze_mount_tabs_watch, @c EINA_TRUE will be returned.
 * @see eeze_mount_tabs_watch, eeze_mount_mtab_scan
 * @since 1.1
  }
function eeze_mount_fstab_scan:TEina_Bool;cdecl;external;
{*
 * @brief Get the property value of a disk
 *
 * @param disk The disk
 * @param property The property to get; full list of these is a FIXME
 * @return A stringshared char* with the property or @c NULL on failure.
 * @since 1.1
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eeze_disk_udev_get_property(disk:PEeze_Disk; _property:Pchar):Pchar;cdecl;external;
{*
 * @brief Get the sysattr value of a disk.
 *
 * @param disk The disk
 * @param sysattr The sysattr to get; full list of these is a FIXME
 * @return A stringshared char* with the sysattr or @c NULL on failure.
 * @since 1.1
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eeze_disk_udev_get_sysattr(disk:PEeze_Disk; sysattr:Pchar):Pchar;cdecl;external;
{*
 * Find the root device of a disk.
 *
 * @param disk The disk
 * @return The syspath of the parent device
 *
 * Return a stringshared syspath (/sys/$syspath) for the parent device.
 * @since 1.1
  }
(* Const before type ignored *)
function eeze_disk_udev_get_parent(disk:PEeze_Disk):Pchar;cdecl;external;
{*
 * Walks up the device chain using the device from @p disk,
 * checking each device for @p sysattr with (optional) @p value.
 *
 * @param disk The disk to walk
 * @param sysattr The attribute to find
 * @param value OPTIONAL: The value that @p sysattr should have, or @c NULL.
 *
 * @return If the sysattr (with value) is found, returns @c EINA_TRUE,
 * @c EINA_FALSE otherwise.
 * @since 1.1
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eeze_disk_udev_walk_check_sysattr(disk:PEeze_Disk; sysattr:Pchar; value:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Walks up the device chain of @p disk
 * checking each device for @p sysattr and returns the value if found.
 *
 * @param disk The disk
 * @param sysattr The attribute to find
 *
 * @return The stringshared value of @p sysattr if found, or @c NULL.
 * @since 1.1
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eeze_disk_udev_walk_get_sysattr(disk:PEeze_Disk; sysattr:Pchar):Pchar;cdecl;external;
{ C++ end of extern C conditionnal removed }
{*
 * @
  }
{$endif}

implementation


end.
