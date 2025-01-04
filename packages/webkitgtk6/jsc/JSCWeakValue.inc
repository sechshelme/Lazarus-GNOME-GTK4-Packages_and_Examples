{$IFDEF read_interface}


  {JSC_DECLARE_FINAL_TYPE (JSCWeakValue, jsc_weak_value, JSC, WEAK_VALUE, GObject) }
type
  TJSCWeakValue = record
  end;
  PJSCWeakValue = ^TJSCWeakValue;

  TJSCWeakValueClass = record
    parent_class: TGObjectClass;
  end;
  PJSCWeakValueClass = ^TJSCWeakValueClass;

function jsc_weak_value_get_type: TGType; cdecl; external libjavascriptcoregtk;
function jsc_weak_value_new(Value: PJSCValue): PJSCWeakValue; cdecl; external libjavascriptcoregtk;
function jsc_weak_value_get_value(weak_value: PJSCWeakValue): PJSCValue; cdecl; external libjavascriptcoregtk;

// === Konventiert am: 4-1-25 19:13:01 ===

function JSC_TYPE_WEAK_VALUE: TGType;
function JSC_WEAK_VALUE(obj: Pointer): PJSCWeakValue;
function JSC_IS_WEAK_VALUE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function JSC_TYPE_WEAK_VALUE: TGType;
begin
  Result := jsc_weak_value_get_type;
end;

function JSC_WEAK_VALUE(obj: Pointer): PJSCWeakValue;
begin
  Result := PJSCWeakValue(g_type_check_instance_cast(obj, JSC_TYPE_WEAK_VALUE));
end;

function JSC_IS_WEAK_VALUE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, JSC_TYPE_WEAK_VALUE);
end;


{$ENDIF read_implementation}
