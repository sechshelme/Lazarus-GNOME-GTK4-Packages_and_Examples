{$IFDEF read_interface}


type
  PTCOD_event_t = ^TTCOD_event_t;
  TTCOD_event_t = longint;

const
  TCOD_EVENT_NONE = 0;
  TCOD_EVENT_KEY_PRESS = 1;
  TCOD_EVENT_KEY_RELEASE = 2;
  TCOD_EVENT_KEY = TCOD_EVENT_KEY_PRESS or TCOD_EVENT_KEY_RELEASE;
  TCOD_EVENT_MOUSE_MOVE = 4;
  TCOD_EVENT_MOUSE_PRESS = 8;
  TCOD_EVENT_MOUSE_RELEASE = 16;
  TCOD_EVENT_MOUSE = (TCOD_EVENT_MOUSE_MOVE or TCOD_EVENT_MOUSE_PRESS) or TCOD_EVENT_MOUSE_RELEASE;
  TCOD_EVENT_FINGER_MOVE = 32;
  TCOD_EVENT_FINGER_PRESS = 64;
  TCOD_EVENT_FINGER_RELEASE = 128;
  TCOD_EVENT_FINGER = (TCOD_EVENT_FINGER_MOVE or TCOD_EVENT_FINGER_PRESS) or TCOD_EVENT_FINGER_RELEASE;
  TCOD_EVENT_ANY = (TCOD_EVENT_KEY or TCOD_EVENT_MOUSE) or TCOD_EVENT_FINGER;

type
  TSDL_renderer_t = procedure(sdl_renderer: PSDL_Surface); cdecl;

  PTCOD_thread_t = ^TTCOD_thread_t;
  TTCOD_thread_t = pointer;

  PTCOD_semaphore_t = ^TTCOD_semaphore_t;
  TTCOD_semaphore_t = pointer;

  PTCOD_mutex_t = ^TTCOD_mutex_t;
  TTCOD_mutex_t = pointer;

  PTCOD_cond_t = ^TTCOD_cond_t;
  TTCOD_cond_t = pointer;

procedure TCOD_sys_startup; cdecl; external libtcod;
procedure TCOD_sys_shutdown; cdecl; external libtcod;

function TCOD_sys_create_directory(path: pchar): Tbool; cdecl; external libtcod; deprecated;
function TCOD_sys_delete_file(path: pchar): Tbool; cdecl; external libtcod; deprecated;
function TCOD_sys_delete_directory(path: pchar): Tbool; cdecl; external libtcod; deprecated;
function TCOD_sys_is_directory(path: pchar): Tbool; cdecl; external libtcod; deprecated;
function TCOD_sys_get_directory_content(path: pchar; pattern: pchar): TTCOD_list_t; cdecl; external libtcod; deprecated;
function TCOD_sys_file_exists(filename: pchar; args: array of const): Tbool; cdecl; external libtcod; deprecated;
function TCOD_sys_file_exists(filename: pchar): Tbool; cdecl; external libtcod; deprecated;
function TCOD_sys_read_file(filename: pchar; buf: PPbyte; size: Psize_t): Tbool; cdecl; external libtcod; deprecated;
function TCOD_sys_write_file(filename: pchar; buf: pbyte; size: Tuint32_t): Tbool; cdecl; external libtcod; deprecated;

type
  Tthread_new_func = function(para1: pointer): longint; cdecl;

