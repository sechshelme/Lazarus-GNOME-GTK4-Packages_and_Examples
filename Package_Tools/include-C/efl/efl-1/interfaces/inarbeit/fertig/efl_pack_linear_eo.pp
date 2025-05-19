
unit efl_pack_linear_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_pack_linear_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_pack_linear_eo.h
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
PEfl_Pack_Linear  = ^Efl_Pack_Linear;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_PACK_LINEAR_EO_H_}
{$define _EFL_PACK_LINEAR_EO_H_}
{$ifndef _EFL_PACK_LINEAR_EO_CLASS_TYPE}
{$define _EFL_PACK_LINEAR_EO_CLASS_TYPE}
type
  PEfl_Pack_Linear = ^TEfl_Pack_Linear;
  TEfl_Pack_Linear = TEo;
{$endif}
{$ifndef _EFL_PACK_LINEAR_EO_TYPES}
{$define _EFL_PACK_LINEAR_EO_TYPES}
{$endif}
{*
 * @brief Common interface for objects (containers) with multiple contents
 * (sub-objects) which can be added and removed at runtime in a linear fashion.
 *
 * This means the sub-objects are internally organized in an ordered list.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Linear
  }

{ was #define dname def_expr }
function EFL_PACK_LINEAR_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_pack_linear_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Prepend an object at the beginning of this container.
 *
 * This is the same as @ref efl_pack_at with a <tt>0</tt> index.
 *
 * When this container is deleted, it will request deletion of the given
 * @c subobj. Use @ref efl_pack_unpack to remove @c subobj from this container
 * without deleting it.
 *
 * @param[in] obj The object.
 * @param[in] subobj Object to pack at the beginning.
 *
 * @return @c false if @c subobj could not be packed.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Linear
  }
function efl_pack_begin(obj:PEo; subobj:PEfl_Gfx_Entity):TEina_Bool;cdecl;external;
{*
 * @brief Append object at the end of this container.
 *
 * This is the same as @ref efl_pack_at with a <tt>-1</tt> index.
 *
 * When this container is deleted, it will request deletion of the given
 * @c subobj. Use @ref efl_pack_unpack to remove @c subobj from this container
 * without deleting it.
 *
 * @param[in] obj The object.
 * @param[in] subobj Object to pack at the end.
 *
 * @return @c false if @c subobj could not be packed.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Linear
  }
function efl_pack_end(obj:PEo; subobj:PEfl_Gfx_Entity):TEina_Bool;cdecl;external;
{*
 * @brief Prepend an object before the @c existing sub-object.
 *
 * When this container is deleted, it will request deletion of the given
 * @c subobj. Use @ref efl_pack_unpack to remove @c subobj from this container
 * without deleting it.
 *
 * If @c existing is @c NULL this method behaves like @ref efl_pack_begin.
 *
 * @param[in] obj The object.
 * @param[in] subobj Object to pack before @c existing.
 * @param[in] existing Existing reference sub-object. Must already belong to
 * the container or be @c NULL.
 *
 * @return @c false if @c existing could not be found or @c subobj could not be
 * packed.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Linear
  }
(* Const before type ignored *)
function efl_pack_before(obj:PEo; subobj:PEfl_Gfx_Entity; existing:PEfl_Gfx_Entity):TEina_Bool;cdecl;external;
{*
 * @brief Append an object after the @c existing sub-object.
 *
 * When this container is deleted, it will request deletion of the given
 * @c subobj. Use @ref efl_pack_unpack to remove @c subobj from this container
 * without deleting it.
 *
 * If @c existing is @c NULL this method behaves like @ref efl_pack_end.
 *
 * @param[in] obj The object.
 * @param[in] subobj Object to pack after @c existing.
 * @param[in] existing Existing reference sub-object. Must already belong to
 * the container or be @c NULL.
 *
 * @return @c false if @c existing could not be found or @c subobj could not be
 * packed.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Linear
  }
