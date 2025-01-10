unit adw_spring_animation;

interface

uses
  fp_glib2, fp_GTK4, adw_spring_params, adw_animation_target, adw_animation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {GDK_DECLARE_INTERNAL_TYPE (AdwSpringAnimation, adw_spring_animation, ADW, SPRING_ANIMATION, AdwAnimation) }
type
  TAdwSpringAnimation = record
  end;
  PAdwSpringAnimation = ^TAdwSpringAnimation;

  TAdwSpringAnimationClass = record
  end;
  PAdwSpringAnimationClass = ^TAdwSpringAnimationClass;

function adw_spring_animation_get_type: TGType; cdecl; external libadwaita;
function adw_spring_animation_new(widget: PGtkWidget; from: Tdouble; to_: Tdouble; spring_params: PAdwSpringParams; target: PAdwAnimationTarget): PAdwAnimation; cdecl; external libadwaita;
function adw_spring_animation_get_value_from(self: PAdwSpringAnimation): Tdouble; cdecl; external libadwaita;
procedure adw_spring_animation_set_value_from(self: PAdwSpringAnimation; Value: Tdouble); cdecl; external libadwaita;
function adw_spring_animation_get_value_to(self: PAdwSpringAnimation): Tdouble; cdecl; external libadwaita;
procedure adw_spring_animation_set_value_to(self: PAdwSpringAnimation; Value: Tdouble); cdecl; external libadwaita;
function adw_spring_animation_get_spring_params(self: PAdwSpringAnimation): PAdwSpringParams; cdecl; external libadwaita;
procedure adw_spring_animation_set_spring_params(self: PAdwSpringAnimation; spring_params: PAdwSpringParams); cdecl; external libadwaita;
function adw_spring_animation_get_initial_velocity(self: PAdwSpringAnimation): Tdouble; cdecl; external libadwaita;
procedure adw_spring_animation_set_initial_velocity(self: PAdwSpringAnimation; velocity: Tdouble); cdecl; external libadwaita;
function adw_spring_animation_get_epsilon(self: PAdwSpringAnimation): Tdouble; cdecl; external libadwaita;
procedure adw_spring_animation_set_epsilon(self: PAdwSpringAnimation; epsilon: Tdouble); cdecl; external libadwaita;
function adw_spring_animation_get_clamp(self: PAdwSpringAnimation): Tgboolean; cdecl; external libadwaita;
procedure adw_spring_animation_set_clamp(self: PAdwSpringAnimation; clamp: Tgboolean); cdecl; external libadwaita;
function adw_spring_animation_get_estimated_duration(self: PAdwSpringAnimation): Tguint; cdecl; external libadwaita;
function adw_spring_animation_get_velocity(self: PAdwSpringAnimation): Tdouble; cdecl; external libadwaita;
function adw_spring_animation_calculate_value(self: PAdwSpringAnimation; time: Tguint): Tdouble; cdecl; external libadwaita;
function adw_spring_animation_calculate_velocity(self: PAdwSpringAnimation; time: Tguint): Tdouble; cdecl; external libadwaita;

// === Konventiert am: 10-1-25 13:04:14 ===

function ADW_TYPE_SPRING_ANIMATION: TGType;
function ADW_SPRING_ANIMATION(obj: Pointer): PAdwSpringAnimation;
function ADW_IS_SPRING_ANIMATION(obj: Pointer): Tgboolean;
function ADW_SPRING_ANIMATION_CLASS(klass: Pointer): PAdwSpringAnimationClass;
function ADW_IS_SPRING_ANIMATION_CLASS(klass: Pointer): Tgboolean;
function ADW_SPRING_ANIMATION_GET_CLASS(obj: Pointer): PAdwSpringAnimationClass;

implementation

function ADW_TYPE_SPRING_ANIMATION: TGType;
begin
  Result := adw_spring_animation_get_type;
end;

function ADW_SPRING_ANIMATION(obj: Pointer): PAdwSpringAnimation;
begin
  Result := PAdwSpringAnimation(g_type_check_instance_cast(obj, ADW_TYPE_SPRING_ANIMATION));
end;

function ADW_IS_SPRING_ANIMATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_SPRING_ANIMATION);
end;

function ADW_SPRING_ANIMATION_CLASS(klass: Pointer): PAdwSpringAnimationClass;
begin
  Result := PAdwSpringAnimationClass(g_type_check_class_cast(klass, ADW_TYPE_SPRING_ANIMATION));
end;

function ADW_IS_SPRING_ANIMATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_SPRING_ANIMATION);
end;

function ADW_SPRING_ANIMATION_GET_CLASS(obj: Pointer): PAdwSpringAnimationClass;
begin
  Result := PAdwSpringAnimationClass(PGTypeInstance(obj)^.g_class);
end;


end.
