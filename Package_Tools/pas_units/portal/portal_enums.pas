unit portal_enums;

interface

uses
  fp_glib2, fp_portal;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function xdp_user_information_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_USER_INFORMATION_FLAGS: TGType;

function xdp_background_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_BACKGROUND_FLAGS: TGType;

function xdp_camera_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_CAMERA_FLAGS: TGType;

function xdp_launcher_type_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_LAUNCHER_TYPE: TGType;

function xdp_email_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_EMAIL_FLAGS: TGType;

function xdp_open_file_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_OPEN_FILE_FLAGS: TGType;

function xdp_save_file_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_SAVE_FILE_FLAGS: TGType;

function xdp_inhibit_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_INHIBIT_FLAGS: TGType;

function xdp_login_session_state_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_LOGIN_SESSION_STATE: TGType;

function xdp_session_monitor_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_SESSION_MONITOR_FLAGS: TGType;

function xdp_location_accuracy_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_LOCATION_ACCURACY: TGType;

function xdp_location_monitor_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_LOCATION_MONITOR_FLAGS: TGType;

function xdp_notification_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_NOTIFICATION_FLAGS: TGType;

function xdp_open_uri_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_OPEN_URI_FLAGS: TGType;

function xdp_print_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_PRINT_FLAGS: TGType;

function xdp_output_type_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_OUTPUT_TYPE: TGType;

function xdp_device_type_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_DEVICE_TYPE: TGType;

function xdp_session_type_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_SESSION_TYPE: TGType;

function xdp_session_state_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_SESSION_STATE: TGType;

function xdp_screencast_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_SCREENCAST_FLAGS: TGType;

function xdp_cursor_mode_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_CURSOR_MODE: TGType;

function xdp_persist_mode_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_PERSIST_MODE: TGType;

function xdp_remote_desktop_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_REMOTE_DESKTOP_FLAGS: TGType;

function xdp_button_state_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_BUTTON_STATE: TGType;

function xdp_discrete_axis_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_DISCRETE_AXIS: TGType;

function xdp_key_state_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_KEY_STATE: TGType;

function xdp_screenshot_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_SCREENSHOT_FLAGS: TGType;

function xdp_spawn_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_SPAWN_FLAGS: TGType;

function xdp_update_status_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_UPDATE_STATUS: TGType;

function xdp_update_monitor_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_UPDATE_MONITOR_FLAGS: TGType;

function xdp_update_install_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_UPDATE_INSTALL_FLAGS: TGType;

function xdp_wallpaper_flags_get_type: TGType; cdecl; external libportal;
function XDP_TYPE_WALLPAPER_FLAGS: TGType;

{ Generated data ends here  }

// === Konventiert am: 29-8-25 15:35:29 ===


implementation



function XDP_TYPE_USER_INFORMATION_FLAGS: TGType;
begin
  XDP_TYPE_USER_INFORMATION_FLAGS := xdp_user_information_flags_get_type;
end;

function XDP_TYPE_BACKGROUND_FLAGS: TGType;
begin
  XDP_TYPE_BACKGROUND_FLAGS := xdp_background_flags_get_type;
end;

function XDP_TYPE_CAMERA_FLAGS: TGType;
begin
  XDP_TYPE_CAMERA_FLAGS := xdp_camera_flags_get_type;
end;

function XDP_TYPE_LAUNCHER_TYPE: TGType;
begin
  XDP_TYPE_LAUNCHER_TYPE := xdp_launcher_type_get_type;
end;

function XDP_TYPE_EMAIL_FLAGS: TGType;
begin
  XDP_TYPE_EMAIL_FLAGS := xdp_email_flags_get_type;
end;

function XDP_TYPE_OPEN_FILE_FLAGS: TGType;
begin
  XDP_TYPE_OPEN_FILE_FLAGS := xdp_open_file_flags_get_type;
end;

function XDP_TYPE_SAVE_FILE_FLAGS: TGType;
begin
  XDP_TYPE_SAVE_FILE_FLAGS := xdp_save_file_flags_get_type;
end;

function XDP_TYPE_INHIBIT_FLAGS: TGType;
begin
  XDP_TYPE_INHIBIT_FLAGS := xdp_inhibit_flags_get_type;
end;

