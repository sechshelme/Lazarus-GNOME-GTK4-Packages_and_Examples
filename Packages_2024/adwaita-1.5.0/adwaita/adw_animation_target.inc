{$IFDEF read_interface}


  {GDK_DECLARE_INTERNAL_TYPE (AdwAnimationTarget, adw_animation_target, ADW, ANIMATION_TARGET, GObject) }
type
  TAdwAnimationTarget = record
  end;
  PAdwAnimationTarget = ^TAdwAnimationTarget;

  TAdwAnimationTargetClass = record
  end;
  PAdwAnimationTargetClass = ^TAdwAnimationTargetClass;

function adw_animation_target_get_type: TGType; cdecl; external libadwaita;

type
  TAdwAnimationTargetFunc = procedure(Value: double; user_data: Tgpointer); cdecl;

  {GDK_DECLARE_INTERNAL_TYPE (AdwCallbackAnimationTarget, adw_callback_animation_target, ADW, CALLBACK_ANIMATION_TARGET, AdwAnimationTarget) }
type
  TAdwCallbackAnimationTarget = record
  end;
  PAdwCallbackAnimationTarget = ^TAdwCallbackAnimationTarget;

  TAdwCallbackAnimationTargetClass = record
  end;
  PAdwCallbackAnimationTargetClass = ^TAdwCallbackAnimationTargetClass;

function adw_callback_animation_target_get_type: TGType; cdecl; external libadwaita;

function adw_callback_animation_target_new(callback: TAdwAnimationTargetFunc; user_data: Tgpointer; Destroy: TGDestroyNotify): PAdwAnimationTarget; cdecl; external libadwaita;

{GDK_DECLARE_INTERNAL_TYPE (AdwPropertyAnimationTarget, adw_property_animation_target, ADW, PROPERTY_ANIMATION_TARGET, AdwAnimationTarget) }
type
  TAdwPropertyAnimationTarget = record
  end;
  PAdwPropertyAnimationTarget = ^TAdwPropertyAnimationTarget;

  TAdwPropertyAnimationTargetClass = record
  end;
  PAdwPropertyAnimationTargetClass = ^TAdwPropertyAnimationTargetClass;

function adw_property_animation_target_get_type: TGType; cdecl; external libadwaita;
function adw_property_animation_target_new(obj: PGObject; property_name: pchar): PAdwAnimationTarget; cdecl; external libadwaita;
function adw_property_animation_target_new_for_pspec(obj: PGObject; pspec: PGParamSpec): PAdwAnimationTarget; cdecl; external libadwaita;
function adw_property_animation_target_get_object(self: PAdwPropertyAnimationTarget): PGObject; cdecl; external libadwaita;
function adw_property_animation_target_get_pspec(self: PAdwPropertyAnimationTarget): PGParamSpec; cdecl; external libadwaita;

// === Konventiert am: 10-1-25 13:25:50 ===

function ADW_TYPE_ANIMATION_TARGET: TGType;
function ADW_ANIMATION_TARGET(obj: Pointer): PAdwAnimationTarget;
function ADW_IS_ANIMATION_TARGET(obj: Pointer): Tgboolean;
function ADW_ANIMATION_TARGET_CLASS(klass: Pointer): PAdwAnimationTargetClass;
function ADW_IS_ANIMATION_TARGET_CLASS(klass: Pointer): Tgboolean;
function ADW_ANIMATION_TARGET_GET_CLASS(obj: Pointer): PAdwAnimationTargetClass;

function ADW_TYPE_CALLBACK_ANIMATION_TARGET: TGType;
function ADW_CALLBACK_ANIMATION_TARGET(obj: Pointer): PAdwCallbackAnimationTarget;
function ADW_IS_CALLBACK_ANIMATION_TARGET(obj: Pointer): Tgboolean;
function ADW_CALLBACK_ANIMATION_TARGET_CLASS(klass: Pointer): PAdwCallbackAnimationTargetClass;
function ADW_IS_CALLBACK_ANIMATION_TARGET_CLASS(klass: Pointer): Tgboolean;

