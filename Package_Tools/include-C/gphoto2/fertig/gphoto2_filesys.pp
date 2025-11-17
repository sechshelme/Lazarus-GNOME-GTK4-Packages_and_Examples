
unit gphoto2_filesys;
interface

{
  Automatically converted by H2Pas 1.0.0 from gphoto2_filesys.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gphoto2_filesys.h
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
PCameraFile  = ^CameraFile;
PCameraFileInfo  = ^CameraFileInfo;
PCameraFileInfoAudio  = ^CameraFileInfoAudio;
PCameraFileInfoFields  = ^CameraFileInfoFields;
PCameraFileInfoFile  = ^CameraFileInfoFile;
PCameraFileInfoPreview  = ^CameraFileInfoPreview;
PCameraFilePermissions  = ^CameraFilePermissions;
PCameraFileStatus  = ^CameraFileStatus;
PCameraFilesystem  = ^CameraFilesystem;
PCameraFilesystemFuncs  = ^CameraFilesystemFuncs;
PCameraList  = ^CameraList;
PCameraStorageAccessType  = ^CameraStorageAccessType;
PCameraStorageFilesystemType  = ^CameraStorageFilesystemType;
PCameraStorageInfoFields  = ^CameraStorageInfoFields;
PCameraStorageInformation  = ^CameraStorageInformation;
PCameraStorageType  = ^CameraStorageType;
Pchar  = ^char;
PGPContext  = ^GPContext;
Plongint  = ^longint;
Puint64_t  = ^uint64_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file
 * \brief Filesystem related operations and declarations.
 *
 * \author Copyright 2000 Scott Fritzinger
 * \author Copyright 2008-2009 Marcus Meissner
 *
 * \note
 * Contributions:
 * 	Lutz Mueller <lutz@users.sf.net> (2001)
 *
 * \note
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * \note
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * \note
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA
  }
{$ifndef LIBGPHOTO2_GPHOTO2_FILESYS_H}
{$define LIBGPHOTO2_GPHOTO2_FILESYS_H}
{$include <time.h>}
{$include <stdint.h>}
{$include <gphoto2/gphoto2-context.h>}
{$include <gphoto2/gphoto2-list.h>}
{$include <gphoto2/gphoto2-file.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * \brief Bitmask on what fields are set in the CameraFileInfo structure.
 *
 * Bitmask to mark up which fields are set in the CameraFileInfo
 * structure. The other fields might be uninitialized.
 * If you set information via gp_camera_file_set_info() you
 * need to set those flags. If you retrieve information via
 * gp_camera_file_get_info() you need to check those flags.
 * They are separate for both "normal" and "preview" parts
 * and are mostly image related.
  }
{*< \brief No fields set.  }
{*< \brief The MIME type is set.  }
{*< \brief The filesize is set.  }
{*< \brief The width is set.  }
{*< \brief The height is set.  }
{*< \brief The access permissions are set.  }
{*< \brief The status is set (downloaded).  }
{*< \brief The modification time is set.  }
{*< \brief All possible fields set. Internal.  }
type
  PCameraFileInfoFields = ^TCameraFileInfoFields;
  TCameraFileInfoFields =  Longint;
  Const
    GP_FILE_INFO_NONE = 0;
    GP_FILE_INFO_TYPE = 1 shl 0;
    GP_FILE_INFO_SIZE = 1 shl 2;
    GP_FILE_INFO_WIDTH = 1 shl 3;
    GP_FILE_INFO_HEIGHT = 1 shl 4;
    GP_FILE_INFO_PERMISSIONS = 1 shl 5;
    GP_FILE_INFO_STATUS = 1 shl 6;
    GP_FILE_INFO_MTIME = 1 shl 7;
    GP_FILE_INFO_ALL = $FF;
