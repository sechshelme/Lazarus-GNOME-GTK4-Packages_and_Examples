{$IFDEF read_interface}


type
  TShumateViewport = record
  end;
  PShumateViewport = ^TShumateViewport;

  TShumateViewportClass = record
    parent_class: TGObjectClass;
  end;
  PShumateViewportClass = ^TShumateViewportClass;

function shumate_viewport_get_type: TGType; cdecl; external libshumate;
function shumate_viewport_new: PShumateViewport; cdecl; external libshumate;
procedure shumate_viewport_set_zoom_level(self: PShumateViewport; zoom_level: double); cdecl; external libshumate;
function shumate_viewport_get_zoom_level(self: PShumateViewport): double; cdecl; external libshumate;
procedure shumate_viewport_set_max_zoom_level(self: PShumateViewport; max_zoom_level: Tguint); cdecl; external libshumate;
function shumate_viewport_get_max_zoom_level(self: PShumateViewport): Tguint; cdecl; external libshumate;
procedure shumate_viewport_set_min_zoom_level(self: PShumateViewport; min_zoom_level: Tguint); cdecl; external libshumate;
function shumate_viewport_get_min_zoom_level(self: PShumateViewport): Tguint; cdecl; external libshumate;
procedure shumate_viewport_set_reference_map_source(self: PShumateViewport; map_source: PShumateMapSource); cdecl; external libshumate;
function shumate_viewport_get_reference_map_source(self: PShumateViewport): PShumateMapSource; cdecl; external libshumate;
procedure shumate_viewport_set_rotation(self: PShumateViewport; rotation: double); cdecl; external libshumate;
function shumate_viewport_get_rotation(self: PShumateViewport): double; cdecl; external libshumate;
procedure shumate_viewport_widget_coords_to_location(self: PShumateViewport; widget: PGtkWidget; x: double; y: double; latitude: Pdouble;
  longitude: Pdouble); cdecl; external libshumate;
procedure shumate_viewport_location_to_widget_coords(self: PShumateViewport; widget: PGtkWidget; latitude: double; longitude: double; x: Pdouble;
  y: Pdouble); cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:44:20 ===

function SHUMATE_TYPE_VIEWPORT: TGType;
function SHUMATE_VIEWPORT(obj: Pointer): PShumateViewport;
function SHUMATE_IS_VIEWPORT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SHUMATE_TYPE_VIEWPORT: TGType;
begin
  Result := shumate_viewport_get_type;
end;

function SHUMATE_VIEWPORT(obj: Pointer): PShumateViewport;
begin
  Result := PShumateViewport(g_type_check_instance_cast(obj, SHUMATE_TYPE_VIEWPORT));
end;

function SHUMATE_IS_VIEWPORT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_VIEWPORT);
end;

{$ENDIF read_implementation}
