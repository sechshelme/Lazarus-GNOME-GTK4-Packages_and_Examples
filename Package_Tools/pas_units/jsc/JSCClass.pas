unit JSCClass;

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {JSC_DECLARE_FINAL_TYPE (JSCClass, jsc_class, JSC, CLASS, GObject) }
type
  TJSCClass = record
  end;
  PJSCClass = ^TJSCClass;

  TJSCClassClass = record
    parent_class: TGObjectClass;
  end;
  PJSCClassClass = ^TJSCClassClass;

  PJSCClassGetPropertyFunction = ^TJSCClassGetPropertyFunction;
  TJSCClassGetPropertyFunction = function(jsc_class: PJSCClass; context: PJSCContext; instance: Tgpointer; Name: pchar): PJSCValue; cdecl;

  TJSCClassSetPropertyFunction = function(jsc_class: PJSCClass; context: PJSCContext; instance: Tgpointer; Name: pchar; Value: PJSCValue): Tgboolean; cdecl;
  TJSCClassHasPropertyFunction = function(jsc_class: PJSCClass; context: PJSCContext; instance: Tgpointer; Name: pchar): Tgboolean; cdecl;
  TJSCClassDeletePropertyFunction = function(jsc_class: PJSCClass; context: PJSCContext; instance: Tgpointer; Name: pchar): Tgboolean; cdecl;

  PJSCClassEnumeratePropertiesFunction = ^TJSCClassEnumeratePropertiesFunction;
  TJSCClassEnumeratePropertiesFunction = function(jsc_class: PJSCClass; context: PJSCContext; instance: Tgpointer): PPgchar; cdecl;

  PJSCClassVTable = ^TJSCClassVTable;

  TJSCClassVTable = record
    get_property: TJSCClassGetPropertyFunction;
    set_property: TJSCClassSetPropertyFunction;
    has_property: TJSCClassHasPropertyFunction;
    delete_property: TJSCClassDeletePropertyFunction;
    enumerate_properties: TJSCClassEnumeratePropertiesFunction;
    _jsc_reserved0: procedure; cdecl;
    _jsc_reserved1: procedure; cdecl;
    _jsc_reserved2: procedure; cdecl;
    _jsc_reserved3: procedure; cdecl;
    _jsc_reserved4: procedure; cdecl;
    _jsc_reserved5: procedure; cdecl;
    _jsc_reserved6: procedure; cdecl;
    _jsc_reserved7: procedure; cdecl;
  end;

function jsc_class_get_type: TGType; cdecl; external libjavascriptcoregtk;
function jsc_class_get_name(jsc_class: PJSCClass): pchar; cdecl; external libjavascriptcoregtk;
function jsc_class_get_parent(jsc_class: PJSCClass): PJSCClass; cdecl; external libjavascriptcoregtk;
function jsc_class_add_constructor(jsc_class: PJSCClass; Name: pchar; callback: TGCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify;
  return_type: TGType; n_params: Tguint; args: array of const): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_class_add_constructor(jsc_class: PJSCClass; Name: pchar; callback: TGCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify;
  return_type: TGType; n_params: Tguint): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_class_add_constructorv(jsc_class: PJSCClass; Name: pchar; callback: TGCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify;
  return_type: TGType; n_parameters: Tguint; parameter_types: PGType): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_class_add_constructor_variadic(jsc_class: PJSCClass; Name: pchar; callback: TGCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify;
  return_type: TGType): PJSCValue; cdecl; external libjavascriptcoregtk;
procedure jsc_class_add_method(jsc_class: PJSCClass; Name: pchar; callback: TGCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify;
  return_type: TGType; n_params: Tguint; args: array of const); cdecl; external libjavascriptcoregtk;
procedure jsc_class_add_method(jsc_class: PJSCClass; Name: pchar; callback: TGCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify;
  return_type: TGType; n_params: Tguint); cdecl; external libjavascriptcoregtk;
procedure jsc_class_add_methodv(jsc_class: PJSCClass; Name: pchar; callback: TGCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify;
  return_type: TGType; n_parameters: Tguint; parameter_types: PGType); cdecl; external libjavascriptcoregtk;
procedure jsc_class_add_method_variadic(jsc_class: PJSCClass; Name: pchar; callback: TGCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify;
  return_type: TGType); cdecl; external libjavascriptcoregtk;
procedure jsc_class_add_property(jsc_class: PJSCClass; Name: pchar; property_type: TGType; getter: TGCallback; setter: TGCallback;
  user_data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libjavascriptcoregtk;

// === Konventiert am: 4-1-25 17:33:18 ===

function JSC_TYPE_CLASS: TGType;
function JSC_CLASS(obj: Pointer): PJSCClass;
function JSC_IS_CLASS(obj: Pointer): Tgboolean;

implementation

function JSC_TYPE_CLASS: TGType;
begin
  Result := jsc_class_get_type;
end;

function JSC_CLASS(obj: Pointer): PJSCClass;
begin
  Result := PJSCClass(g_type_check_instance_cast(obj, JSC_TYPE_CLASS));
end;

function JSC_IS_CLASS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, JSC_TYPE_CLASS);
end;


end.
