unit efl_canvas_image_eo;

interface

uses
  ctypes, elf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Image = ^TEfl_Canvas_Image;
  TEfl_Canvas_Image = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_IMAGE_CLASS: PEfl_Class;

function efl_canvas_image_class_get: PEfl_Class; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 15:36:10 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_IMAGE_CLASS: PEfl_Class;
begin
  EFL_CANVAS_IMAGE_CLASS := efl_canvas_image_class_get;
end;
{$endif}


end.
