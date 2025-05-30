unit elm_systray_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Systray = ^TElm_Systray;
  TElm_Systray = TEo;

type
  PElm_Systray_Category = ^TElm_Systray_Category;
  TElm_Systray_Category = longint;

const
  ELM_SYSTRAY_CATEGORY_APP_STATUS = 0;
  ELM_SYSTRAY_CATEGORY_COMMUNICATIONS = 1;
  ELM_SYSTRAY_CATEGORY_SYS_SERVICES = 2;
  ELM_SYSTRAY_CATEGORY_HARDWARE = 3;
  ELM_SYSTRAY_CATEGORY_OTHER = 4;

type
  PElm_Systray_Status = ^TElm_Systray_Status;
  TElm_Systray_Status = longint;

const
  ELM_SYSTRAY_STATUS_PASSIVE = 0;
  ELM_SYSTRAY_STATUS_ACTIVE = 1;
  ELM_SYSTRAY_STATUS_ATTENTION = 2;

procedure elm_systray_id_set(obj: PElm_Systray; id: pchar); cdecl; external libelementary;
function elm_systray_id_get(obj: PElm_Systray): pchar; cdecl; external libelementary;
procedure elm_systray_category_set(obj: PElm_Systray; cat: TElm_Systray_Category); cdecl; external libelementary;
function elm_systray_category_get(obj: PElm_Systray): TElm_Systray_Category; cdecl; external libelementary;
procedure elm_systray_icon_theme_path_set(obj: PElm_Systray; icon_theme_path: pchar); cdecl; external libelementary;
function elm_systray_icon_theme_path_get(obj: PElm_Systray): pchar; cdecl; external libelementary;
procedure elm_systray_menu_set(obj: PElm_Systray; menu: PEfl_Object); cdecl; external libelementary;
function elm_systray_menu_get(obj: PElm_Systray): PEfl_Object; cdecl; external libelementary;
procedure elm_systray_att_icon_name_set(obj: PElm_Systray; att_icon_name: pchar); cdecl; external libelementary;
function elm_systray_att_icon_name_get(obj: PElm_Systray): pchar; cdecl; external libelementary;
procedure elm_systray_status_set(obj: PElm_Systray; st: TElm_Systray_Status); cdecl; external libelementary;
function elm_systray_status_get(obj: PElm_Systray): TElm_Systray_Status; cdecl; external libelementary;
procedure elm_systray_icon_name_set(obj: PElm_Systray; icon_name: pchar); cdecl; external libelementary;
function elm_systray_icon_name_get(obj: PElm_Systray): pchar; cdecl; external libelementary;
procedure elm_systray_title_set(obj: PElm_Systray; title: pchar); cdecl; external libelementary;
function elm_systray_title_get(obj: PElm_Systray): pchar; cdecl; external libelementary;
function elm_systray_register(obj: PElm_Systray): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 28-5-25 19:48:47 ===


implementation



end.
