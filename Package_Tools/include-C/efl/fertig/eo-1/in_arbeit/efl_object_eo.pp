
unit efl_object_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_object_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_object_eo.h
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
PEfl_Callback_Priority  = ^Efl_Callback_Priority;
PEfl_Class  = ^Efl_Class;
PEfl_Event_Description  = ^Efl_Event_Description;
PEfl_Object  = ^Efl_Object;
PEina_Iterator  = ^Eina_Iterator;
PEina_Strbuf  = ^Eina_Strbuf;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_OBJECT_EO_H_}
{$define _EFL_OBJECT_EO_H_}
{$ifndef _EFL_OBJECT_EO_CLASS_TYPE}
{$define _EFL_OBJECT_EO_CLASS_TYPE}
type
  PEfl_Object = ^TEfl_Object;
  TEfl_Object = TEo;
{$endif}
{$ifndef _EFL_OBJECT_EO_TYPES}
{$define _EFL_OBJECT_EO_TYPES}
{* This struct holds the description of a specific event.
 *
 * @since 1.22
 *
 * @ingroup Efl_Event_Description
  }
(* Const before type ignored *)
{*< name of the event.
                     *
                     * @since 1.22  }
{*< @c true if the event cannot be frozen.
                          *
                          * @since 1.22  }
{*< Internal use: @c true if a legacy event.
                        *
                        * @since 1.22  }
{*< @c true if when the event is triggered again from a
                      * callback it'll start from where it was
                      *
                      * @since 1.22  }
type
  PEfl_Event_Description = ^TEfl_Event_Description;
  TEfl_Event_Description = record
      name : Pchar;
      unfreezable : TEina_Bool;
      legacy_is : TEina_Bool;
      restart : TEina_Bool;
    end;
{*
 * @brief Callback priority. Range is -32k - 32k. The lower the number, the
 * higher the priority.
 *
 * This is used to insert an event handler relative to the existing stack of
 * sorted event handlers according to that priority. All event handlers always
 * have a priority. If not specified @ref EFL_CALLBACK_PRIORITY_DEFAULT is to
 * be assumed.
 *
 * See @ref EFL_CALLBACK_PRIORITY_BEFORE @ref EFL_CALLBACK_PRIORITY_DEFAULT
 *  @ref EFL_CALLBACK_PRIORITY_AFTER
 *
 * @since 1.22
 *
 * @ingroup Efl_Callback_Priority
  }

  PEfl_Callback_Priority = ^TEfl_Callback_Priority;
  TEfl_Callback_Priority = smallint;
{$ifndef EFL_CALLBACK_PRIORITY_BEFORE}
{* Slightly more prioritized than default.
 *
 * @since 1.22
 *
 * @ingroup Efl_Callback_Priority_Before
  }
{ +100  }

const
  EFL_CALLBACK_PRIORITY_BEFORE = -(100);  
{$endif}
{$ifndef EFL_CALLBACK_PRIORITY_DEFAULT}
{* Default priority.
 *
 * @since 1.22
 *
 * @ingroup Efl_Callback_Priority_Default
  }

const
  EFL_CALLBACK_PRIORITY_DEFAULT = 0;  
{$endif}
{$ifndef EFL_CALLBACK_PRIORITY_AFTER}
{* Slightly less prioritized than default.
 *
 * @since 1.22
 *
 * @ingroup Efl_Callback_Priority_After
  }

