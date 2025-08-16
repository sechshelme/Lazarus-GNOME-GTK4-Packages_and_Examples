{$IFDEF read_interface}


function poppler_layer_get_type: TGType; cdecl; external libpoppler_glib;
function poppler_layer_get_title(layer: PPopplerLayer): Pgchar; cdecl; external libpoppler_glib;
function poppler_layer_is_visible(layer: PPopplerLayer): Tgboolean; cdecl; external libpoppler_glib;
procedure poppler_layer_show(layer: PPopplerLayer); cdecl; external libpoppler_glib;
procedure poppler_layer_hide(layer: PPopplerLayer); cdecl; external libpoppler_glib;
function poppler_layer_is_parent(layer: PPopplerLayer): Tgboolean; cdecl; external libpoppler_glib;
function poppler_layer_get_radio_button_group_id(layer: PPopplerLayer): Tgint; cdecl; external libpoppler_glib;

// === Konventiert am: 15-8-25 16:55:07 ===

function POPPLER_TYPE_LAYER: TGType;
function POPPLER_LAYER(obj: Pointer): PPopplerLayer;
function POPPLER_IS_LAYER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

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



{$ENDIF read_implementation}
