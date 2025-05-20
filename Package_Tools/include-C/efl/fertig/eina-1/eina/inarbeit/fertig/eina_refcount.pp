
unit eina_refcount;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_refcount.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_refcount.h
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
PEina_Refcount  = ^Eina_Refcount;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 20011 Cedric Bail
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
{$ifndef EINA_REFCOUNT_H_}
{$define EINA_REFCOUNT_H_}
{*
 * @addtogroup Eina_Refcount References counting
 *
 * @brief Small macro that simplify references counting.
 *
 * References counting is not a difficult task, but you must
 * handle it correctly every where, and that the issue. This
 * set of macro do provide helper that will force to use the
 * correct code in most case and reduce the bug likeliness.
 * Of course this without affecting speed !
  }
{*
 * @addtogroup Eina_Data_Types_Group Data Types
 *
 * @
  }
{*
 * @defgroup Eina_Refcount References counting
 *
 * @
  }
{*
 * @typedef Eina_Refcount
 * Inlined references counting type.
  }
type
  PEina_Refcount = ^TEina_Refcount;
  TEina_Refcount = longint;
{* Used for declaring a reference counting member in a struct  }
{*
 * @
  }
{*
 * @
  }
{$endif}
{ EINA_REFCOUNT_H_  }

implementation


end.
