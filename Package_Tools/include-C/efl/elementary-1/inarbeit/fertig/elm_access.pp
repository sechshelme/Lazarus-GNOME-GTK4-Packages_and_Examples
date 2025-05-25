
unit elm_access;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_access.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_access.h
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
PElm_Access_Action_Info  = ^Elm_Access_Action_Info;
PElm_Access_Action_Type  = ^Elm_Access_Action_Type;
PElm_Access_Info_Cb  = ^Elm_Access_Info_Cb;
PElm_Access_Info_Type  = ^Elm_Access_Info_Type;
PElm_Highlight_Direction  = ^Elm_Highlight_Direction;
PElm_Object_Item  = ^Elm_Object_Item;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @defgroup Access Access
 * @ingroup Elementary
 *
 * WARNING! this API is not finalized. It is unstable. - do not use it if
 * you want no breaks in future.
 *
 * TODO: description
 *
  }
{ next read is info - this is
                             * normally label  }
{ when reading out widget or item
                             * this is read first  }
{ if there is a state (eg checkbox)
                             * then read state out  }
{ to give contextual information  }
type
  TElm_Access_Info_Type =  Longint;
  Const
    ELM_ACCESS_INFO_FIRST = -(1);
    ELM_ACCESS_INFO = (-(1))+1;
    ELM_ACCESS_TYPE = (-(1))+2;
    ELM_ACCESS_STATE = (-(1))+3;
    ELM_ACCESS_CONTEXT_INFO = (-(1))+4;
    ELM_ACCESS_INFO_LAST = (-(1))+5;

{*
 * @since 1.8
 * @typedef Elm_Access_Info_Type
  }
type
  PElm_Access_Info_Type = ^TElm_Access_Info_Type;
  TElm_Access_Info_Type = TElm_Access_Info_Type;
{*
 * @enum _Elm_Access_Action_Type
 * Enum of supported access action types.
  }
{ highlight an object  }
{ unhighlight an object  }
{ set highlight to next object  }
{ set highlight to previous object  }
{ activate a highlight object  }
{ scroll if one of highlight object parents
                              * is scrollable  }
{ change value up of highlight object  }
{ change value down of highlight object  }
{ go back to a previous view
                              ex: pop naviframe item  }
{ highlight an object  }
  TElm_Access_Action_Type =  Longint;
  Const
    ELM_ACCESS_ACTION_FIRST = -(1);
    ELM_ACCESS_ACTION_HIGHLIGHT = (-(1))+1;
    ELM_ACCESS_ACTION_UNHIGHLIGHT = (-(1))+2;
    ELM_ACCESS_ACTION_HIGHLIGHT_NEXT = (-(1))+3;
    ELM_ACCESS_ACTION_HIGHLIGHT_PREV = (-(1))+4;
    ELM_ACCESS_ACTION_ACTIVATE = (-(1))+5;
    ELM_ACCESS_ACTION_SCROLL = (-(1))+6;
    ELM_ACCESS_ACTION_UP = (-(1))+7;
    ELM_ACCESS_ACTION_DOWN = (-(1))+8;
    ELM_ACCESS_ACTION_BACK = (-(1))+9;
    ELM_ACCESS_ACTION_READ = (-(1))+10;
    ELM_ACCESS_ACTION_LAST = (-(1))+11;

{*
 * @since 1.8
 * @typedef Elm_Access_Action_Type
  }
type
  PElm_Access_Action_Type = ^TElm_Access_Action_Type;
  TElm_Access_Action_Type = TElm_Access_Action_Type;
{ 0: mouse down
                               1: mouse move
                               2: mouse up    }
  PElm_Access_Action_Info = ^TElm_Access_Action_Info;
  TElm_Access_Action_Info = record
      x : TEvas_Coord;
      y : TEvas_Coord;
      mouse_type : dword;
      action_type : TElm_Access_Action_Type;
      action_by : TElm_Access_Action_Type;
      flag0 : word;
    end;


