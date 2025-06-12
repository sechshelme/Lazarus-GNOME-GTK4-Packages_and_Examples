
unit Eio;
interface

{
  Automatically converted by H2Pas 1.0.0 from Eio.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Eio.h
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
PEina_File_Direct_Info  = ^Eina_File_Direct_Info;
PEio_File  = ^Eio_File;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EIO - Core asynchronous input/output operation library.
 * Copyright (C) 2010 Enlightenment Developers:
 *           Cedric Bail <cedric.bail@free.fr>
 *           Gustavo Sverzut Barbieri <barbieri@gmail.com>
 *           Vincent "caro" Torri  <vtorri at univ-evry dot fr>
 *           Stephen "okra" Houston <smhouston88@gmail.com>
 *           Guillaume "kuri" Friloux <guillaume.friloux@asp64.com>
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
{$ifndef EIO_H__}
{$define EIO_H__}
{$include <sys/types.h>}
{$include <sys/stat.h>}
{$include <unistd.h>}
{$include <Eina.h>}
{$include <Eet.h>}
{$include <Efl_Config.h>}
{$ifdef EIO_API}
{$error EIO_API should not be already defined}
{$endif}
{ C++ extern C conditionnal removed }
{*
 * @typedef Eio_File
 * Generic asynchronous I/O reference.
 * @ingroup Eio
  }
type
(* Const before type ignored *)

  TEio_Filter_Direct_Cb = function (data:pointer; handler:PEio_File; info:PEina_File_Direct_Info):TEina_Bool;cdecl;
{$ifndef EFL_NOLEGACY_API_SUPPORT}
{$include "Eio_Legacy.h"}
{$endif}
{$include "Eio_Eo.h"}
{*
 * @brief get access time from a Eina_Stat
 * @param stat the structure to get the atime from
 * @return the last accessed time
 *
 * This take care of doing type conversion to match rest of EFL time API.
 * @note some filesystem don't update that information.
  }
{*
 * @ingroup Eio
 *
 * @brief Set the polling interval to control the fallback monitor behavior
 * @param interval The interval (in seconds) to poll
 * @since 1.21
  }

procedure eio_monitoring_interval_set(interval:Tdouble);cdecl;external;
{$include "eio_inline_helper.x"}

const
  EIO_VERSION_MAJOR = EFL_VERSION_MAJOR;  
  EIO_VERSION_MINOR = EFL_VERSION_MINOR;  
{$endif}

implementation


end.