const
  EFL_CALLBACK_PRIORITY_AFTER = 100;  
{$endif}
{$endif}
{*
 * @brief Abstract EFL object class.
 *
 * All EFL objects inherit from this class, which provides basic functionality
 * like naming, debugging, hierarchy traversal, event emission and life cycle
 * management.
 *
 * Life Cycle Objects are created with efl_add() and mostly disposed of with
 * efl_del(). As an optimization, efl_add() accepts a list of initialization
 * functions which the programmer can use to further customize the object
 * before it is fully constructed. Also, objects can have a parent which will
 * keep them alive as long as the parent is alive, so the programmer does not
 * need to keep track of references. (See the @ref efl_parent_get property for
 * details). Due to the above characteristics, EFL objects undergo the
 * following phases during their Life Cycle: - Construction: The
 * @ref efl_constructor method is called. Afterwards, any user-supplied
 * initialization methods are called. - Finalization: The @ref efl_finalize
 * method is called and @ref efl_finalized_get is set to @c true when it
 * returns. Object is usable at this point. - Invalidation: The object has lost
 * its parent. The @ref efl_invalidate method is called so all the object's
 * relationships can be terminated. @ref efl_invalidated_get is set to @c true.
 * - Destruction: The object has no parent and it can be destroyed. The
 * @ref efl_destructor method is called, use it to return any resources the
 * object might have gathered during its life.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }

