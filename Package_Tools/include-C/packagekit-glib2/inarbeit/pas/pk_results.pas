unit pk_results;

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


function pk_results_get_type:TGType;cdecl;external libpackagekit ;
function pk_results_new:PPkResults;cdecl;external libpackagekit ;
{ set  }
function pk_results_set_exit_code(results:PPkResults; exit_enum:TPkExitEnum):Tgboolean;cdecl;external libpackagekit ;
function pk_results_set_role(results:PPkResults; role:TPkRoleEnum):Tgboolean;cdecl;external libpackagekit ;
function pk_results_set_error_code(results:PPkResults; item:PPkError):Tgboolean;cdecl;external libpackagekit ;
{ add  }
function pk_results_add_package(results:PPkResults; item:PPkPackage):Tgboolean;cdecl;external libpackagekit ;
function pk_results_add_details(results:PPkResults; item:PPkDetails):Tgboolean;cdecl;external libpackagekit ;
function pk_results_add_update_detail(results:PPkResults; item:PPkUpdateDetail):Tgboolean;cdecl;external libpackagekit ;
function pk_results_add_category(results:PPkResults; item:PPkCategory):Tgboolean;cdecl;external libpackagekit ;
function pk_results_add_distro_upgrade(results:PPkResults; item:PPkDistroUpgrade):Tgboolean;cdecl;external libpackagekit ;
function pk_results_add_require_restart(results:PPkResults; item:PPkRequireRestart):Tgboolean;cdecl;external libpackagekit ;
function pk_results_add_transaction(results:PPkResults; item:PPkTransactionPast):Tgboolean;cdecl;external libpackagekit ;
function pk_results_add_files(results:PPkResults; item:PPkFiles):Tgboolean;cdecl;external libpackagekit ;
function pk_results_add_repo_signature_required(results:PPkResults; item:PPkRepoSignatureRequired):Tgboolean;cdecl;external libpackagekit ;
function pk_results_add_eula_required(results:PPkResults; item:PPkEulaRequired):Tgboolean;cdecl;external libpackagekit ;
function pk_results_add_media_change_required(results:PPkResults; item:PPkMediaChangeRequired):Tgboolean;cdecl;external libpackagekit ;
function pk_results_add_repo_detail(results:PPkResults; item:PPkRepoDetail):Tgboolean;cdecl;external libpackagekit ;
{ get single data  }
function pk_results_get_exit_code(results:PPkResults):TPkExitEnum;cdecl;external libpackagekit ;
function pk_results_get_package_sack(results:PPkResults):PPkPackageSack;cdecl;external libpackagekit ;
function pk_results_get_error_code(results:PPkResults):PPkError;cdecl;external libpackagekit ;
function pk_results_get_role(results:PPkResults):TPkRoleEnum;cdecl;external libpackagekit ;
function pk_results_get_transaction_flags(results:PPkResults):TPkBitfield;cdecl;external libpackagekit ;
function pk_results_get_require_restart_worst(results:PPkResults):TPkRestartEnum;cdecl;external libpackagekit ;
{ get array objects  }
function pk_results_get_package_array(results:PPkResults):PGPtrArray;cdecl;external libpackagekit ;
function pk_results_get_details_array(results:PPkResults):PGPtrArray;cdecl;external libpackagekit ;
function pk_results_get_update_detail_array(results:PPkResults):PGPtrArray;cdecl;external libpackagekit ;
function pk_results_get_category_array(results:PPkResults):PGPtrArray;cdecl;external libpackagekit ;
function pk_results_get_distro_upgrade_array(results:PPkResults):PGPtrArray;cdecl;external libpackagekit ;
function pk_results_get_require_restart_array(results:PPkResults):PGPtrArray;cdecl;external libpackagekit ;
function pk_results_get_transaction_array(results:PPkResults):PGPtrArray;cdecl;external libpackagekit ;
function pk_results_get_files_array(results:PPkResults):PGPtrArray;cdecl;external libpackagekit ;
function pk_results_get_repo_signature_required_array(results:PPkResults):PGPtrArray;cdecl;external libpackagekit ;
function pk_results_get_eula_required_array(results:PPkResults):PGPtrArray;cdecl;external libpackagekit ;
function pk_results_get_media_change_required_array(results:PPkResults):PGPtrArray;cdecl;external libpackagekit ;
function pk_results_get_repo_detail_array(results:PPkResults):PGPtrArray;cdecl;external libpackagekit ;
{$endif}
{ __PK_RESULTS_H  }

// === Konventiert am: 7-9-26 15:13:46 ===

function PK_TYPE_RESULTS : TGType;
function PK_RESULTS(obj : Pointer) : PPkResults;
function PK_RESULTS_CLASS(klass : Pointer) : PPkResultsClass;
function PK_IS_RESULTS(obj : Pointer) : Tgboolean;
function PK_IS_RESULTS_CLASS(klass : Pointer) : Tgboolean;
function PK_RESULTS_GET_CLASS(obj : Pointer) : PPkResultsClass;

implementation

function PK_TYPE_RESULTS : TGType;
  begin
    PK_TYPE_RESULTS:=pk_results_get_type;
  end;

function PK_RESULTS(obj : Pointer) : PPkResults;
begin
  Result := PPkResults(g_type_check_instance_cast(obj, PK_TYPE_RESULTS));
end;

function PK_RESULTS_CLASS(klass : Pointer) : PPkResultsClass;
begin
  Result := PPkResultsClass(g_type_check_class_cast(klass, PK_TYPE_RESULTS));
end;

function PK_IS_RESULTS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PK_TYPE_RESULTS);
end;

function PK_IS_RESULTS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PK_TYPE_RESULTS);
end;

function PK_RESULTS_GET_CLASS(obj : Pointer) : PPkResultsClass;
begin
  Result := PPkResultsClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function PK_RESULTS_TYPE_ERROR : longint; { return type might be wrong }
  begin
    PK_RESULTS_TYPE_ERROR:=pk_results_error_get_type;
  end;


end.
