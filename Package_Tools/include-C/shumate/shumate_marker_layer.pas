unit shumate_marker_layer;

interface

uses
  fp_GTK4, fp_glib2, fp_shumate, shumate_layer, shumate_viewport, shumate_marker;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TShumateMarkerLayer = record
  end;
  PShumateMarkerLayer = ^TShumateMarkerLayer;

  TShumateMarkerLayerClass = record
    parent_class: TShumateLayerClass;
  end;
  PShumateMarkerLayerClass = ^TShumateMarkerLayerClass;

function shumate_marker_layer_get_type: TGType; cdecl; external libshumate;
function shumate_marker_layer_new(viewport: PShumateViewport): PShumateMarkerLayer; cdecl; external libshumate;
function shumate_marker_layer_new_full(viewport: PShumateViewport; mode: TGtkSelectionMode): PShumateMarkerLayer; cdecl; external libshumate;
procedure shumate_marker_layer_add_marker(self: PShumateMarkerLayer; marker: PShumateMarker); cdecl; external libshumate;
procedure shumate_marker_layer_remove_marker(self: PShumateMarkerLayer; marker: PShumateMarker); cdecl; external libshumate;
procedure shumate_marker_layer_remove_all(self: PShumateMarkerLayer); cdecl; external libshumate;
function shumate_marker_layer_get_markers(self: PShumateMarkerLayer): PGList; cdecl; external libshumate;
function shumate_marker_layer_get_selected(self: PShumateMarkerLayer): PGList; cdecl; external libshumate;
function shumate_marker_layer_select_marker(self: PShumateMarkerLayer; marker: PShumateMarker): Tgboolean; cdecl; external libshumate;
procedure shumate_marker_layer_unselect_marker(self: PShumateMarkerLayer; marker: PShumateMarker); cdecl; external libshumate;
procedure shumate_marker_layer_select_all_markers(self: PShumateMarkerLayer); cdecl; external libshumate;
procedure shumate_marker_layer_unselect_all_markers(self: PShumateMarkerLayer); cdecl; external libshumate;
procedure shumate_marker_layer_set_selection_mode(self: PShumateMarkerLayer; mode: TGtkSelectionMode); cdecl; external libshumate;
function shumate_marker_layer_get_selection_mode(self: PShumateMarkerLayer): TGtkSelectionMode; cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:49:07 ===

function SHUMATE_TYPE_MARKER_LAYER: TGType;
function SHUMATE_MARKER_LAYER(obj: Pointer): PShumateMarkerLayer;
function SHUMATE_IS_MARKER_LAYER(obj: Pointer): Tgboolean;

implementation

function SHUMATE_TYPE_MARKER_LAYER: TGType;
begin
  Result := shumate_marker_layer_get_type;
end;

function SHUMATE_MARKER_LAYER(obj: Pointer): PShumateMarkerLayer;
begin
  Result := PShumateMarkerLayer(g_type_check_instance_cast(obj, SHUMATE_TYPE_MARKER_LAYER));
end;

function SHUMATE_IS_MARKER_LAYER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_MARKER_LAYER);
end;


end.
