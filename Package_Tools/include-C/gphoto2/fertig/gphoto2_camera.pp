
unit gphoto2_camera;
interface

{
  Automatically converted by H2Pas 1.0.0 from gphoto2_camera.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gphoto2_camera.h
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
PCamera  = ^Camera;
PCameraAbilities  = ^CameraAbilities;
PCameraCaptureType  = ^CameraCaptureType;
PCameraEventType  = ^CameraEventType;
PCameraFile  = ^CameraFile;
PCameraFileInfo  = ^CameraFileInfo;
PCameraFilePath  = ^CameraFilePath;
PCameraFilesystem  = ^CameraFilesystem;
PCameraFunctions  = ^CameraFunctions;
PCameraList  = ^CameraList;
PCameraPrivateCore  = ^CameraPrivateCore;
PCameraPrivateLibrary  = ^CameraPrivateLibrary;
PCameraStorageInformation  = ^CameraStorageInformation;
PCameraText  = ^CameraText;
PCameraWidget  = ^CameraWidget;
Pchar  = ^char;
PGPContext  = ^GPContext;
PGPPort  = ^GPPort;
PGPPortInfo  = ^GPPortInfo;
Plongint  = ^longint;
Puint64_t  = ^uint64_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file
 *
 * \brief Implement Camera object representing a camera attached to the system.
 *
 * \author Copyright 2000 Scott Fritzinger
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
{$ifndef LIBGPHOTO2_GPHOTO2_CAMERA_H}
{$define LIBGPHOTO2_GPHOTO2_CAMERA_H}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * \brief Object representing a camera attached to the system.
 *
 * A Camera object represents a specific instance of a (physical of
 * virtual) camera attached to the system.
 *
 * The abilities of this type of camera are stored in a CameraAbility
 * object.
 *
 * The details of the Camera object are internal.
  }
type
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$include <gphoto2/gphoto2-abilities-list.h>}
{$include <gphoto2/gphoto2-port.h>}
{$include <gphoto2/gphoto2-widget.h>}
{$include <gphoto2/gphoto2-filesys.h>}
{$include <gphoto2/gphoto2-result.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * \brief CameraText structure used in various functions.
 *
 * A text structure containing translated text returned
 * by various functions (about, manual, summary). You should
 * not assume a size.
  }
{*< \brief Character string containing the translated text.  }
type
  PCameraText = ^TCameraText;
  TCameraText = record
      text : array[0..(32*1024)-1] of char;
    end;
{*
 * \brief A structure created by the capture operation.
 *
 * A structure containing the folder and filename of an object
 * after a successful capture and is passed as reference to the
 * gp_camera_capture() function.
  }
{*< \brief Name of the captured file.  }
{*< \brief Name of the folder of the captured file.  }

  PCameraFilePath = ^TCameraFilePath;
  TCameraFilePath = record
      name : array[0..127] of char;
      folder : array[0..1023] of char;
    end;
{*
 * \brief Type of the capture to do.
 *
 * Specifies the type of capture the user wants to do with the
 * gp_camera_capture() function.
  }
{*< \brief Capture an image.  }
{*< \brief Capture a movie.  }
{*< \brief Capture audio.  }

  PCameraCaptureType = ^TCameraCaptureType;
  TCameraCaptureType =  Longint;
  Const
    GP_CAPTURE_IMAGE = 0;
    GP_CAPTURE_MOVIE = 1;
    GP_CAPTURE_SOUND = 2;
;
{*
 * \brief Specify what event we received from the camera.
 *
 * Used by gp_camera_wait_for_event() to specify what
 * event happened on the camera.
 *
  }
{*< unknown and unhandled event. argument is a char* or NULL  }
{*< timeout, no arguments  }
{*< CameraFilePath* = file path on camfs  }
{*< CameraFilePath* = folder on camfs  }
{*< last capture is complete  }
{*< CameraFilePath* = file path on camfs  }
type
  PCameraEventType = ^TCameraEventType;
  TCameraEventType =  Longint;
  Const
    GP_EVENT_UNKNOWN = 0;
    GP_EVENT_TIMEOUT = 1;
    GP_EVENT_FILE_ADDED = 2;
    GP_EVENT_FOLDER_ADDED = 3;
    GP_EVENT_CAPTURE_COMPLETE = 4;
    GP_EVENT_FILE_CHANGED = 5;
;
{*
 * \name Camera object member functions
 *
 * These functions must be implemented by a camlib and the camlib's
 * camera_init() function will add them to a Camera object.
 *
 * @
  }
{*
 * \brief The camera exit function
 *
 * \param camera the current camera
 * \param context a #GPContext
 *
 * This functions is called in the camera driver for closing the camera
 * connection. It should do the necessary cleanups of the internal camera
 * state, free allocated private structures and similar.
 *
 * The driver does not need to close the #GPPort, this is done by libgphoto2
 * itself.
 *
 * Implement this function if you need to any of this stuff, otherwise leave
 * it out.
 *
 * \returns a gphoto error code
  }
