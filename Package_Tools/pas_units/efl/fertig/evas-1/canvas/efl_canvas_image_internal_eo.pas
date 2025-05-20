unit efl_canvas_image_internal_eo;

interface

uses
  ctypes, efl,fp_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Image_Internal = ^TEfl_Canvas_Image_Internal;
  TEfl_Canvas_Image_Internal = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_IMAGE_INTERNAL_CLASS: PEfl_Class;

function efl_canvas_image_internal_class_get: PEfl_Class; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 15:36:13 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_IMAGE_INTERNAL_CLASS: PEfl_Class;
begin
  EFL_CANVAS_IMAGE_INTERNAL_CLASS := efl_canvas_image_internal_class_get;
end;
{$endif}


end.
