unit efl_canvas_proxy_eo;

interface

uses
  ctypes, efl, Evas_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Proxy = ^TEfl_Canvas_Proxy;
  TEfl_Canvas_Proxy = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_PROXY_CLASS: PEfl_Class;

function efl_canvas_proxy_class_get: PEfl_Class; cdecl; external libevas;
function efl_canvas_proxy_source_set(obj: PEo; src: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;
function efl_canvas_proxy_source_get(obj: PEo): PEfl_Canvas_Object; cdecl; external libevas;
procedure efl_canvas_proxy_source_clip_set(obj: PEo; source_clip: TEina_Bool); cdecl; external libevas;
function efl_canvas_proxy_source_clip_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_canvas_proxy_source_events_set(obj: PEo; _repeat: TEina_Bool); cdecl; external libevas;
function efl_canvas_proxy_source_events_get(obj: PEo): TEina_Bool; cdecl; external libevas;
{$endif}

// === Konventiert am: 13-5-25 19:43:54 ===


implementation


function EFL_CANVAS_PROXY_CLASS: PEfl_Class;
begin
  EFL_CANVAS_PROXY_CLASS := efl_canvas_proxy_class_get;
end;


end.
