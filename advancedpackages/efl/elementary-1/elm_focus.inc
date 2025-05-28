{$IFDEF read_interface}


{*
 * @defgroup Elm_Focus Focus
 * @ingroup Elementary
 *
 * An Elementary application has, at all times, one (and only one)
 * @b focused object. This is what determines where the input
 * events go to within the application's window. Also, focused
 * objects can be decorated differently, in order to signal to the
 * user where the input is, at a given moment.
 *
 * Elementary applications also have the concept of <b>focus
 * chain</b>: one can cycle through all the windows' focusable
 * objects by input (tab key) or programmatically. The default
 * focus chain for an application is the one define by the order in
 * which the widgets where added in code. One will cycle through
 * top level widgets, and, for each one containing sub-objects, cycle
 * through them all, before returning to the level
 * above. Elementary also allows one to set @b custom focus chains
 * for their applications.
 *
 * Besides the focused decoration a widget may exhibit, when it
 * gets focus, Elementary has a @b global focus highlight object
 * that can be enabled for a window. If one chooses to do so, this
 * extra highlight effect will surround the current focused object,
 * too.
 *
 * @note Some Elementary widgets are @b unfocusable, after
 * creation, by their very nature: they are not meant to be
 * interacted with input events, but are there just for visual
 * purposes.
 *
 * @ref general_functions_example_page "This" example contemplates
 * some of these functions.
  }
{*
 * Get the whether an Elementary object has the focus or not.
 *
 * @param obj The Elementary object to get the information from
 * @return @c EINA_TRUE, if the object is focused, @c EINA_FALSE if
 *            not (and on errors).
 *
 * @see elm_object_focus_set()
 *
 * @ingroup Elm_Focus
  }

function elm_object_focus_get(obj:PEvas_Object):TEina_Bool;cdecl;external libelementary;
{*
 * Set/unset focus to a given Elementary object.
 *
 * @param obj The Elementary object to operate on.
 * @param focus @c EINA_TRUE Set focus to a given object,
 *              @c EINA_FALSE Unset focus to a given object.
 *
 * @note When you set focus to this object, if it can handle focus, will
 * take the focus away from the one who had it previously and will, for
 * now on, be the one receiving input events. Unsetting focus will remove
 * the focus from @p obj, passing it back to the previous element in the
 * focus chain list.
 *
 * @warning Only visible object can get a focus. Call evas_object_show(o) before
 * calling this API, if you want to give a focus to the evas object.
 *
 * @see elm_object_focus_get(), elm_object_focus_custom_chain_get()
 *
 * @ingroup Elm_Focus
  }
procedure elm_object_focus_set(obj:PEvas_Object; focus:TEina_Bool);cdecl;external libelementary;
{*
 * Set the ability for an Elementary object to be focused
 *
 * @param obj The Elementary object to operate on
 * @param enable @c EINA_TRUE if the object can be focused, @c
 *        EINA_FALSE if not (and on errors)
 *
 * This sets whether the object @p obj is able to take focus or
 * not. Unfocusable objects do nothing when programmatically
 * focused, being the nearest focusable parent object the one
 * really getting focus. Also, when they receive mouse input, they
 * will get the event, but not take away the focus from where it
 * was previously.
 *
 * @ingroup Elm_Focus
  }
procedure elm_object_focus_allow_set(obj:PEvas_Object; enable:TEina_Bool);cdecl;external libelementary;
{*
 * Get whether an Elementary object is focusable or not
 *
 * @param obj The Elementary object to operate on
 * @return @c EINA_TRUE if the object is allowed to be focused, @c
 *             EINA_FALSE if not (and on errors)
 *
 * @note Objects which are meant to be interacted with by input
 * events are created able to be focused, by default. All the
 * others are not.
 *
 * @ingroup Elm_Focus
  }
function elm_object_focus_allow_get(obj:PEvas_Object):TEina_Bool;cdecl;external libelementary;
{*
 * Set custom focus chain.
 *
 * This function overwrites any previous custom focus chain within
 * the list of objects. The previous list will be deleted and this list
 * will be managed by elementary. After it is set, don't modify it.
 *
 * @note On focus cycle, only will be evaluated children of this container.
 *
 * @param obj The container object
 * @param objs Chain of objects to pass focus
 * @ingroup Elm_Focus
  }
procedure elm_object_focus_custom_chain_set(obj:PEvas_Object; objs:PEina_List);cdecl;external libelementary;
{*
 * Unset a custom focus chain on a given Elementary widget
 *
 * @param obj The container object to remove focus chain from
 *
 * Any focus chain previously set on @p obj (for its child objects)
 * is removed entirely after this call.
 *
 * @ingroup Elm_Focus
  }
