unit efl_gfx_gradient_radial_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Gfx_Gradient_Radial = ^TEfl_Gfx_Gradient_Radial;
  TEfl_Gfx_Gradient_Radial = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_GRADIENT_RADIAL_INTERFACE: PEfl_Class;

function efl_gfx_gradient_radial_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_gradient_radial_center_set(obj: PEo; x: double; y: double); cdecl; external libefl;
procedure efl_gfx_gradient_radial_center_get(obj: PEo; x: Pdouble; y: Pdouble); cdecl; external libefl;
procedure efl_gfx_gradient_radial_radius_set(obj: PEo; r: double); cdecl; external libefl;
function efl_gfx_gradient_radial_radius_get(obj: PEo): double; cdecl; external libefl;
procedure efl_gfx_gradient_radial_focal_set(obj: PEo; x: double; y: double); cdecl; external libefl;
procedure efl_gfx_gradient_radial_focal_get(obj: PEo; x: Pdouble; y: Pdouble); cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 13:30:29 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_GRADIENT_RADIAL_INTERFACE: PEfl_Class;
begin
  EFL_GFX_GRADIENT_RADIAL_INTERFACE := efl_gfx_gradient_radial_interface_get;
end;
{$endif}


end.
