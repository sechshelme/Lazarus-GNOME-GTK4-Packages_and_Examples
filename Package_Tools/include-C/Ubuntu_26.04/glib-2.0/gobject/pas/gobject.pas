unit gobject;

interface

uses
  fp_glib2, gtype, gparam, gclosure, gsignal;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGInitiallyUnowned = type Pointer;
  PGInitiallyUnownedClass = type Pointer;

  PPGObject = ^PGObject;
  PGObject = ^TGObject;
  PGObjectConstructParam = ^TGObjectConstructParam;

  TGObjectGetPropertyFunc = procedure(obj: PGObject; property_id: Tguint; value: PGValue; pspec: PGParamSpec); cdecl;
  TGObjectSetPropertyFunc = procedure(obj: PGObject; property_id: Tguint; value: PGValue; pspec: PGParamSpec); cdecl;
  TGObjectFinalizeFunc = procedure(obj: PGObject); cdecl;
  TGWeakNotify = procedure(data: Tgpointer; where_the_object_was: PGObject); cdecl;

  TGObject = record
    g_type_instance: TGTypeInstance;
    ref_count: Tguint;
    qdata: PGData;
  end;

  PGObjectClass = ^TGObjectClass;
  TGObjectClass = record
    g_type_class: TGTypeClass;
    construct_properties: PGSList;
    constructor_: function(_type: TGType; n_construct_properties: Tguint; construct_properties: PGObjectConstructParam): PGObject; cdecl;
    set_property: procedure(obj: PGObject; property_id: Tguint; value: PGValue; pspec: PGParamSpec); cdecl;
    get_property: procedure(obj: PGObject; property_id: Tguint; value: PGValue; pspec: PGParamSpec); cdecl;
    _dispose: procedure(obj: PGObject); cdecl;
    finalize: procedure(obj: PGObject); cdecl;
    dispatch_properties_changed: procedure(obj: PGObject; n_pspecs: Tguint; pspecs: PPGParamSpec); cdecl;
    notify: procedure(obj: PGObject; pspec: PGParamSpec); cdecl;
    constructed: procedure(obj: PGObject); cdecl;
    flags: Tgsize;
    n_construct_properties: Tgsize;
    pspecs: Tgpointer;
    n_pspecs: Tgsize;
    pdummy: array[0..2] of Tgpointer;
  end;

  TGObjectConstructParam = record
    pspec: PGParamSpec;
    value: PGValue;
  end;

