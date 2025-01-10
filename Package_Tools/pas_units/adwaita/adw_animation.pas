unit adw_animation;

interface

uses
  fp_glib2, fp_GTK4, adw_animation_target;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{G_DECLARE_DERIVABLE_TYPE (AdwAnimation, adw_animation, ADW, ANIMATION, GObject) }
type
  PAdwAnimationState = ^TAdwAnimationState;
  TAdwAnimationState = longint;

const
  ADW_ANIMATION_IDLE = 0;
  ADW_ANIMATION_PAUSED = 1;
  ADW_ANIMATION_PLAYING = 2;
  ADW_ANIMATION_FINISHED = 3;

type
  TAdwAnimation = record
    parent_instance: TGObject;
  end;
  PAdwAnimation = ^TAdwAnimation;

  TAdwAnimationClass = record
  end;
  PAdwAnimationClass = ^TAdwAnimationClass;

function adw_animation_get_type: TGType; cdecl; external libadwaita;
function adw_animation_get_widget(self: PAdwAnimation): PGtkWidget; cdecl; external libadwaita;
function adw_animation_get_target(self: PAdwAnimation): PAdwAnimationTarget; cdecl; external libadwaita;
procedure adw_animation_set_target(self: PAdwAnimation; target: PAdwAnimationTarget); cdecl; external libadwaita;
function adw_animation_get_value(self: PAdwAnimation): Tdouble; cdecl; external libadwaita;
function adw_animation_get_state(self: PAdwAnimation): TAdwAnimationState; cdecl; external libadwaita;
procedure adw_animation_play(self: PAdwAnimation); cdecl; external libadwaita;
procedure adw_animation_pause(self: PAdwAnimation); cdecl; external libadwaita;
procedure adw_animation_resume(self: PAdwAnimation); cdecl; external libadwaita;
procedure adw_animation_reset(self: PAdwAnimation); cdecl; external libadwaita;
procedure adw_animation_skip(self: PAdwAnimation); cdecl; external libadwaita;
function adw_animation_get_follow_enable_animations_setting(self: PAdwAnimation): Tgboolean; cdecl; external libadwaita;
procedure adw_animation_set_follow_enable_animations_setting(self: PAdwAnimation; setting: Tgboolean); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 13:32:05 ===

function ADW_TYPE_ANIMATION: TGType;
function ADW_ANIMATION(obj: Pointer): PAdwAnimation;
function ADW_IS_ANIMATION(obj: Pointer): Tgboolean;
function ADW_ANIMATION_CLASS(klass: Pointer): PAdwAnimationClass;
function ADW_IS_ANIMATION_CLASS(klass: Pointer): Tgboolean;
function ADW_ANIMATION_GET_CLASS(obj: Pointer): PAdwAnimationClass;

implementation

function ADW_TYPE_ANIMATION: TGType;
begin
  Result := adw_animation_get_type;
end;

function ADW_ANIMATION(obj: Pointer): PAdwAnimation;
begin
  Result := PAdwAnimation(g_type_check_instance_cast(obj, ADW_TYPE_ANIMATION));
end;

function ADW_IS_ANIMATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_ANIMATION);
end;

function ADW_ANIMATION_CLASS(klass: Pointer): PAdwAnimationClass;
begin
  Result := PAdwAnimationClass(g_type_check_class_cast(klass, ADW_TYPE_ANIMATION));
end;

function ADW_IS_ANIMATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_ANIMATION);
end;

function ADW_ANIMATION_GET_CLASS(obj: Pointer): PAdwAnimationClass;
begin
  Result := PAdwAnimationClass(PGTypeInstance(obj)^.g_class);
end;


end.
