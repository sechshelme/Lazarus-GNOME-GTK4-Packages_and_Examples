
unit elm_widget;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget.h
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
PEcore_Timer  = ^Ecore_Timer;
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEfl_Model  = ^Efl_Model;
PEfl_Model_Provider  = ^Efl_Model_Provider;
PEfl_Ui_Focus_Manager  = ^Efl_Ui_Focus_Manager;
PEfl_Ui_Focus_Object  = ^Efl_Ui_Focus_Object;
PEfl_Ui_Widget  = ^Efl_Ui_Widget;
PEfl_Ui_Widget_Data  = ^Efl_Ui_Widget_Data;
PEina_Array  = ^Eina_Array;
PEina_Hash  = ^Eina_Hash;
PEina_Inlist  = ^Eina_Inlist;
PEina_List  = ^Eina_List;
PEina_Stringshare  = ^Eina_Stringshare;
PElm_Access_Info  = ^Elm_Access_Info;
PElm_Access_Item  = ^Elm_Access_Item;
PElm_Action  = ^Elm_Action;
PElm_Cursor  = ^Elm_Cursor;
PElm_Object_Item  = ^Elm_Object_Item;
PElm_Theme  = ^Elm_Theme;
PElm_Tooltip  = ^Elm_Tooltip;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
PElm_Widget_Item_Signal_Data  = ^Elm_Widget_Item_Signal_Data;
PElm_Widget_Smart_Data  = ^Elm_Widget_Smart_Data;
PEo  = ^Eo;
PEvas  = ^Evas;
PEvas_Coord  = ^Evas_Coord;
PEvas_Object  = ^Evas_Object;
PFILE  = ^FILE;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_H}
{$define ELM_WIDGET_H}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
 *
 * How to make your own widget? like this (where wname is your widget
 * name (space) and wparentname is you widget's parent widget name
 * (the base widget class if its a 'root' one).
 *
 * #include <Elementary.h>
 * #include "elm_priv.h"
 *
 * static const char ELM_WNAME_SMART_NAME[] = "elm_wname";
 *
 * #define ELM_WNAME_DATA_GET(o, sd) \
 *   Elm_WName_Smart_Data * sd = evas_object_smart_data_get(o)
 *
 * #define ELM_WNAME_CHECK(obj)                                      \
 *   if (!obj || !elm_widget_type_check((obj), ELM_WNAME_SMART_NAME, \
 *                                      __func__))                   \
 *     return
 *
 * typedef struct _Elm_WName_Smart_Class
 * 
 *    Elm_WParentName_Smart_Class base;
 *  Elm_WName_Smart_Class;
 *
 * typedef struct _Elm_WName_Smart_Data Elm_WName_Smart_Data;
 * struct _Elm_WName_Smart_Data
 * 
 *   Elm_WParentName_Smart_Data base;
 *   Evas_Object *sub; // or any private data needed for an instance
 *   // add any other instance data here too
 * ;
 *
 * static const char SIG_CLICKED[] = "clicked";
 * static const Evas_Smart_Cb_Description _smart_callbacks[] = 
 *   SIG_CLICKED, "",
 *   NULL, NULL
 * ;
 *
 * EVAS_SMART_SUBCLASS_NEW
 *   (ELM_WNAME_SMART_NAME, _elm_wname, Elm_WName_Smart_Class,
 *   Elm_WParentName_Smart_Class, elm_wparentname_smart_class_get,
 *   _smart_callbacks);
 *
 * static Eina_Bool
 * _elm_wname_smart_on_focus(Evas_Object *obj)
 * 
 *    ELM_WNAME_DATA_GET(obj, sd);
 *
 *    // handle focus going in and out - optional, but if you want to,
 *    // define this virtual function to handle it (e.g. to emit a
 *    // signal to an edje object)
 *
 *    if (efl_ui_focus_object_focus_get(obj))
 *      
 *         edje_object_signal_emit(sd->sub, "elm,action,focus", "elm");
 *         evas_object_focus_set(sd->sub, EINA_TRUE);
 *      
 *    else
 *      
 *         edje_object_signal_emit(sd->sub, "elm,action,unfocus", "elm");
 *         evas_object_focus_set(sd->sub, EINA_FALSE);
 *      
 *
 *    return EINA_TRUE;
 * 
 *
 * static Eina_Bool
 * _elm_wname_smart_theme(Evas_Object *obj)
 * 
 *    ELM_WNAME_DATA_GET(obj, sd);
 *
 *   if (!ELM_WIDGET_CLASS(_elm_wname_parent_sc)->theme(obj))
 *     return EINA_FALSE;
 *
 *    // handle changes in theme/scale etc here. always call the
 *    // parent class's version, as even the base class implements it.
 *
 *    elm_widget_theme_object_set(obj, sd->sub, "wname", "base",
 *                                elm_widget_style_get(obj));
 *
 *    return EINA_TRUE;
 * 
 *
 * static Eina_Bool
 * _elm_widget_smart_disable(Evas_Object *obj)
 * 
 *    ELM_WNAME_DATA_GET(obj, sd);
 *
 *    // optional, but handle if the widget gets disabled or not
 *    if (elm_widget_disabled_get(obj))
 *      edje_object_signal_emit(sd->sub, "elm,state,disabled", "elm");
 *    else
 *      edje_object_signal_emit(sd->sub, "elm,state,enabled", "elm");
 *
 *    return EINA_TRUE;
 * 
 *
 * static void
 * _elm_wname_smart_add(Evas_Object *obj)
 * 
 *    EVAS_SMART_DATA_ALLOC(obj, Elm_WName_Smart_Data);
 *
 *    ELM_WIDGET_CLASS(_elm_wname_parent_sc)->base.add(obj);
 *
 *    priv->sub = edje_object_add(evas_object_evas_get(obj));
 *    // just an example having an Edje object here. if it's really the case
 *    // you have a sub edje object as a resize object, consider inheriting
 *    // from @ref elm-layout-class.
 *    elm_widget_can_focus_set(obj, EINA_TRUE);
 *
 *    // for this widget we will add 1 sub object that is an edje object
 *    priv->sub = edje_object_add(e);
 *    // set the theme. this follows a scheme for group name like this:
 *    //   "elm/WIDGETNAME/ELEMENT/STYLE"
 *    // so here it will be:
 *    //   "elm/wname/base/default"
 *    // changing style changes style name from default (all widgets start
 *    // with the default style) and element is for your widget internal
 *    // structure as you see fit
 *    elm_widget_theme_object_set
 *      (obj, priv->sub, "wname", "base", "default");
 *    // listen to a signal from the edje object to produce widget smart
 *    // callback (like click)
 *    edje_object_signal_callback_add
 *      (priv->sub, "elm,action,click", "", _clicked_signal_cb, obj);
 *    // set this sub object as the "resize object". widgets get 1 resize
 *    // object that is resized along with the object wrapper.
 *    elm_widget_resize_object_set(obj, priv->sub);
 * 
 *
 * static void
 * _elm_wname_smart_del(Evas_Object *obj)
 * 
 *    ELM_WNAME_DATA_GET(obj, sd);
 *
 *    // deleting 'virtual' function implementation - on deletion of
 *    // object delete object struct, etc.
 *
 *    ELM_WIDGET_CLASS(_elm_wname_parent_sc)->base.del(obj);
 * 
 *
 * static void
 * _elm_wname_smart_set_user(Elm_WName_Smart_Class *sc)
 * 
 *    ELM_WIDGET_CLASS(sc)->base.add = _elm_wname_smart_add;
 *    ELM_WIDGET_CLASS(sc)->base.del = _elm_wname_smart_del;
 *
 *    ELM_WIDGET_CLASS(sc)->theme = _elm_wname_smart_theme;
 *    ELM_WIDGET_CLASS(sc)->disable = _elm_wname_smart_disable;
 *    ELM_WIDGET_CLASS(sc)->on_focus = _elm_wname_smart_on_focus;
 * 
 *
 * // actual API to create your widget. add more to manipulate it as
 * // needed mark your calls with extern to make them "external api"
 * // calls.
 *
 * extern Evas_Object *
 * elm_wname_add(Evas_Object *parent)
 * 
 *    Evas_Object *obj;
 *
 *    EINA_SAFETY_ON_NULL_RETURN_VAL(parent, NULL);
 *
 *    obj = elm_widget_add(_elm_check_smart_class_new(), parent);
 *    if (!obj) return NULL;
 *
 *    if (!elm_widget_sub_object_add(parent, obj))
 *      ERR("could not add %p as sub object of %p", obj, parent);
 *
 *    return obj;
 * 
 *
 * // example - do "whatever" to the widget (here just emit a signal)
 * extern void
 * elm_wname_whatever(Evas_Object *obj)
 * 
 *    // check if type is correct - check will return if it fails
 *    ELM_WNAME_CHECK(obj);
 *    // get widget data - type is correct and sane by this point, so this
 *    // should never fail
 *    ELM_WNAME_DATA_GET(obj, sd);
 *    // do whatever you like
 *    edje_object_signal_emit(sd->sub, "elm,state,action,whatever", "elm");
 * 
 *
 * // you can add more - you need to see elementary's code to know how
 * // to handle all cases. remember this api is not stable and may
 * change. it's internal
  }
{*
 * @defgroup Widget Widgets Extension Infrastructure
 *
 * This section is intended for people willing to create @b custom
 * Elementary widgets or to contribute new (useful, unique) widgets
 * upstream. If neither is your case, this text won't be of any use
 * for you.
 *
 * Elementary widgets are built in a @b hierarchical fashion. The idea
 * is to factorize as much code as possible between widgets with
 * behavioral similarities, as long as to facilitate the creation of
 * @b custom, new widgets, may the user need them.
 *
 * It all starts with a base class, which aggregates behaviour
 * @b every Elementary widget is supposed to have:
 * #Elm_Widget_Smart_Class. Every Elementary widget will be of that
 * type, be it directly or by means of @b inheriting from it.
 *
 * #Elm_Widget_Smart_Class happens to be an @c Evas_Smart_Class. If
 * you check out Evas' documentation on it, you'll see it's how one is
 * supposed to create custom Evas objects, what Elementary widgets
 * are.
 *
 * Once one instantiates an Elementary widget, since it inherits from
 * #Elm_Widget_Smart_Class, the system will raise a class instance of
 * that type for you. But that happens only @b once: the first time
 * you ask for an Elementary widget (of a given type). All subsequent
 * ones will only point to the very same class instance. Since it's
 * the class which points to the functions implementing the behavior
 * of objects of that type, all of the live instances of Elementary
 * widgets (of that type) will share the same blob of code loaded in
 * memory to execute their routines.
 *
 * Now go and take a look at #Elm_Widget_Smart_Class's fields. Because
 * it inherits from Evas' base smart class, we got a field of that
 * type as the first member, so that Evas can handle Elementary
 * objects internally as if they were 'normal' Evas objects. Evas has
 * the Evas-only behavior function pointers in there, so it's all it
 * needs.
 *
 * Then, comes a version field, so that whenever we got to update or
 * change the fields on our base smart class, there'll be a runtime
 * check of the version expected by Elementary and the one provided by
 * any code linking with it. A mismatch will show the developer of
 * that code he/she needs to recompile and link its code to a newer
 * version of Elementary.
 *
 * The next fields are the class functions themselves. We call them
 * 'virtual' because, as in object-oriented languages, one is supposed
 * here to override them on inheriting classes. On most of
 * inheritances you'll probably want to call the parent's version of
 * the class function too: you must analyse each case to tell.
 *
 * Take a look at #Elm_Widget_Smart_Data. That's private data bound to
 * each Elementary object @b instance. It aggregates data needed for
 * all widgets, since it's meant for the #Elm_Widget_Smart_Class-typed
 * ones.
 *
 * When inheriting from that base type, instance data for this new
 * class has to have, as the first member, a field of type
 * #Elm_Widget_Smart_Data. This has to be respected recursively -- if
 * a third class is to be created inheriting from the one that is a
 * direct 'child' of #Elm_Widget_Smart_Class, then the private data on
 * this third class has to have, as its first field, a variable of the
 * type of the private data of the second class (its parent), direct
 * child of #Elm_Widget_Smart_Class.
 *
 * It is from the base private data, #Elm_Widget_Smart_Data, that we
 * reach an object's class functions, by the given object
 * instance. This is the reason of the first field of that struct: a
 * pointer set to point to its class when the object is instantiated.
 *
 * The following figure illustrates the widget inheritance schema.
 *
 * @image html elm-widget-hierarchy.png
 * @image rtf elm-widget-hierarchy.png
 * @image latex elm-widget-hierarchy.eps
 *
 * @section elm-hierarchy-tree Elementary Widgets Hierarchy Tree
 *
 * The following figure illustrates the Elementary widget inheritance
 * tree.
 *
 * @image html elm-widget-tree.png
 * @image rtf elm-widget-tree.png
 * @image latex elm-widget-tree.eps
  }
{$include "elm_object_item.h"}
{$include "efl_ui.eot.h"}
type
  PEfl_Ui_Focus_Manager = ^TEfl_Ui_Focus_Manager;
  TEfl_Ui_Focus_Manager = TEo;
  var
    EFL_UI_THEME_APPLY_ERROR_NONE : TEina_Error;cvar;external;
{$define _EFL_UI_FOCUS_MANAGER_EO_CLASS_TYPE}
{$include "efl_ui_focus_object.eo.h"}
{$include "efl_ui_focus_manager.eo.h"}
type

  TElm_Widget_Del_Pre_Cb = function (data:pointer):TEina_Bool;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  TElm_Widget_Item_Signal_Cb = procedure (data:pointer; item:PElm_Object_Item; emission:Pchar; source:Pchar);cdecl;

  TElm_Access_On_Highlight_Cb = procedure (data:pointer);cdecl;

  TElm_Widget_On_Show_Region_Cb = procedure (data:pointer; obj:PEvas_Object; region:TEina_Rect);cdecl;
{$include "efl_ui_widget.eo.h"}
{$include "elm_widget_item_container_eo.h"}
{*
 * @addtogroup Widget
 * @
  }
{*
 * Base widget smart data. This is data bound to an Elementary object
 * @b instance, so its particular to that specific object and not
 * shared between all objects in its class. It is here, though, that
 * we got a pointer to the object's class, the first field -- @c
 * 'api'.
  }
{*< parent object of a widget in the elementary tree  }
{*< an unique object for each widget that shows the look of a widget. Resize object's geometry is same as the widget. This resize object is different from that of window's resize object.  }
{ "show region" coordinates. all widgets got those because this
    * info may be set and queried recursively through the widget
    * parenting tree  }
{ scrolling hold/freeze hints. all widgets got those because this
    * info may be set and queried recursively through the widget
    * parenting tree  }
