unit elm_widget_calendar;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PDay_Color = ^TDay_Color;
  TDay_Color = longint;

const
  DAY_WEEKDAY = 0;
  DAY_SATURDAY = 1;
  DAY_SUNDAY = 2;

type
  PElm_Calendar_Data = ^TElm_Calendar_Data;
  TElm_Calendar_Data = record
  end;



  // === Konventiert am: 1-6-25 15:41:15 ===


implementation



end.
