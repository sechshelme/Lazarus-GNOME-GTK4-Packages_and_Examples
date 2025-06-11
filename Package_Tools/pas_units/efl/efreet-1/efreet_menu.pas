unit efreet_menu;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore, efreet_desktop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfreet_Menu_Entry_Type = ^TEfreet_Menu_Entry_Type;
  TEfreet_Menu_Entry_Type = longint;

const
  EFREET_MENU_ENTRY_MENU = 0;
  EFREET_MENU_ENTRY_DESKTOP = 1;
  EFREET_MENU_ENTRY_SEPARATOR = 2;
  EFREET_MENU_ENTRY_HEADER = 3;

type
  TEfreet_Menu = record
    _type: TEfreet_Menu_Entry_Type;
    id: pchar;
    name: pchar;
    icon: pchar;
    desktop: PEfreet_Desktop;
    entries: PEina_List;
    references: longint;
  end;
  PEfreet_Menu = ^TEfreet_Menu;

  TEfreet_Menu_Cb = procedure(data: pointer; menu: PEfreet_Menu); cdecl;

function efreet_menu_kde_legacy_init: longint; cdecl; external libefreet;
function efreet_menu_new(name: pchar): PEfreet_Menu; cdecl; external libefreet;
procedure efreet_menu_file_set(file_: pchar); cdecl; external libefreet;
procedure efreet_menu_async_get(func: TEfreet_Menu_Cb; data: pointer); cdecl; external libefreet; deprecated;
function efreet_menu_get: PEfreet_Menu; cdecl; external libefreet;
procedure efreet_menu_async_parse(path: pchar; func: TEfreet_Menu_Cb; data: pointer); cdecl; external libefreet; deprecated;
function efreet_menu_parse(path: pchar): PEfreet_Menu; cdecl; external libefreet;
function efreet_menu_save(menu: PEfreet_Menu; path: pchar): longint; cdecl; external libefreet;
procedure efreet_menu_free(menu: PEfreet_Menu); cdecl; external libefreet;
procedure efreet_menu_ref(menu: PEfreet_Menu); cdecl; external libefreet;
procedure efreet_menu_unref(menu: PEfreet_Menu); cdecl; external libefreet;
function efreet_menu_desktop_insert(menu: PEfreet_Menu; desktop: PEfreet_Desktop; pos: longint): longint; cdecl; external libefreet;
function efreet_menu_desktop_remove(menu: PEfreet_Menu; desktop: PEfreet_Desktop): longint; cdecl; external libefreet;
procedure efreet_menu_dump(menu: PEfreet_Menu; indent: pchar); cdecl; external libefreet;

// === Konventiert am: 11-6-25 17:06:20 ===


implementation



end.
