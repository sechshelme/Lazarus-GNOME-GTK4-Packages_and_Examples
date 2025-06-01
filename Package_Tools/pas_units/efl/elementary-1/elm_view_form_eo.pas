unit elm_view_form_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_View_Form = ^TElm_View_Form;
  TElm_View_Form = TEo;

function ELM_VIEW_FORM_CLASS: PEfl_Class;

function elm_view_form_class_get: PEfl_Class; cdecl; external libelementary;
procedure elm_view_form_model_set(obj: PEo; model: PEfl_Model); cdecl; external libelementary;
procedure elm_view_form_widget_add(obj: PEo; propname: pchar; evas: PEfl_Canvas_Object); cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:28:41 ===


implementation


function ELM_VIEW_FORM_CLASS: PEfl_Class;
begin
  ELM_VIEW_FORM_CLASS := elm_view_form_class_get;
end;


end.
