
unit pango_direction;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_direction.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_direction.h
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
PPangoDirection  = ^PangoDirection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-direction.h: Unicode text direction
 *
 * Copyright (C) 2018 Matthias Clasen
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_DIRECTION_H__}
{$define __PANGO_DIRECTION_H__}
{$include <glib.h>}
{*
 * PangoDirection:
 * @PANGO_DIRECTION_LTR: A strong left-to-right direction
 * @PANGO_DIRECTION_RTL: A strong right-to-left direction
 * @PANGO_DIRECTION_TTB_LTR: Deprecated value; treated the
 *   same as `PANGO_DIRECTION_RTL`.
 * @PANGO_DIRECTION_TTB_RTL: Deprecated value; treated the
 *   same as `PANGO_DIRECTION_LTR`
 * @PANGO_DIRECTION_WEAK_LTR: A weak left-to-right direction
 * @PANGO_DIRECTION_WEAK_RTL: A weak right-to-left direction
 * @PANGO_DIRECTION_NEUTRAL: No direction specified
 *
 * `PangoDirection` represents a direction in the Unicode bidirectional
 * algorithm.
 *
 * Not every value in this enumeration makes sense for every usage of
 * `PangoDirection`; for example, the return value of [func@unichar_direction]
 * and [func@find_base_dir] cannot be `PANGO_DIRECTION_WEAK_LTR` or
 * `PANGO_DIRECTION_WEAK_RTL`, since every character is either neutral
 * or has a strong direction; on the other hand `PANGO_DIRECTION_NEUTRAL`
 * doesn't make sense to pass to [func@itemize_with_base_dir].
 *
 * The `PANGO_DIRECTION_TTB_LTR`, `PANGO_DIRECTION_TTB_RTL` values come from
 * an earlier interpretation of this enumeration as the writing direction
 * of a block of text and are no longer used. See `PangoGravity` for how
 * vertical text is handled in Pango.
 *
 * If you are interested in text direction, you should really use fribidi
 * directly. `PangoDirection` is only retained because it is used in some
 * public apis.
  }
type
  PPangoDirection = ^TPangoDirection;
  TPangoDirection =  Longint;
  Const
    PANGO_DIRECTION_LTR = 0;
    PANGO_DIRECTION_RTL = 1;
    PANGO_DIRECTION_TTB_LTR = 2;
    PANGO_DIRECTION_TTB_RTL = 3;
    PANGO_DIRECTION_WEAK_LTR = 4;
    PANGO_DIRECTION_WEAK_RTL = 5;
    PANGO_DIRECTION_NEUTRAL = 6;
;
{$endif}
{ __PANGO_DIRECTION_H__  }

implementation


end.
