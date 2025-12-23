  {$IFDEF read_interface}


const
  LIBAVDEVICE_VERSION_MINOR = 3;
  LIBAVDEVICE_VERSION_MICRO = 100;

const
  LIBAVDEVICE_VERSION_MAJOR = 60;

  // ====

function avdevice_version: dword; cdecl; external libavdevice;
function avdevice_configuration: pchar; cdecl; external libavdevice;
function avdevice_license: pchar; cdecl; external libavdevice;
procedure avdevice_register_all; cdecl; external libavdevice;
function av_input_audio_device_next(d: PAVInputFormat): PAVInputFormat; cdecl; external libavdevice;
function av_input_video_device_next(d: PAVInputFormat): PAVInputFormat; cdecl; external libavdevice;
function av_output_audio_device_next(d: PAVOutputFormat): PAVOutputFormat; cdecl; external libavdevice;
function av_output_video_device_next(d: PAVOutputFormat): PAVOutputFormat; cdecl; external libavdevice;

type
  TAVDeviceRect = record
    x: longint;
    y: longint;
    width: longint;
    height: longint;
  end;
  PAVDeviceRect = ^TAVDeviceRect;

type
  TAVAppToDevMessageType = longint;

const
  AV_APP_TO_DEV_NONE = Ord('N') or (Ord('O') shl 8) or (Ord('N') shl 16) or (Ord('E') shl 24);
  AV_APP_TO_DEV_WINDOW_SIZE = Ord('G') or (Ord('E') shl 8) or (Ord('O') shl 16) or (Ord('M') shl 24);
  AV_APP_TO_DEV_WINDOW_REPAINT = Ord('R') or (Ord('E') shl 8) or (Ord('P') shl 16) or (Ord('A') shl 24);
  AV_APP_TO_DEV_PAUSE = Ord('P') or (Ord('A') shl 8) or (Ord('U') shl 16) or (Ord(' ') shl 24);
  AV_APP_TO_DEV_PLAY = Ord('P') or (Ord('L') shl 8) or (Ord('A') shl 16) or (Ord('Y') shl 24);
  AV_APP_TO_DEV_TOGGLE_PAUSE = Ord('P') or (Ord('A') shl 8) or (Ord('U') shl 16) or (Ord('T') shl 24);
  AV_APP_TO_DEV_SET_VOLUME = Ord('S') or (Ord('V') shl 8) or (Ord('O') shl 16) or (Ord('L') shl 24);
  AV_APP_TO_DEV_MUTE = Ord(' ') or (Ord('M') shl 8) or (Ord('U') shl 16) or (Ord('T') shl 24);
  AV_APP_TO_DEV_UNMUTE = Ord('U') or (Ord('M') shl 8) or (Ord('U') shl 16) or (Ord('T') shl 24);
  AV_APP_TO_DEV_TOGGLE_MUTE = Ord('T') or (Ord('M') shl 8) or (Ord('U') shl 16) or (Ord('T') shl 24);
  AV_APP_TO_DEV_GET_VOLUME = Ord('G') or (Ord('V') shl 8) or (Ord('O') shl 16) or (Ord('L') shl 24);
  AV_APP_TO_DEV_GET_MUTE = Ord('G') or (Ord('M') shl 8) or (Ord('U') shl 16) or (Ord('T') shl 24);

type
  TAVDevToAppMessageType = longint;

const
  AV_DEV_TO_APP_NONE = Ord('N') or (Ord('O') shl 8) or (Ord('N') shl 16) or (Ord('E') shl 24);
  AV_DEV_TO_APP_CREATE_WINDOW_BUFFER = Ord('B') or (Ord('C') shl 8) or (Ord('R') shl 16) or (Ord('E') shl 24);
  AV_DEV_TO_APP_PREPARE_WINDOW_BUFFER = Ord('B') or (Ord('P') shl 8) or (Ord('R') shl 16) or (Ord('E') shl 24);
  AV_DEV_TO_APP_DISPLAY_WINDOW_BUFFER = Ord('B') or (Ord('D') shl 8) or (Ord('I') shl 16) or (Ord('S') shl 24);
  AV_DEV_TO_APP_DESTROY_WINDOW_BUFFER = Ord('B') or (Ord('D') shl 8) or (Ord('E') shl 16) or (Ord('S') shl 24);
  AV_DEV_TO_APP_BUFFER_OVERFLOW = Ord('B') or (Ord('O') shl 8) or (Ord('F') shl 16) or (Ord('L') shl 24);
  AV_DEV_TO_APP_BUFFER_UNDERFLOW = Ord('B') or (Ord('U') shl 8) or (Ord('F') shl 16) or (Ord('L') shl 24);
  AV_DEV_TO_APP_BUFFER_READABLE = Ord('B') or (Ord('R') shl 8) or (Ord('D') shl 16) or (Ord(' ') shl 24);
  AV_DEV_TO_APP_BUFFER_WRITABLE = Ord('B') or (Ord('W') shl 8) or (Ord('R') shl 16) or (Ord(' ') shl 24);
  AV_DEV_TO_APP_MUTE_STATE_CHANGED = Ord('C') or (Ord('M') shl 8) or (Ord('U') shl 16) or (Ord('T') shl 24);
  AV_DEV_TO_APP_VOLUME_LEVEL_CHANGED = Ord('C') or (Ord('V') shl 8) or (Ord('O') shl 16) or (Ord('L') shl 24);

function avdevice_app_to_dev_control_message(s: PAVFormatContext; _type: TAVAppToDevMessageType; data: pointer; data_size: Tsize_t): longint; cdecl; external libavdevice;
function avdevice_dev_to_app_control_message(s: PAVFormatContext; _type: TAVDevToAppMessageType; data: pointer; data_size: Tsize_t): longint; cdecl; external libavdevice;

type
  TAVDeviceInfo = record
    device_name: pchar;
    device_description: pchar;
    media_types: PAVMediaType;
    nb_media_types: longint;
  end;
  PAVDeviceInfo = ^TAVDeviceInfo;

function avdevice_list_devices(s: PAVFormatContext; device_list: PPAVDeviceInfoList): longint; cdecl; external libavdevice;
procedure avdevice_free_list_devices(device_list: PPAVDeviceInfoList); cdecl; external libavdevice;
function avdevice_list_input_sources(device: PAVInputFormat; device_name: pchar; device_options: PAVDictionary; device_list: PPAVDeviceInfoList): longint; cdecl; external libavdevice;
function avdevice_list_output_sinks(device: PAVOutputFormat; device_name: pchar; device_options: PAVDictionary; device_list: PPAVDeviceInfoList): longint; cdecl; external libavdevice;

{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
