
unit semaphore;
interface

{
  Automatically converted by H2Pas 1.0.0 from semaphore.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    semaphore.h
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
PGCond  = ^GCond;
PGMutex  = ^GMutex;
PVipsSemaphore  = ^VipsSemaphore;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Definitions for thread support.
 *
 * JC, 9/5/94
 * 30/7/99 RP, JC
 *	- reworked for posix/solaris threads
 * 28/9/99 JC
 *	- restructured, made part of public API
  }
{

	This file is part of VIPS.

	VIPS is free software; you can redistribute it and/or modify
	it under the terms of the GNU Lesser General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
	02110-1301  USA

  }
{

	These files are distributed with VIPS - http://www.vips.ecs.soton.ac.uk

  }
{$ifndef VIPS_SEMAPHORE_H}
{$define VIPS_SEMAPHORE_H}
{$include <glib.h>}
{$include <vips/vips.h>}
{$include <vips/thread.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }
{ Implement our own semaphores.
  }
type
  PVipsSemaphore = ^TVipsSemaphore;
  TVipsSemaphore = record
      name : Pchar;
      v : longint;
      mutex : PGMutex;
      cond : PGCond;
    end;

function vips_semaphore_up(s:PVipsSemaphore):longint;cdecl;external;
function vips_semaphore_upn(s:PVipsSemaphore; n:longint):longint;cdecl;external;
function vips_semaphore_down(s:PVipsSemaphore):longint;cdecl;external;
function vips_semaphore_downn(s:PVipsSemaphore; n:longint):longint;cdecl;external;
function vips_semaphore_down_timeout(s:PVipsSemaphore; timeout:Tgint64):longint;cdecl;external;
procedure vips_semaphore_destroy(s:PVipsSemaphore);cdecl;external;
procedure vips_semaphore_init(s:PVipsSemaphore; v:longint; name:Pchar);cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_SEMAPHORE_H }

implementation


end.
