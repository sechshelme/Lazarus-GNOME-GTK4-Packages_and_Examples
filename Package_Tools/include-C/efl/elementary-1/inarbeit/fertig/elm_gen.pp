
unit elm_gen;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_gen.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_gen.h
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
PElm_Gen_Item_Class  = ^Elm_Gen_Item_Class;
PElm_Gen_Item_Class_Functions  = ^Elm_Gen_Item_Class_Functions;
PElm_Gen_Item_Content_Get_Cb  = ^Elm_Gen_Item_Content_Get_Cb;
PElm_Gen_Item_Reusable_Content_Get_Cb  = ^Elm_Gen_Item_Reusable_Content_Get_Cb;
PElm_Gen_Item_Text_Get_Cb  = ^Elm_Gen_Item_Text_Get_Cb;
PElm_Gengrid_Item_Class  = ^Elm_Gengrid_Item_Class;
PElm_Genlist_Item_Class  = ^Elm_Genlist_Item_Class;
PElm_Glob_Match_Flags  = ^Elm_Glob_Match_Flags;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Type definitions for elementary generic items (genlist, gengrid, ...).
 * Only for legacy.
  }
{$ifndef EFL_NOLEGACY_API_SUPPORT}
type
{* Glob matching bitfiled flags.
 *
 * @since 1.11
 *
 * @ingroup Elm_Glob
  }
{ 1 >> 0  }{*< Treat backslash as an ordinary
                                              * character instead of escape  }
{ 1 >> 1  }{*< Match a slash in string only with a
                                         * slash in pattern and not by an
                                         * asterisk (*) or a question mark (?)
                                         * metacharacter, nor by a bracket
                                         * expression ([]) containing a slash.
                                          }
{ 1 >> 2  }{*< Leading  period in string has to
                                           * be matched exactly by a period in
                                           * pattern. A period is considered to
                                           * be leading if it is the first
                                           * character in string, or if both
                                           * ELM_GLOB_MATCH_PATH is set and the
                                           * period immediately follows a
                                           * slash.  }
{ 1 >> 3  }{*< The pattern is matched
                                          * case-insensitively.  }

  PElm_Glob_Match_Flags = ^TElm_Glob_Match_Flags;
  TElm_Glob_Match_Flags =  Longint;
  Const
    ELM_GLOB_MATCH_NO_ESCAPE = 1;
    ELM_GLOB_MATCH_PATH = 2;
    ELM_GLOB_MATCH_PERIOD = 4;
    ELM_GLOB_MATCH_NOCASE = 8;
;
{*
 * Text fetching class function for Elm_Gen_Item_Class.
 * @param data The data passed in the item creation function
 * @param obj The base widget object
 * @param part The part name of the swallow
 * @return The allocated (NOT stringshared) string to set as the text
  }
(* Const before type ignored *)
type
  PElm_Gen_Item_Text_Get_Cb = ^TElm_Gen_Item_Text_Get_Cb;
  TElm_Gen_Item_Text_Get_Cb = function (data:pointer; obj:PEvas_Object; part:Pchar):Pchar;cdecl;
{*< Label fetching class function for gen item classes.  }
{*
 * Content (swallowed object) fetching class function for Elm_Gen_Item_Class.
 * @param data The data passed in the item creation function
 * @param obj The base widget object
 * @param part The part name of the swallow
 * @return The content object to swallow
  }
