unit adap_swipeable;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_navigation_direction;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAdapSwipeable = record
  end;
  PAdapSwipeable = ^TAdapSwipeable;

  TAdapSwipeableInterface = record
    parent: TGTypeInterface;
    get_distance: function(self: PAdapSwipeable): double; cdecl;
    get_snap_points: function(self: PAdapSwipeable; n_snap_points: Plongint): Pdouble; cdecl;
    get_progress: function(self: PAdapSwipeable): double; cdecl;
    get_cancel_progress: function(self: PAdapSwipeable): double; cdecl;
    get_swipe_area: procedure(self: PAdapSwipeable; navigation_direction: TAdapNavigationDirection; is_drag: Tgboolean; rect: PGdkRectangle); cdecl;
    padding: array[0..3] of Tgpointer;
  end;
  PAdapSwipeableInterface = ^TAdapSwipeableInterface;

function adap_swipeable_get_type: TGType; cdecl; external libadapta;
function adap_swipeable_get_distance(self: PAdapSwipeable): double; cdecl; external libadapta;
function adap_swipeable_get_snap_points(self: PAdapSwipeable; n_snap_points: Plongint): Pdouble; cdecl; external libadapta;
function adap_swipeable_get_progress(self: PAdapSwipeable): double; cdecl; external libadapta;
function adap_swipeable_get_cancel_progress(self: PAdapSwipeable): double; cdecl; external libadapta;
procedure adap_swipeable_get_swipe_area(self: PAdapSwipeable; navigation_direction: TAdapNavigationDirection; is_drag: Tgboolean; rect: PGdkRectangle); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:18:53 ===

function ADAP_TYPE_SWIPEABLE: TGType;
function ADAP_SWIPEABLE(obj: Pointer): PAdapSwipeable;
function ADAP_IS_SWIPEABLE(obj: Pointer): Tgboolean;
function ADAP_SWIPEABLE_GET_IFACE(obj: Pointer): PAdapSwipeableInterface;

implementation

function ADAP_TYPE_SWIPEABLE: TGType;
begin
  Result := adap_swipeable_get_type;
end;

function ADAP_SWIPEABLE(obj: Pointer): PAdapSwipeable;
begin
  Result := PAdapSwipeable(g_type_check_instance_cast(obj, ADAP_TYPE_SWIPEABLE));
end;

function ADAP_IS_SWIPEABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_SWIPEABLE);
end;

function ADAP_SWIPEABLE_GET_IFACE(obj: Pointer): PAdapSwipeableInterface;
begin
  Result := g_type_interface_peek(obj, ADAP_TYPE_SWIPEABLE);
end;


end.
