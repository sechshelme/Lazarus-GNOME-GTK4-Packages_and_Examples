
unit efl_ui_view_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_view_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_view_eo.h
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
PEfl_Model  = ^Efl_Model;
PEfl_Model_Changed_Event  = ^Efl_Model_Changed_Event;
PEfl_Ui_View  = ^Efl_Ui_View;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_VIEW_EO_H_}
{$define _EFL_UI_VIEW_EO_H_}
{$ifndef _EFL_UI_VIEW_EO_CLASS_TYPE}
{$define _EFL_UI_VIEW_EO_CLASS_TYPE}
type
  PEfl_Ui_View = ^TEfl_Ui_View;
  TEfl_Ui_View = TEo;
{$endif}
{$ifndef _EFL_UI_VIEW_EO_TYPES}
{$define _EFL_UI_VIEW_EO_TYPES}
{* Every time the model is changed on the object.
 *
 * @since 1.23
 *
 * @ingroup Efl_Model_Changed_Event
  }
{*< The newly set model.
                       *
                       * @since 1.23  }
{*< The previously set model.
                        *
                        * @since 1.23  }
type
  PEfl_Model_Changed_Event = ^TEfl_Model_Changed_Event;
  TEfl_Model_Changed_Event = record
      current : PEfl_Model;
      previous : PEfl_Model;
    end;
{$endif}
{* Efl UI view interface.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_View
  }

{ was #define dname def_expr }
function EFL_UI_VIEW_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_view_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Model that is/will be
 *
 * @param[in] obj The object.
 * @param[in] model Efl model
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_View
  }
procedure efl_ui_view_model_set(obj:PEo; model:PEfl_Model);cdecl;external;
{*
 * @brief Model that is/will be
 *
 * @param[in] obj The object.
 *
 * @return Efl model
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_View
  }
(* Const before type ignored *)
function efl_ui_view_model_get(obj:PEo):PEfl_Model;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_VIEW_EVENT_MODEL_CHANGED : TEfl_Event_Description;cvar;external;
{* Event dispatched when a new model is set.
 * @return Efl_Model_Changed_Event
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_View
  }

{ was #define dname def_expr }
function EFL_UI_VIEW_EVENT_MODEL_CHANGED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_VIEW_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_VIEW_INTERFACE:=efl_ui_view_interface_get;
  end;

{ was #define dname def_expr }
function EFL_UI_VIEW_EVENT_MODEL_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_VIEW_EVENT_MODEL_CHANGED:=@(_EFL_UI_VIEW_EVENT_MODEL_CHANGED);
  end;


end.
