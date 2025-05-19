unit efl_pack_linear_eo;

interface

uses
  efl, fp_eo, fp_eina, efl_gfx_entity_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Pack_Linear = ^TEfl_Pack_Linear;
  TEfl_Pack_Linear = TEo;

function EFL_PACK_LINEAR_INTERFACE: PEfl_Class;

function efl_pack_linear_interface_get: PEfl_Class; cdecl; external libefl;
function efl_pack_begin(obj: PEo; subobj: PEfl_Gfx_Entity): TEina_Bool; cdecl; external libefl;
function efl_pack_end(obj: PEo; subobj: PEfl_Gfx_Entity): TEina_Bool; cdecl; external libefl;
function efl_pack_before(obj: PEo; subobj: PEfl_Gfx_Entity; existing: PEfl_Gfx_Entity): TEina_Bool; cdecl; external libefl;
function efl_pack_after(obj: PEo; subobj: PEfl_Gfx_Entity; existing: PEfl_Gfx_Entity): TEina_Bool; cdecl; external libefl;
function efl_pack_at(obj: PEo; subobj: PEfl_Gfx_Entity; index: longint): TEina_Bool; cdecl; external libefl;
function efl_pack_content_get(obj: PEo; index: longint): PEfl_Gfx_Entity; cdecl; external libefl;
function efl_pack_index_get(obj: PEo; subobj: PEfl_Gfx_Entity): longint; cdecl; external libefl;
function efl_pack_unpack_at(obj: PEo; index: longint): PEfl_Gfx_Entity; cdecl; external libefl;

// === Konventiert am: 19-5-25 19:23:30 ===


implementation


function EFL_PACK_LINEAR_INTERFACE: PEfl_Class;
begin
  EFL_PACK_LINEAR_INTERFACE := efl_pack_linear_interface_get;
end;


end.
