
unit strlst;
interface

{
  Automatically converted by H2Pas 1.0.0 from strlst.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    strlst.h
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
PAvahiStringList  = ^AvahiStringList;
Pchar  = ^char;
Psize_t  = ^size_t;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef footxtlisthfoo}
{$define footxtlisthfoo}
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
{* \file strlst.h Implementation of a data type to store lists of strings  }
{$include <sys/types.h>}
{$include <inttypes.h>}
{$include <stdarg.h>}
{$include <avahi-common/cdecl.h>}
{$include <avahi-common/gccmacro.h>}
{* Linked list of strings that can contain any number of binary
 * characters, including NUL bytes. An empty list is created by
 * assigning a NULL to a pointer to AvahiStringList. The string list
 * is stored in reverse order, so that appending to the string list is
 * effectively a prepending to the linked list.  This object is used
 * primarily for storing DNS TXT record data.  }
{*< Pointer to the next linked list element  }
{*< Size of text[]  }
{*< Character data  }
type
  PAvahiStringList = ^TAvahiStringList;
  TAvahiStringList = record
      next : PAvahiStringList;
      size : Tsize_t;
      text : array[0..0] of Tuint8_t;
    end;
{* @ \name Construction and destruction  }
{* Create a new string list by taking a variable list of NUL
 * terminated strings. The strings are copied using g_strdup(). The
 * argument list must be terminated by a NULL pointer.  }
(* Const before type ignored *)

function avahi_string_list_new(txt:Pchar; args:array of const):PAvahiStringList;cdecl;external;
function avahi_string_list_new(txt:Pchar):PAvahiStringList;cdecl;external;
{* \cond fulldocs  }
{* Same as avahi_string_list_new() but pass a va_list structure  }
function avahi_string_list_new_va(va:Tva_list):PAvahiStringList;cdecl;external;
{* \endcond  }
{* Create a new string list from a string array. The strings are
 * copied using g_strdup(). length should contain the length of the
 * array, or -1 if the array is NULL terminated }
(* Const before type ignored *)
function avahi_string_list_new_from_array(array:PPchar; length:longint):PAvahiStringList;cdecl;external;
{* Free a string list  }
procedure avahi_string_list_free(l:PAvahiStringList);cdecl;external;
{* @  }
{* @ \name Adding strings  }
{* Append a NUL terminated string to the specified string list. The
 * passed string is copied using g_strdup(). Returns the new list
 * start.  }
(* Const before type ignored *)
function avahi_string_list_add(l:PAvahiStringList; text:Pchar):PAvahiStringList;cdecl;external;
{* Append a new NUL terminated formatted string to the specified string list  }
(* Const before type ignored *)
function avahi_string_list_add_printf(l:PAvahiStringList; format:Pchar; args:array of const):PAvahiStringList;cdecl;external;
function avahi_string_list_add_printf(l:PAvahiStringList; format:Pchar):PAvahiStringList;cdecl;external;
{* \cond fulldocs  }
{* Append a new NUL terminated formatted string to the specified string list  }
(* Const before type ignored *)
function avahi_string_list_add_vprintf(l:PAvahiStringList; format:Pchar; va:Tva_list):PAvahiStringList;cdecl;external;
{* \endcond  }
{* Append an arbitrary length byte string to the list. Returns the
 * new list start.  }
(* Const before type ignored *)
function avahi_string_list_add_arbitrary(l:PAvahiStringList; text:Puint8_t; size:Tsize_t):PAvahiStringList;cdecl;external;
{* Append a new entry to the string list. The string is not filled
with data. The caller should fill in string data afterwards by writing
it to l->text, where l is the pointer returned by this function. This
function exists solely to optimize a few operations where otherwise
superfluous string copying would be necessary.  }
function avahi_string_list_add_anonymous(l:PAvahiStringList; size:Tsize_t):PAvahiStringList;cdecl;external;
{* Same as avahi_string_list_add(), but takes a variable number of
 * NUL terminated strings. The argument list must be terminated by a
 * NULL pointer. Returns the new list start.  }
