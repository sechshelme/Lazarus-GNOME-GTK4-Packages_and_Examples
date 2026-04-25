

  {$IFDEF read_enum}
const
  NM_SETTING_MATCH_SETTING_NAME = 'match';
  NM_SETTING_MATCH_INTERFACE_NAME = 'interface-name';
  NM_SETTING_MATCH_KERNEL_COMMAND_LINE = 'kernel-command-line';
  NM_SETTING_MATCH_DRIVER = 'driver';
  NM_SETTING_MATCH_PATH = 'path';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingMatch = type Pointer;
  PNMSettingMatchClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_match_get_type: TGType; cdecl; external libnm;
function nm_setting_match_new: PNMSetting; cdecl; external libnm;
function nm_setting_match_get_num_interface_names(setting: PNMSettingMatch): Tguint; cdecl; external libnm;
function nm_setting_match_get_interface_name(setting: PNMSettingMatch; idx: longint): pchar; cdecl; external libnm;
procedure nm_setting_match_remove_interface_name(setting: PNMSettingMatch; idx: longint); cdecl; external libnm;
function nm_setting_match_remove_interface_name_by_value(setting: PNMSettingMatch; interface_name: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_match_add_interface_name(setting: PNMSettingMatch; interface_name: pchar); cdecl; external libnm;
procedure nm_setting_match_clear_interface_names(setting: PNMSettingMatch); cdecl; external libnm;
function nm_setting_match_get_interface_names(setting: PNMSettingMatch; length: Pguint): Ppchar; cdecl; external libnm;
function nm_setting_match_get_num_kernel_command_lines(setting: PNMSettingMatch): Tguint; cdecl; external libnm;
function nm_setting_match_get_kernel_command_line(setting: PNMSettingMatch; idx: Tguint): pchar; cdecl; external libnm;
procedure nm_setting_match_remove_kernel_command_line(setting: PNMSettingMatch; idx: Tguint); cdecl; external libnm;
function nm_setting_match_remove_kernel_command_line_by_value(setting: PNMSettingMatch; kernel_command_line: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_match_add_kernel_command_line(setting: PNMSettingMatch; kernel_command_line: pchar); cdecl; external libnm;
procedure nm_setting_match_clear_kernel_command_lines(setting: PNMSettingMatch); cdecl; external libnm;
function nm_setting_match_get_kernel_command_lines(setting: PNMSettingMatch; length: Pguint): Ppchar; cdecl; external libnm;
function nm_setting_match_get_num_drivers(setting: PNMSettingMatch): Tguint; cdecl; external libnm;
function nm_setting_match_get_driver(setting: PNMSettingMatch; idx: Tguint): pchar; cdecl; external libnm;
procedure nm_setting_match_remove_driver(setting: PNMSettingMatch; idx: Tguint); cdecl; external libnm;
function nm_setting_match_remove_driver_by_value(setting: PNMSettingMatch; driver: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_match_add_driver(setting: PNMSettingMatch; driver: pchar); cdecl; external libnm;
procedure nm_setting_match_clear_drivers(setting: PNMSettingMatch); cdecl; external libnm;
function nm_setting_match_get_drivers(setting: PNMSettingMatch; length: Pguint): Ppchar; cdecl; external libnm;
function nm_setting_match_get_num_paths(setting: PNMSettingMatch): Tguint; cdecl; external libnm;
function nm_setting_match_get_path(setting: PNMSettingMatch; idx: Tguint): pchar; cdecl; external libnm;
procedure nm_setting_match_remove_path(setting: PNMSettingMatch; idx: Tguint); cdecl; external libnm;
function nm_setting_match_remove_path_by_value(setting: PNMSettingMatch; path: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_match_add_path(setting: PNMSettingMatch; path: pchar); cdecl; external libnm;
procedure nm_setting_match_clear_paths(setting: PNMSettingMatch); cdecl; external libnm;
function nm_setting_match_get_paths(setting: PNMSettingMatch; length: Pguint): Ppchar; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:26:09 ===

function NM_TYPE_SETTING_MATCH: TGType;
function NM_SETTING_MATCH(obj: Pointer): PNMSettingMatch;
function NM_SETTING_MATCH_CLASS(klass: Pointer): PNMSettingMatchClass;
function NM_IS_SETTING_MATCH(obj: Pointer): Tgboolean;
function NM_IS_SETTING_MATCH_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_MATCH_GET_CLASS(obj: Pointer): PNMSettingMatchClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_MATCH: TGType;
begin
  NM_TYPE_SETTING_MATCH := nm_setting_match_get_type;
end;

function NM_SETTING_MATCH(obj: Pointer): PNMSettingMatch;
begin
  Result := PNMSettingMatch(g_type_check_instance_cast(obj, NM_TYPE_SETTING_MATCH));
end;

function NM_SETTING_MATCH_CLASS(klass: Pointer): PNMSettingMatchClass;
begin
  Result := PNMSettingMatchClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_MATCH));
end;

function NM_IS_SETTING_MATCH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_MATCH);
end;

function NM_IS_SETTING_MATCH_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_MATCH);
end;

function NM_SETTING_MATCH_GET_CLASS(obj: Pointer): PNMSettingMatchClass;
begin
  Result := PNMSettingMatchClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
