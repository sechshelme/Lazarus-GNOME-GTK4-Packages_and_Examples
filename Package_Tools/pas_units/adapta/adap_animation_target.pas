unit adap_animation_target;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAdapAnimationTargetFunc = procedure(value: double; user_data: Tgpointer); cdecl;

  TAdapAnimationTarget = record
  end;
  PAdapAnimationTarget = ^TAdapAnimationTarget;

  TAdapAnimationTargetClass = record
  end;
  PAdapAnimationTargetClass = ^TAdapAnimationTargetClass;

function adap_animation_target_get_type: TGType; cdecl; external libadapta;
function adap_callback_animation_target_new(callback: TAdapAnimationTargetFunc; user_data: Tgpointer; destroy: TGDestroyNotify): PAdapAnimationTarget; cdecl; external libadapta;

type
  TAdapCallbackAnimationTarget = record
  end;
  PAdapCallbackAnimationTarget = ^TAdapCallbackAnimationTarget;

  TAdapCallbackAnimationTargetClass = record
  end;
  PAdapCallbackAnimationTargetClass = ^TAdapCallbackAnimationTargetClass;

function adap_callback_animation_target_get_type: TGType; cdecl; external libadapta;

type
  TAdapPropertyAnimationTarget = record
  end;
  PAdapPropertyAnimationTarget = ^TAdapPropertyAnimationTarget;

  TAdapPropertyAnimationTargetClass = record
  end;
  PAdapPropertyAnimationTargetClass = ^TAdapPropertyAnimationTargetClass;

function adap_property_animation_target_get_type: TGType; cdecl; external libadapta;
function adap_property_animation_target_new(obj: PGObject; property_name: pchar): PAdapAnimationTarget; cdecl; external libadapta;
function adap_property_animation_target_new_for_pspec(obj: PGObject; pspec: PGParamSpec): PAdapAnimationTarget; cdecl; external libadapta;
function adap_property_animation_target_get_object(self: PAdapPropertyAnimationTarget): PGObject; cdecl; external libadapta;
function adap_property_animation_target_get_pspec(self: PAdapPropertyAnimationTarget): PGParamSpec; cdecl; external libadapta;


// === Konventiert am: 4-12-25 17:00:21 ===

function ADAP_TYPE_ANIMATION_TARGET: TGType;
function ADAP_ANIMATION_TARGET(obj: Pointer): PAdapAnimationTarget;
function ADAP_IS_ANIMATION_TARGET(obj: Pointer): Tgboolean;
function ADAP_ANIMATION_TARGET_CLASS(klass: Pointer): PAdapAnimationTargetClass;
function ADAP_IS_ANIMATION_TARGET_CLASS(klass: Pointer): Tgboolean;
function ADAP_ANIMATION_TARGET_GET_CLASS(obj: Pointer): PAdapAnimationTargetClass;

function ADAP_TYPE_CALLBACK_ANIMATION_TARGET: TGType;
function ADAP_CALLBACK_ANIMATION_TARGET(obj: Pointer): PAdapCallbackAnimationTarget;
function ADAP_IS_CALLBACK_ANIMATION_TARGET(obj: Pointer): Tgboolean;
function ADAP_CALLBACK_ANIMATION_TARGET_CLASS(klass: Pointer): PAdapCallbackAnimationTargetClass;
function ADAP_IS_CALLBACK_ANIMATION_TARGET_CLASS(klass: Pointer): Tgboolean;
function ADAP_CALLBACK_ANIMATION_TARGET_GET_CLASS(obj: Pointer): PAdapCallbackAnimationTargetClass;

function ADAP_TYPE_PROPERTY_ANIMATION_TARGET: TGType;
function ADAP_PROPERTY_ANIMATION_TARGET(obj: Pointer): PAdapPropertyAnimationTarget;
function ADAP_IS_PROPERTY_ANIMATION_TARGET(obj: Pointer): Tgboolean;
function ADAP_PROPERTY_ANIMATION_TARGET_CLASS(klass: Pointer): PAdapPropertyAnimationTargetClass;
function ADAP_IS_PROPERTY_ANIMATION_TARGET_CLASS(klass: Pointer): Tgboolean;
function ADAP_PROPERTY_ANIMATION_TARGET_GET_CLASS(obj: Pointer): PAdapPropertyAnimationTargetClass;


