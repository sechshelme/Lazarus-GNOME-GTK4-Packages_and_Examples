
unit as_validator;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_validator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_validator
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
PAsValidator  = ^AsValidator;
PAsValidatorClass  = ^AsValidatorClass;
PAsValidatorError  = ^AsValidatorError;
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGError  = ^GError;
PGFile  = ^GFile;
PGHashTable  = ^GHashTable;
PGList  = ^GList;
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

{ was #define dname def_expr }
function AS_TYPE_VALIDATOR : longint; { return type might be wrong }

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

function as_validator_error_quark:TGQuark;cdecl;external;
function as_validator_new:PAsValidator;cdecl;external;
function as_validator_validate_file(validator:PAsValidator; metadata_file:PGFile):Tgboolean;cdecl;external;
function as_validator_validate_bytes(validator:PAsValidator; metadata:PGBytes):Tgboolean;cdecl;external;
(* Const before type ignored *)
function as_validator_validate_data(validator:PAsValidator; metadata:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function as_validator_validate_tree(validator:PAsValidator; root_dir:Pgchar):Tgboolean;cdecl;external;
procedure as_validator_clear_release_data(validator:PAsValidator);cdecl;external;
(* Const before type ignored *)
function as_validator_add_release_bytes(validator:PAsValidator; release_fname:Pgchar; release_metadata:PGBytes; error:PPGError):Tgboolean;cdecl;external;
function as_validator_add_release_file(validator:PAsValidator; release_file:PGFile; error:PPGError):Tgboolean;cdecl;external;
function as_validator_get_issue_files_count(validator:PAsValidator):Tguint;cdecl;external;
function as_validator_get_issues(validator:PAsValidator):PGList;cdecl;external;
function as_validator_get_issues_per_file(validator:PAsValidator):PGHashTable;cdecl;external;
function as_validator_get_report_yaml(validator:PAsValidator; error:PPGError):Pgchar;cdecl;external;
function as_validator_check_success(validator:PAsValidator):Tgboolean;cdecl;external;
function as_validator_get_allow_net(validator:PAsValidator):Tgboolean;cdecl;external;
procedure as_validator_set_allow_net(validator:PAsValidator; value:Tgboolean);cdecl;external;
function as_validator_get_strict(validator:PAsValidator):Tgboolean;cdecl;external;
procedure as_validator_set_strict(validator:PAsValidator; is_strict:Tgboolean);cdecl;external;
(* Const before type ignored *)
function as_validator_add_override(validator:PAsValidator; tag:Pgchar; severity_override:TAsIssueSeverity; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_validator_get_tag_explanation(validator:PAsValidator; tag:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_validator_get_tag_severity(validator:PAsValidator; tag:Pgchar):TAsIssueSeverity;cdecl;external;
function as_validator_get_tags(validator:PAsValidator):^Pgchar;cdecl;external;
{$endif}
{ __AS_VALIDATOR_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_VALIDATOR : longint; { return type might be wrong }
  begin
    AS_TYPE_VALIDATOR:=as_validator_get_type;
  end;

{ was #define dname def_expr }
function AS_VALIDATOR_ERROR : longint; { return type might be wrong }
  begin
    AS_VALIDATOR_ERROR:=as_validator_error_quark;
  end;


end.