function ADW_TYPE_PROPERTY_ANIMATION_TARGET: TGType;
function ADW_PROPERTY_ANIMATION_TARGET(obj: Pointer): PAdwPropertyAnimationTarget;
function ADW_IS_PROPERTY_ANIMATION_TARGET(obj: Pointer): Tgboolean;
function ADW_PROPERTY_ANIMATION_TARGET_CLASS(klass: Pointer): PAdwPropertyAnimationTargetClass;
function ADW_IS_PROPERTY_ANIMATION_TARGET_CLASS(klass: Pointer): Tgboolean;
function ADW_PROPERTY_ANIMATION_TARGET_GET_CLASS(obj: Pointer): PAdwPropertyAnimationTargetClass;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_ANIMATION_TARGET: TGType;
begin
  Result := adw_animation_target_get_type;
end;

function ADW_ANIMATION_TARGET(obj: Pointer): PAdwAnimationTarget;
begin
  Result := PAdwAnimationTarget(g_type_check_instance_cast(obj, ADW_TYPE_ANIMATION_TARGET));
end;

function ADW_IS_ANIMATION_TARGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_ANIMATION_TARGET);
end;

function ADW_ANIMATION_TARGET_CLASS(klass: Pointer): PAdwAnimationTargetClass;
begin
  Result := PAdwAnimationTargetClass(g_type_check_class_cast(klass, ADW_TYPE_ANIMATION_TARGET));
end;

function ADW_IS_ANIMATION_TARGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_ANIMATION_TARGET);
end;

function ADW_ANIMATION_TARGET_GET_CLASS(obj: Pointer): PAdwAnimationTargetClass;
begin
  Result := PAdwAnimationTargetClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function ADW_TYPE_CALLBACK_ANIMATION_TARGET: TGType;
begin
  Result := adw_callback_animation_target_get_type;
end;

function ADW_CALLBACK_ANIMATION_TARGET(obj: Pointer): PAdwCallbackAnimationTarget;
begin
  Result := PAdwCallbackAnimationTarget(g_type_check_instance_cast(obj, ADW_TYPE_CALLBACK_ANIMATION_TARGET));
end;

function ADW_IS_CALLBACK_ANIMATION_TARGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_CALLBACK_ANIMATION_TARGET);
end;

function ADW_CALLBACK_ANIMATION_TARGET_CLASS(klass: Pointer): PAdwCallbackAnimationTargetClass;
begin
  Result := PAdwCallbackAnimationTargetClass(g_type_check_class_cast(klass, ADW_TYPE_CALLBACK_ANIMATION_TARGET));
end;

function ADW_IS_CALLBACK_ANIMATION_TARGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_CALLBACK_ANIMATION_TARGET);
end;

// ====

function ADW_TYPE_PROPERTY_ANIMATION_TARGET: TGType;
begin
  Result := adw_property_animation_target_get_type;
end;

function ADW_PROPERTY_ANIMATION_TARGET(obj: Pointer): PAdwPropertyAnimationTarget;
begin
  Result := PAdwPropertyAnimationTarget(g_type_check_instance_cast(obj, ADW_TYPE_PROPERTY_ANIMATION_TARGET));
end;

function ADW_IS_PROPERTY_ANIMATION_TARGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_PROPERTY_ANIMATION_TARGET);
end;

function ADW_PROPERTY_ANIMATION_TARGET_CLASS(klass: Pointer): PAdwPropertyAnimationTargetClass;
begin
  Result := PAdwPropertyAnimationTargetClass(g_type_check_class_cast(klass, ADW_TYPE_PROPERTY_ANIMATION_TARGET));
end;

function ADW_IS_PROPERTY_ANIMATION_TARGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_PROPERTY_ANIMATION_TARGET);
end;

function ADW_PROPERTY_ANIMATION_TARGET_GET_CLASS(obj: Pointer): PAdwPropertyAnimationTargetClass;
begin
  Result := PAdwPropertyAnimationTargetClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
