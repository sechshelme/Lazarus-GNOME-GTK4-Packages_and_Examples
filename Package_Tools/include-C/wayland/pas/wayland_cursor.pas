unit wayland_cursor;

interface

uses
  fp_wayland;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pwl_cursor_theme = type Pointer;
  Pwl_buffer = type Pointer;
  Pwl_shm = type Pointer;

  Twl_cursor_image = record
    width: Tuint32_t;
    height: Tuint32_t;
    hotspot_x: Tuint32_t;
    hotspot_y: Tuint32_t;
    delay: Tuint32_t;
  end;
  Pwl_cursor_image = ^Twl_cursor_image;

  Twl_cursor = record
    image_count: dword;
    images: ^Pwl_cursor_image;
    name: pchar;
  end;
  Pwl_cursor = ^Twl_cursor;

function wl_cursor_theme_load(name: pchar; size: longint; shm: Pwl_shm): Pwl_cursor_theme; cdecl; external libwayland_client;
procedure wl_cursor_theme_destroy(theme: Pwl_cursor_theme); cdecl; external libwayland_client;
function wl_cursor_theme_get_cursor(theme: Pwl_cursor_theme; name: pchar): Pwl_cursor; cdecl; external libwayland_client;
function wl_cursor_image_get_buffer(image: Pwl_cursor_image): Pwl_buffer; cdecl; external libwayland_client;
function wl_cursor_frame(cursor: Pwl_cursor; time: Tuint32_t): longint; cdecl; external libwayland_client;
function wl_cursor_frame_and_duration(cursor: Pwl_cursor; time: Tuint32_t; duration: Puint32_t): longint; cdecl; external libwayland_client;

// === Konventiert am: 10-6-26 17:05:44 ===


implementation



end.
