
unit efl_canvas_group_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_group_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_group_eo.h
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
PEfl_Canvas_Group  = ^Efl_Canvas_Group;
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEfl_Class  = ^Efl_Class;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_GROUP_EO_H_}
{$define _EFL_CANVAS_GROUP_EO_H_}
{$ifndef _EFL_CANVAS_GROUP_EO_CLASS_TYPE}
{$define _EFL_CANVAS_GROUP_EO_CLASS_TYPE}
type
  PEfl_Canvas_Group = ^TEfl_Canvas_Group;
  TEfl_Canvas_Group = TEo;
{$endif}
{$ifndef _EFL_CANVAS_GROUP_EO_TYPES}
{$define _EFL_CANVAS_GROUP_EO_TYPES}
{$endif}
{*
 * @brief A group object is a container for other canvas objects. Its children
 * move along their parent and are often clipped with a common clipper. This is
 * part of the legacy smart object concept.
 *
 * A group is not necessarily a container (see @ref Efl_Container) in the sense
 * that a standard widget may not have any empty slots for content. However
 * it's still a group of low-level canvas objects (clipper, raw objects, etc.).
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Group
  }

{ was #define dname def_expr }
function EFL_CANVAS_GROUP_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_group_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Indicates that the group's layout needs to be recalculated.
 *
 * If this flag is set, then the @ref efl_canvas_group_calculate function will
 * be called, during rendering phase of the canvas. After that, this flag will
 * be automatically unset.
 *
 * @note setting this flag alone will not make the canvas' whole scene dirty.
 * Using evas_render() will have no effect. To force this, use
 * @ref efl_canvas_group_change, which will also call this function
 * automatically, with the parameter set to @c true.
 *
 * See also @ref efl_canvas_group_calculate.
 *
 * @param[in] obj The object.
 * @param[in] value @c true if the group layout needs to be recalculated,
 * @c false otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Group
  }
procedure efl_canvas_group_need_recalculate_set(obj:PEo; value:TEina_Bool);cdecl;external;
{*
 * @brief Indicates that the group's layout needs to be recalculated.
 *
 * If this flag is set, then the @ref efl_canvas_group_calculate function will
 * be called, during rendering phase of the canvas. After that, this flag will
 * be automatically unset.
 *
 * @note setting this flag alone will not make the canvas' whole scene dirty.
 * Using evas_render() will have no effect. To force this, use
 * @ref efl_canvas_group_change, which will also call this function
 * automatically, with the parameter set to @c true.
 *
 * See also @ref efl_canvas_group_calculate.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the group layout needs to be recalculated, @c false
 * otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Group
  }
(* Const before type ignored *)
function efl_canvas_group_need_recalculate_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Marks the object as dirty.
 *
 * This also forcefully marks the given object as needing recalculation. As an
 * effect, on the next rendering cycle its @ref efl_canvas_group_calculate
 * method will be called.
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Group
  }
procedure efl_canvas_group_change(obj:PEo);cdecl;external;
{*
 * @brief Triggers an immediate recalculation of this object's geometry.
 *
 * This will also reset the flag @ref efl_canvas_group_need_recalculate_get.
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Group
  }
procedure efl_canvas_group_calculate(obj:PEo);cdecl;external;
{*
 * @brief Returns an iterator over the children of this object, which are
 * canvas objects.
 *
 * This returns the list of "smart" children. This might be different from both
 * the @ref Efl_Object children list as well as the @ref Efl_Container content
 * list.
 *
 * @param[in] obj The object.
 *
 * @return Iterator to object children
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Group
  }
(* Const before type ignored *)
function efl_canvas_group_members_iterate(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief Set a canvas object as a member of a given group (or smart object).
 *
 * Members will automatically be stacked and layered together with the smart
 * object. The various stacking functions will operate on members relative to
 * the other members instead of the entire canvas, since they now live on an
 * exclusive layer (see @ref efl_gfx_stack_above(), for more details).
 *
 * Subclasses inheriting from this one may override this function to ensure the
 * proper stacking of special objects, such as clippers, event rectangles,
 * etc...
 *
 * See also @ref efl_canvas_group_member_remove. See also
 * @ref efl_canvas_group_member_is.
 *
 * @param[in] obj The object.
 * @param[in] sub_obj The member object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Group
  }
procedure efl_canvas_group_member_add(obj:PEo; sub_obj:PEfl_Canvas_Object);cdecl;external;
{*
 * @brief Removes a member object from a given smart object.
 *
 * This removes a member object from a smart object, if it was added to any.
 * The object will still be on the canvas, but no longer associated with
 * whichever smart object it was associated with.
 *
 * See also @ref efl_canvas_group_member_add. See also
 * @ref efl_canvas_group_member_is.
 *
 * @param[in] obj The object.
 * @param[in] sub_obj The member object to remove.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Group
  }
procedure efl_canvas_group_member_remove(obj:PEo; sub_obj:PEfl_Canvas_Object);cdecl;external;
{*
 * @brief Finds out if a given object is a member of this group.
 *
 * @param[in] obj The object.
 * @param[in] sub_obj A potential sub object.
 *
 * @return @c true if @c sub_obj is a member of this group.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_canvas_group_member_is(obj:PEo; sub_obj:PEfl_Canvas_Object):TEina_Bool;cdecl;external;
{$ifdef EFL_CANVAS_GROUP_PROTECTED}
{*
 * @brief The internal clipper object used by this group.
 *
 * This is the object clipping all the child objects. Do not delete or
 * otherwise modify this clipper!
 *
 * @param[in] obj The object.
 *
 * @return A clipper rectangle.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_canvas_group_clipper_get(obj:PEo):PEfl_Canvas_Object;cdecl;external;
{$endif}
(* Const before type ignored *)
  var
    _EFL_CANVAS_GROUP_EVENT_MEMBER_ADDED : TEfl_Event_Description;cvar;external;
{* Called when a member is added to the group.
 * @return Efl_Gfx_Entity *
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Group
  }

{ was #define dname def_expr }
function EFL_CANVAS_GROUP_EVENT_MEMBER_ADDED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_CANVAS_GROUP_EVENT_MEMBER_REMOVED : TEfl_Event_Description;cvar;external;
{* Called when a member is removed from the group.
 * @return Efl_Gfx_Entity *
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Group
  }

{ was #define dname def_expr }
function EFL_CANVAS_GROUP_EVENT_MEMBER_REMOVED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_GROUP_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_GROUP_CLASS:=efl_canvas_group_class_get;
  end;

{ was #define dname def_expr }
function EFL_CANVAS_GROUP_EVENT_MEMBER_ADDED : longint; { return type might be wrong }
  begin
    EFL_CANVAS_GROUP_EVENT_MEMBER_ADDED:=@(_EFL_CANVAS_GROUP_EVENT_MEMBER_ADDED);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_GROUP_EVENT_MEMBER_REMOVED : longint; { return type might be wrong }
  begin
    EFL_CANVAS_GROUP_EVENT_MEMBER_REMOVED:=@(_EFL_CANVAS_GROUP_EVENT_MEMBER_REMOVED);
  end;


end.
