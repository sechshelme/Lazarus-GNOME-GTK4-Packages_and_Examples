unit efl_part_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Part = ^TEfl_Part;
  TEfl_Part = TEo;

function EFL_PART_INTERFACE: PEfl_Class;

function efl_part_interface_get: PEfl_Class; cdecl; external libefl;
function efl_part_get(obj: PEo; name: pchar): PEfl_Object; cdecl; external libefl;

// === Konventiert am: 20-5-25 14:43:49 ===


implementation


function EFL_PART_INTERFACE: PEfl_Class;
begin
  EFL_PART_INTERFACE := efl_part_interface_get;
end;


end.
