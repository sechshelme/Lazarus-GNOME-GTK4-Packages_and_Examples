unit efl_ui_spotlight_indicator_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, efl_ui_spotlight_manager_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Spotlight_Indicator = ^TEfl_Ui_Spotlight_Indicator;
  TEfl_Ui_Spotlight_Indicator = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SPOTLIGHT_INDICATOR_CLASS: PEfl_Class;

function efl_ui_spotlight_indicator_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_spotlight_indicator_bind(obj: PEo; spotlight: PEfl_Ui_Spotlight_Container); cdecl; external libelementary;
procedure efl_ui_spotlight_indicator_content_add(obj: PEo; subobj: PEfl_Gfx_Entity; index: longint); cdecl; external libelementary;
procedure efl_ui_spotlight_indicator_content_del(obj: PEo; subobj: PEfl_Gfx_Entity; index: longint); cdecl; external libelementary;
procedure efl_ui_spotlight_indicator_position_update(obj: PEo; position: double); cdecl; external libelementary;
{$endif}

// === Konventiert am: 27-5-25 19:41:25 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SPOTLIGHT_INDICATOR_CLASS: PEfl_Class;
begin
  EFL_UI_SPOTLIGHT_INDICATOR_CLASS := efl_ui_spotlight_indicator_class_get;
end;
{$endif}


end.
