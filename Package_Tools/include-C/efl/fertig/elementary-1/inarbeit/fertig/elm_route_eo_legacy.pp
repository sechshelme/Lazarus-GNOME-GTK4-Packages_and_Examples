
unit elm_route_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_route_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_route_eo_legacy.h
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
Pdouble  = ^double;
PElm_Route  = ^Elm_Route;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_ROUTE_EO_LEGACY_H_}
{$define _ELM_ROUTE_EO_LEGACY_H_}
{$ifndef _ELM_ROUTE_EO_CLASS_TYPE}
{$define _ELM_ROUTE_EO_CLASS_TYPE}
type
  PElm_Route = ^TElm_Route;
  TElm_Route = TEo;
{$endif}
{$ifndef _ELM_ROUTE_EO_TYPES}
{$define _ELM_ROUTE_EO_TYPES}
{$endif}
{*
 * @brief Set map widget for this route
 *
 * @param[in] obj The object.
 * @param[in] emap Elementary map widget
 *
 * @ingroup Elm_Route_Group
  }

procedure elm_route_emap_set(obj:PElm_Route; emap:pointer);cdecl;external;
{*
 * @brief Get the minimum and maximum values along the longitude.
 *
 * @note If only one value is needed, the other pointer can be passed as null.
 *
 * @param[in] obj The object.
 * @param[out] min Pointer to store the minimum value.
 * @param[out] max Pointer to store the maximum value.
 *
 * @ingroup Elm_Route_Group
  }
(* Const before type ignored *)
procedure elm_route_longitude_min_max_get(obj:PElm_Route; min:Pdouble; max:Pdouble);cdecl;external;
{*
 * @brief Get the minimum and maximum values along the latitude.
 *
 * @note If only one value is needed, the other pointer can be passed as null.
 *
 * @param[in] obj The object.
 * @param[out] min Pointer to store the minimum value.
 * @param[out] max Pointer to store the maximum value.
 *
 * @ingroup Elm_Route_Group
  }
(* Const before type ignored *)
procedure elm_route_latitude_min_max_get(obj:PElm_Route; min:Pdouble; max:Pdouble);cdecl;external;
{$endif}

implementation


end.