function g_initially_unowned_get_type: TGType; cdecl; external libgobject2_0;
procedure g_object_class_install_property(oclass: PGObjectClass; property_id: Tguint; pspec: PGParamSpec); cdecl; external libgobject2_0;
function g_object_class_find_property(oclass: PGObjectClass; property_name: Pgchar): PGParamSpec; cdecl; external libgobject2_0;
function g_object_class_list_properties(oclass: PGObjectClass; n_properties: Pguint): PPGParamSpec; cdecl; external libgobject2_0;
procedure g_object_class_override_property(oclass: PGObjectClass; property_id: Tguint; name: Pgchar); cdecl; external libgobject2_0;
procedure g_object_class_install_properties(oclass: PGObjectClass; n_pspecs: Tguint; pspecs: PPGParamSpec); cdecl; external libgobject2_0;
procedure g_object_interface_install_property(g_iface: Tgpointer; pspec: PGParamSpec); cdecl; external libgobject2_0;
function g_object_interface_find_property(g_iface: Tgpointer; property_name: Pgchar): PGParamSpec; cdecl; external libgobject2_0;
function g_object_interface_list_properties(g_iface: Tgpointer; n_properties_p: Pguint): PPGParamSpec; cdecl; external libgobject2_0;
function g_object_get_type: TGType; cdecl; external libgobject2_0;
function g_object_new(obj_type: TGType; first_property_name: Pgchar; args: array of const): Tgpointer; cdecl; external libgobject2_0;
function g_object_new(obj_type: TGType; first_property_name: Pgchar): Tgpointer; cdecl; external libgobject2_0;
function g_object_new_with_properties(obj_type: TGType; n_properties: Tguint; names: PPchar; values: PGValue): PGObject; cdecl; external libgobject2_0;
function g_object_newv(obj_type: TGType; n_parameters: Tguint; parameters: PGParameter): Tgpointer; cdecl; external libgobject2_0; deprecated;
function g_object_new_valist(obj_type: TGType; first_property_name: Pgchar; var_args: Tva_list): PGObject; cdecl; external libgobject2_0;
procedure g_object_set(obj: Tgpointer; first_property_name: Pgchar; args: array of const); cdecl; external libgobject2_0;
procedure g_object_set(obj: Tgpointer; first_property_name: Pgchar); cdecl; external libgobject2_0;
procedure g_object_get(obj: Tgpointer; first_property_name: Pgchar; args: array of const); cdecl; external libgobject2_0;
procedure g_object_get(obj: Tgpointer; first_property_name: Pgchar); cdecl; external libgobject2_0;
function g_object_connect(obj: Tgpointer; signal_spec: Pgchar; args: array of const): Tgpointer; cdecl; external libgobject2_0;
function g_object_connect(obj: Tgpointer; signal_spec: Pgchar): Tgpointer; cdecl; external libgobject2_0;
procedure g_object_disconnect(obj: Tgpointer; signal_spec: Pgchar; args: array of const); cdecl; external libgobject2_0;
procedure g_object_disconnect(obj: Tgpointer; signal_spec: Pgchar); cdecl; external libgobject2_0;
procedure g_object_setv(obj: PGObject; n_properties: Tguint; names: PPgchar; values: PGValue); cdecl; external libgobject2_0;
procedure g_object_set_valist(obj: PGObject; first_property_name: Pgchar; var_args: Tva_list); cdecl; external libgobject2_0;
procedure g_object_getv(obj: PGObject; n_properties: Tguint; names: PPgchar; values: PGValue); cdecl; external libgobject2_0;
procedure g_object_get_valist(obj: PGObject; first_property_name: Pgchar; var_args: Tva_list); cdecl; external libgobject2_0;
procedure g_object_set_property(obj: PGObject; property_name: Pgchar; value: PGValue); cdecl; external libgobject2_0;
procedure g_object_get_property(obj: PGObject; property_name: Pgchar; value: PGValue); cdecl; external libgobject2_0;
procedure g_object_freeze_notify(obj: PGObject); cdecl; external libgobject2_0;
procedure g_object_notify(obj: PGObject; property_name: Pgchar); cdecl; external libgobject2_0;
procedure g_object_notify_by_pspec(obj: PGObject; pspec: PGParamSpec); cdecl; external libgobject2_0;
procedure g_object_thaw_notify(obj: PGObject); cdecl; external libgobject2_0;
function g_object_is_floating(obj: Tgpointer): Tgboolean; cdecl; external libgobject2_0;
function g_object_ref_sink(obj: Tgpointer): Tgpointer; cdecl; external libgobject2_0;
function g_object_take_ref(obj: Tgpointer): Tgpointer; cdecl; external libgobject2_0;
function g_object_ref(obj: Tgpointer): Tgpointer; cdecl; external libgobject2_0;
procedure g_object_unref(obj: Tgpointer); cdecl; external libgobject2_0;
procedure g_object_weak_ref(obj: PGObject; notify: TGWeakNotify; data: Tgpointer); cdecl; external libgobject2_0;
procedure g_object_weak_unref(obj: PGObject; notify: TGWeakNotify; data: Tgpointer); cdecl; external libgobject2_0;
procedure g_object_add_weak_pointer(obj: PGObject; weak_pointer_location: Pgpointer); cdecl; external libgobject2_0;
procedure g_object_remove_weak_pointer(obj: PGObject; weak_pointer_location: Pgpointer); cdecl; external libgobject2_0;
type
  TGToggleNotify = procedure(data: Tgpointer; obj: PGObject; is_last_ref: Tgboolean); cdecl;

procedure g_object_add_toggle_ref(obj: PGObject; notify: TGToggleNotify; data: Tgpointer); cdecl; external libgobject2_0;
procedure g_object_remove_toggle_ref(obj: PGObject; notify: TGToggleNotify; data: Tgpointer); cdecl; external libgobject2_0;
function g_object_get_qdata(obj: PGObject; quark: TGQuark): Tgpointer; cdecl; external libgobject2_0;
procedure g_object_set_qdata(obj: PGObject; quark: TGQuark; data: Tgpointer); cdecl; external libgobject2_0;
procedure g_object_set_qdata_full(obj: PGObject; quark: TGQuark; data: Tgpointer; destroy: TGDestroyNotify); cdecl; external libgobject2_0;
function g_object_steal_qdata(obj: PGObject; quark: TGQuark): Tgpointer; cdecl; external libgobject2_0;
function g_object_dup_qdata(obj: PGObject; quark: TGQuark; dup_func: TGDuplicateFunc; user_data: Tgpointer): Tgpointer; cdecl; external libgobject2_0;
function g_object_replace_qdata(obj: PGObject; quark: TGQuark; oldval: Tgpointer; newval: Tgpointer; destroy: TGDestroyNotify;
  old_destroy: PGDestroyNotify): Tgboolean; cdecl; external libgobject2_0;
