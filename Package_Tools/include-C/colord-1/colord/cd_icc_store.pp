
unit cd_icc_store;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_icc_store.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_icc_store.h
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
PCdIcc  = ^CdIcc;
PCdIccStore  = ^CdIccStore;
PCdIccStoreClass  = ^CdIccStoreClass;
PCdIccStoreSearchFlags  = ^CdIccStoreSearchFlags;
PCdIccStoreSearchKind  = ^CdIccStoreSearchKind;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGPtrArray  = ^GPtrArray;
PGResource  = ^GResource;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2009-2013 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
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
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__COLORD_H_INSIDE__) && !defined (CD_COMPILATION)}
{$error "Only <colord.h> can be included directly."}
{$endif}
{$ifndef __CD_ICC_STORE_H}
{$define __CD_ICC_STORE_H}
{$include <glib-object.h>}
{$include "cd-icc.h"}

{ was #define dname def_expr }
function CD_TYPE_ICC_STORE : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (CdIccStore, cd_icc_store, CD, ICC_STORE, GObject) }
type
  PCdIccStoreClass = ^TCdIccStoreClass;
  TCdIccStoreClass = record
      parent_class : TGObjectClass;
      added : procedure (icc:PCdIcc);cdecl;
      removed : procedure (icc:PCdIcc);cdecl;
    end;

{*
 * CdIccStoreSearchFlags:
 * @CD_ICC_STORE_SEARCH_FLAGS_NONE:			No flags set.
 * @CD_ICC_STORE_SEARCH_FLAGS_CREATE_LOCATION:		Create the location if it does not exist
 *
 * Flags used when adding scan locations.
 *
 * Since: 1.1.1
 * }
{ Since: 1.0.2  }
{ Since: 1.0.2  }
{< private > }

  PCdIccStoreSearchFlags = ^TCdIccStoreSearchFlags;
  TCdIccStoreSearchFlags =  Longint;
  Const
    CD_ICC_STORE_SEARCH_FLAGS_NONE = 0;
    CD_ICC_STORE_SEARCH_FLAGS_CREATE_LOCATION = 1;
    CD_ICC_STORE_SEARCH_FLAGS_LAST = 2;
;
{*
 * CdIccStoreSearchKind:
 * @CD_ICC_STORE_SEARCH_KIND_SYSTEM:		Per-system locations
 * @CD_ICC_STORE_SEARCH_KIND_MACHINE:		Per-machine locations
 * @CD_ICC_STORE_SEARCH_KIND_USER:		Per-user locations
 *
 * The kind of profiles locations to search.
 *
 * Since: 1.1.1
 * }
{ Since: 1.0.2  }
{ Since: 1.0.2  }
{ Since: 1.0.2  }
{< private > }
type
  PCdIccStoreSearchKind = ^TCdIccStoreSearchKind;
  TCdIccStoreSearchKind =  Longint;
  Const
    CD_ICC_STORE_SEARCH_KIND_SYSTEM = 0;
    CD_ICC_STORE_SEARCH_KIND_MACHINE = 1;
    CD_ICC_STORE_SEARCH_KIND_USER = 2;
    CD_ICC_STORE_SEARCH_KIND_LAST = 3;
;

function cd_icc_store_new:PCdIccStore;cdecl;external;
(* Const before type ignored *)
function cd_icc_store_search_location(store:PCdIccStore; location:Pgchar; search_flags:TCdIccStoreSearchFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_icc_store_search_kind(store:PCdIccStore; search_kind:TCdIccStoreSearchKind; search_flags:TCdIccStoreSearchFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure cd_icc_store_set_load_flags(store:PCdIccStore; load_flags:TCdIccLoadFlags);cdecl;external;
function cd_icc_store_get_load_flags(store:PCdIccStore):TCdIccLoadFlags;cdecl;external;
procedure cd_icc_store_set_cache(store:PCdIccStore; cache:PGResource);cdecl;external;
function cd_icc_store_get_all(store:PCdIccStore):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function cd_icc_store_find_by_filename(store:PCdIccStore; filename:Pgchar):PCdIcc;cdecl;external;
(* Const before type ignored *)
function cd_icc_store_find_by_checksum(store:PCdIccStore; checksum:Pgchar):PCdIcc;cdecl;external;
{$endif}
{ __CD_ICC_STORE_H  }

implementation

{ was #define dname def_expr }
function CD_TYPE_ICC_STORE : longint; { return type might be wrong }
  begin
    CD_TYPE_ICC_STORE:=cd_icc_store_get_type;
  end;


end.
