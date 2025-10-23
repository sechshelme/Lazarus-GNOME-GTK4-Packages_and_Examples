{$IFDEF read_interface}

{GES_DECLARE_TYPE (Clip, clip, CLIP); }

type
  TGESClipPrivate = record
  end;
  PGESClipPrivate = ^TGESClipPrivate;

  TGESClip = record
      parent : TGESContainer;
      priv : PGESClipPrivate;
      _ges_reserved : array[0..(GES_PADDING_LARGE)-1] of Tgpointer;
    end;
  PGESClip = ^TGESClip;

  TGESFillTrackElementFunc = function (clip:PGESClip; track_element:PGESTrackElement; nleobj:PGstElement):Tgboolean;cdecl;

  TGESCreateTrackElementFunc = function (clip:PGESClip; _type:TGESTrackType):PGESTrackElement;cdecl;
  PGESCreateTrackElementFunc = ^TGESCreateTrackElementFunc;

  TGESCreateTrackElementsFunc = function (clip:PGESClip; _type:TGESTrackType):PGList;cdecl;
  PGESCreateTrackElementsFunc = ^TGESCreateTrackElementsFunc;

  TGESClipClass = record
      parent_class : TGESContainerClass;
      create_track_element : TGESCreateTrackElementFunc;
      create_track_elements : TGESCreateTrackElementsFunc;
      ABI : record
          case longint of
            0 : ( _ges_reserved : array[0..(GES_PADDING_LARGE)-1] of Tgpointer );
            1 : ( abi : record
                can_add_effects : Tgboolean;
              end );
          end;
    end;
  PGESClipClass = ^TGESClipClass;

function ges_clip_get_type: TGType; cdecl; external libges;
function ges_clip_get_supported_formats(clip:PGESClip):TGESTrackType;cdecl;external libges;
procedure ges_clip_set_supported_formats(clip:PGESClip; supportedformats:TGESTrackType);cdecl;external libges;
function ges_clip_add_asset(clip:PGESClip; asset:PGESAsset):PGESTrackElement;cdecl;external libges;
function ges_clip_find_track_element(clip:PGESClip; track:PGESTrack; _type:TGType):PGESTrackElement;cdecl;external libges;
function ges_clip_find_track_elements(clip:PGESClip; track:PGESTrack; track_type:TGESTrackType; _type:TGType):PGList;cdecl;external libges;
function ges_clip_add_child_to_track(clip:PGESClip; child:PGESTrackElement; track:PGESTrack; error:PPGError):PGESTrackElement;cdecl;external libges;
function ges_clip_get_layer(clip:PGESClip):PGESLayer;cdecl;external libges;
function ges_clip_move_to_layer(clip:PGESClip; layer:PGESLayer):Tgboolean;cdecl;external libges;
function ges_clip_move_to_layer_full(clip:PGESClip; layer:PGESLayer; error:PPGError):Tgboolean;cdecl;external libges;
function ges_clip_add_top_effect(clip:PGESClip; effect:PGESBaseEffect; index:Tgint; error:PPGError):Tgboolean;cdecl;external libges;
function ges_clip_remove_top_effect(clip:PGESClip; effect:PGESBaseEffect; error:PPGError):Tgboolean;cdecl;external libges;
function ges_clip_get_top_effects(clip:PGESClip):PGList;cdecl;external libges;
function ges_clip_get_top_effect_position(clip:PGESClip; effect:PGESBaseEffect):Tgint;cdecl;external libges;
function ges_clip_get_top_effect_index(clip:PGESClip; effect:PGESBaseEffect):Tgint;cdecl;external libges;
function ges_clip_set_top_effect_priority(clip:PGESClip; effect:PGESBaseEffect; newpriority:Tguint):Tgboolean;cdecl;external libges;
function ges_clip_set_top_effect_index(clip:PGESClip; effect:PGESBaseEffect; newindex:Tguint):Tgboolean;cdecl;external libges;
function ges_clip_set_top_effect_index_full(clip:PGESClip; effect:PGESBaseEffect; newindex:Tguint; error:PPGError):Tgboolean;cdecl;external libges;
function ges_clip_split(clip:PGESClip; position:Tguint64):PGESClip;cdecl;external libges;
function ges_clip_split_full(clip:PGESClip; position:Tguint64; error:PPGError):PGESClip;cdecl;external libges;
function ges_clip_get_internal_time_from_timeline_time(clip:PGESClip; child:PGESTrackElement; timeline_time:TGstClockTime; error:PPGError):TGstClockTime;cdecl;external libges;
function ges_clip_get_timeline_time_from_internal_time(clip:PGESClip; child:PGESTrackElement; internal_time:TGstClockTime; error:PPGError):TGstClockTime;cdecl;external libges;
function ges_clip_get_timeline_time_from_source_frame(clip:PGESClip; frame_number:TGESFrameNumber; error:PPGError):TGstClockTime;cdecl;external libges;
function ges_clip_get_duration_limit(clip:PGESClip):TGstClockTime;cdecl;external libges;

function GES_CLIP_CLASS_CAN_ADD_EFFECTS(klass : Pointer) : Tgboolean;

// === Konventiert am: 12-12-24 19:13:27 ===

function GES_TYPE_CLIP: TGType;
function GES_CLIP(obj: Pointer): PGESClip;
function GES_IS_CLIP(obj: Pointer): Tgboolean;
function GES_CLIP_CLASS(klass: Pointer): PGESClipClass;
function GES_IS_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_CLIP_GET_CLASS(obj: Pointer): PGESClipClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_CLIP: TGType;
begin
  Result := ges_clip_get_type;
end;

function GES_CLIP(obj: Pointer): PGESClip;
begin
  Result := PGESClip(g_type_check_instance_cast(obj, GES_TYPE_CLIP));
end;

function GES_IS_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_CLIP);
end;

function GES_CLIP_CLASS(klass: Pointer): PGESClipClass;
begin
  Result := PGESClipClass(g_type_check_class_cast(klass, GES_TYPE_CLIP));
end;

function GES_IS_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_CLIP);
end;

function GES_CLIP_GET_CLASS(obj: Pointer): PGESClipClass;
begin
  Result := PGESClipClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GES_CLIP_CLASS_CAN_ADD_EFFECTS(klass: Pointer): Tgboolean;
begin
  GES_CLIP_CLASS_CAN_ADD_EFFECTS:=(GES_CLIP_CLASS(klass))^.ABI.abi.can_add_effects;
end;


{$ENDIF read_implementation}
