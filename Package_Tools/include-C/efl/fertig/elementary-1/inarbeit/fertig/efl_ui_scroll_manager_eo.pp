
unit efl_ui_scroll_manager_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_scroll_manager_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_scroll_manager_eo.h
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
PEfl_Ui_Pan  = ^Efl_Ui_Pan;
PEfl_Ui_Scroll_Manager  = ^Efl_Ui_Scroll_Manager;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SCROLL_MANAGER_EO_H_}
{$define _EFL_UI_SCROLL_MANAGER_EO_H_}
{$ifndef _EFL_UI_SCROLL_MANAGER_EO_CLASS_TYPE}
{$define _EFL_UI_SCROLL_MANAGER_EO_CLASS_TYPE}
type
  PEfl_Ui_Scroll_Manager = ^TEfl_Ui_Scroll_Manager;
  TEfl_Ui_Scroll_Manager = TEo;
{$endif}
{$ifndef _EFL_UI_SCROLL_MANAGER_EO_TYPES}
{$define _EFL_UI_SCROLL_MANAGER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl ui scroll manager class
 *
 * @ingroup Efl_Ui_Scroll_Manager
  }

{ was #define dname def_expr }
function EFL_UI_SCROLL_MANAGER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_scroll_manager_class_get:PEfl_Class;cdecl;external;
{$ifdef EFL_UI_SCROLL_MANAGER_PROTECTED}
{*
 * @brief This is the internal pan object managed by scroll manager.
 *
 * This property is protected as it is meant for scrollable object
 * implementations only, to set and access the internal pan object. If pan is
 * set to @c NULL, scrolling does not work.
 *
 * @param[in] obj The object.
 * @param[in] pan Pan object.
 *
 * @ingroup Efl_Ui_Scroll_Manager
  }
procedure efl_ui_scroll_manager_pan_set(obj:PEo; pan:PEfl_Ui_Pan);cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SCROLL_MANAGER_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_SCROLL_MANAGER_CLASS:=efl_ui_scroll_manager_class_get;
  end;


end.
