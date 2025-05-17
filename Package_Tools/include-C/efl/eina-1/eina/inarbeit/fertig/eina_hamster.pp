
unit eina_hamster;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_hamster.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_hamster.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2008 Cedric Bail
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
{$ifndef EINA_HAMSTER_H_}
{$define EINA_HAMSTER_H_}
{*
 * @addtogroup Eina_Core_Group Core
 *
 * @
  }
{*
 * @defgroup Eina_Hamster_Group Hamster
 *
 * @brief These functions provide hamster calls.
 *
 * @
  }
{*
 * @brief Gets the hamster count.
 *
 * @return The number of available hamsters.
 *
 * This function returns how many hamsters you have.
  }

function eina_hamster_count:longint;cdecl;external;
{*
 * @
  }
{*
 * @
  }
{$endif}
{ EINA_HAMSTER_H_  }

implementation


end.
