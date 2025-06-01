
unit efl_ui_collection_view_focus_manager_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_collection_view_focus_manager_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_collection_view_focus_manager_eo.h
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
PEfl_Ui_Collection_View_Focus_Manager  = ^Efl_Ui_Collection_View_Focus_Manager;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_COLLECTION_VIEW_FOCUS_MANAGER_EO_H_}
{$define _EFL_UI_COLLECTION_VIEW_FOCUS_MANAGER_EO_H_}
{$ifndef _EFL_UI_COLLECTION_VIEW_FOCUS_MANAGER_EO_CLASS_TYPE}
{$define _EFL_UI_COLLECTION_VIEW_FOCUS_MANAGER_EO_CLASS_TYPE}
type
  PEfl_Ui_Collection_View_Focus_Manager = ^TEfl_Ui_Collection_View_Focus_Manager;
  TEfl_Ui_Collection_View_Focus_Manager = TEo;
{$endif}
{$ifndef _EFL_UI_COLLECTION_VIEW_FOCUS_MANAGER_EO_TYPES}
{$define _EFL_UI_COLLECTION_VIEW_FOCUS_MANAGER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Internal class which implements collection specific behaviour, cannot be
 * used outside of collection
 *
 * @ingroup Efl_Ui_Collection_View_Focus_Manager
  }

{ was #define dname def_expr }
function EFL_UI_COLLECTION_VIEW_FOCUS_MANAGER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_collection_view_focus_manager_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_COLLECTION_VIEW_FOCUS_MANAGER_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_COLLECTION_VIEW_FOCUS_MANAGER_CLASS:=efl_ui_collection_view_focus_manager_class_get;
  end;


end.
