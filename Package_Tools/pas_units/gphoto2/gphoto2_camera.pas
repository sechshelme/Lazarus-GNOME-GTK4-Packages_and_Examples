unit gphoto2_camera;

interface

uses
  fp_glib2, fp_gphoto2, gphoto2_context, gphoto2_file, gphoto2_list, gphoto2_abilities_list, gphoto2_port_info_list, gphoto2_port, gphoto2_filesys;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TCameraText = record
    text: array[0..(32 * 1024) - 1] of char;
  end;
  PCameraText = ^TCameraText;

  TCameraFilePath = record
    name: array[0..127] of char;
    folder: array[0..1023] of char;
  end;
  PCameraFilePath = ^TCameraFilePath;

type
  PCameraCaptureType = ^TCameraCaptureType;
  TCameraCaptureType = longint;

const
  GP_CAPTURE_IMAGE = 0;
  GP_CAPTURE_MOVIE = 1;
  GP_CAPTURE_SOUND = 2;

type
  PCameraEventType = ^TCameraEventType;
  TCameraEventType = longint;

const
  GP_EVENT_UNKNOWN = 0;
  GP_EVENT_TIMEOUT = 1;
  GP_EVENT_FILE_ADDED = 2;
  GP_EVENT_FOLDER_ADDED = 3;
  GP_EVENT_CAPTURE_COMPLETE = 4;
  GP_EVENT_FILE_CHANGED = 5;

type
  PCamera = ^TCamera;
  PPCamera = ^PCamera;

  TCameraExitFunc = function(camera: PCamera; context: PGPContext): longint; cdecl;
  TCameraGetConfigFunc = function(camera: PCamera; widget: PPCameraWidget; context: PGPContext): longint; cdecl;
  TCameraGetSingleConfigFunc = function(camera: PCamera; name: pchar; widget: PPCameraWidget; context: PGPContext): longint; cdecl;
  TCameraListConfigFunc = function(camera: PCamera; list: PCameraList; context: PGPContext): longint; cdecl;
  TCameraSetConfigFunc = function(camera: PCamera; widget: PCameraWidget; context: PGPContext): longint; cdecl;
  TCameraSetSingleConfigFunc = function(camera: PCamera; name: pchar; widget: PCameraWidget; context: PGPContext): longint; cdecl;
  TCameraCaptureFunc = function(camera: PCamera; _type: TCameraCaptureType; path: PCameraFilePath; context: PGPContext): longint; cdecl;
  TCameraTriggerCaptureFunc = function(camera: PCamera; context: PGPContext): longint; cdecl;
  TCameraCapturePreviewFunc = function(camera: PCamera; file_: PCameraFile; context: PGPContext): longint; cdecl;
  TCameraSummaryFunc = function(camera: PCamera; text: PCameraText; context: PGPContext): longint; cdecl;
  TCameraManualFunc = function(camera: PCamera; text: PCameraText; context: PGPContext): longint; cdecl;
  TCameraAboutFunc = function(camera: PCamera; text: PCameraText; context: PGPContext): longint; cdecl;
  TCameraWaitForEvent = function(camera: PCamera; timeout: longint; eventtype: PCameraEventType; eventdata: Ppointer; context: PGPContext): longint; cdecl;
  TCameraPrePostFunc = function(camera: PCamera; context: PGPContext): longint; cdecl;

  TCameraFunctions = record
    pre_func: TCameraPrePostFunc;
    post_func: TCameraPrePostFunc;
    exit: TCameraExitFunc;
    get_config: TCameraGetConfigFunc;
    set_config: TCameraSetConfigFunc;
    list_config: TCameraListConfigFunc;
    get_single_config: TCameraGetSingleConfigFunc;
    set_single_config: TCameraSetSingleConfigFunc;
    capture: TCameraCaptureFunc;
    trigger_capture: TCameraTriggerCaptureFunc;
    capture_preview: TCameraCapturePreviewFunc;
    summary: TCameraSummaryFunc;
    manual: TCameraManualFunc;
    about: TCameraAboutFunc;
    wait_for_event: TCameraWaitForEvent;
    reserved1: pointer;
    reserved2: pointer;
    reserved3: pointer;
    reserved4: pointer;
    reserved5: pointer;
    reserved6: pointer;
    reserved7: pointer;
    reserved8: pointer;
  end;
  PCameraFunctions = ^TCameraFunctions;

   PCameraPrivateLibrary=type Pointer;
   PCameraPrivateCore=type Pointer;

  TCamera = record
    port: PGPPort;
    fs: PCameraFilesystem;
    functions: PCameraFunctions;
    pl: PCameraPrivateLibrary;
    pc: PCameraPrivateCore;
  end;