(* Const before type ignored *)
{*< 1st identifier of an edje object group which is used in theme_set. klass and group are used together.  }
(* Const before type ignored *)
{*< 2nd identifier of an edje object group which is used in theme_set. klass and group are used together.  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ this is a hook to be set on-the-fly on widgets. this is code
    * handling the request of showing a specific region from an inner
    * widget (mainly issued by entries, on cursor moving)  }
{ This is TRUE by default  }
{ This is TRUE by default  }
{*< This is true when any types of elm translate function is being called.  }
{*< This is true when the widget is on creation(general widget constructor).  }
{*< This is true when the widget is on destruction(general widget destructor).  }
{*< This is true when efl_provider_find is currently walking the tree  }
type
  PElm_Widget_Smart_Data = ^TElm_Widget_Smart_Data;
  TElm_Widget_Smart_Data = record
      parent_obj : PEvas_Object;
      children : PEina_Array;
      resize_obj : PEvas_Object;
      hover_obj : PEvas_Object;
      bg : PEvas_Object;
      window : PEvas_Object;
      tooltips : PEina_List;
      cursors : PEina_List;
      show_region : TEina_Rect;
      scroll_hold : longint;
      scroll_freeze : longint;
      scale : Tdouble;
      theme : PElm_Theme;
      klass : Pchar;
      group : Pchar;
      style : Pchar;
      access_info : Pchar;
      accessible_name : Pchar;
      child_drag_x_locked : longint;
      child_drag_y_locked : longint;
      disabled : longint;
      tree_unfocusable : longint;
      translate_strings : PEina_Inlist;
      event_cb : PEina_List;
      on_show_region_data : pointer;
      on_show_region : TElm_Widget_On_Show_Region_Cb;
      on_show_region_data_free : TEina_Free_Cb;
      focus_move_policy : TElm_Focus_Move_Policy;
      focus_region_show_mode : TElm_Focus_Region_Show_Mode;
      focus : TEfl_Ui_Widget_Focus_State;
      logical : record
          child_count : longint;
          parent : PEfl_Ui_Focus_Object;
        end;
      manager : record
          manager : PEfl_Ui_Focus_Manager;
          provider : PEfl_Ui_Focus_Object;
        end;
      legacy_focus : record
          listen_to_manager : TEina_Bool;
          custom_chain : PEina_List;
          prev : PEvas_Object;
          next : PEvas_Object;
          up : PEvas_Object;
          down : PEvas_Object;
          right : PEvas_Object;
          left : PEvas_Object;
          item_prev : PElm_Object_Item;
          item_next : PElm_Object_Item;
          item_up : PElm_Object_Item;
          item_down : PElm_Object_Item;
          item_right : PElm_Object_Item;
          item_left : PElm_Object_Item;
        end;
      properties : record
          model : PEfl_Model;
          provider : PEfl_Model_Provider;
          model_lookup : PEina_Hash;
          view_lookup : PEina_Hash;
          flag0 : word;
        end;
      shared_win_data : pointer;
      flag0 : longint;
    end;

