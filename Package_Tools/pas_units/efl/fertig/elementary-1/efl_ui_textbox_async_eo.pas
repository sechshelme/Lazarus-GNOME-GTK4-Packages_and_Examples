unit efl_ui_textbox_async_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Textbox_Async = ^TEfl_Ui_Textbox_Async;
  TEfl_Ui_Textbox_Async = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TEXTBOX_ASYNC_CLASS: PEfl_Class;

function efl_ui_textbox_async_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 19:14:05 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TEXTBOX_ASYNC_CLASS: PEfl_Class;
begin
  EFL_UI_TEXTBOX_ASYNC_CLASS := efl_ui_textbox_async_class_get;
end;
{$endif}


end.