;
{*
 * \brief Bitmask containing the file permission flags.
 *
 * Possible flag values of the permission entry in the file information.
  }
{*< \brief No permissions.  }
{*< \brief Read permissions.  }
{*< \brief Write permissions  }
{*< \brief Internal.  }
type
  PCameraFilePermissions = ^TCameraFilePermissions;
  TCameraFilePermissions =  Longint;
  Const
    GP_FILE_PERM_NONE = 0;
    GP_FILE_PERM_READ = 1 shl 0;
    GP_FILE_PERM_DELETE = 1 shl 1;
    GP_FILE_PERM_ALL = $FF;
;
{*
 * \brief Possible status values.
 *
 * Bitmask of possible stati. Currently only download is supported.
  }
{*< File is not downloaded.  }
{*< File is already downloaded.  }
type
  PCameraFileStatus = ^TCameraFileStatus;
  TCameraFileStatus =  Longint;
  Const
    GP_FILE_STATUS_NOT_DOWNLOADED = 0;
    GP_FILE_STATUS_DOWNLOADED = 1;
;
{*
 * \brief File information of a regular file.
 *
 * Contains information a regular file with fields being
 * set depending on the bitmask in the fields member.
  }
{*< \brief Bitmask containing the set members.  }
{*< \brief Status of the file.  }
{*< \brief Size of the file.  }
{*< \brief MIME type of the file.  }
{*< \brief Height of the file.  }
{*< \brief Width of the file.  }
{*< \brief Permissions of the file.  }
{*< \brief Modification time of the file.  }
type
  PCameraFileInfoFile = ^TCameraFileInfoFile;
  TCameraFileInfoFile = record
      fields : TCameraFileInfoFields;
      status : TCameraFileStatus;
      size : Tuint64_t;
      _type : array[0..63] of char;
      width : Tuint32_t;
      height : Tuint32_t;
      permissions : TCameraFilePermissions;
      mtime : Ttime_t;
    end;
{*
 * \brief File information of a preview file.
 *
 * Contains information of a preview file with fields being
 * set depending on the bitmask in the fields member.
  }
{*< \brief Bitmask containing the set members.  }
{*< \brief Status of the preview.  }
{*< \brief Size of the preview.  }
{*< \brief MIME type of the preview.  }
{*< \brief Width of the preview.  }
{*< \brief Height of the preview.  }

  PCameraFileInfoPreview = ^TCameraFileInfoPreview;
  TCameraFileInfoPreview = record
      fields : TCameraFileInfoFields;
      status : TCameraFileStatus;
      size : Tuint64_t;
      _type : array[0..63] of char;
      width : Tuint32_t;
      height : Tuint32_t;
    end;
{*
 * \brief File information of an audio file.
 *
 * Contains information of an audio file with fields being
 * set depending on the bitmask in the fields member.
  }
{*< \brief Bitmask containing the set members.  }
{*< \brief Status of the preview file.  }
{*< \brief Size of the audio file.  }
{*< \brief MIME type of the audio file.  }

  PCameraFileInfoAudio = ^TCameraFileInfoAudio;
  TCameraFileInfoAudio = record
      fields : TCameraFileInfoFields;
      status : TCameraFileStatus;
      size : Tuint64_t;
      _type : array[0..63] of char;
    end;
{*
 * \brief File information structure.
 *
 * Contains the normal, preview and audio file information structures
 * for a specific file.
  }

  PCameraFileInfo = ^TCameraFileInfo;
  TCameraFileInfo = record
      preview : TCameraFileInfoPreview;
      file : TCameraFileInfoFile;
      audio : TCameraFileInfoAudio;
    end;
{*
 * \brief Storage information flags.
 *
 * Bitmask to specify which entries of the filesystem
 * storage information is set.
  }
{*< \brief The base directory.
							 * Usually / if just 1 storage is attached.
							  }
{*< \brief Label of the filesystem.
							 * Could also be a DOS label.
							  }
{*< \brief More verbose description.  }
{*< \brief Access permissions.  }
{*< \brief Hardware type.  }
{*< \brief Filesystem type.  }
{*< \brief Maximum capacity in kbytes  }
{*< \brief Free space in kbytes.  }
{*< \brief Free space in images.  }

  PCameraStorageInfoFields = ^TCameraStorageInfoFields;
  TCameraStorageInfoFields =  Longint;
  Const
    GP_STORAGEINFO_BASE = 1 shl 0;
    GP_STORAGEINFO_LABEL = 1 shl 1;
    GP_STORAGEINFO_DESCRIPTION = 1 shl 2;
    GP_STORAGEINFO_ACCESS = 1 shl 3;
    GP_STORAGEINFO_STORAGETYPE = 1 shl 4;
    GP_STORAGEINFO_FILESYSTEMTYPE = 1 shl 5;
    GP_STORAGEINFO_MAXCAPACITY = 1 shl 6;
    GP_STORAGEINFO_FREESPACEKBYTES = 1 shl 7;
    GP_STORAGEINFO_FREESPACEIMAGES = 1 shl 8;
