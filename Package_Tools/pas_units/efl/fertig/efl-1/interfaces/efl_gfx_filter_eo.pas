unit efl_gfx_filter_eo;

interface

uses
  efl, fp_eo, fp_eina, efl_gfx_entity_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Gfx_Filter = ^TEfl_Gfx_Filter;
  TEfl_Gfx_Filter = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_FILTER_INTERFACE: PEfl_Class;

function efl_gfx_filter_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_filter_program_set(obj: PEo; code: pchar; name: pchar); cdecl; external libefl;
procedure efl_gfx_filter_program_get(obj: PEo; code: PPchar; name: PPchar); cdecl; external libefl;
procedure efl_gfx_filter_state_set(obj: PEo; cur_state: pchar; cur_val: double; next_state: pchar; next_val: double; pos: double); cdecl; external libefl;
procedure efl_gfx_filter_state_get(obj: PEo; cur_state: PPchar; cur_val: Pdouble; next_state: PPchar; next_val: Pdouble; pos: Pdouble); cdecl; external libefl;
procedure efl_gfx_filter_padding_get(obj: PEo; l: Plongint; r: Plongint; t: Plongint; b: Plongint); cdecl; external libefl;
procedure efl_gfx_filter_source_set(obj: PEo; name: pchar; source: PEfl_Gfx_Entity); cdecl; external libefl;
function efl_gfx_filter_source_get(obj: PEo; name: pchar): PEfl_Gfx_Entity; cdecl; external libefl;
procedure efl_gfx_filter_data_set(obj: PEo; name: pchar; value: pchar; execute: TEina_Bool); cdecl; external libefl;
procedure efl_gfx_filter_data_get(obj: PEo; name: pchar; value: PPchar; execute: PEina_Bool); cdecl; external libefl;
{$endif}

// === Konventiert am: 19-5-25 19:23:20 ===


implementation


function EFL_GFX_FILTER_INTERFACE: PEfl_Class;
begin
  EFL_GFX_FILTER_INTERFACE := efl_gfx_filter_interface_get;
end;


end.
