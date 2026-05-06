unit shumate_path_layer;

interface

uses
  fp_GTK4, fp_glib2, fp_shumate, shumate_viewport, shumate_layer, shumate_location;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TShumatePathLayer = record
  end;
  PShumatePathLayer = ^TShumatePathLayer;

  TShumatePathLayerClass = record
    parent_class: TShumateLayerClass;
  end;
  PShumatePathLayerClass = ^TShumatePathLayerClass;

function shumate_path_layer_get_type: TGType; cdecl; external libshumate;
function shumate_path_layer_new(viewport: PShumateViewport): PShumatePathLayer; cdecl; external libshumate;
procedure shumate_path_layer_add_node(self: PShumatePathLayer; location: PShumateLocation); cdecl; external libshumate;
procedure shumate_path_layer_remove_node(self: PShumatePathLayer; location: PShumateLocation); cdecl; external libshumate;
procedure shumate_path_layer_remove_all(self: PShumatePathLayer); cdecl; external libshumate;
procedure shumate_path_layer_insert_node(self: PShumatePathLayer; location: PShumateLocation; position: Tguint); cdecl; external libshumate;
function shumate_path_layer_get_nodes(self: PShumatePathLayer): PGList; cdecl; external libshumate;
function shumate_path_layer_get_fill_color(self: PShumatePathLayer): PGdkRGBA; cdecl; external libshumate;
procedure shumate_path_layer_set_fill_color(self: PShumatePathLayer; color: PGdkRGBA); cdecl; external libshumate;
function shumate_path_layer_get_stroke_color(self: PShumatePathLayer): PGdkRGBA; cdecl; external libshumate;
procedure shumate_path_layer_set_stroke_color(self: PShumatePathLayer; color: PGdkRGBA); cdecl; external libshumate;
function shumate_path_layer_get_outline_color(self: PShumatePathLayer): PGdkRGBA; cdecl; external libshumate;
procedure shumate_path_layer_set_outline_color(self: PShumatePathLayer; color: PGdkRGBA); cdecl; external libshumate;
function shumate_path_layer_get_fill(self: PShumatePathLayer): Tgboolean; cdecl; external libshumate;
procedure shumate_path_layer_set_fill(self: PShumatePathLayer; value: Tgboolean); cdecl; external libshumate;
function shumate_path_layer_get_stroke(self: PShumatePathLayer): Tgboolean; cdecl; external libshumate;
procedure shumate_path_layer_set_stroke(self: PShumatePathLayer; value: Tgboolean); cdecl; external libshumate;
function shumate_path_layer_get_stroke_width(self: PShumatePathLayer): double; cdecl; external libshumate;
procedure shumate_path_layer_set_stroke_width(self: PShumatePathLayer; value: double); cdecl; external libshumate;
function shumate_path_layer_get_outline_width(self: PShumatePathLayer): double; cdecl; external libshumate;
procedure shumate_path_layer_set_outline_width(self: PShumatePathLayer; value: double); cdecl; external libshumate;
function shumate_path_layer_get_closed(self: PShumatePathLayer): Tgboolean; cdecl; external libshumate;
procedure shumate_path_layer_set_closed(self: PShumatePathLayer; value: Tgboolean); cdecl; external libshumate;
function shumate_path_layer_get_dash(self: PShumatePathLayer): PGList; cdecl; external libshumate;
procedure shumate_path_layer_set_dash(self: PShumatePathLayer; dash_pattern: PGList); cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:48:53 ===

function SHUMATE_TYPE_PATH_LAYER: TGType;
function SHUMATE_PATH_LAYER(obj: Pointer): PShumatePathLayer;
function SHUMATE_IS_PATH_LAYER(obj: Pointer): Tgboolean;

implementation

function SHUMATE_TYPE_PATH_LAYER: TGType;
begin
  Result := shumate_path_layer_get_type;
end;

function SHUMATE_PATH_LAYER(obj: Pointer): PShumatePathLayer;
begin
  Result := PShumatePathLayer(g_type_check_instance_cast(obj, SHUMATE_TYPE_PATH_LAYER));
end;

function SHUMATE_IS_PATH_LAYER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_PATH_LAYER);
end;


end.
