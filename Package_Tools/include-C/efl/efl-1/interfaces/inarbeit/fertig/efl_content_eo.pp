
unit efl_content_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_content_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_content_eo.h
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
PEfl_Content  = ^Efl_Content;
PEfl_Gfx_Entity  = ^Efl_Gfx_Entity;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CONTENT_EO_H_}
{$define _EFL_CONTENT_EO_H_}
{$ifndef _EFL_CONTENT_EO_CLASS_TYPE}
{$define _EFL_CONTENT_EO_CLASS_TYPE}
type
  PEfl_Content = ^TEfl_Content;
  TEfl_Content = TEo;
{$endif}
{$ifndef _EFL_CONTENT_EO_TYPES}
{$define _EFL_CONTENT_EO_TYPES}
{$endif}
{*
 * @brief Common interface for objects that have a single sub-object as
 * content.
 *
 * This is used for the default content part of widgets, as well as for
 * individual parts through @ref Efl_Part.
 *
 * @since 1.22
 *
 * @ingroup Efl_Content
  }

{ was #define dname def_expr }
function EFL_CONTENT_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_content_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Sub-object currently set as this object's single content.
 *
 * If it is set multiple times, previous sub-objects are removed first.
 * Therefore, if an invalid @c content is set the object will become empty (it
 * will have no sub-object).
 *
 * @param[in] obj The object.
 * @param[in] content The sub-object.
 *
 * @return @c true if @c content was successfully swallowed.
 *
 * @since 1.22
 *
 * @ingroup Efl_Content
  }
function efl_content_set(obj:PEo; content:PEfl_Gfx_Entity):TEina_Bool;cdecl;external;
{*
 * @brief Sub-object currently set as this object's single content.
 *
 * If it is set multiple times, previous sub-objects are removed first.
 * Therefore, if an invalid @c content is set the object will become empty (it
 * will have no sub-object).
 *
 * @param[in] obj The object.
 *
 * @return The sub-object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Content
  }
(* Const before type ignored *)
function efl_content_get(obj:PEo):PEfl_Gfx_Entity;cdecl;external;
{*
 * @brief Remove the sub-object currently set as content of this object and
 * return it. This object becomes empty.
 *
 * @param[in] obj The object.
 *
 * @return Unswallowed object
 *
 * @since 1.22
 *
 * @ingroup Efl_Content
  }
function efl_content_unset(obj:PEo):PEfl_Gfx_Entity;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_CONTENT_EVENT_CONTENT_CHANGED : TEfl_Event_Description;cvar;external;
{* Sent after the content is set or unset using the current content object.
 * @return Efl_Gfx_Entity *
 *
 * @since 1.22
 *
 * @ingroup Efl_Content
  }

{ was #define dname def_expr }
function EFL_CONTENT_EVENT_CONTENT_CHANGED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_CONTENT_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_CONTENT_INTERFACE:=efl_content_interface_get;
  end;

{ was #define dname def_expr }
function EFL_CONTENT_EVENT_CONTENT_CHANGED : longint; { return type might be wrong }
  begin
    EFL_CONTENT_EVENT_CONTENT_CHANGED:=@(_EFL_CONTENT_EVENT_CONTENT_CHANGED);
  end;


end.