(* Const before type ignored *)
function efl_pack_after(obj:PEo; subobj:PEfl_Gfx_Entity; existing:PEfl_Gfx_Entity):TEina_Bool;cdecl;external;
{*
 * @brief Inserts @c subobj BEFORE the sub-object at position @c index.
 *
 * @c index ranges from <tt>-count</tt> to <tt>count-1</tt>, where
 * positive numbers go from first sub-object ($[0]) to last ($[count-1]), and
 * negative numbers go from last sub-object ($[-1]) to first ($[-count]).
 * @c count is the number of sub-objects currently in the container as returned
 * by @ref efl_content_count.
 *
 * If @c index is less than <tt>-count</tt>, it will trigger
 * @ref efl_pack_begin whereas @c index greater than <tt>count-1</tt> will
 * trigger @ref efl_pack_end.
 *
 * When this container is deleted, it will request deletion of the given
 * @c subobj. Use @ref efl_pack_unpack to remove @c subobj from this container
 * without deleting it.
 *
 * @param[in] obj The object.
 * @param[in] subobj Object to pack.
 * @param[in] index Index of existing sub-object to insert BEFORE. Valid range
 * is <tt>-count</tt> to <tt>count-1</tt>).
 *
 * @return @c false if @c subobj could not be packed.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Linear
  }
function efl_pack_at(obj:PEo; subobj:PEfl_Gfx_Entity; index:longint):TEina_Bool;cdecl;external;
{*
 * @brief Sub-object at a given @c index in this container.
 *
 * @c index ranges from <tt>-count</tt> to <tt>count-1</tt>, where
 * positive numbers go from first sub-object ($[0]) to last ($[count-1]), and
 * negative numbers go from last sub-object ($[-1]) to first ($[-count]).
 * @c count is the number of sub-objects currently in the container as returned
 * by @ref efl_content_count.
 *
 * If @c index is less than <tt>-count</tt>, it will return the first
 * sub-object whereas @c index greater than <tt>count-1</tt> will return
 * the last sub-object.
 *
 * @param[in] obj The object.
 * @param[in] index Index of the existing sub-object to retrieve. Valid range
 * is <tt>-count</tt> to <tt>count-1</tt>.
 *
 * @return The sub-object contained at the given @c index.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Linear
  }
function efl_pack_content_get(obj:PEo; index:longint):PEfl_Gfx_Entity;cdecl;external;
{*
 * @brief Get the index of a sub-object in this container.
 *
 * @param[in] obj The object.
 * @param[in] subobj An existing sub-object in this container.
 *
 * @return -1 in case @c subobj is not found, or the index of @c subobj in the
 * range <tt>0</tt> to <tt>count-1</tt>.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Linear
  }
(* Const before type ignored *)
function efl_pack_index_get(obj:PEo; subobj:PEfl_Gfx_Entity):longint;cdecl;external;
{*
 * @brief Pop out (remove) the sub-object at the specified @c index.
 *
 * @c index ranges from <tt>-count</tt> to <tt>count-1</tt>, where
 * positive numbers go from first sub-object ($[0]) to last ($[count-1]), and
 * negative numbers go from last sub-object ($[-1]) to first ($[-count]).
 * @c count is the number of sub-objects currently in the container as returned
 * by @ref efl_content_count.
 *
 * If @c index is less than -$count, it will remove the first sub-object
 * whereas @c index greater than @c count-1 will remove the last sub-object.
 *
 * @param[in] obj The object.
 * @param[in] index Index of the sub-object to remove. Valid range is
 * <tt>-count</tt> to <tt>count-1</tt>.
 *
 * @return The sub-object if it could be removed.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Linear
  }
function efl_pack_unpack_at(obj:PEo; index:longint):PEfl_Gfx_Entity;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_PACK_LINEAR_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_PACK_LINEAR_INTERFACE:=efl_pack_linear_interface_get;
  end;


end.
