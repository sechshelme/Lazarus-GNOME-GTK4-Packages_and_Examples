
unit efl_ui_panes_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_panes_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_panes_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Panes  = ^Efl_Ui_Panes;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_PANES_EO_H_}
{$define _EFL_UI_PANES_EO_H_}
{$ifndef _EFL_UI_PANES_EO_CLASS_TYPE}
{$define _EFL_UI_PANES_EO_CLASS_TYPE}
type
  PEfl_Ui_Panes = ^TEfl_Ui_Panes;
  TEfl_Ui_Panes = TEo;
{$endif}
{$ifndef _EFL_UI_PANES_EO_TYPES}
{$define _EFL_UI_PANES_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Elementary panes class
 *
 * @ingroup Efl_Ui_Panes
  }

{ was #define dname def_expr }
function EFL_UI_PANES_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_panes_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Set the split ratio between panes widget first and second parts.
 *
 * By default it's homogeneous, i.e., both sides have the same size.
 *
 * If something different is required, it can be set with this function. For
 * example, if the first content should be displayed over 75% of the panes
 * size, @c ratio should be passed as 0.75. This way, second content will be
 * resized to 25% of panes size.
 *
 * If displayed vertically, first content is displayed at top, and second
 * content at bottom.
 *
 * @note This ratio will change when user drags the panes bar.
 *
 * @param[in] obj The object.
 * @param[in] ratio Value between 0.0 and 1.0 representing split ratio between
 * panes first and second parts.
 *
 * @ingroup Efl_Ui_Panes
  }
procedure efl_ui_panes_split_ratio_set(obj:PEo; ratio:Tdouble);cdecl;external;
{*
 * @brief Set the split ratio between panes widget first and second parts.
 *
 * By default it's homogeneous, i.e., both sides have the same size.
 *
 * If something different is required, it can be set with this function. For
 * example, if the first content should be displayed over 75% of the panes
 * size, @c ratio should be passed as 0.75. This way, second content will be
 * resized to 25% of panes size.
 *
 * If displayed vertically, first content is displayed at top, and second
 * content at bottom.
 *
 * @note This ratio will change when user drags the panes bar.
 *
 * @param[in] obj The object.
 *
 * @return Value between 0.0 and 1.0 representing split ratio between panes
 * first and second parts.
 *
 * @ingroup Efl_Ui_Panes
  }
(* Const before type ignored *)
function efl_ui_panes_split_ratio_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Set whether the left and right panes can be resized by user
 * interaction.
 *
 * By default panes' contents are resizable by user interaction.
 *
 * @param[in] obj The object.
 * @param[in] fixed Use @c true to fix the left and right panes sizes and make
 * them not to be resized by user interaction. Use @c false to make them
 * resizable.
 *
 * @ingroup Efl_Ui_Panes
  }
procedure efl_ui_panes_fixed_set(obj:PEo; fixed:TEina_Bool);cdecl;external;
{*
 * @brief Set whether the left and right panes can be resized by user
 * interaction.
 *
 * By default panes' contents are resizable by user interaction.
 *
 * @param[in] obj The object.
 *
 * @return Use @c true to fix the left and right panes sizes and make them not
 * to be resized by user interaction. Use @c false to make them resizable.
 *
 * @ingroup Efl_Ui_Panes
  }
(* Const before type ignored *)
function efl_ui_panes_fixed_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_PANES_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_PANES_CLASS:=efl_ui_panes_class_get;
  end;


end.
