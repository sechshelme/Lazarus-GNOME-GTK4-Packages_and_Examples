{$IFDEF read_interface}


type
  TAdapTimedAnimation = record
  end;
  PAdapTimedAnimation = ^TAdapTimedAnimation;

  TAdapTimedAnimationClass = record
  end;
  PAdapTimedAnimationClass = ^TAdapTimedAnimationClass;

function adap_timed_animation_get_type: TGType; cdecl; external libadapta;
function adap_timed_animation_new(widget:PGtkWidget; from:double; to_:double; duration:Tguint; target:PAdapAnimationTarget):PAdapAnimation;cdecl;external libadapta;
function adap_timed_animation_get_value_from(self:PAdapTimedAnimation):double;cdecl;external libadapta;
procedure adap_timed_animation_set_value_from(self:PAdapTimedAnimation; value:double);cdecl;external libadapta;
function adap_timed_animation_get_value_to(self:PAdapTimedAnimation):double;cdecl;external libadapta;
procedure adap_timed_animation_set_value_to(self:PAdapTimedAnimation; value:double);cdecl;external libadapta;
function adap_timed_animation_get_duration(self:PAdapTimedAnimation):Tguint;cdecl;external libadapta;
procedure adap_timed_animation_set_duration(self:PAdapTimedAnimation; duration:Tguint);cdecl;external libadapta;
function adap_timed_animation_get_easing(self:PAdapTimedAnimation):TAdapEasing;cdecl;external libadapta;
procedure adap_timed_animation_set_easing(self:PAdapTimedAnimation; easing:TAdapEasing);cdecl;external libadapta;
function adap_timed_animation_get_repeat_count(self:PAdapTimedAnimation):Tguint;cdecl;external libadapta;
procedure adap_timed_animation_set_repeat_count(self:PAdapTimedAnimation; repeat_count:Tguint);cdecl;external libadapta;
function adap_timed_animation_get_reverse(self:PAdapTimedAnimation):Tgboolean;cdecl;external libadapta;
procedure adap_timed_animation_set_reverse(self:PAdapTimedAnimation; reverse:Tgboolean);cdecl;external libadapta;
function adap_timed_animation_get_alternate(self:PAdapTimedAnimation):Tgboolean;cdecl;external libadapta;
procedure adap_timed_animation_set_alternate(self:PAdapTimedAnimation; alternate:Tgboolean);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:27:47 ===

function ADAP_TYPE_TIMED_ANIMATION: TGType;
function ADAP_TIMED_ANIMATION(obj: Pointer): PAdapTimedAnimation;
function ADAP_IS_TIMED_ANIMATION(obj: Pointer): Tgboolean;
function ADAP_TIMED_ANIMATION_CLASS(klass: Pointer): PAdapTimedAnimationClass;
function ADAP_IS_TIMED_ANIMATION_CLASS(klass: Pointer): Tgboolean;
function ADAP_TIMED_ANIMATION_GET_CLASS(obj: Pointer): PAdapTimedAnimationClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_TIMED_ANIMATION: TGType;
begin
  Result := adap_timed_animation_get_type;
end;

function ADAP_TIMED_ANIMATION(obj: Pointer): PAdapTimedAnimation;
begin
  Result := PAdapTimedAnimation(g_type_check_instance_cast(obj, ADAP_TYPE_TIMED_ANIMATION));
end;

function ADAP_IS_TIMED_ANIMATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_TIMED_ANIMATION);
end;

function ADAP_TIMED_ANIMATION_CLASS(klass: Pointer): PAdapTimedAnimationClass;
begin
  Result := PAdapTimedAnimationClass(g_type_check_class_cast(klass, ADAP_TYPE_TIMED_ANIMATION));
end;

function ADAP_IS_TIMED_ANIMATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_TIMED_ANIMATION);
end;

function ADAP_TIMED_ANIMATION_GET_CLASS(obj: Pointer): PAdapTimedAnimationClass;
begin
  Result := PAdapTimedAnimationClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
