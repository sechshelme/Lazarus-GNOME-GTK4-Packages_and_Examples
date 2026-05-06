{$IFDEF read_interface}


type
  TShumateMarker = record
    parent_instance: TGtkWidget;
  end;
  PShumateMarker = ^TShumateMarker;

  TShumateMarkerClass = record
    parent_class: TGtkWidgetClass;
    padding: array[0..15] of Tgpointer;
  end;
  PShumateMarkerClass = ^TShumateMarkerClass;

function shumate_marker_get_type: TGType; cdecl; external libshumate;
function shumate_marker_new: PShumateMarker; cdecl; external libshumate;
procedure shumate_marker_set_selectable(marker: PShumateMarker; value: Tgboolean); cdecl; external libshumate;
function shumate_marker_get_selectable(marker: PShumateMarker): Tgboolean; cdecl; external libshumate;
procedure shumate_marker_set_draggable(marker: PShumateMarker; value: Tgboolean); cdecl; external libshumate;
function shumate_marker_get_draggable(marker: PShumateMarker): Tgboolean; cdecl; external libshumate;
function shumate_marker_is_selected(marker: PShumateMarker): Tgboolean; cdecl; external libshumate;
procedure shumate_marker_animate_in(marker: PShumateMarker); cdecl; external libshumate;
procedure shumate_marker_animate_in_with_delay(marker: PShumateMarker; delay: Tguint); cdecl; external libshumate;
procedure shumate_marker_animate_out(marker: PShumateMarker); cdecl; external libshumate;
procedure shumate_marker_animate_out_with_delay(marker: PShumateMarker; delay: Tguint); cdecl; external libshumate;
function shumate_marker_get_child(marker: PShumateMarker): PGtkWidget; cdecl; external libshumate;
procedure shumate_marker_set_child(marker: PShumateMarker; child: PGtkWidget); cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:49:11 ===

function SHUMATE_TYPE_MARKER: TGType;
function SHUMATE_MARKER(obj: Pointer): PShumateMarker;
function SHUMATE_IS_MARKER(obj: Pointer): Tgboolean;
function SHUMATE_MARKER_CLASS(klass: Pointer): PShumateMarkerClass;
function SHUMATE_IS_MARKER_CLASS(klass: Pointer): Tgboolean;
function SHUMATE_MARKER_GET_CLASS(obj: Pointer): PShumateMarkerClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SHUMATE_TYPE_MARKER: TGType;
begin
  Result := shumate_marker_get_type;
end;

function SHUMATE_MARKER(obj: Pointer): PShumateMarker;
begin
  Result := PShumateMarker(g_type_check_instance_cast(obj, SHUMATE_TYPE_MARKER));
end;

function SHUMATE_IS_MARKER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_MARKER);
end;

function SHUMATE_MARKER_CLASS(klass: Pointer): PShumateMarkerClass;
begin
  Result := PShumateMarkerClass(g_type_check_class_cast(klass, SHUMATE_TYPE_MARKER));
end;

function SHUMATE_IS_MARKER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, SHUMATE_TYPE_MARKER);
end;

function SHUMATE_MARKER_GET_CLASS(obj: Pointer): PShumateMarkerClass;
begin
  Result := PShumateMarkerClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