{ was #define dname def_expr }
function EFL_OBJECT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_object_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The parent of an object.
 *
 * Parents keep references to their children and will release these references
 * when destroyed. In this way, objects can be assigned to a parent upon
 * creation, tying their life cycle so the programmer does not need to worry
 * about destroying the child object. In order to destroy an object before its
 * parent, set the parent to @c NULL and use efl_unref(), or use efl_del()
 * directly.
 *
 * The Eo parent is conceptually user set. That means that a parent should not
 * be changed behind the scenes in an unexpected way.
 *
 * For example: If you have a widget which can swallow objects into an internal
 * box, the parent of the swallowed objects should be the widget, not the
 * internal box. The user is not even aware of the existence of the internal
 * box.
 *
 * @param[in] obj The object.
 * @param[in] parent The new parent.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
procedure efl_parent_set(obj:PEo; parent:PEfl_Object);cdecl;external;
{*
 * @brief The parent of an object.
 *
 * Parents keep references to their children and will release these references
 * when destroyed. In this way, objects can be assigned to a parent upon
 * creation, tying their life cycle so the programmer does not need to worry
 * about destroying the child object. In order to destroy an object before its
 * parent, set the parent to @c NULL and use efl_unref(), or use efl_del()
 * directly.
 *
 * The Eo parent is conceptually user set. That means that a parent should not
 * be changed behind the scenes in an unexpected way.
 *
 * For example: If you have a widget which can swallow objects into an internal
 * box, the parent of the swallowed objects should be the widget, not the
 * internal box. The user is not even aware of the existence of the internal
 * box.
 *
 * @param[in] obj The object.
 *
 * @return The new parent.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
function efl_parent_get(obj:PEo):PEfl_Object;cdecl;external;
{*
 * @brief The name of the object.
 *
 * Every EFL object can have a name. Names may not contain the following
 * characters: / ? * [ ] ! \ : Using any of these in a name will result in
 * undefined behavior later on. An empty string is considered the same as a
 * @c NULL string or no string for the name.
 *
 * @param[in] obj The object.
 * @param[in] name The name.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
procedure efl_name_set(obj:PEo; name:Pchar);cdecl;external;
{*
 * @brief The name of the object.
 *
 * Every EFL object can have a name. Names may not contain the following
 * characters: / ? * [ ] ! \ : Using any of these in a name will result in
 * undefined behavior later on. An empty string is considered the same as a
 * @c NULL string or no string for the name.
 *
 * @param[in] obj The object.
 *
 * @return The name.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_name_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief A human readable comment for the object.
 *
 * Every EFL object can have a comment. This is intended for developers and
 * debugging. An empty string is considered the same as a @c NULL string or no
 * string for the comment.
 *
 * @param[in] obj The object.
 * @param[in] comment The comment.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
procedure efl_comment_set(obj:PEo; comment:Pchar);cdecl;external;
{*
 * @brief A human readable comment for the object.
 *
 * Every EFL object can have a comment. This is intended for developers and
 * debugging. An empty string is considered the same as a @c NULL string or no
 * string for the comment.
 *
 * @param[in] obj The object.
 *
 * @return The comment.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_comment_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief Build a read-only name for this object used for debugging.
 *
 * Multiple calls using efl_super() can be chained in order to build the entire
 * debug name, from parent to child classes. In C the usual way to build the
 * string is as follows:
 *
 * efl_debug_name_override(efl_super(obj, MY_CLASS), sb);
 * eina_strbuf_append_printf(sb, "new_information");
 *
 * Usually more debug information should be added to @c sb after calling the
 * super function.
 *
 * @param[in] obj The object.
 * @param[in] sb A string buffer, must not be @c null.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
procedure efl_debug_name_override(obj:PEo; sb:PEina_Strbuf);cdecl;external;
{*
 * @brief Return the global count of freeze events.
 *
 * This is the amount of calls to @ref efl_event_global_freeze minus the amount
 * of calls to @ref efl_event_global_thaw. EFL will not emit any event while
 * this count is > 0 (Except events marked @c hot).
 *
 * @return The global event freeze count.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
function efl_event_global_freeze_count_get:longint;cdecl;external;
{*
 * @brief Return the count of freeze events for this object.
 *
 * This is the amount of calls to @ref efl_event_freeze minus the amount of
 * calls to @ref efl_event_thaw. This object will not emit any event while this
 * count is > 0 (Except events marked @c hot).
 *
 * @param[in] obj The object.
 *
 * @return The event freeze count of this object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
function efl_event_freeze_count_get(obj:PEo):longint;cdecl;external;
{*
 * @brief @c true if the object has been finalized, i.e. construction has
 * finished. See the Life Cycle section in this class' description.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the object is finalized, @c false otherwise.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
function efl_finalized_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief @c true if the object has been invalidated, i.e. it has no parent.
 * See the Life Cycle section in this class' description.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the object is invalidated, @c false otherwise.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
function efl_invalidated_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief @c true if the object has started the invalidation phase, but has not
 * finished it yet. Note: This might become @c true before @ref efl_invalidate
 * is called. See the Life Cycle section in this class' description.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the object is invalidating, @c false otherwise.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
function efl_invalidating_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Searches upwards in the object tree for a provider which knows the
 * given class/interface.
 *
 * The object from the provider will then be returned. The base implementation
 * calls the provider_find function on the object parent, and returns its
 * result. If no parent is present @c NULL is returned. Each implementation has
 * to support this function by overriding it and returning itself if the
 * interface matches the parameter. If this is not done the class cannot be
 * found up in the object tree.
 *
 * @param[in] obj The object.
 * @param[in] klass The class identifier to search for.
 *
 * @return Object from the provider list.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_provider_find(obj:PEo; klass:PEfl_Class):PEfl_Object;cdecl;external;
{*
 * @brief Implement this method to provide optional initialization code for
 * your object.
 *
 * See the Life Cycle section in this class' description.
 *
 * @param[in] obj The object.
 *
 * @return The new object, can be @c NULL if aborted.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
function efl_constructor(obj:PEo):PEfl_Object;cdecl;external;
{*
 * @brief Implement this method to provide deinitialization code for your
 * object if you need it.
 *
 * Will be called once @ref efl_invalidate has returned. See the Life Cycle
 * section in this class' description.
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
procedure efl_destructor(obj:PEo);cdecl;external;
{*
 * @brief Implement this method to finish the initialization of your object
 * after all (if any) user-provided configuration methods have been executed.
 *
 * Use this method to delay expensive operations until user configuration has
 * finished, to avoid building the object in a "default" state in the
 * constructor, just to have to throw it all away because a user configuration
 * (a property being set, for example) requires a different state. This is the
 * last call inside efl_add() and will set @ref efl_finalized_get to @c true
 * once it returns. This is an optimization and implementing this method is
 * optional if you already perform all your initialization in the
 * @ref efl_constructor method. See the Life Cycle section in this class'
 * description.
 *
 * @param[in] obj The object.
 *
 * @return The new object. Return @c NULL to abort object creation.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
function efl_finalize(obj:PEo):PEfl_Object;cdecl;external;
{*
 * @brief Implement this method to perform special actions when your object
 * loses its parent, if you need to.
 *
 * It is called when the parent reference is lost or set to @c NULL. After this
 * call returns, @ref efl_invalidated_get is set to @c true. This allows a
 * simpler tear down of complex hierarchies, by performing object destruction
 * in two steps, first all object relationships are broken and then the
 * isolated objects are destroyed. Performing everything in the
 * @ref efl_destructor can sometimes lead to deadlocks, but implementing this
 * method is optional if this is not your case. When an object with a parent is
 * destroyed, it first receives a call to @ref efl_invalidate and then to
 * @ref efl_destructor. See the Life Cycle section in this class' description.
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
procedure efl_invalidate(obj:PEo);cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Find a child object with the given name and return it.
 *
 * The search string can be a glob (shell style, using *). It can also specify
 * class name in the format of "class:name" where ":" separates class and name.
 * Both class and name can be globs. If the class is specified but the name is
 * empty like "class:" then the search will match any object of that class.
 *
 * @param[in] obj The object.
 * @param[in] search The name search string.
 *
 * @return The first object found.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_name_find(obj:PEo; search:Pchar):PEfl_Object;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{*
 * @brief Thaw events of object.
 *
 * Allows event callbacks to be called again for this object after a call to
 * @ref efl_event_freeze. The amount of thaws must match the amount of freezes
 * for events to be re-enabled.
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }

procedure efl_event_thaw(obj:PEo);cdecl;external;
{*
 * @brief Freeze events of this object.
 *
 * Prevents event callbacks from being called for this object. Enable events
 * again using @ref efl_event_thaw. Events marked @c hot cannot be stopped.
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
procedure efl_event_freeze(obj:PEo);cdecl;external;
{*
 * @brief Globally thaw events for ALL EFL OBJECTS.
 *
 * Allows event callbacks to be called for all EFL objects after they have been
 * disabled by @ref efl_event_global_freeze. The amount of thaws must match the
 * amount of freezes for events to be re-enabled.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
procedure efl_event_global_thaw;cdecl;external;
{*
 * @brief Globally freeze events for ALL EFL OBJECTS.
 *
 * Prevents event callbacks from being called for all EFL objects. Enable
 * events again using @ref efl_event_global_thaw. Events marked @c hot cannot
 * be stopped.
 *
 * @note USE WITH CAUTION.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
procedure efl_event_global_freeze;cdecl;external;
{*
 * @brief Stop the current callback call.
 *
 * This stops the current callback call. Any other callbacks for the current
 * event will not be called. This is useful when you want to filter out events.
 * Just add higher priority events and call this under certain conditions to
 * block a certain event.
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
procedure efl_event_callback_stop(obj:PEo);cdecl;external;
{*
 * @brief Add an event callback forwarder that will make this object emit an
 * event whenever another object ($source) emits it. The event is said to be
 * forwarded from @c source to this object.
 *
 * The event is unaffected on @c source and behave like any other event being
 * propagated on any object and will trigger all the handler registered on
 * @c source like nothing special happened.
 *
 * This allow object that hide internally another object to easily be able to
 * propagate an event without the need to add custom handler.
 *
 * @note The priority is used to make sure that you are intercepting the event
 * when you expect by inserting a handler at the right position in the stack of
 * event handler on the object that emit the event.
 *
 * @param[in] obj The object.
 * @param[in] desc The description of the event to listen to
 * @param[in] priority The priority at which to insert the event forwarder
 * handler in the existing list of handler on the source of event object. The
 * lower the number, the higher the priority. As a shortcut
 * @ref EFL_CALLBACK_PRIORITY_BEFORE, @ref EFL_CALLBACK_PRIORITY_DEFAULT and
 * @ref EFL_CALLBACK_PRIORITY_AFTER can be used. See @ref Efl_Callback_Priority
 * for more details.
 * @param[in] source The object which emits the initial event
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
procedure efl_event_callback_forwarder_priority_add(obj:PEo; desc:PEfl_Event_Description; priority:TEfl_Callback_Priority; source:PEfl_Object);cdecl;external;
{*
 * @brief Remove an event callback forwarder for a specified event and object.
 *
 * @param[in] obj The object.
 * @param[in] desc The description of the event to listen to
 * @param[in] new_obj The object to emit events from
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
procedure efl_event_callback_forwarder_del(obj:PEo; desc:PEfl_Event_Description; new_obj:PEfl_Object);cdecl;external;
{*
 * @brief Get an iterator on all children.
 *
 * @param[in] obj The object.
 *
 * @return Children iterator
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
function efl_children_iterator_new(obj:PEo):PEina_Iterator;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Make an object a composite object of another.
 *
 * The class of comp_obj must be part of the extensions of the class of the
 * parent. It isn't possible to attach more then 1 composite of the same class.
 * This function also sets the parent of comp_obj to parent.
 *
 * See @ref efl_composite_detach, @ref efl_composite_part_is.
 *
 * @param[in] obj The object.
 * @param[in] comp_obj the object that will be used to composite the parent.
 *
 * @return @c true if successful. @c false otherwise.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
function efl_composite_attach(obj:PEo; comp_obj:PEfl_Object):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Detach a composite object from another object.
 *
 * This functions also sets the parent of comp_obj to @c null.
 *
 * See @ref efl_composite_attach, @ref efl_composite_part_is.
 *
 * @param[in] obj The object.
 * @param[in] comp_obj The object that will be removed from the parent.
 *
 * @return @c true if successful. @c false otherwise.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }

function efl_composite_detach(obj:PEo; comp_obj:PEfl_Object):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Check if an object is part of a composite object.
 *
 * See @ref efl_composite_attach, @ref efl_composite_part_is.
 *
 * @param[in] obj The object.
 *
 * @return @c true if it is. @c false otherwise.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }

function efl_composite_part_is(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Allow an object to be deleted by unref even if it has a parent.
 *
 * This simply hides the error message warning that an object being destroyed
 * still has a parent. This property is false by default.
 *
 * In a normal object use case, when ownership of an object is given to a
 * caller, said ownership should be released with efl_unref(). If the object
 * has a parent, this will print error messages, as efl_unref() is stealing the
 * ref from the parent.
 *
 * @warning Use this function very carefully, unless you're absolutely sure of
 * what you are doing.
 *
 * @param[in] obj The object.
 * @param[in] allow Whether to allow efl_unref() to zero even if
 * @ref efl_parent_get is not @c null.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }

procedure efl_allow_parent_unref_set(obj:PEo; allow:TEina_Bool);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Allow an object to be deleted by unref even if it has a parent.
 *
 * This simply hides the error message warning that an object being destroyed
 * still has a parent. This property is false by default.
 *
 * In a normal object use case, when ownership of an object is given to a
 * caller, said ownership should be released with efl_unref(). If the object
 * has a parent, this will print error messages, as efl_unref() is stealing the
 * ref from the parent.
 *
 * @warning Use this function very carefully, unless you're absolutely sure of
 * what you are doing.
 *
 * @param[in] obj The object.
 *
 * @return Whether to allow efl_unref() to zero even if @ref efl_parent_get is
 * not @c null.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)

function efl_allow_parent_unref_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{*
 * @brief Will register a manager of a specific class to be answered by
 * @ref efl_provider_find.
 *
 * @param[in] obj The object.
 * @param[in] klass The class provided by the registered provider.
 * @param[in] provider The provider for the newly registered class that has to
 * provide that said Efl.Class.
 *
 * @return @c true if successfully register, @c false otherwise.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_provider_register(obj:PEo; klass:PEfl_Class; provider:PEfl_Object):TEina_Bool;cdecl;external;
{*
 * @brief Will unregister a manager of a specific class that was previously
 * registered and answered by @ref efl_provider_find.
 *
 * @param[in] obj The object.
 * @param[in] klass The class provided by the provider to unregister for.
 * @param[in] provider The provider for the registered class to unregister.
 *
 * @return @c true if successfully unregistered, @c false otherwise.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_provider_unregister(obj:PEo; klass:PEfl_Class; provider:PEfl_Object):TEina_Bool;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_EVENT_DEL : TEfl_Event_Description;cvar;external;
{* Object is being deleted. See @ref efl_destructor.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }

{ was #define dname def_expr }
function EFL_EVENT_DEL : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_INVALIDATE : TEfl_Event_Description;cvar;external;
{* Object is being invalidated and losing its parent. See @ref efl_invalidate.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }

{ was #define dname def_expr }
function EFL_EVENT_INVALIDATE : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_NOREF : TEfl_Event_Description;cvar;external;
{* Object has lost its last reference, only parent relationship is keeping it
 * alive. Advanced usage.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }

{ was #define dname def_expr }
function EFL_EVENT_NOREF : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_OWNERSHIP_UNIQUE : TEfl_Event_Description;cvar;external;
{* Object has lost a reference and only one is left. It has just one owner
 * now. Triggered whenever the refcount goes from two to one.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }

{ was #define dname def_expr }
function EFL_EVENT_OWNERSHIP_UNIQUE : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_OWNERSHIP_SHARED : TEfl_Event_Description;cvar;external;
{* Object has acquired a second reference. It has multiple owners now.
 * Triggered whenever increasing the refcount from one to two, it will not
 * trigger by further increasing the refcount beyond two.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }

{ was #define dname def_expr }
function EFL_EVENT_OWNERSHIP_SHARED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_DESTRUCT : TEfl_Event_Description;cvar;external;
{* Object has been fully destroyed. It can not be used beyond this point. This
 * event should only serve to clean up any reference you keep to the object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Object
  }

{ was #define dname def_expr }
function EFL_EVENT_DESTRUCT : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_OBJECT_CLASS : longint; { return type might be wrong }
  begin
    EFL_OBJECT_CLASS:=efl_object_class_get;
  end;

{ was #define dname def_expr }
function EFL_EVENT_DEL : longint; { return type might be wrong }
  begin
    EFL_EVENT_DEL:=@(_EFL_EVENT_DEL);
  end;

{ was #define dname def_expr }
function EFL_EVENT_INVALIDATE : longint; { return type might be wrong }
  begin
    EFL_EVENT_INVALIDATE:=@(_EFL_EVENT_INVALIDATE);
  end;

{ was #define dname def_expr }
function EFL_EVENT_NOREF : longint; { return type might be wrong }
  begin
    EFL_EVENT_NOREF:=@(_EFL_EVENT_NOREF);
  end;

{ was #define dname def_expr }
function EFL_EVENT_OWNERSHIP_UNIQUE : longint; { return type might be wrong }
  begin
    EFL_EVENT_OWNERSHIP_UNIQUE:=@(_EFL_EVENT_OWNERSHIP_UNIQUE);
  end;

{ was #define dname def_expr }
function EFL_EVENT_OWNERSHIP_SHARED : longint; { return type might be wrong }
  begin
    EFL_EVENT_OWNERSHIP_SHARED:=@(_EFL_EVENT_OWNERSHIP_SHARED);
  end;

{ was #define dname def_expr }
function EFL_EVENT_DESTRUCT : longint; { return type might be wrong }
  begin
    EFL_EVENT_DESTRUCT:=@(_EFL_EVENT_DESTRUCT);
  end;


end.
