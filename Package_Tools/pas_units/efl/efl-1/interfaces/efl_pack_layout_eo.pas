unit efl_pack_layout_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Pack_Layout = ^TEfl_Pack_Layout;
  TEfl_Pack_Layout = TEo;

function EFL_PACK_LAYOUT_INTERFACE: PEfl_Class;

function efl_pack_layout_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_pack_layout_request(obj: PEo); cdecl; external libefl;
procedure efl_pack_layout_update(obj: PEo); cdecl; external libefl;

var
  _EFL_PACK_EVENT_LAYOUT_UPDATED: TEfl_Event_Description; cvar;external libefl;

function EFL_PACK_EVENT_LAYOUT_UPDATED: PEfl_Event_Description;


// === Konventiert am: 20-5-25 14:43:46 ===


implementation


function EFL_PACK_LAYOUT_INTERFACE: PEfl_Class;
begin
  EFL_PACK_LAYOUT_INTERFACE := efl_pack_layout_interface_get;
end;

function EFL_PACK_EVENT_LAYOUT_UPDATED: PEfl_Event_Description;
begin
  EFL_PACK_EVENT_LAYOUT_UPDATED := @(_EFL_PACK_EVENT_LAYOUT_UPDATED);
end;


end.
