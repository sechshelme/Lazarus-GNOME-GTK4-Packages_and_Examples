
unit efl_canvas_layout_part_swallow_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_layout_part_swallow_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_layout_part_swallow_eo.h
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
PEfl_Canvas_Layout_Part_Swallow  = ^Efl_Canvas_Layout_Part_Swallow;
PEfl_Class  = ^Efl_Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_LAYOUT_PART_SWALLOW_EO_H_}
{$define _EFL_CANVAS_LAYOUT_PART_SWALLOW_EO_H_}
{$ifndef _EFL_CANVAS_LAYOUT_PART_SWALLOW_EO_CLASS_TYPE}
{$define _EFL_CANVAS_LAYOUT_PART_SWALLOW_EO_CLASS_TYPE}
type
  PEfl_Canvas_Layout_Part_Swallow = ^TEfl_Canvas_Layout_Part_Swallow;
  TEfl_Canvas_Layout_Part_Swallow = TEo;
{$endif}
{$ifndef _EFL_CANVAS_LAYOUT_PART_SWALLOW_EO_TYPES}
{$define _EFL_CANVAS_LAYOUT_PART_SWALLOW_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Represents a SWALLOW part of an Edje object.
 *
 * Its lifetime is limited to one function call only, unless an extra reference
 * is explicitely held.
 *
 * @ingroup Efl_Canvas_Layout_Part_Swallow
  }

{ was #define dname def_expr }
function EFL_CANVAS_LAYOUT_PART_SWALLOW_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_layout_part_swallow_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_LAYOUT_PART_SWALLOW_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_LAYOUT_PART_SWALLOW_CLASS:=efl_canvas_layout_part_swallow_class_get;
  end;


end.
