
unit evas_line_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from evas_line_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    evas_line_eo_legacy.h
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
PEvas_Line  = ^Evas_Line;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EVAS_LINE_EO_LEGACY_H_}
{$define _EVAS_LINE_EO_LEGACY_H_}
{$ifndef _EVAS_LINE_EO_CLASS_TYPE}
{$define _EVAS_LINE_EO_CLASS_TYPE}
type
  PEvas_Line = ^TEvas_Line;
  TEvas_Line = TEo;
{$endif}
{$ifndef _EVAS_LINE_EO_TYPES}
{$define _EVAS_LINE_EO_TYPES}
{$endif}
{*
 * @brief Sets the coordinates of the end points of the given evas line object.
 *
 * @param[in] obj The object.
 * @param[in] x1 The X coordinate of the first point.
 * @param[in] y1 The Y coordinate of the first point.
 * @param[in] x2 The X coordinate of the second point.
 * @param[in] y2 The Y coordinate of the second point.
 *
 * @since 1.8
 *
 * @ingroup Evas_Object_Line_Group
  }

procedure evas_object_line_xy_set(obj:PEvas_Line; x1:longint; y1:longint; x2:longint; y2:longint);cdecl;external;
{*
 * @brief Retrieves the coordinates of the end points of the given evas line
 * object.
 *
 * @param[in] obj The object.
 * @param[out] x1 The X coordinate of the first point.
 * @param[out] y1 The Y coordinate of the first point.
 * @param[out] x2 The X coordinate of the second point.
 * @param[out] y2 The Y coordinate of the second point.
 *
 * @ingroup Evas_Object_Line_Group
  }
(* Const before type ignored *)
procedure evas_object_line_xy_get(obj:PEvas_Line; x1:Plongint; y1:Plongint; x2:Plongint; y2:Plongint);cdecl;external;
{$endif}

implementation


end.
