unit efl_gfx_gradient_linear_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Gfx_Gradient_Linear = ^TEfl_Gfx_Gradient_Linear;
  TEfl_Gfx_Gradient_Linear = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_GRADIENT_LINEAR_INTERFACE: PEfl_Class;

function efl_gfx_gradient_linear_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_gradient_linear_start_set(obj: PEo; x: double; y: double); cdecl; external libefl;
procedure efl_gfx_gradient_linear_start_get(obj: PEo; x: Pdouble; y: Pdouble); cdecl; external libefl;
procedure efl_gfx_gradient_linear_end_set(obj: PEo; x: double; y: double); cdecl; external libefl;
procedure efl_gfx_gradient_linear_end_get(obj: PEo; x: Pdouble; y: Pdouble); cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 13:48:00 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_GRADIENT_LINEAR_INTERFACE: PEfl_Class;
begin
  EFL_GFX_GRADIENT_LINEAR_INTERFACE := efl_gfx_gradient_linear_interface_get;
end;
{$endif}


end.
