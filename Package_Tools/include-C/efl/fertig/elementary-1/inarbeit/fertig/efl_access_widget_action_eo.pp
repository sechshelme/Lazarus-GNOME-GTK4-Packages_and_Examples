
unit efl_access_widget_action_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_access_widget_action_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_access_widget_action_eo.h
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
PEfl_Access_Action_Data  = ^Efl_Access_Action_Data;
PEfl_Access_Widget_Action  = ^Efl_Access_Widget_Action;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_ACCESS_WIDGET_ACTION_EO_H_}
{$define _EFL_ACCESS_WIDGET_ACTION_EO_H_}
{$ifndef _EFL_ACCESS_WIDGET_ACTION_EO_CLASS_TYPE}
{$define _EFL_ACCESS_WIDGET_ACTION_EO_CLASS_TYPE}
type
  PEfl_Access_Widget_Action = ^TEfl_Access_Widget_Action;
  TEfl_Access_Widget_Action = TEo;
{$endif}
{$ifndef _EFL_ACCESS_WIDGET_ACTION_EO_TYPES}
{$define _EFL_ACCESS_WIDGET_ACTION_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Access widget action mixin
 *
 * @ingroup Efl_Access_Widget_Action
  }

{ was #define dname def_expr }
function EFL_ACCESS_WIDGET_ACTION_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_access_widget_action_mixin_get:PEfl_Class;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_WIDGET_ACTION_PROTECTED}
{*
 * @brief Elementary actions
 *
 * @param[in] obj The object.
 *
 * @return NULL-terminated array of Efl.Access.Action_Data.
 *
 * @ingroup Efl_Access_Widget_Action
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_access_widget_action_elm_actions_get(obj:PEo):PEfl_Access_Action_Data;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_ACCESS_WIDGET_ACTION_MIXIN : longint; { return type might be wrong }
  begin
    EFL_ACCESS_WIDGET_ACTION_MIXIN:=efl_access_widget_action_mixin_get;
  end;


end.
