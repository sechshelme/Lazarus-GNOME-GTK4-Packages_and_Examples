unit efl_canvas_vg_gradient_eo_legacy;

interface

uses
  ctypes, elf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEvas_Vg_Gradient = ^TEvas_Vg_Gradient;
  TEvas_Vg_Gradient = TEo;

  PEvas_Vg_Gradient_Linear = ^TEvas_Vg_Gradient_Linear;
  TEvas_Vg_Gradient_Linear = TEo;

  PEvas_Vg_Gradient_Radial = ^TEvas_Vg_Gradient_Radial;
  TEvas_Vg_Gradient_Radial = TEo;

  // === Konventiert am: 11-5-25 15:39:37 ===


implementation



end.
