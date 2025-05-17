
unit eina_range;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_range.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_range.h
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
PEina_Range  = ^Eina_Range;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2020 Ali Alzyod
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
{$ifndef EINA_RANGE_H_}
{$define EINA_RANGE_H_}
{$include "eina_types.h"}
{$include "eina_cpu.h"}
{* @brief A Int range  }
type
  PEina_Range = ^TEina_Range;
  TEina_Range = record
      start : Tsize_t;
      length : Tsize_t;
    end;
{*
 * @brief convenience macro for comparing two Eina_Range structs
 * @param[in] a An Eina_Range
 * @param[in] b An Eina_Range
 * @return 1 if the structs are equal, 0 if they are not
 * @since 1.24
  }
{*
 * @brief Union between two ranges.
 *
 * @param[in] range The first range.
 * @param[in] range2 The second range.
 * @return The union between two ranges.
 *
 * @since 1.24
 *  }
{$include "eina_inline_range.x"}
{$endif}
{EINA_RANGE_H_ }

implementation


end.
