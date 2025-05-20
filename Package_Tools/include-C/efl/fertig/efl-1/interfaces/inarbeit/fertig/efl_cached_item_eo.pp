
unit efl_cached_item_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_cached_item_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_cached_item_eo.h
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
PEfl_Cached_Item  = ^Efl_Cached_Item;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CACHED_ITEM_EO_H_}
{$define _EFL_CACHED_ITEM_EO_H_}
{$ifndef _EFL_CACHED_ITEM_EO_CLASS_TYPE}
{$define _EFL_CACHED_ITEM_EO_CLASS_TYPE}
type
  PEfl_Cached_Item = ^TEfl_Cached_Item;
  TEfl_Cached_Item = TEo;
{$endif}
{$ifndef _EFL_CACHED_ITEM_EO_TYPES}
{$define _EFL_CACHED_ITEM_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Interface for objects which can be cached in memory.
 *
 * Since memory is a limited resource, it is interesting to know how much of it
 * an object requires. This interface provides a read-only property for objects
 * to report their memory consumption.
 *
 * Keep in mind that this should not only take into account by the object
 * structure itself, but any dynamic memory it might allocate.
 *
 * This is used by @ref Efl_Ui_Caching_Factory, for example, to keep track of
 * the total amount of memory used by the objects the factory creates.
 *
 * @ingroup Efl_Cached_Item
  }

{ was #define dname def_expr }
function EFL_CACHED_ITEM_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_cached_item_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The amount of memory currently used by this object.
 *
 * @param[in] obj The object.
 *
 * @return Bytes of memory.
 *
 * @ingroup Efl_Cached_Item
  }
(* Const before type ignored *)
function efl_cached_item_memory_size_get(obj:PEo):dword;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CACHED_ITEM_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_CACHED_ITEM_INTERFACE:=efl_cached_item_interface_get;
  end;


end.
