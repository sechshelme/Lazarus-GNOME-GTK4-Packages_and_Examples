
unit elm_entry_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_entry_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_entry_common.h
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
PElm_Entry_Anchor_Hover_Info  = ^Elm_Entry_Anchor_Hover_Info;
PElm_Entry_Anchor_Info  = ^Elm_Entry_Anchor_Info;
PElm_Entry_Change_Info  = ^Elm_Entry_Change_Info;
PElm_Entry_Context_Menu_Item  = ^Elm_Entry_Context_Menu_Item;
PElm_Entry_Filter_Accept_Set  = ^Elm_Entry_Filter_Accept_Set;
PElm_Entry_Filter_Limit_Size  = ^Elm_Entry_Filter_Limit_Size;
PElm_Entry_Item_Provider_Cb  = ^Elm_Entry_Item_Provider_Cb;
PElm_Icon_Type  = ^Elm_Icon_Type;
PElm_Input_Panel_Layout_Normal_Variation  = ^Elm_Input_Panel_Layout_Normal_Variation;
PElm_Input_Panel_Layout_Numberonly_Variation  = ^Elm_Input_Panel_Layout_Numberonly_Variation;
PElm_Input_Panel_Layout_Password_Variation  = ^Elm_Input_Panel_Layout_Password_Variation;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_ENTRY_COMMON_H_}
{$define ELM_ENTRY_COMMON_H_}
{*
 * @addtogroup Elm_Entry_Group
 *
 * @
  }
{*
 * @typedef Elm_Input_Panel_Layout_Normal_Variation
 * @brief Enumeration for defining the types of Elm Input Panel Layout for normal variation.
 * @since 1.12
  }
{*< The plain normal layout @since 1.12  }
{*< Filename layout. Symbols such as '/' should be disabled. @since 1.12  }
{*< The name of a person. @since 1.12  }
type
  PElm_Input_Panel_Layout_Normal_Variation = ^TElm_Input_Panel_Layout_Normal_Variation;
  TElm_Input_Panel_Layout_Normal_Variation =  Longint;
  Const
    ELM_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_NORMAL = 0;
    ELM_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_FILENAME = 1;
    ELM_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_PERSON_NAME = 2;
;
{*
 * @typedef Elm_Input_Panel_Layout_Numberonly_Variation
 * @brief Enumeration for defining the types of Elm Input Panel Layout for number only variation.
 * @since 1.8
  }
{*< The plain normal number layout @since 1.8  }
{*< The number layout to allow a positive or negative sign at the start @since 1.8  }
{*< The number layout to allow decimal point to provide fractional value @since 1.8  }
{*< The number layout to allow decimal point and negative sign @since 1.8  }
type
  PElm_Input_Panel_Layout_Numberonly_Variation = ^TElm_Input_Panel_Layout_Numberonly_Variation;
  TElm_Input_Panel_Layout_Numberonly_Variation =  Longint;
  Const
    ELM_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_NORMAL = 0;
    ELM_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_SIGNED = 1;
    ELM_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_DECIMAL = 2;
    ELM_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_SIGNED_AND_DECIMAL = 3;
;
{*
 * @typedef Elm_Input_Panel_Layout_Password_Variation
 * @brief Enumeration for defining the types of Elm Input Panel Layout for password variation.
 * @since 1.12
  }
{*< The normal password layout @since 1.12  }
{*< The password layout to allow only number @since 1.12  }
type
  PElm_Input_Panel_Layout_Password_Variation = ^TElm_Input_Panel_Layout_Password_Variation;
  TElm_Input_Panel_Layout_Password_Variation =  Longint;
  Const
    ELM_INPUT_PANEL_LAYOUT_PASSWORD_VARIATION_NORMAL = 0;
    ELM_INPUT_PANEL_LAYOUT_PASSWORD_VARIATION_NUMBERONLY = 1;
;
{*
 * The info sent in the callback for the "anchor,clicked" signals emitted
 * by entries.
  }
type
{*
 * The info sent in the callback for the "anchor,clicked" signals emitted
 * by entries.
  }