function TCOD_thread_new(func: Tthread_new_func; data: pointer): TTCOD_thread_t; cdecl; external libtcod; deprecated;
procedure TCOD_thread_delete(th: TTCOD_thread_t); cdecl; external libtcod; deprecated;
function TCOD_sys_get_num_cores: longint; cdecl; external libtcod; deprecated;
procedure TCOD_thread_wait(th: TTCOD_thread_t); cdecl; external libtcod; deprecated;
function TCOD_mutex_new: TTCOD_mutex_t; cdecl; external libtcod; deprecated;
procedure TCOD_mutex_in(mut: TTCOD_mutex_t); cdecl; external libtcod; deprecated;
procedure TCOD_mutex_out(mut: TTCOD_mutex_t); cdecl; external libtcod; deprecated;
procedure TCOD_mutex_delete(mut: TTCOD_mutex_t); cdecl; external libtcod; deprecated;
function TCOD_semaphore_new(initVal: longint): TTCOD_semaphore_t; cdecl; external libtcod; deprecated;
procedure TCOD_semaphore_lock(sem: TTCOD_semaphore_t); cdecl; external libtcod; deprecated;
procedure TCOD_semaphore_unlock(sem: TTCOD_semaphore_t); cdecl; external libtcod; deprecated;
procedure TCOD_semaphore_delete(sem: TTCOD_semaphore_t); cdecl; external libtcod; deprecated;
function TCOD_condition_new: TTCOD_cond_t; cdecl; external libtcod; deprecated;
procedure TCOD_condition_signal(sem: TTCOD_cond_t); cdecl; external libtcod; deprecated;
procedure TCOD_condition_broadcast(sem: TTCOD_cond_t); cdecl; external libtcod; deprecated;
procedure TCOD_condition_wait(sem: TTCOD_cond_t; mut: TTCOD_mutex_t); cdecl; external libtcod; deprecated;
procedure TCOD_condition_delete(sem: TTCOD_cond_t); cdecl; external libtcod; deprecated;

type
  PTCOD_library_t = ^TTCOD_library_t;
  TTCOD_library_t = pointer;

function TCOD_load_library(path: pchar): TTCOD_library_t; cdecl; external libtcod; deprecated;
function TCOD_get_function_address(lib: TTCOD_library_t; function_name: pchar): pointer; cdecl; external libtcod; deprecated;
procedure TCOD_close_library(para1: TTCOD_library_t); cdecl; external libtcod; deprecated;

function TCOD_sys_elapsed_milli: Tuint32_t; cdecl; external libtcod;
function TCOD_sys_elapsed_seconds: single; cdecl; external libtcod;
procedure TCOD_sys_sleep_milli(val: Tuint32_t); cdecl; external libtcod;
procedure TCOD_sys_set_fps(val: longint); cdecl; external libtcod;
function TCOD_sys_get_fps: longint; cdecl; external libtcod;
function TCOD_sys_get_last_frame_length: single; cdecl; external libtcod;
procedure TCOD_sys_save_screenshot(filename: pchar); cdecl; external libtcod;
procedure TCOD_sys_force_fullscreen_resolution(width: longint; height: longint); cdecl; external libtcod;
function TCOD_sys_set_renderer(renderer: TTCOD_renderer_t): longint; cdecl; external libtcod;
function TCOD_sys_get_renderer: TTCOD_renderer_t; cdecl; external libtcod;
function TCOD_sys_get_current_resolution(w: Plongint; h: Plongint): TTCOD_Error; cdecl; external libtcod; deprecated'Use SDL to determine the screen resolution instead.';
procedure TCOD_sys_get_fullscreen_offsets(offset_x: Plongint; offset_y: Plongint); cdecl; external libtcod;
procedure TCOD_sys_get_char_size(w: Plongint; h: Plongint); cdecl; external libtcod;
procedure TCOD_sys_update_char(asciiCode: longint; font_x: longint; font_y: longint; img: TTCOD_image_t; x: longint;
  y: longint); cdecl; external libtcod;
function TCOD_sys_wait_for_event(eventMask: longint; key: PTCOD_key_t; mouse: PTCOD_mouse_t; flush: Tbool): TTCOD_event_t; cdecl; external libtcod; deprecated'This API is deprecated, use SDL_WaitEvent instead.';
function TCOD_sys_check_for_event(eventMask: longint; key: PTCOD_key_t; mouse: PTCOD_mouse_t): TTCOD_event_t; cdecl; external libtcod; deprecated'This API is deprecated, use SDL_PollEvent instead.';
function TCOD_sys_clipboard_set(value: pchar): Tbool; cdecl; external libtcod; deprecated'Use the SDL2 API to handle the clipboard.';
function TCOD_sys_clipboard_get: pchar; cdecl; external libtcod; deprecated'Use the SDL2 API to handle the clipboard.';
procedure TCOD_sys_register_SDL_renderer(renderer: TSDL_renderer_t); cdecl; external libtcod; deprecated;

// === Konventiert am: 10-9-25 16:24:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
