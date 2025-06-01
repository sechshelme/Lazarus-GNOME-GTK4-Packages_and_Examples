unit elm_widget_web;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Web_Data = record
    obj: PEvas_Object;
  end;
  PElm_Web_Data = ^TElm_Web_Data;

  TElm_Web_Callback_Proxy_Context = record
    name: pchar;
    obj: PEvas_Object;
  end;
  PElm_Web_Callback_Proxy_Context = ^TElm_Web_Callback_Proxy_Context;


  // === Konventiert am: 1-6-25 15:54:15 ===


implementation



end.