(* Const before type ignored *)
{*< The name of the anchor, as stated in its href  }
{*< The mouse button used to click on it  }
{*< Anchor geometry, relative to canvas  }
{*< Anchor geometry, relative to canvas  }
{*< Anchor geometry, relative to canvas  }
{*< Anchor geometry, relative to canvas  }
  PElm_Entry_Anchor_Info = ^TElm_Entry_Anchor_Info;
  TElm_Entry_Anchor_Info = record
      name : Pchar;
      button : longint;
      x : TEvas_Coord;
      y : TEvas_Coord;
      w : TEvas_Coord;
      h : TEvas_Coord;
    end;

{*
 * The info sent in the callback for "anchor,clicked" signals emitted by
 * the Anchor_Hover widget.
  }
{*
 * Type of contextual item that can be added in to long press menu.
 * @since 1.8
  }
{*
 * The info sent in the callback for "anchor,clicked" signals emitted by
 * the Anchor_Hover widget.
  }
(* Const before type ignored *)
{*< The actual anchor info.  }
{*< The hover object to use for the popup  }
{*< Geometry of the object used as parent by the
                        hover  }
{*< Hint indicating if there's space
                                     for content on the left side of
                                     the hover. Before calling the
                                     callback, the widget will make the
                                     necessary calculations to check
                                     which sides are fit to be set with
                                     content, based on the position the
                                     hover is activated and its distance
                                     to the edges of its parent object
                                  }
{*< Hint indicating content fits on
                                      the right side of the hover.
                                      See @ref hover_left  }
{*< Hint indicating content fits on top
                                    of the hover. See @ref hover_left  }
{*< Hint indicating content fits
                                       below the hover. See @ref
                                       hover_left  }
  PElm_Entry_Anchor_Hover_Info = ^TElm_Entry_Anchor_Hover_Info;
  TElm_Entry_Anchor_Hover_Info = record
      anchor_info : PElm_Entry_Anchor_Info;
      hover : PEvas_Object;
      hover_parent : record
          x : TEvas_Coord;
          y : TEvas_Coord;
          w : TEvas_Coord;
          h : TEvas_Coord;
        end;
      flag0 : word;
    end;


const
  bm_TElm_Entry_Anchor_Hover_Info_hover_left = $1;
  bp_TElm_Entry_Anchor_Hover_Info_hover_left = 0;
  bm_TElm_Entry_Anchor_Hover_Info_hover_right = $2;
  bp_TElm_Entry_Anchor_Hover_Info_hover_right = 1;
  bm_TElm_Entry_Anchor_Hover_Info_hover_top = $4;
  bp_TElm_Entry_Anchor_Hover_Info_hover_top = 2;
  bm_TElm_Entry_Anchor_Hover_Info_hover_bottom = $8;
  bp_TElm_Entry_Anchor_Hover_Info_hover_bottom = 3;

function hover_left(var a : TElm_Entry_Anchor_Hover_Info) : TEina_Bool;
procedure set_hover_left(var a : TElm_Entry_Anchor_Hover_Info; __hover_left : TEina_Bool);
function hover_right(var a : TElm_Entry_Anchor_Hover_Info) : TEina_Bool;
procedure set_hover_right(var a : TElm_Entry_Anchor_Hover_Info; __hover_right : TEina_Bool);
function hover_top(var a : TElm_Entry_Anchor_Hover_Info) : TEina_Bool;
procedure set_hover_top(var a : TElm_Entry_Anchor_Hover_Info; __hover_top : TEina_Bool);
function hover_bottom(var a : TElm_Entry_Anchor_Hover_Info) : TEina_Bool;
procedure set_hover_bottom(var a : TElm_Entry_Anchor_Hover_Info; __hover_bottom : TEina_Bool);
{*
 * This callback type is used to provide items.
 * If it returns an object handle other than NULL (it should create an
 * object to do this), then this object is used to replace the current item.
 * If not the next provider is called until one provides an item object, or the
 * default provider in entry does.
 * @param data The data specified as the last param when adding the provider
 * @param entry The entry object
 * @param text A pointer to the item href string in the text
 * @return The object to be placed in the entry like an icon, or other element
 * @see elm_entry_item_provider_append
 * @see elm_entry_item_provider_prepend
 * @see elm_entry_item_provider_remove
  }