const
  bm__Elm_Widget_Smart_Data_registered = $1;
  bp__Elm_Widget_Smart_Data_registered = 0;
  bm__Elm_Widget_Smart_Data_callback_to_provider = $2;
  bp__Elm_Widget_Smart_Data_callback_to_provider = 1;
  bm__Elm_Widget_Smart_Data_scroll_x_locked = $1;
  bp__Elm_Widget_Smart_Data_scroll_x_locked = 0;
  bm__Elm_Widget_Smart_Data_scroll_y_locked = $2;
  bp__Elm_Widget_Smart_Data_scroll_y_locked = 1;
  bm__Elm_Widget_Smart_Data_can_focus = $4;
  bp__Elm_Widget_Smart_Data_can_focus = 2;
  bm__Elm_Widget_Smart_Data_focused = $8;
  bp__Elm_Widget_Smart_Data_focused = 3;
  bm__Elm_Widget_Smart_Data_top_win_focused = $10;
  bp__Elm_Widget_Smart_Data_top_win_focused = 4;
  bm__Elm_Widget_Smart_Data_focus_move_policy_auto_mode = $20;
  bp__Elm_Widget_Smart_Data_focus_move_policy_auto_mode = 5;
  bm__Elm_Widget_Smart_Data_highlight_ignore = $40;
  bp__Elm_Widget_Smart_Data_highlight_ignore = 6;
  bm__Elm_Widget_Smart_Data_highlight_in_theme = $80;
  bp__Elm_Widget_Smart_Data_highlight_in_theme = 7;
  bm__Elm_Widget_Smart_Data_access_highlight_in_theme = $100;
  bp__Elm_Widget_Smart_Data_access_highlight_in_theme = 8;
  bm__Elm_Widget_Smart_Data_is_mirrored = $200;
  bp__Elm_Widget_Smart_Data_is_mirrored = 9;
  bm__Elm_Widget_Smart_Data_mirrored_auto_mode = $400;
  bp__Elm_Widget_Smart_Data_mirrored_auto_mode = 10;
  bm__Elm_Widget_Smart_Data_still_in = $800;
  bp__Elm_Widget_Smart_Data_still_in = 11;
  bm__Elm_Widget_Smart_Data_highlighted = $1000;
  bp__Elm_Widget_Smart_Data_highlighted = 12;
  bm__Elm_Widget_Smart_Data_highlight_root = $2000;
  bp__Elm_Widget_Smart_Data_highlight_root = 13;
  bm__Elm_Widget_Smart_Data_on_translate = $4000;
  bp__Elm_Widget_Smart_Data_on_translate = 14;
  bm__Elm_Widget_Smart_Data_on_create = $8000;
  bp__Elm_Widget_Smart_Data_on_create = 15;
  bm__Elm_Widget_Smart_Data_on_destroy = $10000;
  bp__Elm_Widget_Smart_Data_on_destroy = 16;
  bm__Elm_Widget_Smart_Data_provider_lookup = $20000;
  bp__Elm_Widget_Smart_Data_provider_lookup = 17;
  bm__Elm_Widget_Smart_Data_has_shadow = $40000;
  bp__Elm_Widget_Smart_Data_has_shadow = 18;
  bm__Elm_Widget_Smart_Data_internal = $80000;
  bp__Elm_Widget_Smart_Data_internal = 19;

