
unit adw_swipe_tracker;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_swipe_tracker.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_swipe_tracker.h
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
PAdwSwipeable  = ^AdwSwipeable;
PAdwSwipeTracker  = ^AdwSwipeTracker;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Alice Mikhaylenko <alicem@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-swipeable.h"}

{ was #define dname def_expr }
function ADW_TYPE_SWIPE_TRACKER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwSwipeTracker, adw_swipe_tracker, ADW, SWIPE_TRACKER, GObject) }
function adw_swipe_tracker_new(swipeable:PAdwSwipeable):PAdwSwipeTracker;cdecl;external;
function adw_swipe_tracker_get_swipeable(self:PAdwSwipeTracker):PAdwSwipeable;cdecl;external;
function adw_swipe_tracker_get_enabled(self:PAdwSwipeTracker):Tgboolean;cdecl;external;
procedure adw_swipe_tracker_set_enabled(self:PAdwSwipeTracker; enabled:Tgboolean);cdecl;external;
function adw_swipe_tracker_get_reversed(self:PAdwSwipeTracker):Tgboolean;cdecl;external;
procedure adw_swipe_tracker_set_reversed(self:PAdwSwipeTracker; reversed:Tgboolean);cdecl;external;
function adw_swipe_tracker_get_allow_mouse_drag(self:PAdwSwipeTracker):Tgboolean;cdecl;external;
procedure adw_swipe_tracker_set_allow_mouse_drag(self:PAdwSwipeTracker; allow_mouse_drag:Tgboolean);cdecl;external;
function adw_swipe_tracker_get_allow_long_swipes(self:PAdwSwipeTracker):Tgboolean;cdecl;external;
procedure adw_swipe_tracker_set_allow_long_swipes(self:PAdwSwipeTracker; allow_long_swipes:Tgboolean);cdecl;external;
function adw_swipe_tracker_get_lower_overshoot(self:PAdwSwipeTracker):Tgboolean;cdecl;external;
procedure adw_swipe_tracker_set_lower_overshoot(self:PAdwSwipeTracker; overshoot:Tgboolean);cdecl;external;
function adw_swipe_tracker_get_upper_overshoot(self:PAdwSwipeTracker):Tgboolean;cdecl;external;
procedure adw_swipe_tracker_set_upper_overshoot(self:PAdwSwipeTracker; overshoot:Tgboolean);cdecl;external;
function adw_swipe_tracker_get_allow_window_handle(self:PAdwSwipeTracker):Tgboolean;cdecl;external;
procedure adw_swipe_tracker_set_allow_window_handle(self:PAdwSwipeTracker; allow_window_handle:Tgboolean);cdecl;external;
procedure adw_swipe_tracker_shift_position(self:PAdwSwipeTracker; delta:Tdouble);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_SWIPE_TRACKER : longint; { return type might be wrong }
  begin
    ADW_TYPE_SWIPE_TRACKER:=adw_swipe_tracker_get_type;
  end;


end.