const
  bm_TElm_Access_Action_Info_highlight_cycle = $1;
  bp_TElm_Access_Action_Info_highlight_cycle = 0;

function highlight_cycle(var a : TElm_Access_Action_Info) : TEina_Bool;
procedure set_highlight_cycle(var a : TElm_Access_Action_Info; __highlight_cycle : TEina_Bool);
{*
 * @since 1.8
 * @typedef Elm_Access_Action_Info
  }
type
  TElm_Highlight_Direction =  Longint;
  Const
    ELM_HIGHLIGHT_DIR_FIRST = -(1);
    ELM_HIGHLIGHT_DIR_NEXT = (-(1))+1;
    ELM_HIGHLIGHT_DIR_PREVIOUS = (-(1))+2;

{*
 * @since 1.8
 * @typedef Elm_Highlight_Direction
  }
type
  PElm_Highlight_Direction = ^TElm_Highlight_Direction;
  TElm_Highlight_Direction = TElm_Highlight_Direction;
{*
 * @since 1.8
 * @typedef Elm_Access_Action_Cb
 *
 * User callback to make access object do specific action
 *
 * @param data user data
 * @param action_info information to classify the action
 * Returns @c EINA_TRUE on success, @c EINA FALSE otherwise
 *
  }

  TElm_Access_Action_Cb = function (data:pointer; obj:PEvas_Object; action_info:PElm_Access_Action_Info):TEina_Bool;cdecl;

  PElm_Access_Info_Cb = ^TElm_Access_Info_Cb;
  TElm_Access_Info_Cb = function (data:pointer; obj:PEvas_Object):Pchar;cdecl;

  TElm_Access_Activate_Cb = procedure (data:pointer; part_obj:PEvas_Object; item:PElm_Object_Item);cdecl;
{*
 * @brief Register evas object as an accessible object.
 * @since 1.8
 *
 * @param obj The evas object to register as an accessible object.
 * @param parent The elementary object which is used for creating
 * accessible object.
 *
 * @ingroup Access
  }

function elm_access_object_register(obj:PEvas_Object; parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Unregister accessible object.
 * @since 1.8
 *
 * @param obj The Evas object to unregister accessible object.
 *
 * @ingroup Access
  }
procedure elm_access_object_unregister(obj:PEvas_Object);cdecl;external;
{*
 * @brief Get an accessible object of the evas object.
 * @since 1.8
 *
 * @param obj The evas object.
 * @return Accessible object of the evas object or NULL for any error
 *
 * @ingroup Access
  }
(* Const before type ignored *)
function elm_access_object_get(obj:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Set text to give information for specific type.
 * @since 1.8
 *
 * @param obj Accessible object.
 * @param type The type of content that will be read
 * @param text The text information that will be read
 *
 * @see elm_access_info_cb_set
 * @ingroup Access
  }
(* Const before type ignored *)
procedure elm_access_info_set(obj:PEvas_Object; _type:longint; text:Pchar);cdecl;external;
{*
 * @brief Set text to give information for specific type.
 * @since 1.8
 *
 * @param obj Accessible object.
 * @param type The type of content that will be read
 *
 * @see elm_access_info_cb_set
 * @ingroup Access
  }
(* Const before type ignored *)
function elm_access_info_get(obj:PEvas_Object; _type:longint):Pchar;cdecl;external;
{*
 * @brief Set content callback to give information for specific type.
 * @since 1.8
 *
 * @param obj Accessible object.
 * @param type The type of content that will be read
 * @param func The function to be called when the content is read
 * @param data The data pointer to be passed to @p func
 *
 * The type would be one of ELM_ACCESS_TYPE, ELM_ACCESS_INFO,
 * ELM_ACCESS_STATE, ELM_ACCESS_CONTEXT_INFO.
 *
 * In the case of button widget, the content of ELM_ACCESS_TYPE would be
 * "button". The label of button such as "ok", "cancel" is for ELM_ACCESS_INFO.
 * If the button is disabled, content of ELM_ACCESS_STATE would be "disabled".
 * And if there is contextual information, use ELM_ACCESS_CONTEXT_INFO.
 *
 * @ingroup Access
  }