(* Const before type ignored *)
type
  PElm_Entry_Item_Provider_Cb = ^TElm_Entry_Item_Provider_Cb;
  TElm_Entry_Item_Provider_Cb = function (data:pointer; entry:PEvas_Object; item:Pchar):PEvas_Object;cdecl;
{*
 * This callback type is used by entry filters to modify text.
 * @param data The data specified as the last param when adding the filter
 * @param entry The entry object
 * @param text A pointer to the location of the text being filtered. The type of text is always markup. This data can be modified, but any additional allocations must be managed by the user.
 * @see elm_entry_markup_filter_append
 * @see elm_entry_markup_filter_prepend
 * @see elm_entry_markup_filter_remove
  }

  TElm_Entry_Filter_Cb = procedure (data:pointer; entry:PEvas_Object; text:PPchar);cdecl;
{*
 * This corresponds to Edje_Entry_Change_Info. Includes information about
 * a change in the entry.
  }

  PElm_Entry_Change_Info = ^TElm_Entry_Change_Info;
  TElm_Entry_Change_Info = TEdje_Entry_Change_Info;
{*
 * This converts a markup (HTML-like) string into UTF-8.
 *
 * The returned string is a malloc'ed buffer and it should be freed when
 * not needed anymore.
 *
 * @param s The string (in markup) to be converted
 * @return The converted string (in UTF-8). It should be freed.
  }
(* Const before type ignored *)

function elm_entry_markup_to_utf8(s:Pchar):Pchar;cdecl;external;
{*
 * This converts a UTF-8 string into markup (HTML-like).
 *
 * The returned string is a malloc'ed buffer and it should be freed when
 * not needed anymore.
 *
 * @param s The string (in UTF-8) to be converted
 * @return The converted string (in markup). It should be freed.
 *
 * For example, passing "<align=center>hello</align>&gt;" will return
 * "&lt;align=center&gt;hello&lt;/align&gt; &amp;gt;". This is useful when you
 * want to display "&" in label, entry, and some widgets which use textblock
 * internally.
  }
(* Const before type ignored *)
function elm_entry_utf8_to_markup(s:Pchar):Pchar;cdecl;external;
{ pre-made filters for entries  }
{*
 * Data for the elm_entry_filter_limit_size() entry filter.
  }
type
{*
 * Data for the elm_entry_filter_limit_size() entry filter.
  }
{*< The maximum number of characters allowed.  }
{*< The maximum number of bytes allowed }
  PElm_Entry_Filter_Limit_Size = ^TElm_Entry_Filter_Limit_Size;
  TElm_Entry_Filter_Limit_Size = record
      max_char_count : longint;
      max_byte_count : longint;
    end;

{*
 * Filter inserted text based on user defined character and byte limits
 *
 * Add this filter to an entry to limit the characters that it will accept
 * based the contents of the provided #Elm_Entry_Filter_Limit_Size.
 * The function works on the UTF-8 representation of the string, converting
 * it from the set markup, thus not accounting for any format in it.
 *
 * @param[in] data The data passed to this function.
 * @param[in] entry The object.
 * @param[in,out] text The entry's text to limit size
 *
 * The user must create an #Elm_Entry_Filter_Limit_Size structure and pass
 * it as data when setting the filter. In it, it's possible to set limits
 * by character count or bytes (any of them is disabled if 0), and both can
 * be set at the same time. In that case, it first checks for characters,
 * then bytes. The #Elm_Entry_Filter_Limit_Size structure must be alive and
 * valid for as long as the entry is alive AND the elm_entry_filter_limit_size
 * filter is set.
 *
 * The function will cut the inserted text in order to allow only the first
 * number of characters that are still allowed. The cut is made in
 * characters, even when limiting by bytes, in order to always contain
 * valid ones and avoid half unicode characters making it in.
 *
 * This filter, like any others, does not apply when setting the entry text
 * directly with elm_object_text_set().
  }

procedure elm_entry_filter_limit_size(data:pointer; entry:PEvas_Object; text:PPchar);cdecl;external;
{*
 * Data for the elm_entry_filter_accept_set() entry filter.
  }
type
{*
 * Data for the elm_entry_filter_accept_set() entry filter.
  }
(* Const before type ignored *)
{*< Set of characters accepted in the entry.  }
(* Const before type ignored *)
{*< Set of characters rejected from the entry.  }
  PElm_Entry_Filter_Accept_Set = ^TElm_Entry_Filter_Accept_Set;
  TElm_Entry_Filter_Accept_Set = record
      accepted : Pchar;
      rejected : Pchar;
    end;

