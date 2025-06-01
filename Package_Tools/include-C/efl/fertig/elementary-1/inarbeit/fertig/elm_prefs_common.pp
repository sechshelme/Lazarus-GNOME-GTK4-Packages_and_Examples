
unit elm_prefs_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_prefs_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_prefs_common.h
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
PEina_Value  = ^Eina_Value;
PElm_Prefs_Item_Iface  = ^Elm_Prefs_Item_Iface;
PElm_Prefs_Item_Iface_Info  = ^Elm_Prefs_Item_Iface_Info;
PElm_Prefs_Item_Spec  = ^Elm_Prefs_Item_Spec;
PElm_Prefs_Item_Spec_Bool  = ^Elm_Prefs_Item_Spec_Bool;
PElm_Prefs_Item_Spec_Date  = ^Elm_Prefs_Item_Spec_Date;
PElm_Prefs_Item_Spec_Float  = ^Elm_Prefs_Item_Spec_Float;
PElm_Prefs_Item_Spec_Int  = ^Elm_Prefs_Item_Spec_Int;
PElm_Prefs_Item_Spec_Page  = ^Elm_Prefs_Item_Spec_Page;
PElm_Prefs_Item_Spec_String  = ^Elm_Prefs_Item_Spec_String;
PElm_Prefs_Item_Spec_Void  = ^Elm_Prefs_Item_Spec_Void;
PElm_Prefs_Item_Type  = ^Elm_Prefs_Item_Type;
PElm_Prefs_Page_Iface  = ^Elm_Prefs_Page_Iface;
PElm_Prefs_Page_Iface_Info  = ^Elm_Prefs_Page_Iface_Info;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @addtogroup Elm_Prefs
 *
 * @
  }
{*
 * @brief Add a new prefs widget
 *
 * @param parent The parent widget to hold the new one
 * @return The new object or @c NULL, on errors
 *
 * @since 1.8
  }

function elm_prefs_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{ API for prefs interface modules, from now on  }
type
{for compatibility (warning: empty struct has size 0 in C, size 1 in C++) }
  PElm_Prefs_Item_Spec_Void = ^TElm_Prefs_Item_Spec_Void;
  TElm_Prefs_Item_Spec_Void = record
      dummy : char;
    end;

  PElm_Prefs_Item_Spec_Bool = ^TElm_Prefs_Item_Spec_Bool;
  TElm_Prefs_Item_Spec_Bool = record
      def : TEina_Bool;
    end;

  PElm_Prefs_Item_Spec_Int = ^TElm_Prefs_Item_Spec_Int;
  TElm_Prefs_Item_Spec_Int = record
      def : longint;
      min : longint;
      max : longint;
    end;

  PElm_Prefs_Item_Spec_Float = ^TElm_Prefs_Item_Spec_Float;
  TElm_Prefs_Item_Spec_Float = record
      def : single;
      min : single;
      max : single;
    end;

