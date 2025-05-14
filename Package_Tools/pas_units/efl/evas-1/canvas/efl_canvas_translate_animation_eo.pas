unit efl_canvas_translate_animation_eo;

interface

uses
  ctypes, elf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Translate_Animation = ^TEfl_Canvas_Translate_Animation;
  TEfl_Canvas_Translate_Animation = TEo;

function EFL_CANVAS_TRANSLATE_ANIMATION_CLASS: PEfl_Class;

function efl_canvas_translate_animation_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_animation_translate_set(obj: PEo; from: TEina_Position2D; to_: TEina_Position2D); cdecl; external libevas;
procedure efl_animation_translate_get(obj: PEo; from: PEina_Position2D; to_: PEina_Position2D); cdecl; external libevas;
procedure efl_animation_translate_absolute_set(obj: PEo; from: TEina_Position2D; to_: TEina_Position2D); cdecl; external libevas;
procedure efl_animation_translate_absolute_get(obj: PEo; from: PEina_Position2D; to_: PEina_Position2D); cdecl; external libevas;

// === Konventiert am: 14-5-25 15:08:51 ===


implementation


function EFL_CANVAS_TRANSLATE_ANIMATION_CLASS: PEfl_Class;
begin
  EFL_CANVAS_TRANSLATE_ANIMATION_CLASS := efl_canvas_translate_animation_class_get;
end;


end.