;
{*
 * \brief Hardware storage types.
 *
 * Type of hardware this storage is on. The types and values
 * are the same as the PTP standard uses (PTP_ST_xxx).
  }
{*< \brief Unknown storage type.  }
{*< \brief A fixed ROM storage.  }
{*< \brief A removable ROM storage.  }
{*< \brief A fixed RAM storage. (e.g. SDRAM)  }
{*< \brief A removable RAM storage. (any kind of cards etc)  }
type
  PCameraStorageType = ^TCameraStorageType;
  TCameraStorageType =  Longint;
  Const
    GP_STORAGEINFO_ST_UNKNOWN = 0;
    GP_STORAGEINFO_ST_FIXED_ROM = 1;
    GP_STORAGEINFO_ST_REMOVABLE_ROM = 2;
    GP_STORAGEINFO_ST_FIXED_RAM = 3;
    GP_STORAGEINFO_ST_REMOVABLE_RAM = 4;
;
{*
 * \brief Storage access modes.
 *
 * The modes we can access the storage with. Uses the same
 * types and values as the PTP standard (PTP_AC_xxx).
  }
{*< \brief Storage is Read / Write.  }
{*< \brief Storage is Ready Only.  }
{*< \brief Storage is Ready Only, but allows Delete. }
type
  PCameraStorageAccessType = ^TCameraStorageAccessType;
  TCameraStorageAccessType =  Longint;
  Const
    GP_STORAGEINFO_AC_READWRITE = 0;
    GP_STORAGEINFO_AC_READONLY = 1;
    GP_STORAGEINFO_AC_READONLY_WITH_DELETE = 2;
;
{*
 * \brief Filesystem hierarchy types.
 *
 * The type of the filesystem hierarchy the devices uses.
 * Same types and values as the PTP standard defines (PTP_FST_xxx).
  }
{*< \brief Undefined or unknown filesystem hierarchy.  }
{*< \brief Generic flat storage (all in 1 directory).  }
{*< \brief Generic tree hierarchy.  }
{*< \brief DCIM style storage.  }
type
  PCameraStorageFilesystemType = ^TCameraStorageFilesystemType;
  TCameraStorageFilesystemType =  Longint;
  Const
    GP_STORAGEINFO_FST_UNDEFINED = 0;
    GP_STORAGEINFO_FST_GENERICFLAT = 1;
    GP_STORAGEINFO_FST_GENERICHIERARCHICAL = 2;
    GP_STORAGEINFO_FST_DCF = 3;
