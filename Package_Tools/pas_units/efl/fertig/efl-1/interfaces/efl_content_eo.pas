unit efl_content_eo;

interface

uses
  efl, fp_eo, fp_eina, efl_gfx_entity_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Content = ^TEfl_Content;
  TEfl_Content = TEo;

function EFL_CONTENT_INTERFACE: PEfl_Class;

function efl_content_interface_get: PEfl_Class; cdecl; external libefl;
function efl_content_set(obj: PEo; content: PEfl_Gfx_Entity): TEina_Bool; cdecl; external libefl;
function efl_content_get(obj: PEo): PEfl_Gfx_Entity; cdecl; external libefl;
function efl_content_unset(obj: PEo): PEfl_Gfx_Entity; cdecl; external libefl;

var
  _EFL_CONTENT_EVENT_CONTENT_CHANGED: TEfl_Event_Description; cvar;external libefl;

function EFL_CONTENT_EVENT_CONTENT_CHANGED: PEfl_Event_Description;


// === Konventiert am: 20-5-25 13:30:24 ===


implementation


function EFL_CONTENT_INTERFACE: PEfl_Class;
begin
  EFL_CONTENT_INTERFACE := efl_content_interface_get;
end;

function EFL_CONTENT_EVENT_CONTENT_CHANGED: PEfl_Event_Description;
begin
  EFL_CONTENT_EVENT_CONTENT_CHANGED := @(_EFL_CONTENT_EVENT_CONTENT_CHANGED);
end;


end.
