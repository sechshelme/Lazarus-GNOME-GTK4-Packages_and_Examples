
unit eina_bezier;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_bezier.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_bezier.h
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
PEina_Bezier  = ^Eina_Bezier;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2015 Subhransu Mohanty
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library;
 * if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef EINA_BEZIER_H}
{$define EINA_BEZIER_H}
{*
 * @defgroup Eina_Bezier_Group Bezier Curve
 * @ingroup Eina_Tools_Group
 *
 * @
  }
{*
 * Floating point cubic bezier curve
  }
type
{*< x coordinate of start point  }
{*< y coordinate of start point  }
{*< x coordinate of 1st control point  }
{*< y coordinate of 1st control point  }
{*< coordinate of 2nd control point  }
{*< y coordinate of 2nd control point  }
{*< x coordinate of end point  }
{*< y coordinate of end point  }
  PEina_Bezier = ^TEina_Bezier;
  TEina_Bezier = record
      start : record
          x : Tdouble;
          y : Tdouble;
        end;
      ctrl_start : record
          x : Tdouble;
          y : Tdouble;
        end;
      ctrl_end : record
          x : Tdouble;
          y : Tdouble;
        end;
      end : record
          x : Tdouble;
          y : Tdouble;
        end;
    end;

{*
 * @brief Sets the values of the points of the given floating
 * point cubic bezier curve.
 *
 * @param[out] b The floating point bezier.
 * @param[in] start_x The x coordinate of the start point.
 * @param[in] start_y The y coordinate of the start point.
 * @param[in] ctrl_start_x The x coordinate of the 1st control point.
 * @param[in] ctrl_start_y The y coordinate of the 1st control point.
 * @param[in] ctrl_end_x The X coordinate of the 2nd control point.
 * @param[in] ctrl_end_y The Y coordinate of the 2nd control point.
 * @param[in] end_x The X coordinate of the end point.
 * @param[in] end_y The Y coordinate of the end point.
 *
 * @p b. No check is done on @p b.
 * @since 1.16
  }

procedure eina_bezier_values_set(b:PEina_Bezier; start_x:Tdouble; start_y:Tdouble; ctrl_start_x:Tdouble; ctrl_start_y:Tdouble; 
            ctrl_end_x:Tdouble; ctrl_end_y:Tdouble; end_x:Tdouble; end_y:Tdouble);cdecl;external;
{*
 * @brief Gets the values of the points of the given floating
 * point cubic bezier curve.
 *
 * @param[in] b The floating point bezier.
 * @param[out] start_x x coordinate of start point.
 * @param[out] start_y y coordinate of start point.
 * @param[out] ctrl_start_x x coordinate of 1st control point.
 * @param[out] ctrl_start_y y coordinate of 1st control point.
 * @param[out] ctrl_end_x x coordinate of 2nd control point.
 * @param[out] ctrl_end_y y coordinate of 2nd control point.
 * @param[out] end_x x coordinate of end point.
 * @param[out] end_y y coordinate of end point.
 *
 * @p b. No check is done on @p b.
 * @since 1.16
  }
(* Const before type ignored *)
procedure eina_bezier_values_get(b:PEina_Bezier; start_x:Pdouble; start_y:Pdouble; ctrl_start_x:Pdouble; ctrl_start_y:Pdouble; 
            ctrl_end_x:Pdouble; ctrl_end_y:Pdouble; end_x:Pdouble; end_y:Pdouble);cdecl;external;
{*
 * @brief Calculates the approximate length of the given floating point
 * cubic bezier curve.
 *
 * @param[in] b The floating point bezier.
 * @return The bezier's length.
 *
 * The curve length is approximated using the Alpha max plus beta min algorithm,
 * which is designed to give fast results with a maximum error of less than 7%
 * compared with the correct value.
 *
 * No check is done on @p b.
 * @since 1.16
  }
(* Const before type ignored *)
function eina_bezier_length_get(b:PEina_Bezier):Tdouble;cdecl;external;
{*
 * @brief Returns the relative position on a bezier at a given length.
 *
 * @param[in] b The floating point bezier.
 * @param[in] len The length along the bezier curve.
 * @return The relative position from 0.0 to 1.0.
 *
 * Calculates the proportional location on @p b as a number from 0.0 to
 * 1.0 that corresponds to a distance @p len along it.  Returns 1.0 if
 * @p len is equal or greater than the bezier's length.
 *
 * No check is done on @p b.
 *
 * @since 1.16
  }
(* Const before type ignored *)
function eina_bezier_t_at(b:PEina_Bezier; len:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Gets the point on the bezier curve at position t.
 *
 * @param[in] b The floating point bezier.
 * @param[in] t The floating point position between 0.0 and 1.0.
 * @param[out] px The corresponding point's X coordinate.
 * @param[out] py The corresponding point's Y coordinate.
 *
 * No check is done on @p b.
 * @since 1.16
  }
(* Const before type ignored *)
procedure eina_bezier_point_at(b:PEina_Bezier; t:Tdouble; px:Pdouble; py:Pdouble);cdecl;external;
{*
 * @brief Determines the slope of the bezier at a given position.
 *
 * @param[in] b The floating point bezier.
 * @param[out] t The position along the bezier between 0.0 and 1.0.
 *
 * No check is done on @p b.
 * @since 1.16
  }
(* Const before type ignored *)
function eina_bezier_angle_at(b:PEina_Bezier; t:Tdouble):Tdouble;cdecl;external;
{*
 * @brief Splits the bezier at a given length.
 *
 * @param[in] b The floating point bezier.
 * @param[in] len The length along the bezier to make the split.
 * @param[out] left The resultant split's left portion of the bezier.
 * @param[out] right The resultant split's right portion of the bezier.
 *
 * No check is done on @p b.
 * @since 1.16
  }
(* Const before type ignored *)
procedure eina_bezier_split_at_length(b:PEina_Bezier; len:Tdouble; left:PEina_Bezier; right:PEina_Bezier);cdecl;external;
{*
 * @brief Calculates the bounding box for the bezier.
 *
 * @param[in] b The floating point bezier.
 * @param[out] x The X coordinate of the bounding box.
 * @param[out] y The Y coordinate of the bounding box.
 * @param[out] w The width of the bounding box.
 * @param[out] h The height of the bounding box.
 *
 * No check is done on @p b.
 * @since 1.17
  }
(* Const before type ignored *)
procedure eina_bezier_bounds_get(b:PEina_Bezier; x:Pdouble; y:Pdouble; w:Pdouble; h:Pdouble);cdecl;external;
{*
 * @brief Finds the bezier between the given interval.
 *
 * @param[in] b The floating point bezier.
 * @param[in] t0 The start of the interval.
 * @param[in] t1 The end of the interval.
 * @param[out] result The resulting bezier.
 *
 * No check is done on @p b.
 * @since 1.17
  }
procedure eina_bezier_on_interval(b:PEina_Bezier; t0:Tdouble; t1:Tdouble; result:PEina_Bezier);cdecl;external;
{*
 * @
  }
{$endif}
{ EINA_BEZIER_H }

implementation


end.
