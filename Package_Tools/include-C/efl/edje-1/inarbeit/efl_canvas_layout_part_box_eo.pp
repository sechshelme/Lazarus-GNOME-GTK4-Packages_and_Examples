
unit efl_canvas_layout_part_box_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_layout_part_box_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_layout_part_box_eo.h
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
PEfl_Canvas_Layout_Part_Box  = ^Efl_Canvas_Layout_Part_Box;
PEfl_Class  = ^Efl_Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_LAYOUT_PART_BOX_EO_H_}
{$define _EFL_CANVAS_LAYOUT_PART_BOX_EO_H_}
{$ifndef _EFL_CANVAS_LAYOUT_PART_BOX_EO_CLASS_TYPE}
{$define _EFL_CANVAS_LAYOUT_PART_BOX_EO_CLASS_TYPE}
type
  PEfl_Canvas_Layout_Part_Box = ^TEfl_Canvas_Layout_Part_Box;
  TEfl_Canvas_Layout_Part_Box = TEo;
{$endif}
{$ifndef _EFL_CANVAS_LAYOUT_PART_BOX_EO_TYPES}
{$define _EFL_CANVAS_LAYOUT_PART_BOX_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Represents a Box created as part of a layout.
 *
 * Its lifetime is limited to one function call only, unless an extra reference
 * is explicitly held.
 *
 * @ingroup Efl_Canvas_Layout_Part_Box
  }

{ was #define dname def_expr }
function EFL_CANVAS_LAYOUT_PART_BOX_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_layout_part_box_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_LAYOUT_PART_BOX_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_LAYOUT_PART_BOX_CLASS:=efl_canvas_layout_part_box_class_get;
  end;


end.
