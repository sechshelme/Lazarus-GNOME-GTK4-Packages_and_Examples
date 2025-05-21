unit efl_filter_model_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Filter_Model = ^TEfl_Filter_Model;
  TEfl_Filter_Model = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEflFilterModel = ^TEflFilterModel;
  TEflFilterModel = function(data: pointer; parent: PEfl_Filter_Model; child: PEfl_Model): PEina_Future; cdecl;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_FILTER_MODEL_CLASS: PEfl_Class;

function efl_filter_model_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_filter_model_filter_set(obj: PEo; filter_data: pointer; filter: TEflFilterModel; filter_free_cb: TEina_Free_Cb); cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 17:02:49 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_FILTER_MODEL_CLASS: PEfl_Class;
begin
  EFL_FILTER_MODEL_CLASS := efl_filter_model_class_get;
end;
{$endif}


end.
