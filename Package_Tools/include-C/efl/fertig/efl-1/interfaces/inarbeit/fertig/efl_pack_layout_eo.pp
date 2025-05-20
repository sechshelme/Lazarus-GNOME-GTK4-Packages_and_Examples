
unit efl_pack_layout_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_pack_layout_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_pack_layout_eo.h
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
PEfl_Pack_Layout  = ^Efl_Pack_Layout;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_PACK_LAYOUT_EO_H_}
{$define _EFL_PACK_LAYOUT_EO_H_}
{$ifndef _EFL_PACK_LAYOUT_EO_CLASS_TYPE}
{$define _EFL_PACK_LAYOUT_EO_CLASS_TYPE}
type
  PEfl_Pack_Layout = ^TEfl_Pack_Layout;
  TEfl_Pack_Layout = TEo;
{$endif}
{$ifndef _EFL_PACK_LAYOUT_EO_TYPES}
{$define _EFL_PACK_LAYOUT_EO_TYPES}
{$endif}
{*
 * @brief Low-level APIs for objects that can lay their children out.
 *
 * Used for containers like @ref Efl_Ui_Box and @ref Efl_Ui_Table.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Layout
  }

{ was #define dname def_expr }
function EFL_PACK_LAYOUT_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_pack_layout_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Requests EFL to recalculate the layout of this object.
 *
 * Internal layout methods might be called asynchronously.
 *
 * @param[in] obj The object.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Layout
  }
procedure efl_pack_layout_request(obj:PEo);cdecl;external;
{$ifdef EFL_PACK_LAYOUT_PROTECTED}
{*
 * @brief Implementation of this container's layout algorithm.
 *
 * EFL will call this function whenever the contents of this container need to
 * be re-laid out on the canvas.
 *
 * This can be overridden to implement custom layout behaviors.
 *
 * @param[in] obj The object.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Layout
  }
procedure efl_pack_layout_update(obj:PEo);cdecl;external;
{$endif}
(* Const before type ignored *)
  var
    _EFL_PACK_EVENT_LAYOUT_UPDATED : TEfl_Event_Description;cvar;external;
{* Sent after the layout was updated.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Layout
  }

{ was #define dname def_expr }
function EFL_PACK_EVENT_LAYOUT_UPDATED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_PACK_LAYOUT_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_PACK_LAYOUT_INTERFACE:=efl_pack_layout_interface_get;
  end;

{ was #define dname def_expr }
function EFL_PACK_EVENT_LAYOUT_UPDATED : longint; { return type might be wrong }
  begin
    EFL_PACK_EVENT_LAYOUT_UPDATED:=@(_EFL_PACK_EVENT_LAYOUT_UPDATED);
  end;


end.
