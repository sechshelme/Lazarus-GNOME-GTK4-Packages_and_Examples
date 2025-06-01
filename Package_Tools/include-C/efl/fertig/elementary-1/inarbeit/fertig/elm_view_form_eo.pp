
unit elm_view_form_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_view_form_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_view_form_eo.h
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
Pchar  = ^char;
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEfl_Class  = ^Efl_Class;
PEfl_Model  = ^Efl_Model;
PElm_View_Form  = ^Elm_View_Form;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_VIEW_FORM_EO_H_}
{$define _ELM_VIEW_FORM_EO_H_}
{$ifndef _ELM_VIEW_FORM_EO_CLASS_TYPE}
{$define _ELM_VIEW_FORM_EO_CLASS_TYPE}
type
  PElm_View_Form = ^TElm_View_Form;
  TElm_View_Form = TEo;
{$endif}
{$ifndef _ELM_VIEW_FORM_EO_TYPES}
{$define _ELM_VIEW_FORM_EO_TYPES}
{$endif}
{* Elementary view form class
 *
 * @ingroup Elm_View_Form
  }

{ was #define dname def_expr }
function ELM_VIEW_FORM_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function elm_view_form_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Set model
 *
 * @param[in] obj The object.
 * @param[in] model Emodel object
 *
 * @since 1.11
 *
 * @ingroup Elm_View_Form
  }
procedure elm_view_form_model_set(obj:PEo; model:PEfl_Model);cdecl;external;
{*
 * @brief Add new widget
 *
 * @param[in] obj The object.
 * @param[in] propname Property name
 * @param[in] evas Evas widget
 *
 * @since 1.11
 *
 * @ingroup Elm_View_Form
  }
(* Const before type ignored *)
procedure elm_view_form_widget_add(obj:PEo; propname:Pchar; evas:PEfl_Canvas_Object);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function ELM_VIEW_FORM_CLASS : longint; { return type might be wrong }
  begin
    ELM_VIEW_FORM_CLASS:=elm_view_form_class_get;
  end;


end.
