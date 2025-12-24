
unit malloc;
interface

{
  Automatically converted by H2Pas 1.0.0 from malloc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    malloc.h
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
PAvahiAllocator  = ^AvahiAllocator;
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef foomallochfoo}
{$define foomallochfoo}
{**
  This file is part of avahi.

  avahi is free software; you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License as
  published by the Free Software Foundation; either version 2.1 of the
  License, or (at your option) any later version.

  avahi is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General
  Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with avahi; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
  USA.
** }
{* \file malloc.h Memory allocation  }
{$include <sys/types.h>}
{$include <stdarg.h>}
{$include <limits.h>}
{$include <assert.h>}
{$include <avahi-common/cdecl.h>}
{$include <avahi-common/gccmacro.h>}
{* Allocate some memory, just like the libc malloc()  }

function avahi_malloc(size:Tsize_t):pointer;cdecl;external;
{* Similar to avahi_malloc() but set the memory to zero  }
function avahi_malloc0(size:Tsize_t):pointer;cdecl;external;
{* Free some memory  }
procedure avahi_free(p:pointer);cdecl;external;
{* Similar to libc's realloc()  }
function avahi_realloc(p:pointer; size:Tsize_t):pointer;cdecl;external;
{* Internal helper for avahi_new()  }
{* Just like libc's strdup()  }
(* Const before type ignored *)
function avahi_strdup(s:Pchar):Pchar;cdecl;external;
{* Just like libc's strndup()  }
(* Const before type ignored *)
function avahi_strndup(s:Pchar; l:Tsize_t):Pchar;cdecl;external;
{* Duplicate the given memory block into a new one allocated with avahi_malloc()  }
(* Const before type ignored *)
function avahi_memdup(s:pointer; l:Tsize_t):pointer;cdecl;external;
{* Wraps allocator functions  }
{*< May be NULL  }
type
  PAvahiAllocator = ^TAvahiAllocator;
  TAvahiAllocator = record
      malloc : function (size:Tsize_t):pointer;cdecl;
      free : procedure (p:pointer);cdecl;
      realloc : function (p:pointer; size:Tsize_t):pointer;cdecl;
      calloc : function (nmemb:Tsize_t; size:Tsize_t):pointer;cdecl;
    end;
{* Change the allocator. May be NULL to return to default (libc)
 * allocators. The structure is not copied!  }
(* Const before type ignored *)

procedure avahi_set_allocator(a:PAvahiAllocator);cdecl;external;
{* Like sprintf() but store the result in a freshly allocated buffer. Free this with avahi_free()  }
(* Const before type ignored *)
function avahi_strdup_printf(fmt:Pchar; args:array of const):Pchar;cdecl;external;
function avahi_strdup_printf(fmt:Pchar):Pchar;cdecl;external;
{* \cond fulldocs  }
{* Same as avahi_strdup_printf() but take a va_list instead of varargs  }
(* Const before type ignored *)
function avahi_strdup_vprintf(fmt:Pchar; ap:Tva_list):Pchar;cdecl;external;
{* \endcond  }
{$endif}

implementation


end.
