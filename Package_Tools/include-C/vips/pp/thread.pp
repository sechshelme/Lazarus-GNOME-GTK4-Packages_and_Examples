
unit thread;
interface

{
  Automatically converted by H2Pas 1.0.0 from thread.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    thread.h
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
PGThread  = ^GThread;
PVipsThreadset  = ^VipsThreadset;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Private include file ... if we've been configured without gthread, we need
 * to point the g_thread_*() and g_mutex_*() functions at our own stubs.
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
{$ifndef VIPS_THREAD_H}
{$define VIPS_THREAD_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
{ We need wrappers over g_mutex_new(), it was replaced by g_mutex_init() in
 * glib 2.32+
  }

function vips_g_mutex_new:PGMutex;cdecl;external;
procedure vips_g_mutex_free(para1:PGMutex);cdecl;external;
{ Same for GCond.
  }
function vips_g_cond_new:PGCond;cdecl;external;
procedure vips_g_cond_free(para1:PGCond);cdecl;external;
{ ... and for GThread.
  }
(* Const before type ignored *)
function vips_g_thread_new(para1:Pchar; para2:TGThreadFunc; para3:Tgpointer):PGThread;cdecl;external;
function vips_thread_isvips:Tgboolean;cdecl;external;
(* Const before type ignored *)
function vips_thread_execute(domain:Pchar; func:TGFunc; data:Tgpointer):longint;cdecl;external;
type

function vips_threadset_new(max_threads:longint):PVipsThreadset;cdecl;external;
(* Const before type ignored *)
function vips_threadset_run(set:PVipsThreadset; domain:Pchar; func:TGFunc; data:Tgpointer):longint;cdecl;external;
procedure vips_threadset_free(set:PVipsThreadset);cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_THREAD_H }

implementation


end.