type

  TCameraExitFunc = function (camera:PCamera; context:PGPContext):longint;cdecl;
{*
 * \brief Get a configuration tree for the camera and its driver
 *
 * \param camera the current camera
 * \param widget pointer to store the toplevel widget of the tree
 * \param context the active #GPContext
 *
 * A camera driver can support configuration of either its own behaviour
 * or the camera device itself. To allow a flexible driver framework,
 * the camera driver provides a generic configuration widget tree to the
 * frontend, which then renders it, allows user input and sends it back
 * via the #CameraSetConfigFunc function to have the driver configure itself
 * or the camera.
 *
 * If you do not have configuration ability, there is no need to specify this
 * function.
 *
 * \returns a gphoto error code
  }

  TCameraGetConfigFunc = function (camera:PCamera; widget:PPCameraWidget; context:PGPContext):longint;cdecl;
{*
 * \brief Get a configuration widget for a specific configuration
 *
 * \param camera the current camera
 * \param name the name of the widget
 * \param widget pointer to store the toplevel widget of the tree
 * \param context the active #GPContext
 *
 * A camera driver can support configuration of either its own behaviour
 * or the camera device itself. To allow a flexible driver framework,
 * the camera driver provides a generic configuration widget tree to the
 * frontend, which then renders it, allows user input and sends it back
 * via the #CameraSetConfigFunc function to have the driver configure itself
 * or the camera.
 *
 * This specific function retrieves one specific named entry, and not the full
 * tree to allow for querying specific settings faster.
 *
 * If you do not have configuration ability, there is no need to specify this
 * function.
 *
 * \returns a gphoto error code
  }
(* Const before type ignored *)

  TCameraGetSingleConfigFunc = function (camera:PCamera; name:Pchar; widget:PPCameraWidget; context:PGPContext):longint;cdecl;
{*
 * \brief List all configuration widgets for a specific configuration
 *
 * \param camera the current camera
 * \param list the list of widgets available
 * \param context the active #GPContext
 *
 * A camera driver can support configuration of either its own behaviour
 * or the camera device itself. To allow a flexible driver framework,
 * the camera driver provides a generic configuration widget tree to the
 * frontend, which then renders it, allows user input and sends it back
 * via the #CameraSetConfigFunc function to have the driver configure itself
 * or the camera.
 *
 * This specific function retrieves all the available configuration values in a flat list.
 *
 * This is different than the GetConfigFunc, which returns a configuration tree.
 *
 * If you do not have configuration ability, there is no need to specify this
 * function.
 *
 * \returns a gphoto error code
  }

  TCameraListConfigFunc = function (camera:PCamera; list:PCameraList; context:PGPContext):longint;cdecl;
{*
 * \brief Set the configuration in the camera
 *
 * \param camera the current camera
 * \param widget the configuration widget tree that was changed
 * \param context the active #GPContext
 *
 * This function is called in the driver after the configuration is set.
 * It is called directly after setting the value and might called multiple
 * times (or never) after just one #CameraGetConfigFunc.
 *
 * \returns a gphoto error code
  }

  TCameraSetConfigFunc = function (camera:PCamera; widget:PCameraWidget; context:PGPContext):longint;cdecl;
{*
 * \brief Set a single configuration variable in the camera
 *
 * \param camera the current camera
 * \param name the widget to set
 * \param widget the configuration widget tree that was changed
 * \param context the active #GPContext
 *
 * This function is called in the driver after the configuration value is set.
 *
 * \returns a gphoto error code
  }
