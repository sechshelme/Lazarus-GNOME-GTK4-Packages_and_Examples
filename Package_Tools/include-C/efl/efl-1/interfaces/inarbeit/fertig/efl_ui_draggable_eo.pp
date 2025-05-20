
unit efl_ui_draggable_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_draggable_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_draggable_eo.h
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
PEfl_Ui_Draggable  = ^Efl_Ui_Draggable;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_DRAGGABLE_EO_H_}
{$define _EFL_UI_DRAGGABLE_EO_H_}
{$ifndef _EFL_UI_DRAGGABLE_EO_CLASS_TYPE}
{$define _EFL_UI_DRAGGABLE_EO_CLASS_TYPE}
type
  PEfl_Ui_Draggable = ^TEfl_Ui_Draggable;
  TEfl_Ui_Draggable = TEo;
{$endif}
{$ifndef _EFL_UI_DRAGGABLE_EO_TYPES}
{$define _EFL_UI_DRAGGABLE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl UI draggable interface
 *
 * @ingroup Efl_Ui_Draggable
  }

{ was #define dname def_expr }
function EFL_UI_DRAGGABLE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_draggable_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Control whether the object's content is changed by drag and drop.
 *
 * If @c drag_target is true the object can be the target of a dragging object.
 * The content of this object can then be changed into dragging content. For
 * example, if an object deals with image and @c drag_target is true, the user
 * can drag the new image and drop it into said object. This object's image can
 * then be changed into a new image.
 *
 * @param[in] obj The object.
 * @param[in] set Turn on or off drop_target. Default is @c false.
 *
 * @ingroup Efl_Ui_Draggable
  }
procedure efl_ui_draggable_drag_target_set(obj:PEo; set:TEina_Bool);cdecl;external;
{*
 * @brief Control whether the object's content is changed by drag and drop.
 *
 * If @c drag_target is true the object can be the target of a dragging object.
 * The content of this object can then be changed into dragging content. For
 * example, if an object deals with image and @c drag_target is true, the user
 * can drag the new image and drop it into said object. This object's image can
 * then be changed into a new image.
 *
 * @param[in] obj The object.
 *
 * @return Turn on or off drop_target. Default is @c false.
 *
 * @ingroup Efl_Ui_Draggable
  }
(* Const before type ignored *)
function efl_ui_draggable_drag_target_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_DRAGGABLE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_DRAGGABLE_INTERFACE:=efl_ui_draggable_interface_get;
  end;


end.