(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PElm_Prefs_Item_Spec_String = ^TElm_Prefs_Item_Spec_String;
  TElm_Prefs_Item_Spec_String = record
      def : Pchar;
      placeholder : Pchar;
      accept : Pchar;
      deny : Pchar;
      length : record
          min : longint;
          max : longint;
        end;
    end;

{ day }
{ month }
{ year  }
{ day }
{ month }
{ year  }
{ day }
{ month }
{ year  }
  PElm_Prefs_Item_Spec_Date = ^TElm_Prefs_Item_Spec_Date;
  TElm_Prefs_Item_Spec_Date = record
      def : record
          d : byte;
          m : byte;
          y : word;
        end;
      min : record
          d : byte;
          m : byte;
          y : word;
        end;
      max : record
          d : byte;
          m : byte;
          y : word;
        end;
    end;

(* Const before type ignored *)
  PElm_Prefs_Item_Spec_Page = ^TElm_Prefs_Item_Spec_Page;
  TElm_Prefs_Item_Spec_Page = record
      source : Pchar;
    end;


  PElm_Prefs_Item_Spec = ^TElm_Prefs_Item_Spec;
  TElm_Prefs_Item_Spec = TElm_Prefs_Item_Spec;
  PElm_Prefs_Item_Spec = ^TElm_Prefs_Item_Spec;
  TElm_Prefs_Item_Spec = record
      case longint of
        0 : ( v : TElm_Prefs_Item_Spec_Void );
        1 : ( b : TElm_Prefs_Item_Spec_Bool );
        2 : ( i : TElm_Prefs_Item_Spec_Int );
        3 : ( f : TElm_Prefs_Item_Spec_Float );
        4 : ( s : TElm_Prefs_Item_Spec_String );
        5 : ( d : TElm_Prefs_Item_Spec_Date );
        6 : ( p : TElm_Prefs_Item_Spec_Page );
      end;


  TElm_Prefs_Item_Changed_Cb = procedure (it_obj:PEvas_Object);cdecl;
{*< Elementary prefs' item widget changed function signature  }
{*
 * @struct _Elm_Prefs_Item_Iface
 *
 * @brief Interface between items of the @ref elm-prefs-widget widget
 *        and the real widgets implementing them.
 *
 * This structure defines the interface between the
 * @ref elm-prefs-widget widget's items (all item types in Elementary prefs
 * collections but the @c PAGE one) and Elementary widgets
 * implementing them. @c add() is the only mandatory function an
 * item widget has to implement.
 *
 * @note For items of type @c PAGE, refer to #Elm_Prefs_Page_Iface.
 *
 * @since 1.8
  }

const
  ELM_PREFS_ITEM_IFACE_ABI_VERSION = 1;  
{*< always use:
                                            *  - #ELM_PREFS_ITEM_IFACE_ABI_VERSION to declare.
                                            *  - elm_prefs_widget_iface_abi_version_get() to check.
                                             }
(* Const before type ignored *)
{*< types of prefs items supported by the widget, #ELM_PREFS_TYPE_UNKNOWN terminated  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{*< Function to instantiate the item widget. It must return the widget handle, which should be the @c obj argument on the functions which follow. That object argument, by the way, should always have their respective #Elm_Prefs_Item_Node handle accessible via a @c "prefs_item" Evas object data value. The return value of the following functions should be @c EINA_TRUE, on success or @c EINA_FALSE, otherwise.  }
{*< Function to set the value on the item widget. Note that for items of type #ELM_PREFS_TYPE_SEPARATOR, this function has a special meaning of making the separator widget a @b horizontal one  }
{*< Function to set the value on the item widget. Note that for items of type #ELM_PREFS_TYPE_SEPARATOR, this function has a special meaning of making the separator widget a @b vertical one  }
{* < Function to validate the value from the item widget before saving it. The return value of the following function should be @c EINA_TRUE, if the value conforms with the expected or @c EINA_FALSE, otherwise.  }
(* Const before type ignored *)
{*< function to set a label on the item widget  }
(* Const before type ignored *)
{*< function to set an icon on the item widget  }
{*< function to set an item widget as editable or not  }
{*< function to retrieve whether an item widget is editable or not  }
{*< function to get whether the item implementation needs to be expanded in the page's longitudinal axis or not  }
type
  PElm_Prefs_Item_Iface = ^TElm_Prefs_Item_Iface;
  TElm_Prefs_Item_Iface = record
      abi_version : dword;cdecl;
      types : PElm_Prefs_Item_Type;
      add : function (iface:PElm_Prefs_Item_Iface; prefs:PEvas_Object; _type:TElm_Prefs_Item_Type; spec:TElm_Prefs_Item_Spec; it_changed_cb:TElm_Prefs_Item_Changed_Cb):PEvas_Object;cdecl;
      value_set : function (obj:PEvas_Object; value:PEina_Value):TEina_Bool;cdecl;
      value_get : function (obj:PEvas_Object; value:PEina_Value):TEina_Bool;cdecl;
      value_validate : function (obj:PEvas_Object):TEina_Bool;cdecl;
      label_set : function (obj:PEvas_Object; _label:Pchar):TEina_Bool;cdecl;
      icon_set : function (obj:PEvas_Object; icon:Pchar):TEina_Bool;cdecl;
      editable_set : function (obj:PEvas_Object; val:TEina_Bool):TEina_Bool;cdecl;
      editable_get : function (obj:PEvas_Object):TEina_Bool;cdecl;
      expand_want : function (obj:PEvas_Object):TEina_Bool;cdecl;
    end;

{*
 * Convenience struct used to mass-register widgets implementing
 * prefs @b items interfaces.
 *
 * To be used with elm_prefs_item_iface_register() and
 * elm_prefs_item_iface_unregister().
  }
(* Const before type ignored *)
{*< The name of the widget implementing the interface, to be exposed on the prefs collections language.  }
(* Const before type ignored *)
{*< The type interface's implementation.  }
  PElm_Prefs_Item_Iface_Info = ^TElm_Prefs_Item_Iface_Info;
  TElm_Prefs_Item_Iface_Info = record
      widget_name : Pchar;
      info : PElm_Prefs_Item_Iface;
    end;

{*
 * Mass-register widgets implementing prefs @b items interfaces.
 *
 * @param array An array of #Elm_Prefs_Iface_Info structs, @c NULL
 * terminated.
 *
 * This will register all item interfaces declared on @a array in
 * Elementary, so that the prefs widget will recognize them on @c .epc
 * files @c 'widget:' (item) declarations.
 *
 * @see elm_prefs_item_iface_unregister()
 *
 * @since 1.8
  }
(* Const before type ignored *)

procedure elm_prefs_item_iface_register(array:PElm_Prefs_Item_Iface_Info);cdecl;external;
{*
 * Mass-unregister widgets implementing prefs @b items interfaces.
 *
 * @param array An array of #Elm_Prefs_Iface_Info structs, @c NULL
 * terminated.
 *
 * This will unregister all item interfaces declared on @a array in
 * Elementary, given they had been previously registered.
 *
 * @see elm_prefs_item_iface_register() for more details
 *
 * @since 1.8
  }
(* Const before type ignored *)
procedure elm_prefs_item_iface_unregister(array:PElm_Prefs_Item_Iface_Info);cdecl;external;
function elm_prefs_item_widget_common_add(prefs:PEvas_Object; obj:PEvas_Object):TEina_Bool;cdecl;external;
type
{*
 * @struct _Elm_Prefs_Page_Iface
 *
 * @brief Interface between pages of the @ref elm-prefs-widget widget
 *        and the real widgets implementing them.
 *
 * This structure defines the interface between the
 * @ref elm-prefs-widget widget's pages and Elementary widgets
 * implementing them.
 *
 * It is @b mandatory that the following functions be implemented, at
 * least, for a page widget:
 *
 * - #Elm_Prefs_Page_Iface::add
 * - #Elm_Prefs_Page_Iface::item_pack
 * - #Elm_Prefs_Page_Iface::item_unpack
 * - #Elm_Prefs_Page_Iface::item_pack_before
 * - #Elm_Prefs_Page_Iface::item_pack_after
 *
 * @note For regular, non-page prefs items, refer to #Elm_Prefs_Item_Iface.
 *
 * @since 1.8
  }

const
  ELM_PREFS_PAGE_IFACE_ABI_VERSION = 1;  
{*< always use:
                               *  - #ELM_PREFS_PAGE_IFACE_ABI_VERSION to declare.
                               *  - elm_prefs_widget_iface_abi_version_get() to check.
                                }
(* Const before type ignored *)
{*< Function to instantiate the page widget. It must return the widget handle, which should be the @c obj argument on the functions which follow. That object argument, by the way, should always have their respective #Elm_Prefs_Page_Node handle accessible via a @c "prefs_page" Evas object data value. The return value of the following functions should be @c EINA_TRUE, on success or @c EINA_FALSE, otherwise.  }
(* Const before type ignored *)
{*< function to set a title on the page widget  }
(* Const before type ignored *)
{*< function to set a sub-title on the page widget  }
(* Const before type ignored *)
{*< function to set an icon on the page widget  }
(* Const before type ignored *)
(* Const before type ignored *)
{*< function to pack an item (widget) on the page widget  }
{*< function to unpack an item (widget) on the page widget  }
(* Const before type ignored *)
(* Const before type ignored *)
{*< function to pack an item (widget) on the page widget, before a pre-existing, referential, packed one  }
{*< function to pack an item (widget) on the page widget, after a pre-existing, referential, packed one  }
(* Const before type ignored *)
(* Const before type ignored *)
type
  PElm_Prefs_Page_Iface = ^TElm_Prefs_Page_Iface;
  TElm_Prefs_Page_Iface = record
      abi_version : dword;
      add : function (iface:PElm_Prefs_Page_Iface; prefs:PEvas_Object):PEvas_Object;cdecl;
      title_set : function (obj:PEvas_Object; title:Pchar):TEina_Bool;cdecl;
      sub_title_set : function (obj:PEvas_Object; sub_title:Pchar):TEina_Bool;cdecl;
      icon_set : function (obj:PEvas_Object; icon:Pchar):TEina_Bool;cdecl;
      item_pack : function (obj:PEvas_Object; it:PEvas_Object; _type:TElm_Prefs_Item_Type; iface:PElm_Prefs_Item_Iface):TEina_Bool;cdecl;
      item_unpack : function (obj:PEvas_Object; it:PEvas_Object):TEina_Bool;cdecl;
      item_pack_before : function (obj:PEvas_Object; it:PEvas_Object; it_before:PEvas_Object; _type:TElm_Prefs_Item_Type; iface:PElm_Prefs_Item_Iface):TEina_Bool;cdecl;
      item_pack_after : function (obj:PEvas_Object; it:PEvas_Object; it_after:PEvas_Object; _type:TElm_Prefs_Item_Type; iface:PElm_Prefs_Item_Iface):TEina_Bool;cdecl;
    end;

{*
 * Convenience struct used to mass-register widgets implementing
 * prefs @b pages interfaces.
 *
 * To be used with elm_prefs_page_iface_register() and
 * elm_prefs_page_iface_unregister().
  }
(* Const before type ignored *)
{*< The name of the widget implementing the interface, to be exposed on the prefs collections language.  }
(* Const before type ignored *)
{*< The interface's implementation.  }
  PElm_Prefs_Page_Iface_Info = ^TElm_Prefs_Page_Iface_Info;
  TElm_Prefs_Page_Iface_Info = record
      widget_name : Pchar;
      info : PElm_Prefs_Page_Iface;
    end;

{*
 * Mass-register widgets implementing prefs @b pages interfaces.
 *
 * @param array An array of #Elm_Prefs_Iface_Info structs, @c NULL
 * terminated.
 *
 * This will register all page interfaces declared on @a array in
 * Elementary, so that the prefs widget will recognize them on @c .epc
 * files @c 'widget:' (page) declarations.
 *
 * @see elm_prefs_page_iface_unregister()
 *
 * @since 1.8
  }
(* Const before type ignored *)

procedure elm_prefs_page_iface_register(array:PElm_Prefs_Page_Iface_Info);cdecl;external;
{*
 * Mass-unregister widgets implementing prefs @b pages interfaces.
 *
 * @param array An array of #Elm_Prefs_Iface_Info structs, @c NULL
 * terminated.
 *
 * This will unregister all page interfaces declared on @a array in
 * Elementary, given they had been previously registered.
 *
 * @see elm_prefs_page_iface_register() for more details
 *
 * @since 1.8
  }
(* Const before type ignored *)
procedure elm_prefs_page_iface_unregister(array:PElm_Prefs_Page_Iface_Info);cdecl;external;
{*
 * @
  }

implementation


end.