function avahi_string_list_add_many(r:PAvahiStringList; args:array of const):PAvahiStringList;cdecl;external;
function avahi_string_list_add_many(r:PAvahiStringList):PAvahiStringList;cdecl;external;
{* \cond fulldocs  }
{* Same as avahi_string_list_add_many(), but use a va_list
 * structure. Returns the new list start.  }
function avahi_string_list_add_many_va(r:PAvahiStringList; va:Tva_list):PAvahiStringList;cdecl;external;
{* \endcond  }
{* @  }
{* @ \name String list operations  }
{* Convert the string list object to a single character string,
 * seperated by spaces and enclosed in "". avahi_free() the result! This
 * function doesn't work well with strings that contain NUL bytes.  }
function avahi_string_list_to_string(l:PAvahiStringList):Pchar;cdecl;external;
{* \cond fulldocs  }
{* Serialize the string list object in a way that is compatible with
 * the storing of DNS TXT records. Strings longer than 255 bytes are truncated.  }
function avahi_string_list_serialize(l:PAvahiStringList; data:pointer; size:Tsize_t):Tsize_t;cdecl;external;
{* Inverse of avahi_string_list_serialize()  }
(* Const before type ignored *)
function avahi_string_list_parse(data:pointer; size:Tsize_t; ret:PPAvahiStringList):longint;cdecl;external;
{* \endcond  }
{* Compare to string lists  }
(* Const before type ignored *)
(* Const before type ignored *)
function avahi_string_list_equal(a:PAvahiStringList; b:PAvahiStringList):longint;cdecl;external;
{* Copy a string list  }
(* Const before type ignored *)
function avahi_string_list_copy(l:PAvahiStringList):PAvahiStringList;cdecl;external;
{* Reverse the string list.  }
function avahi_string_list_reverse(l:PAvahiStringList):PAvahiStringList;cdecl;external;
{* Return the number of elements in the string list  }
(* Const before type ignored *)
function avahi_string_list_length(l:PAvahiStringList):dword;cdecl;external;
{* @  }
{* @ \name Accessing items  }
{* Returns the next item in the string list  }
function avahi_string_list_get_next(l:PAvahiStringList):PAvahiStringList;cdecl;external;
{* Returns the text for the current item  }
function avahi_string_list_get_text(l:PAvahiStringList):Puint8_t;cdecl;external;
{* Returns the size of the current text  }
function avahi_string_list_get_size(l:PAvahiStringList):Tsize_t;cdecl;external;
{* @  }
{* @ \name DNS-SD TXT pair handling  }
{* Find the string list entry for the given DNS-SD TXT key  }
(* Const before type ignored *)
function avahi_string_list_find(l:PAvahiStringList; key:Pchar):PAvahiStringList;cdecl;external;
{* Return the DNS-SD TXT key and value for the specified string list
 * item. If size is not NULL it will be filled with the length of
 * value. (for strings containing NUL bytes). If the entry doesn't
 * contain a value *value will be set to NULL. You need to
 * avahi_free() the strings returned in *key and *value.  }
function avahi_string_list_get_pair(l:PAvahiStringList; key:PPchar; value:PPchar; size:Psize_t):longint;cdecl;external;
{* Add a new DNS-SD TXT key value pair to the string list. value may
 * be NULL in case you want to specify a key without a value  }
(* Const before type ignored *)
(* Const before type ignored *)
function avahi_string_list_add_pair(l:PAvahiStringList; key:Pchar; value:Pchar):PAvahiStringList;cdecl;external;
{* Same as avahi_string_list_add_pair() but allow strings containing NUL bytes in *value.  }
(* Const before type ignored *)
(* Const before type ignored *)
function avahi_string_list_add_pair_arbitrary(l:PAvahiStringList; key:Pchar; value:Puint8_t; size:Tsize_t):PAvahiStringList;cdecl;external;
{* @  }
{* \cond fulldocs  }
{* Try to find a magic service cookie in the specified DNS-SD string
 * list. Or return AVAHI_SERVICE_COOKIE_INVALID if none is found.  }
function avahi_string_list_get_service_cookie(l:PAvahiStringList):Tuint32_t;cdecl;external;
{* \endcond  }
{$endif}

implementation


end.
