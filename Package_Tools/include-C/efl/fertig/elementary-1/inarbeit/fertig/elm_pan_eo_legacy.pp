
unit elm_pan_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_pan_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_pan_eo_legacy.h
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
PElm_Pan  = ^Elm_Pan;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_PAN_EO_LEGACY_H_}
{$define _ELM_PAN_EO_LEGACY_H_}
{$ifndef _ELM_PAN_EO_CLASS_TYPE}
{$define _ELM_PAN_EO_CLASS_TYPE}
type
  PElm_Pan = ^TElm_Pan;
  TElm_Pan = TEo;
{$endif}
{$ifndef _ELM_PAN_EO_TYPES}
{$define _ELM_PAN_EO_TYPES}
{$endif}
{*
 * @brief Position
 *
 * @param[in] obj The object.
 * @param[in] x X coordinate
 * @param[in] y Y coordinate
 *
 * @ingroup Elm_Pan_Group
  }

procedure elm_pan_pos_set(obj:PElm_Pan; x:longint; y:longint);cdecl;external;
{*
 * @brief Position
 *
 * @param[in] obj The object.
 * @param[out] x X coordinate
 * @param[out] y Y coordinate
 *
 * @ingroup Elm_Pan_Group
  }
(* Const before type ignored *)
procedure elm_pan_pos_get(obj:PElm_Pan; x:Plongint; y:Plongint);cdecl;external;
{*
 * @brief Content size
 *
 * @param[in] obj The object.
 * @param[out] w Width
 * @param[out] h Height
 *
 * @ingroup Elm_Pan_Group
  }
(* Const before type ignored *)
procedure elm_pan_content_size_get(obj:PElm_Pan; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Minimal position
 *
 * @param[in] obj The object.
 * @param[out] x X coordinate
 * @param[out] y Y coordinate
 *
 * @ingroup Elm_Pan_Group
  }
(* Const before type ignored *)
procedure elm_pan_pos_min_get(obj:PElm_Pan; x:Plongint; y:Plongint);cdecl;external;
{*
 * @brief Maximal position
 *
 * @param[in] obj The object.
 * @param[out] x X coordinate
 * @param[out] y Y coordinate
 *
 * @ingroup Elm_Pan_Group
  }
(* Const before type ignored *)
procedure elm_pan_pos_max_get(obj:PElm_Pan; x:Plongint; y:Plongint);cdecl;external;
{$endif}

implementation


end.
