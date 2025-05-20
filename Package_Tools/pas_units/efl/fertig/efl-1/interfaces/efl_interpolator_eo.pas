unit efl_interpolator_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Interpolator = ^TEfl_Interpolator;
  TEfl_Interpolator = TEo;

function EFL_INTERPOLATOR_INTERFACE: PEfl_Class;

function efl_interpolator_interface_get: PEfl_Class; cdecl; external libefl;
function efl_interpolator_interpolate(obj: PEo; progress: double): double; cdecl; external libefl;

// === Konventiert am: 20-5-25 14:43:39 ===


implementation


function EFL_INTERPOLATOR_INTERFACE: PEfl_Class;
begin
  EFL_INTERPOLATOR_INTERFACE := efl_interpolator_interface_get;
end;


end.
