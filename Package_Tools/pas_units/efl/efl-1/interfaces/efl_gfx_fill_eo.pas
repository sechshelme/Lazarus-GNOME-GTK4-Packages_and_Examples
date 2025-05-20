unit efl_gfx_fill_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Gfx_Fill = ^TEfl_Gfx_Fill;
  TEfl_Gfx_Fill = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_FILL_INTERFACE: PEfl_Class;

function efl_gfx_fill_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_fill_auto_set(obj: PEo; filled: TEina_Bool); cdecl; external libefl;
function efl_gfx_fill_auto_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_gfx_fill_set(obj: PEo; fill: TEina_Rect); cdecl; external libefl;
function efl_gfx_fill_get(obj: PEo): TEina_Rect; cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 13:05:32 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_FILL_INTERFACE: PEfl_Class;
begin
  EFL_GFX_FILL_INTERFACE := efl_gfx_fill_interface_get;
end;
{$endif}


end.
