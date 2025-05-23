unit efl_canvas_layout_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Layout = ^TEfl_Canvas_Layout;
  TEfl_Canvas_Layout = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_CLASS: PEfl_Class;

function efl_canvas_layout_class_get: PEfl_Class; cdecl; external libedje;
procedure efl_canvas_layout_animated_set(obj: PEo; on: TEina_Bool); cdecl; external libedje;
function efl_canvas_layout_animated_get(obj: PEo): TEina_Bool; cdecl; external libedje;
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_layout_access_part_iterate(obj: PEo): PEina_Iterator; cdecl; external libedje;
{$endif}

function efl_canvas_layout_seat_get(obj: PEo; name: PEina_Stringshare): PEfl_Input_Device; cdecl; external libedje;
function efl_canvas_layout_seat_name_get(obj: PEo; device: PEfl_Input_Device): PEina_Stringshare; cdecl; external libedje;
function efl_canvas_layout_load_error_get(obj: PEo): TEina_Error; cdecl; external libedje;
function efl_canvas_layout_content_remove(obj: PEo; content: PEfl_Gfx_Entity): TEina_Bool; cdecl; external libedje;
{$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_LAYOUT_EVENT_PART_INVALID: TEfl_Event_Description; cvar;external libedje;

function EFL_LAYOUT_EVENT_PART_INVALID: PEfl_Event_Description;
{$endif}

{$endif}

// === Konventiert am: 22-5-25 19:40:55 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_CLASS: PEfl_Class;
begin
  EFL_CANVAS_LAYOUT_CLASS := efl_canvas_layout_class_get;
end;

function EFL_LAYOUT_EVENT_PART_INVALID: PEfl_Event_Description;
begin
  EFL_LAYOUT_EVENT_PART_INVALID := @(_EFL_LAYOUT_EVENT_PART_INVALID);
end;
{$endif}


end.