function gp_camera_new(camera: PPCamera): longint; cdecl; external libgphoto2;
function gp_camera_set_abilities(camera: PCamera; abilities: TCameraAbilities): longint; cdecl; external libgphoto2;
function gp_camera_get_abilities(camera: PCamera; abilities: PCameraAbilities): longint; cdecl; external libgphoto2;
function gp_camera_set_port_info(camera: PCamera; info: PGPPortInfo): longint; cdecl; external libgphoto2;
function gp_camera_get_port_info(camera: PCamera; info: PPGPPortInfo): longint; cdecl; external libgphoto2;
function gp_camera_set_port_speed(camera: PCamera; speed: longint): longint; cdecl; external libgphoto2;
function gp_camera_get_port_speed(camera: PCamera): longint; cdecl; external libgphoto2;
function gp_camera_autodetect(list: PCameraList; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_init(camera: PCamera; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_exit(camera: PCamera; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_ref(camera: PCamera): longint; cdecl; external libgphoto2;
function gp_camera_unref(camera: PCamera): longint; cdecl; external libgphoto2;
function gp_camera_free(camera: PCamera): longint; cdecl; external libgphoto2;
function gp_camera_get_config(camera: PCamera; window: PPCameraWidget; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_list_config(camera: PCamera; list: PCameraList; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_get_single_config(camera: PCamera; name: pchar; widget: PPCameraWidget; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_set_config(camera: PCamera; window: PCameraWidget; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_set_single_config(camera: PCamera; name: pchar; widget: PCameraWidget; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_get_summary(camera: PCamera; summary: PCameraText; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_get_manual(camera: PCamera; manual: PCameraText; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_get_about(camera: PCamera; about: PCameraText; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_capture(camera: PCamera; _type: TCameraCaptureType; path: PCameraFilePath; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_trigger_capture(camera: PCamera; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_capture_preview(camera: PCamera; file_: PCameraFile; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_wait_for_event(camera: PCamera; timeout: longint; eventtype: PCameraEventType; eventdata: Ppointer; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_get_storageinfo(camera: PCamera; para2: PPCameraStorageInformation; para3: Plongint; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_folder_list_files(camera: PCamera; folder: pchar; list: PCameraList; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_folder_list_folders(camera: PCamera; folder: pchar; list: PCameraList; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_folder_delete_all(camera: PCamera; folder: pchar; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_folder_put_file(camera: PCamera; folder: pchar; filename: pchar; _type: TCameraFileType; file_: PCameraFile; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_folder_make_dir(camera: PCamera; folder: pchar; name: pchar; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_folder_remove_dir(camera: PCamera; folder: pchar; name: pchar; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_file_get_info(camera: PCamera; folder: pchar; file_: pchar; info: PCameraFileInfo; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_file_set_info(camera: PCamera; folder: pchar; file_: pchar; info: TCameraFileInfo; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_file_get(camera: PCamera; folder: pchar; file_: pchar; _type: TCameraFileType; camera_file: PCameraFile; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_file_read(camera: PCamera; folder: pchar; file_: pchar; _type: TCameraFileType; offset: Tuint64_t; buf: pchar; size: Puint64_t; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_camera_file_delete(camera: PCamera; folder: pchar; file_: pchar; context: PGPContext): longint; cdecl; external libgphoto2;

type
  TCameraTimeoutFunc = function(camera: PCamera; context: PGPContext): longint; cdecl;
  TCameraTimeoutStartFunc = function(camera: PCamera; timeout: dword; func: TCameraTimeoutFunc; data: pointer): dword; cdecl;
  TCameraTimeoutStopFunc = procedure(camera: PCamera; id: dword; data: pointer); cdecl;

procedure gp_camera_set_timeout_funcs(camera: PCamera; start_func: TCameraTimeoutStartFunc; stop_func: TCameraTimeoutStopFunc; data: pointer); cdecl; external libgphoto2;
function gp_camera_start_timeout(camera: PCamera; timeout: dword; func: TCameraTimeoutFunc): longint; cdecl; external libgphoto2;
procedure gp_camera_stop_timeout(camera: PCamera; id: dword); cdecl; external libgphoto2;

// === Konventiert am: 17-11-25 15:46:44 ===


implementation



end.
