
unit gphoto2_abilities_list;
interface

{
  Automatically converted by H2Pas 1.0.0 from gphoto2_abilities_list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gphoto2_abilities_list.h
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
PCameraAbilities  = ^CameraAbilities;
PCameraAbilitiesList  = ^CameraAbilitiesList;
PCameraDriverStatus  = ^CameraDriverStatus;
PCameraFileOperation  = ^CameraFileOperation;
PCameraFolderOperation  = ^CameraFolderOperation;
PCameraList  = ^CameraList;
PCameraOperation  = ^CameraOperation;
Pchar  = ^char;
PGPContext  = ^GPContext;
PGphotoDeviceType  = ^GphotoDeviceType;
PGPPortInfoList  = ^GPPortInfoList;
PStringFlagItem  = ^StringFlagItem;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file gphoto2-abilities-list.h
 * \brief List of supported camera models including their abilities.
 *
 * \author Copyright 2000 Scott Fritzinger
 *
 * \par
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * \par
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * \par
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA
  }
{$ifndef LIBGPHOTO2_GPHOTO2_ABILITIES_LIST_H}
{$define LIBGPHOTO2_GPHOTO2_ABILITIES_LIST_H}
{$include <gphoto2/gphoto2-context.h>}
{$include <gphoto2/gphoto2-list.h>}
{$include <gphoto2/gphoto2-port-info-list.h>}
{$include <gphoto2/gphoto2-port-log.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * Current implementation status of the camera driver.
  }
{*< Driver is production ready.  }
{*< Driver is beta quality.  }
{*< Driver is alpha quality and might even not work.  }
{*< Driver is no longer recommended to use and will be removed.  }
type
  PCameraDriverStatus = ^TCameraDriverStatus;
  TCameraDriverStatus =  Longint;
  Const
    GP_DRIVER_STATUS_PRODUCTION = 0;
    GP_DRIVER_STATUS_TESTING = 1;
    GP_DRIVER_STATUS_EXPERIMENTAL = 2;
    GP_DRIVER_STATUS_DEPRECATED = 3;
;
{*
 * Type of the device represented. Currently we have Still Cameras
 * and MTP Audio Players.
  }
{*< Traditional still camera  }
{*< Audio player  }
type
  PGphotoDeviceType = ^TGphotoDeviceType;
  TGphotoDeviceType =  Longint;
  Const
    GP_DEVICE_STILL_CAMERA = 0;
    GP_DEVICE_AUDIO_PLAYER = 1 shl 0;
;
{*
 * A bitmask of remote control related operations of the device.
 * Some drivers might support additional dynamic capabilities (like the PTP driver).
  }
{*< No remote control operation supported.  }
{*< Capturing images supported.  }
{*< Capturing videos supported.  }
{*< Capturing audio supported.  }
{*< Capturing image previews supported.  }
{*< Camera and Driver configuration supported.  }
{*< Camera can trigger capture and wait for events.  }
type
  PCameraOperation = ^TCameraOperation;
  TCameraOperation =  Longint;
  Const
    GP_OPERATION_NONE = 0;
    GP_OPERATION_CAPTURE_IMAGE = 1 shl 0;
    GP_OPERATION_CAPTURE_VIDEO = 1 shl 1;
    GP_OPERATION_CAPTURE_AUDIO = 1 shl 2;
    GP_OPERATION_CAPTURE_PREVIEW = 1 shl 3;
    GP_OPERATION_CONFIG = 1 shl 4;
    GP_OPERATION_TRIGGER_CAPTURE = 1 shl 5;
;
{*
 * A bitmask of image related operations of the device.
  }
{*< No special file operations, just download.  }
{*< Deletion of files is possible.  }
{*< Previewing viewfinder content is possible.  }
{*< Raw retrieval is possible (used by non-JPEG cameras)  }
{*< Audio retrieval is possible.  }
{*< EXIF retrieval is possible.  }
type
  PCameraFileOperation = ^TCameraFileOperation;
  TCameraFileOperation =  Longint;
  Const
    GP_FILE_OPERATION_NONE = 0;
    GP_FILE_OPERATION_DELETE = 1 shl 1;
    GP_FILE_OPERATION_PREVIEW = 1 shl 3;
    GP_FILE_OPERATION_RAW = 1 shl 4;
    GP_FILE_OPERATION_AUDIO = 1 shl 5;
    GP_FILE_OPERATION_EXIF = 1 shl 6;
;
{*
 * A bitmask of filesystem related operations of the device.
  }
{*< No special filesystem operation.  }
{*< Deletion of all files on the device.  }
{*< Upload of files to the device possible.  }
{*< Making directories on the device possible.  }
{*< Removing directories from the device possible.  }
type
  PCameraFolderOperation = ^TCameraFolderOperation;
  TCameraFolderOperation =  Longint;
  Const
    GP_FOLDER_OPERATION_NONE = 0;
    GP_FOLDER_OPERATION_DELETE_ALL = 1 shl 0;
    GP_FOLDER_OPERATION_PUT_FILE = 1 shl 1;
    GP_FOLDER_OPERATION_MAKE_DIR = 1 shl 2;
    GP_FOLDER_OPERATION_REMOVE_DIR = 1 shl 3;
