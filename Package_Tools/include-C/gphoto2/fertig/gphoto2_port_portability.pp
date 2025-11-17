
unit gphoto2_port_portability;
interface

{
  Automatically converted by H2Pas 1.0.0 from gphoto2_port_portability.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gphoto2_port_portability.h
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
PGPPORTWINDIR  = ^GPPORTWINDIR;
Pssize_t  = ^ssize_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file gphoto2-port-log.h
 *
 * Copyright 2001 Lutz Mueller <lutz@users.sf.net>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA
  }
{$ifndef LIBGPHOTO2_GPHOTO2_PORT_PORTABILITY_H}
{$define LIBGPHOTO2_GPHOTO2_PORT_PORTABILITY_H}
{$ifdef _GPHOTO2_INTERNAL_CODE}
{$if defined(WIN32) && !defined(__WINESRC__)}
{***********************************************************************
 * Begin Windows definitions (but not during WINE compilation)
 *********************************************************************** }
{$include <windows.h>}
{ done by mingw/wine headers ... defined to struct ... tsaes }
{$undef interface}
{$include <sys/types.h>}
{$include <sys/stat.h>}
{$include <string.h>}
{$include <stdio.h>}
{$include <direct.h>}
{$include <unistd.h>}
{$ifndef IOLIBS}

const
  IOLIBS = '.';  
{$endif}

const
  strcasecmp = _stricmp;  
{$ifndef snprintf}

const
  snprintf = _snprintf;  
{$endif}

const
  __func__ = __FUNCTION__;  
{$ifndef _SSIZE_T_DEFINED}
type
  Pssize_t = ^Tssize_t;
  Tssize_t = TSSIZE_T;
{$endif}
{ Work-around for readdir()  }
type
  PGPPORTWINDIR = ^TGPPORTWINDIR;
  TGPPORTWINDIR = record
      handle : THANDLE;
      got_first : longint;
      search : TWIN32_FIND_DATA;
      dir : array[0..1023] of char;
      drive : array[0..31] of array[0..1] of char;
      drive_count : longint;
      drive_index : longint;
    end;
{ Directory-oriented functions  }
{xxxxxxxxxxx# define gp_system_dir		  GPPORTWINDIR * }
{xxxxxxxxxx# define gp_system_dirent	  WIN32_FIND_DATA * }

const
  gp_system_dir_delim = '\\';  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function sleep(x : longint) : longint;

{***********************************************************************
 * End WIN32 definitions
 *********************************************************************** }
{$else}
{***********************************************************************
 * Begin POSIX/XOPEN definitions
 *********************************************************************** }
{ yummy. :)  }
{ XOPEN needed for usleep  }
{$ifndef _XOPEN_SOURCE}

const
  _XOPEN_SOURCE = 500;  
{$else}
{$if ((_XOPEN_SOURCE - 0) < 500)}
{$undef _XOPEN_SOURCE}

const
  _XOPEN_SOURCE = 500;  
{$endif}
{$endif}
{ for nanosleep  }
{$ifndef _POSIX_C_SOURCE}

const
  _POSIX_C_SOURCE = 199309;  
{$endif}
{$include <time.h>}
{$include <strings.h>}
{$include <sys/types.h>}
{$include <dirent.h>}
{$ifdef HAVE_SYS_PARAM_H}
{$include <sys/param.h>}
{$endif}
{$include <sys/stat.h>}
{$include <unistd.h>}
{ Directory-oriented functions  }
{* A system directory handle  }
{xxxxxxxxxxxx# define gp_system_dir           DIR * }
{* A system directory entry  }
{xxxxxxxxxxxx# define gp_system_dirent	 struct dirent * }
{* The directory delimiter character on this platform.  }

const
  gp_system_dir_delim = '/';  
{***********************************************************************
 * End POSIX/XOPEN definitions
 *********************************************************************** }
{$endif}
{ else  }
{***********************************************************************
 * Begin platform independent portability functions
 *********************************************************************** }
(* Const before type ignored *)

function gp_system_mkdir(dirname:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_system_rmdir(dirname:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_system_opendir(dirname:Pchar):Tgp_system_dir;cdecl;external;
function gp_system_readdir(d:Tgp_system_dir):Tgp_system_dirent;cdecl;external;
(* Const before type ignored *)
function gp_system_filename(de:Tgp_system_dirent):Pchar;cdecl;external;
function gp_system_closedir(dir:Tgp_system_dir):longint;cdecl;external;
(* Const before type ignored *)
function gp_system_is_file(filename:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_system_is_dir(dirname:Pchar):longint;cdecl;external;
{***********************************************************************
 * End platform independent portability functions
 *********************************************************************** }
{$endif}
{ _GPHOTO2_INTERNAL_CODE  }
{$endif}
{ !defined(LIBGPHOTO2_GPHOTO2_PORT_PORTABILITY_H)  }
{ end of file  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function sleep(x : longint) : longint;
begin
  sleep:=usleep((x*1000)*1000);
end;


end.
