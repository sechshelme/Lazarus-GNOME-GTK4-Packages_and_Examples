
unit global;
interface

{
  Automatically converted by H2Pas 1.0.0 from global.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    global.h
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
Psnd_async_handler_t  = ^snd_async_handler_t;
Psnd_dlsym_link  = ^snd_dlsym_link;
Psnd_shm_area  = ^snd_shm_area;
Ptimespec  = ^timespec;
Ptimeval  = ^timeval;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file include/global.h
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
{$ifndef __ALSA_GLOBAL_H_}
{$define __ALSA_GLOBAL_H_}
{ for timeval and timespec  }
{$include <time.h>}
{ C++ extern C conditionnal removed }
{*
 *  \defgroup Global Global defines and functions
 *  Global defines and functions.
 *  \par
 *  The ALSA library implementation uses these macros and functions.
 *  Most applications probably do not need them.
 *  \
  }
(* Const before type ignored *)

function snd_asoundlib_version:Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
type
  Psnd_dlsym_link = ^Tsnd_dlsym_link;
  Tsnd_dlsym_link = record
      next : Psnd_dlsym_link;
      dlsym_name : Pchar;
      dlsym_ptr : pointer;
    end;

  var
    snd_dlsym_start : Psnd_dlsym_link;cvar;external;
{* \hideinitializer \brief Helper macro for #SND_DLSYM_BUILD_VERSION.  }
{*
 * \hideinitializer
 * \brief Appends the build version to the name of a versioned dynamic symbol.
  }
{* \brief Returns the version of a dynamic symbol as a string.  }
(* Const before type ignored *)

function snd_dlpath(path:Pchar; path_len:Tsize_t; name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function snd_dlopen(file:Pchar; mode:longint; errbuf:Pchar; errbuflen:Tsize_t):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function snd_dlsym(handle:pointer; name:Pchar; version:Pchar):pointer;cdecl;external;
function snd_dlclose(handle:pointer):longint;cdecl;external;
{* \brief alloca helper macro.  }
{*
 * \brief Internal structure for an async notification client handler.
 *
 * The ALSA library uses a pointer to this structure as a handle to an async
 * notification object. Applications don't access its contents directly.
  }
type
  Tsnd_async_handler = Tsnd_async_handler_t;
{*
 * \brief Async notification callback.
 *
 * See the #snd_async_add_handler function for details.
  }

  Tsnd_async_callback_t = procedure (handler:Psnd_async_handler_t);cdecl;

function snd_async_add_handler(handler:PPsnd_async_handler_t; fd:longint; callback:Tsnd_async_callback_t; private_data:pointer):longint;cdecl;external;
function snd_async_del_handler(handler:Psnd_async_handler_t):longint;cdecl;external;
function snd_async_handler_get_fd(handler:Psnd_async_handler_t):longint;cdecl;external;
function snd_async_handler_get_signo(handler:Psnd_async_handler_t):longint;cdecl;external;
function snd_async_handler_get_callback_private(handler:Psnd_async_handler_t):pointer;cdecl;external;
function snd_shm_area_create(shmid:longint; ptr:pointer):Psnd_shm_area;cdecl;external;
function snd_shm_area_share(area:Psnd_shm_area):Psnd_shm_area;cdecl;external;
function snd_shm_area_destroy(area:Psnd_shm_area):longint;cdecl;external;
(* Const before type ignored *)
function snd_user_file(file:Pchar; result:PPchar):longint;cdecl;external;
{$ifdef __GLIBC__}
{$if !defined(_POSIX_C_SOURCE) && !defined(_POSIX_SOURCE)}
{ seconds  }
{ microseconds  }
type
  Ptimeval = ^Ttimeval;
  Ttimeval = record
      tv_sec : Ttime_t;cdecl;
      tv_usec : longint;
    end;

{ seconds  }
{ nanoseconds  }
  Ptimespec = ^Ttimespec;
  Ttimespec = record
      tv_sec : Ttime_t;
      tv_nsec : longint;
    end;

{$endif}
{$endif}
{* Timestamp  }
type
  Ttimeval = Tsnd_timestamp_t;
{* Hi-res timestamp  }
  Ttimespec = Tsnd_htimestamp_t;
{* \  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ALSA_GLOBAL_H  }

implementation


end.
