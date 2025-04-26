{$IFDEF read_interface}


type
  TAdwSwipeable = record
  end;
  PAdwSwipeable = ^TAdwSwipeable;

  TAdwSwipeableInterface = record
    parent: TGTypeInterface;
    get_distance: function(self: PAdwSwipeable): Tdouble; cdecl;
    get_snap_points: function(self: PAdwSwipeable; n_snap_points: Plongint): Pdouble; cdecl;
    get_progress: function(self: PAdwSwipeable): Tdouble; cdecl;
    get_cancel_progress: function(self: PAdwSwipeable): Tdouble; cdecl;
    get_swipe_area: procedure(self: PAdwSwipeable; navigation_direction: TAdwNavigationDirection; is_drag: Tgboolean; rect: PGdkRectangle); cdecl;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwSwipeableInterface = ^TAdwSwipeableInterface;

function adw_swipeable_get_type: TGType; cdecl; external libadwaita;
function adw_swipeable_get_distance(self: PAdwSwipeable): Tdouble; cdecl; external libadwaita;
function adw_swipeable_get_snap_points(self: PAdwSwipeable; n_snap_points: Plongint): Pdouble; cdecl; external libadwaita;
function adw_swipeable_get_progress(self: PAdwSwipeable): Tdouble; cdecl; external libadwaita;
function adw_swipeable_get_cancel_progress(self: PAdwSwipeable): Tdouble; cdecl; external libadwaita;
procedure adw_swipeable_get_swipe_area(self: PAdwSwipeable; navigation_direction: TAdwNavigationDirection; is_drag: Tgboolean; rect: PGdkRectangle); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 13:09:33 ===

function ADW_TYPE_SWIPEABLE: TGType;
function ADW_SWIPEABLE(obj: Pointer): PAdwSwipeable;
function ADW_IS_SWIPEABLE(obj: Pointer): Tgboolean;
function ADW_SWIPEABLE_GET_IFACE(obj: Pointer): PAdwSwipeableInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_SWIPEABLE: TGType;
begin
  Result := adw_swipeable_get_type;
end;

function ADW_SWIPEABLE(obj: Pointer): PAdwSwipeable;
begin
  Result := PAdwSwipeable(g_type_check_instance_cast(obj, ADW_TYPE_SWIPEABLE));
end;

function ADW_IS_SWIPEABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_SWIPEABLE);
end;

function ADW_SWIPEABLE_GET_IFACE(obj: Pointer): PAdwSwipeableInterface;
begin
  Result := g_type_interface_peek(obj, ADW_TYPE_SWIPEABLE);
end;


{$ENDIF read_implementation}