;
{*
 * \brief Storage information structue.
 *
 * This structure contains the information of a specific camera storage.
 * Only the members as specified by the \a fields member are valid.
  }
{*< \brief Bitmask of struct members that are specified.  }
{*< \brief Basedirectory of the storage. Will be "/" if just 1 storage on the camera.  }
{*< \brief Label of the storage. Similar to DOS label.  }
{*< \brief Description of the storage.  }
{*< \brief Hardware type of the storage.  }
{*< \brief Hierarchy type of the filesystem.  }
{*< \brief Access permissions.  }
{*< \brief Total capacity in kbytes.  }
{*< \brief Free space in kbytes.  }
{*< \brief Free space in images (guessed by camera).  }
type
  PCameraStorageInformation = ^TCameraStorageInformation;
  TCameraStorageInformation = record
      fields : TCameraStorageInfoFields;
      basedir : array[0..255] of char;
      _label : array[0..255] of char;
      description : array[0..255] of char;
      _type : TCameraStorageType;
      fstype : TCameraStorageFilesystemType;
      access : TCameraStorageAccessType;
      capacitykbytes : Tuint64_t;
      freekbytes : Tuint64_t;
      freeimages : Tuint64_t;
    end;
{*
 * \brief Filesystem structure, only exposed to camera drivers.
 *
 * Internal structure, contents not exposed to frontends. Camera
 * drivers get these passed to filesystem related functions and
 * are supposed to use it only via the accessor functions.
  }

