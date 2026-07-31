

  {$IFDEF read_enum}
type
  PAsCheckResult = ^TAsCheckResult;
  TAsCheckResult = longint;
const
  AS_CHECK_RESULT_ERROR = 0;
  AS_CHECK_RESULT_UNKNOWN = 1;
  AS_CHECK_RESULT_FALSE = 2;
  AS_CHECK_RESULT_TRUE = 3;
  AS_CHECK_RESULT_LAST = 4;

type
  PAsChassisKind = ^TAsChassisKind;
  TAsChassisKind = longint;
const
  AS_CHASSIS_KIND_UNKNOWN = 0;
  AS_CHASSIS_KIND_DESKTOP = 1;
  AS_CHASSIS_KIND_LAPTOP = 2;
  AS_CHASSIS_KIND_SERVER = 3;
  AS_CHASSIS_KIND_TABLET = 4;
  AS_CHASSIS_KIND_HANDSET = 5;
  AS_CHASSIS_KIND_LAST = 6;

type
  PAsSystemInfoError = ^TAsSystemInfoError;
  TAsSystemInfoError = longint;
const
  AS_SYSTEM_INFO_ERROR_FAILED = 0;
  AS_SYSTEM_INFO_ERROR_NOT_FOUND = 1;
  AS_SYSTEM_INFO_ERROR_LAST = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsSystemInfo = record
    parent_instance: TGObject;
  end;
  PAsSystemInfo = ^TAsSystemInfo;

  PAsSystemInfoClass = ^TAsSystemInfoClass;
  TAsSystemInfoClass = record
    parent_class: TGObjectClass;
    _as_reserved1: procedure; cdecl;
    _as_reserved2: procedure; cdecl;
    _as_reserved3: procedure; cdecl;
    _as_reserved4: procedure; cdecl;
    _as_reserved5: procedure; cdecl;
    _as_reserved6: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function as_system_info_get_type: TGType; cdecl; external libappstream;
function as_chassis_kind_to_string(kind: TAsChassisKind): Pgchar; cdecl; external libappstream;
function as_chassis_kind_from_string(kind_str: Pgchar): TAsChassisKind; cdecl; external libappstream;

function as_system_info_error_quark: TGQuark; cdecl; external libappstream;
function as_system_info_new: PAsSystemInfo; cdecl; external libappstream;
function as_system_info_new_template_for_chassis(chassis: TAsChassisKind; error: PPGError): PAsSystemInfo; cdecl; external libappstream;
function as_system_info_get_os_id(sysinfo: PAsSystemInfo): Pgchar; cdecl; external libappstream;
function as_system_info_get_os_cid(sysinfo: PAsSystemInfo): Pgchar; cdecl; external libappstream;
function as_system_info_get_os_name(sysinfo: PAsSystemInfo): Pgchar; cdecl; external libappstream;
function as_system_info_get_os_version(sysinfo: PAsSystemInfo): Pgchar; cdecl; external libappstream;
function as_system_info_get_os_homepage(sysinfo: PAsSystemInfo): Pgchar; cdecl; external libappstream;
function as_system_info_get_kernel_name(sysinfo: PAsSystemInfo): Pgchar; cdecl; external libappstream;
function as_system_info_get_kernel_version(sysinfo: PAsSystemInfo): Pgchar; cdecl; external libappstream;
function as_system_info_get_memory_total(sysinfo: PAsSystemInfo): Tgulong; cdecl; external libappstream;
function as_system_info_get_modaliases(sysinfo: PAsSystemInfo): PGPtrArray; cdecl; external libappstream;
function as_system_info_modalias_to_syspath(sysinfo: PAsSystemInfo; modalias: Pgchar): Pgchar; cdecl; external libappstream;
function as_system_info_has_device_matching_modalias(sysinfo: PAsSystemInfo; modalias_glob: Pgchar): Tgboolean; cdecl; external libappstream;
function as_system_info_get_device_name_for_modalias(sysinfo: PAsSystemInfo; modalias: Pgchar; allow_fallback: Tgboolean; error: PPGError): Pgchar; cdecl; external libappstream;
function as_system_info_has_input_control(sysinfo: PAsSystemInfo; kind: TAsControlKind; error: PPGError): TAsCheckResult; cdecl; external libappstream;
procedure as_system_info_set_input_control(sysinfo: PAsSystemInfo; kind: TAsControlKind; found: Tgboolean); cdecl; external libappstream;
function as_system_info_get_gui_available(sysinfo: PAsSystemInfo): Tgboolean; cdecl; external libappstream;
procedure as_system_info_set_gui_available(sysinfo: PAsSystemInfo; available: Tgboolean); cdecl; external libappstream;
function as_system_info_get_display_length(sysinfo: PAsSystemInfo; side: TAsDisplaySideKind): Tgulong; cdecl; external libappstream;
procedure as_system_info_set_display_length(sysinfo: PAsSystemInfo; side: TAsDisplaySideKind; value_dip: Tgulong); cdecl; external libappstream;
function as_get_current_distro_component_id: Pgchar; cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:34:41 ===

function AS_TYPE_SYSTEM_INFO: TGType;
function AS_SYSTEM_INFO(obj: Pointer): PAsSystemInfo;
function AS_IS_SYSTEM_INFO(obj: Pointer): Tgboolean;
function AS_SYSTEM_INFO_CLASS(klass: Pointer): PAsSystemInfoClass;
function AS_IS_SYSTEM_INFO_CLASS(klass: Pointer): Tgboolean;
function AS_SYSTEM_INFO_GET_CLASS(obj: Pointer): PAsSystemInfoClass;

function AS_SYSTEM_INFO_ERROR: TGQuark;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_TYPE_SYSTEM_INFO: TGType;
begin
  Result := as_system_info_get_type;
end;

function AS_SYSTEM_INFO(obj: Pointer): PAsSystemInfo;
begin
  Result := PAsSystemInfo(g_type_check_instance_cast(obj, AS_TYPE_SYSTEM_INFO));
end;

function AS_IS_SYSTEM_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_SYSTEM_INFO);
end;

function AS_SYSTEM_INFO_CLASS(klass: Pointer): PAsSystemInfoClass;
begin
  Result := PAsSystemInfoClass(g_type_check_class_cast(klass, AS_TYPE_SYSTEM_INFO));
end;

function AS_IS_SYSTEM_INFO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_SYSTEM_INFO);
end;

function AS_SYSTEM_INFO_GET_CLASS(obj: Pointer): PAsSystemInfoClass;
begin
  Result := PAsSystemInfoClass(PGTypeInstance(obj)^.g_class);
end;


function AS_SYSTEM_INFO_ERROR: TGQuark;
begin
  AS_SYSTEM_INFO_ERROR := as_system_info_error_quark;
end;

{$ENDIF read_implementation}
