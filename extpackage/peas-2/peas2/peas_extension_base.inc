{$IFDEF read_interface}



type
  TPeasExtensionBaseClass = record
    parent_class: TGObjectClass;
    _reserved: array[0..7] of Tgpointer;
  end;
  PPeasExtensionBaseClass = ^TPeasExtensionBaseClass;

  TPeasExtensionBase = record
    parent_instance: TGObject;
  end;
  PPeasExtensionBase = ^TPeasExtensionBase;

function peas_extension_base_get_type: TGType; cdecl; external libpeas2;
function peas_extension_base_get_plugin_info(extbase: PPeasExtensionBase): PPeasPluginInfo; cdecl; external libpeas2;
function peas_extension_base_get_data_dir(extbase: PPeasExtensionBase): pchar; cdecl; external libpeas2;

// === Konventiert am: 3-9-25 15:44:56 ===

function PEAS_TYPE_EXTENSION_BASE: TGType;
function PEAS_EXTENSION_BASE(obj: Pointer): PPeasExtensionBase;
function PEAS_IS_EXTENSION_BASE(obj: Pointer): Tgboolean;
function PEAS_EXTENSION_BASE_CLASS(klass: Pointer): PPeasExtensionBaseClass;
function PEAS_IS_EXTENSION_BASE_CLASS(klass: Pointer): Tgboolean;
function PEAS_EXTENSION_BASE_GET_CLASS(obj: Pointer): PPeasExtensionBaseClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PEAS_TYPE_EXTENSION_BASE: TGType;
begin
  Result := peas_extension_base_get_type;
end;

function PEAS_EXTENSION_BASE(obj: Pointer): PPeasExtensionBase;
begin
  Result := PPeasExtensionBase(g_type_check_instance_cast(obj, PEAS_TYPE_EXTENSION_BASE));
end;

function PEAS_IS_EXTENSION_BASE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PEAS_TYPE_EXTENSION_BASE);
end;

function PEAS_EXTENSION_BASE_CLASS(klass: Pointer): PPeasExtensionBaseClass;
begin
  Result := PPeasExtensionBaseClass(g_type_check_class_cast(klass, PEAS_TYPE_EXTENSION_BASE));
end;

function PEAS_IS_EXTENSION_BASE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PEAS_TYPE_EXTENSION_BASE);
end;

function PEAS_EXTENSION_BASE_GET_CLASS(obj: Pointer): PPeasExtensionBaseClass;
begin
  Result := PPeasExtensionBaseClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
