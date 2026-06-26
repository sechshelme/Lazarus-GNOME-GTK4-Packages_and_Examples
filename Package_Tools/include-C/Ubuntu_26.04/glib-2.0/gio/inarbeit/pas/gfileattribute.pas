unit gfileattribute;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_FILE_ATTRIBUTE_H__}
{$define __G_FILE_ATTRIBUTE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{*
 * GFileAttributeInfo:
 * @name: the name of the attribute.
 * @type: the #GFileAttributeType type of the attribute.
 * @flags: a set of #GFileAttributeInfoFlags.
 *
 * Information about a specific attribute.
 * }
type
  PGFileAttributeInfo = ^TGFileAttributeInfo;
  TGFileAttributeInfo = record
      name : Pchar;
      _type : TGFileAttributeType;
      flags : TGFileAttributeInfoFlags;
    end;

{*
 * GFileAttributeInfoList:
 * @infos: an array of #GFileAttributeInfos.
 * @n_infos: the number of values in the array.
 *
 * Acts as a lightweight registry for possible valid file attributes.
 * The registry stores Key-Value pair formats as #GFileAttributeInfos.
 * }
{ will never be negative; it’s a historical accident that this isn’t a size_t  }
  PGFileAttributeInfoList = ^TGFileAttributeInfoList;
  TGFileAttributeInfoList = record
      infos : PGFileAttributeInfo;
      n_infos : longint;
    end;


function g_file_attribute_info_list_get_type:TGType;cdecl;external libgio2;
function g_file_attribute_info_list_new:PGFileAttributeInfoList;cdecl;external libgio2;
function g_file_attribute_info_list_ref(list:PGFileAttributeInfoList):PGFileAttributeInfoList;cdecl;external libgio2;
procedure g_file_attribute_info_list_unref(list:PGFileAttributeInfoList);cdecl;external libgio2;
function g_file_attribute_info_list_dup(list:PGFileAttributeInfoList):PGFileAttributeInfoList;cdecl;external libgio2;
function g_file_attribute_info_list_lookup(list:PGFileAttributeInfoList; name:Pchar):PGFileAttributeInfo;cdecl;external libgio2;
procedure g_file_attribute_info_list_add(list:PGFileAttributeInfoList; name:Pchar; _type:TGFileAttributeType; flags:TGFileAttributeInfoFlags);cdecl;external libgio2;
{$endif}
{ __G_FILE_INFO_H__  }

// === Konventiert am: 26-6-26 19:22:30 ===

function G_TYPE_FILE_ATTRIBUTE_INFO_LIST : TGType;

implementation

function G_TYPE_FILE_ATTRIBUTE_INFO_LIST : TGType;
  begin
    G_TYPE_FILE_ATTRIBUTE_INFO_LIST:=g_file_attribute_info_list_get_type;
  end;



end.
