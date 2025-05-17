
unit eina_xattr;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_xattr.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_xattr.h
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
Pdouble  = ^double;
PEina_Iterator  = ^Eina_Iterator;
PEina_Xattr  = ^Eina_Xattr;
PEina_Xattr_Flags  = ^Eina_Xattr_Flags;
Plongint  = ^longint;
Pssize_t  = ^ssize_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2011 Cedric Bail
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
{$ifndef EINA_XATTR_H_}
{$define EINA_XATTR_H_}
{$include "eina_types.h"}
{$include <sys/types.h>}
{*
 * @addtogroup Eina_Xattr_Group Xattrs
 * @ingroup Eina_Tools_Group
 * @brief Extended Attributes handling
 *
 * @
  }
{*
 * @typedef Eina_Xattr_Flags
 * define extended attribute creation
 *
 * @since 1.1
  }
{*< This is the default behavior, it will either create or replace the extended attribute  }
{*< This will only succeed if the extended attribute previously existed  }
{*< This will only succeed if the extended attribute wasn't previously set  }
{The definitions below are required in order to have symbols available for the enum definition in eina_types.eot }
{*< This is the default behavior, it will either create or replace the extended attribute  }
{*< This will only succeed if the extended attribute previously existed  }
{*< This will only succeed if the extended attribute wasn't previously set  }
type
  PEina_Xattr_Flags = ^TEina_Xattr_Flags;
  TEina_Xattr_Flags =  Longint;
  Const
    EINA_XATTR_INSERT = 0;
    EINA_XATTR_REPLACE = 1;
    EINA_XATTR_CREATED = 2;
    EINA_XATTR_FLAGS_INSERT = 0;
    EINA_XATTR_FLAGS_REPLACE = 1;
    EINA_XATTR_FLAGS_CREATED = 2;
;
type
(* Const before type ignored *)
{*< The extended attribute name @since 1.2  }
(* Const before type ignored *)
{*< The extended attribute value @since 1.2  }
{*< The length of the extended attribute value @since 1.2  }
  PEina_Xattr = ^TEina_Xattr;
  TEina_Xattr = record
      name : Pchar;
      value : Pchar;
      length : Tsize_t;
    end;

{*
 * @brief Gets an iterator that lists all extended attribute of a file.
 *
 * @param[in] file The filename to retrieve the extended attribute list from.
 * @return an iterator.
 *
 * The iterator will not allocate any data during the iteration step, so you need to copy them yourself
 * if you need.
 *
 * @since 1.1
  }
(* Const before type ignored *)

function eina_xattr_ls(file:Pchar):PEina_Iterator;cdecl;external;
{*
 * @brief Gets an iterator that list all extended attribute value related to a fd.
 *
 * @param[in] file The filename to retrieve the extended attribute list from.
 * @return An iterator.
 *
 * The iterator will not allocate any data during the iteration step, so you need to copy them yourself
 * if you need. The iterator will provide an Eina_Xattr structure.
 *
 * @since 1.2
  }
(* Const before type ignored *)
function eina_xattr_value_ls(file:Pchar):PEina_Iterator;cdecl;external;
{*
 * @brief Gets an iterator that list all extended attribute related to a fd.
 *
 * @param[in] fd The file descriptor to retrieve the extended attribute list from.
 * @return an iterator.
 *
 * The iterator will not allocate any data during the iteration step, so you need to copy them yourself
 * if you need.
 *
 * @since 1.2
  }
function eina_xattr_fd_ls(fd:longint):PEina_Iterator;cdecl;external;
{*
 * @brief Gets an iterator that list all extended attribute value related to a fd.
 *
 * @param[in] fd The file descriptor to retrieve the extended attribute list from.
 * @return An iterator.
 *
 * The iterator will not allocate any data during the iteration step, so you need to copy them yourself
 * if you need. The iterator will provide an Eina_Xattr structure.
 *
 * @since 1.2
  }
function eina_xattr_value_fd_ls(fd:longint):PEina_Iterator;cdecl;external;
{*
 * @brief Copies the extended attribute from one file to another.
 *
 * @param[in] src source file to use as input.
 * @param[in] dst destination file to use as output.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * @see eina_xattr_fd_copy()
 *
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_xattr_copy(src:Pchar; dst:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Copies the extended attribute from one file descriptor to another.
 *
 * @param[in] src source file descriptor to use as input.
 * @param[in] dst destination file descriptor to use as output.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * @see eina_xattr_copy()
 *
 * @since 1.8
  }
function eina_xattr_fd_copy(src:longint; dst:longint):TEina_Bool;cdecl;external;
{*
 * @brief Retrieves an extended attribute from a file.
 *
 * @param[in] file The file to retrieve the extended attribute from.
 * @param[in] attribute The extended attribute name to retrieve.
 * @param[out] size The size of the retrieved extended attribute.
 * @return the allocated data that hold the extended attribute value.
 *
 * It will return @c NULL and *size will be @c 0 if it fails.
 *
 * @since 1.1
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_xattr_get(file:Pchar; attribute:Pchar; size:Pssize_t):pointer;cdecl;external;
{*
 * @brief Retrieves an extended attribute from a file descriptor.
 *
 * @param[in] fd The file descriptor to retrieve the extended attribute from.
 * @param[in] attribute The extended attribute name to retrieve.
 * @param[out] size The size of the retrieved extended attribute.
 * @return the allocated data that hold the extended attribute value.
 *
 * It will return @c NULL and *size will be @c 0 if it fails.
 *
 * @since 1.8
  }
(* Const before type ignored *)
function eina_xattr_fd_get(fd:longint; attribute:Pchar; size:Pssize_t):pointer;cdecl;external;
{*
 * @brief Sets an extended attribute on a file.
 *
 * @param[in] file The file to set the extended attribute to.
 * @param[in] attribute The attribute to set.
 * @param[in] data The data to set.
 * @param[in] length The length of the data to set.
 * @param[in] flags Define the set policy.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * @since 1.1
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eina_xattr_set(file:Pchar; attribute:Pchar; data:pointer; length:Tssize_t; flags:TEina_Xattr_Flags):TEina_Bool;cdecl;external;
{*
 * @brief Sets an extended attribute on a file descriptor.
 *
 * @param[in] fd The file descriptor to set the extended attribute to.
 * @param[in] attribute The attribute to set.
 * @param[in] data The data to set.
 * @param[in] length The length of the data to set.
 * @param[in] flags Define the set policy.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_xattr_fd_set(fd:longint; attribute:Pchar; data:pointer; length:Tssize_t; flags:TEina_Xattr_Flags):TEina_Bool;cdecl;external;
{*
 * @brief Deletes (removes) an extended attribute from a file.
 *
 * @param[in] file The file to del the extended attribute from.
 * @param[in] attribute The attribute to del.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_xattr_del(file:Pchar; attribute:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes (removes) an extended attribute from a file descriptor.
 *
 * @param[in] fd The file descriptor to del the extended attribute from.
 * @param[in] attribute The attribute to del.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * @since 1.8
  }
(* Const before type ignored *)
function eina_xattr_fd_del(fd:longint; attribute:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Sets a string as a extended attribute properties.
 *
 * @param[in] file The file to set the string to.
 * @param[in] attribute The attribute to set.
 * @param[in] data The NULL-terminated string to set.
 * @param[in] flags Define the set policy.
 * @return EINA_TRUE on success, EINA_FALSE otherwise.
 *
 * @since 1.1
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eina_xattr_string_set(file:Pchar; attribute:Pchar; data:Pchar; flags:TEina_Xattr_Flags):TEina_Bool;cdecl;external;
{*
 * @brief Gets a string from an extended attribute properties.
 *
 * @param[in] file The file to get the string from.
 * @param[in] attribute The attribute to get.
 * @return A valid string on success, @c NULL otherwise.
 *
 * This call check that the string is properly NULL-terminated before returning it.
 *
 * @since 1.1
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_xattr_string_get(file:Pchar; attribute:Pchar):Pchar;cdecl;external;
{*
 * @brief Sets a double as a extended attribute properties.
 *
 * @param[in] file The file to set the double to.
 * @param[in] attribute The attribute to set.
 * @param[in] value The NULL-terminated double to set.
 * @param[in] flags Define the set policy.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * @since 1.1
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_xattr_double_set(file:Pchar; attribute:Pchar; value:Tdouble; flags:TEina_Xattr_Flags):TEina_Bool;cdecl;external;
{*
 * @brief Gets a double from an extended attribute properties.
 *
 * @param[in] file The file to get the string from.
 * @param[in] attribute The attribute to get.
 * @param[out] value Where to put the extracted value
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * This call check that the double is correctly set.
 *
 * @since 1.1
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_xattr_double_get(file:Pchar; attribute:Pchar; value:Pdouble):TEina_Bool;cdecl;external;
{*
 * @brief Sets an int as a extended attribute properties.
 *
 * @param[in] file The file to set the int to.
 * @param[in] attribute The attribute to set.
 * @param[in] value The NULL-terminated int to set.
 * @param[in] flags Define the set policy.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * @since 1.1
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_xattr_int_set(file:Pchar; attribute:Pchar; value:longint; flags:TEina_Xattr_Flags):TEina_Bool;cdecl;external;
{*
 * @brief Gets a int from an extended attribute properties.
 *
 * @param[in] file The file to get the string from.
 * @param[in] attribute The attribute to get.
 * @param[out] value Where to put the extracted value
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * This call check that the int is correctly set.
 *
 * @since 1.1
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_xattr_int_get(file:Pchar; attribute:Pchar; value:Plongint):TEina_Bool;cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
