unit adap_swipe_tracker;

interface

uses
  fp_adapta;

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

{G_DECLARE_FINAL_TYPE (AdapSwipeTracker, adap_swipe_tracker, ADAP, SWIPE_TRACKER, GObject) }
function adap_swipe_tracker_new(swipeable:PAdapSwipeable):PAdapSwipeTracker;cdecl;external libadapta;
function adap_swipe_tracker_get_swipeable(self:PAdapSwipeTracker):PAdapSwipeable;cdecl;external libadapta;
function adap_swipe_tracker_get_enabled(self:PAdapSwipeTracker):Tgboolean;cdecl;external libadapta;
procedure adap_swipe_tracker_set_enabled(self:PAdapSwipeTracker; enabled:Tgboolean);cdecl;external libadapta;
function adap_swipe_tracker_get_reversed(self:PAdapSwipeTracker):Tgboolean;cdecl;external libadapta;
procedure adap_swipe_tracker_set_reversed(self:PAdapSwipeTracker; reversed:Tgboolean);cdecl;external libadapta;
function adap_swipe_tracker_get_allow_mouse_drag(self:PAdapSwipeTracker):Tgboolean;cdecl;external libadapta;
procedure adap_swipe_tracker_set_allow_mouse_drag(self:PAdapSwipeTracker; allow_mouse_drag:Tgboolean);cdecl;external libadapta;
function adap_swipe_tracker_get_allow_long_swipes(self:PAdapSwipeTracker):Tgboolean;cdecl;external libadapta;
procedure adap_swipe_tracker_set_allow_long_swipes(self:PAdapSwipeTracker; allow_long_swipes:Tgboolean);cdecl;external libadapta;
function adap_swipe_tracker_get_lower_overshoot(self:PAdapSwipeTracker):Tgboolean;cdecl;external libadapta;
procedure adap_swipe_tracker_set_lower_overshoot(self:PAdapSwipeTracker; overshoot:Tgboolean);cdecl;external libadapta;
function adap_swipe_tracker_get_upper_overshoot(self:PAdapSwipeTracker):Tgboolean;cdecl;external libadapta;
procedure adap_swipe_tracker_set_upper_overshoot(self:PAdapSwipeTracker; overshoot:Tgboolean);cdecl;external libadapta;
function adap_swipe_tracker_get_allow_window_handle(self:PAdapSwipeTracker):Tgboolean;cdecl;external libadapta;
procedure adap_swipe_tracker_set_allow_window_handle(self:PAdapSwipeTracker; allow_window_handle:Tgboolean);cdecl;external libadapta;
procedure adap_swipe_tracker_shift_position(self:PAdapSwipeTracker; delta:Tdouble);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:18:55 ===

function ADAP_TYPE_SWIPE_TRACKER: TGType;
function ADAP_SWIPE_TRACKER(obj: Pointer): PAdapSwipeTracker;
function ADAP_IS_SWIPE_TRACKER(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_SWIPE_TRACKER: TGType;
begin
  Result := adap_swipe_tracker_get_type;
end;

function ADAP_SWIPE_TRACKER(obj: Pointer): PAdapSwipeTracker;
begin
  Result := PAdapSwipeTracker(g_type_check_instance_cast(obj, ADAP_TYPE_SWIPE_TRACKER));
end;

function ADAP_IS_SWIPE_TRACKER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_SWIPE_TRACKER);
end;

type 
  TAdapSwipeTracker = record
  end;
  PAdapSwipeTracker = ^TAdapSwipeTracker;

  TAdapSwipeTrackerClass = record
    parent_class: TGObjectClass;
  end;
  PAdapSwipeTrackerClass = ^TAdapSwipeTrackerClass;

function adap_swipe_tracker_get_type: TGType; cdecl; external libgxxxxxxx;



end.
