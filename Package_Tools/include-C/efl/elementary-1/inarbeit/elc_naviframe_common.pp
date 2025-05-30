
unit elc_naviframe_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elc_naviframe_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elc_naviframe_common.h
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
PElm_Object_Item  = ^Elm_Object_Item;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @typedef Elm_Naviframe_Item_Pop_Cb
 *
 * Pop callback called when @c it is going to be popped. @c data is user
 * specific data. If it returns the @c EINA_FALSE in the callback, item popping
 * will be cancelled.
 *
 * @see elm_naviframe_item_pop_cb_set()
 *
 * @since 1.8
  }
type

  TElm_Naviframe_Item_Pop_Cb = function (data:pointer; it:PElm_Object_Item):TEina_Bool;cdecl;
{*
 * @brief Add a new Naviframe object to the parent.
 *
 * @param parent Parent object
 * @return New object or @c NULL, if it cannot be created
 *
 * @ingroup Elm_Naviframe_Group
  }

function elm_naviframe_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
procedure elm_naviframe_item_title_enabled_set(it:PElm_Object_Item; enabled:TEina_Bool; transition:TEina_Bool);cdecl;external;
{*
 * @brief Push a new item to the top of the naviframe stack (and show it).
 *
 * The item pushed becomes one page of the naviframe, this item will be deleted
 * when it is popped.
 *
 * When push transition animation is in progress, pop operation is blocked
 * until push is complete.
 *
 * The following styles are available for this item: "default"
 *
 * @param[in] obj The object.
 * @param[in] title_label The label in the title area. The name of the title
 * label part is "elm.text.title"
 * @param[in] prev_btn The button to go to the previous item. If it is NULL,
 * then naviframe will create a back button automatically. The name of the
 * prev_btn part is "elm.swallow.prev_btn"
 * @param[in] next_btn The button to go to the next item. Or It could be just
 * an extra function button. The name of the next_btn part is
 * "elm.swallow.next_btn"
 * @param[in] content The main content object. The name of content part is
 * "elm.swallow.content"
 * @param[in] item_style The current item style name. @c NULL would be default.
 *
 * @return The created item or @c NULL upon failure.
 *
 * @ingroup Elm_Naviframe_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_naviframe_item_push(obj:PEvas_Object; title_label:Pchar; prev_btn:PEvas_Object; next_btn:PEvas_Object; content:PEvas_Object; 
           item_style:Pchar):PElm_Object_Item;cdecl;external;
{*
 * @brief Simple version of item_push.
 *
 * @see elm_naviframe_item_push
  }
{
static inline Elm_Object_Item *
elm_naviframe_item_simple_push(Evas_Object *obj, Evas_Object *content)

   Elm_Object_Item *it;
   it = elm_naviframe_item_push(obj, NULL, NULL, NULL, content, NULL);
   elm_naviframe_item_title_enabled_set(it, EINA_FALSE, EINA_FALSE);
   return it;

 }

implementation


end.
