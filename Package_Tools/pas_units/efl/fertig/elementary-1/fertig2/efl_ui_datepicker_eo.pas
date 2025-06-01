unit efl_ui_datepicker_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Datepicker = ^TEfl_Ui_Datepicker;
  TEfl_Ui_Datepicker = TEo;

function EFL_UI_DATEPICKER_CLASS: PEfl_Class;

function efl_ui_datepicker_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_datepicker_date_min_set(obj: PEo; year: longint; month: longint; day: longint); cdecl; external libelementary;
procedure efl_ui_datepicker_date_min_get(obj: PEo; year: Plongint; month: Plongint; day: Plongint); cdecl; external libelementary;
procedure efl_ui_datepicker_date_max_set(obj: PEo; year: longint; month: longint; day: longint); cdecl; external libelementary;
procedure efl_ui_datepicker_date_max_get(obj: PEo; year: Plongint; month: Plongint; day: Plongint); cdecl; external libelementary;
procedure efl_ui_datepicker_date_set(obj: PEo; year: longint; month: longint; day: longint); cdecl; external libelementary;
procedure efl_ui_datepicker_date_get(obj: PEo; year: Plongint; month: Plongint; day: Plongint); cdecl; external libelementary;

var
  _EFL_UI_DATEPICKER_EVENT_DATE_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_DATEPICKER_EVENT_DATE_CHANGED: PEfl_Event_Description;


// === Konventiert am: 30-5-25 13:11:35 ===


implementation


function EFL_UI_DATEPICKER_CLASS: PEfl_Class;
begin
  EFL_UI_DATEPICKER_CLASS := efl_ui_datepicker_class_get;
end;

function EFL_UI_DATEPICKER_EVENT_DATE_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_DATEPICKER_EVENT_DATE_CHANGED := @(_EFL_UI_DATEPICKER_EVENT_DATE_CHANGED);
end;


end.
