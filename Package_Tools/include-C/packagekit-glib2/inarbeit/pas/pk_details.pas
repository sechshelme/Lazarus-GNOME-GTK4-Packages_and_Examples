unit pk_details;

interface

uses
  fp_glib2, fp_packagekit;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2009 Richard Hughes <richard@hughsie.com>
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
{$if !defined (__PACKAGEKIT_H_INSIDE__) && !defined (PK_COMPILATION)}
{$error "Only <packagekit.h> can be included directly."}
{$endif}
{$ifndef __PK_DETAILS_H}
{$define __PK_DETAILS_H}
{$include <glib-object.h>}
{$include <packagekit-glib2/pk-source.h>}
{$include <packagekit-glib2/pk-enum.h>}

type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkDetails, g_object_unref) }
{$endif}
type
  PPkDetails = ^TPkDetails;
  TPkDetails = record
      parent : TPkSource;
      priv : PPkDetailsPrivate;
    end;

{ padding for future expansion  }
  PPkDetailsClass = ^TPkDetailsClass;
  TPkDetailsClass = record
      parent_class : TPkSourceClass;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;


function pk_details_get_type:TGType;cdecl;external libpackagekit ;
function pk_details_new:PPkDetails;cdecl;external libpackagekit ;
function pk_details_get_package_id(details:PPkDetails):Pgchar;cdecl;external libpackagekit ;
function pk_details_get_license(details:PPkDetails):Pgchar;cdecl;external libpackagekit ;
function pk_details_get_group(details:PPkDetails):TPkGroupEnum;cdecl;external libpackagekit ;
function pk_details_get_description(details:PPkDetails):Pgchar;cdecl;external libpackagekit ;
function pk_details_get_url(details:PPkDetails):Pgchar;cdecl;external libpackagekit ;
function pk_details_get_size(details:PPkDetails):Tguint64;cdecl;external libpackagekit ;
function pk_details_get_summary(details:PPkDetails):Pgchar;cdecl;external libpackagekit ;
function pk_details_get_download_size(details:PPkDetails):Tguint64;cdecl;external libpackagekit ;
{$endif}
{ __PK_DETAILS_H  }

// === Konventiert am: 7-9-26 15:03:20 ===

function PK_TYPE_DETAILS : TGType;
function PK_DETAILS(obj : Pointer) : PPkDetails;
function PK_DETAILS_CLASS(klass : Pointer) : PPkDetailsClass;
function PK_IS_DETAILS(obj : Pointer) : Tgboolean;
function PK_IS_DETAILS_CLASS(klass : Pointer) : Tgboolean;
function PK_DETAILS_GET_CLASS(obj : Pointer) : PPkDetailsClass;

implementation

function PK_TYPE_DETAILS : TGType;
  begin
    PK_TYPE_DETAILS:=pk_details_get_type;
  end;

function PK_DETAILS(obj : Pointer) : PPkDetails;
begin
  Result := PPkDetails(g_type_check_instance_cast(obj, PK_TYPE_DETAILS));
end;

function PK_DETAILS_CLASS(klass : Pointer) : PPkDetailsClass;
begin
  Result := PPkDetailsClass(g_type_check_class_cast(klass, PK_TYPE_DETAILS));
end;

function PK_IS_DETAILS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PK_TYPE_DETAILS);
end;

function PK_IS_DETAILS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PK_TYPE_DETAILS);
end;

function PK_DETAILS_GET_CLASS(obj : Pointer) : PPkDetailsClass;
begin
  Result := PPkDetailsClass(PGTypeInstance(obj)^.g_class);
end;



end.
