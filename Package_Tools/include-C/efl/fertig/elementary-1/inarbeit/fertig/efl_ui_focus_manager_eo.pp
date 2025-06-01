
unit efl_ui_focus_manager_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_focus_manager_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_focus_manager_eo.h
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
PEfl_Ui_Focus_Manager_Logical_End_Detail  = ^Efl_Ui_Focus_Manager_Logical_End_Detail;
PEfl_Ui_Focus_Object  = ^Efl_Ui_Focus_Object;
PEfl_Ui_Focus_Relations  = ^Efl_Ui_Focus_Relations;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_FOCUS_MANAGER_EO_H_}
{$define _EFL_UI_FOCUS_MANAGER_EO_H_}
{$ifndef _EFL_UI_FOCUS_MANAGER_EO_CLASS_TYPE}
{$define _EFL_UI_FOCUS_MANAGER_EO_CLASS_TYPE}
type
  PEfl_Ui_Focus_Manager = ^TEfl_Ui_Focus_Manager;
  TEfl_Ui_Focus_Manager = TEo;
{$endif}
{$ifndef _EFL_UI_FOCUS_MANAGER_EO_TYPES}
{$define _EFL_UI_FOCUS_MANAGER_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Structure holding the graph of relations between focusable objects.
 *
 * @ingroup Efl_Ui_Focus_Relations
  }
{*< List of objects to the right.  }
{*< List of objects to the left.  }
{*< List of objects above.  }
{*< List of objects below.  }
{*< Next object.  }
{*< Previous object.  }
{*< Parent object.  }
{*< Redirect manager.  }
{*< The node where this information is from.  }
{*< @c true if this is a logical (non-regular) node.  }
{*< The position in the history stack.  }
type
  PEfl_Ui_Focus_Relations = ^TEfl_Ui_Focus_Relations;
  TEfl_Ui_Focus_Relations = record
      right : PEina_Iterator;
      left : PEina_Iterator;
      top : PEina_Iterator;
      down : PEina_Iterator;
      next : PEfl_Ui_Focus_Object;
      prev : PEfl_Ui_Focus_Object;
      parent : PEfl_Ui_Focus_Object;
      redirect : PEfl_Ui_Focus_Manager;
      node : PEfl_Ui_Focus_Object;
      logical : TEina_Bool;
      position_in_history : longint;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{* Structure holding the focus object with extra information on logical end.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager_Logical_End_Detail
  }
{*< @c true if element is registered as regular
                             * element in the @ref Efl_Ui_Focus_Manager object.
                             *
                             * @since 1.22  }
{*< The last element of the logical chain in
                                 * the @ref Efl_Ui_Focus_Manager.
                                 *
                                 * @since 1.22  }
