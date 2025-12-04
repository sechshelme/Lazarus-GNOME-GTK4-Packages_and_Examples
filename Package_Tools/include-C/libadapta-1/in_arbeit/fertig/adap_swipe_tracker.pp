
unit adap_swipe_tracker;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_swipe_tracker.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_swipe_tracker.h
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
PAdapSwipeable  = ^AdapSwipeable;
PAdapSwipeTracker  = ^AdapSwipeTracker;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Alice Mikhaylenko <alicem@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-swipeable.h"}

{ was #define dname def_expr }
function ADAP_TYPE_SWIPE_TRACKER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapSwipeTracker, adap_swipe_tracker, ADAP, SWIPE_TRACKER, GObject) }
function adap_swipe_tracker_new(swipeable:PAdapSwipeable):PAdapSwipeTracker;cdecl;external;
function adap_swipe_tracker_get_swipeable(self:PAdapSwipeTracker):PAdapSwipeable;cdecl;external;
function adap_swipe_tracker_get_enabled(self:PAdapSwipeTracker):Tgboolean;cdecl;external;
procedure adap_swipe_tracker_set_enabled(self:PAdapSwipeTracker; enabled:Tgboolean);cdecl;external;
function adap_swipe_tracker_get_reversed(self:PAdapSwipeTracker):Tgboolean;cdecl;external;
procedure adap_swipe_tracker_set_reversed(self:PAdapSwipeTracker; reversed:Tgboolean);cdecl;external;
function adap_swipe_tracker_get_allow_mouse_drag(self:PAdapSwipeTracker):Tgboolean;cdecl;external;
procedure adap_swipe_tracker_set_allow_mouse_drag(self:PAdapSwipeTracker; allow_mouse_drag:Tgboolean);cdecl;external;
function adap_swipe_tracker_get_allow_long_swipes(self:PAdapSwipeTracker):Tgboolean;cdecl;external;
procedure adap_swipe_tracker_set_allow_long_swipes(self:PAdapSwipeTracker; allow_long_swipes:Tgboolean);cdecl;external;
function adap_swipe_tracker_get_lower_overshoot(self:PAdapSwipeTracker):Tgboolean;cdecl;external;
procedure adap_swipe_tracker_set_lower_overshoot(self:PAdapSwipeTracker; overshoot:Tgboolean);cdecl;external;
function adap_swipe_tracker_get_upper_overshoot(self:PAdapSwipeTracker):Tgboolean;cdecl;external;
procedure adap_swipe_tracker_set_upper_overshoot(self:PAdapSwipeTracker; overshoot:Tgboolean);cdecl;external;
function adap_swipe_tracker_get_allow_window_handle(self:PAdapSwipeTracker):Tgboolean;cdecl;external;
procedure adap_swipe_tracker_set_allow_window_handle(self:PAdapSwipeTracker; allow_window_handle:Tgboolean);cdecl;external;
procedure adap_swipe_tracker_shift_position(self:PAdapSwipeTracker; delta:Tdouble);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_SWIPE_TRACKER : longint; { return type might be wrong }
  begin
    ADAP_TYPE_SWIPE_TRACKER:=adap_swipe_tracker_get_type;
  end;


end.