function gp_filesystem_new(fs:PPCameraFilesystem):longint;cdecl;external;
function gp_filesystem_free(fs:PCameraFilesystem):longint;cdecl;external;
{ Manual editing  }
(* Const before type ignored *)
(* Const before type ignored *)
function gp_filesystem_append(fs:PCameraFilesystem; folder:Pchar; filename:Pchar; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_filesystem_set_info_noop(fs:PCameraFilesystem; folder:Pchar; filename:Pchar; info:TCameraFileInfo; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_filesystem_set_info_dirty(fs:PCameraFilesystem; folder:Pchar; filename:Pchar; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_filesystem_set_file_noop(fs:PCameraFilesystem; folder:Pchar; filename:Pchar; _type:TCameraFileType; file:PCameraFile; 
           context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_filesystem_delete_file_noop(fs:PCameraFilesystem; folder:Pchar; filename:Pchar; context:PGPContext):longint;cdecl;external;
function gp_filesystem_reset(fs:PCameraFilesystem):longint;cdecl;external;
{ Information retrieval  }
(* Const before type ignored *)
function gp_filesystem_count(fs:PCameraFilesystem; folder:Pchar; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_filesystem_name(fs:PCameraFilesystem; folder:Pchar; filenumber:longint; filename:PPchar; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
function gp_filesystem_get_folder(fs:PCameraFilesystem; filename:Pchar; folder:PPchar; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_filesystem_number(fs:PCameraFilesystem; folder:Pchar; filename:Pchar; context:PGPContext):longint;cdecl;external;
{ Listings  }
(* Const before type ignored *)
type

  TCameraFilesystemListFunc = function (fs:PCameraFilesystem; folder:Pchar; list:PCameraList; data:pointer; context:PGPContext):longint;cdecl;
(* Const before type ignored *)

function gp_filesystem_list_files(fs:PCameraFilesystem; folder:Pchar; list:PCameraList; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
function gp_filesystem_list_folders(fs:PCameraFilesystem; folder:Pchar; list:PCameraList; context:PGPContext):longint;cdecl;external;
{ File information  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  TCameraFilesystemSetInfoFunc = function (fs:PCameraFilesystem; folder:Pchar; filename:Pchar; info:TCameraFileInfo; data:pointer; 
               context:PGPContext):longint;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  TCameraFilesystemGetInfoFunc = function (fs:PCameraFilesystem; folder:Pchar; filename:Pchar; info:PCameraFileInfo; data:pointer; 
               context:PGPContext):longint;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

function gp_filesystem_get_info(fs:PCameraFilesystem; folder:Pchar; filename:Pchar; info:PCameraFileInfo; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_filesystem_set_info(fs:PCameraFilesystem; folder:Pchar; filename:Pchar; info:TCameraFileInfo; context:PGPContext):longint;cdecl;external;
{ Files  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  TCameraFilesystemGetFileFunc = function (fs:PCameraFilesystem; folder:Pchar; filename:Pchar; _type:TCameraFileType; file:PCameraFile; 
               data:pointer; context:PGPContext):longint;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  TCameraFilesystemReadFileFunc = function (fs:PCameraFilesystem; folder:Pchar; filename:Pchar; _type:TCameraFileType; offset:Tuint64_t; 
               buf:Pchar; size:Puint64_t; data:pointer; context:PGPContext):longint;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  TCameraFilesystemDeleteFileFunc = function (fs:PCameraFilesystem; folder:Pchar; filename:Pchar; data:pointer; context:PGPContext):longint;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

function gp_filesystem_get_file(fs:PCameraFilesystem; folder:Pchar; filename:Pchar; _type:TCameraFileType; file:PCameraFile; 
           context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_filesystem_read_file(fs:PCameraFilesystem; folder:Pchar; filename:Pchar; _type:TCameraFileType; offset:Tuint64_t; 
           buf:Pchar; size:Puint64_t; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_filesystem_delete_file(fs:PCameraFilesystem; folder:Pchar; filename:Pchar; context:PGPContext):longint;cdecl;external;
{ Folders  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  TCameraFilesystemPutFileFunc = function (fs:PCameraFilesystem; folder:Pchar; filename:Pchar; _type:TCameraFileType; file:PCameraFile; 
               data:pointer; context:PGPContext):longint;cdecl;
(* Const before type ignored *)

  TCameraFilesystemDeleteAllFunc = function (fs:PCameraFilesystem; folder:Pchar; data:pointer; context:PGPContext):longint;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  TCameraFilesystemDirFunc = function (fs:PCameraFilesystem; folder:Pchar; name:Pchar; data:pointer; context:PGPContext):longint;cdecl;

  TCameraFilesystemStorageInfoFunc = function (fs:PCameraFilesystem; para2:PPCameraStorageInformation; nrofstorageinformations:Plongint; data:pointer; context:PGPContext):longint;cdecl;

function gp_filesystem_get_storageinfo(fs:PCameraFilesystem; para2:PPCameraStorageInformation; nrofstorageinformations:Plongint; context:PGPContext):longint;cdecl;external;
type
{ for later use. Remove one if you add a new function  }
  PCameraFilesystemFuncs = ^TCameraFilesystemFuncs;
  TCameraFilesystemFuncs = record
      file_list_func : TCameraFilesystemListFunc;cdecl;
      folder_list_func : TCameraFilesystemListFunc;
      put_file_func : TCameraFilesystemPutFileFunc;
      delete_all_func : TCameraFilesystemDeleteAllFunc;
      get_info_func : TCameraFilesystemGetInfoFunc;
      set_info_func : TCameraFilesystemSetInfoFunc;
      make_dir_func : TCameraFilesystemDirFunc;
      remove_dir_func : TCameraFilesystemDirFunc;
      get_file_func : TCameraFilesystemGetFileFunc;
      read_file_func : TCameraFilesystemReadFileFunc;
      del_file_func : TCameraFilesystemDeleteFileFunc;
      storage_info_func : TCameraFilesystemStorageInfoFunc;
      unused : array[0..30] of pointer;
    end;


function gp_filesystem_set_funcs(fs:PCameraFilesystem; funcs:PCameraFilesystemFuncs; data:pointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_filesystem_put_file(fs:PCameraFilesystem; folder:Pchar; filename:Pchar; _type:TCameraFileType; file:PCameraFile; 
           context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
function gp_filesystem_delete_all(fs:PCameraFilesystem; folder:Pchar; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_filesystem_make_dir(fs:PCameraFilesystem; folder:Pchar; name:Pchar; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_filesystem_remove_dir(fs:PCameraFilesystem; folder:Pchar; name:Pchar; context:PGPContext):longint;cdecl;external;
{ For debugging  }
function gp_filesystem_dump(fs:PCameraFilesystem):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ !defined(LIBGPHOTO2_GPHOTO2_FILESYS_H)  }

implementation


end.
