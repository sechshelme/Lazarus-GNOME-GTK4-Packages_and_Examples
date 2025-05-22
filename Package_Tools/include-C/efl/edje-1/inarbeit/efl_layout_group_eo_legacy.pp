
unit efl_layout_group_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_layout_group_eo.legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_layout_group_eo.legacy.h
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
PEfl_Layout_Group  = ^Efl_Layout_Group;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_LAYOUT_GROUP_EO_LEGACY_H_}
{$define _EFL_LAYOUT_GROUP_EO_LEGACY_H_}
{$ifndef _EFL_LAYOUT_GROUP_EO_CLASS_TYPE}
{$define _EFL_LAYOUT_GROUP_EO_CLASS_TYPE}
type
  PEfl_Layout_Group = ^TEfl_Layout_Group;
  TEfl_Layout_Group = TEo;
{$endif}
{$ifndef _EFL_LAYOUT_GROUP_EO_TYPES}
{$define _EFL_LAYOUT_GROUP_EO_TYPES}
{$endif}
{*
 * @brief Retrives an EDC data field's value from a given Edje object's group.
 *
 * This function fetches an EDC data field's value, which is declared on the
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
 * @since 1.21
 *
 * @ingroup (null)_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function edje_object_data_get(obj:PEfl_Layout_Group; key:Pchar):Pchar;cdecl;external;
{$endif}

implementation


end.
