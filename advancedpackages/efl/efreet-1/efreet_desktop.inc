{$IFDEF read_interface}


var
  EFREET_DESKTOP_TYPE_APPLICATION: longint; cvar;external libefreet;
  EFREET_DESKTOP_TYPE_LINK: longint; cvar;external libefreet;
  EFREET_DESKTOP_TYPE_DIRECTORY: longint; cvar;external libefreet;
  EFREET_EVENT_DESKTOP_CACHE_UPDATE: longint; cvar;external libefreet;
  EFREET_EVENT_DESKTOP_CACHE_BUILD: longint; cvar;external libefreet;

type
  PEfreet_Desktop = ^TEfreet_Desktop;

  TEfreet_Desktop_Command_Cb = function(data: pointer; desktop: PEfreet_Desktop; command: pchar; remaining: longint): pointer; cdecl;
  TEfreet_Desktop_Progress_Cb = function(data: pointer; desktop: PEfreet_Desktop; uri: pchar; total: longint; current: longint): longint; cdecl;
  TEfreet_Desktop_Type_Parse_Cb = function(desktop: PEfreet_Desktop; ini: PEfreet_Ini): pointer; cdecl;
  TEfreet_Desktop_Type_Save_Cb = procedure(desktop: PEfreet_Desktop; ini: PEfreet_Ini); cdecl;
  TEfreet_Desktop_Type_Free_Cb = function(data: pointer): pointer; cdecl;

  TEfreet_Desktop_Action = record
    key: pchar;
    name: pchar;
    icon: pchar;
    exec: pchar;
  end;
  PEfreet_Desktop_Action = ^TEfreet_Desktop_Action;

  TEfreet_Desktop = record
  end;


function efreet_desktop_get(file_: pchar): PEfreet_Desktop; cdecl; external libefreet;
function efreet_desktop_ref(desktop: PEfreet_Desktop): longint; cdecl; external libefreet;
function efreet_desktop_empty_new(file_: pchar): PEfreet_Desktop; cdecl; external libefreet;
function efreet_desktop_new(file_: pchar): PEfreet_Desktop; cdecl; external libefreet;
function efreet_desktop_uncached_new(file_: pchar): PEfreet_Desktop; cdecl; external libefreet;
procedure efreet_desktop_free(desktop: PEfreet_Desktop); cdecl; external libefreet;

procedure efreet_desktop_unref(desktop: PEfreet_Desktop);

function efreet_desktop_save(desktop: PEfreet_Desktop): longint; cdecl; external libefreet;
function efreet_desktop_save_as(desktop: PEfreet_Desktop; file_: pchar): longint; cdecl; external libefreet;
procedure efreet_desktop_exec(desktop: PEfreet_Desktop; files: PEina_List; data: pointer); cdecl; external libefreet;
procedure efreet_desktop_environment_set(environment: pchar); cdecl; external libefreet;
function efreet_desktop_environment_get: pchar; cdecl; external libefreet;
function efreet_desktop_command_progress_get(desktop: PEfreet_Desktop; files: PEina_List; cb_command: TEfreet_Desktop_Command_Cb; cb_prog: TEfreet_Desktop_Progress_Cb; data: pointer): pointer; cdecl; external libefreet;
function efreet_desktop_command_get(desktop: PEfreet_Desktop; files: PEina_List; func: TEfreet_Desktop_Command_Cb; data: pointer): pointer; cdecl; external libefreet;
function efreet_desktop_command_local_get(desktop: PEfreet_Desktop; files: PEina_List): PEina_List; cdecl; external libefreet;
function efreet_desktop_category_count_get(desktop: PEfreet_Desktop): dword; cdecl; external libefreet;
procedure efreet_desktop_category_add(desktop: PEfreet_Desktop; category: pchar); cdecl; external libefreet;
function efreet_desktop_category_del(desktop: PEfreet_Desktop; category: pchar): longint; cdecl; external libefreet;
function efreet_desktop_type_add(_type: pchar; parse_func: TEfreet_Desktop_Type_Parse_Cb; save_func: TEfreet_Desktop_Type_Save_Cb; free_func: TEfreet_Desktop_Type_Free_Cb): longint; cdecl; external libefreet;
function efreet_desktop_type_alias(from_type: longint; alias: pchar): longint; cdecl; external libefreet;
function efreet_desktop_type_data_get(desktop: PEfreet_Desktop): pointer; cdecl; external libefreet;
function efreet_desktop_string_list_parse(_string: pchar): PEina_List; cdecl; external libefreet;
function efreet_desktop_string_list_join(list: PEina_List): pchar; cdecl; external libefreet;
function efreet_desktop_x_field_set(desktop: PEfreet_Desktop; key: pchar; data: pchar): TEina_Bool; cdecl; external libefreet;
function efreet_desktop_x_field_get(desktop: PEfreet_Desktop; key: pchar): pchar; cdecl; external libefreet;
function efreet_desktop_x_field_del(desktop: PEfreet_Desktop; key: pchar): TEina_Bool; cdecl; external libefreet;

// === Konventiert am: 11-6-25 17:06:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure efreet_desktop_unref(desktop: PEfreet_Desktop);
begin
  efreet_desktop_free(desktop);
end;


{$ENDIF read_implementation}
