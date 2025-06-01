
unit elm_object;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_object.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_object.h
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
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Set a text of an object
 *
 * @param obj The Elementary object
 * @param part The text part name to set (NULL for the default part)
 * @param text The new text of the part
 *
 * @note Elementary objects may have many text parts (e.g. Action Slider)
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
(* Const before type ignored *)

procedure elm_object_part_text_set(obj:PEvas_Object; part:Pchar; text:Pchar);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_text_set(obj,text : longint) : longint;

{*
 * Get a text of an object
 *
 * @param obj The Elementary object
 * @param part The text part name to get (NULL for the default part)
 * @return text of the part or NULL for any error
 *
 * @note Elementary objects may have many text parts (e.g. Action Slider)
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_object_part_text_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_text_get(obj : longint) : longint;

{*
 * Set the text for an object's part, marking it as translatable.
 *
 * The string to set as @p text must be the original one. Do not pass the
 * return of @c gettext() here. Elementary will translate the string
 * internally and set it on the object using elm_object_part_text_set(),
 * also storing the original string so that it can be automatically
 * translated when the language is changed with elm_language_set().
 *
 * The @p domain will be stored along to find the translation in the
 * correct catalog. It can be NULL, in which case it will use whatever
 * domain was set by the application with @c textdomain(). This is useful
 * in case you are building a library on top of Elementary that will have
 * its own translatable strings, that should not be mixed with those of
 * programs using the library.
 *
 * @param obj The object containing the text part
 * @param part The name of the part to set
 * @param domain The translation domain to use
 * @param text The original, non-translated text to set
 *
 * @since 1.8
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_object_domain_translatable_part_text_set(obj:PEvas_Object; part:Pchar; domain:Pchar; text:Pchar);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_domain_translatable_text_set(obj,domain,text : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_translatable_text_set(obj,text : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_translatable_part_text_set(obj,part,text : longint) : longint;

{*
 * Get the original string set as translatable for an object
 *
 * When setting translated strings, the function elm_object_part_text_get()
 * will return the translation returned by @c gettext(). To get the
 * original string use this function.
 *
 * @param obj The object
 * @param part The name of the part that was set
 *
 * @return The original, untranslated string
 *
 * @see elm_object_translatable_part_text_set()
 *
 * @since 1.8
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_object_translatable_part_text_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_translatable_text_get(obj : longint) : longint;

{*
 * Mark the part text to be translatable or not.
 *
 * Once you mark the part text to be translatable, the text will be translated
 * internally regardless of elm_object_part_text_set() and
 * elm_object_domain_translatable_part_text_set(). In other case, if you set the
 * Elementary policy that all text will be translatable in default, you can set
 * the part text to not be translated by calling this API.
 *
 * @param obj The object containing the text part
 * @param part The part name of the translatable text
 * @param domain The translation domain to use
 * @param translatable @c EINA_TRUE, the part text will be translated
 *        internally. @c EINA_FALSE, otherwise.
 *
 * @see elm_object_domain_translatable_part_text_set()
 * @see elm_object_part_text_set()
 * @see elm_policy()
 *
 * @since 1.8
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_object_domain_part_text_translatable_set(obj:PEvas_Object; part:Pchar; domain:Pchar; translatable:TEina_Bool);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_part_text_translatable_set(obj,part,translatable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_domain_text_translatable_set(obj,domain,translatable : longint) : longint;

{*
 * Set the content on part of a given container widget
 *
 * @param obj The Elementary container widget
 * @param part The container's part name to set (some might accept
 *        @c NULL for the default part)
 * @param content The new content for that part
 *
 * All widgets deriving from the @ref elm-container-class may hold
 * child objects as content at given parts. This sets new content to
 * a given part. If any object was already set as a content object in
 * the same part, the previous object will be deleted automatically
 * with this call. If the @p content is NULL, this call will just delete the
 * previous object. If the If you wish to preserve it, issue
 * elm_object_part_content_unset() on it first.
 *
 * @see elm_object_part_content_get()
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
procedure elm_object_part_content_set(obj:PEvas_Object; part:Pchar; content:PEvas_Object);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_content_set(obj,content : longint) : longint;

{*
 * Get the content on a part of a given container widget
 *
 * @param obj The Elementary container widget
 * @param part The container's part name to get (some might accept
 *        @c NULL for the default part)
 * @return content of the object at the given part or @c NULL, on
 *         errors
 *
 * @see elm_object_part_content_set() for more details
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_object_part_content_get(obj:PEvas_Object; part:Pchar):PEvas_Object;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_content_get(obj : longint) : longint;

{*
 * Unset the content on a part of a given container widget
 *
 * @param obj The Elementary container widget
 * @param part The container's part name to unset (some might accept
 *        @c NULL for the default part)
 * @return content of the object at the given part or @c NULL, on
 *         errors
 *
 * @see elm_object_part_content_set() for more details
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
function elm_object_part_content_unset(obj:PEvas_Object; part:Pchar):PEvas_Object;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_content_unset(obj : longint) : longint;

{*
 * Set the text to read out when in accessibility mode
 *
 * @param obj The object which is to be described
 * @param txt The text that describes the widget to people with poor or no vision
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
procedure elm_object_access_info_set(obj:PEvas_Object; txt:Pchar);cdecl;external;
{*
 * Get the text to read out when in accessibility mode
 *
 * @param obj The object which is to be described
 * @return The text that describes the widget to people with poor or no vision
 *
 * @ingroup Elm_General
 *
 * @since 1.14
  }
(* Const before type ignored *)
function elm_object_access_info_get(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * Get a named object from the children
 *
 * @param obj The parent object whose children to look at
 * @param name The name of the child to find
 * @param recurse Set to the maximum number of levels to recurse (0 == none, 1 is only look at 1 level of children etc.)
 * @return The found object of that name, or NULL if none is found
 *
 * This function searches the children (or recursively children of
 * children and so on) of the given @p obj object looking for a child with
 * the name of @p name. If the child is found the object is returned, or
 * NULL is returned. You can set the name of an object with
 * evas_object_name_set(). If the name is not unique within the child
 * objects (or the tree is @p recurse is greater than 0) then it is
 * undefined as to which child of that name is returned, so ensure the name
 * is unique amongst children. If recurse is set to -1 it will recurse
 * without limit.
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_object_name_find(obj:PEvas_Object; name:Pchar; recurse:longint):PEvas_Object;cdecl;external;
{*
 * @defgroup Elm_Styles Styles
 *
 * Widgets can have different styles of look. These generic API's
 * set styles of widgets, if they support them (and if the theme(s)
 * do).
 *
 * @ref general_functions_example_page "This" example contemplates
 * some of these functions.
  }
{*
 * Set the style to used by a given widget
 *
 * @param obj The Elementary widget to style
 * @param style The name of the style to use on it
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise
 *
 * This sets the style (by name) that will define the appearance of a
 * widget. Styles vary from widget to widget and may also be defined
 * by other themes by means of extensions and overlays.
 *
 * @see elm_theme_extension_add()
 * @see elm_theme_extension_del()
 * @see elm_theme_overlay_add()
 * @see elm_theme_overlay_del()
 *
 * @ingroup Elm_Styles
  }
(* Const before type ignored *)
function elm_object_style_set(obj:PEvas_Object; style:Pchar):TEina_Bool;cdecl;external;
{*
 * Get the style used by the widget
 *
 * This gets the style being used for that widget. Note that the string
 * pointer is only valid as long as the object is valid and the style doesn't
 * change.
 *
 * @param obj The Elementary widget to query for its style
 * @return The style name used
 *
 * @see elm_object_style_set()
 *
 * @ingroup Elm_Styles
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_object_style_get(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * Set the disabled state of an Elementary object.
 *
 * @param obj The Elementary object to operate on
 * @param disabled The state to put in in: @c EINA_TRUE for
 *        disabled, @c EINA_FALSE for enabled
 *
 * Elementary objects can be @b disabled, in which state they won't
 * receive input and, in general, will be themed differently from
 * their normal state, usually greyed out. Useful for contexts
 * where you don't want your users to interact with some of the
 * parts of you interface.
 *
 * This sets the state for the widget, either disabling it or
 * enabling it back.
 *
 * @ingroup Elm_General
  }
procedure elm_object_disabled_set(obj:PEvas_Object; disabled:TEina_Bool);cdecl;external;
{*
 * Get the disabled state of an Elementary object.
 *
 * @param obj The Elementary object to operate on
 * @return @c EINA_TRUE, if the widget is disabled, @c EINA_FALSE
 *            if it's enabled (or on errors)
 *
 * This gets the state of the widget, which might be enabled or disabled.
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
function elm_object_disabled_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @defgroup Elm_WidgetNavigation Widget Tree Navigation
 *
 * These functions provide checks for if a Evas_Object is an Elementary widget,
 * the possibility of getting a widget's parent, top level parent and getting a
 * string representation of a widget's type.
  }
{*
 * Check if the given Evas Object is an Elementary widget.
 *
 * @param obj the object to query.
 * @return @c EINA_TRUE if it is an elementary widget variant,
 *         @c EINA_FALSE otherwise
 * @ingroup Elm_WidgetNavigation
  }
(* Const before type ignored *)
function elm_object_widget_check(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * Get the first parent of the given object that is an Elementary
 * widget.
 *
 * @param obj the Elementary object to query parent from.
 * @return the parent object that is an Elementary widget, or @c
 *         NULL, if it was not found.
 *
 * Use this to query for an object's parent widget.
 *
 * @note Most of Elementary users wouldn't be mixing non-Elementary
 * smart objects in the objects tree of an application, as this is
 * an advanced usage of Elementary with Evas. So, except for the
 * application's window, which is the root of that tree, all other
 * objects would have valid Elementary widget parents.
 *
 * @ingroup Elm_WidgetNavigation
  }
(* Const before type ignored *)
function elm_object_parent_widget_get(obj:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * Get the top level parent of an Elementary widget.
 *
 * @param obj The object to query.
 * @return The top level Elementary widget, or @c NULL if parent cannot be
 * found.
 * @ingroup Elm_WidgetNavigation
  }
(* Const before type ignored *)
function elm_object_top_widget_get(obj:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * Get the string that represents this Elementary widget.
 *
 * @param obj the object to query.
 * @return Elementary widget name, or @c NULL if not a valid widget.
 * @ingroup Elm_WidgetNavigation
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_object_widget_type_get(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * Send a signal to the widget edje object.
 *
 * This function sends a signal to the edje object of the obj. An
 * edje program can respond to a signal by specifying matching
 * 'signal' and 'source' fields.
 *
 * @param obj The object
 * @param emission The signal's name.
 * @param source The signal's source.
 * @ingroup Elm_General
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_object_signal_emit(obj:PEvas_Object; emission:Pchar; source:Pchar);cdecl;external;
{*
 * Add a callback for a signal emitted by widget edje object.
 *
 * This function connects a callback function to a signal emitted by the
 * edje object of the obj.
 * Globs can occur in either the emission or source name.
 *
 * @param obj The object
 * @param emission The signal's name.
 * @param source The signal's source.
 * @param func The callback function to be executed when the signal is
 * emitted.
 * @param data A pointer to data to pass to the callback function.
 * @ingroup Elm_General
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_object_signal_callback_add(obj:PEvas_Object; emission:Pchar; source:Pchar; func:TEdje_Signal_Cb; data:pointer);cdecl;external;
{*
 * Remove a signal-triggered callback from a widget edje object.
 *
 * @param obj The object handle
 * @param emission The signal's name.
 * @param source The signal's source.
 * @param func The callback function to be executed when the signal is
 * emitted.
 * @return The data pointer of the signal callback or @c NULL, on
 * errors.
 *
 * This function removes the @b last callback, previously attached to
 * a signal emitted by an underlying Edje object of @a obj, whose
 * parameters @a emission, @a source and @c func match exactly with
 * those passed to a previous call to
 * elm_object_signal_callback_add(). The data pointer that was passed
 * to this call will be returned.
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_object_signal_callback_del(obj:PEvas_Object; emission:Pchar; source:Pchar; func:TEdje_Signal_Cb):pointer;cdecl;external;
{*
 * Add a callback for input events (key up, key down, mouse wheel)
 * on a given Elementary widget
 *
 * @param obj The widget to add an event callback on
 * @param func The callback function to be executed when the event
 * happens
 * @param data Data to pass in to @p func
 *
 * Every widget in an Elementary interface set to receive focus,
 * with elm_object_focus_allow_set(), will propagate @b all of its
 * key up, key down and mouse wheel input events up to its parent
 * object, and so on. All of the focusable ones in this chain which
 * had an event callback set, with this call, will be able to treat
 * those events. There are two ways of making the propagation of
 * these event upwards in the tree of widgets to @b cease:
 * - Just return @c EINA_TRUE on @p func. @c EINA_FALSE will mean
 *   the event was @b not processed, so the propagation will go on.
 * - The @p event_info pointer passed to @p func will contain the
 *   event's structure and, if you OR its @c event_flags inner
 *   value to @c EVAS_EVENT_FLAG_ON_HOLD, you're telling Elementary
 *   one has already handled it, thus killing the event's
 *   propagation, too.
 *
 * @note Your event callback will be issued on those events taking
 * place only if no other child widget of @p obj has consumed the
 * event already.
 *
 * @note Not to be confused with @c
 * evas_object_event_callback_add(), which will add event callbacks
 * per type on general Evas objects (no event propagation
 * infrastructure taken in account).
 *
 * @note Not to be confused with @c
 * elm_object_signal_callback_add(), which will add callbacks to @b
 * signals coming from a widget's theme, not input events.
 *
 * @note Not to be confused with @c
 * edje_object_signal_callback_add(), which does the same as
 * elm_object_signal_callback_add(), but directly on an Edje
 * object.
 *
 * @note Not to be confused with @c
 * evas_object_smart_callback_add(), which adds callbacks to smart
 * objects' <b>smart events</b>, and not input events.
 *
 * @see elm_object_event_callback_del()
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
procedure elm_object_event_callback_add(obj:PEvas_Object; func:TElm_Event_Cb; data:pointer);cdecl;external;
{*
 * Remove an event callback from a widget.
 *
 * This function removes a callback, previously attached to event emission
 * by the @p obj.
 * The parameters func and data must match exactly those passed to
 * a previous call to elm_object_event_callback_add(). The data pointer that
 * was passed to this call will be returned.
 *
 * @param obj The object
 * @param func The callback function to be executed when the event is
 * emitted.
 * @param data Data to pass in to the callback function.
 * @return The data pointer
 * @ingroup Elm_General
  }
(* Const before type ignored *)
function elm_object_event_callback_del(obj:PEvas_Object; func:TElm_Event_Cb; data:pointer):pointer;cdecl;external;
{*
 * Disable the orientation mode of a given widget.
 *
 * Orientation Mode is used for widgets to change it's styles or to send signals
 * whenever it's window degree is changed. If the orientation mode is enabled
 * and the widget has different looks and styles for the window degree(0, 90,
 * 180, 270), it will apply a style that is readied for the current degree,
 * otherwise, it will send signals to it's own edje to change it's states if
 * the style doesn't be readied.
 *
 * @param obj The Elementary object to operate on orientation mode.
 * @param disabled The state to put in in: @c EINA_TRUE for disabled,
 *        @c EINA_FALSE for enabled.
 *
 * @since 1.8
 *
 * @ingroup Elm_General
  }
procedure elm_object_orientation_mode_disabled_set(obj:PEvas_Object; disabled:TEina_Bool);cdecl;external;
{*
 * Get the orientation mode of a given widget.
 *
 * @param obj The Elementary widget to query for its orientation mode.
 * @return @c EINA_TRUE, if the orientation mode is disabled, @c EINA_FALSE
 *            if the orientation mode is enabled (or on errors)
 * @see elm_object_orientation_mode_disabled_set()
 *
 * @since 1.8
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
function elm_object_orientation_mode_disabled_get(obj:PEvas_Object):TEina_Bool;cdecl;external;

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_text_set(obj,text : longint) : longint;
begin
  elm_object_text_set:=elm_object_part_text_set(obj,NULL,text);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_text_get(obj : longint) : longint;
begin
  elm_object_text_get:=elm_object_part_text_get(obj,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_domain_translatable_text_set(obj,domain,text : longint) : longint;
begin
  elm_object_domain_translatable_text_set:=elm_object_domain_translatable_part_text_set(obj,NULL,domain,text);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_translatable_text_set(obj,text : longint) : longint;
begin
  elm_object_translatable_text_set:=elm_object_domain_translatable_part_text_set(obj,NULL,NULL,text);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_translatable_part_text_set(obj,part,text : longint) : longint;
begin
  elm_object_translatable_part_text_set:=elm_object_domain_translatable_part_text_set(obj,part,NULL,text);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_translatable_text_get(obj : longint) : longint;
begin
  elm_object_translatable_text_get:=elm_object_translatable_part_text_get(obj,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_part_text_translatable_set(obj,part,translatable : longint) : longint;
begin
  elm_object_part_text_translatable_set:=elm_object_domain_part_text_translatable_set(obj,part,NULL,translatable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_domain_text_translatable_set(obj,domain,translatable : longint) : longint;
begin
  elm_object_domain_text_translatable_set:=elm_object_domain_part_text_translatable_set(obj,NULL,domain,translatable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_content_set(obj,content : longint) : longint;
begin
  elm_object_content_set:=elm_object_part_content_set(obj,NULL,content);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_content_get(obj : longint) : longint;
begin
  elm_object_content_get:=elm_object_part_content_get(obj,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_content_unset(obj : longint) : longint;
begin
  elm_object_content_unset:=elm_object_part_content_unset(obj,NULL);
end;


end.