procedure elm_object_focus_custom_chain_unset(obj:PEvas_Object);cdecl;external libelementary;
{*
 * Get custom focus chain
 *
 * @param obj The container object
 * @return Chain of objects to pass focus.
 * @ingroup Elm_Focus
  }
function elm_object_focus_custom_chain_get(obj:PEvas_Object):PEina_List;cdecl;external libelementary;
{*
 * Append object to custom focus chain.
 *
 * @note If relative_child equal to NULL or not in custom chain, the object
 * will be added in end.
 *
 * @note On focus cycle, only will be evaluated children of this container.
 *
 * @param obj The container object
 * @param child The child to be added in custom chain
 * @param relative_child The relative object to position the child
 * @ingroup Elm_Focus
  }
procedure elm_object_focus_custom_chain_append(obj:PEvas_Object; child:PEvas_Object; relative_child:PEvas_Object);cdecl;external libelementary;
{*
 * Prepend object to custom focus chain.
 *
 * @note If relative_child equal to NULL or not in custom chain, the object
 * will be added in begin.
 *
 * @note On focus cycle, only will be evaluated children of this container.
 *
 * @param obj The container object
 * @param child The child to be added in custom chain
 * @param relative_child The relative object to position the child
 * @ingroup Elm_Focus
  }
procedure elm_object_focus_custom_chain_prepend(obj:PEvas_Object; child:PEvas_Object; relative_child:PEvas_Object);cdecl;external libelementary;
{*
 * Give focus to next object in object tree.
 *
 * Give focus to next object in focus chain of one object sub-tree.
 * If the last object of chain already have focus, the focus will go to the
 * first object of chain.
 *
 * @param obj The object root of sub-tree
 * @param dir Direction to move the focus
 *
 * @see elm_object_focus_next_object_get(), elm_object_focus_next_object_set()
 *
 * @ingroup Elm_Focus
  }
procedure elm_object_focus_next(obj:PEvas_Object; dir:TElm_Focus_Direction);cdecl;external libelementary;
{*
 * Get next object which was set with specific focus direction.
 *
 * Get next object which was set by elm_object_focus_next_object_set
 * with specific focus direction.
 *
 * @param obj The Elementary object
 * @param dir Focus direction
 * @return Focus next object or @c NULL, if there is no focus next object.
 *
 * @see elm_object_focus_next_object_set(), elm_object_focus_next()
 *
 * @since 1.8
 *
 * @ingroup Elm_Focus
  }
function elm_object_focus_next_object_get(obj:PEvas_Object; dir:TElm_Focus_Direction):PEvas_Object;cdecl;external libelementary;
{*
 * Set next object with specific focus direction.
 *
 * When focus next object is set with specific focus direction, this object
 * will be the first candidate when finding next focusable object.
 * Focus next object can be registered with six directions that are previous,
 * next, up, down, right, and left.
 *
 * @param obj The Elementary object
 * @param next Focus next object
 * @param dir Focus direction
 *
 * @see elm_object_focus_next_object_get(), elm_object_focus_next()
 *
 * @since 1.8
 *
 * @ingroup Elm_Focus
  }
procedure elm_object_focus_next_object_set(obj:PEvas_Object; next:PEvas_Object; dir:TElm_Focus_Direction);cdecl;external libelementary;
{*
 * Get focused object in object tree.
 *
 * This function returns current focused object in one object sub-tree.
 *
 * @param obj The object root of sub-tree
 * @return Current focused or @c NULL, if there is no focused object.
 *
 * @since 1.8
 *
 * @ingroup Elm_Focus
  }
function elm_object_focused_object_get(obj:PEvas_Object):PEvas_Object;cdecl;external libelementary;
{*
 * Make the elementary object and its children to be focusable
 * (or unfocusable).
 *
 * @param obj The Elementary object to operate on
 * @param focusable @c EINA_TRUE for focusable,
 *        @c EINA_FALSE for unfocusable.
 *
 * This sets whether the object @p obj and its children objects
 * are able to take focus or not. If the tree is set as unfocusable,
 * newest focused object which is not in this tree will get focus.
 * This API can be helpful for an object to be deleted.
 * When an object will be deleted soon, it and its children may not
 * want to get focus (by focus reverting or by other focus controls).
 * Then, just use this API before deleting.
 *
 * @see elm_object_tree_focus_allow_get()
 *
 * @ingroup Elm_Focus
 *
  }
procedure elm_object_tree_focus_allow_set(obj:PEvas_Object; focusable:TEina_Bool);cdecl;external libelementary;
{*
 * Get whether an Elementary object and its children are focusable or not.
 *
 * @param obj The Elementary object to get the information from
 * @return @c EINA_TRUE, if the tree is focusable,
 *         @c EINA_FALSE if not (and on errors).
 *
 * @see elm_object_tree_focus_allow_set()
 *
 * @ingroup Elm_Focus
  }
