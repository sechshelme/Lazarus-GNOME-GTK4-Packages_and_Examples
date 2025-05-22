
unit efl_canvas_layout_part_invalid_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_layout_part_invalid_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_layout_part_invalid_eo.h
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
PEfl_Canvas_Layout_Part_Invalid  = ^Efl_Canvas_Layout_Part_Invalid;
PEfl_Class  = ^Efl_Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_LAYOUT_PART_INVALID_EO_H_}
{$define _EFL_CANVAS_LAYOUT_PART_INVALID_EO_H_}
{$ifndef _EFL_CANVAS_LAYOUT_PART_INVALID_EO_CLASS_TYPE}
{$define _EFL_CANVAS_LAYOUT_PART_INVALID_EO_CLASS_TYPE}
type
  PEfl_Canvas_Layout_Part_Invalid = ^TEfl_Canvas_Layout_Part_Invalid;
  TEfl_Canvas_Layout_Part_Invalid = TEo;
{$endif}
{$ifndef _EFL_CANVAS_LAYOUT_PART_INVALID_EO_TYPES}
{$define _EFL_CANVAS_LAYOUT_PART_INVALID_EO_TYPES}
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
 * @ingroup Efl_Canvas_Layout_Part_Invalid
  }

{ was #define dname def_expr }
function EFL_CANVAS_LAYOUT_PART_INVALID_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_layout_part_invalid_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_LAYOUT_PART_INVALID_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_LAYOUT_PART_INVALID_CLASS:=efl_canvas_layout_part_invalid_class_get;
  end;


end.
