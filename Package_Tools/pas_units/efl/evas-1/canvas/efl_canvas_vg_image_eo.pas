unit efl_canvas_vg_image_eo;

interface

uses
  ctypes, efl, eina_rectangle;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Vg_Image = ^TEfl_Canvas_Vg_Image;
  TEfl_Canvas_Vg_Image = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_IMAGE_CLASS: PEfl_Class;

function efl_canvas_vg_image_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_canvas_vg_image_data_set(obj: PEo; pixels: pointer; size: TEina_Size2D); cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 15:27:37 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_VG_IMAGE_CLASS: PEfl_Class;
begin
  EFL_CANVAS_VG_IMAGE_CLASS := efl_canvas_vg_image_class_get;
end;
{$endif}


end.
