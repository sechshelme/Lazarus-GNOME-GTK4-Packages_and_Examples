{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (AdwSwipeTracker, adw_swipe_tracker, ADW, SWIPE_TRACKER, GObject) }
type
  TAdwSwipeTracker = record
  end;
  PAdwSwipeTracker = ^TAdwSwipeTracker;

  TAdwSwipeTrackerClass = record
    parent_class: TGObjectClass;
  end;
  PAdwSwipeTrackerClass = ^TAdwSwipeTrackerClass;

function adw_swipe_tracker_get_type: TGType; cdecl; external libadwaita;
function adw_swipe_tracker_new(swipeable: PAdwSwipeable): PAdwSwipeTracker; cdecl; external libadwaita;
function adw_swipe_tracker_get_swipeable(self: PAdwSwipeTracker): PAdwSwipeable; cdecl; external libadwaita;
function adw_swipe_tracker_get_enabled(self: PAdwSwipeTracker): Tgboolean; cdecl; external libadwaita;
procedure adw_swipe_tracker_set_enabled(self: PAdwSwipeTracker; Enabled: Tgboolean); cdecl; external libadwaita;
function adw_swipe_tracker_get_reversed(self: PAdwSwipeTracker): Tgboolean; cdecl; external libadwaita;
procedure adw_swipe_tracker_set_reversed(self: PAdwSwipeTracker; reversed: Tgboolean); cdecl; external libadwaita;
function adw_swipe_tracker_get_allow_mouse_drag(self: PAdwSwipeTracker): Tgboolean; cdecl; external libadwaita;
procedure adw_swipe_tracker_set_allow_mouse_drag(self: PAdwSwipeTracker; allow_mouse_drag: Tgboolean); cdecl; external libadwaita;
function adw_swipe_tracker_get_allow_long_swipes(self: PAdwSwipeTracker): Tgboolean; cdecl; external libadwaita;
procedure adw_swipe_tracker_set_allow_long_swipes(self: PAdwSwipeTracker; allow_long_swipes: Tgboolean); cdecl; external libadwaita;
function adw_swipe_tracker_get_lower_overshoot(self: PAdwSwipeTracker): Tgboolean; cdecl; external libadwaita;
procedure adw_swipe_tracker_set_lower_overshoot(self: PAdwSwipeTracker; overshoot: Tgboolean); cdecl; external libadwaita;
function adw_swipe_tracker_get_upper_overshoot(self: PAdwSwipeTracker): Tgboolean; cdecl; external libadwaita;
procedure adw_swipe_tracker_set_upper_overshoot(self: PAdwSwipeTracker; overshoot: Tgboolean); cdecl; external libadwaita;
function adw_swipe_tracker_get_allow_window_handle(self: PAdwSwipeTracker): Tgboolean; cdecl; external libadwaita;
procedure adw_swipe_tracker_set_allow_window_handle(self: PAdwSwipeTracker; allow_window_handle: Tgboolean); cdecl; external libadwaita;
procedure adw_swipe_tracker_shift_position(self: PAdwSwipeTracker; delta: double); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 13:04:17 ===

function ADW_TYPE_SWIPE_TRACKER: TGType;
function ADW_SWIPE_TRACKER(obj: Pointer): PAdwSwipeTracker;
function ADW_IS_SWIPE_TRACKER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_SWIPE_TRACKER: TGType;
begin
  Result := adw_swipe_tracker_get_type;
end;

function ADW_SWIPE_TRACKER(obj: Pointer): PAdwSwipeTracker;
begin
  Result := PAdwSwipeTracker(g_type_check_instance_cast(obj, ADW_TYPE_SWIPE_TRACKER));
end;

function ADW_IS_SWIPE_TRACKER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_SWIPE_TRACKER);
end;


{$ENDIF read_implementation}
