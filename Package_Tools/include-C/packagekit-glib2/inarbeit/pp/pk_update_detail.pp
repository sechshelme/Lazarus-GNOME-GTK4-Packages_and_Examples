
unit pk_update_detail;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_update_detail.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_update_detail.h
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
Pgchar  = ^gchar;
PPkUpdateDetail  = ^PkUpdateDetail;
PPkUpdateDetailClass  = ^PkUpdateDetailClass;
PPkUpdateDetailPrivate  = ^PkUpdateDetailPrivate;
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

{ was #define dname def_expr }
function PK_TYPE_UPDATE_DETAIL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_UPDATE_DETAIL(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_UPDATE_DETAIL_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_UPDATE_DETAIL(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_UPDATE_DETAIL_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_UPDATE_DETAIL_GET_CLASS(o : longint) : longint;

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


function pk_update_detail_get_type:TGType;cdecl;external;
function pk_update_detail_new:PPkUpdateDetail;cdecl;external;
(* Const before type ignored *)
function pk_update_detail_get_package_id(update_detail:PPkUpdateDetail):Pgchar;cdecl;external;
function pk_update_detail_get_updates(update_detail:PPkUpdateDetail):^Pgchar;cdecl;external;
function pk_update_detail_get_obsoletes(update_detail:PPkUpdateDetail):^Pgchar;cdecl;external;
function pk_update_detail_get_vendor_urls(update_detail:PPkUpdateDetail):^Pgchar;cdecl;external;
function pk_update_detail_get_bugzilla_urls(update_detail:PPkUpdateDetail):^Pgchar;cdecl;external;
function pk_update_detail_get_cve_urls(update_detail:PPkUpdateDetail):^Pgchar;cdecl;external;
function pk_update_detail_get_restart(update_detail:PPkUpdateDetail):TPkRestartEnum;cdecl;external;
(* Const before type ignored *)
function pk_update_detail_get_update_text(update_detail:PPkUpdateDetail):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_update_detail_get_changelog(update_detail:PPkUpdateDetail):Pgchar;cdecl;external;
function pk_update_detail_get_state(update_detail:PPkUpdateDetail):TPkUpdateStateEnum;cdecl;external;
(* Const before type ignored *)
function pk_update_detail_get_issued(update_detail:PPkUpdateDetail):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_update_detail_get_updated(update_detail:PPkUpdateDetail):Pgchar;cdecl;external;
{$endif}
{ __PK_UPDATE_DETAIL_H  }

implementation

{ was #define dname def_expr }
function PK_TYPE_UPDATE_DETAIL : longint; { return type might be wrong }
  begin
    PK_TYPE_UPDATE_DETAIL:=pk_update_detail_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_UPDATE_DETAIL(o : longint) : longint;
begin
  PK_UPDATE_DETAIL:=G_TYPE_CHECK_INSTANCE_CAST(o,PK_TYPE_UPDATE_DETAIL,PkUpdateDetail);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_UPDATE_DETAIL_CLASS(k : longint) : longint;
begin
  PK_UPDATE_DETAIL_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,PK_TYPE_UPDATE_DETAIL,PkUpdateDetailClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_UPDATE_DETAIL(o : longint) : longint;
begin
  PK_IS_UPDATE_DETAIL:=G_TYPE_CHECK_INSTANCE_TYPE(o,PK_TYPE_UPDATE_DETAIL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_UPDATE_DETAIL_CLASS(k : longint) : longint;
begin
  PK_IS_UPDATE_DETAIL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,PK_TYPE_UPDATE_DETAIL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_UPDATE_DETAIL_GET_CLASS(o : longint) : longint;
begin
  PK_UPDATE_DETAIL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,PK_TYPE_UPDATE_DETAIL,PkUpdateDetailClass);
end;


end.