function XDP_TYPE_LOGIN_SESSION_STATE: TGType;
begin
  XDP_TYPE_LOGIN_SESSION_STATE := xdp_login_session_state_get_type;
end;

function XDP_TYPE_SESSION_MONITOR_FLAGS: TGType;
begin
  XDP_TYPE_SESSION_MONITOR_FLAGS := xdp_session_monitor_flags_get_type;
end;

function XDP_TYPE_LOCATION_ACCURACY: TGType;
begin
  XDP_TYPE_LOCATION_ACCURACY := xdp_location_accuracy_get_type;
end;

function XDP_TYPE_LOCATION_MONITOR_FLAGS: TGType;
begin
  XDP_TYPE_LOCATION_MONITOR_FLAGS := xdp_location_monitor_flags_get_type;
end;

function XDP_TYPE_NOTIFICATION_FLAGS: TGType;
begin
  XDP_TYPE_NOTIFICATION_FLAGS := xdp_notification_flags_get_type;
end;

function XDP_TYPE_OPEN_URI_FLAGS: TGType;
begin
  XDP_TYPE_OPEN_URI_FLAGS := xdp_open_uri_flags_get_type;
end;

function XDP_TYPE_PRINT_FLAGS: TGType;
begin
  XDP_TYPE_PRINT_FLAGS := xdp_print_flags_get_type;
end;

function XDP_TYPE_OUTPUT_TYPE: TGType;
begin
  XDP_TYPE_OUTPUT_TYPE := xdp_output_type_get_type;
end;

function XDP_TYPE_DEVICE_TYPE: TGType;
begin
  XDP_TYPE_DEVICE_TYPE := xdp_device_type_get_type;
end;

function XDP_TYPE_SESSION_TYPE: TGType;
begin
  XDP_TYPE_SESSION_TYPE := xdp_session_type_get_type;
end;

function XDP_TYPE_SESSION_STATE: TGType;
begin
  XDP_TYPE_SESSION_STATE := xdp_session_state_get_type;
end;

function XDP_TYPE_SCREENCAST_FLAGS: TGType;
begin
  XDP_TYPE_SCREENCAST_FLAGS := xdp_screencast_flags_get_type;
end;

function XDP_TYPE_CURSOR_MODE: TGType;
begin
  XDP_TYPE_CURSOR_MODE := xdp_cursor_mode_get_type;
end;

function XDP_TYPE_PERSIST_MODE: TGType;
begin
  XDP_TYPE_PERSIST_MODE := xdp_persist_mode_get_type;
end;

function XDP_TYPE_REMOTE_DESKTOP_FLAGS: TGType;
begin
  XDP_TYPE_REMOTE_DESKTOP_FLAGS := xdp_remote_desktop_flags_get_type;
end;

function XDP_TYPE_BUTTON_STATE: TGType;
begin
  XDP_TYPE_BUTTON_STATE := xdp_button_state_get_type;
end;

function XDP_TYPE_DISCRETE_AXIS: TGType;
begin
  XDP_TYPE_DISCRETE_AXIS := xdp_discrete_axis_get_type;
end;

function XDP_TYPE_KEY_STATE: TGType;
begin
  XDP_TYPE_KEY_STATE := xdp_key_state_get_type;
end;

function XDP_TYPE_SCREENSHOT_FLAGS: TGType;
begin
  XDP_TYPE_SCREENSHOT_FLAGS := xdp_screenshot_flags_get_type;
end;

function XDP_TYPE_SPAWN_FLAGS: TGType;
begin
  XDP_TYPE_SPAWN_FLAGS := xdp_spawn_flags_get_type;
end;

function XDP_TYPE_UPDATE_STATUS: TGType;
begin
  XDP_TYPE_UPDATE_STATUS := xdp_update_status_get_type;
end;

function XDP_TYPE_UPDATE_MONITOR_FLAGS: TGType;
begin
  XDP_TYPE_UPDATE_MONITOR_FLAGS := xdp_update_monitor_flags_get_type;
end;

function XDP_TYPE_UPDATE_INSTALL_FLAGS: TGType;
begin
  XDP_TYPE_UPDATE_INSTALL_FLAGS := xdp_update_install_flags_get_type;
end;

function XDP_TYPE_WALLPAPER_FLAGS: TGType;
begin
  XDP_TYPE_WALLPAPER_FLAGS := xdp_wallpaper_flags_get_type;
end;


end.
