unit efl_container_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Container = ^TEfl_Container;
  TEfl_Container = TEo;

function EFL_CONTAINER_INTERFACE: PEfl_Class;

function efl_container_interface_get: PEfl_Class; cdecl; external libefl;
function efl_content_iterate(obj: PEo): PEina_Iterator; cdecl; external libefl;
function efl_content_count(obj: PEo): longint; cdecl; external libefl;

var
  _EFL_CONTAINER_EVENT_CONTENT_ADDED: TEfl_Event_Description; cvar;external libefl;
  _EFL_CONTAINER_EVENT_CONTENT_REMOVED: TEfl_Event_Description; cvar;external libefl;

function EFL_CONTAINER_EVENT_CONTENT_ADDED: PEfl_Event_Description;
function EFL_CONTAINER_EVENT_CONTENT_REMOVED: PEfl_Event_Description;

// === Konventiert am: 20-5-25 14:43:33 ===


implementation


function EFL_CONTAINER_INTERFACE: PEfl_Class;
begin
  EFL_CONTAINER_INTERFACE := efl_container_interface_get;
end;

function EFL_CONTAINER_EVENT_CONTENT_ADDED: PEfl_Event_Description;
begin
  EFL_CONTAINER_EVENT_CONTENT_ADDED := @(_EFL_CONTAINER_EVENT_CONTENT_ADDED);
end;

function EFL_CONTAINER_EVENT_CONTENT_REMOVED: PEfl_Event_Description;
begin
  EFL_CONTAINER_EVENT_CONTENT_REMOVED := @(_EFL_CONTAINER_EVENT_CONTENT_REMOVED);
end;


end.
