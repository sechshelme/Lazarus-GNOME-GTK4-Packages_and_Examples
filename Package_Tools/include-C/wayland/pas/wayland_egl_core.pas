unit wayland_egl_core;

interface

uses
  fp_wayland_client;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2011 Kristian Høgsberg
 * Copyright © 2011 Benjamin Franzke
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
{$ifndef WAYLAND_EGL_CORE_H}
{$define WAYLAND_EGL_CORE_H}
{ C++ extern C conditionnal removed }

const
  WL_EGL_PLATFORM = 1;  
type
  Pwl_egl_window = ^Twl_egl_window;
  Twl_egl_window = record
      {undefined structure}
    end;

  Pwl_surface = ^Twl_surface;
  Twl_surface = record
      {undefined structure}
    end;


function wl_egl_window_create(surface:Pwl_surface; width:longint; height:longint):Pwl_egl_window;cdecl;external libwayland_client;
procedure wl_egl_window_destroy(egl_window:Pwl_egl_window);cdecl;external libwayland_client;
procedure wl_egl_window_resize(egl_window:Pwl_egl_window; width:longint; height:longint; dx:longint; dy:longint);cdecl;external libwayland_client;
procedure wl_egl_window_get_attached_size(egl_window:Pwl_egl_window; width:Plongint; height:Plongint);cdecl;external libwayland_client;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 10-6-26 17:05:51 ===


implementation



end.
