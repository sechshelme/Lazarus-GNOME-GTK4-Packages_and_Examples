unit elm_widget_hover;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TContent_Info = record
    swallow: pchar;
    obj: PEvas_Object;
  end;
  PContent_Info = ^TContent_Info;

var
  _content_aliases: array[0..9] of TElm_Layout_Part_Alias_Description; cvar;external libelementary;

type
  PElm_Hover_Data = ^TElm_Hover_Data;
  TElm_Hover_Data = record
  end;


  // === Konventiert am: 1-6-25 15:41:31 ===


implementation

end.
