
unit efl_container_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_container_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_container_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Container  = ^Efl_Container;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CONTAINER_EO_H_}
{$define _EFL_CONTAINER_EO_H_}
{$ifndef _EFL_CONTAINER_EO_CLASS_TYPE}
{$define _EFL_CONTAINER_EO_CLASS_TYPE}
type
  PEfl_Container = ^TEfl_Container;
  TEfl_Container = TEo;
{$endif}
{$ifndef _EFL_CONTAINER_EO_TYPES}
{$define _EFL_CONTAINER_EO_TYPES}
{$endif}
{*
 * @brief Common interface for objects (containers) that can have multiple
 * contents (sub-objects).
 *
 * APIs in this interface deal with containers of multiple sub-objects, not
 * with individual parts.
 *
 * @since 1.22
 *
 * @ingroup Efl_Container
  }

{ was #define dname def_expr }
function EFL_CONTAINER_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_container_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Begin iterating over this object's contents.
 *
 * @param[in] obj The object.
 *
 * @return Iterator on object's content.
 *
 * @since 1.22
 *
 * @ingroup Efl_Container
  }
function efl_content_iterate(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief Returns the number of contained sub-objects.
 *
 * @param[in] obj The object.
 *
 * @return Number of sub-objects.
 *
 * @since 1.22
 *
 * @ingroup Efl_Container
  }
function efl_content_count(obj:PEo):longint;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_CONTAINER_EVENT_CONTENT_ADDED : TEfl_Event_Description;cvar;external;
{* Sent after a new sub-object was added.
 * @return Efl_Gfx_Entity *
 *
 * @since 1.22
 *
 * @ingroup Efl_Container
  }
(* Const before type ignored *)
    _EFL_CONTAINER_EVENT_CONTENT_REMOVED : TEfl_Event_Description;cvar;external;
{* Sent after a sub-object was removed, before unref.
 * @return Efl_Gfx_Entity *
 *
 * @since 1.22
 *
 * @ingroup Efl_Container
  }

{ was #define dname def_expr }
function EFL_CONTAINER_EVENT_CONTENT_ADDED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CONTAINER_EVENT_CONTENT_REMOVED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_CONTAINER_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_CONTAINER_INTERFACE:=efl_container_interface_get;
  end;

{ was #define dname def_expr }
function EFL_CONTAINER_EVENT_CONTENT_ADDED : longint; { return type might be wrong }
  begin
    EFL_CONTAINER_EVENT_CONTENT_ADDED:=@(_EFL_CONTAINER_EVENT_CONTENT_ADDED);
  end;

{ was #define dname def_expr }
function EFL_CONTAINER_EVENT_CONTENT_REMOVED : longint; { return type might be wrong }
  begin
    EFL_CONTAINER_EVENT_CONTENT_REMOVED:=@(_EFL_CONTAINER_EVENT_CONTENT_REMOVED);
  end;


end.
