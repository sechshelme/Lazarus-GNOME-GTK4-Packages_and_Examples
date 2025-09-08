unit lt_dlloader;

interface

uses
  fp_ltdl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ lt_dlloader.h -- dynamic library loader interface

   Copyright (C) 2004, 2007-2008, 2011-2019, 2021-2022 Free Software
   Foundation, Inc.
   Written by Gary V. Vaughan, 2004

   NOTE: The canonical source of this file is maintained with the
   GNU Libtool package.  Report bugs to bug-libtool@gnu.org.

GNU Libltdl is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2 of the License, or (at your option) any later version.

As a special exception to the GNU Lesser General Public License,
if you distribute this file as part of a program or library that
is built using GNU Libtool, you may include this file under the
same distribution terms that you use for the rest of that program.

GNU Libltdl is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with GNU Libltdl; see the file COPYING.LIB.  If not, a
copy can be downloaded from  http://www.gnu.org/licenses/lgpl.html,
or obtained by writing to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 }
{$if !defined LT_DLLOADER_H}

const
  LT_DLLOADER_H = 1;  
{$include <libltdl/lt_system.h>}
type
  Plt_dlloader = ^Tlt_dlloader;
  Tlt_dlloader = pointer;

  Plt_module = ^Tlt_module;
  Tlt_module = pointer;

  Plt_user_data = ^Tlt_user_data;
  Tlt_user_data = pointer;

  Plt_dladvise = ^Tlt_dladvise;
  Tlt_dladvise = Plt__advise;
{ Function pointer types for module loader vtable entries:   }

  Tlt_module_open = function (data:Tlt_user_data; filename:Pchar; advise:Tlt_dladvise):Tlt_module;cdecl;

  Tlt_module_close = function (data:Tlt_user_data; module:Tlt_module):longint;cdecl;

  Plt_find_sym = ^Tlt_find_sym;
  Tlt_find_sym = function (data:Tlt_user_data; module:Tlt_module; symbolname:Pchar):pointer;cdecl;

  Tlt_dlloader_init = function (data:Tlt_user_data):longint;cdecl;

  Tlt_dlloader_exit = function (data:Tlt_user_data):longint;cdecl;
{ Default priority is LT_DLLOADER_PREPEND if none is explicitly given.   }

  Plt_dlloader_priority = ^Tlt_dlloader_priority;
  Tlt_dlloader_priority =  Longint;
  Const
    LT_DLLOADER_PREPEND = 0;
    LT_DLLOADER_APPEND = 1;
;
{ This structure defines a module loader, as populated by the get_vtable
   entry point of each loader.   }
type
  Plt_dlvtable = ^Tlt_dlvtable;
  Tlt_dlvtable = record
      name : Pchar;
      sym_prefix : Pchar;
      module_open : Plt_module_open;
      module_close : Plt_module_close;
      find_sym : Plt_find_sym;
      dlloader_init : Plt_dlloader_init;
      dlloader_exit : Plt_dlloader_exit;
      dlloader_data : Tlt_user_data;
      priority : Tlt_dlloader_priority;
    end;

function lt_dlloader_add(vtable:Plt_dlvtable):longint;cdecl;external libltdl;
function lt_dlloader_next(loader:Tlt_dlloader):Tlt_dlloader;cdecl;external libltdl;
function lt_dlloader_remove(name:Pchar):Plt_dlvtable;cdecl;external libltdl;
function lt_dlloader_find(name:Pchar):Plt_dlvtable;cdecl;external libltdl;
function lt_dlloader_get(loader:Tlt_dlloader):Plt_dlvtable;cdecl;external libltdl;
{ Type of a function to get a loader's vtable:   }
type
  Plt_get_vtable = ^Tlt_get_vtable;
  Tlt_get_vtable = function (data:Tlt_user_data):Plt_dlvtable;cdecl;
{$ifdef LT_DEBUG_LOADERS}

procedure lt_dlloader_dump;cdecl;external libltdl;
{$endif}
{$endif}
{!defined LT_DLLOADER_H }

// === Konventiert am: 8-9-25 13:57:31 ===


implementation



end.
