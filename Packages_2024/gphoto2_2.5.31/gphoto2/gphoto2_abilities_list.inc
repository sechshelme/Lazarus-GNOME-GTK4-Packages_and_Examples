{$IFDEF read_interface}


type
  PCameraDriverStatus = ^TCameraDriverStatus;
  TCameraDriverStatus = longint;

const
  GP_DRIVER_STATUS_PRODUCTION = 0;
  GP_DRIVER_STATUS_TESTING = 1;
  GP_DRIVER_STATUS_EXPERIMENTAL = 2;
  GP_DRIVER_STATUS_DEPRECATED = 3;

type
  PGphotoDeviceType = ^TGphotoDeviceType;
  TGphotoDeviceType = longint;

const
  GP_DEVICE_STILL_CAMERA = 0;
  GP_DEVICE_AUDIO_PLAYER = 1 shl 0;

type
  PCameraOperation = ^TCameraOperation;
  TCameraOperation = longint;

const
  GP_OPERATION_NONE = 0;
  GP_OPERATION_CAPTURE_IMAGE = 1 shl 0;
  GP_OPERATION_CAPTURE_VIDEO = 1 shl 1;
  GP_OPERATION_CAPTURE_AUDIO = 1 shl 2;
  GP_OPERATION_CAPTURE_PREVIEW = 1 shl 3;
  GP_OPERATION_CONFIG = 1 shl 4;
  GP_OPERATION_TRIGGER_CAPTURE = 1 shl 5;

type
  PCameraFileOperation = ^TCameraFileOperation;
  TCameraFileOperation = longint;

const
  GP_FILE_OPERATION_NONE = 0;
  GP_FILE_OPERATION_DELETE = 1 shl 1;
  GP_FILE_OPERATION_PREVIEW = 1 shl 3;
  GP_FILE_OPERATION_RAW = 1 shl 4;
  GP_FILE_OPERATION_AUDIO = 1 shl 5;
  GP_FILE_OPERATION_EXIF = 1 shl 6;

type
  PCameraFolderOperation = ^TCameraFolderOperation;
  TCameraFolderOperation = longint;

const
  GP_FOLDER_OPERATION_NONE = 0;
  GP_FOLDER_OPERATION_DELETE_ALL = 1 shl 0;
  GP_FOLDER_OPERATION_PUT_FILE = 1 shl 1;
  GP_FOLDER_OPERATION_MAKE_DIR = 1 shl 2;
  GP_FOLDER_OPERATION_REMOVE_DIR = 1 shl 3;

var
  gpi_camera_operation_map: PStringFlagItem; cvar;external libgphoto2;
  gpi_file_operation_map: PStringFlagItem; cvar;external libgphoto2;
  gpi_folder_operation_map: PStringFlagItem; cvar;external libgphoto2;
  gpi_gphoto_device_type_map: PStringFlagItem; cvar;external libgphoto2;
  gpi_camera_driver_status_map: PStringFlagItem; cvar;external libgphoto2;

type
  TCameraAbilities = record
    model: array[0..127] of char;
    status: TCameraDriverStatus;
    port: TGPPortType;
    speed: array[0..63] of longint;
    operations: TCameraOperation;
    file_operations: TCameraFileOperation;
    folder_operations: TCameraFolderOperation;
    usb_vendor: longint;
    usb_product: longint;
    usb_class: longint;
    usb_subclass: longint;
    usb_protocol: longint;
    lib: array[0..1023] of char;
    id: array[0..1023] of char;
    device_type: TGphotoDeviceType;
    reserved2: longint;
    reserved3: longint;
    reserved4: longint;
    reserved5: longint;
    reserved6: longint;
    reserved7: longint;
    reserved8: longint;
  end;
  PCameraAbilities = ^TCameraAbilities;

  PCameraAbilitiesList = type Pointer;
  PPCameraAbilitiesList = ^PCameraAbilitiesList;

function gp_abilities_list_new(list: PPCameraAbilitiesList): longint; cdecl; external libgphoto2;
function gp_abilities_list_free(list: PCameraAbilitiesList): longint; cdecl; external libgphoto2;
function gp_abilities_list_load(list: PCameraAbilitiesList; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_abilities_list_load_dir(list: PCameraAbilitiesList; dir: pchar; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_abilities_list_reset(list: PCameraAbilitiesList): longint; cdecl; external libgphoto2;
function gp_abilities_list_detect(list: PCameraAbilitiesList; info_list: PGPPortInfoList; l: PCameraList; context: PGPContext): longint; cdecl; external libgphoto2;
function gp_abilities_list_append(list: PCameraAbilitiesList; abilities: TCameraAbilities): longint; cdecl; external libgphoto2;
function gp_abilities_list_count(list: PCameraAbilitiesList): longint; cdecl; external libgphoto2;
function gp_abilities_list_lookup_model(list: PCameraAbilitiesList; model: pchar): longint; cdecl; external libgphoto2;
function gp_abilities_list_get_abilities(list: PCameraAbilitiesList; index: longint; abilities: PCameraAbilities): longint; cdecl; external libgphoto2;
function gp_message_codeset(para1: pchar): pchar; cdecl; external libgphoto2;
function gp_init_localedir(localedir: pchar): longint; cdecl; external libgphoto2;

const
  CAMLIBDIR_ENV = 'CAMLIBS';

  // === Konventiert am: 17-11-25 15:46:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
