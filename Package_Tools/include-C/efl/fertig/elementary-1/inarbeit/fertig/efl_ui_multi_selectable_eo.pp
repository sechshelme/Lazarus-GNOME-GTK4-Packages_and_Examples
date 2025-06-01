
unit efl_ui_multi_selectable_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_multi_selectable_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_multi_selectable_eo.h
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
PEfl_Ui_Multi_Selectable  = ^Efl_Ui_Multi_Selectable;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_MULTI_SELECTABLE_EO_H_}
{$define _EFL_UI_MULTI_SELECTABLE_EO_H_}
{$ifndef _EFL_UI_MULTI_SELECTABLE_EO_CLASS_TYPE}
{$define _EFL_UI_MULTI_SELECTABLE_EO_CLASS_TYPE}
type
  PEfl_Ui_Multi_Selectable = ^TEfl_Ui_Multi_Selectable;
  TEfl_Ui_Multi_Selectable = TEo;
{$endif}
{$ifndef _EFL_UI_MULTI_SELECTABLE_EO_TYPES}
{$define _EFL_UI_MULTI_SELECTABLE_EO_TYPES}
{$endif}
{*
 * @brief Interface for getting access to a range of selected items.
 *
 * The implementor of this interface provides the possibility to select
 * multiple Selectables. If not, only @ref Efl_Ui_Single_Selectable should be
 * implemented.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Multi_Selectable
  }

{ was #define dname def_expr }
function EFL_UI_MULTI_SELECTABLE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_multi_selectable_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The mode type for children selection.
 *
 * @param[in] obj The object.
 * @param[in] mode Type of selection of children
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Multi_Selectable
  }
procedure efl_ui_multi_selectable_select_mode_set(obj:PEo; mode:TEfl_Ui_Select_Mode);cdecl;external;
{*
 * @brief The mode type for children selection.
 *
 * @param[in] obj The object.
 *
 * @return Type of selection of children
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Multi_Selectable
  }
(* Const before type ignored *)
function efl_ui_multi_selectable_select_mode_get(obj:PEo):TEfl_Ui_Select_Mode;cdecl;external;
{* Select all @ref Efl_Ui_Selectable
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Multi_Selectable
  }
procedure efl_ui_multi_selectable_all_select(obj:PEo);cdecl;external;
{* Unselect all @ref Efl_Ui_Selectable
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Multi_Selectable
  }
procedure efl_ui_multi_selectable_all_unselect(obj:PEo);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_MULTI_SELECTABLE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_MULTI_SELECTABLE_INTERFACE:=efl_ui_multi_selectable_interface_get;
  end;


end.
