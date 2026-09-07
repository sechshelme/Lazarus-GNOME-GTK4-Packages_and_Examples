
unit pk_results;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_results.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_results.h
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
PGPtrArray  = ^GPtrArray;
PPkCategory  = ^PkCategory;
PPkDetails  = ^PkDetails;
PPkDistroUpgrade  = ^PkDistroUpgrade;
PPkError  = ^PkError;
PPkEulaRequired  = ^PkEulaRequired;
PPkFiles  = ^PkFiles;
PPkMediaChangeRequired  = ^PkMediaChangeRequired;
PPkPackage  = ^PkPackage;
PPkPackageSack  = ^PkPackageSack;
PPkRepoDetail  = ^PkRepoDetail;
PPkRepoSignatureRequired  = ^PkRepoSignatureRequired;
PPkRequireRestart  = ^PkRequireRestart;
PPkResults  = ^PkResults;
PPkResultsClass  = ^PkResultsClass;
PPkResultsPrivate  = ^PkResultsPrivate;
PPkTransactionPast  = ^PkTransactionPast;
PPkUpdateDetail  = ^PkUpdateDetail;
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
{$ifndef __PK_RESULTS_H}
{$define __PK_RESULTS_H}
{$include <glib-object.h>}
{$include <packagekit-glib2/pk-bitfield.h>}
{$include <packagekit-glib2/pk-category.h>}
{$include <packagekit-glib2/pk-details.h>}
{$include <packagekit-glib2/pk-distro-upgrade.h>}
{$include <packagekit-glib2/pk-enum.h>}
{$include <packagekit-glib2/pk-error.h>}
{$include <packagekit-glib2/pk-eula-required.h>}
{$include <packagekit-glib2/pk-files.h>}
{$include <packagekit-glib2/pk-media-change-required.h>}
{$include <packagekit-glib2/pk-package-sack.h>}
{$include <packagekit-glib2/pk-repo-detail.h>}
{$include <packagekit-glib2/pk-repo-signature-required.h>}
{$include <packagekit-glib2/pk-require-restart.h>}
{$include <packagekit-glib2/pk-transaction-past.h>}
{$include <packagekit-glib2/pk-update-detail.h>}

{ was #define dname def_expr }
function PK_TYPE_RESULTS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_RESULTS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_RESULTS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_RESULTS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_RESULTS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_RESULTS_GET_CLASS(o : longint) : longint;

{ was #define dname def_expr }
function PK_RESULTS_TYPE_ERROR : longint; { return type might be wrong }

type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkResults, g_object_unref) }
{$endif}
type
  PPkResults = ^TPkResults;
  TPkResults = record
      parent : TGObject;
      priv : PPkResultsPrivate;
    end;

{ padding for future expansion  }
  PPkResultsClass = ^TPkResultsClass;
  TPkResultsClass = record
      parent_class : TGObjectClass;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;


