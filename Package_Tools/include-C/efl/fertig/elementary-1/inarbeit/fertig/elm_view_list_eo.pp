
unit elm_view_list_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_view_list_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_view_list_eo.h
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
PElm_View_List  = ^Elm_View_List;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_VIEW_LIST_EO_H_}
{$define _ELM_VIEW_LIST_EO_H_}
{$ifndef _ELM_VIEW_LIST_EO_CLASS_TYPE}
{$define _ELM_VIEW_LIST_EO_CLASS_TYPE}
type
  PElm_View_List = ^TElm_View_List;
  TElm_View_List = TEo;
{$endif}
{$ifndef _ELM_VIEW_LIST_EO_TYPES}
{$define _ELM_VIEW_LIST_EO_TYPES}
{$endif}
{* Elementary view list class
 *
 * @ingroup Elm_View_List
  }

{ was #define dname def_expr }
function ELM_VIEW_LIST_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function elm_view_list_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Constructor wrapper
 *
 * @param[in] obj The object.
 * @param[in] genlist Genlist object
 * @param[in] item_type Item type
 * @param[in] item_style The current item style name. @c null would be default.
 *
 * @since 1.11
 *
 * @ingroup Elm_View_List
  }
(* Const before type ignored *)
procedure elm_view_list_genlist_set(obj:PEo; genlist:PEfl_Canvas_Object; item_type:TElm_Genlist_Item_Type; item_style:Pchar);cdecl;external;
{*
 * @brief Return evas object
 *
 * @param[in] obj The object.
 * @param[out] widget Returned widget
 *
 * @since 1.11
 *
 * @ingroup Elm_View_List
  }
procedure elm_view_list_evas_object_get(obj:PEo; widget:PPEfl_Canvas_Object);cdecl;external;
{*
 * @brief Connect property
 *
 * @param[in] obj The object.
 * @param[in] property Property name
 * @param[in] part Edje's theme part
 *
 * @since 1.11
 *
 * @ingroup Elm_View_List
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_view_list_property_connect(obj:PEo; _property:Pchar; part:Pchar);cdecl;external;
{*
 * @brief Set model
 *
 * @param[in] obj The object.
 * @param[in] model Efl.Model to set
 *
 * @since 1.11
 *
 * @ingroup Elm_View_List
  }
procedure elm_view_list_model_set(obj:PEo; model:PEfl_Model);cdecl;external;
{*
 * @brief Get model
 *
 * @param[in] obj The object.
 *
 * @return Efl.Model to set
 *
 * @since 1.11
 *
 * @ingroup Elm_View_List
  }
(* Const before type ignored *)
function elm_view_list_model_get(obj:PEo):PEfl_Model;cdecl;external;
(* Const before type ignored *)
  var
    _ELM_VIEW_LIST_EVENT_MODEL_SELECTED : TEfl_Event_Description;cvar;external;
{* Called when model was selected
 * @return Efl_Object *
 *
 * @ingroup Elm_View_List
  }

{ was #define dname def_expr }
function ELM_VIEW_LIST_EVENT_MODEL_SELECTED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function ELM_VIEW_LIST_CLASS : longint; { return type might be wrong }
  begin
    ELM_VIEW_LIST_CLASS:=elm_view_list_class_get;
  end;

{ was #define dname def_expr }
function ELM_VIEW_LIST_EVENT_MODEL_SELECTED : longint; { return type might be wrong }
  begin
    ELM_VIEW_LIST_EVENT_MODEL_SELECTED:=@(_ELM_VIEW_LIST_EVENT_MODEL_SELECTED);
  end;


end.