function scroll_x_locked(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_scroll_x_locked(var a : _Elm_Widget_Smart_Data; __scroll_x_locked : TEina_Bool);
function scroll_y_locked(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_scroll_y_locked(var a : _Elm_Widget_Smart_Data; __scroll_y_locked : TEina_Bool);
function can_focus(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_can_focus(var a : _Elm_Widget_Smart_Data; __can_focus : TEina_Bool);
function focused(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_focused(var a : _Elm_Widget_Smart_Data; __focused : TEina_Bool);
function top_win_focused(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_top_win_focused(var a : _Elm_Widget_Smart_Data; __top_win_focused : TEina_Bool);
function focus_move_policy_auto_mode(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_focus_move_policy_auto_mode(var a : _Elm_Widget_Smart_Data; __focus_move_policy_auto_mode : TEina_Bool);
function highlight_ignore(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_highlight_ignore(var a : _Elm_Widget_Smart_Data; __highlight_ignore : TEina_Bool);
function highlight_in_theme(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_highlight_in_theme(var a : _Elm_Widget_Smart_Data; __highlight_in_theme : TEina_Bool);
function access_highlight_in_theme(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_access_highlight_in_theme(var a : _Elm_Widget_Smart_Data; __access_highlight_in_theme : TEina_Bool);
function is_mirrored(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_is_mirrored(var a : _Elm_Widget_Smart_Data; __is_mirrored : TEina_Bool);
function mirrored_auto_mode(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_mirrored_auto_mode(var a : _Elm_Widget_Smart_Data; __mirrored_auto_mode : TEina_Bool);
function still_in(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_still_in(var a : _Elm_Widget_Smart_Data; __still_in : TEina_Bool);
function highlighted(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_highlighted(var a : _Elm_Widget_Smart_Data; __highlighted : TEina_Bool);
function highlight_root(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_highlight_root(var a : _Elm_Widget_Smart_Data; __highlight_root : TEina_Bool);
function on_translate(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_on_translate(var a : _Elm_Widget_Smart_Data; __on_translate : TEina_Bool);
function on_create(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_on_create(var a : _Elm_Widget_Smart_Data; __on_create : TEina_Bool);
function on_destroy(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_on_destroy(var a : _Elm_Widget_Smart_Data; __on_destroy : TEina_Bool);
function provider_lookup(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_provider_lookup(var a : _Elm_Widget_Smart_Data; __provider_lookup : TEina_Bool);
function has_shadow(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_has_shadow(var a : _Elm_Widget_Smart_Data; __has_shadow : TEina_Bool);
function internal(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
procedure set_internal(var a : _Elm_Widget_Smart_Data; __internal : TEina_Bool);
type
  PEfl_Ui_Widget_Data = ^TEfl_Ui_Widget_Data;
  TEfl_Ui_Widget_Data = TElm_Widget_Smart_Data;
{*
 * @
  }
{*< base structure for all widget items that are not Efl_Ui_Widget themselves  }
{*< accessibility information to be able to set and get from the access API  }
{*< accessibility info item  }
{* Internal type for mouse cursors  }
{* Internal type for tooltips  }
{ sentence done - send done event here  }

const
  ELM_ACCESS_DONE = -(1);  
{ stop reading immediately  }
  ELM_ACCESS_CANCEL = -(2);  
(* Const before type ignored *)
type
  PElm_Access_Item = ^TElm_Access_Item;
  TElm_Access_Item = record
      _type : longint;
      data : pointer;
      func : TElm_Access_Info_Cb;
    end;

{ the owner widget item that owns this access info  }
{ the owner part object that owns this access info  }
  PElm_Access_Info = ^TElm_Access_Info;
  TElm_Access_Info = record
      hoverobj : PEvas_Object;
      items : PEina_List;
      delay_timer : PEcore_Timer;
      on_highlight_data : pointer;
      on_highlight : TElm_Access_On_Highlight_Cb;
      activate_data : pointer;
      activate : TElm_Access_Activate_Cb;
      widget_item : PElm_Widget_Item_Data;
      part_object : PEvas_Object;
      next : PEvas_Object;
      prev : PEvas_Object;
    end;

(* Const before type ignored *)
(* Const before type ignored *)
  PElm_Action = ^TElm_Action;
  TElm_Action = record
      name : Pchar;
      func : function (obj:PEvas_Object; params:Pchar):TEina_Bool;cdecl;
    end;


procedure _elm_access_shutdown;cdecl;external;
procedure _elm_access_mouse_event_enabled_set(enabled:TEina_Bool);cdecl;external;
{ if auto_higlight is EINA_TRUE, it  does not steal a focus, it just moves a highlight  }
procedure _elm_access_auto_highlight_set(enabled:TEina_Bool);cdecl;external;
function _elm_access_auto_highlight_get:TEina_Bool;cdecl;external;
procedure _elm_access_widget_item_access_order_set(item:PElm_Widget_Item_Data; objs:PEina_List);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _elm_access_widget_item_access_order_get(item:PElm_Widget_Item_Data):PEina_List;cdecl;external;
procedure _elm_access_widget_item_access_order_unset(item:PElm_Widget_Item_Data);cdecl;external;
{ widget focus highlight }
(* Const before type ignored *)
procedure _elm_widget_focus_highlight_start(obj:PEvas_Object);cdecl;external;
procedure _elm_widget_highlight_in_theme_update(obj:PEo);cdecl;external;
{ win focus highlight }
procedure _elm_win_focus_highlight_start(obj:PEvas_Object);cdecl;external;
procedure _elm_win_focus_highlight_in_theme_update(obj:PEvas_Object; in_theme:TEina_Bool);cdecl;external;
function _elm_win_focus_highlight_object_get(obj:PEvas_Object):PEvas_Object;cdecl;external;
procedure _elm_win_focus_auto_show(obj:PEvas_Object);cdecl;external;
procedure _elm_win_focus_auto_hide(obj:PEvas_Object);cdecl;external;
procedure _elm_access_clear(ac:PElm_Access_Info);cdecl;external;
(* Const before type ignored *)
procedure _elm_access_text_set(ac:PElm_Access_Info; _type:longint; text:Pchar);cdecl;external;
(* Const before type ignored *)
procedure _elm_access_callback_set(ac:PElm_Access_Info; _type:longint; func:TElm_Access_Info_Cb; data:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _elm_access_text_get(ac:PElm_Access_Info; _type:longint; obj:PEvas_Object):Pchar;cdecl;external;
{ this is ok it actually returns a strduped string - it's meant to!  }
(* Const before type ignored *)
procedure _elm_access_read(ac:PElm_Access_Info; _type:longint; obj:PEvas_Object);cdecl;external;
(* Const before type ignored *)
procedure _elm_access_say(txt:Pchar);cdecl;external;
(* Const before type ignored *)
function _elm_access_info_get(obj:PEvas_Object):PElm_Access_Info;cdecl;external;
procedure _elm_access_object_highlight(obj:PEvas_Object);cdecl;external;
procedure _elm_access_object_unhighlight(obj:PEvas_Object);cdecl;external;
procedure _elm_access_object_highlight_disable(e:PEvas);cdecl;external;
procedure _elm_access_object_register(obj:PEvas_Object; hoverobj:PEvas_Object);cdecl;external;
procedure _elm_access_object_unregister(obj:PEvas_Object; hoverobj:PEvas_Object);cdecl;external;
function _elm_access_2nd_click_timeout(obj:PEvas_Object):TEina_Bool;cdecl;external;
procedure _elm_access_highlight_set(obj:PEvas_Object);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _elm_access_edje_object_part_object_register(obj:PEvas_Object; partobj:PEvas_Object; part:Pchar):PEvas_Object;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure _elm_access_edje_object_part_object_unregister(obj:PEvas_Object; eobj:PEvas_Object; part:Pchar);cdecl;external;
procedure _elm_access_widget_item_register(item:PElm_Widget_Item_Data);cdecl;external;
procedure _elm_access_widget_item_unregister(item:PElm_Widget_Item_Data);cdecl;external;
procedure _elm_access_on_highlight_hook_set(ac:PElm_Access_Info; func:TElm_Access_On_Highlight_Cb; data:pointer);cdecl;external;
procedure _elm_access_activate_callback_set(ac:PElm_Access_Info; func:TElm_Access_Activate_Cb; data:pointer);cdecl;external;
procedure _elm_access_highlight_object_activate(obj:PEvas_Object; act:TEfl_Ui_Activate);cdecl;external;
procedure _elm_access_highlight_cycle(obj:PEvas_Object; dir:TElm_Focus_Direction);cdecl;external;
{xxxxxxxxxx    EINA_DEPRECATED }(* Const before type ignored *)
function _elm_access_object_get(obj:PEvas_Object):PElm_Access_Info;cdecl;external;
const
  ELM_PREFS_DATA_MAGIC = $e1f5da7a;  
{*< put this as the first member in your widget item struct  }
{#define ELM_WIDGET_ITEM       Elm_Widget_Item_Data base }
(* Const before type ignored *)
(* Const before type ignored *)
type
  PElm_Widget_Item_Signal_Data = ^TElm_Widget_Item_Signal_Data;
  TElm_Widget_Item_Signal_Data = record
      item : PElm_Object_Item;
      func : TElm_Widget_Item_Signal_Cb;
      emission : Pchar;
      source : Pchar;
      data : pointer;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function WIDGET_ITEM_DATA_GET(eo_obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WIDGET_ITEM_DATA_SET(eo_obj,data : longint) : longint;

{ ef1 ~~ efl, el3 ~~ elm  }
{ simple accessor macros  }
{*< the owner widget that owns this item  }
{*< The Eo item, useful to invoke eo_do when only the item data is available  }
{*< the base view object  }
{*< user delete callback function  }
{*< widget delete callback function. don't expose this callback call  }
(* Const before type ignored *)
(* Const before type ignored *)
type
  PElm_Widget_Item_Data = ^TElm_Widget_Item_Data;
  TElm_Widget_Item_Data = record
      widget : PEvas_Object;
      eo_obj : PEo;
      view : PEvas_Object;
      del_func : TEvas_Smart_Cb;
      del_pre_func : TElm_Widget_Del_Pre_Cb;
      focus_previous : PEvas_Object;
      focus_next : PEvas_Object;
      focus_up : PEvas_Object;
      focus_down : PEvas_Object;
      focus_right : PEvas_Object;
      focus_left : PEvas_Object;
      item_focus_previous : PElm_Object_Item;
      item_focus_next : PElm_Object_Item;
      item_focus_up : PElm_Object_Item;
      item_focus_down : PElm_Object_Item;
      item_focus_right : PElm_Object_Item;
      item_focus_left : PElm_Object_Item;
      style : PEina_Stringshare;
      access_obj : PEvas_Object;
      access_info : Pchar;
      accessible_name : Pchar;
      access_order : PEina_List;
      translate_strings : PEina_Inlist;
      signals : PEina_List;
      labels : PEina_Hash;
      track_obj : PEvas_Object;
      func : record
          realized : procedure (obj:PEo);cdecl;
          unrealized : procedure (obj:PEo);cdecl;
        end;
      flag0 : word;
    end;


const
  bm_TElm_Widget_Item_Data_disabled = $1;
  bp_TElm_Widget_Item_Data_disabled = 0;
  bm_TElm_Widget_Item_Data_on_deletion = $2;
  bp_TElm_Widget_Item_Data_on_deletion = 1;
  bm_TElm_Widget_Item_Data_on_translate = $4;
  bp_TElm_Widget_Item_Data_on_translate = 2;
  bm_TElm_Widget_Item_Data_still_in = $8;
  bp_TElm_Widget_Item_Data_still_in = 3;

function disabled(var a : TElm_Widget_Item_Data) : TEina_Bool;
procedure set_disabled(var a : TElm_Widget_Item_Data; __disabled : TEina_Bool);
function on_deletion(var a : TElm_Widget_Item_Data) : TEina_Bool;
procedure set_on_deletion(var a : TElm_Widget_Item_Data; __on_deletion : TEina_Bool);
function on_translate(var a : TElm_Widget_Item_Data) : TEina_Bool;
procedure set_on_translate(var a : TElm_Widget_Item_Data; __on_translate : TEina_Bool);
function still_in(var a : TElm_Widget_Item_Data) : TEina_Bool;
procedure set_still_in(var a : TElm_Widget_Item_Data; __still_in : TEina_Bool);

function elm_widget_api_check(ver:longint):TEina_Bool;cdecl;external;
function elm_widget_access(obj:PEvas_Object; is_access:TEina_Bool):TEina_Bool;cdecl;external;
function elm_widget_theme(obj:PEvas_Object):TEina_Error;cdecl;external;
procedure elm_widget_theme_specific(obj:PEvas_Object; th:PElm_Theme; force:TEina_Bool);cdecl;external;
procedure elm_widget_on_show_region_hook_set(obj:PEvas_Object; data:pointer; func:TElm_Widget_On_Show_Region_Cb; data_free:TEina_Free_Cb);cdecl;external;
function elm_widget_sub_object_parent_add(sobj:PEvas_Object):TEina_Bool;cdecl;external;
function elm_widget_sub_object_add(obj:PEvas_Object; sobj:PEvas_Object):TEina_Bool;cdecl;external;
function elm_widget_sub_object_del(obj:PEvas_Object; sobj:PEvas_Object):TEina_Bool;cdecl;external;
procedure elm_widget_resize_object_set(obj:PEvas_Object; sobj:PEvas_Object);cdecl;external;
procedure elm_widget_hover_object_set(obj:PEvas_Object; sobj:PEvas_Object);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_widget_signal_emit(obj:PEvas_Object; emission:Pchar; source:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_widget_signal_callback_add(obj:PEvas_Object; emission:Pchar; source:Pchar; func:TEdje_Signal_Cb; data:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function elm_widget_signal_callback_del(obj:PEvas_Object; emission:Pchar; source:Pchar; func:TEdje_Signal_Cb):pointer;cdecl;external;
procedure elm_widget_can_focus_set(obj:PEvas_Object; can_focus:TEina_Bool);cdecl;external;
(* Const before type ignored *)
function elm_widget_can_focus_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function elm_widget_child_can_focus_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function elm_widget_can_focus_child_list_get(obj:PEvas_Object):PEina_List;cdecl;external;
procedure elm_widget_tree_unfocusable_set(obj:PEvas_Object; tree_unfocusable:TEina_Bool);cdecl;external;
(* Const before type ignored *)
function elm_widget_tree_unfocusable_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
procedure elm_widget_highlight_ignore_set(obj:PEvas_Object; ignore:TEina_Bool);cdecl;external;
(* Const before type ignored *)
function elm_widget_highlight_ignore_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
procedure elm_widget_highlight_in_theme_set(obj:PEvas_Object; highlight:TEina_Bool);cdecl;external;
(* Const before type ignored *)
function elm_widget_highlight_in_theme_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
procedure elm_widget_access_highlight_in_theme_set(obj:PEvas_Object; highlight:TEina_Bool);cdecl;external;
(* Const before type ignored *)
function elm_widget_access_highlight_in_theme_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function elm_widget_highlight_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function elm_widget_top_get(obj:PEo):PEo;cdecl;external;
(* Const before type ignored *)
function elm_widget_is(obj:PEvas_Object):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function elm_widget_parent_widget_get(obj:PEvas_Object):PEvas_Object;cdecl;external;
(* Const before type ignored *)
procedure elm_widget_event_callback_add(obj:PEvas_Object; func:TElm_Event_Cb; data:pointer);cdecl;external;
(* Const before type ignored *)
function elm_widget_event_callback_del(obj:PEvas_Object; func:TElm_Event_Cb; data:pointer):pointer;cdecl;external;
(* Const before type ignored *)
function elm_widget_focus_highlight_style_set(obj:PEvas_Object; style:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function elm_widget_focus_highlight_style_get(obj:PEvas_Object):Pchar;cdecl;external;
procedure elm_widget_parent_highlight_set(obj:PEvas_Object; highlighted:TEina_Bool);cdecl;external;
procedure elm_widget_focus_set(obj:PEvas_Object; focus:TEina_Bool);cdecl;external;
(* Const before type ignored *)
function elm_widget_parent_get(obj:PEvas_Object):PEvas_Object;cdecl;external;
procedure elm_widget_display_mode_set(obj:PEvas_Object; dispmode:TEvas_Display_Mode);cdecl;external;
(* Const before type ignored *)
function elm_widget_focus_highlight_enabled_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
(* Const before type ignored *)
procedure elm_widget_focus_highlight_focus_part_geometry_get(obj:PEvas_Object; x:PEvas_Coord; y:PEvas_Coord; w:PEvas_Coord; h:PEvas_Coord);cdecl;external;
(* Const before type ignored *)
function _elm_widget_focus_highlight_object_get(obj:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @internal
 *
 * Restore the focus state of the sub-tree.
 *
 * This API will restore the focus state of the sub-tree to the latest
 * state. If a sub-tree is unfocused and wants to get back to the latest
 * focus state, this API will be helpful.
 *
 * @param obj The widget root of sub-tree
 *
 * @ingroup Widget
  }
procedure elm_widget_disabled_set(obj:PEvas_Object; disabled:TEina_Bool);cdecl;external;
(* Const before type ignored *)
function elm_widget_disabled_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
procedure elm_widget_show_region_set(obj:PEvas_Object; sr:TEina_Rect; forceshow:TEina_Bool);cdecl;external;
(* Const before type ignored *)
function elm_widget_show_region_get(obj:PEvas_Object):TEina_Rect;cdecl;external;
(* Const before type ignored *)
function elm_widget_focus_region_get(obj:PEvas_Object):TEina_Rect;cdecl;external;
procedure elm_widget_focus_region_show(obj:PEvas_Object);cdecl;external;
procedure elm_widget_scroll_hold_push(obj:PEvas_Object);cdecl;external;
procedure elm_widget_scroll_hold_pop(obj:PEvas_Object);cdecl;external;
(* Const before type ignored *)
function elm_widget_scroll_hold_get(obj:PEvas_Object):longint;cdecl;external;
procedure elm_widget_scroll_freeze_push(obj:PEvas_Object);cdecl;external;
procedure elm_widget_scroll_freeze_pop(obj:PEvas_Object);cdecl;external;
(* Const before type ignored *)
function elm_widget_scroll_freeze_get(obj:PEvas_Object):longint;cdecl;external;
procedure elm_widget_theme_set(obj:PEvas_Object; th:PElm_Theme);cdecl;external;
(* Const before type ignored *)
function elm_widget_theme_get(obj:PEvas_Object):PElm_Theme;cdecl;external;
(* Const before type ignored *)
function elm_widget_style_set(obj:PEvas_Object; style:Pchar):TEina_Error;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function elm_widget_style_get(obj:PEvas_Object):Pchar;cdecl;external;
(* Const before type ignored *)
procedure elm_widget_type_set(obj:PEvas_Object; _type:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function elm_widget_type_get(obj:PEvas_Object):Pchar;cdecl;external;
procedure elm_widget_tooltip_add(obj:PEvas_Object; tt:PElm_Tooltip);cdecl;external;
procedure elm_widget_tooltip_del(obj:PEvas_Object; tt:PElm_Tooltip);cdecl;external;
procedure elm_widget_cursor_add(obj:PEvas_Object; cur:PElm_Cursor);cdecl;external;
procedure elm_widget_cursor_del(obj:PEvas_Object; cur:PElm_Cursor);cdecl;external;
procedure elm_widget_scroll_lock_set(obj:PEvas_Object; block:TEfl_Ui_Layout_Orientation);cdecl;external;
(* Const before type ignored *)
function elm_widget_scroll_lock_get(obj:PEvas_Object):TEfl_Ui_Layout_Orientation;cdecl;external;
(* Const before type ignored *)
function elm_widget_scroll_child_locked_x_get(obj:PEvas_Object):longint;cdecl;external;
(* Const before type ignored *)
function elm_widget_scroll_child_locked_y_get(obj:PEvas_Object):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_widget_theme_object_set(obj:PEvas_Object; edj:PEvas_Object; wname:Pchar; welement:Pchar; wstyle:Pchar):TEina_Error;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_widget_type_check(obj:PEvas_Object; _type:Pchar; func:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function elm_widget_name_find(obj:PEvas_Object; name:Pchar; recurse:longint):PEvas_Object;cdecl;external;
(* Const before type ignored *)
function elm_widget_stringlist_get(str:Pchar):PEina_List;cdecl;external;
procedure elm_widget_stringlist_free(list:PEina_List);cdecl;external;
procedure elm_widget_focus_mouse_up_handle(obj:PEvas_Object);cdecl;external;
procedure elm_widget_activate(obj:PEvas_Object; act:TEfl_Ui_Activate);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_widget_part_text_set(obj:PEvas_Object; part:Pchar; _label:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_widget_part_text_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_widget_translatable_part_text_get(obj:PEvas_Object; part:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_widget_domain_part_text_translatable_set(obj:PEvas_Object; part:Pchar; domain:Pchar; translatable:TEina_Bool);cdecl;external;
(* Const before type ignored *)
procedure elm_widget_content_part_set(obj:PEvas_Object; part:Pchar; content:PEvas_Object);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function elm_widget_content_part_get(obj:PEvas_Object; part:Pchar):PEvas_Object;cdecl;external;
(* Const before type ignored *)
function elm_widget_content_part_unset(obj:PEvas_Object; part:Pchar):PEvas_Object;cdecl;external;
(* Const before type ignored *)
procedure elm_widget_access_info_set(obj:PEvas_Object; txt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function elm_widget_access_info_get(obj:PEvas_Object):Pchar;cdecl;external;
(* Const before type ignored *)
function elm_widget_focus_highlight_geometry_get(obj:PEvas_Object):TEina_Rect;cdecl;external;
procedure _elm_widget_item_highlight_in_theme(obj:PEvas_Object; it:PElm_Object_Item);cdecl;external;
procedure elm_widget_focus_region_show_mode_set(obj:PEvas_Object; mode:TElm_Focus_Region_Show_Mode);cdecl;external;
(* Const before type ignored *)
function elm_widget_focus_region_show_mode_get(obj:PEvas_Object):TElm_Focus_Region_Show_Mode;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_widget_part_translatable_text_get(obj:PEo; part:Pchar; domain:PPchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_widget_part_translatable_text_set(obj:PEo; part:Pchar; _label:Pchar; domain:Pchar);cdecl;external;
(* Const before type ignored *)
function elm_widget_theme_klass_set(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function elm_widget_theme_klass_get(obj:PEvas_Object):Pchar;cdecl;external;
(* Const before type ignored *)
function elm_widget_theme_element_set(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function elm_widget_theme_element_get(obj:PEvas_Object):Pchar;cdecl;external;
(* Const before type ignored *)
function elm_widget_theme_style_set(obj:PEvas_Object; name:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function elm_widget_theme_style_get(obj:PEvas_Object):Pchar;cdecl;external;
(* Const before type ignored *)
function elm_widget_element_update(obj:PEvas_Object; component:PEvas_Object; name:Pchar):TEina_Error;cdecl;external;
{ debug function. don't use it unless you are tracking parenting issues  }
(* Const before type ignored *)
procedure elm_widget_tree_dump(top:PEvas_Object);cdecl;external;
(* Const before type ignored *)
procedure elm_widget_tree_dot_dump(top:PEvas_Object; output:PFILE);cdecl;external;
(* Const before type ignored *)
function _elm_widget_onscreen_is(widget:PEvas_Object):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function _elm_widget_item_onscreen_is(item:PElm_Object_Item):TEina_Bool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function _elm_widget_accessible_plain_name_get(obj:PEvas_Object; name:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function _elm_widget_item_accessible_plain_name_get(item:PElm_Object_Item; name:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function _efl_ui_widget_bg_get(obj:PEfl_Ui_Widget):PEfl_Canvas_Object;cdecl;external;
{
static inline Eina_Bool
_elm_widget_sub_object_redirect_to_top(Evas_Object *obj, Evas_Object *sobj)

   Eina_Bool ret = elm_widget_sub_object_del(obj, sobj);
   if (!ret) return ret;
   if (elm_widget_is(sobj))
     ret = elm_widget_sub_object_add(elm_widget_top_get(obj), sobj);

   return ret;


static inline Eo *
elm_widget_resize_object_get(const Eo *obj)

   Elm_Widget_Smart_Data *wd = efl_data_scope_safe_get(obj, EFL_UI_WIDGET_CLASS);
   return wd ? wd->resize_obj : NULL;


static inline Eina_Bool
elm_widget_is_legacy(const Eo *obj)

   return efl_isa(obj, EFL_UI_LEGACY_INTERFACE);



static inline Efl_Ui_Widget *
evas_object_widget_parent_find(Evas_Object *o)

   while (o && !efl_isa(o, EFL_UI_WIDGET_CLASS))
     evas_object_smart_parent_get(o);
   return o;

 }
{ to be used by INTERNAL classes on Elementary, so that the widgets
 * parsing script skips it  }
const
  ELM_INTERNAL_SMART_SUBCLASS_NEW = EVAS_SMART_SUBCLASS_NEW;  

function elm_selection_selection_has_owner(obj:PEvas_Object):TEina_Bool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _elm_layout_part_aliasing_eval(obj:PEvas_Object; part:PPchar; is_text:TEina_Bool):TEina_Bool;cdecl;external;
{ Internal EO APIs  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_widget_default_content_part_get(obj:PEo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_widget_default_text_part_get(obj:PEo):Pchar;cdecl;external;
{$define ELM_WIDGET_ITEM_PROTECTED}
{$include "elm_widget_item_eo.h"}
{$endif}

implementation

function scroll_x_locked(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  scroll_x_locked:=(a.flag0 and bm__Elm_Widget_Smart_Data_scroll_x_locked) shr bp__Elm_Widget_Smart_Data_scroll_x_locked;
end;

procedure set_scroll_x_locked(var a : _Elm_Widget_Smart_Data; __scroll_x_locked : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scroll_x_locked shl bp__Elm_Widget_Smart_Data_scroll_x_locked) and bm__Elm_Widget_Smart_Data_scroll_x_locked);
end;

function scroll_y_locked(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  scroll_y_locked:=(a.flag0 and bm__Elm_Widget_Smart_Data_scroll_y_locked) shr bp__Elm_Widget_Smart_Data_scroll_y_locked;
end;

procedure set_scroll_y_locked(var a : _Elm_Widget_Smart_Data; __scroll_y_locked : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scroll_y_locked shl bp__Elm_Widget_Smart_Data_scroll_y_locked) and bm__Elm_Widget_Smart_Data_scroll_y_locked);
end;

function can_focus(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  can_focus:=(a.flag0 and bm__Elm_Widget_Smart_Data_can_focus) shr bp__Elm_Widget_Smart_Data_can_focus;
end;

procedure set_can_focus(var a : _Elm_Widget_Smart_Data; __can_focus : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__can_focus shl bp__Elm_Widget_Smart_Data_can_focus) and bm__Elm_Widget_Smart_Data_can_focus);
end;

function focused(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  focused:=(a.flag0 and bm__Elm_Widget_Smart_Data_focused) shr bp__Elm_Widget_Smart_Data_focused;
end;

procedure set_focused(var a : _Elm_Widget_Smart_Data; __focused : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__focused shl bp__Elm_Widget_Smart_Data_focused) and bm__Elm_Widget_Smart_Data_focused);
end;

function top_win_focused(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  top_win_focused:=(a.flag0 and bm__Elm_Widget_Smart_Data_top_win_focused) shr bp__Elm_Widget_Smart_Data_top_win_focused;
end;

procedure set_top_win_focused(var a : _Elm_Widget_Smart_Data; __top_win_focused : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__top_win_focused shl bp__Elm_Widget_Smart_Data_top_win_focused) and bm__Elm_Widget_Smart_Data_top_win_focused);
end;

function focus_move_policy_auto_mode(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  focus_move_policy_auto_mode:=(a.flag0 and bm__Elm_Widget_Smart_Data_focus_move_policy_auto_mode) shr bp__Elm_Widget_Smart_Data_focus_move_policy_auto_mode;
end;

procedure set_focus_move_policy_auto_mode(var a : _Elm_Widget_Smart_Data; __focus_move_policy_auto_mode : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__focus_move_policy_auto_mode shl bp__Elm_Widget_Smart_Data_focus_move_policy_auto_mode) and bm__Elm_Widget_Smart_Data_focus_move_policy_auto_mode);
end;

function highlight_ignore(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  highlight_ignore:=(a.flag0 and bm__Elm_Widget_Smart_Data_highlight_ignore) shr bp__Elm_Widget_Smart_Data_highlight_ignore;
end;

procedure set_highlight_ignore(var a : _Elm_Widget_Smart_Data; __highlight_ignore : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__highlight_ignore shl bp__Elm_Widget_Smart_Data_highlight_ignore) and bm__Elm_Widget_Smart_Data_highlight_ignore);
end;

function highlight_in_theme(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  highlight_in_theme:=(a.flag0 and bm__Elm_Widget_Smart_Data_highlight_in_theme) shr bp__Elm_Widget_Smart_Data_highlight_in_theme;
end;

procedure set_highlight_in_theme(var a : _Elm_Widget_Smart_Data; __highlight_in_theme : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__highlight_in_theme shl bp__Elm_Widget_Smart_Data_highlight_in_theme) and bm__Elm_Widget_Smart_Data_highlight_in_theme);
end;

function access_highlight_in_theme(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  access_highlight_in_theme:=(a.flag0 and bm__Elm_Widget_Smart_Data_access_highlight_in_theme) shr bp__Elm_Widget_Smart_Data_access_highlight_in_theme;
end;

procedure set_access_highlight_in_theme(var a : _Elm_Widget_Smart_Data; __access_highlight_in_theme : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__access_highlight_in_theme shl bp__Elm_Widget_Smart_Data_access_highlight_in_theme) and bm__Elm_Widget_Smart_Data_access_highlight_in_theme);
end;

function is_mirrored(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  is_mirrored:=(a.flag0 and bm__Elm_Widget_Smart_Data_is_mirrored) shr bp__Elm_Widget_Smart_Data_is_mirrored;
end;

procedure set_is_mirrored(var a : _Elm_Widget_Smart_Data; __is_mirrored : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__is_mirrored shl bp__Elm_Widget_Smart_Data_is_mirrored) and bm__Elm_Widget_Smart_Data_is_mirrored);
end;

function mirrored_auto_mode(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  mirrored_auto_mode:=(a.flag0 and bm__Elm_Widget_Smart_Data_mirrored_auto_mode) shr bp__Elm_Widget_Smart_Data_mirrored_auto_mode;
end;

procedure set_mirrored_auto_mode(var a : _Elm_Widget_Smart_Data; __mirrored_auto_mode : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__mirrored_auto_mode shl bp__Elm_Widget_Smart_Data_mirrored_auto_mode) and bm__Elm_Widget_Smart_Data_mirrored_auto_mode);
end;

function still_in(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  still_in:=(a.flag0 and bm__Elm_Widget_Smart_Data_still_in) shr bp__Elm_Widget_Smart_Data_still_in;
end;

procedure set_still_in(var a : _Elm_Widget_Smart_Data; __still_in : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__still_in shl bp__Elm_Widget_Smart_Data_still_in) and bm__Elm_Widget_Smart_Data_still_in);
end;

function highlighted(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  highlighted:=(a.flag0 and bm__Elm_Widget_Smart_Data_highlighted) shr bp__Elm_Widget_Smart_Data_highlighted;
end;

procedure set_highlighted(var a : _Elm_Widget_Smart_Data; __highlighted : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__highlighted shl bp__Elm_Widget_Smart_Data_highlighted) and bm__Elm_Widget_Smart_Data_highlighted);
end;

function highlight_root(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  highlight_root:=(a.flag0 and bm__Elm_Widget_Smart_Data_highlight_root) shr bp__Elm_Widget_Smart_Data_highlight_root;
end;

procedure set_highlight_root(var a : _Elm_Widget_Smart_Data; __highlight_root : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__highlight_root shl bp__Elm_Widget_Smart_Data_highlight_root) and bm__Elm_Widget_Smart_Data_highlight_root);
end;

function on_translate(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  on_translate:=(a.flag0 and bm__Elm_Widget_Smart_Data_on_translate) shr bp__Elm_Widget_Smart_Data_on_translate;
end;

procedure set_on_translate(var a : _Elm_Widget_Smart_Data; __on_translate : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__on_translate shl bp__Elm_Widget_Smart_Data_on_translate) and bm__Elm_Widget_Smart_Data_on_translate);
end;

function on_create(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  on_create:=(a.flag0 and bm__Elm_Widget_Smart_Data_on_create) shr bp__Elm_Widget_Smart_Data_on_create;
end;

procedure set_on_create(var a : _Elm_Widget_Smart_Data; __on_create : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__on_create shl bp__Elm_Widget_Smart_Data_on_create) and bm__Elm_Widget_Smart_Data_on_create);
end;

function on_destroy(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  on_destroy:=(a.flag0 and bm__Elm_Widget_Smart_Data_on_destroy) shr bp__Elm_Widget_Smart_Data_on_destroy;
end;

procedure set_on_destroy(var a : _Elm_Widget_Smart_Data; __on_destroy : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__on_destroy shl bp__Elm_Widget_Smart_Data_on_destroy) and bm__Elm_Widget_Smart_Data_on_destroy);
end;

function provider_lookup(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  provider_lookup:=(a.flag0 and bm__Elm_Widget_Smart_Data_provider_lookup) shr bp__Elm_Widget_Smart_Data_provider_lookup;
end;

procedure set_provider_lookup(var a : _Elm_Widget_Smart_Data; __provider_lookup : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__provider_lookup shl bp__Elm_Widget_Smart_Data_provider_lookup) and bm__Elm_Widget_Smart_Data_provider_lookup);
end;

function has_shadow(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  has_shadow:=(a.flag0 and bm__Elm_Widget_Smart_Data_has_shadow) shr bp__Elm_Widget_Smart_Data_has_shadow;
end;

procedure set_has_shadow(var a : _Elm_Widget_Smart_Data; __has_shadow : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__has_shadow shl bp__Elm_Widget_Smart_Data_has_shadow) and bm__Elm_Widget_Smart_Data_has_shadow);
end;

function internal(var a : _Elm_Widget_Smart_Data) : TEina_Bool;
begin
  internal:=(a.flag0 and bm__Elm_Widget_Smart_Data_internal) shr bp__Elm_Widget_Smart_Data_internal;
end;

procedure set_internal(var a : _Elm_Widget_Smart_Data; __internal : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__internal shl bp__Elm_Widget_Smart_Data_internal) and bm__Elm_Widget_Smart_Data_internal);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WIDGET_ITEM_DATA_GET(eo_obj : longint) : longint;
begin
  WIDGET_ITEM_DATA_GET:=efl_key_data_get(PEo(eo_obj),'__elm_widget_item_data');
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WIDGET_ITEM_DATA_SET(eo_obj,data : longint) : longint;
begin
  WIDGET_ITEM_DATA_SET:=efl_key_data_set(PEo(eo_obj),'__elm_widget_item_data',data);
end;

function disabled(var a : TElm_Widget_Item_Data) : TEina_Bool;
begin
  disabled:=(a.flag0 and bm_TElm_Widget_Item_Data_disabled) shr bp_TElm_Widget_Item_Data_disabled;
end;

procedure set_disabled(var a : TElm_Widget_Item_Data; __disabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__disabled shl bp_TElm_Widget_Item_Data_disabled) and bm_TElm_Widget_Item_Data_disabled);
end;

function on_deletion(var a : TElm_Widget_Item_Data) : TEina_Bool;
begin
  on_deletion:=(a.flag0 and bm_TElm_Widget_Item_Data_on_deletion) shr bp_TElm_Widget_Item_Data_on_deletion;
end;

procedure set_on_deletion(var a : TElm_Widget_Item_Data; __on_deletion : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__on_deletion shl bp_TElm_Widget_Item_Data_on_deletion) and bm_TElm_Widget_Item_Data_on_deletion);
end;

function on_translate(var a : TElm_Widget_Item_Data) : TEina_Bool;
begin
  on_translate:=(a.flag0 and bm_TElm_Widget_Item_Data_on_translate) shr bp_TElm_Widget_Item_Data_on_translate;
end;

procedure set_on_translate(var a : TElm_Widget_Item_Data; __on_translate : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__on_translate shl bp_TElm_Widget_Item_Data_on_translate) and bm_TElm_Widget_Item_Data_on_translate);
end;

function still_in(var a : TElm_Widget_Item_Data) : TEina_Bool;
begin
  still_in:=(a.flag0 and bm_TElm_Widget_Item_Data_still_in) shr bp_TElm_Widget_Item_Data_still_in;
end;

procedure set_still_in(var a : TElm_Widget_Item_Data; __still_in : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__still_in shl bp_TElm_Widget_Item_Data_still_in) and bm_TElm_Widget_Item_Data_still_in);
end;


end.
