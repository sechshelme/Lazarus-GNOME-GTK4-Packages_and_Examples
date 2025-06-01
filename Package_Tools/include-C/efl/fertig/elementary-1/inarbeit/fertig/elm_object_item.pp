
unit elm_object_item;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_object_item.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_object_item.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @typedef Elm_Object_Item
 * An Elementary Object item handle.
 * @ingroup Elm_General
  }
type
  PElm_Object_Item = ^TElm_Object_Item;
  TElm_Object_Item = TEo;
{*
 * @typedef Elm_Object_Item_Signal_Cb
 *
 * Elm_Object_Item Signal Callback functions' prototype definition. @c data
 * will have the auxiliary data pointer at the time the callback registration.
 * @c it will be a pointer the Elm_Object_Item that have the edje object where
 * the signal comes from. @c emission will identify the exact signal's emission
 * string and @c source the exact signal's source one.
 *
 * @see elm_object_item_signal_callback_add()
 * @since 1.8
 *
 * @ingroup Elm_General
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TElm_Object_Item_Signal_Cb = procedure (data:pointer; it:PElm_Object_Item; emission:Pchar; source:Pchar);cdecl;
{$ifndef EFL_NOLEGACY_API_SUPPORT}
{$include "elm_widget_item_eo.legacy.h"}
{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function elm_object_item_content_set(it,content : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_content_get(it : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_content_unset(it : longint) : longint;

{*
 * Macro to set a label of an object item.
 *
 * @param it The Elementary object item.
 * @param label The new text of the label.
 *
 * @note Elementary object items may have many labels.
 *
 * @ingroup Elm_General
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_text_set(it,_label : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_text_get(it : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_domain_translatable_text_set(it,domain,text : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_translatable_text_set(it,text : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_translatable_part_text_set(it,part,text : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_translatable_text_get(it : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_part_text_translatable_set(it,part,translatable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_domain_text_translatable_set(it,domain,translatable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_text_translatable_set(it,translatable : longint) : longint;

{*
 * Get the data associated with an object item
 * @param it The Elementary object item
 * @return The data associated with @p it
 *
 * @note Every elm_object_item supports this API
 * @ingroup Elm_General
  }
(* Const before type ignored *)
function elm_object_item_data_get(it:PElm_Object_Item):pointer;cdecl;external;
{*
 * Set the data associated with an object item
 * @param it The Elementary object item
 * @param data The data to be associated with @p it
 *
 * @note Every elm_object_item supports this API
 * @ingroup Elm_General
  }
procedure elm_object_item_data_set(it:PElm_Object_Item; data:pointer);cdecl;external;
{* Delete the given item.
 *
 * @ingroup Elm_General
  }
procedure elm_object_item_del(obj:PElm_Object_Item);cdecl;external;

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_content_set(it,content : longint) : longint;
begin
  elm_object_item_content_set:=elm_object_item_part_content_set(it,NULL,content);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_content_get(it : longint) : longint;
begin
  elm_object_item_content_get:=elm_object_item_part_content_get(it,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_content_unset(it : longint) : longint;
begin
  elm_object_item_content_unset:=elm_object_item_part_content_unset(it,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_text_set(it,_label : longint) : longint;
begin
  elm_object_item_text_set:=elm_object_item_part_text_set(it,NULL,_label);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_text_get(it : longint) : longint;
begin
  elm_object_item_text_get:=elm_object_item_part_text_get(it,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_domain_translatable_text_set(it,domain,text : longint) : longint;
begin
  elm_object_item_domain_translatable_text_set:=elm_object_item_domain_translatable_part_text_set(it,NULL,domain,text);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_translatable_text_set(it,text : longint) : longint;
begin
  elm_object_item_translatable_text_set:=elm_object_item_domain_translatable_part_text_set(it,NULL,NULL,text);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_translatable_part_text_set(it,part,text : longint) : longint;
begin
  elm_object_item_translatable_part_text_set:=elm_object_item_domain_translatable_part_text_set(it,part,NULL,text);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_translatable_text_get(it : longint) : longint;
begin
  elm_object_item_translatable_text_get:=elm_object_item_translatable_part_text_get(it,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_part_text_translatable_set(it,part,translatable : longint) : longint;
begin
  elm_object_item_part_text_translatable_set:=elm_object_item_domain_part_text_translatable_set(it,part,NULL,translatable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_domain_text_translatable_set(it,domain,translatable : longint) : longint;
begin
  elm_object_item_domain_text_translatable_set:=elm_object_item_domain_part_text_translatable_set(it,NULL,domain,translatable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_object_item_text_translatable_set(it,translatable : longint) : longint;
begin
  elm_object_item_text_translatable_set:=elm_object_item_domain_part_text_translatable_set(it,NULL,NULL,translatable);
end;


end.
