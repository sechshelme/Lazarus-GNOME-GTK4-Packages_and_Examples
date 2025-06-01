
unit efl_ui_panes_part_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_panes_part_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_panes_part_eo.h
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
PEfl_Ui_Panes_Part  = ^Efl_Ui_Panes_Part;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_PANES_PART_EO_H_}
{$define _EFL_UI_PANES_PART_EO_H_}
{$ifndef _EFL_UI_PANES_PART_EO_CLASS_TYPE}
{$define _EFL_UI_PANES_PART_EO_CLASS_TYPE}
type
  PEfl_Ui_Panes_Part = ^TEfl_Ui_Panes_Part;
  TEfl_Ui_Panes_Part = TEo;
{$endif}
{$ifndef _EFL_UI_PANES_PART_EO_TYPES}
{$define _EFL_UI_PANES_PART_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Elementary Panes internal part class
 *
 * @ingroup Efl_Ui_Panes_Part
  }

{ was #define dname def_expr }
function EFL_UI_PANES_PART_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_panes_part_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Allows the user to set size hints to be respected and ignored
 * combined with a minimum size. If this flag is set, the minimum size set by
 * @ref efl_gfx_hint_size_min_set is respected forcefully.
 *
 * @param[in] obj The object.
 * @param[in] allow If @c true minimum size is forced
 *
 * @ingroup Efl_Ui_Panes_Part
  }
procedure efl_ui_panes_part_hint_min_allow_set(obj:PEo; allow:TEina_Bool);cdecl;external;
{*
 * @brief Allows the user to set size hints to be respected and ignored
 * combined with a minimum size. If this flag is set, the minimum size set by
 * @ref efl_gfx_hint_size_min_set is respected forcefully.
 *
 * @param[in] obj The object.
 *
 * @return If @c true minimum size is forced
 *
 * @ingroup Efl_Ui_Panes_Part
  }
(* Const before type ignored *)
function efl_ui_panes_part_hint_min_allow_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Controls the relative minimum size of panes widget's part.
 *
 * If @ref efl_gfx_hint_size_min_set is also used along with
 * @ref efl_ui_panes_part_split_ratio_min_set, maximum value is set as minimum
 * size to part.
 *
 * @param[in] obj The object.
 * @param[in] size Value between 0.0 and 1.0 representing size proportion of
 * first part's minimum size.
 *
 * @ingroup Efl_Ui_Panes_Part
  }
procedure efl_ui_panes_part_split_ratio_min_set(obj:PEo; size:Tdouble);cdecl;external;
{*
 * @brief Controls the relative minimum size of panes widget's part.
 *
 * If @ref efl_gfx_hint_size_min_set is also used along with
 * @ref efl_ui_panes_part_split_ratio_min_set, maximum value is set as minimum
 * size to part.
 *
 * @param[in] obj The object.
 *
 * @return Value between 0.0 and 1.0 representing size proportion of first
 * part's minimum size.
 *
 * @ingroup Efl_Ui_Panes_Part
  }
(* Const before type ignored *)
function efl_ui_panes_part_split_ratio_min_get(obj:PEo):Tdouble;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_PANES_PART_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_PANES_PART_CLASS:=efl_ui_panes_part_class_get;
  end;


end.
