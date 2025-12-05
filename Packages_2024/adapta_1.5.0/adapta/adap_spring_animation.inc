{$IFDEF read_interface}


type
  TAdapSpringAnimation = record
  end;
  PAdapSpringAnimation = ^TAdapSpringAnimation;

  TAdapSpringAnimationClass = record
  end;
  PAdapSpringAnimationClass = ^TAdapSpringAnimationClass;

function adap_spring_animation_get_type: TGType; cdecl; external libadapta;
function adap_spring_animation_new(widget: PGtkWidget; from: double; to_: double; spring_params: PAdapSpringParams; target: PAdapAnimationTarget): PAdapAnimation; cdecl; external libadapta;
function adap_spring_animation_get_value_from(self: PAdapSpringAnimation): double; cdecl; external libadapta;
procedure adap_spring_animation_set_value_from(self: PAdapSpringAnimation; value: double); cdecl; external libadapta;
function adap_spring_animation_get_value_to(self: PAdapSpringAnimation): double; cdecl; external libadapta;
procedure adap_spring_animation_set_value_to(self: PAdapSpringAnimation; value: double); cdecl; external libadapta;
function adap_spring_animation_get_spring_params(self: PAdapSpringAnimation): PAdapSpringParams; cdecl; external libadapta;
procedure adap_spring_animation_set_spring_params(self: PAdapSpringAnimation; spring_params: PAdapSpringParams); cdecl; external libadapta;
function adap_spring_animation_get_initial_velocity(self: PAdapSpringAnimation): double; cdecl; external libadapta;
procedure adap_spring_animation_set_initial_velocity(self: PAdapSpringAnimation; velocity: double); cdecl; external libadapta;
function adap_spring_animation_get_epsilon(self: PAdapSpringAnimation): double; cdecl; external libadapta;
procedure adap_spring_animation_set_epsilon(self: PAdapSpringAnimation; epsilon: double); cdecl; external libadapta;
function adap_spring_animation_get_clamp(self: PAdapSpringAnimation): Tgboolean; cdecl; external libadapta;
procedure adap_spring_animation_set_clamp(self: PAdapSpringAnimation; clamp: Tgboolean); cdecl; external libadapta;
function adap_spring_animation_get_estimated_duration(self: PAdapSpringAnimation): Tguint; cdecl; external libadapta;
function adap_spring_animation_get_velocity(self: PAdapSpringAnimation): double; cdecl; external libadapta;
function adap_spring_animation_calculate_value(self: PAdapSpringAnimation; time: Tguint): double; cdecl; external libadapta;
function adap_spring_animation_calculate_velocity(self: PAdapSpringAnimation; time: Tguint): double; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:18:42 ===

function ADAP_TYPE_SPRING_ANIMATION: TGType;
function ADAP_SPRING_ANIMATION(obj: Pointer): PAdapSpringAnimation;
function ADAP_IS_SPRING_ANIMATION(obj: Pointer): Tgboolean;
function ADAP_SPRING_ANIMATION_CLASS(klass: Pointer): PAdapSpringAnimationClass;
function ADAP_IS_SPRING_ANIMATION_CLASS(klass: Pointer): Tgboolean;
function ADAP_SPRING_ANIMATION_GET_CLASS(obj: Pointer): PAdapSpringAnimationClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_SPRING_ANIMATION: TGType;
begin
  Result := adap_spring_animation_get_type;
end;

function ADAP_SPRING_ANIMATION(obj: Pointer): PAdapSpringAnimation;
begin
  Result := PAdapSpringAnimation(g_type_check_instance_cast(obj, ADAP_TYPE_SPRING_ANIMATION));
end;

function ADAP_IS_SPRING_ANIMATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_SPRING_ANIMATION);
end;

function ADAP_SPRING_ANIMATION_CLASS(klass: Pointer): PAdapSpringAnimationClass;
begin
  Result := PAdapSpringAnimationClass(g_type_check_class_cast(klass, ADAP_TYPE_SPRING_ANIMATION));
end;

function ADAP_IS_SPRING_ANIMATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_SPRING_ANIMATION);
end;

function ADAP_SPRING_ANIMATION_GET_CLASS(obj: Pointer): PAdapSpringAnimationClass;
begin
  Result := PAdapSpringAnimationClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
