
unit efl_pack_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_pack_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_pack_eo.h
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
PEfl_Gfx_Entity  = ^Efl_Gfx_Entity;
PEfl_Pack  = ^Efl_Pack;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_PACK_EO_H_}
{$define _EFL_PACK_EO_H_}
{$ifndef _EFL_PACK_EO_CLASS_TYPE}
{$define _EFL_PACK_EO_CLASS_TYPE}
type
  PEfl_Pack = ^TEfl_Pack;
  TEfl_Pack = TEo;
{$endif}
{$ifndef _EFL_PACK_EO_TYPES}
{$define _EFL_PACK_EO_TYPES}
{$endif}
{* Common interface for objects (containers) with multiple contents
 * (sub-objects) which can be added and removed at runtime.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack
  }

{ was #define dname def_expr }
function EFL_PACK_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_pack_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Removes all packed sub-objects and unreferences them.
 *
 * @param[in] obj The object.
 *
 * @return @c true on success, @c false otherwise.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack
  }
function efl_pack_clear(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Removes all packed sub-objects without unreferencing them.
 *
 * Use with caution.
 *
 * @param[in] obj The object.
 *
 * @return @c true on success, @c false otherwise.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack
  }
function efl_pack_unpack_all(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Removes an existing sub-object from the container without deleting
 * it.
 *
 * @param[in] obj The object.
 * @param[in] subobj The sub-object to unpack.
 *
 * @return @c false if @c subobj wasn't in the container or couldn't be
 * removed.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack
  }
function efl_pack_unpack(obj:PEo; subobj:PEfl_Gfx_Entity):TEina_Bool;cdecl;external;
{*
 * @brief Adds a sub-object to this container.
 *
 * Depending on the container this will either fill in the default spot,
 * replacing any already existing element or append to the end of the container
 * if there is no default part.
 *
 * When this container is deleted, it will request deletion of the given
 * @c subobj. Use @ref efl_pack_unpack to remove @c subobj from this container
 * without deleting it.
 *
 * @param[in] obj The object.
 * @param[in] subobj The object to pack.
 *
 * @return @c false if @c subobj could not be packed.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack
  }
function efl_pack(obj:PEo; subobj:PEfl_Gfx_Entity):TEina_Bool;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_PACK_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_PACK_INTERFACE:=efl_pack_interface_get;
  end;


end.
