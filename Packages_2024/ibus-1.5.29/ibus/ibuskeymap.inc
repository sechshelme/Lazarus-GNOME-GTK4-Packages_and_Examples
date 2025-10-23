{$IFDEF read_interface}


type
  TIBusKeymap = record
    parent: TIBusObject;
    name: Pgchar;
    keymap: array[0..255] of array[0..6] of Tguint;
  end;
  PIBusKeymap = ^TIBusKeymap;

  TIBusKeymapClass = record
    parent: TIBusObjectClass;
  end;
  PIBusKeymapClass = ^TIBusKeymapClass;


function ibus_keymap_get_type: TGType; cdecl; external libibus;
function ibus_keymap_new(name: Pgchar): PIBusKeymap; cdecl; external libibus; deprecated;
function ibus_keymap_get(name: Pgchar): PIBusKeymap; cdecl; external libibus;
function ibus_keymap_lookup_keysym(keymap: PIBusKeymap; keycode: Tguint16; state: Tguint32): Tguint; cdecl; external libibus;

// === Konventiert am: 26-7-25 15:54:14 ===

function IBUS_TYPE_KEYMAP: TGType;
function IBUS_KEYMAP(obj: Pointer): PIBusKeymap;
function IBUS_KEYMAP_CLASS(klass: Pointer): PIBusKeymapClass;
function IBUS_IS_KEYMAP(obj: Pointer): Tgboolean;
function IBUS_IS_KEYMAP_CLASS(klass: Pointer): Tgboolean;
function IBUS_KEYMAP_GET_CLASS(obj: Pointer): PIBusKeymapClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_KEYMAP: TGType;
begin
  IBUS_TYPE_KEYMAP := ibus_keymap_get_type;
end;

function IBUS_KEYMAP(obj: Pointer): PIBusKeymap;
begin
  Result := PIBusKeymap(g_type_check_instance_cast(obj, IBUS_TYPE_KEYMAP));
end;

function IBUS_KEYMAP_CLASS(klass: Pointer): PIBusKeymapClass;
begin
  Result := PIBusKeymapClass(g_type_check_class_cast(klass, IBUS_TYPE_KEYMAP));
end;

function IBUS_IS_KEYMAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_KEYMAP);
end;

function IBUS_IS_KEYMAP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_KEYMAP);
end;

function IBUS_KEYMAP_GET_CLASS(obj: Pointer): PIBusKeymapClass;
begin
  Result := PIBusKeymapClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
