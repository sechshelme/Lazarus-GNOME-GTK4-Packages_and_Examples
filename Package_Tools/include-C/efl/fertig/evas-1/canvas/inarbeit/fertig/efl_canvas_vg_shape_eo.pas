unit efl_canvas_vg_shape_eo;

interface

uses
  ctypes, elf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_VG_SHAPE_EO_H_}
{$define _EFL_CANVAS_VG_SHAPE_EO_H_}
{$ifndef _EFL_CANVAS_VG_SHAPE_EO_CLASS_TYPE}
{$define _EFL_CANVAS_VG_SHAPE_EO_CLASS_TYPE}
type
  PEfl_Canvas_Vg_Shape = ^TEfl_Canvas_Vg_Shape;
  TEfl_Canvas_Vg_Shape = TEo;
{$endif}
{$ifndef _EFL_CANVAS_VG_SHAPE_EO_TYPES}
{$define _EFL_CANVAS_VG_SHAPE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl vector graphics shape class
 *
 * @ingroup Efl_Canvas_Vg_Shape
  }

{ was #define dname def_expr }
function EFL_CANVAS_VG_SHAPE_CLASS : longint; { return type might be wrong }

function efl_canvas_vg_shape_class_get:PEfl_Class;cdecl;external libevas;
{*
 * @brief Fill of the shape object
 *
 * @param[in] obj The object.
 * @param[in] f Fill object
 *
 * @ingroup Efl_Canvas_Vg_Shape
  }
procedure efl_canvas_vg_shape_fill_set(obj:PEo; f:PEfl_Canvas_Vg_Node);cdecl;external libevas;
{*
 * @brief Fill of the shape object
 *
 * @param[in] obj The object.
 *
 * @return Fill object
 *
 * @ingroup Efl_Canvas_Vg_Shape
  }
function efl_canvas_vg_shape_fill_get(obj:PEo):PEfl_Canvas_Vg_Node;cdecl;external libevas;
{*
 * @brief Stroke fill of the shape object
 *
 * @param[in] obj The object.
 * @param[in] f Stroke fill object
 *
 * @ingroup Efl_Canvas_Vg_Shape
  }
procedure efl_canvas_vg_shape_stroke_fill_set(obj:PEo; f:PEfl_Canvas_Vg_Node);cdecl;external libevas;
{*
 * @brief Stroke fill of the shape object
 *
 * @param[in] obj The object.
 *
 * @return Stroke fill object
 *
 * @ingroup Efl_Canvas_Vg_Shape
  }
function efl_canvas_vg_shape_stroke_fill_get(obj:PEo):PEfl_Canvas_Vg_Node;cdecl;external libevas;
{*
 * @brief Stroke marker of the shape object
 *
 * @param[in] obj The object.
 * @param[in] m Stroke marker object
 *
 * @ingroup Efl_Canvas_Vg_Shape
  }
procedure efl_canvas_vg_shape_stroke_marker_set(obj:PEo; m:PEfl_Canvas_Vg_Node);cdecl;external libevas;
{*
 * @brief Stroke marker of the shape object
 *
 * @param[in] obj The object.
 *
 * @return Stroke marker object
 *
 * @ingroup Efl_Canvas_Vg_Shape
  }
function efl_canvas_vg_shape_stroke_marker_get(obj:PEo):PEfl_Canvas_Vg_Node;cdecl;external libevas;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

// === Konventiert am: 12-5-25 17:23:10 ===


implementation


{ was #define dname def_expr }
function EFL_CANVAS_VG_SHAPE_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VG_SHAPE_CLASS:=efl_canvas_vg_shape_class_get;
  end;


end.
