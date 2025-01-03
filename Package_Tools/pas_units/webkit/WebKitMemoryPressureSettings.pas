unit WebKitMemoryPressureSettings;

interface

uses
  fp_glib2, fp_GTK4, web_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TWebKitMemoryPressureSettings = record
  end;
  PWebKitMemoryPressureSettings = ^TWebKitMemoryPressureSettings;

function webkit_memory_pressure_settings_get_type: TGType; cdecl; external libwebkit;
function webkit_memory_pressure_settings_new: PWebKitMemoryPressureSettings; cdecl; external libwebkit;
function webkit_memory_pressure_settings_copy(settings: PWebKitMemoryPressureSettings): PWebKitMemoryPressureSettings; cdecl; external libwebkit;
procedure webkit_memory_pressure_settings_free(settings: PWebKitMemoryPressureSettings); cdecl; external libwebkit;
procedure webkit_memory_pressure_settings_set_memory_limit(settings: PWebKitMemoryPressureSettings; memory_limit: Tguint); cdecl; external libwebkit;
function webkit_memory_pressure_settings_get_memory_limit(settings: PWebKitMemoryPressureSettings): Tguint; cdecl; external libwebkit;
procedure webkit_memory_pressure_settings_set_conservative_threshold(settings: PWebKitMemoryPressureSettings; Value: Tgdouble); cdecl; external libwebkit;
function webkit_memory_pressure_settings_get_conservative_threshold(settings: PWebKitMemoryPressureSettings): Tgdouble; cdecl; external libwebkit;
procedure webkit_memory_pressure_settings_set_strict_threshold(settings: PWebKitMemoryPressureSettings; Value: Tgdouble); cdecl; external libwebkit;
function webkit_memory_pressure_settings_get_strict_threshold(settings: PWebKitMemoryPressureSettings): Tgdouble; cdecl; external libwebkit;
procedure webkit_memory_pressure_settings_set_kill_threshold(settings: PWebKitMemoryPressureSettings; Value: Tgdouble); cdecl; external libwebkit;
function webkit_memory_pressure_settings_get_kill_threshold(settings: PWebKitMemoryPressureSettings): Tgdouble; cdecl; external libwebkit;
procedure webkit_memory_pressure_settings_set_poll_interval(settings: PWebKitMemoryPressureSettings; Value: Tgdouble); cdecl; external libwebkit;
function webkit_memory_pressure_settings_get_poll_interval(settings: PWebKitMemoryPressureSettings): Tgdouble; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 19:23:33 ===


implementation

function WEBKIT_TYPE_MEMORY_PRESSURE_SETTINGS: TGType;
begin
  WEBKIT_TYPE_MEMORY_PRESSURE_SETTINGS := webkit_memory_pressure_settings_get_type;
end;



end.
