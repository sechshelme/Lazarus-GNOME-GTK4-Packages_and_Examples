
unit error;
interface

{
  Automatically converted by H2Pas 1.0.0 from error.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    error.h
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
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/error.h
 * \brief Application interface library for the ALSA driver
 * \author Jaroslav Kysela <perex@perex.cz>
 * \author Abramo Bagnara <abramo@alsa-project.org>
 * \author Takashi Iwai <tiwai@suse.de>
 * \date 1998-2001
 *
 * Application interface library for the ALSA driver
  }
{
 *   This library is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Lesser General Public License as
 *   published by the Free Software Foundation; either version 2.1 of
 *   the License, or (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Lesser General Public License for more details.
 *
 *   You should have received a copy of the GNU Lesser General Public
 *   License along with this library; if not, write to the Free Software
 *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
  }
{$ifndef __ALSA_ERROR_H}
{$define __ALSA_ERROR_H}
{ C++ extern C conditionnal removed }
{*
 *  \defgroup Error Error handling
 *  Error handling macros and functions.
 *  \
  }
{*< Lower boundary of sound error codes.  }

const
  SND_ERROR_BEGIN = 500000;  
{*< Kernel/library protocols are not compatible.  }
  SND_ERROR_INCOMPATIBLE_VERSION = SND_ERROR_BEGIN+0;  
{*< Lisp encountered an error during acall.  }
  SND_ERROR_ALISP_NIL = SND_ERROR_BEGIN+1;  
(* Const before type ignored *)

function snd_strerror(errnum:longint):Pchar;cdecl;external;
{*
 * \brief Error handler callback.
 * \param file Source file name.
 * \param line Line number.
 * \param function Function name.
 * \param err Value of \c errno, or 0 if not relevant.
 * \param fmt \c printf(3) format.
 * \param ... \c printf(3) arguments.
 *
 * A function of this type is called by the ALSA library when an error occurs.
 * This function usually shows the message on the screen, and/or logs it.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ __attribute__ ((format (printf, 5, 6)))  }type

  Tsnd_lib_error_handler_t = procedure (file:Pchar; line:longint; _function:Pchar; err:longint; fmt:Pchar; 
                args:array of const);cdecl;
  var
    snd_lib_error : Tsnd_lib_error_handler_t;cvar;external;

function snd_lib_error_set_handler(handler:Tsnd_lib_error_handler_t):longint;cdecl;external;
{* \  }
{ C++ end of extern C conditionnal removed }
{* Local error handler function type  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type

  Tsnd_local_error_handler_t = procedure (file:Pchar; line:longint; func:Pchar; err:longint; fmt:Pchar; 
                arg:Tva_list);cdecl;

function snd_lib_error_set_local(func:Tsnd_local_error_handler_t):Tsnd_local_error_handler_t;cdecl;external;
{$endif}
{ __ALSA_ERROR_H  }

implementation


end.
