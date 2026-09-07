unit pk_update_detail;

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
{$ifndef __PK_UPDATE_DETAIL_H}
{$define __PK_UPDATE_DETAIL_H}
{$include <glib-object.h>}
{$include <packagekit-glib2/pk-source.h>}
{$include <packagekit-glib2/pk-enum.h>}

type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkUpdateDetail, g_object_unref) }
{$endif}
type
  PPkUpdateDetail = ^TPkUpdateDetail;
  TPkUpdateDetail = record
      parent : TPkSource;
      priv : PPkUpdateDetailPrivate;
    end;

{ padding for future expansion  }
  PPkUpdateDetailClass = ^TPkUpdateDetailClass;
  TPkUpdateDetailClass = record
      parent_class : TPkSourceClass;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;


function pk_update_detail_get_type:TGType;cdecl;external libpackagekit ;
function pk_update_detail_new:PPkUpdateDetail;cdecl;external libpackagekit ;
function pk_update_detail_get_package_id(update_detail:PPkUpdateDetail):Pgchar;cdecl;external libpackagekit ;
function pk_update_detail_get_updates(update_detail:PPkUpdateDetail):^Pgchar;cdecl;external libpackagekit ;
function pk_update_detail_get_obsoletes(update_detail:PPkUpdateDetail):^Pgchar;cdecl;external libpackagekit ;
function pk_update_detail_get_vendor_urls(update_detail:PPkUpdateDetail):^Pgchar;cdecl;external libpackagekit ;
function pk_update_detail_get_bugzilla_urls(update_detail:PPkUpdateDetail):^Pgchar;cdecl;external libpackagekit ;
function pk_update_detail_get_cve_urls(update_detail:PPkUpdateDetail):^Pgchar;cdecl;external libpackagekit ;
function pk_update_detail_get_restart(update_detail:PPkUpdateDetail):TPkRestartEnum;cdecl;external libpackagekit ;
function pk_update_detail_get_update_text(update_detail:PPkUpdateDetail):Pgchar;cdecl;external libpackagekit ;
function pk_update_detail_get_changelog(update_detail:PPkUpdateDetail):Pgchar;cdecl;external libpackagekit ;
function pk_update_detail_get_state(update_detail:PPkUpdateDetail):TPkUpdateStateEnum;cdecl;external libpackagekit ;
function pk_update_detail_get_issued(update_detail:PPkUpdateDetail):Pgchar;cdecl;external libpackagekit ;
function pk_update_detail_get_updated(update_detail:PPkUpdateDetail):Pgchar;cdecl;external libpackagekit ;
{$endif}
{ __PK_UPDATE_DETAIL_H  }

// === Konventiert am: 7-9-26 15:13:17 ===

function PK_TYPE_UPDATE_DETAIL : TGType;
function PK_UPDATE_DETAIL(obj : Pointer) : PPkUpdateDetail;
function PK_UPDATE_DETAIL_CLASS(klass : Pointer) : PPkUpdateDetailClass;
function PK_IS_UPDATE_DETAIL(obj : Pointer) : Tgboolean;
function PK_IS_UPDATE_DETAIL_CLASS(klass : Pointer) : Tgboolean;
function PK_UPDATE_DETAIL_GET_CLASS(obj : Pointer) : PPkUpdateDetailClass;

implementation

function PK_TYPE_UPDATE_DETAIL : TGType;
  begin
    PK_TYPE_UPDATE_DETAIL:=pk_update_detail_get_type;
  end;

function PK_UPDATE_DETAIL(obj : Pointer) : PPkUpdateDetail;
begin
  Result := PPkUpdateDetail(g_type_check_instance_cast(obj, PK_TYPE_UPDATE_DETAIL));
end;

function PK_UPDATE_DETAIL_CLASS(klass : Pointer) : PPkUpdateDetailClass;
begin
  Result := PPkUpdateDetailClass(g_type_check_class_cast(klass, PK_TYPE_UPDATE_DETAIL));
end;

function PK_IS_UPDATE_DETAIL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PK_TYPE_UPDATE_DETAIL);
end;

function PK_IS_UPDATE_DETAIL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PK_TYPE_UPDATE_DETAIL);
end;

function PK_UPDATE_DETAIL_GET_CLASS(obj : Pointer) : PPkUpdateDetailClass;
begin
  Result := PPkUpdateDetailClass(PGTypeInstance(obj)^.g_class);
end;



end.
