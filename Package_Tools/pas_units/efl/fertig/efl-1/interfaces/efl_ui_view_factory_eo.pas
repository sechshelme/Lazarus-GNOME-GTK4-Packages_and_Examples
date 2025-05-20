unit efl_ui_view_factory_eo;

interface

uses
  efl, fp_eo, fp_eina, efl_ui_factory_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_View_Factory = ^TEfl_Ui_View_Factory;
  TEfl_Ui_View_Factory = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_VIEW_FACTORY_CLASS: PEfl_Class;

function efl_ui_view_factory_class_get: PEfl_Class; cdecl; external libefl;
function efl_ui_view_factory_create_with_event(factory: PEfl_Ui_Factory; models: PEina_Iterator): PEina_Future; cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 14:44:06 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_VIEW_FACTORY_CLASS: PEfl_Class;
begin
  EFL_UI_VIEW_FACTORY_CLASS := efl_ui_view_factory_class_get;
end;
{$endif}


end.
