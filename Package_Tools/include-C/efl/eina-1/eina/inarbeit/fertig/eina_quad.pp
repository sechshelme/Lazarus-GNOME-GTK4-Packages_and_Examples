
unit eina_quad;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_quad.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_quad.h
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
PEina_Quad  = ^Eina_Quad;
PEina_Rectangle  = ^Eina_Rectangle;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2007-2014 Jorge Luis Zapata
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
 * License along with this library.
 * If not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef EINA_QUAD_H_}
{$define EINA_QUAD_H_}
{$include <eina_rectangle.h>}
{*
 * @file
  }
{*
 * @addtogroup Eina_Data_Types_Group Data Types
 *
 * @
  }
{*
 * @defgroup Eina_Quad_Group Quadrangles
 *
 * @brief Quadrangles operations.
 *
 * @
  }
{*
 * Quadrangle definition
  }
{*< Top left x coordinate  }
{*< Top left y coordinate  }
{*< Top right x coordinate  }
{*< Top right y coordinate  }
{*< Bottom right x coordinate  }
{*< Bottom right y coordinate  }
{*< Bottom left x coordinate  }
{*< Bottom left y coordinate  }
type
  PEina_Quad = ^TEina_Quad;
  TEina_Quad = record
      x0 : Tdouble;
      y0 : Tdouble;
      x1 : Tdouble;
      y1 : Tdouble;
      x2 : Tdouble;
      y2 : Tdouble;
      x3 : Tdouble;
      y3 : Tdouble;
    end;
{*
 * @brief Transform the given quadrangle to the given rectangle.
 *
 * @param[in] q The quadrangle to get coordinates.
 * @param[out] r The rectangle.
 *
 * @since 1.14
 *  }
(* Const before type ignored *)

procedure eina_quad_rectangle_to(q:PEina_Quad; r:PEina_Rectangle);cdecl;external;
{*
 * @brief Transform the given rectangle to the given quadrangle.
 *
 * @param[in] q The quadrangle.
 * @param[out] r The rectangle to get coordinates.
 *
 * @since 1.14
 *  }
(* Const before type ignored *)
procedure eina_quad_rectangle_from(q:PEina_Quad; r:PEina_Rectangle);cdecl;external;
{*
 * @brief Sets the values of the coordinates of the given quadrangle.
 *
 * @param[out] q The quadrangle to set coordinates.
 * @param[in] x0 Top left x coordinate.
 * @param[in] y0 Top left y coordinate.
 * @param[in] x1 Top right x coordinate.
 * @param[in] y1 Top right y coordinate.
 * @param[in] x2 Bottom right x coordinate.
 * @param[in] y2 Bottom right y coordinate.
 * @param[in] x3 Bottom left x coordinate.
 * @param[in] y3 Bottom left y coordinate.
 *
 * @since 1.14
 *  }
procedure eina_quad_coords_set(q:PEina_Quad; x0:Tdouble; y0:Tdouble; x1:Tdouble; y1:Tdouble; 
            x2:Tdouble; y2:Tdouble; x3:Tdouble; y3:Tdouble);cdecl;external;
{*
 * @brief Gets the values of the coordinates of the given quadrangle.
 *
 * @param[in] q The quadrangle to get coordinates.
 * @param[out] x0 Top left x coordinate.
 * @param[out] y0 Top left y coordinate.
 * @param[out] x1 Top right x coordinate.
 * @param[out] y1 Top right y coordinate.
 * @param[out] x2 Bottom right x coordinate.
 * @param[out] y2 Bottom right y coordinate.
 * @param[out] x3 Bottom left x coordinate.
 * @param[out] y3 Bottom left y coordinate.
 *
 * @since 1.14
 *  }
(* Const before type ignored *)
procedure eina_quad_coords_get(q:PEina_Quad; x0:Pdouble; y0:Pdouble; x1:Pdouble; y1:Pdouble; 
            x2:Pdouble; y2:Pdouble; x3:Pdouble; y3:Pdouble);cdecl;external;
{*
 * @
  }
{*
 * @
  }
{$endif}

implementation


end.
