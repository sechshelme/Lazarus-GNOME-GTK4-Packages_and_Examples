{$IFDEF read_interface}

  {GES_DECLARE_TYPE (VideoTransition, video_transition, VIDEO_TRANSITION); }
type
  TGESVideoTransitionPrivate = record
  end;
  PGESVideoTransitionPrivate = ^TGESVideoTransitionPrivate;

  TGESVideoTransition = record
    parent: TGESTransition;
    priv: PGESVideoTransitionPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESVideoTransition = ^TGESVideoTransition;

  TGESVideoTransitionClass = record
    parent_class: TGESTransitionClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESVideoTransitionClass = ^TGESVideoTransitionClass;

function ges_video_transition_get_type: TGType; cdecl; external libges;
function ges_video_transition_new: PGESVideoTransition; cdecl; external libges; deprecated 'GES_DEPRECATED';
function ges_video_transition_set_transition_type(self: PGESVideoTransition; _type: TGESVideoStandardTransitionType): Tgboolean; cdecl; external libges;
function ges_video_transition_get_transition_type(trans: PGESVideoTransition): TGESVideoStandardTransitionType; cdecl; external libges;
procedure ges_video_transition_set_border(self: PGESVideoTransition; Value: Tguint); cdecl; external libges; deprecated 'GES_DEPRECATED_FOR(ges_timeline_element_set_children_properties)';
function ges_video_transition_get_border(self: PGESVideoTransition): Tgint; cdecl; external libges; deprecated 'GES_DEPRECATED_FOR(ges_timeline_element_get_children_properties)';
procedure ges_video_transition_set_inverted(self: PGESVideoTransition; inverted: Tgboolean); cdecl; external libges; deprecated 'GES_DEPRECATED_FOR(ges_timeline_element_set_children_properties)';
function ges_video_transition_is_inverted(self: PGESVideoTransition): Tgboolean; cdecl; external libges; deprecated 'GES_DEPRECATED_FOR(ges_timeline_element_get_children_properties)';

// === Konventiert am: 13-12-24 15:43:17 ===

function GES_TYPE_VIDEO_TRANSITION: TGType;
function GES_VIDEO_TRANSITION(obj: Pointer): PGESVideoTransition;
function GES_IS_VIDEO_TRANSITION(obj: Pointer): Tgboolean;
function GES_VIDEO_TRANSITION_CLASS(klass: Pointer): PGESVideoTransitionClass;
function GES_IS_VIDEO_TRANSITION_CLASS(klass: Pointer): Tgboolean;
function GES_VIDEO_TRANSITION_GET_CLASS(obj: Pointer): PGESVideoTransitionClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_VIDEO_TRANSITION: TGType;
begin
  Result := ges_video_transition_get_type;
end;

function GES_VIDEO_TRANSITION(obj: Pointer): PGESVideoTransition;
begin
  Result := PGESVideoTransition(g_type_check_instance_cast(obj, GES_TYPE_VIDEO_TRANSITION));
end;

function GES_IS_VIDEO_TRANSITION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_VIDEO_TRANSITION);
end;

function GES_VIDEO_TRANSITION_CLASS(klass: Pointer): PGESVideoTransitionClass;
begin
  Result := PGESVideoTransitionClass(g_type_check_class_cast(klass, GES_TYPE_VIDEO_TRANSITION));
end;

function GES_IS_VIDEO_TRANSITION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_VIDEO_TRANSITION);
end;

function GES_VIDEO_TRANSITION_GET_CLASS(obj: Pointer): PGESVideoTransitionClass;
begin
  Result := PGESVideoTransitionClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
