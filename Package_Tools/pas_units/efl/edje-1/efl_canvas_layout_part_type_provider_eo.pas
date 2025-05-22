unit efl_canvas_layout_part_type_provider_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, efl_canvas_layout_types_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Layout_Part_Type_Provider = ^TEfl_Canvas_Layout_Part_Type_Provider;
  TEfl_Canvas_Layout_Part_Type_Provider = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_PART_TYPE_PROVIDER_INTERFACE: PEfl_Class;

function efl_canvas_layout_part_type_provider_interface_get: PEfl_Class; cdecl; external libedje;
function efl_canvas_layout_part_type_get(obj: PEo): TEfl_Canvas_Layout_Part_Type; cdecl; external libedje;
{$endif}

// === Konventiert am: 22-5-25 19:56:36 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_PART_TYPE_PROVIDER_INTERFACE: PEfl_Class;
begin
  EFL_CANVAS_LAYOUT_PART_TYPE_PROVIDER_INTERFACE := efl_canvas_layout_part_type_provider_interface_get;
end;
{$endif}


end.