function g_object_get_data(obj: PGObject; key: Pgchar): Tgpointer; cdecl; external libgobject2_0;
procedure g_object_set_data(obj: PGObject; key: Pgchar; data: Tgpointer); cdecl; external libgobject2_0;
procedure g_object_set_data_full(obj: PGObject; key: Pgchar; data: Tgpointer; destroy: TGDestroyNotify); cdecl; external libgobject2_0;
function g_object_steal_data(obj: PGObject; key: Pgchar): Tgpointer; cdecl; external libgobject2_0;
function g_object_dup_data(obj: PGObject; key: Pgchar; dup_func: TGDuplicateFunc; user_data: Tgpointer): Tgpointer; cdecl; external libgobject2_0;
function g_object_replace_data(obj: PGObject; key: Pgchar; oldval: Tgpointer; newval: Tgpointer; destroy: TGDestroyNotify;
  old_destroy: PGDestroyNotify): Tgboolean; cdecl; external libgobject2_0;
procedure g_object_watch_closure(obj: PGObject; closure: PGClosure); cdecl; external libgobject2_0;
function g_cclosure_new_object(callback_func: TGCallback; obj: PGObject): PGClosure; cdecl; external libgobject2_0;
function g_cclosure_new_object_swap(callback_func: TGCallback; obj: PGObject): PGClosure; cdecl; external libgobject2_0;
function g_closure_new_object(sizeof_closure: Tguint; obj: PGObject): PGClosure; cdecl; external libgobject2_0;
procedure g_value_set_object(value: PGValue; v_object: Tgpointer); cdecl; external libgobject2_0;
function g_value_get_object(value: PGValue): Tgpointer; cdecl; external libgobject2_0;
function g_value_dup_object(value: PGValue): Tgpointer; cdecl; external libgobject2_0;
function g_signal_connect_object(instance: Tgpointer; detailed_signal: Pgchar; c_handler: TGCallback; gobject: Tgpointer; connect_flags: TGConnectFlags): Tgulong; cdecl; external libgobject2_0;

procedure g_object_force_floating(obj: PGObject); cdecl; external libgobject2_0;
procedure g_object_run_dispose(obj: PGObject); cdecl; external libgobject2_0;
procedure g_value_take_object(value: PGValue; v_object: Tgpointer); cdecl; external libgobject2_0;
procedure g_value_set_object_take_ownership(value: PGValue; v_object: Tgpointer); cdecl; external libgobject2_0; deprecated;
function g_object_compat_control(what: Tgsize; data: Tgpointer): Tgsize; cdecl; external libgobject2_0;

procedure g_clear_object(obj_ptr: PPGObject); cdecl; external libgobject2_0;

{xxxxxxxxxxxxxxxxx
static inline gboolean
(g_set_object) (GObject **object_ptr,
                GObject  *new_object)

  GObject *old_object = *object_ptr;

  if (old_object == new_object)
    return FALSE;

  if (new_object != NULL)
    g_object_ref (new_object);

  *object_ptr = new_object;

  if (old_object != NULL)
    g_object_unref (old_object);

  return TRUE;


static inline void
(g_assert_finalize_object) (GObject *object)

  gpointer weak_pointer = object;

  g_assert_true (G_IS_OBJECT (weak_pointer));
  g_object_add_weak_pointer (obj, &weak_pointer);
  g_object_unref (weak_pointer);
  g_assert_null (weak_pointer);


static inline void
(g_clear_weak_pointer) (gpointer *weak_pointer_location)

  GObject *object = (GObject *) *weak_pointer_location;

  if (obj != NULL)
    
      g_object_remove_weak_pointer (obj, weak_pointer_location);
      *weak_pointer_location = NULL;
    


static inline gboolean
(g_set_weak_pointer) (gpointer *weak_pointer_location,
                      GObject  *new_object)

  GObject *old_object = (GObject *) *weak_pointer_location;

  if (old_object == new_object)
    return FALSE;

  if (old_object != NULL)
    g_object_remove_weak_pointer (old_object, weak_pointer_location);

  *weak_pointer_location = new_object;

  if (new_object != NULL)
    g_object_add_weak_pointer (new_object, weak_pointer_location);

  return TRUE;

 }

