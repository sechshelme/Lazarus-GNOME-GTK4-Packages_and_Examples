unit lt_system;

interface

uses
  fp_ltdl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ lt_system.h -- system portability abstraction layer

   Copyright (C) 2004, 2007, 2010-2019, 2021-2022 Free Software
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
{$if !defined LT_SYSTEM_H}

const
  LT_SYSTEM_H = 1;  
{$include <stddef.h>}
{$include <stdlib.h>}
{$include <sys/types.h>}
{ Some systems do not define EXIT_*, even with STDC_HEADERS.   }
{$if !defined EXIT_SUCCESS}

const
  EXIT_SUCCESS = 0;  
{$endif}
{$if !defined EXIT_FAILURE}

const
  EXIT_FAILURE = 1;  
{$endif}
{ Just pick a big number...  }

const
  LT_FILENAME_MAX = 2048;  
{ Saves on those hard to debug '\0' typos....   }
  LT_EOS_CHAR = '\0';  
{ LTDL_BEGIN_C_DECLS should be used at the beginning of your declarations,
   so that C++ compilers don't mangle their names.  Use LTDL_END_C_DECLS at
   the end of C declarations.  }
{ LT_STMT_START/END are used to create macros that expand to a
   a single compound statement in a portable way.   }
{ Canonicalise Windows and Cygwin recognition macros.
   To match the values set by recent Cygwin compilers, make sure that if
   __CYGWIN__ is defined (after canonicalisation), __WINDOWS__ is NOT!   }
{ DLL building support on win32 hosts;  mostly to workaround their
   ridiculous implementation of data symbol exporting.  }
{$endif}
{!defined LT_SYSTEM_H }

// === Konventiert am: 8-9-25 13:57:36 ===


implementation



end.