function elm_object_tree_focus_allow_get(obj:PEvas_Object):TEina_Bool;cdecl;external libelementary;
{*
 * Set the focus highlight style to be used by a given widget.
 *
 * @param obj The Elementary widget for which focus style needs to be set.
 * @param style The name of the focus style to use on it.
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * @note This overrides the style which is set
 * by elm_win_focus_highlight_style_set().
 *
 * @see elm_object_focus_highlight_style_get
 *
 * @since 1.9
 *
 * @ingroup Elm_Focus
  }
function elm_object_focus_highlight_style_set(obj:PEvas_Object; style:Pchar):TEina_Bool;cdecl;external libelementary;
{*
 * Get the focus highlight style to be used by a given widget.
 *
 * @param obj The Elementary widget to query for its focus highlight style.
 * @return The focus highlight style name used by widget.
 *
 * @see elm_object_focus_highlight_style_set()
 *
 * @since 1.9
 *
 * @ingroup Elm_Focus
  }
function elm_object_focus_highlight_style_get(obj:PEvas_Object):Pchar;cdecl;external libelementary;
{*
 * Set the focus movement policy to a given Elementary object.
 *
 * @param obj The Elementary object to operate on
 * @param policy A policy to apply for the focus movement
 *
 * @see elm_object_focus_move_policy_get
 *
 * @since 1.15
 *
 * @ingroup Elm_Focus
  }
procedure elm_object_focus_move_policy_set(obj:PEvas_Object; policy:TElm_Focus_Move_Policy);cdecl;external libelementary;
{*
 * Get the focus movement policy from a given Elementary object.
 *
 * @param obj The Elementary widget to get the information from
 * @return The focus movement policy
 *
 * Get how the focus is moved to the give Elementary object. It can be
 * #ELM_FOCUS_MOVE_POLICY_CLICK, #ELM_FOCUS_MOVE_POLICY_IN,
 * or #ELM_FOCUS_MOVE_POLICY_KEY_ONLY.
 * The first means elementary focus is moved on elementary object click.
 * The second means elementary focus is moved on elementary object mouse in.
 * The last means elementary focus is moved only by key input like Left,
 * Right, Up, Down, Tab, or Shift+Tab.
 *
 * @see elm_object_focus_move_policy_set
 *
 * @since 1.15
 *
 * @ingroup Elm_Focus
  }
function elm_object_focus_move_policy_get(obj:PEvas_Object):TElm_Focus_Move_Policy;cdecl;external libelementary;
{*
 * Set the focus region show mode to a given Elementary object.
 *
 * @param obj The Elementary object to operate on
 * @param mode A mode to show the focus region
 *
 * @see elm_object_focus_region_show_mode_get
 *
 * When the focus is move to the object in scroller, it is scrolled
 * to show the focus region as a widget. If the focus region want to be shown
 * as an item, set the mode ELM_FOCUS_REGION_SHOW_ITEM.
 * If then, it will be scrolled as an item.
 *
 * This API is only implemented for Elm_Gengrid widgets. Every other widgets will always automatically show the widget.
 *
 * @since 1.16
 *
 * @ingroup Elm_Focus
  }
procedure elm_object_focus_region_show_mode_set(obj:PEvas_Object; mode:TElm_Focus_Region_Show_Mode);cdecl;external libelementary;
{*
 * Get the focus region show mode to a given Elementary object.
 *
 * @param obj The Elementary object to get the information from
 * @return The focus region shown mode
 *
 * @see elm_object_focus_region_show_mode_set
 *
 * @since 1.16
 *
 * @ingroup Elm_Focus
  }
function elm_object_focus_region_show_mode_get(obj:PEvas_Object):TElm_Focus_Region_Show_Mode;cdecl;external libelementary;
{*
 * Returns the widget's focus movement policy mode setting.
 *
 * @param obj The widget.
 * @return focus movement policy mode setting of the object.
 *
 * @see elm_object_focus_move_policy_automatic_set
 *
 * @since 1.18
 *
 * @ingroup Focus
  }
function elm_object_focus_move_policy_automatic_get(obj:PEvas_Object):TEina_Bool;cdecl;external libelementary;
{*
 * Sets the widget's focus movement policy mode setting.
 * When widget in automatic mode, it follows the system focus movement policy mode
 * set by elm_config_focus_move_policy_set().
 * @param obj The widget.
 * @param automatic @c EINA_TRUE for auto focus_move_policy mode. @c EINA_FALSE for
 * manual.
 *
 * @see elm_object_focus_move_policy_automatic_get
 *
 * @since 1.18
 *
 * @ingroup Focus
  }
procedure elm_object_focus_move_policy_automatic_set(obj:PEvas_Object; automatic:TEina_Bool);cdecl;external libelementary;

// === Konventiert am: 27-5-25 16:50:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
