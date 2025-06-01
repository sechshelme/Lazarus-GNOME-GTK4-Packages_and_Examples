unit efl_ui_widget_scrollable_content_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Widget_Scrollable_Content = ^TEfl_Ui_Widget_Scrollable_Content;
  TEfl_Ui_Widget_Scrollable_Content = TEo;

function EFL_UI_WIDGET_SCROLLABLE_CONTENT_MIXIN: PEfl_Class;

function efl_ui_widget_scrollable_content_mixin_get: PEfl_Class; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_widget_scrollable_content_did_group_calc_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
{$endif}

function efl_ui_widget_scrollable_content_set(obj: PEo; content: PEfl_Canvas_Object): TEina_Bool; cdecl; external libelementary;
function efl_ui_widget_scrollable_content_get(obj: PEo): PEfl_Canvas_Object; cdecl; external libelementary;
procedure efl_ui_widget_scrollable_text_set(obj: PEo; text: pchar); cdecl; external libelementary;
function efl_ui_widget_scrollable_text_get(obj: PEo): pchar; cdecl; external libelementary;

var
  _EFL_UI_WIDGET_SCROLLABLE_CONTENT_EVENT_OPTIMAL_SIZE_CALC: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIDGET_SCROLLABLE_CONTENT_EVENT_OPTIMAL_SIZE_CALC: PEfl_Event_Description;

// === Konventiert am: 29-5-25 20:23:36 ===


implementation


function EFL_UI_WIDGET_SCROLLABLE_CONTENT_MIXIN: PEfl_Class;
begin
  EFL_UI_WIDGET_SCROLLABLE_CONTENT_MIXIN := efl_ui_widget_scrollable_content_mixin_get;
end;

function EFL_UI_WIDGET_SCROLLABLE_CONTENT_EVENT_OPTIMAL_SIZE_CALC: PEfl_Event_Description;
begin
  EFL_UI_WIDGET_SCROLLABLE_CONTENT_EVENT_OPTIMAL_SIZE_CALC := @(_EFL_UI_WIDGET_SCROLLABLE_CONTENT_EVENT_OPTIMAL_SIZE_CALC);
end;


end.
