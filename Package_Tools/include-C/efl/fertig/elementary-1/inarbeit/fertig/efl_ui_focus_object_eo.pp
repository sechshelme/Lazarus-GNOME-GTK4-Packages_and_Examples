
unit efl_ui_focus_object_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_focus_object_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_focus_object_eo.h
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
PEfl_Ui_Focus_Manager  = ^Efl_Ui_Focus_Manager;
PEfl_Ui_Focus_Object  = ^Efl_Ui_Focus_Object;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_FOCUS_OBJECT_EO_H_}
{$define _EFL_UI_FOCUS_OBJECT_EO_H_}
{$ifndef _EFL_UI_FOCUS_OBJECT_EO_CLASS_TYPE}
{$define _EFL_UI_FOCUS_OBJECT_EO_CLASS_TYPE}
type
  PEfl_Ui_Focus_Object = ^TEfl_Ui_Focus_Object;
  TEfl_Ui_Focus_Object = TEo;
{$endif}
{$ifndef _EFL_UI_FOCUS_OBJECT_EO_TYPES}
{$define _EFL_UI_FOCUS_OBJECT_EO_TYPES}
{$endif}
{* Functions of focusable objects.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }

{ was #define dname def_expr }
function EFL_UI_FOCUS_OBJECT_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_focus_object_mixin_get:PEfl_Class;cdecl;external;
{*
 * @brief The geometry (that is, the bounding rectangle) used to calculate the
 * relationship with other objects.
 *
 * @param[in] obj The object.
 *
 * @return The geometry to use.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }
(* Const before type ignored *)
function efl_ui_focus_object_focus_geometry_get(obj:PEo):TEina_Rect;cdecl;external;
{$ifdef EFL_UI_FOCUS_OBJECT_PROTECTED}
{*
 * @brief Whether the widget is currently focused or not.
 *
 * This is called by the manager and should never be called by anyone else.
 *
 * The function emits the focus state events, if focus is different to the
 * previous state.
 *
 * @param[in] obj The object.
 * @param[in] focus The focused state of the object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }
procedure efl_ui_focus_object_focus_set(obj:PEo; focus:TEina_Bool);cdecl;external;
{$endif}
{*
 * @brief Whether the widget is currently focused or not.
 *
 * @param[in] obj The object.
 *
 * @return The focused state of the object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }
(* Const before type ignored *)

function efl_ui_focus_object_focus_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief This is the focus manager where this focus object is registered in.
 * The element which is the @c root of an @ref Efl_Ui_Focus_Manager will not
 * have this focus manager as this object, but rather the focus manager where
 * that is registered in.
 *
 * @param[in] obj The object.
 *
 * @return The manager object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }
(* Const before type ignored *)
function efl_ui_focus_object_focus_manager_get(obj:PEo):PEfl_Ui_Focus_Manager;cdecl;external;
{*
 * @brief The logical parent used by this object.
 *
 * @param[in] obj The object.
 *
 * @return The focus parent.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }
(* Const before type ignored *)
function efl_ui_focus_object_focus_parent_get(obj:PEo):PEfl_Ui_Focus_Object;cdecl;external;
{$ifdef EFL_UI_FOCUS_OBJECT_PROTECTED}
{*
 * @brief Indicates if a child of this object has focus set to true.
 *
 * @param[in] obj The object.
 * @param[in] child_focus @c true if a child has focus.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }
procedure efl_ui_focus_object_child_focus_set(obj:PEo; child_focus:TEina_Bool);cdecl;external;
{$endif}
{$ifdef EFL_UI_FOCUS_OBJECT_PROTECTED}
{*
 * @brief Indicates if a child of this object has focus set to true.
 *
 * @param[in] obj The object.
 *
 * @return @c true if a child has focus.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }
(* Const before type ignored *)

function efl_ui_focus_object_child_focus_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{* Tells the object that its children will be queried soon by the focus
 * manager. Overwrite this to have a chance to update the order of the
 * children. Deleting items in this call will result in undefined behaviour and
 * may cause your system to crash.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }

procedure efl_ui_focus_object_setup_order(obj:PEo);cdecl;external;
{$ifdef EFL_UI_FOCUS_OBJECT_PROTECTED}
{* This is called when @ref efl_ui_focus_object_setup_order is called, but
 * only on the first call, additional recursive calls to
 * @ref efl_ui_focus_object_setup_order will not call this function again.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }
procedure efl_ui_focus_object_setup_order_non_recursive(obj:PEo);cdecl;external;
{$endif}
{$ifdef EFL_UI_FOCUS_OBJECT_PROTECTED}
{*
 * @brief Virtual function handling focus in/out events on the widget.
 *
 * @param[in] obj The object.
 *
 * @return @c true if this widget can handle focus, @c false otherwise.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }

function efl_ui_focus_object_on_focus_update(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
(* Const before type ignored *)
  var
    _EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_CHANGED : TEfl_Event_Description;cvar;external;
{* Emitted if the focus state has changed.
 * @return Eina_Bool
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }
(* Const before type ignored *)
    _EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_MANAGER_CHANGED : TEfl_Event_Description;cvar;external;
{* Emitted when a new manager is the parent for this object.
 * @return Efl_Ui_Focus_Manager *
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }
(* Const before type ignored *)
    _EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_PARENT_CHANGED : TEfl_Event_Description;cvar;external;
{* Emitted when a new logical parent should be used.
 * @return Efl_Ui_Focus_Object *
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }
(* Const before type ignored *)
    _EFL_UI_FOCUS_OBJECT_EVENT_CHILD_FOCUS_CHANGED : TEfl_Event_Description;cvar;external;
{* Emitted if child_focus has changed.
 * @return Eina_Bool
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }
(* Const before type ignored *)
    _EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_GEOMETRY_CHANGED : TEfl_Event_Description;cvar;external;
{* Emitted if focus geometry of this object has changed.
 * @return Eina_Rect
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Object
  }

{ was #define dname def_expr }
function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_MANAGER_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_PARENT_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_FOCUS_OBJECT_EVENT_CHILD_FOCUS_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_GEOMETRY_CHANGED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_FOCUS_OBJECT_MIXIN : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_OBJECT_MIXIN:=efl_ui_focus_object_mixin_get;
  end;

{ was #define dname def_expr }
function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_CHANGED:=@(_EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_MANAGER_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_MANAGER_CHANGED:=@(_EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_MANAGER_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_PARENT_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_PARENT_CHANGED:=@(_EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_PARENT_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_UI_FOCUS_OBJECT_EVENT_CHILD_FOCUS_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_OBJECT_EVENT_CHILD_FOCUS_CHANGED:=@(_EFL_UI_FOCUS_OBJECT_EVENT_CHILD_FOCUS_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_GEOMETRY_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_GEOMETRY_CHANGED:=@(_EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_GEOMETRY_CHANGED);
  end;


end.
