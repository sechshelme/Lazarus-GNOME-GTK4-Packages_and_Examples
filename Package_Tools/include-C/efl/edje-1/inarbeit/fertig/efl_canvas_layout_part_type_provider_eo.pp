
unit efl_canvas_layout_part_type_provider_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_layout_part_type_provider_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_layout_part_type_provider_eo.h
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
PEfl_Canvas_Layout_Part_Type_Provider  = ^Efl_Canvas_Layout_Part_Type_Provider;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_LAYOUT_PART_TYPE_PROVIDER_EO_H_}
{$define _EFL_CANVAS_LAYOUT_PART_TYPE_PROVIDER_EO_H_}
{$ifndef _EFL_CANVAS_LAYOUT_PART_TYPE_PROVIDER_EO_CLASS_TYPE}
{$define _EFL_CANVAS_LAYOUT_PART_TYPE_PROVIDER_EO_CLASS_TYPE}
type
  PEfl_Canvas_Layout_Part_Type_Provider = ^TEfl_Canvas_Layout_Part_Type_Provider;
  TEfl_Canvas_Layout_Part_Type_Provider = TEo;
{$endif}
{$ifndef _EFL_CANVAS_LAYOUT_PART_TYPE_PROVIDER_EO_TYPES}
{$define _EFL_CANVAS_LAYOUT_PART_TYPE_PROVIDER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Common Interface for the Part Type
 *
 * The getter for the part type is usefull for different types of part
 * hirachies. This interface can be used to support all the different kinds of
 * part types that are available in EFL.
 *
 * @ingroup Efl_Canvas_Layout_Part_Type_Provider
  }

{ was #define dname def_expr }
function EFL_CANVAS_LAYOUT_PART_TYPE_PROVIDER_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_layout_part_type_provider_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Type of this part in the layout.
 *
 * @param[in] obj The object.
 *
 * @return One of the types or @c none if not an existing part.
 *
 * @ingroup Efl_Canvas_Layout_Part_Type_Provider
  }
(* Const before type ignored *)
function efl_canvas_layout_part_type_get(obj:PEo):TEfl_Canvas_Layout_Part_Type;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_LAYOUT_PART_TYPE_PROVIDER_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_LAYOUT_PART_TYPE_PROVIDER_INTERFACE:=efl_canvas_layout_part_type_provider_interface_get;
  end;


end.
