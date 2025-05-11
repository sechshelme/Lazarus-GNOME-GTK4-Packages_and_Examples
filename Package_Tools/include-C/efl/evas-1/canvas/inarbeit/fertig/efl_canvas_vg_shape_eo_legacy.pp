
unit efl_canvas_vg_shape_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_vg_shape_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_vg_shape_eo_legacy.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PEvas_Vg_Node  = ^Evas_Vg_Node;
PEvas_Vg_Shape  = ^Evas_Vg_Shape;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EVAS_VG_SHAPE_EO_LEGACY_H_}
{$define _EVAS_VG_SHAPE_EO_LEGACY_H_}
{$ifndef _EVAS_VG_SHAPE_EO_CLASS_TYPE}
{$define _EVAS_VG_SHAPE_EO_CLASS_TYPE}
type
  PEvas_Vg_Shape = ^TEvas_Vg_Shape;
  TEvas_Vg_Shape = TEo;
{$endif}
{$ifndef _EVAS_VG_SHAPE_EO_TYPES}
{$define _EVAS_VG_SHAPE_EO_TYPES}
{$endif}
{*
 * @defgroup Evas_Vg_Shape_Group Vector Graphics Shape Functions
 * @ingroup Evas_Object_Vg_Group
  }
{*
 * @brief Fill of the shape object.
 *
 * @param[in] obj The object.
 * @param[in] f The fill object.
 *
 * @since 1.24
 *
 * @ingroup Evas_Vg_Shape_Group
  }

procedure evas_vg_shape_fill_set(obj:PEvas_Vg_Shape; f:PEvas_Vg_Node);cdecl;external;
{*
 * @brief Fill of the shape object.
 *
 * @param[in] obj The object.
 * @return The fill object.
 *
 * @since 1.24
 *
 * @ingroup Evas_Vg_Shape_Group
  }
(* Const before type ignored *)
function evas_vg_shape_fill_get(obj:PEvas_Vg_Shape):PEvas_Vg_Node;cdecl;external;
{*
 * @brief Stroke fill of the shape object.
 *
 * @param[in] obj The object.
 * @param[in] f The stroke fill object.
 *
 * @since 1.24
 *
 * @ingroup Evas_Vg_Shape_Group
  }
procedure evas_vg_shape_stroke_fill_set(obj:PEvas_Vg_Shape; f:PEvas_Vg_Node);cdecl;external;
{*
 * @brief Stroke fill of the shape object.
 *
 * @param[in] obj The object.
 * @return The stroke fill object.
 *
 * @since 1.24
 *
 * @ingroup Evas_Vg_Shape_Group
  }
(* Const before type ignored *)
function evas_vg_shape_stroke_fill_get(obj:PEvas_Vg_Shape):PEvas_Vg_Node;cdecl;external;
{*
 * @brief Stroke marker of the shape object
 *
 * @param[in] obj The object.
 * @param[in] m Stroke marker object
 *
 * @since 1.24
 *
 * @ingroup Evas_Vg_Shape_Group
  }
procedure evas_vg_shape_stroke_marker_set(obj:PEvas_Vg_Shape; m:PEvas_Vg_Node);cdecl;external;
{*
 * @brief Stroke marker of the shape object
 *
 * @param[in] obj The object.
 * @return Stroke marker object
 *
 * @since 1.24
 *
 * @ingroup Evas_Vg_Shape_Group
  }
(* Const before type ignored *)
function evas_vg_shape_stroke_marker_get(obj:PEvas_Vg_Shape):PEvas_Vg_Node;cdecl;external;
{$endif}

implementation


end.
