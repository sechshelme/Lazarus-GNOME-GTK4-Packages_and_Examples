
unit efl_canvas_polygon_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_polygon_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_polygon_eo.h
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
PEfl_Canvas_Polygon  = ^Efl_Canvas_Polygon;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_POLYGON_EO_H_}
{$define _EFL_CANVAS_POLYGON_EO_H_}
{$ifndef _EFL_CANVAS_POLYGON_EO_CLASS_TYPE}
{$define _EFL_CANVAS_POLYGON_EO_CLASS_TYPE}
type
  PEfl_Canvas_Polygon = ^TEfl_Canvas_Polygon;
  TEfl_Canvas_Polygon = TEo;
{$endif}
{$ifndef _EFL_CANVAS_POLYGON_EO_TYPES}
{$define _EFL_CANVAS_POLYGON_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Low-level polygon object
 *
 * @ingroup Efl_Canvas_Polygon
  }

{ was #define dname def_expr }
function EFL_CANVAS_POLYGON_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_polygon_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Adds the given point to the given evas polygon object.
 *
 * @param[in] obj The object.
 * @param[in] pos A point coordinate.
 *
 * @ingroup Efl_Canvas_Polygon
  }
procedure efl_canvas_polygon_point_add(obj:PEo; pos:TEina_Position2D);cdecl;external;
{* Removes all of the points from the given evas polygon object.
 *
 * @ingroup Efl_Canvas_Polygon
  }
procedure efl_canvas_polygon_points_clear(obj:PEo);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_POLYGON_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_POLYGON_CLASS:=efl_canvas_polygon_class_get;
  end;


end.
