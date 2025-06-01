
unit efl_ui_spotlight_scroll_manager_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_spotlight_scroll_manager_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_spotlight_scroll_manager_eo.h
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
PEfl_Ui_Spotlight_Scroll_Manager  = ^Efl_Ui_Spotlight_Scroll_Manager;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SPOTLIGHT_SCROLL_MANAGER_EO_H_}
{$define _EFL_UI_SPOTLIGHT_SCROLL_MANAGER_EO_H_}
{$ifndef _EFL_UI_SPOTLIGHT_SCROLL_MANAGER_EO_CLASS_TYPE}
{$define _EFL_UI_SPOTLIGHT_SCROLL_MANAGER_EO_CLASS_TYPE}
type
  PEfl_Ui_Spotlight_Scroll_Manager = ^TEfl_Ui_Spotlight_Scroll_Manager;
  TEfl_Ui_Spotlight_Scroll_Manager = TEo;
{$endif}
{$ifndef _EFL_UI_SPOTLIGHT_SCROLL_MANAGER_EO_TYPES}
{$define _EFL_UI_SPOTLIGHT_SCROLL_MANAGER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}

{ was #define dname def_expr }
function EFL_UI_SPOTLIGHT_SCROLL_MANAGER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_spotlight_scroll_manager_class_get:PEfl_Class;cdecl;external;
{*
 * @brief User scrolling forbidden.
 *
 * This property blocks scrolling movement by user input.
 *
 * @param[in] obj The object.
 * @param[in] scroll_block @c true if user should not be able to scroll.
 *
 * @ingroup Efl_Ui_Spotlight_Scroll_Manager
  }
procedure efl_ui_spotlight_manager_scroll_block_set(obj:PEo; scroll_block:TEina_Bool);cdecl;external;
{*
 * @brief User scrolling forbidden.
 *
 * This property blocks scrolling movement by user input.
 *
 * @param[in] obj The object.
 *
 * @return @c true if user should not be able to scroll.
 *
 * @ingroup Efl_Ui_Spotlight_Scroll_Manager
  }
(* Const before type ignored *)
function efl_ui_spotlight_manager_scroll_block_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SPOTLIGHT_SCROLL_MANAGER_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_SPOTLIGHT_SCROLL_MANAGER_CLASS:=efl_ui_spotlight_scroll_manager_class_get;
  end;


end.
