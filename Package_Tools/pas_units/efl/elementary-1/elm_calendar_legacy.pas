unit elm_calendar_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_calendar_eo_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_calendar_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_calendar_mark_del(mark: PElm_Calendar_Mark); cdecl; external libelementary;
procedure elm_calendar_min_max_year_set(obj: PElm_Calendar; min: longint; max: longint); cdecl; external libelementary;
procedure elm_calendar_min_max_year_get(obj: PElm_Calendar; min: Plongint; max: Plongint); cdecl; external libelementary;

// === Konventiert am: 26-5-25 19:44:23 ===


implementation



end.