(* Const before type ignored *)

  TCameraSetSingleConfigFunc = function (camera:PCamera; name:Pchar; widget:PCameraWidget; context:PGPContext):longint;cdecl;

  TCameraCaptureFunc = function (camera:PCamera; _type:TCameraCaptureType; path:PCameraFilePath; context:PGPContext):longint;cdecl;

  TCameraTriggerCaptureFunc = function (camera:PCamera; context:PGPContext):longint;cdecl;

  TCameraCapturePreviewFunc = function (camera:PCamera; file:PCameraFile; context:PGPContext):longint;cdecl;

  TCameraSummaryFunc = function (camera:PCamera; text:PCameraText; context:PGPContext):longint;cdecl;

  TCameraManualFunc = function (camera:PCamera; text:PCameraText; context:PGPContext):longint;cdecl;

  TCameraAboutFunc = function (camera:PCamera; text:PCameraText; context:PGPContext):longint;cdecl;

  TCameraWaitForEvent = function (camera:PCamera; timeout:longint; eventtype:PCameraEventType; eventdata:Ppointer; context:PGPContext):longint;cdecl;
{*@ }
{*
 * \param camera a \ref Camera object
 * \param context a \ref GPContext object
 * \return a gphoto2 error code
 *
 * Implement this function in the camera driver if the camera needs to
 * be initialized before or reset the after each access from
 * libgphoto2.
 *
 * For example, you would probably set the speed to the highest one
 * right before downloading an image, and reset it to the default speed
 * afterwards so that other programs will not be affected by this speed
 * change.
  }

  TCameraPrePostFunc = function (camera:PCamera; context:PGPContext):longint;cdecl;
{*
 * \brief Various camera specific functions.
 *
 * This structure contains various pointers to functions that apply to
 * the camera itself, and not the filesystem (which is handled by the
 * filesystem functions). Set the ones you want to provide, leave the rest
 * unset.
 *
 * This structure should only used by the driver itself, the frontend
 * should use the gp_camera_xxx wrapper functions for it, who handle
 * opening and locking around those hooks.
  }
{*< \brief Function called before each camera operation.  }
{*< \brief Function called after each camera operation.  }
{*< \brief Function called on closing the camera.  }
{ Configuration  }
{*< \brief Called for requesting the configuration widgets.  }
{*< \brief Called after a configuration was changed  }
{*< \brief Called for listing the available configuration widgets.  }
{*< \brief Called for requesteing a single widget.  }
{*< \brief Called for setting a single configuration widget.  }
{ Capturing  }
{*< \brief Remote control the camera to capture  }
{*< \brief Remote control the camera to trigger capture  }
{*< \brief Preview viewfinder content.  }
{ Textual information  }
{*< \brief Give a summary about the current camera status, translated.  }
{*< \brief Give a brief manual about any specific items a user has to know, translated.  }
{*< \brief A little About text, including authors and credits.  }
{ Event Interface  }
{*< \brief Wait for a specific event from the camera  }
{ Reserved space to use in the future without changing the struct size  }
{*< \brief reserved for future use  }
{*< \brief reserved for future use  }
{*< \brief reserved for future use  }
{*< \brief reserved for future use  }
{*< \brief reserved for future use  }
{*< \brief reserved for future use  }
{*< \brief reserved for future use  }
{*< \brief reserved for future use  }

  PCameraFunctions = ^TCameraFunctions;
  TCameraFunctions = record
      pre_func : TCameraPrePostFunc;
      post_func : TCameraPrePostFunc;
      exit : TCameraExitFunc;
      get_config : TCameraGetConfigFunc;
      set_config : TCameraSetConfigFunc;
      list_config : TCameraListConfigFunc;
      get_single_config : TCameraGetSingleConfigFunc;
      set_single_config : TCameraSetSingleConfigFunc;
      capture : TCameraCaptureFunc;
      trigger_capture : TCameraTriggerCaptureFunc;
      capture_preview : TCameraCapturePreviewFunc;
      summary : TCameraSummaryFunc;
      manual : TCameraManualFunc;
      about : TCameraAboutFunc;
      wait_for_event : TCameraWaitForEvent;
      reserved1 : pointer;
      reserved2 : pointer;
      reserved3 : pointer;
      reserved4 : pointer;
      reserved5 : pointer;
      reserved6 : pointer;
      reserved7 : pointer;
      reserved8 : pointer;
    end;
{* \name Those should be accessed only by the camera driver.
	 * @  }
{*@ }
{*< Private data of camera libraries.     }
{*< Private data of the core of gphoto2.  }
  PCamera = ^TCamera;
  TCamera = record
      port : PGPPort;
      fs : PCameraFilesystem;
      functions : PCameraFunctions;
      pl : PCameraPrivateLibrary;
      pc : PCameraPrivateCore;
    end;

{* Create a new camera device.  }

function gp_camera_new(camera:PPCamera):longint;cdecl;external;
{* \name Preparing initialization
 * @
  }
function gp_camera_set_abilities(camera:PCamera; abilities:TCameraAbilities):longint;cdecl;external;
function gp_camera_get_abilities(camera:PCamera; abilities:PCameraAbilities):longint;cdecl;external;
function gp_camera_set_port_info(camera:PCamera; info:TGPPortInfo):longint;cdecl;external;
function gp_camera_get_port_info(camera:PCamera; info:PGPPortInfo):longint;cdecl;external;
{*@ }
{*
 * \name camera speed
 *
 * You normally don't use that. If you do, you prevent the camera driver
 * from selecting the optimal speed.
 *
 * @
  }
function gp_camera_set_port_speed(camera:PCamera; speed:longint):longint;cdecl;external;
function gp_camera_get_port_speed(camera:PCamera):longint;cdecl;external;
{*@ }
{* \name Initialization
 * @
  }
