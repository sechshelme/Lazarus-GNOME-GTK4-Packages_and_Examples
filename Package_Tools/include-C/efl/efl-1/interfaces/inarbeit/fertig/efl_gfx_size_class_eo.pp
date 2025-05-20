
unit efl_gfx_size_class_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_size_class_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_size_class_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Gfx_Size_Class  = ^Efl_Gfx_Size_Class;
PEo  = ^Eo;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_SIZE_CLASS_EO_H_}
{$define _EFL_GFX_SIZE_CLASS_EO_H_}
{$ifndef _EFL_GFX_SIZE_CLASS_EO_CLASS_TYPE}
{$define _EFL_GFX_SIZE_CLASS_EO_CLASS_TYPE}
type
  PEfl_Gfx_Size_Class = ^TEfl_Gfx_Size_Class;
  TEfl_Gfx_Size_Class = TEo;
{$endif}
{$ifndef _EFL_GFX_SIZE_CLASS_EO_TYPES}
{$define _EFL_GFX_SIZE_CLASS_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl Gfx Size Class interface
 *
 * @ingroup Efl_Gfx_Size_Class
  }

{ was #define dname def_expr }
function EFL_GFX_SIZE_CLASS_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_size_class_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Width and height of size class.
 *
 * This property sets width and height for a size class. This will make all
 * edje parts in the specified object that have the specified size class update
 * their size with given values. When reading, these values will only be valid
 * until the size class is changed or the edje object is deleted.
 *
 * @param[in] obj The object.
 * @param[in] size_class The name of size class
 * @param[in] minw minimum width
 * @param[in] minh minimum height
 * @param[in] maxw maximum width
 * @param[in] maxh maximum height
 *
 * @return @c true, on success or @c false, on error
 *
 * @ingroup Efl_Gfx_Size_Class
  }
(* Const before type ignored *)
function efl_gfx_size_class_set(obj:PEo; size_class:Pchar; minw:longint; minh:longint; maxw:longint; 
           maxh:longint):TEina_Bool;cdecl;external;
{*
 * @brief Width and height of size class.
 *
 * This property sets width and height for a size class. This will make all
 * edje parts in the specified object that have the specified size class update
 * their size with given values. When reading, these values will only be valid
 * until the size class is changed or the edje object is deleted.
 *
 * @param[in] obj The object.
 * @param[in] size_class The name of size class
 * @param[out] minw minimum width
 * @param[out] minh minimum height
 * @param[out] maxw maximum width
 * @param[out] maxh maximum height
 *
 * @return @c true, on success or @c false, on error
 *
 * @ingroup Efl_Gfx_Size_Class
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_gfx_size_class_get(obj:PEo; size_class:Pchar; minw:Plongint; minh:Plongint; maxw:Plongint; 
           maxh:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Delete the size class.
 *
 * This function deletes any values for the specified size class.
 *
 * Deleting the size class will revert it to the values defined by
 * @ref efl_gfx_size_class_set() or the size class defined in the theme file.
 *
 * @param[in] obj The object.
 * @param[in] size_class The size class to be deleted.
 *
 * @ingroup Efl_Gfx_Size_Class
  }
(* Const before type ignored *)
procedure efl_gfx_size_class_del(obj:PEo; size_class:Pchar);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_SIZE_CLASS_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_GFX_SIZE_CLASS_INTERFACE:=efl_gfx_size_class_interface_get;
  end;


end.
