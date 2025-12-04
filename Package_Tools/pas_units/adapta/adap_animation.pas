unit adap_animation;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_animation_target;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAdapAnimationState = ^TAdapAnimationState;
  TAdapAnimationState = longint;

const
  ADAP_ANIMATION_IDLE = 0;
  ADAP_ANIMATION_PAUSED = 1;
  ADAP_ANIMATION_PLAYING = 2;
  ADAP_ANIMATION_FINISHED = 3;

type
  TAdapAnimation = record
    parent_instance: TGObject;
  end;
  PAdapAnimation = ^TAdapAnimation;

  TAdapAnimationClass = record
  end;
  PAdapAnimationClass = ^TAdapAnimationClass;

function adap_animation_get_type: TGType; cdecl; external libadapta;
function adap_animation_get_widget(self: PAdapAnimation): PGtkWidget; cdecl; external libadapta;
function adap_animation_get_target(self: PAdapAnimation): PAdapAnimationTarget; cdecl; external libadapta;
procedure adap_animation_set_target(self: PAdapAnimation; target: PAdapAnimationTarget); cdecl; external libadapta;
function adap_animation_get_value(self: PAdapAnimation): double; cdecl; external libadapta;
function adap_animation_get_state(self: PAdapAnimation): TAdapAnimationState; cdecl; external libadapta;
procedure adap_animation_play(self: PAdapAnimation); cdecl; external libadapta;
procedure adap_animation_pause(self: PAdapAnimation); cdecl; external libadapta;
procedure adap_animation_resume(self: PAdapAnimation); cdecl; external libadapta;
procedure adap_animation_reset(self: PAdapAnimation); cdecl; external libadapta;
procedure adap_animation_skip(self: PAdapAnimation); cdecl; external libadapta;
function adap_animation_get_follow_enable_animations_setting(self: PAdapAnimation): Tgboolean; cdecl; external libadapta;
procedure adap_animation_set_follow_enable_animations_setting(self: PAdapAnimation; setting: Tgboolean); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:00:13 ===

function ADAP_TYPE_ANIMATION: TGType;
function ADAP_ANIMATION(obj: Pointer): PAdapAnimation;
function ADAP_IS_ANIMATION(obj: Pointer): Tgboolean;
function ADAP_ANIMATION_CLASS(klass: Pointer): PAdapAnimationClass;
function ADAP_IS_ANIMATION_CLASS(klass: Pointer): Tgboolean;
function ADAP_ANIMATION_GET_CLASS(obj: Pointer): PAdapAnimationClass;

implementation

function ADAP_TYPE_ANIMATION: TGType;
begin
  Result := adap_animation_get_type;
end;

function ADAP_ANIMATION(obj: Pointer): PAdapAnimation;
begin
  Result := PAdapAnimation(g_type_check_instance_cast(obj, ADAP_TYPE_ANIMATION));
end;

function ADAP_IS_ANIMATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_ANIMATION);
end;

function ADAP_ANIMATION_CLASS(klass: Pointer): PAdapAnimationClass;
begin
  Result := PAdapAnimationClass(g_type_check_class_cast(klass, ADAP_TYPE_ANIMATION));
end;

function ADAP_IS_ANIMATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_ANIMATION);
end;

function ADAP_ANIMATION_GET_CLASS(obj: Pointer): PAdapAnimationClass;
begin
  Result := PAdapAnimationClass(PGTypeInstance(obj)^.g_class);
end;

end.
