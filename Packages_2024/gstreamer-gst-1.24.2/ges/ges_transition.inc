{$IFDEF read_interface}

  {GES_DECLARE_TYPE (Transition, transition, TRANSITION); }
type
  TGESTransitionPrivate = record
  end;
  PGESTransitionPrivate = ^TGESTransitionPrivate;

  TGESTransition = record
    parent: TGESOperation;
    priv: PGESTransitionPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESTransition = ^TGESTransition;

  TGESTransitionClass = record
    parent_class: TGESOperationClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESTransitionClass = ^TGESTransitionClass;

function ges_transition_get_type: TGType; cdecl; external libges;

// === Konventiert am: 13-12-24 15:53:25 ===

function GES_TYPE_TRANSITION: TGType;
function GES_TRANSITION(obj: Pointer): PGESTransition;
function GES_IS_TRANSITION(obj: Pointer): Tgboolean;
function GES_TRANSITION_CLASS(klass: Pointer): PGESTransitionClass;
function GES_IS_TRANSITION_CLASS(klass: Pointer): Tgboolean;
function GES_TRANSITION_GET_CLASS(obj: Pointer): PGESTransitionClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_TRANSITION: TGType;
begin
  Result := ges_transition_get_type;
end;

function GES_TRANSITION(obj: Pointer): PGESTransition;
begin
  Result := PGESTransition(g_type_check_instance_cast(obj, GES_TYPE_TRANSITION));
end;

function GES_IS_TRANSITION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TRANSITION);
end;

function GES_TRANSITION_CLASS(klass: Pointer): PGESTransitionClass;
begin
  Result := PGESTransitionClass(g_type_check_class_cast(klass, GES_TYPE_TRANSITION));
end;

function GES_IS_TRANSITION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TRANSITION);
end;

function GES_TRANSITION_GET_CLASS(obj: Pointer): PGESTransitionClass;
begin
  Result := PGESTransitionClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
