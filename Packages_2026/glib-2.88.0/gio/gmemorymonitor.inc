

  {$IFDEF read_enum}
const
  G_MEMORY_MONITOR_EXTENSION_POINT_NAME = 'gio-memory-monitor';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGMemoryMonitor = type Pointer;

  PGMemoryMonitorInterface = ^TGMemoryMonitorInterface;
  TGMemoryMonitorInterface = record
    g_iface: TGTypeInterface;
    low_memory_warning: procedure(monitor: PGMemoryMonitor; level: TGMemoryMonitorWarningLevel); cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_memory_monitor_get_type: TGType; cdecl; external libgio2;
function g_memory_monitor_dup_default: PGMemoryMonitor; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:39:31 ===

function g_TYPE_memory_monitor: TGType;
function g_memory_monitor(obj: Pointer): PGMemoryMonitor;
function g_IS_memory_monitor(obj: Pointer): Tgboolean;
function g_memory_monitor_GET_IFACE(obj: Pointer): PGMemoryMonitorInterface;
{$ENDIF read_function}


{$IFDEF read_implementation}

function g_TYPE_memory_monitor: TGType;
begin
  Result := g_memory_monitor_get_type;
end;

function g_memory_monitor(obj: Pointer): PGMemoryMonitor;
begin
  Result := PGMemoryMonitor(g_type_check_instance_cast(obj, g_TYPE_memory_monitor));
end;

function g_IS_memory_monitor(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, g_TYPE_memory_monitor);
end;

function g_memory_monitor_GET_IFACE(obj: Pointer): PGMemoryMonitorInterface;
begin
  Result := g_type_interface_peek(obj, g_TYPE_memory_monitor);
end;



{$ENDIF read_implementation}