function pk_results_get_type:TGType;cdecl;external;
function pk_results_new:PPkResults;cdecl;external;
{ set  }
function pk_results_set_exit_code(results:PPkResults; exit_enum:TPkExitEnum):Tgboolean;cdecl;external;
function pk_results_set_role(results:PPkResults; role:TPkRoleEnum):Tgboolean;cdecl;external;
function pk_results_set_error_code(results:PPkResults; item:PPkError):Tgboolean;cdecl;external;
{ add  }
function pk_results_add_package(results:PPkResults; item:PPkPackage):Tgboolean;cdecl;external;
function pk_results_add_details(results:PPkResults; item:PPkDetails):Tgboolean;cdecl;external;
function pk_results_add_update_detail(results:PPkResults; item:PPkUpdateDetail):Tgboolean;cdecl;external;
function pk_results_add_category(results:PPkResults; item:PPkCategory):Tgboolean;cdecl;external;
function pk_results_add_distro_upgrade(results:PPkResults; item:PPkDistroUpgrade):Tgboolean;cdecl;external;
function pk_results_add_require_restart(results:PPkResults; item:PPkRequireRestart):Tgboolean;cdecl;external;
function pk_results_add_transaction(results:PPkResults; item:PPkTransactionPast):Tgboolean;cdecl;external;
function pk_results_add_files(results:PPkResults; item:PPkFiles):Tgboolean;cdecl;external;
function pk_results_add_repo_signature_required(results:PPkResults; item:PPkRepoSignatureRequired):Tgboolean;cdecl;external;
function pk_results_add_eula_required(results:PPkResults; item:PPkEulaRequired):Tgboolean;cdecl;external;
function pk_results_add_media_change_required(results:PPkResults; item:PPkMediaChangeRequired):Tgboolean;cdecl;external;
function pk_results_add_repo_detail(results:PPkResults; item:PPkRepoDetail):Tgboolean;cdecl;external;
{ get single data  }
function pk_results_get_exit_code(results:PPkResults):TPkExitEnum;cdecl;external;
function pk_results_get_package_sack(results:PPkResults):PPkPackageSack;cdecl;external;
function pk_results_get_error_code(results:PPkResults):PPkError;cdecl;external;
function pk_results_get_role(results:PPkResults):TPkRoleEnum;cdecl;external;
function pk_results_get_transaction_flags(results:PPkResults):TPkBitfield;cdecl;external;
function pk_results_get_require_restart_worst(results:PPkResults):TPkRestartEnum;cdecl;external;
{ get array objects  }
function pk_results_get_package_array(results:PPkResults):PGPtrArray;cdecl;external;
function pk_results_get_details_array(results:PPkResults):PGPtrArray;cdecl;external;
function pk_results_get_update_detail_array(results:PPkResults):PGPtrArray;cdecl;external;
function pk_results_get_category_array(results:PPkResults):PGPtrArray;cdecl;external;
function pk_results_get_distro_upgrade_array(results:PPkResults):PGPtrArray;cdecl;external;
function pk_results_get_require_restart_array(results:PPkResults):PGPtrArray;cdecl;external;
function pk_results_get_transaction_array(results:PPkResults):PGPtrArray;cdecl;external;
function pk_results_get_files_array(results:PPkResults):PGPtrArray;cdecl;external;
function pk_results_get_repo_signature_required_array(results:PPkResults):PGPtrArray;cdecl;external;
function pk_results_get_eula_required_array(results:PPkResults):PGPtrArray;cdecl;external;
function pk_results_get_media_change_required_array(results:PPkResults):PGPtrArray;cdecl;external;
function pk_results_get_repo_detail_array(results:PPkResults):PGPtrArray;cdecl;external;
{$endif}
{ __PK_RESULTS_H  }

implementation

{ was #define dname def_expr }
function PK_TYPE_RESULTS : longint; { return type might be wrong }
  begin
    PK_TYPE_RESULTS:=pk_results_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_RESULTS(o : longint) : longint;
begin
  PK_RESULTS:=G_TYPE_CHECK_INSTANCE_CAST(o,PK_TYPE_RESULTS,PkResults);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_RESULTS_CLASS(k : longint) : longint;
begin
  PK_RESULTS_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,PK_TYPE_RESULTS,PkResultsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_RESULTS(o : longint) : longint;
begin
  PK_IS_RESULTS:=G_TYPE_CHECK_INSTANCE_TYPE(o,PK_TYPE_RESULTS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_RESULTS_CLASS(k : longint) : longint;
begin
  PK_IS_RESULTS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,PK_TYPE_RESULTS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_RESULTS_GET_CLASS(o : longint) : longint;
begin
  PK_RESULTS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,PK_TYPE_RESULTS,PkResultsClass);
end;

{ was #define dname def_expr }
function PK_RESULTS_TYPE_ERROR : longint; { return type might be wrong }
  begin
    PK_RESULTS_TYPE_ERROR:=pk_results_error_get_type;
  end;


end.