type
  PGWeakRef = ^TGWeakRef;
  TGWeakRef = record
    priv: record
      case longint of
        0: (p: Tgpointer);
      end;
  end;

procedure g_weak_ref_init(weak_ref: PGWeakRef; obj: Tgpointer); cdecl; external libgobject2_0;
procedure g_weak_ref_clear(weak_ref: PGWeakRef); cdecl; external libgobject2_0;
function g_weak_ref_get(weak_ref: PGWeakRef): Tgpointer; cdecl; external libgobject2_0;
procedure g_weak_ref_set(weak_ref: PGWeakRef; obj: Tgpointer); cdecl; external libgobject2_0;

function g_set_object(object_ptr: PPGObject; new_object: PGObject): Tgboolean; inline;
procedure g_clear_weak_pointer(weak_pointer_location: PPointer); inline;
function g_set_weak_pointer(weak_pointer_location: PPointer; new_object: PGObject): Tgboolean; inline;

function G_TYPE_IS_OBJECT(_type: TGType): Tgboolean;
function G_OBJECT(obj: Tgpointer): PGObject;
function G_OBJECT_CLASS(klass: Tgpointer): PGObjectClass;
function G_IS_OBJECT(obj: Tgpointer): Tgboolean;
function G_IS_OBJECT_CLASS(klass: Tgpointer): Tgboolean;
function G_OBJECT_GET_CLASS(obj: Tgpointer): PGObjectClass;
function G_OBJECT_TYPE(inst: Tgpointer): TGType;
function G_OBJECT_TYPE_NAME(obj: Tgpointer): Pgchar;
function G_OBJECT_CLASS_TYPE(klass: Tgpointer): TGType;
function G_OBJECT_CLASS_NAME(klass: Tgpointer): Pgchar;
function G_VALUE_HOLDS_OBJECT(Value: Tgpointer): Tgboolean;

function G_TYPE_INITIALLY_UNOWNED: TGType;
function G_INITIALLY_UNOWNED(obj: Tgpointer): PGInitiallyUnowned;
function G_INITIALLY_UNOWNED_CLASS(klass: PGTypeClass): PGInitiallyUnownedClass;
function G_IS_INITIALLY_UNOWNED(obj: Tgpointer): Tgboolean;
function G_IS_INITIALLY_UNOWNED_CLASS(klass: Tgpointer): Tgboolean;
function G_INITIALLY_UNOWNED_GET_CLASS(obj: Tgpointer): PGInitiallyUnownedClass;

procedure G_OBJECT_WARN_INVALID_PSPEC(anObject: Tgpointer; pname: PGChar; property_id: Tgint; pspec: Tgpointer);
procedure G_OBJECT_WARN_INVALID_PROPERTY_ID(obj: Pointer; property_id: Tguint; pspec: PGParamSpec);



// === Konventiert am: 25-6-26 15:19:07 ===


implementation

function g_set_object(object_ptr: PPGObject; new_object: PGObject): Tgboolean; inline;
var
  old_object: PGObject;
begin
  old_object := object_ptr^;
  if old_object = new_object then  begin
    Exit(False);
  end;
  if new_object <> nil then  begin
    g_object_ref(new_object);
  end;
  object_ptr^ := new_object;
  if old_object <> nil then  begin
    g_object_unref(old_object);
  end;
  Result := True;
end;

procedure g_clear_weak_pointer(weak_pointer_location: PPointer); inline;
var
  obj: PGObject;
begin
  obj := PGObject(weak_pointer_location^);
  if obj <> nil then  begin
    g_object_remove_weak_pointer(obj, weak_pointer_location);
    weak_pointer_location^ := nil;
  end;
end;

function g_set_weak_pointer(weak_pointer_location: PPointer; new_object: PGObject): Tgboolean; inline;
var
  old_object: PGObject;
begin
  old_object := PGObject(weak_pointer_location^);
  if old_object = new_object then  begin
    Exit(False);
  end;
  if old_object <> nil then  begin
    g_object_remove_weak_pointer(old_object, weak_pointer_location);
  end;
  weak_pointer_location^ := new_object;
  if new_object <> nil then  begin
    g_object_add_weak_pointer(new_object, weak_pointer_location);
  end;
  Result := True;
end;