(* Const before type ignored *)

  PElm_Gen_Item_Content_Get_Cb = ^TElm_Gen_Item_Content_Get_Cb;
  TElm_Gen_Item_Content_Get_Cb = function (data:pointer; obj:PEvas_Object; part:Pchar):PEvas_Object;cdecl;
{*< Content(swallowed object) fetching class function for gen item classes.  }
{*
 * State fetching class function for Elm_Gen_Item_Class.
 * @param data The data passed in the item creation function
 * @param obj The base widget object
 * @param part The part name of the swallow
 * @return The boolean state of this element (resulting in the edje object being emitted a signal of "elm,state,partname,active" or "elm.state,partname,passve"
  }
(* Const before type ignored *)

  TElm_Gen_Item_State_Get_Cb = function (data:pointer; obj:PEvas_Object; part:Pchar):TEina_Bool;cdecl;
{*< State fetching class function for gen item classes.  }
{*
 * Deletion class function for Elm_Gen_Item_Class.
 * @param data The data passed in the item creation function
 * @param obj The base widget object
  }

  TElm_Gen_Item_Del_Cb = procedure (data:pointer; obj:PEvas_Object);cdecl;
{*< Deletion class function for gen item classes.  }
{*
 * Filter class function for Elm_Gen_Item_Class.
 * @param data The data passed in the item creation function
 * @param obj The base widget object
 * @param key The key needed for item filter to be decided on
 * @return The boolean state of filter for this element
  }

  TElm_Gen_Item_Filter_Get_Cb = function (data:pointer; obj:PEvas_Object; key:pointer):TEina_Bool;cdecl;
{*< Filter seeking class function for gen item classes.  }
{*
 * Reusable content get class function for Elm_Gen_Item_Class.
 * @param data The data passed in the item creation function
 * @param obj The base widget object
 * @param part The part name of the swallow
 * @param old The old content object for reusing
 * @return The content object to swallow
 *
 * @since 1.18
  }
(* Const before type ignored *)

  PElm_Gen_Item_Reusable_Content_Get_Cb = ^TElm_Gen_Item_Reusable_Content_Get_Cb;
  TElm_Gen_Item_Reusable_Content_Get_Cb = function (data:pointer; obj:PEvas_Object; part:Pchar; old:PEvas_Object):PEvas_Object;cdecl;
{*< Cache Pop class function for gen item classes.  }

const
  ELM_GEN_ITEM_CLASS_VERSION = 4;  
{#define ELM_GEN_ITEM_CLASS_HEADER ELM_GEN_ITEM_CLASS_VERSION, 0, 0 }
{* Elementary genlist/gengrid callback functions data structure  }
{*< Text fetching class function for genlist/gengrid item classes.  }
{*< Content fetching class function for genlist/gengrid item classes.  }
{*< State fetching class function for genlist/gengrid item classes.  }
{*< Deletion class function for genlist/gengrid item classes.  }
{*< Filter seeking class function for genlist/gengrid item classes.  }
{*< Reusable content get class function for gen item classes.  }
type
  PElm_Gen_Item_Class_Functions = ^TElm_Gen_Item_Class_Functions;
  TElm_Gen_Item_Class_Functions = record
      text_get : TElm_Gen_Item_Text_Get_Cb;
      content_get : TElm_Gen_Item_Content_Get_Cb;
      state_get : TElm_Gen_Item_State_Get_Cb;
      del : TElm_Gen_Item_Del_Cb;
      filter_get : TElm_Gen_Item_Filter_Get_Cb;
      reusable_content_get : TElm_Gen_Item_Reusable_Content_Get_Cb;
    end;
{* Gengrid or Genlist item class definition.  }
{*< Set by elementary if you alloc an item class using
                * elm_genlist/gengrid_item_class_new(), or if you set your own
                * class (must be const) then set it to
                * ELM_GENLIST/GENGRID_ITEM_CLASS_VERSION.  }
{*< Set it to 0 if you use your own const class, or
                          * its managed for you by class ref/unref calls.  }
{*< Leave this alone - set it to 0 if you have a const
                        * class of your own.  }
(* Const before type ignored *)
{*< Name of the visual style to use for this item. If
                           * you don't know use "default".  }
(* Const before type ignored *)
{*< Style used if item is set to a decorate
                                    * mode. see elm_genlist_item_decorate_mode_set() or
                                    * NULL if you don't care. currently it's used only in genlist.  }
(* Const before type ignored *)
{*< Style to use when in edit mode, or
                                        * NULL if you don't care. Currently
                                        * it's used only in genlist.  }
{*< Set of callbacks  }

  PElm_Gen_Item_Class = ^TElm_Gen_Item_Class;
  TElm_Gen_Item_Class = record
      version : longint;
      refcount : dword;
      delete_me : TEina_Bool;
      item_style : Pchar;
      decorate_item_style : Pchar;
      decorate_all_item_style : Pchar;
      func : TElm_Gen_Item_Class_Functions;
    end;
{* See @ref Elm_Gen_Item_Class.  }

  PElm_Gengrid_Item_Class = ^TElm_Gengrid_Item_Class;
  TElm_Gengrid_Item_Class = TElm_Gen_Item_Class;
{* See @ref Elm_Gen_Item_Class.  }

  PElm_Genlist_Item_Class = ^TElm_Genlist_Item_Class;
  TElm_Genlist_Item_Class = TElm_Gen_Item_Class;
{$endif}

implementation


end.
