unit efl_playable_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Playable = ^TEfl_Playable;
  TEfl_Playable = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_PLAYABLE_INTERFACE: PEfl_Class;

function efl_playable_interface_get: PEfl_Class; cdecl; external libefl;
function efl_playable_length_get(obj: PEo): double; cdecl; external libefl;
function efl_playable_get(obj: PEo): TEina_Bool; cdecl; external libefl;
function efl_playable_seekable_get(obj: PEo): TEina_Bool; cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 15:00:04 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_PLAYABLE_INTERFACE: PEfl_Class;
begin
  EFL_PLAYABLE_INTERFACE := efl_playable_interface_get;
end;
{$endif}


end.