function gp_camera_autodetect(list:PCameraList; context:PGPContext):longint;cdecl;external;
function gp_camera_init(camera:PCamera; context:PGPContext):longint;cdecl;external;
function gp_camera_exit(camera:PCamera; context:PGPContext):longint;cdecl;external;
{*@ }
{* \name Operations on cameras
 * @
  }
function gp_camera_ref(camera:PCamera):longint;cdecl;external;
function gp_camera_unref(camera:PCamera):longint;cdecl;external;
function gp_camera_free(camera:PCamera):longint;cdecl;external;
function gp_camera_get_config(camera:PCamera; window:PPCameraWidget; context:PGPContext):longint;cdecl;external;
function gp_camera_list_config(camera:PCamera; list:PCameraList; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
function gp_camera_get_single_config(camera:PCamera; name:Pchar; widget:PPCameraWidget; context:PGPContext):longint;cdecl;external;
function gp_camera_set_config(camera:PCamera; window:PCameraWidget; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
function gp_camera_set_single_config(camera:PCamera; name:Pchar; widget:PCameraWidget; context:PGPContext):longint;cdecl;external;
function gp_camera_get_summary(camera:PCamera; summary:PCameraText; context:PGPContext):longint;cdecl;external;
function gp_camera_get_manual(camera:PCamera; manual:PCameraText; context:PGPContext):longint;cdecl;external;
function gp_camera_get_about(camera:PCamera; about:PCameraText; context:PGPContext):longint;cdecl;external;
function gp_camera_capture(camera:PCamera; _type:TCameraCaptureType; path:PCameraFilePath; context:PGPContext):longint;cdecl;external;
function gp_camera_trigger_capture(camera:PCamera; context:PGPContext):longint;cdecl;external;
function gp_camera_capture_preview(camera:PCamera; file:PCameraFile; context:PGPContext):longint;cdecl;external;
function gp_camera_wait_for_event(camera:PCamera; timeout:longint; eventtype:PCameraEventType; eventdata:Ppointer; context:PGPContext):longint;cdecl;external;
function gp_camera_get_storageinfo(camera:PCamera; para2:PPCameraStorageInformation; para3:Plongint; context:PGPContext):longint;cdecl;external;
{*@ }
{* \name Operations on folders
 * @
  }
(* Const before type ignored *)
function gp_camera_folder_list_files(camera:PCamera; folder:Pchar; list:PCameraList; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
function gp_camera_folder_list_folders(camera:PCamera; folder:Pchar; list:PCameraList; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
function gp_camera_folder_delete_all(camera:PCamera; folder:Pchar; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_camera_folder_put_file(camera:PCamera; folder:Pchar; filename:Pchar; _type:TCameraFileType; file:PCameraFile; 
           context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_camera_folder_make_dir(camera:PCamera; folder:Pchar; name:Pchar; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_camera_folder_remove_dir(camera:PCamera; folder:Pchar; name:Pchar; context:PGPContext):longint;cdecl;external;
{*@ }
{* \name Operations on files
 * @
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gp_camera_file_get_info(camera:PCamera; folder:Pchar; file:Pchar; info:PCameraFileInfo; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_camera_file_set_info(camera:PCamera; folder:Pchar; file:Pchar; info:TCameraFileInfo; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_camera_file_get(camera:PCamera; folder:Pchar; file:Pchar; _type:TCameraFileType; camera_file:PCameraFile; 
           context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_camera_file_read(camera:PCamera; folder:Pchar; file:Pchar; _type:TCameraFileType; offset:Tuint64_t; 
           buf:Pchar; size:Puint64_t; context:PGPContext):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_camera_file_delete(camera:PCamera; folder:Pchar; file:Pchar; context:PGPContext):longint;cdecl;external;
{*@ }
{*
 * \name Some cameras need 'keep-alive-messages'.
 * @
  }
type

  TCameraTimeoutFunc = function (camera:PCamera; context:PGPContext):longint;cdecl;

  TCameraTimeoutStartFunc = function (camera:PCamera; timeout:dword; func:TCameraTimeoutFunc; data:pointer):dword;cdecl;

  TCameraTimeoutStopFunc = procedure (camera:PCamera; id:dword; data:pointer);cdecl;

procedure gp_camera_set_timeout_funcs(camera:PCamera; start_func:TCameraTimeoutStartFunc; stop_func:TCameraTimeoutStopFunc; data:pointer);cdecl;external;
function gp_camera_start_timeout(camera:PCamera; timeout:dword; func:TCameraTimeoutFunc):longint;cdecl;external;
procedure gp_camera_stop_timeout(camera:PCamera; id:dword);cdecl;external;
{*@ }
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ !defined(LIBGPHOTO2_GPHOTO2_CAMERA_H)  }

implementation


end.