{*
 * Filter inserted text based on accepted or rejected sets of characters
 *
 * Add this filter to an entry to restrict the set of accepted characters
 * based on the sets in the provided #Elm_Entry_Filter_Accept_Set.
 * This structure contains both accepted and rejected sets, but they are
 * mutually exclusive. This structure must be available for as long as
 * the entry is alive AND the elm_entry_filter_accept_set is being used.
 *
 * @param[in] data The data passed to this function.
 * @param[in] entry The object.
 * @param[in,out] text The entry's text to accept or reject filter
 *
 * The @c accepted set takes preference, so if it is set, the filter will
 * only work based on the accepted characters, ignoring anything in the
 * @c rejected value. If @c accepted is @c NULL, then @c rejected is used.
 *
 * In both cases, the function filters by matching utf8 characters to the
 * raw markup text, so it can be used to remove formatting tags.
 *
 * This filter, like any others, does not apply when setting the entry text
 * directly with elm_object_text_set()
  }

procedure elm_entry_filter_accept_set(data:pointer; entry:PEvas_Object; text:PPchar);cdecl;external;
{*
 * Get the text of the contextual menu item of entry.
 *
 * @param item The item to get the label
 * @return The text of contextual menu item
 *
 * @see elm_entry_context_menu_item_add()
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_entry_context_menu_item_label_get(item:PElm_Entry_Context_Menu_Item):Pchar;cdecl;external;
{*
 * Get the icon object packed in the contextual menu item of entry.
 *
 * @param item The item to get the icon from
 * @param icon_file The image file path on disk used for the icon or standard
 * icon name
 * @param icon_group The edje group used if @p icon_file is an edje file. NULL
 * if the icon is not an edje file
 * @param icon_type The icon type
 *
 * @see elm_entry_context_menu_item_add()
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_entry_context_menu_item_icon_get(item:PElm_Entry_Context_Menu_Item; icon_file:PPchar; icon_group:PPchar; icon_type:PElm_Icon_Type);cdecl;external;
{*
 * @
  }
{$endif}
{ELM_ENTRY_COMMON_H_ }

implementation

function hover_left(var a : TElm_Entry_Anchor_Hover_Info) : TEina_Bool;
begin
  hover_left:=(a.flag0 and bm_TElm_Entry_Anchor_Hover_Info_hover_left) shr bp_TElm_Entry_Anchor_Hover_Info_hover_left;
end;

procedure set_hover_left(var a : TElm_Entry_Anchor_Hover_Info; __hover_left : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__hover_left shl bp_TElm_Entry_Anchor_Hover_Info_hover_left) and bm_TElm_Entry_Anchor_Hover_Info_hover_left);
end;

function hover_right(var a : TElm_Entry_Anchor_Hover_Info) : TEina_Bool;
begin
  hover_right:=(a.flag0 and bm_TElm_Entry_Anchor_Hover_Info_hover_right) shr bp_TElm_Entry_Anchor_Hover_Info_hover_right;
end;

procedure set_hover_right(var a : TElm_Entry_Anchor_Hover_Info; __hover_right : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__hover_right shl bp_TElm_Entry_Anchor_Hover_Info_hover_right) and bm_TElm_Entry_Anchor_Hover_Info_hover_right);
end;

function hover_top(var a : TElm_Entry_Anchor_Hover_Info) : TEina_Bool;
begin
  hover_top:=(a.flag0 and bm_TElm_Entry_Anchor_Hover_Info_hover_top) shr bp_TElm_Entry_Anchor_Hover_Info_hover_top;
end;

procedure set_hover_top(var a : TElm_Entry_Anchor_Hover_Info; __hover_top : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__hover_top shl bp_TElm_Entry_Anchor_Hover_Info_hover_top) and bm_TElm_Entry_Anchor_Hover_Info_hover_top);
end;

function hover_bottom(var a : TElm_Entry_Anchor_Hover_Info) : TEina_Bool;
begin
  hover_bottom:=(a.flag0 and bm_TElm_Entry_Anchor_Hover_Info_hover_bottom) shr bp_TElm_Entry_Anchor_Hover_Info_hover_bottom;
end;

procedure set_hover_bottom(var a : TElm_Entry_Anchor_Hover_Info; __hover_bottom : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__hover_bottom shl bp_TElm_Entry_Anchor_Hover_Info_hover_bottom) and bm_TElm_Entry_Anchor_Hover_Info_hover_bottom);
end;


end.
