unit as_validator;

interface

uses
  fp_glib2, fp_appstream;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2014-2024 Matthias Klumpp <matthias@tenstral.net>
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
{$ifndef __AS_VALIDATOR_H}
{$define __AS_VALIDATOR_H}
{$include <glib-object.h>}
{$include "as-validator-issue.h"}

{G_DECLARE_DERIVABLE_TYPE (AsValidator, as_validator, AS, VALIDATOR, GObject) }
{< private > }
type
  PAsValidatorClass = ^TAsValidatorClass;
  TAsValidatorClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsValidatorError:
 * @AS_VALIDATOR_ERROR_FAILED:			Generic failure
 * @AS_VALIDATOR_ERROR_INVALID_OVERRIDE:	The issue override was not accepted.
 * @AS_VALIDATOR_ERROR_INVALID_FILENAME:	The filename was invalid.
 *
 * The error type.
 * }
{< private > }

  PAsValidatorError = ^TAsValidatorError;
  TAsValidatorError =  Longint;
  Const
    AS_VALIDATOR_ERROR_FAILED = 0;
    AS_VALIDATOR_ERROR_INVALID_OVERRIDE = 1;
    AS_VALIDATOR_ERROR_INVALID_FILENAME = 2;
    AS_VALIDATOR_ERROR_LAST = 3;
;

{ was #define dname def_expr }
function AS_VALIDATOR_ERROR : longint; { return type might be wrong }

function as_validator_error_quark:TGQuark;cdecl;external libappstream;
function as_validator_new:PAsValidator;cdecl;external libappstream;
function as_validator_validate_file(validator:PAsValidator; metadata_file:PGFile):Tgboolean;cdecl;external libappstream;
function as_validator_validate_bytes(validator:PAsValidator; metadata:PGBytes):Tgboolean;cdecl;external libappstream;
function as_validator_validate_data(validator:PAsValidator; metadata:Pgchar):Tgboolean;cdecl;external libappstream;
function as_validator_validate_tree(validator:PAsValidator; root_dir:Pgchar):Tgboolean;cdecl;external libappstream;
procedure as_validator_clear_release_data(validator:PAsValidator);cdecl;external libappstream;
function as_validator_add_release_bytes(validator:PAsValidator; release_fname:Pgchar; release_metadata:PGBytes; error:PPGError):Tgboolean;cdecl;external libappstream;
function as_validator_add_release_file(validator:PAsValidator; release_file:PGFile; error:PPGError):Tgboolean;cdecl;external libappstream;
function as_validator_get_issue_files_count(validator:PAsValidator):Tguint;cdecl;external libappstream;
function as_validator_get_issues(validator:PAsValidator):PGList;cdecl;external libappstream;
function as_validator_get_issues_per_file(validator:PAsValidator):PGHashTable;cdecl;external libappstream;
function as_validator_get_report_yaml(validator:PAsValidator; error:PPGError):Pgchar;cdecl;external libappstream;
function as_validator_check_success(validator:PAsValidator):Tgboolean;cdecl;external libappstream;
function as_validator_get_allow_net(validator:PAsValidator):Tgboolean;cdecl;external libappstream;
procedure as_validator_set_allow_net(validator:PAsValidator; value:Tgboolean);cdecl;external libappstream;
function as_validator_get_strict(validator:PAsValidator):Tgboolean;cdecl;external libappstream;
procedure as_validator_set_strict(validator:PAsValidator; is_strict:Tgboolean);cdecl;external libappstream;
function as_validator_add_override(validator:PAsValidator; tag:Pgchar; severity_override:TAsIssueSeverity; error:PPGError):Tgboolean;cdecl;external libappstream;
function as_validator_get_tag_explanation(validator:PAsValidator; tag:Pgchar):Pgchar;cdecl;external libappstream;
function as_validator_get_tag_severity(validator:PAsValidator; tag:Pgchar):TAsIssueSeverity;cdecl;external libappstream;
function as_validator_get_tags(validator:PAsValidator):^Pgchar;cdecl;external libappstream;
{$endif}
{ __AS_VALIDATOR_H  }

// === Konventiert am: 30-7-26 19:34:23 ===

function AS_TYPE_VALIDATOR: TGType;
function AS_VALIDATOR(obj: Pointer): PAsValidator;
function AS_IS_VALIDATOR(obj: Pointer): Tgboolean;
function AS_VALIDATOR_CLASS(klass: Pointer): PAsValidatorClass;
function AS_IS_VALIDATOR_CLASS(klass: Pointer): Tgboolean;
function AS_VALIDATOR_GET_CLASS(obj: Pointer): PAsValidatorClass;

implementation

function AS_TYPE_VALIDATOR: TGType;
begin
  Result := as_validator_get_type;
end;

function AS_VALIDATOR(obj: Pointer): PAsValidator;
begin
  Result := PAsValidator(g_type_check_instance_cast(obj, AS_TYPE_VALIDATOR));
end;

function AS_IS_VALIDATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_VALIDATOR);
end;

function AS_VALIDATOR_CLASS(klass: Pointer): PAsValidatorClass;
begin
  Result := PAsValidatorClass(g_type_check_class_cast(klass, AS_TYPE_VALIDATOR));
end;

function AS_IS_VALIDATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_VALIDATOR);
end;

function AS_VALIDATOR_GET_CLASS(obj: Pointer): PAsValidatorClass;
begin
  Result := PAsValidatorClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsValidator = record
    parent_instance: TGObject;
  end;
  PAsValidator = ^TAsValidator;

  PAsValidatorClass = type Pointer;

function as_validator_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function AS_VALIDATOR_ERROR : longint; { return type might be wrong }
  begin
    AS_VALIDATOR_ERROR:=as_validator_error_quark;
  end;


end.
