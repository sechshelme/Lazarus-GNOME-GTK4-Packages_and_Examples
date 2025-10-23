{$IFDEF read_interface}


  {GDK_DECLARE_INTERNAL_TYPE (AdwTimedAnimation, adw_timed_animation, ADW, TIMED_ANIMATION, AdwAnimation) }
type
  TAdwTimedAnimation = record
  end;
  PAdwTimedAnimation = ^TAdwTimedAnimation;

  TAdwTimedAnimationClass = record
  end;
  PAdwTimedAnimationClass = ^TAdwTimedAnimationClass;

function adw_timed_animation_get_type: TGType; cdecl; external libadwaita;
function adw_timed_animation_new(widget: PGtkWidget; from: Tdouble; to_: Tdouble; duration: Tguint; target: PAdwAnimationTarget): PAdwAnimation; cdecl; external libadwaita;
function adw_timed_animation_get_value_from(self: PAdwTimedAnimation): Tdouble; cdecl; external libadwaita;
procedure adw_timed_animation_set_value_from(self: PAdwTimedAnimation; Value: Tdouble); cdecl; external libadwaita;
function adw_timed_animation_get_value_to(self: PAdwTimedAnimation): Tdouble; cdecl; external libadwaita;
procedure adw_timed_animation_set_value_to(self: PAdwTimedAnimation; Value: Tdouble); cdecl; external libadwaita;
function adw_timed_animation_get_duration(self: PAdwTimedAnimation): Tguint; cdecl; external libadwaita;
procedure adw_timed_animation_set_duration(self: PAdwTimedAnimation; duration: Tguint); cdecl; external libadwaita;
function adw_timed_animation_get_easing(self: PAdwTimedAnimation): TAdwEasing; cdecl; external libadwaita;
procedure adw_timed_animation_set_easing(self: PAdwTimedAnimation; easing: TAdwEasing); cdecl; external libadwaita;
function adw_timed_animation_get_repeat_count(self: PAdwTimedAnimation): Tguint; cdecl; external libadwaita;
procedure adw_timed_animation_set_repeat_count(self: PAdwTimedAnimation; repeat_count: Tguint); cdecl; external libadwaita;
function adw_timed_animation_get_reverse(self: PAdwTimedAnimation): Tgboolean; cdecl; external libadwaita;
procedure adw_timed_animation_set_reverse(self: PAdwTimedAnimation; reverse: Tgboolean); cdecl; external libadwaita;
function adw_timed_animation_get_alternate(self: PAdwTimedAnimation): Tgboolean; cdecl; external libadwaita;
procedure adw_timed_animation_set_alternate(self: PAdwTimedAnimation; alternate: Tgboolean); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 13:43:28 ===

function ADW_TYPE_TIMED_ANIMATION: TGType;
function ADW_TIMED_ANIMATION(obj: Pointer): PAdwTimedAnimation;
function ADW_IS_TIMED_ANIMATION(obj: Pointer): Tgboolean;
function ADW_TIMED_ANIMATION_CLASS(klass: Pointer): PAdwTimedAnimationClass;
function ADW_IS_TIMED_ANIMATION_CLASS(klass: Pointer): Tgboolean;
function ADW_TIMED_ANIMATION_GET_CLASS(obj: Pointer): PAdwTimedAnimationClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_TIMED_ANIMATION: TGType;
begin
  Result := adw_timed_animation_get_type;
end;

function ADW_TIMED_ANIMATION(obj: Pointer): PAdwTimedAnimation;
begin
  Result := PAdwTimedAnimation(g_type_check_instance_cast(obj, ADW_TYPE_TIMED_ANIMATION));
end;

function ADW_IS_TIMED_ANIMATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_TIMED_ANIMATION);
end;

function ADW_TIMED_ANIMATION_CLASS(klass: Pointer): PAdwTimedAnimationClass;
begin
  Result := PAdwTimedAnimationClass(g_type_check_class_cast(klass, ADW_TYPE_TIMED_ANIMATION));
end;

function ADW_IS_TIMED_ANIMATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_TIMED_ANIMATION);
end;

function ADW_TIMED_ANIMATION_GET_CLASS(obj: Pointer): PAdwTimedAnimationClass;
begin
  Result := PAdwTimedAnimationClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
