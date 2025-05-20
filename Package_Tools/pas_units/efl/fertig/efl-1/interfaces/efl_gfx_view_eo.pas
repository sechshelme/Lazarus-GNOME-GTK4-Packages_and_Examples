unit efl_gfx_view_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Gfx_View = ^TEfl_Gfx_View;
  TEfl_Gfx_View = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_VIEW_INTERFACE: PEfl_Class;

function efl_gfx_view_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_view_size_set(obj: PEo; size: TEina_Size2D); cdecl; external libefl;
function efl_gfx_view_size_get(obj: PEo): TEina_Size2D; cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 13:30:38 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_VIEW_INTERFACE: PEfl_Class;
begin
  EFL_GFX_VIEW_INTERFACE := efl_gfx_view_interface_get;
end;
{$endif}


end.
