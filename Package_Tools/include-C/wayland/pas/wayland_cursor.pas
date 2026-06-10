unit wayland_cursor;

interface

uses
  fp_wayland;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2012 Intel Corporation
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice (including the
 * next paragraph) shall be included in all copies or substantial
 * portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
  }
{$ifndef WAYLAND_CURSOR_H}
{$define WAYLAND_CURSOR_H}
{$include <stdint.h>}
{ C++ extern C conditionnal removed }
type
  Pwl_cursor_theme = ^Twl_cursor_theme;
  Twl_cursor_theme = record
      {undefined structure}
    end;

  Pwl_buffer = ^Twl_buffer;
  Twl_buffer = record
      {undefined structure}
    end;

  Pwl_shm = ^Twl_shm;
  Twl_shm = record
      {undefined structure}
    end;

{* A still image part of a cursor
 *
 * Use `wl_cursor_image_get_buffer()` to get the corresponding `struct
 * wl_buffer` to attach to your `struct wl_surface`.  }
{* Actual width  }
{* Actual height  }
{* Hot spot x (must be inside image)  }
{* Hot spot y (must be inside image)  }
{* Animation delay to next frame (ms)  }
  Pwl_cursor_image = ^Twl_cursor_image;
  Twl_cursor_image = record
      width : Tuint32_t;
      height : Tuint32_t;
      hotspot_x : Tuint32_t;
      hotspot_y : Tuint32_t;
      delay : Tuint32_t;
    end;

{* A cursor, as returned by `wl_cursor_theme_get_cursor()`  }
{* How many images there are in this cursor’s animation  }
{* The array of still images composing this animation  }
{* The name of this cursor  }
  Pwl_cursor = ^Twl_cursor;
  Twl_cursor = record
      image_count : dword;
      images : ^Pwl_cursor_image;
      name : Pchar;
    end;


function wl_cursor_theme_load(name:Pchar; size:longint; shm:Pwl_shm):Pwl_cursor_theme;cdecl;external libwayland_client;
procedure wl_cursor_theme_destroy(theme:Pwl_cursor_theme);cdecl;external libwayland_client;
function wl_cursor_theme_get_cursor(theme:Pwl_cursor_theme; name:Pchar):Pwl_cursor;cdecl;external libwayland_client;
function wl_cursor_image_get_buffer(image:Pwl_cursor_image):Pwl_buffer;cdecl;external libwayland_client;
function wl_cursor_frame(cursor:Pwl_cursor; time:Tuint32_t):longint;cdecl;external libwayland_client;
function wl_cursor_frame_and_duration(cursor:Pwl_cursor; time:Tuint32_t; duration:Puint32_t):longint;cdecl;external libwayland_client;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 10-6-26 17:05:44 ===


implementation



end.
