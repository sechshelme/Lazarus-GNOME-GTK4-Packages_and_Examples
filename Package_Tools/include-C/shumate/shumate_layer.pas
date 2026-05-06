unit shumate_layer;

interface

uses
  fp_GTK4, fp_glib2, fp_shumate, shumate_viewport;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TShumateLayer = record
    parent_instance: TGtkWidget;
  end;
  PShumateLayer = ^TShumateLayer;

  TShumateLayerClass = record
    parent_class: TGtkWidgetClass;
    get_debug_text: function(self: PShumateLayer): pchar; cdecl;
    padding: array[0..14] of Tgpointer;
  end;
  PShumateLayerClass = ^TShumateLayerClass;

function shumate_layer_get_type: TGType; cdecl; external libshumate;
function shumate_layer_get_viewport(self: PShumateLayer): PShumateViewport; cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:49:37 ===

function SHUMATE_TYPE_LAYER: TGType;
function SHUMATE_LAYER(obj: Pointer): PShumateLayer;
function SHUMATE_IS_LAYER(obj: Pointer): Tgboolean;
function SHUMATE_LAYER_CLASS(klass: Pointer): PShumateLayerClass;
function SHUMATE_IS_LAYER_CLASS(klass: Pointer): Tgboolean;
function SHUMATE_LAYER_GET_CLASS(obj: Pointer): PShumateLayerClass;

implementation

function SHUMATE_TYPE_LAYER: TGType;
begin
  Result := shumate_layer_get_type;
end;

function SHUMATE_LAYER(obj: Pointer): PShumateLayer;
begin
  Result := PShumateLayer(g_type_check_instance_cast(obj, SHUMATE_TYPE_LAYER));
end;

function SHUMATE_IS_LAYER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_LAYER);
end;

function SHUMATE_LAYER_CLASS(klass: Pointer): PShumateLayerClass;
begin
  Result := PShumateLayerClass(g_type_check_class_cast(klass, SHUMATE_TYPE_LAYER));
end;

function SHUMATE_IS_LAYER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, SHUMATE_TYPE_LAYER);
end;

function SHUMATE_LAYER_GET_CLASS(obj: Pointer): PShumateLayerClass;
begin
  Result := PShumateLayerClass(PGTypeInstance(obj)^.g_class);
end;


end.
