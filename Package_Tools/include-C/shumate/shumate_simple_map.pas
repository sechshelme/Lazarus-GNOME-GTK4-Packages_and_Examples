unit shumate_simple_map;

interface

uses
  fp_GTK4, fp_glib2, fp_shumate,shumate_viewport,shumate_map_source,shumate_layer,shumate_compass,shumate_license,shumate_scale,shumate_map;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TShumateSimpleMap = record
  end;
  PShumateSimpleMap = ^TShumateSimpleMap;

  TShumateSimpleMapClass = record
    parent_class: TGtkWidgetClass;
  end;
  PShumateSimpleMapClass = ^TShumateSimpleMapClass;

function shumate_simple_map_get_type: TGType; cdecl; external libshumate;
function shumate_simple_map_new: PShumateSimpleMap; cdecl; external libshumate;
function shumate_simple_map_get_viewport(self: PShumateSimpleMap): PShumateViewport; cdecl; external libshumate;
function shumate_simple_map_get_map_source(self: PShumateSimpleMap): PShumateMapSource; cdecl; external libshumate;
procedure shumate_simple_map_set_map_source(self: PShumateSimpleMap; map_source: PShumateMapSource); cdecl; external libshumate;
procedure shumate_simple_map_add_overlay_layer(self: PShumateSimpleMap; layer: PShumateLayer); cdecl; external libshumate;
procedure shumate_simple_map_insert_overlay_layer(self: PShumateSimpleMap; layer: PShumateLayer; idx: Tguint); cdecl; external libshumate;
procedure shumate_simple_map_remove_overlay_layer(self: PShumateSimpleMap; layer: PShumateLayer); cdecl; external libshumate;
function shumate_simple_map_get_compass(self: PShumateSimpleMap): PShumateCompass; cdecl; external libshumate;
function shumate_simple_map_get_license(self: PShumateSimpleMap): PShumateLicense; cdecl; external libshumate;
function shumate_simple_map_get_scale(self: PShumateSimpleMap): PShumateScale; cdecl; external libshumate;
function shumate_simple_map_get_show_zoom_buttons(self: PShumateSimpleMap): Tgboolean; cdecl; external libshumate;
procedure shumate_simple_map_set_show_zoom_buttons(self: PShumateSimpleMap; show_zoom_buttons: Tgboolean); cdecl; external libshumate;
function shumate_simple_map_get_map(self: PShumateSimpleMap): PShumateMap; cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:48:39 ===

function SHUMATE_TYPE_SIMPLE_MAP: TGType;
function SHUMATE_SIMPLE_MAP(obj: Pointer): PShumateSimpleMap;
function SHUMATE_IS_SIMPLE_MAP(obj: Pointer): Tgboolean;

implementation

function SHUMATE_TYPE_SIMPLE_MAP: TGType;
begin
  Result := shumate_simple_map_get_type;
end;

function SHUMATE_SIMPLE_MAP(obj: Pointer): PShumateSimpleMap;
begin
  Result := PShumateSimpleMap(g_type_check_instance_cast(obj, SHUMATE_TYPE_SIMPLE_MAP));
end;

function SHUMATE_IS_SIMPLE_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_SIMPLE_MAP);
end;


end.
