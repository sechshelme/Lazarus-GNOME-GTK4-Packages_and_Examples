
unit efl_canvas_layout_part_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_layout_part_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_layout_part_eo.h
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
Pchar  = ^char;
Pdouble  = ^double;
PEfl_Canvas_Layout_Part  = ^Efl_Canvas_Layout_Part;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_LAYOUT_PART_EO_H_}
{$define _EFL_CANVAS_LAYOUT_PART_EO_H_}
{$ifndef _EFL_CANVAS_LAYOUT_PART_EO_CLASS_TYPE}
{$define _EFL_CANVAS_LAYOUT_PART_EO_CLASS_TYPE}
type
  PEfl_Canvas_Layout_Part = ^TEfl_Canvas_Layout_Part;
  TEfl_Canvas_Layout_Part = TEo;
{$endif}
{$ifndef _EFL_CANVAS_LAYOUT_PART_EO_TYPES}
{$define _EFL_CANVAS_LAYOUT_PART_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Common class for part proxy objects for @ref Efl_Canvas_Layout.
 *
 * As an @ref Efl_Part implementation class, all objects of this class are
 * meant to be used for one and only one function call. In pseudo-code, the use
 * of object of this type looks like the following: rect =
 * layout.part("somepart").geometry_get();
 *
 * @ingroup Efl_Canvas_Layout_Part
  }

{ was #define dname def_expr }
function EFL_CANVAS_LAYOUT_PART_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_layout_part_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The name and value of the current state of this part (read-only).
 *
 * This is the state name as it appears in EDC description blocks. A state has
 * both a name and a value (double). The default state is "default" 0.0, but
 * this function will return "" if the part is invalid.
 *
 * @param[in] obj The object.
 * @param[out] state The name of the state.
 * @param[out] val The value of the state.
 *
 * @ingroup Efl_Canvas_Layout_Part
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_canvas_layout_part_state_get(obj:PEo; state:PPchar; val:Pdouble);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_LAYOUT_PART_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_LAYOUT_PART_CLASS:=efl_canvas_layout_part_class_get;
  end;


end.