(* Const before type ignored *)
procedure elm_access_info_cb_set(obj:PEvas_Object; _type:longint; func:TElm_Access_Info_Cb; data:pointer);cdecl;external;
{*
 * @brief Set activate callback to activate highlight object.
 * @since 1.8
 *
 * @param obj Accessible object.
 * @param func The function to be called when the activate gesture is detected
 * @param data The data pointer to be passed to @p func
 *
 * @ingroup Access
  }
procedure elm_access_activate_cb_set(obj:PEvas_Object; func:TElm_Access_Activate_Cb; data:pointer);cdecl;external;
{*
 * @brief Read out text information directly.
 * @since 1.8
 *
 * @param text The text information that will be read
 *
 * This function will not free the @p text internally.
 *
 * @ingroup Access
  }
(* Const before type ignored *)
procedure elm_access_say(text:Pchar);cdecl;external;
{*
 * @brief Give the highlight to the object directly.
 * @since 1.8
 *
 * @param obj The object that will have the highlight and its information be read.
 *
 * The object should be an elementary object or an access object.
 *
 * @see elm_access_object_get
 * @ingroup Access
  }
procedure elm_access_highlight_set(obj:PEvas_Object);cdecl;external;
{*
 * @brief Do the accessibility action base on given object.
 * @since 1.8
 *
 * @param obj The object that could be an any object. it would be useful to use a container widget.
 * @param type The type of accessibility action.
 * @param action_info The action information of action @p type to give more specific information.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise
 *
 * The return value would be useful, when the @p type is ELM_ACCESS_ACTION_HIGHLIGHT_NEXT
 * or ELM_ACCESS_ACTION_HIGHLIGHT_PREV. If there is no way to give a highlight,
 * @c EINA_FALSE will be returned.
 *
 * @ingroup Access
  }
(* Const before type ignored *)
function elm_access_action(obj:PEvas_Object; _type:TElm_Access_Action_Type; action_info:PElm_Access_Action_Info):TEina_Bool;cdecl;external;
{*
 * @brief Set a callback function to a given accessibility action type
 * @since 1.8
 *
 * @param obj The object to attach a callback to
 * @param type The type of accessibility action.
 * @param cb The callback function to be called when the accessibility action is triggered.
 * @param data The data pointer to be passed to @p cb
 *
 * @ingroup Access
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_access_action_cb_set(obj:PEvas_Object; _type:TElm_Access_Action_Type; cb:TElm_Access_Action_Cb; data:pointer);cdecl;external;
{*
 * @brief Set the next access object for highlight.
 * @since 1.8
 *
 * @param obj  The object is previous access object of next for highlight.
 * @param dir  Access direction same as Focus direction
 * @param next The object is next access object of obj for highlight.
 *
 * Currently focus chain is used for access highlight chain. Use this API to
 * customize highlight chain. If highlight chain is already established, you can
 * change one object's highlight chain and do not break the other object's
 * highlight chain.
 *
 * @ingroup Access
  }
procedure elm_access_highlight_next_set(obj:PEvas_Object; dir:TElm_Highlight_Direction; next:PEvas_Object);cdecl;external;

implementation

function highlight_cycle(var a : TElm_Access_Action_Info) : TEina_Bool;
begin
  highlight_cycle:=(a.flag0 and bm_TElm_Access_Action_Info_highlight_cycle) shr bp_TElm_Access_Action_Info_highlight_cycle;
end;

procedure set_highlight_cycle(var a : TElm_Access_Action_Info; __highlight_cycle : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__highlight_cycle shl bp_TElm_Access_Action_Info_highlight_cycle) and bm_TElm_Access_Action_Info_highlight_cycle);
end;


end.
