unit elm_dayselector_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Dayselector = ^TElm_Dayselector;
  TElm_Dayselector = TEo;

type
  PElm_Dayselector_Day = ^TElm_Dayselector_Day;
  TElm_Dayselector_Day = longint;

const
  ELM_DAYSELECTOR_SUN = 0;
  ELM_DAYSELECTOR_MON = 1;
  ELM_DAYSELECTOR_TUE = 2;
  ELM_DAYSELECTOR_WED = 3;
  ELM_DAYSELECTOR_THU = 4;
  ELM_DAYSELECTOR_FRI = 5;
  ELM_DAYSELECTOR_SAT = 6;
  ELM_DAYSELECTOR_MAX = 7;

procedure elm_dayselector_week_start_set(obj: PElm_Dayselector; day: TElm_Dayselector_Day); cdecl; external libelementary;
function elm_dayselector_week_start_get(obj: PElm_Dayselector): TElm_Dayselector_Day; cdecl; external libelementary;
procedure elm_dayselector_weekend_length_set(obj: PElm_Dayselector; length: dword); cdecl; external libelementary;
function elm_dayselector_weekend_length_get(obj: PElm_Dayselector): dword; cdecl; external libelementary;
procedure elm_dayselector_weekend_start_set(obj: PElm_Dayselector; day: TElm_Dayselector_Day); cdecl; external libelementary;
function elm_dayselector_weekend_start_get(obj: PElm_Dayselector): TElm_Dayselector_Day; cdecl; external libelementary;
procedure elm_dayselector_weekdays_names_set(obj: PElm_Dayselector; weekdays: PPchar); cdecl; external libelementary;
function elm_dayselector_weekdays_names_get(obj: PElm_Dayselector): PEina_List; cdecl; external libelementary;
procedure elm_dayselector_day_selected_set(obj: PElm_Dayselector; day: TElm_Dayselector_Day; selected: TEina_Bool); cdecl; external libelementary;
function elm_dayselector_day_selected_get(obj: PElm_Dayselector; day: TElm_Dayselector_Day): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 28-5-25 19:48:41 ===


implementation



end.
