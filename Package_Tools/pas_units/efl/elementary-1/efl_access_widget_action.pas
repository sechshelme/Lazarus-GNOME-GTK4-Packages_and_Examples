unit efl_access_widget_action;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Access_Action_Data = record
    name: pchar;
    action: pchar;
    param: pchar;
    func: function(obj: PEvas_Object; params: pchar): TEina_Bool; cdecl;
  end;
  PEfl_Access_Action_Data = ^TEfl_Access_Action_Data;
  {$endif}

  // === Konventiert am: 31-5-25 13:24:28 ===


implementation



end.
