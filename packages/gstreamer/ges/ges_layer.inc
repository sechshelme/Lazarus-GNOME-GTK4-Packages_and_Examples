{$IFDEF read_interface}

{GES_DECLARE_TYPE (Layer, layer, LAYER); }
type
  TGESLayerClass = record
      parent_class : TGInitiallyUnownedClass;
      get_objects : function (layer:PGESLayer):PGList;cdecl;
      object_added : procedure (layer:PGESLayer; obj:PGESClip);cdecl;
      object_removed : procedure (layer:PGESLayer; obj:PGESClip);cdecl;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;
  PGESLayerClass = ^TGESLayerClass;

function ges_layer_get_type: TGType; cdecl; external libges;
function ges_layer_new:PGESLayer;cdecl;external libges;
procedure ges_layer_set_timeline(layer:PGESLayer; timeline:PGESTimeline);cdecl;external libges;
function ges_layer_get_timeline(layer:PGESLayer):PGESTimeline;cdecl;external libges;
function ges_layer_add_clip(layer:PGESLayer; clip:PGESClip):Tgboolean;cdecl;external libges;
function ges_layer_add_clip_full(layer:PGESLayer; clip:PGESClip; error:PPGError):Tgboolean;cdecl;external libges;
function ges_layer_add_asset(layer:PGESLayer; asset:PGESAsset; start:TGstClockTime; inpoint:TGstClockTime; duration:TGstClockTime; 
           track_types:TGESTrackType):PGESClip;cdecl;external libges;
function ges_layer_add_asset_full(layer:PGESLayer; asset:PGESAsset; start:TGstClockTime; inpoint:TGstClockTime; duration:TGstClockTime; 
           track_types:TGESTrackType; error:PPGError):PGESClip;cdecl;external libges;
function ges_layer_remove_clip(layer:PGESLayer; clip:PGESClip):Tgboolean;cdecl;external libges;
procedure ges_layer_set_priority(layer:PGESLayer; priority:Tguint);cdecl;external libges;
function ges_layer_is_empty(layer:PGESLayer):Tgboolean;cdecl;external libges;
function ges_layer_get_clips_in_interval(layer:PGESLayer; start:TGstClockTime; end_:TGstClockTime):PGList;cdecl;external libges;
function ges_layer_get_priority(layer:PGESLayer):Tguint;cdecl;external libges;
function ges_layer_get_auto_transition(layer:PGESLayer):Tgboolean;cdecl;external libges;
procedure ges_layer_set_auto_transition(layer:PGESLayer; auto_transition:Tgboolean);cdecl;external libges;
function ges_layer_get_clips(layer:PGESLayer):PGList;cdecl;external libges;
function ges_layer_get_duration(layer:PGESLayer):TGstClockTime;cdecl;external libges;
function ges_layer_set_active_for_tracks(layer:PGESLayer; active:Tgboolean; tracks:PGList):Tgboolean;cdecl;external libges;
function ges_layer_get_active_for_track(layer:PGESLayer; track:PGESTrack):Tgboolean;cdecl;external libges;

// === Konventiert am: 12-12-24 19:02:31 ===

function GES_TYPE_LAYER: TGType;
function GES_LAYER(obj: Pointer): PGESLayer;
function GES_IS_LAYER(obj: Pointer): Tgboolean;
function GES_LAYER_CLASS(klass: Pointer): PGESLayerClass;
function GES_IS_LAYER_CLASS(klass: Pointer): Tgboolean;
function GES_LAYER_GET_CLASS(obj: Pointer): PGESLayerClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_LAYER: TGType;
begin
  Result := ges_layer_get_type;
end;

function GES_LAYER(obj: Pointer): PGESLayer;
begin
  Result := PGESLayer(g_type_check_instance_cast(obj, GES_TYPE_LAYER));
end;

function GES_IS_LAYER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_LAYER);
end;

function GES_LAYER_CLASS(klass: Pointer): PGESLayerClass;
begin
  Result := PGESLayerClass(g_type_check_class_cast(klass, GES_TYPE_LAYER));
end;

function GES_IS_LAYER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_LAYER);
end;

function GES_LAYER_GET_CLASS(obj: Pointer): PGESLayerClass;
begin
  Result := PGESLayerClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
