{$IFDEF read_interface}


type
  TIBusHotkeyProfile = record
    parent: TIBusSerializable;
  end;
  PIBusHotkeyProfile = ^TIBusHotkeyProfile;

  TIBusHotkeyProfileClass = record
    parent: TIBusSerializableClass;
    trigger: procedure(profile: PIBusHotkeyProfile; event: TGQuark; user_data: Tgpointer); cdecl;
  end;
  PIBusHotkeyProfileClass = ^TIBusHotkeyProfileClass;

function ibus_hotkey_profile_get_type: TGType; cdecl; external libibus;
function ibus_hotkey_profile_new: PIBusHotkeyProfile; cdecl; external libibus;
function ibus_hotkey_profile_add_hotkey(profile: PIBusHotkeyProfile; keyval: Tguint; modifiers: Tguint; event: TGQuark): Tgboolean; cdecl; external libibus;
function ibus_hotkey_profile_add_hotkey_from_string(profile: PIBusHotkeyProfile; str: Pgchar; event: TGQuark): Tgboolean; cdecl; external libibus;
function ibus_hotkey_profile_remove_hotkey(profile: PIBusHotkeyProfile; keyval: Tguint; modifiers: Tguint): Tgboolean; cdecl; external libibus;
function ibus_hotkey_profile_remove_hotkey_by_event(profile: PIBusHotkeyProfile; event: TGQuark): Tgboolean; cdecl; external libibus;
function ibus_hotkey_profile_filter_key_event(profile: PIBusHotkeyProfile; keyval: Tguint; modifiers: Tguint; prev_keyval: Tguint; prev_modifiers: Tguint; user_data: Tgpointer): TGQuark; cdecl; external libibus;
function ibus_hotkey_profile_lookup_hotkey(profile: PIBusHotkeyProfile; keyval: Tguint; modifiers: Tguint): TGQuark; cdecl; external libibus;

// === Konventiert am: 26-7-25 15:54:08 ===

function IBUS_TYPE_HOTKEY_PROFILE: TGType;
function IBUS_HOTKEY_PROFILE(obj: Pointer): PIBusHotkeyProfile;
function IBUS_HOTKEY_PROFILE_CLASS(klass: Pointer): PIBusHotkeyProfileClass;
function IBUS_IS_HOTKEY_PROFILE(obj: Pointer): Tgboolean;
function IBUS_IS_HOTKEY_PROFILE_CLASS(klass: Pointer): Tgboolean;
function IBUS_HOTKEY_PROFILE_GET_CLASS(obj: Pointer): PIBusHotkeyProfileClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_HOTKEY_PROFILE: TGType;
begin
  IBUS_TYPE_HOTKEY_PROFILE := ibus_hotkey_profile_get_type;
end;

function IBUS_HOTKEY_PROFILE(obj: Pointer): PIBusHotkeyProfile;
begin
  Result := PIBusHotkeyProfile(g_type_check_instance_cast(obj, IBUS_TYPE_HOTKEY_PROFILE));
end;

function IBUS_HOTKEY_PROFILE_CLASS(klass: Pointer): PIBusHotkeyProfileClass;
begin
  Result := PIBusHotkeyProfileClass(g_type_check_class_cast(klass, IBUS_TYPE_HOTKEY_PROFILE));
end;

function IBUS_IS_HOTKEY_PROFILE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_HOTKEY_PROFILE);
end;

function IBUS_IS_HOTKEY_PROFILE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_HOTKEY_PROFILE);
end;

function IBUS_HOTKEY_PROFILE_GET_CLASS(obj: Pointer): PIBusHotkeyProfileClass;
begin
  Result := PIBusHotkeyProfileClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
