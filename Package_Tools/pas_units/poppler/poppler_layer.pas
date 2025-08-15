unit poppler_layer;

interface

uses
  fp_glib2, fp_cairo, fp_poppler_glib, poppler;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function poppler_layer_get_type: TGType; cdecl; external poppler_glib;
function poppler_layer_get_title(layer: PPopplerLayer): Pgchar; cdecl; external poppler_glib;
function poppler_layer_is_visible(layer: PPopplerLayer): Tgboolean; cdecl; external poppler_glib;
procedure poppler_layer_show(layer: PPopplerLayer); cdecl; external poppler_glib;
procedure poppler_layer_hide(layer: PPopplerLayer); cdecl; external poppler_glib;
function poppler_layer_is_parent(layer: PPopplerLayer): Tgboolean; cdecl; external poppler_glib;
function poppler_layer_get_radio_button_group_id(layer: PPopplerLayer): Tgint; cdecl; external poppler_glib;

// === Konventiert am: 15-8-25 16:55:07 ===

function POPPLER_TYPE_LAYER: TGType;
function POPPLER_LAYER(obj: Pointer): PPopplerLayer;
function POPPLER_IS_LAYER(obj: Pointer): Tgboolean;

implementation

function POPPLER_TYPE_LAYER: TGType;
begin
  POPPLER_TYPE_LAYER := poppler_layer_get_type;
end;

function POPPLER_LAYER(obj: Pointer): PPopplerLayer;
begin
  Result := PPopplerLayer(g_type_check_instance_cast(obj, POPPLER_TYPE_LAYER));
end;

function POPPLER_IS_LAYER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_LAYER);
end;



end.
