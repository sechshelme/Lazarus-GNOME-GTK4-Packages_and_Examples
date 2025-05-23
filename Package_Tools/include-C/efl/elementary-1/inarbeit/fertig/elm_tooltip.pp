
unit elm_tooltip;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_tooltip.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_tooltip.h
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
PElm_Tooltip_Content_Cb  = ^Elm_Tooltip_Content_Cb;
PElm_Tooltip_Item_Content_Cb  = ^Elm_Tooltip_Item_Content_Cb;
PElm_Tooltip_Orient  = ^Elm_Tooltip_Orient;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @defgroup Elm_Tooltips Tooltips
 * @ingroup Elementary
 *
 * The Tooltip is an (internal, for now) smart object used to show a
 * content in a frame on mouse hover of objects(or widgets), with
 * tips/information about them.
 *
 * @
  }
{*
 * @brief Possible orient values for tooltip.
 *
 * These values should be used in conjunction to elm_object_tooltip_orient_set() to
 * set the position around which the tooltip should appear(relative to its parent)
 *
 * @ingroup Elm_Tooltips
  }
{*< Default value, Tooltip moves with mouse pointer  }
{*< Tooltip should appear at the top left of parent  }
{*< Tooltip should appear at the top of parent  }
{*< Tooltip should appear at the top right of parent  }
{*< Tooltip should appear at the left of parent  }
{*< Tooltip should appear at the center of parent  }
{*< Tooltip should appear at the right of parent  }
{*< Tooltip should appear at the bottom left of parent  }
{*< Tooltip should appear at the bottom of parent  }
{*< Tooltip should appear at the bottom right of parent  }
{*< Sentinel value, @b don't use  }
type
  PElm_Tooltip_Orient = ^TElm_Tooltip_Orient;
  TElm_Tooltip_Orient =  Longint;
  Const
    ELM_TOOLTIP_ORIENT_NONE = 0;
    ELM_TOOLTIP_ORIENT_TOP_LEFT = 1;
    ELM_TOOLTIP_ORIENT_TOP = 2;
    ELM_TOOLTIP_ORIENT_TOP_RIGHT = 3;
    ELM_TOOLTIP_ORIENT_LEFT = 4;
    ELM_TOOLTIP_ORIENT_CENTER = 5;
    ELM_TOOLTIP_ORIENT_RIGHT = 6;
    ELM_TOOLTIP_ORIENT_BOTTOM_LEFT = 7;
    ELM_TOOLTIP_ORIENT_BOTTOM = 8;
    ELM_TOOLTIP_ORIENT_BOTTOM_RIGHT = 9;
    ELM_TOOLTIP_ORIENT_LAST = 10;
;
{*
 * This increments the tooltip movement freeze count by one. If the count
 * is more than 0, the tooltip position will be fixed.
 *
 * @param obj The tooltip's anchor object
 *
 * @ingroup Elm_Tooltips
 * @see elm_object_tooltip_move_freeze_pop()
 * @see elm_object_tooltip_move_freeze_get()
 * @since 1.9
  }

procedure elm_object_tooltip_move_freeze_push(obj:PEvas_Object);cdecl;external;
{*
 * This decrements the tooltip freeze count by one.
 *
 * @param obj The tooltip's anchor object
 *
 * @ingroup Elm_Tooltips
 * @see elm_object_tooltip_move_freeze_push()
 * @since 1.9
  }
procedure elm_object_tooltip_move_freeze_pop(obj:PEvas_Object);cdecl;external;
{*
 * Get the movement freeze count
 *
 * This gets the movement freeze count.
 *
 * @param obj The tooltip's anchor object
 * @return The movement freeze count
 *
 * @ingroup Elm_Tooltips
 * @see elm_object_tooltip_move_freeze_push()
 * @since 1.9
  }
(* Const before type ignored *)
function elm_object_tooltip_move_freeze_get(obj:PEvas_Object):longint;cdecl;external;
{*
 * @brief Sets the orientation of the tooltip around the owner region
 *
 * Sets the position in which tooltip will appear around its owner. By default,
 * #ELM_TOOLTIP_ORIENT_NONE is set.
 *
 * @param obj The owner widget.
 * @param orient The orientation of the tooltip.
 *
 * @ingroup Elm_Tooltips
 * @see Elm_Tooltip_Orient for possible values.
 * @since 1.9
  }
procedure elm_object_tooltip_orient_set(obj:PEvas_Object; orient:TElm_Tooltip_Orient);cdecl;external;
{*
 * @brief Returns the orientation of Tooltip
 *
 * @param obj The owner object
 * @return The orientation of the tooltip
 *
 * @ingroup Elm_Tooltips
 * @see elm_object_tooltip_orient_set()
 * @ref Elm_Tooltip_Orient for possible values.
  }
(* Const before type ignored *)
function elm_object_tooltip_orient_get(obj:PEvas_Object):TElm_Tooltip_Orient;cdecl;external;
{*
 * Called back when a widget's tooltip is activated and needs content.
 * @param data user-data given to elm_object_tooltip_content_cb_set()
 * @param obj owner widget.
 * @param tooltip The tooltip object (affix content to this!)
  }
type
  PElm_Tooltip_Content_Cb = ^TElm_Tooltip_Content_Cb;
  TElm_Tooltip_Content_Cb = function (data:pointer; obj:PEvas_Object; tooltip:PEvas_Object):PEvas_Object;cdecl;
{*
 * Called back when a widget's item tooltip is activated and needs content.
 * @param data user-data given to elm_object_tooltip_content_cb_set()
 * @param obj owner widget.
 * @param tooltip The tooltip object (affix content to this!)
 * @param item context dependent item. As an example, if tooltip was
 *        set on elm_list item, then it is of this type.
  }

  PElm_Tooltip_Item_Content_Cb = ^TElm_Tooltip_Item_Content_Cb;
  TElm_Tooltip_Item_Content_Cb = function (data:pointer; obj:PEvas_Object; tooltip:PEvas_Object; item:pointer):PEvas_Object;cdecl;
{*
 * @brief Force show tooltip of object
 *
 * @param obj Target object
 *
 * Force show the tooltip and disable hide on mouse_out.
 * If another content is set as tooltip, the visible tooltip will be hidden and
 * showed again with new content.
 * This can force show more than one tooltip at a time.
 *
 * @ingroup Elm_Tooltips
  }

procedure elm_object_tooltip_show(obj:PEvas_Object);cdecl;external;
{*
 * @brief Force hide tooltip of object
 *
 * @param obj Target object
 *
 * Force hide the tooltip and (re)enable future mouse interations.
 *
 * @ingroup Elm_Tooltips
  }
procedure elm_object_tooltip_hide(obj:PEvas_Object);cdecl;external;
{*
 * @brief Set the text to be displayed inside the tooltip.
 *
 * @param obj The tooltip object.
 * @param text The text to be displayed.
 *
 * @ingroup Elm_Tooltips
  }
(* Const before type ignored *)
procedure elm_object_tooltip_text_set(obj:PEvas_Object; text:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_object_tooltip_domain_translatable_text_set(obj:PEvas_Object; domain:Pchar; text:Pchar);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_tooltip_translatable_text_set(obj,text : longint) : longint;

{*
 * @brief Set the content to be shown in the tooltip object
 *
 * @param obj The object being attached a tooltip.
 * @param func The function used to create the tooltip contents.
 * @param data What to provide to @a func as callback data/context.
 * @param del_cb Function called when data is not needed anymore, either when
 *        another callback replaces @p func, the tooltip is unset with
 *        elm_object_tooltip_unset() or the owner object @a obj
 *        dies. This callback receives as the first parameter the
 *        given @a data, and @p event_info is NULL.
 *
 * Setup the tooltip to object. The object can have only one tooltip,
 * so any previous tooltip data is removed. @p func(with @p data) will
 * be called every time that need show the tooltip and it should
 * return a valid Evas_Object. This object is then managed fully by
 * tooltip system and is deleted when the tooltip is gone.
 *
 * @ingroup Elm_Tooltips
  }
(* Const before type ignored *)
procedure elm_object_tooltip_content_cb_set(obj:PEvas_Object; func:TElm_Tooltip_Content_Cb; data:pointer; del_cb:TEvas_Smart_Cb);cdecl;external;
{*
 * @brief Unset tooltip from object
 *
 * @param obj Target object
 *
 * Remove tooltip from object. The callback provided as del_cb to
 * elm_object_tooltip_content_cb_set() will be called to notify it is
 * not used anymore.
 *
 * @see elm_object_tooltip_content_cb_set()
 *
 * @ingroup Elm_Tooltips
  }
procedure elm_object_tooltip_unset(obj:PEvas_Object);cdecl;external;
{*
 * @brief Set a different style for this object tooltip.
 *
 * @note before you set a style you should define a tooltip with
 *       elm_object_tooltip_content_cb_set() or
 *       elm_object_tooltip_text_set().
 *
 * @param obj an object with tooltip already set.
 * @param style the theme style to use (default, transparent, ...)
 *
 * @ingroup Elm_Tooltips
  }
(* Const before type ignored *)
procedure elm_object_tooltip_style_set(obj:PEvas_Object; style:Pchar);cdecl;external;
{*
 * @brief Get the style for this object tooltip.
 *
 * @param obj an object with tooltip already set.
 * @return style the theme style in use, defaults to "default". If the
 *         object does not have a tooltip set, then NULL is returned.
 *
 * @ingroup Elm_Tooltips
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_object_tooltip_style_get(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * @brief Disable size restrictions on an object's tooltip
 *
 * @param obj The tooltip's anchor object
 * @param disable If @c EINA_TRUE, size restrictions are disabled
 * @return @c EINA_FALSE on failure, @c EINA_TRUE on success
 *
 * This function allows a tooltip to expand beyond its parent window's canvas.
 * It will instead be limited only by the size of the display.
 *
 * @ingroup Elm_Tooltips
  }
function elm_object_tooltip_window_mode_set(obj:PEvas_Object; disable:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Get size restriction state of an object's tooltip
 *
 * @param obj The tooltip's anchor object
 * @return If @c EINA_TRUE, size restrictions are disabled
 *
 * This function returns whether a tooltip is allowed to expand beyond
 * its parent window's canvas.
 * It will instead be limited only by the size of the display.
 *
 * @ingroup Elm_Tooltips
  }
(* Const before type ignored *)
function elm_object_tooltip_window_mode_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @
  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_tooltip_translatable_text_set(obj,text : longint) : longint;
begin
  elm_object_tooltip_translatable_text_set:=elm_object_tooltip_domain_translatable_text_set(obj,NULL,text);
end;


end.
