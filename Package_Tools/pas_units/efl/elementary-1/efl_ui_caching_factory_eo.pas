unit efl_ui_caching_factory_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Caching_Factory = ^TEfl_Ui_Caching_Factory;
  TEfl_Ui_Caching_Factory = TEo;

function EFL_UI_CACHING_FACTORY_CLASS: PEfl_Config;

function efl_ui_caching_factory_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_caching_factory_memory_limit_set(obj: PEo; limit: dword); cdecl; external libelementary;
function efl_ui_caching_factory_memory_limit_get(obj: PEo): dword; cdecl; external libelementary;
procedure efl_ui_caching_factory_items_limit_set(obj: PEo; limit: dword); cdecl; external libelementary;
function efl_ui_caching_factory_items_limit_get(obj: PEo): dword; cdecl; external libelementary;

// === Konventiert am: 30-5-25 17:54:42 ===


implementation


function EFL_UI_CACHING_FACTORY_CLASS: PEfl_Config;
begin
  EFL_UI_CACHING_FACTORY_CLASS := efl_ui_caching_factory_class_get;
end;


end.