;
{$ifdef _GPHOTO2_INTERNAL_CODE}
{ enum CameraOperation  }
(* Const before type ignored *)
  var
    gpi_camera_operation_map : PStringFlagItem;cvar;external;
{ enum CameraFileOperation  }
(* Const before type ignored *)
    gpi_file_operation_map : PStringFlagItem;cvar;external;
{ enum CameraFolderOperation  }
(* Const before type ignored *)
    gpi_folder_operation_map : PStringFlagItem;cvar;external;
{ enum GphotoDeviceType  }
(* Const before type ignored *)
    gpi_gphoto_device_type_map : PStringFlagItem;cvar;external;
{ enum CameraDriverStatus  }
(* Const before type ignored *)
    gpi_camera_driver_status_map : PStringFlagItem;cvar;external;
{$endif}
{ _GPHOTO2_INTERNAL_CODE  }
{*
 * \brief Describes the properties of a specific camera.
 *
 * The internals of this structures are used extensively by the
 * camlibs, but the status regarding use by frontends is questionable.
  }
{*< \brief name of camera model  }
{*< \brief driver quality  }
{* \brief Supported port types.  }
{* \brief Supported serial port speeds (terminated with a value of 0).  }
{ Supported operations  }
{*< \brief Camera operation funcs  }
{*< \brief Camera file op funcs  }
{*< \brief Camera folder op funcs  }
{*< \brief USB Vendor D  }
{*< \brief USB Product ID  }
{*< \brief USB device class  }
{*< \brief USB device subclass  }
{*< \brief USB device protocol  }
{ For core use  }
{*< \brief (Internal) library filename  }
{*< \brief (Internal) camera ID name  }
{*< \brief Device type.  }
{* Reserved space to use in the future w/out changing the
	 * struct size  }
{*< reserved space \internal  }
{*< reserved space \internal  }
{*< reserved space \internal  }
{*< reserved space \internal  }
{*< reserved space \internal  }
{*< reserved space \internal  }
{*< reserved space \internal  }
type
  PCameraAbilities = ^TCameraAbilities;
  TCameraAbilities = record
      model : array[0..127] of char;
      status : TCameraDriverStatus;
      port : TGPPortType;
      speed : array[0..63] of longint;
      operations : TCameraOperation;
      file_operations : TCameraFileOperation;
      folder_operations : TCameraFolderOperation;
      usb_vendor : longint;
      usb_product : longint;
      usb_class : longint;
      usb_subclass : longint;
      usb_protocol : longint;
      library : array[0..1023] of char;
      id : array[0..1023] of char;
      device_type : TGphotoDeviceType;
      reserved2 : longint;
      reserved3 : longint;
      reserved4 : longint;
      reserved5 : longint;
      reserved6 : longint;
      reserved7 : longint;
      reserved8 : longint;
    end;
{*
 * \brief List of supported camera models including their abilities
 *
 * The internals of this list are hidden - use the access functions.
  }

function gp_abilities_list_new(list:PPCameraAbilitiesList):longint;cdecl;external;
function gp_abilities_list_free(list:PCameraAbilitiesList):longint;cdecl;external;
function gp_abilities_list_load(list:PCameraAbilitiesList; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
function gp_abilities_list_load_dir(list:PCameraAbilitiesList; dir:Pchar; context:PGPContext):longint;cdecl;external;
function gp_abilities_list_reset(list:PCameraAbilitiesList):longint;cdecl;external;
function gp_abilities_list_detect(list:PCameraAbilitiesList; info_list:PGPPortInfoList; l:PCameraList; context:PGPContext):longint;cdecl;external;
function gp_abilities_list_append(list:PCameraAbilitiesList; abilities:TCameraAbilities):longint;cdecl;external;
function gp_abilities_list_count(list:PCameraAbilitiesList):longint;cdecl;external;
(* Const before type ignored *)
function gp_abilities_list_lookup_model(list:PCameraAbilitiesList; model:Pchar):longint;cdecl;external;
function gp_abilities_list_get_abilities(list:PCameraAbilitiesList; index:longint; abilities:PCameraAbilities):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_message_codeset(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function gp_init_localedir(localedir:Pchar):longint;cdecl;external;
{*
 * Name of the environment variable which may contain the path where
 * to look for the camlibs. If this environment variable is not defined,
 * use the compiled-in default constant.
 *
 * \internal Internal use only.
  }
{$ifdef _GPHOTO2_INTERNAL_CODE}
const
  CAMLIBDIR_ENV = 'CAMLIBS';  
{$endif}
{ _GPHOTO2_INTERNAL_CODE  }
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ !defined(LIBGPHOTO2_GPHOTO2_ABILITIES_LIST_H)  }

implementation


end.
