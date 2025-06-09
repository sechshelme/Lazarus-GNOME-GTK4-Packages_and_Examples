
unit ecore_con_eet_base_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from ecore_con_eet_base_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ecore_con_eet_base_eo_legacy.h
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
PEcore_Con_Eet_Base  = ^Ecore_Con_Eet_Base;
PEet_Data_Descriptor  = ^Eet_Data_Descriptor;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_CON_EET_BASE_EO_LEGACY_H_}
{$define _ECORE_CON_EET_BASE_EO_LEGACY_H_}
{$ifndef _ECORE_CON_EET_BASE_EO_CLASS_TYPE}
{$define _ECORE_CON_EET_BASE_EO_CLASS_TYPE}
type
  PEcore_Con_Eet_Base = ^TEcore_Con_Eet_Base;
  TEcore_Con_Eet_Base = TEo;
{$endif}
{$ifndef _ECORE_CON_EET_BASE_EO_TYPES}
{$define _ECORE_CON_EET_BASE_EO_TYPES}
{* Ecore connection reply data structure
 *
 * @ingroup Ecore_Con
  }
type
{$endif}
{*
 * @brief Function to register a @ref Eet.Data.Descriptor to the ecore_con_eet
 * object.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the eet stream.
 * @param[in] edd The Eet.Data.Descriptor that is to be registered.
 *
 * @ingroup (null)_Group
  }
(* Const before type ignored *)

procedure ecore_con_eet(obj:PEcore_Con_Eet_Base; name:Pchar; edd:PEet_Data_Descriptor);cdecl;external;
{$endif}

implementation


end.
