unit fp_efl_canvas_wl;

interface

uses
  efl,
  fp_eina,
  fp_eo,
  fp_evas,
  fp_ecore;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
  {$include efl-canvas-wl-1/Efl_Canvas_Wl.inc}
  {$include efl-canvas-wl-1/efl_canvas_wl_surface_eo.inc}
  {$include efl-canvas-wl-1/efl_canvas_wl_eo.inc}
{$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
  {$include efl-canvas-wl-1/Efl_Canvas_Wl.inc}
  {$include efl-canvas-wl-1/efl_canvas_wl_surface_eo.inc}
  {$include efl-canvas-wl-1/efl_canvas_wl_eo.inc}
{$UNDEF read_implementation}

end.

