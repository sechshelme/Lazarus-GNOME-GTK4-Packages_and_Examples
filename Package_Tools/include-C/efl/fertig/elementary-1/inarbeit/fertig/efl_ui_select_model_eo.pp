
unit efl_ui_select_model_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_select_model_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_select_model_eo.h
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
PEfl_Ui_Select_Model  = ^Efl_Ui_Select_Model;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SELECT_MODEL_EO_H_}
{$define _EFL_UI_SELECT_MODEL_EO_H_}
{$ifndef _EFL_UI_SELECT_MODEL_EO_CLASS_TYPE}
{$define _EFL_UI_SELECT_MODEL_EO_CLASS_TYPE}
type
  PEfl_Ui_Select_Model = ^TEfl_Ui_Select_Model;
  TEfl_Ui_Select_Model = TEo;
{$endif}
{$ifndef _EFL_UI_SELECT_MODEL_EO_TYPES}
{$define _EFL_UI_SELECT_MODEL_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl ui select model class
 *
 * @ingroup Efl_Ui_Select_Model
  }

{ was #define dname def_expr }
function EFL_UI_SELECT_MODEL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_select_model_class_get:PEfl_Class;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_SELECT_MODEL_EVENT_SELECTED : TEfl_Event_Description;cvar;external;
{*
 * No description
 * @return Efl_Object *
  }
(* Const before type ignored *)
    _EFL_UI_SELECT_MODEL_EVENT_UNSELECTED : TEfl_Event_Description;cvar;external;
{*
 * No description
 * @return Efl_Object *
  }

{ was #define dname def_expr }
function EFL_UI_SELECT_MODEL_EVENT_SELECTED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_SELECT_MODEL_EVENT_UNSELECTED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SELECT_MODEL_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_SELECT_MODEL_CLASS:=efl_ui_select_model_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_SELECT_MODEL_EVENT_SELECTED : longint; { return type might be wrong }
  begin
    EFL_UI_SELECT_MODEL_EVENT_SELECTED:=@(_EFL_UI_SELECT_MODEL_EVENT_SELECTED);
  end;

{ was #define dname def_expr }
function EFL_UI_SELECT_MODEL_EVENT_UNSELECTED : longint; { return type might be wrong }
  begin
    EFL_UI_SELECT_MODEL_EVENT_UNSELECTED:=@(_EFL_UI_SELECT_MODEL_EVENT_UNSELECTED);
  end;


end.
