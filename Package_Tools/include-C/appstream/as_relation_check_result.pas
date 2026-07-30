unit as_relation_check_result;

interface

uses
  fp_glib2, fp_appstream;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2022-2024 Matthias Klumpp <matthias@tenstral.net>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2.1 of the license, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
  }
{$if !defined(__APPSTREAM_H) && !defined(AS_COMPILATION)}
{$error "Only <appstream.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include "as-relation.h"}

{G_DECLARE_DERIVABLE_TYPE (AsRelationCheckResult, as_relation_check_result, AS, RELATION_CHECK_RESULT, GObject) }
{< private > }
type
  PAsRelationCheckResultClass = ^TAsRelationCheckResultClass;
  TAsRelationCheckResultClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsRelationStatus:
 * @AS_RELATION_STATUS_UNKNOWN:		Unknown status.
 * @AS_RELATION_STATUS_ERROR:		An error occured and the status could not be checked.
 * @AS_RELATION_STATUS_NOT_SATISFIED:	The relation is not satisfied.
 * @AS_RELATION_STATUS_SATISFIED:	The relation is satisfied.
 *
 * Status of a relation check result.
  }
{< private > }

  PAsRelationStatus = ^TAsRelationStatus;
  TAsRelationStatus =  Longint;
  Const
    AS_RELATION_STATUS_UNKNOWN = 0;
    AS_RELATION_STATUS_ERROR = 1;
    AS_RELATION_STATUS_NOT_SATISFIED = 2;
    AS_RELATION_STATUS_SATISFIED = 3;
    AS_RELATION_STATUS_LAST = 4;
;

function as_relation_check_result_new:PAsRelationCheckResult;cdecl;external libappstream;
function as_relation_check_result_get_status(relcr:PAsRelationCheckResult):TAsRelationStatus;cdecl;external libappstream;
procedure as_relation_check_result_set_status(relcr:PAsRelationCheckResult; status:TAsRelationStatus);cdecl;external libappstream;
function as_relation_check_result_get_relation(relcr:PAsRelationCheckResult):PAsRelation;cdecl;external libappstream;
procedure as_relation_check_result_set_relation(relcr:PAsRelationCheckResult; relation:PAsRelation);cdecl;external libappstream;
function as_relation_check_result_get_message(relcr:PAsRelationCheckResult):Pgchar;cdecl;external libappstream;
procedure as_relation_check_result_set_message(relcr:PAsRelationCheckResult; format:Pgchar; args:array of const);cdecl;external libappstream;
procedure as_relation_check_result_set_message(relcr:PAsRelationCheckResult; format:Pgchar);cdecl;external libappstream;
{ (2, 3); }
function as_relation_check_result_get_error_code(relcr:PAsRelationCheckResult):TAsRelationError;cdecl;external libappstream;
procedure as_relation_check_result_set_error_code(relcr:PAsRelationCheckResult; ecode:TAsRelationError);cdecl;external libappstream;
function as_relation_check_results_get_compatibility_score(rc_results:PGPtrArray):Tgint;cdecl;external libappstream;

// === Konventiert am: 30-7-26 19:35:30 ===

function AS_TYPE_RELATION_CHECK_RESULT: TGType;
function AS_RELATION_CHECK_RESULT(obj: Pointer): PAsRelationCheckResult;
function AS_IS_RELATION_CHECK_RESULT(obj: Pointer): Tgboolean;
function AS_RELATION_CHECK_RESULT_CLASS(klass: Pointer): PAsRelationCheckResultClass;
function AS_IS_RELATION_CHECK_RESULT_CLASS(klass: Pointer): Tgboolean;
function AS_RELATION_CHECK_RESULT_GET_CLASS(obj: Pointer): PAsRelationCheckResultClass;

implementation

function AS_TYPE_RELATION_CHECK_RESULT: TGType;
begin
  Result := as_relation_check_result_get_type;
end;

function AS_RELATION_CHECK_RESULT(obj: Pointer): PAsRelationCheckResult;
begin
  Result := PAsRelationCheckResult(g_type_check_instance_cast(obj, AS_TYPE_RELATION_CHECK_RESULT));
end;

function AS_IS_RELATION_CHECK_RESULT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_RELATION_CHECK_RESULT);
end;

function AS_RELATION_CHECK_RESULT_CLASS(klass: Pointer): PAsRelationCheckResultClass;
begin
  Result := PAsRelationCheckResultClass(g_type_check_class_cast(klass, AS_TYPE_RELATION_CHECK_RESULT));
end;

function AS_IS_RELATION_CHECK_RESULT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_RELATION_CHECK_RESULT);
end;

function AS_RELATION_CHECK_RESULT_GET_CLASS(obj: Pointer): PAsRelationCheckResultClass;
begin
  Result := PAsRelationCheckResultClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsRelationCheckResult = record
    parent_instance: TGObject;
  end;
  PAsRelationCheckResult = ^TAsRelationCheckResult;

  PAsRelationCheckResultClass = type Pointer;

function as_relation_check_result_get_type: TGType; cdecl; external libgxxxxxxx;



end.