function G_TYPE_IS_OBJECT(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_OBJECT := G_TYPE_FUNDAMENTAL(_type) = G_TYPE_OBJECT;
end;

function G_OBJECT(obj: Tgpointer): PGObject;
begin
  G_OBJECT := PGObject(G_TYPE_CHECK_INSTANCE_CAST(obj, G_TYPE_OBJECT));
end;

function G_OBJECT_CLASS(klass: Tgpointer): PGObjectClass;
begin
  G_OBJECT_CLASS := PGObjectClass(G_TYPE_CHECK_CLASS_CAST(klass, G_TYPE_OBJECT));
end;

function G_IS_OBJECT(obj: Tgpointer): Tgboolean;
begin
  G_IS_OBJECT := g_type_check_instance_is_a(obj, G_TYPE_OBJECT);
end;

function G_IS_OBJECT_CLASS(klass: Tgpointer): Tgboolean;
begin
  G_IS_OBJECT_CLASS := g_type_check_class_is_a(klass, G_TYPE_OBJECT);
end;

function G_OBJECT_GET_CLASS(obj: Tgpointer): PGObjectClass;
begin
  G_OBJECT_GET_CLASS := PGObjectClass(G_TYPE_INSTANCE_GET_CLASS(obj, G_TYPE_OBJECT));
end;

function G_OBJECT_TYPE(inst: Tgpointer): TGType;
begin
  G_OBJECT_TYPE := G_TYPE_FROM_INSTANCE(inst);
end;

function G_OBJECT_TYPE_NAME(obj: Tgpointer): Pgchar;
begin
  G_OBJECT_TYPE_NAME := g_type_name(G_OBJECT_TYPE(obj));
end;

function G_OBJECT_CLASS_TYPE(klass: Tgpointer): TGType;
begin
  G_OBJECT_CLASS_TYPE := G_TYPE_FROM_CLASS(klass);
end;

function G_OBJECT_CLASS_NAME(klass: Tgpointer): Pgchar;
begin
  G_OBJECT_CLASS_NAME := g_type_name(G_OBJECT_CLASS_TYPE(klass));
end;

function G_VALUE_HOLDS_OBJECT(Value: Tgpointer): Tgboolean;
begin
  G_VALUE_HOLDS_OBJECT := G_TYPE_CHECK_VALUE_TYPE(Value, G_TYPE_OBJECT);
end;

function G_TYPE_INITIALLY_UNOWNED: TGType;
begin
  G_TYPE_INITIALLY_UNOWNED := g_initially_unowned_get_type;
end;

function G_INITIALLY_UNOWNED(obj: Tgpointer): PGInitiallyUnowned;
begin
  Result := PGInitiallyUnowned(g_type_check_instance_cast(obj, G_TYPE_INITIALLY_UNOWNED));
end;

function G_INITIALLY_UNOWNED_CLASS(klass: PGTypeClass): PGInitiallyUnownedClass;
begin
  Result := PGInitiallyUnownedClass(g_type_check_class_cast(klass, G_TYPE_INITIALLY_UNOWNED));
end;

function G_IS_INITIALLY_UNOWNED(obj: Tgpointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_INITIALLY_UNOWNED);
end;

function G_IS_INITIALLY_UNOWNED_CLASS(klass: Tgpointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_INITIALLY_UNOWNED);
end;

function G_INITIALLY_UNOWNED_GET_CLASS(obj: Tgpointer): PGInitiallyUnownedClass;
begin
  Result := PGInitiallyUnownedClass(PGTypeInstance(obj)^.g_class);
end;

procedure G_OBJECT_WARN_INVALID_PSPEC(anObject: Tgpointer; pname: PGChar; property_id: Tgint; pspec: Tgpointer);
var
  _object: PGObject;
  _pspec: PGParamSpec;
  _property_id: Tguint;
begin
  _object := PGObject(anObject);
  _pspec := PGParamSpec(pspec);
  _property_id := (property_id);
  g_print('%s: invalid %s id %u for "%s" of type `%s'' in `%s''',
    '', pname, _property_id, _pspec^.name, g_type_name(G_PARAM_SPEC_TYPE(_pspec)), G_OBJECT_TYPE_NAME(_object));
end;

procedure G_OBJECT_WARN_INVALID_PROPERTY_ID(obj: Pointer; property_id: Tguint; pspec: PGParamSpec);
begin
  G_OBJECT_WARN_INVALID_PSPEC(obj, 'property', property_id, pspec);
end;

end.
