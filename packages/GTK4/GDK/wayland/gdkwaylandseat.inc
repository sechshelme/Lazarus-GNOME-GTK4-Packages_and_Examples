
{$IFDEF read_interface}

type
  PGdkWaylandSeat = ^TGdkWaylandSeat;
  TGdkWaylandSeat = TGdkSeat;

function gdk_wayland_seat_get_type:TGType;cdecl;external libgtk4;
function gdk_wayland_seat_get_wl_seat(seat:PGdkSeat):Pwl_seat;cdecl;external libgtk4;

// === Konventiert am: 3-8-24 19:19:41 ===

function GDK_TYPE_WAYLAND_SEAT : TGType;
function GDK_WAYLAND_SEAT(obj : Pointer) : PGdkWaylandSeat;
function GDK_IS_WAYLAND_SEAT(obj : Pointer) : Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_WAYLAND_SEAT : TGType;
  begin
    GDK_TYPE_WAYLAND_SEAT:=gdk_wayland_seat_get_type;
  end;

function GDK_WAYLAND_SEAT(obj : Pointer) : PGdkWaylandSeat;
begin
  Result := PGdkWaylandSeat(g_type_check_instance_cast(obj, GDK_TYPE_WAYLAND_SEAT));
end;

function GDK_IS_WAYLAND_SEAT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_WAYLAND_SEAT);
end;



{$ENDIF read_implementation}
