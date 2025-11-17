
unit gphoto2_list;
interface

{
  Automatically converted by H2Pas 1.0.0 from gphoto2_list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gphoto2_list.h
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
PCameraList  = ^CameraList;
Pchar  = ^char;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file gphoto2-list.h
 *
 * Lists of files, folders, cameras, etc.
 *
 * \author Copyright 2001 Scott Fritzinger
 *
 * \note
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * \note
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * \note
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA
  }
{$ifndef LIBGPHOTO2_GPHOTO2_LIST_H}
{$define LIBGPHOTO2_GPHOTO2_LIST_H}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * \brief A generic list
 *
 * This structure provides a list with \a name:value pairs that is used in various
 * parts of libgphoto2. Its details are internal, please use the
 * gp_list_xxx accessor functions.
 *
 * Usage pattern for CameraList for users external of
 * libgphoto2, such as libgphoto2 frontends:
 *
 * \code
 *    CameraList *list;
 *    gp_list_new (&list);
 *    init_list_somehow (list);
 *    for (i=0; i < gp_list_count(list); i++) 
 *        char *name, *value;
 *        gp_list_get_name (list, i, &name);
 *        gp_list_get_name (list, i, &value);
 *        do_something_with (name, value);
 *    
 *    gp_list_free (list);
 * \endcode
 *
 * Please do NOT directly instantiate a CameraList object like this:
 * \code
 *               CameraList foo;     // DO NOT DO THIS
 * \endcode
 *
 * Please do NOT directly access the structure members like this:
 * \code
 *               list->entry[i].name // DO NOT DO THIS
 * \endcode
  }
type

function gp_list_new(list:PPCameraList):longint;cdecl;external;
function gp_list_ref(list:PCameraList):longint;cdecl;external;
function gp_list_unref(list:PCameraList):longint;cdecl;external;
function gp_list_free(list:PCameraList):longint;cdecl;external;
function gp_list_count(list:PCameraList):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gp_list_append(list:PCameraList; name:Pchar; value:Pchar):longint;cdecl;external;
function gp_list_reset(list:PCameraList):longint;cdecl;external;
function gp_list_sort(list:PCameraList):longint;cdecl;external;
(* Const before type ignored *)
function gp_list_find_by_name(list:PCameraList; index:Plongint; name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_list_get_name(list:PCameraList; index:longint; name:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_list_get_value(list:PCameraList; index:longint; value:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_list_set_name(list:PCameraList; index:longint; name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_list_set_value(list:PCameraList; index:longint; value:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_list_populate(list:PCameraList; format:Pchar; count:longint):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ !defined(LIBGPHOTO2_GPHOTO2_LIST_H)  }

implementation


end.