type
  PEfl_Ui_Focus_Manager_Logical_End_Detail = ^TEfl_Ui_Focus_Manager_Logical_End_Detail;
  TEfl_Ui_Focus_Manager_Logical_End_Detail = record
      is_regular_end : TEina_Bool;
      element : PEfl_Ui_Focus_Object;
    end;
{$endif}
{*
 * @brief Interface for managing focus objects.
 *
 * This interface is built in order to support movement of the focus property
 * in a set of widgets. The movement of the focus property can happen in a tree
 * manner, or a graph manner. The movement is also keeping track of the history
 * of focused elements. The tree interpretation differentiates between logical
 * and regular widgets: Logical widgets (typically containers) cannot receive
 * focus, whereas Regular ones (like buttons) can.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_focus_manager_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Moves the focus in the given direction to the next regular widget.
 *
 * This call flushes all changes. This means all changes since last flush are
 * computed.
 *
 * @param[in] obj The object.
 * @param[in] direction The direction to move to.
 *
 * @return The element which is now focused.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
function efl_ui_focus_manager_move(obj:PEo; direction:TEfl_Ui_Focus_Direction):PEfl_Ui_Focus_Object;cdecl;external;
{*
 * @brief Returns the object in the @c direction from @c child.
 *
 * @param[in] obj The object.
 * @param[in] direction Direction to move focus.
 * @param[in] child The child to move from. Pass @c null to indicate the
 * currently focused child.
 * @param[in] logical Wether you want to have a logical node as result or a
 * regular. Note that in a @ref efl_ui_focus_manager_move call logical nodes
 * will not get focus.
 *
 * @return Object that would receive focus if moved in the given direction.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
function efl_ui_focus_manager_request_move(obj:PEo; direction:TEfl_Ui_Focus_Direction; child:PEfl_Ui_Focus_Object; logical:TEina_Bool):PEfl_Ui_Focus_Object;cdecl;external;
{*
 * @brief The element which is currently focused by this manager.
 *
 * Use this property to retrieve the object currently being focused, or to set
 * the focus to a new one. When @c focus is a logical child (which cannot
 * receive focus), the next regular object is selected instead. If there is no
 * such object, focus does not change.
 *
 * @param[in] obj The object.
 * @param[in] focus Currently focused element.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
procedure efl_ui_focus_manager_focus_set(obj:PEo; focus:PEfl_Ui_Focus_Object);cdecl;external;
{*
 * @brief The element which is currently focused by this manager.
 *
 * Use this property to retrieve the object currently being focused, or to set
 * the focus to a new one. When @c focus is a logical child (which cannot
 * receive focus), the next regular object is selected instead. If there is no
 * such object, focus does not change.
 *
 * @param[in] obj The object.
 *
 * @return Currently focused element.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
(* Const before type ignored *)
function efl_ui_focus_manager_focus_get(obj:PEo):PEfl_Ui_Focus_Object;cdecl;external;
{*
 * @brief Add another manager to serve the move requests.
 *
 * If this value is set, all move requests are redirected to this manager
 * object. Set it to @c null once nothing should be redirected anymore.
 *
 * @param[in] obj The object.
 * @param[in] redirect The new focus manager.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
procedure efl_ui_focus_manager_redirect_set(obj:PEo; redirect:PEfl_Ui_Focus_Manager);cdecl;external;
{*
 * @brief Add another manager to serve the move requests.
 *
 * If this value is set, all move requests are redirected to this manager
 * object. Set it to @c null once nothing should be redirected anymore.
 *
 * @param[in] obj The object.
 *
 * @return The new focus manager.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
(* Const before type ignored *)
function efl_ui_focus_manager_redirect_get(obj:PEo):PEfl_Ui_Focus_Manager;cdecl;external;
{*
 * @brief Elements which are at the border of the graph.
 *
 * This means one of the relations right,left or down,up are not set. This call
 * flushes all changes. See @ref efl_ui_focus_manager_move.
 *
 * @param[in] obj The object.
 *
 * @return An iterator over the border objects.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
(* Const before type ignored *)
function efl_ui_focus_manager_border_elements_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief Return @c true if the border elements have changed since the last
 * invocation of @ref efl_ui_focus_manager_border_elements_get
 *
 * @param[in] obj The object.
 *
 * @return @c true if there was a change, @c false if not
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
(* Const before type ignored *)
function efl_ui_focus_manager_border_elements_changed_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Elements that are at the border of the viewport
 *
 * Every element returned by this is located inside the viewport rectangle, but
 * has a right, left, down or up neighbor outside the viewport.
 *
 * @param[in] obj The object.
 * @param[in] viewport The rectangle defining the viewport.
 *
 * @return An iterator over the viewport border objects.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
(* Const before type ignored *)
function efl_ui_focus_manager_viewport_elements_get(obj:PEo; viewport:TEina_Rect):PEina_Iterator;cdecl;external;
{*
 * @brief Root node for all logical sub-trees.
 *
 * This property can only be set once.
 *
 * @param[in] obj The object.
 * @param[in] root Object to register as the root of this manager object.
 *
 * @return @c true on success, @c false if it had already been set.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
function efl_ui_focus_manager_root_set(obj:PEo; root:PEfl_Ui_Focus_Object):TEina_Bool;cdecl;external;
{*
 * @brief Root node for all logical sub-trees.
 *
 * This property can only be set once.
 *
 * @param[in] obj The object.
 *
 * @return Object to register as the root of this manager object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
(* Const before type ignored *)
function efl_ui_focus_manager_root_get(obj:PEo):PEfl_Ui_Focus_Object;cdecl;external;
{*
 * @brief Returns the widget in the direction next.
 *
 * The returned widget is a child of @c root. It's guaranteed that child will
 * not be prepared again, so you can call this function inside a
 * @ref efl_ui_focus_object_setup_order call.
 *
 * @param[in] obj The object.
 * @param[in] root Parent for returned child.
 *
 * @return Child of passed parameter.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
function efl_ui_focus_manager_request_subchild(obj:PEo; root:PEfl_Ui_Focus_Object):PEfl_Ui_Focus_Object;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Fetches the data from a registered node.
 *
 * @note This function triggers a computation of all dirty nodes.
 *
 * @param[in] obj The object.
 * @param[in] child The child object to inspect.
 *
 * @return The list of relations starting from @c child.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
function efl_ui_focus_manager_fetch(obj:PEo; child:PEfl_Ui_Focus_Object):PEfl_Ui_Focus_Relations;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{*
 * @brief Returns the last logical object.
 *
 * The returned object is the last object that would be returned if you start
 * at the root and move in the "next" direction.
 *
 * @param[in] obj The object.
 *
 * @return Last object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }

function efl_ui_focus_manager_logical_end(obj:PEo):TEfl_Ui_Focus_Manager_Logical_End_Detail;cdecl;external;
{*
 * @brief Resets the history stack of this manager object. This means the
 * uppermost element will be unfocused, and all other elements will be removed
 * from the remembered list.
 *
 * You should focus another element immediately after calling this, in order to
 * always have a focused object.
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
procedure efl_ui_focus_manager_reset_history(obj:PEo);cdecl;external;
{*
 * @brief Removes the uppermost history element, and focuses the previous one.
 *
 * If there is an element that was focused before, it will be used. Otherwise,
 * the best fitting element from the registered elements will be focused.
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
procedure efl_ui_focus_manager_pop_history_stack(obj:PEo);cdecl;external;
{*
 * @brief Called when this manager is set as redirect.
 *
 * In case that this is called as a result of a move call, @c direction and
 * @c entry will be set to the direction of the move call, and the @c entry
 * object will be set to the object that had this manager as redirect property.
 *
 * @param[in] obj The object.
 * @param[in] direction The direction in which this should be setup.
 * @param[in] entry The object that caused this manager to be redirect.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
procedure efl_ui_focus_manager_setup_on_first_touch(obj:PEo; direction:TEfl_Ui_Focus_Direction; entry:PEfl_Ui_Focus_Object);cdecl;external;
{*
 * @brief Disables the cache invalidation when an object is moved.
 *
 * Even if an object is moved, the focus manager will not recalculate its
 * relations. This can be used when you know that the set of widgets in the
 * focus manager is moved the same way, so the relations between the widgets in
 * the set do not change and complex calculations can be avoided. Use
 * @ref efl_ui_focus_manager_dirty_logic_unfreeze to re-enable relationship
 * calculation.
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
procedure efl_ui_focus_manager_dirty_logic_freeze(obj:PEo);cdecl;external;
{*
 * @brief Enables the cache invalidation when an object is moved.
 *
 * This is the counterpart to @ref efl_ui_focus_manager_dirty_logic_freeze.
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
procedure efl_ui_focus_manager_dirty_logic_unfreeze(obj:PEo);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_FOCUS_MANAGER_EVENT_REDIRECT_CHANGED : TEfl_Event_Description;cvar;external;
{* Redirect object has changed, the old manager is passed as an event
 * argument.
 * @return Efl_Ui_Focus_Manager *
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
(* Const before type ignored *)
    _EFL_UI_FOCUS_MANAGER_EVENT_FLUSH_PRE : TEfl_Event_Description;cvar;external;
{* After this event, the manager object will calculate relations in the graph.
 * Can be used to add / remove children in a lazy fashion.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
(* Const before type ignored *)
    _EFL_UI_FOCUS_MANAGER_EVENT_COORDS_DIRTY : TEfl_Event_Description;cvar;external;
{* Cached relationship calculation results have been invalidated.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
(* Const before type ignored *)
    _EFL_UI_FOCUS_MANAGER_EVENT_MANAGER_FOCUS_CHANGED : TEfl_Event_Description;cvar;external;
{* The manager_focus property has changed. The previously focused object is
 * passed as an event argument.
 * @return Efl_Ui_Focus_Object *
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }
(* Const before type ignored *)
    _EFL_UI_FOCUS_MANAGER_EVENT_DIRTY_LOGIC_FREEZE_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when this focus manager is frozen or thawed, even_info being @c true
 * indicates that it is now frozen, @c false indicates that it is thawed.
 * @return Eina_Bool
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager
  }

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_EVENT_REDIRECT_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_EVENT_FLUSH_PRE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_EVENT_COORDS_DIRTY : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_EVENT_MANAGER_FOCUS_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_EVENT_DIRTY_LOGIC_FREEZE_CHANGED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_MANAGER_INTERFACE:=efl_ui_focus_manager_interface_get;
  end;

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_EVENT_REDIRECT_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_MANAGER_EVENT_REDIRECT_CHANGED:=@(_EFL_UI_FOCUS_MANAGER_EVENT_REDIRECT_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_EVENT_FLUSH_PRE : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_MANAGER_EVENT_FLUSH_PRE:=@(_EFL_UI_FOCUS_MANAGER_EVENT_FLUSH_PRE);
  end;

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_EVENT_COORDS_DIRTY : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_MANAGER_EVENT_COORDS_DIRTY:=@(_EFL_UI_FOCUS_MANAGER_EVENT_COORDS_DIRTY);
  end;

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_EVENT_MANAGER_FOCUS_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_MANAGER_EVENT_MANAGER_FOCUS_CHANGED:=@(_EFL_UI_FOCUS_MANAGER_EVENT_MANAGER_FOCUS_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_EVENT_DIRTY_LOGIC_FREEZE_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_MANAGER_EVENT_DIRTY_LOGIC_FREEZE_CHANGED:=@(_EFL_UI_FOCUS_MANAGER_EVENT_DIRTY_LOGIC_FREEZE_CHANGED);
  end;


end.
