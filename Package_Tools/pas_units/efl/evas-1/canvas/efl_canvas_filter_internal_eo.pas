unit efl_canvas_filter_internal_eo;

interface

uses
  ctypes, efl, eina_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Filter_Internal = ^TEfl_Canvas_Filter_Internal;
  TEfl_Canvas_Filter_Internal = TEo;
  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Gfx_Color32 = record
    r: uint8;
    g: uint8;
    b: uint8;
    a: uint8;
  end;
  PEfl_Gfx_Color32 = ^TEfl_Gfx_Color32;
  {$endif}
  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Canvas_Filter_State_Name = record
    name: pchar;
    value: double;
  end;
  PEfl_Canvas_Filter_State_Name = ^TEfl_Canvas_Filter_State_Name;
  {$endif}
  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Canvas_Filter_State_Text = record
    outline: TEfl_Gfx_Color32;
    shadow: TEfl_Gfx_Color32;
    glow: TEfl_Gfx_Color32;
    glow2: TEfl_Gfx_Color32;
  end;
  PEfl_Canvas_Filter_State_Text = ^TEfl_Canvas_Filter_State_Text;
  {$endif}
  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Canvas_Filter_State = record
    text: TEfl_Canvas_Filter_State_Text;
    color: TEfl_Gfx_Color32;
    cur: TEfl_Canvas_Filter_State_Name;
    next: TEfl_Canvas_Filter_State_Name;
    w: longint;
    h: longint;
    scale: double;
    pos: double;
  end;
  PEfl_Canvas_Filter_State = ^TEfl_Canvas_Filter_State;
  {$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_FILTER_INTERNAL_MIXIN: PEfl_Class;

function efl_canvas_filter_internal_mixin_get: PEfl_Class; cdecl; external libevas;
procedure evas_filter_changed_set(obj: PEo; val: TEina_Bool); cdecl; external libevas;
procedure evas_filter_invalid_set(obj: PEo; val: TEina_Bool); cdecl; external libevas;
function evas_filter_input_alpha(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure evas_filter_state_prepare(obj: PEo; state: PEfl_Canvas_Filter_State; data: pointer); cdecl; external libevas;
function evas_filter_input_render(obj: PEo; filter: pointer; engine: pointer; output: pointer; drawctx: pointer;
  data: pointer; l: longint; r: longint; t: longint; b: longint;
  x: longint; y: longint; do_async: TEina_Bool): TEina_Bool; cdecl; external libevas;
procedure evas_filter_dirty(obj: PEo); cdecl; external libevas;
function evas_filter_output_buffer_get(obj: PEo): pointer; cdecl; external libevas;
{$endif}

// === Konventiert am: 13-5-25 19:18:06 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_FILTER_INTERNAL_MIXIN: PEfl_Class;
begin
  EFL_CANVAS_FILTER_INTERNAL_MIXIN := efl_canvas_filter_internal_mixin_get;
end;
{$endif}


end.
