
unit efl_layout_group_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_layout_group_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_layout_group_eo.h
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
PEfl_Layout_Group  = ^Efl_Layout_Group;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_LAYOUT_GROUP_EO_H_}
{$define _EFL_LAYOUT_GROUP_EO_H_}
{$ifndef _EFL_LAYOUT_GROUP_EO_CLASS_TYPE}
{$define _EFL_LAYOUT_GROUP_EO_CLASS_TYPE}
type
  PEfl_Layout_Group = ^TEfl_Layout_Group;
  TEfl_Layout_Group = TEo;
{$endif}
{$ifndef _EFL_LAYOUT_GROUP_EO_TYPES}
{$define _EFL_LAYOUT_GROUP_EO_TYPES}
{$endif}
{* APIs representing static data from a group in an edje file.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Group
  }

{ was #define dname def_expr }
function EFL_LAYOUT_GROUP_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_layout_group_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The minimum size specified -- as an EDC property -- for a given Edje
 * object
 *
 * This property retrieves the obj object's minimum size values, as declared in
 * its EDC group definition. For instance, for an Edje object of minimum size
 * 100x100 pixels: collections  group  name: "a_group"; min: 100 100;  
 *
 * @note If the @c min EDC property was not declared for this object, this call
 * will return 0x0.
 *
 * @note On failure, this function also return 0x0.
 *
 * See also @ref efl_layout_group_size_max_get.
 *
 * @param[in] obj The object.
 *
 * @return The minimum size as set in EDC.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Group
  }
(* Const before type ignored *)
function efl_layout_group_size_min_get(obj:PEo):TEina_Size2D;cdecl;external;
{*
 * @brief The maximum size specified -- as an EDC property -- for a given Edje
 * object
 *
 * This property retrieves the object's maximum size values, as declared in its
 * EDC group definition. For instance, for an Edje object of maximum size
 * 100x100 pixels: collections  group  name: "a_group"; max: 100 100;  
 *
 * @note If the @c max EDC property was not declared for the object, this call
 * will return the maximum size a given Edje object may have, for each axis.
 *
 * @note On failure, this function will return 0x0.
 *
 * See also @ref efl_layout_group_size_min_get.
 *
 * @param[in] obj The object.
 *
 * @return The maximum size as set in EDC.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Group
  }
(* Const before type ignored *)
function efl_layout_group_size_max_get(obj:PEo):TEina_Size2D;cdecl;external;
{*
 * @brief The EDC data field's value from a given Edje object's group.
 *
 * This property represents an EDC data field's value, which is declared on the
 * objects building EDC file, under its group. EDC data blocks are most
 * commonly used to pass arbitrary parameters from an application's theme to
 * its code.
 *
 * EDC data fields always hold  strings as values, hence the return type of
 * this function. Check the complete "syntax reference" for EDC files.
 *
 * This is how a data item is defined in EDC: collections  group  name:
 * "a_group"; data  item: "key1" "value1"; item: "key2" "value2";   
 *
 * @warning Do not confuse this call with edje_file_data_get(), which queries
 * for a global EDC data field on an EDC declaration file.
 *
 * @param[in] obj The object.
 * @param[in] key The data field's key string
 *
 * @return The data's value string.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function efl_layout_group_data_get(obj:PEo; key:Pchar):Pchar;cdecl;external;
{*
 * @brief Whether the given part exists in this group.
 *
 * This is mostly equivalent to verifying the part type on the object as would
 * be done in C as follows: (efl_canvas_layout_part_type_get(efl_part(obj,
 * "partname")) != EFL_CANVAS_LAYOUT_PART_TYPE_NONE)
 *
 * The differences are that will silently return @c false if the part does not
 * exist, and this will return @c true if the part is of type @c SPACER in the
 * EDC file ($SPACER parts have type @c NONE).
 *
 * See also @ref efl_canvas_layout_part_type_get.
 *
 * @param[in] obj The object.
 * @param[in] part The part name to check.
 *
 * @return @c true if the part exists, @c false otherwise.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_layout_group_part_exist_get(obj:PEo; part:Pchar):TEina_Bool;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_LAYOUT_GROUP_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_LAYOUT_GROUP_INTERFACE:=efl_layout_group_interface_get;
  end;


end.