implementation

function ADAP_TYPE_ANIMATION_TARGET: TGType;
begin
  Result := adap_animation_target_get_type;
end;

function ADAP_ANIMATION_TARGET(obj: Pointer): PAdapAnimationTarget;
begin
  Result := PAdapAnimationTarget(g_type_check_instance_cast(obj, ADAP_TYPE_ANIMATION_TARGET));
end;

function ADAP_IS_ANIMATION_TARGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_ANIMATION_TARGET);
end;

function ADAP_ANIMATION_TARGET_CLASS(klass: Pointer): PAdapAnimationTargetClass;
begin
  Result := PAdapAnimationTargetClass(g_type_check_class_cast(klass, ADAP_TYPE_ANIMATION_TARGET));
end;

function ADAP_IS_ANIMATION_TARGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_ANIMATION_TARGET);
end;

function ADAP_ANIMATION_TARGET_GET_CLASS(obj: Pointer): PAdapAnimationTargetClass;
begin
  Result := PAdapAnimationTargetClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function ADAP_TYPE_CALLBACK_ANIMATION_TARGET: TGType;
begin
  Result := adap_callback_animation_target_get_type;
end;

function ADAP_CALLBACK_ANIMATION_TARGET(obj: Pointer): PAdapCallbackAnimationTarget;
begin
  Result := PAdapCallbackAnimationTarget(g_type_check_instance_cast(obj, ADAP_TYPE_CALLBACK_ANIMATION_TARGET));
end;

function ADAP_IS_CALLBACK_ANIMATION_TARGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_CALLBACK_ANIMATION_TARGET);
end;

function ADAP_CALLBACK_ANIMATION_TARGET_CLASS(klass: Pointer): PAdapCallbackAnimationTargetClass;
begin
  Result := PAdapCallbackAnimationTargetClass(g_type_check_class_cast(klass, ADAP_TYPE_CALLBACK_ANIMATION_TARGET));
end;

function ADAP_IS_CALLBACK_ANIMATION_TARGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_CALLBACK_ANIMATION_TARGET);
end;

function ADAP_CALLBACK_ANIMATION_TARGET_GET_CLASS(obj: Pointer): PAdapCallbackAnimationTargetClass;
begin
  Result := PAdapCallbackAnimationTargetClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function ADAP_TYPE_PROPERTY_ANIMATION_TARGET: TGType;
begin
  Result := adap_property_animation_target_get_type;
end;

function ADAP_PROPERTY_ANIMATION_TARGET(obj: Pointer): PAdapPropertyAnimationTarget;
begin
  Result := PAdapPropertyAnimationTarget(g_type_check_instance_cast(obj, ADAP_TYPE_PROPERTY_ANIMATION_TARGET));
end;

function ADAP_IS_PROPERTY_ANIMATION_TARGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_PROPERTY_ANIMATION_TARGET);
end;

function ADAP_PROPERTY_ANIMATION_TARGET_CLASS(klass: Pointer): PAdapPropertyAnimationTargetClass;
begin
  Result := PAdapPropertyAnimationTargetClass(g_type_check_class_cast(klass, ADAP_TYPE_PROPERTY_ANIMATION_TARGET));
end;

function ADAP_IS_PROPERTY_ANIMATION_TARGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_PROPERTY_ANIMATION_TARGET);
end;

function ADAP_PROPERTY_ANIMATION_TARGET_GET_CLASS(obj: Pointer): PAdapPropertyAnimationTargetClass;
begin
  Result := PAdapPropertyAnimationTargetClass(PGTypeInstance(obj)^.g_class);
end;

end.
