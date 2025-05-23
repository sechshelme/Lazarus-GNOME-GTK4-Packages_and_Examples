
unit efl_canvas_layout_part_text_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_layout_part_text_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_layout_part_text_eo.h
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
PEfl_Canvas_Layout_Part_Text  = ^Efl_Canvas_Layout_Part_Text;
PEfl_Canvas_Layout_Part_Text_Expand  = ^Efl_Canvas_Layout_Part_Text_Expand;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_LAYOUT_PART_TEXT_EO_H_}
{$define _EFL_CANVAS_LAYOUT_PART_TEXT_EO_H_}
{$ifndef _EFL_CANVAS_LAYOUT_PART_TEXT_EO_CLASS_TYPE}
{$define _EFL_CANVAS_LAYOUT_PART_TEXT_EO_CLASS_TYPE}
type
  PEfl_Canvas_Layout_Part_Text = ^TEfl_Canvas_Layout_Part_Text;
  TEfl_Canvas_Layout_Part_Text = TEo;
{$endif}
{$ifndef _EFL_CANVAS_LAYOUT_PART_TEXT_EO_TYPES}
{$define _EFL_CANVAS_LAYOUT_PART_TEXT_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Text layout policy to enforce. If none is set, only min/max descriptions
 * are taken into account.
 *
 * @ingroup Efl_Canvas_Layout_Part_Text_Expand
  }
{*< No policy. Use default
                                                * description parameters.  }
{*< Text is tied to the left
                                                 * side of the container.  }
{ 1 >> 1  }{*< Text is tied to the top side of the
                                                              * container.  }
{ 1 >> 2  }{*< Text is tied to the right side of
                                                              * the container.  }
{ 1 >> 3  }{*< Text is tied to the bottom side of
                                                             * the container.  }
type
  PEfl_Canvas_Layout_Part_Text_Expand = ^TEfl_Canvas_Layout_Part_Text_Expand;
  TEfl_Canvas_Layout_Part_Text_Expand =  Longint;
  Const
    EFL_CANVAS_LAYOUT_PART_TEXT_EXPAND_NONE = 0;
    EFL_CANVAS_LAYOUT_PART_TEXT_EXPAND_MIN_X = 1;
    EFL_CANVAS_LAYOUT_PART_TEXT_EXPAND_MIN_Y = 2;
    EFL_CANVAS_LAYOUT_PART_TEXT_EXPAND_MAX_X = 4;
    EFL_CANVAS_LAYOUT_PART_TEXT_EXPAND_MAX_Y = 8;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Represents a TEXT part of a layout
 *
 * Its lifetime is limited to one function call only, unless an extra reference
 * is explicitly held.
 *
 * @ingroup Efl_Canvas_Layout_Part_Text
  }

{ was #define dname def_expr }
function EFL_CANVAS_LAYOUT_PART_TEXT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_layout_part_text_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Sizing policy for text parts.
 *
 * This will determine whether to consider height or width constraints, if
 * text-specific behaviors occur (such as ellipsis, line-wrapping etc.
 *
 * @param[in] obj The object.
 * @param[in] type Desired sizing policy.
 *
 * @ingroup Efl_Canvas_Layout_Part_Text
  }
procedure efl_canvas_layout_part_text_expand_set(obj:PEo; _type:TEfl_Canvas_Layout_Part_Text_Expand);cdecl;external;
{*
 * @brief Sizing policy for text parts.
 *
 * This will determine whether to consider height or width constraints, if
 * text-specific behaviors occur (such as ellipsis, line-wrapping etc.
 *
 * @param[in] obj The object.
 *
 * @return Desired sizing policy.
 *
 * @ingroup Efl_Canvas_Layout_Part_Text
  }
(* Const before type ignored *)
function efl_canvas_layout_part_text_expand_get(obj:PEo):TEfl_Canvas_Layout_Part_Text_Expand;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_LAYOUT_PART_TEXT_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_LAYOUT_PART_TEXT_CLASS:=efl_canvas_layout_part_text_class_get;
  end;


end.
