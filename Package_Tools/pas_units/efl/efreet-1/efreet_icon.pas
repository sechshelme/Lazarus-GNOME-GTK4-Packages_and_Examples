unit efreet_icon;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  EFREET_EVENT_ICON_CACHE_UPDATE: longint; cvar;external libefreet;

type
  PEfreet_Icon_Theme_Context = ^TEfreet_Icon_Theme_Context;
  TEfreet_Icon_Theme_Context = longint;

const
  EFREET_ICON_THEME_CONTEXT_NONE = 0;
  EFREET_ICON_THEME_CONTEXT_ACTIONS = 1;
  EFREET_ICON_THEME_CONTEXT_DEVICES = 2;
  EFREET_ICON_THEME_CONTEXT_FILESYSTEMS = 3;
  EFREET_ICON_THEME_CONTEXT_MIMETYPES = 4;

type
  PEfreet_Icon_Size_Type = ^TEfreet_Icon_Size_Type;
  TEfreet_Icon_Size_Type = longint;

const
  EFREET_ICON_SIZE_TYPE_NONE = 0;
  EFREET_ICON_SIZE_TYPE_FIXED = 1;
  EFREET_ICON_SIZE_TYPE_SCALABLE = 2;
  EFREET_ICON_SIZE_TYPE_THRESHOLD = 3;

type
  TEfreet_Icon_Theme = record
    name: record
      internal: pchar;
      name: pchar;
      end;
    comment: pchar;
    example_icon: pchar;
    paths: PEina_List;
    inherits: PEina_List;
    directories: PEina_List;
  end;
  PEfreet_Icon_Theme = ^TEfreet_Icon_Theme;

  TEfreet_Icon_Theme_Directory = record
    name: pchar;
    context: TEfreet_Icon_Theme_Context;
    _type: TEfreet_Icon_Size_Type;
    size: record
      normal: dword;
      min: dword;
      max: dword;
      threshold: dword;
      end;
  end;
  PEfreet_Icon_Theme_Directory = ^TEfreet_Icon_Theme_Directory;

  PEfreet_Icon = ^TEfreet_Icon;
  TEfreet_Icon = record
  end;

type
  TEfreet_Icon_Point = record
    x: longint;
    y: longint;
  end;
  PEfreet_Icon_Point = ^TEfreet_Icon_Point;

function efreet_icon_user_dir_get: pchar; cdecl; external libefreet;
function efreet_icon_deprecated_user_dir_get: pchar; cdecl; external libefreet;
procedure efreet_icon_extension_add(ext: pchar); cdecl; external libefreet;
function efreet_icon_extra_list_get: PPEina_List; cdecl; external libefreet;
function efreet_icon_extensions_list_get: PEina_List; cdecl; external libefreet;
function efreet_icon_theme_list_get: PEina_List; cdecl; external libefreet;
function efreet_icon_theme_find(theme_name: pchar): PEfreet_Icon_Theme; cdecl; external libefreet;
function efreet_icon_find(theme_name: pchar; icon: pchar; size: dword): PEfreet_Icon; cdecl; external libefreet;
function efreet_icon_list_find(theme_name: pchar; icons: PEina_List; size: dword): pchar; cdecl; external libefreet;
function efreet_icon_path_find(theme_name: pchar; icon: pchar; size: dword): pchar; cdecl; external libefreet;
procedure efreet_icon_free(icon: PEfreet_Icon); cdecl; external libefreet;

// === Konventiert am: 11-6-25 17:06:15 ===


implementation


end.
