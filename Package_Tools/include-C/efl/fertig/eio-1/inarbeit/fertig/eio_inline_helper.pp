
unit eio_inline_helper;
interface

{
  Automatically converted by H2Pas 1.0.0 from eio_inline_helper.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eio_inline_helper.h
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


{ EIO - EFL data type library
 * Copyright (C) 2010 Enlightenment Developers:
 *           Cedric Bail <cedric.bail@free.fr>
 *           Vincent "caro" Torri  <vtorri at univ-evry dot fr>
 *	     Stephen "okra" Houston <smhouston88@gmail.com>
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
{$ifndef EIO_INLINE_HELPER_H__}
{$define EIO_INLINE_HELPER_H__}
{*
 * @addtogroup Eio_Helper
 *
 * @
  }
{*
 * @brief Return last access time to a file
 * @param st The stat buffer as given by eio_file_stat callback.
 * @return last access time.
 *
 * This function return the st_atime field, last access time, as double like all EFL time call.
  }
{*
 * @
  }
{$endif}

implementation


end.
