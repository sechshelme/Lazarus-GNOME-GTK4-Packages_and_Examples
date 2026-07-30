unit as_spdx;

interface

uses
  fp_glib2, fp_appstream;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2012-2024 Matthias Klumpp <matthias@tenstral.net>
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
{$ifndef __AS_SPDX_H}
{$define __AS_SPDX_H}
{$include <glib.h>}

function as_is_spdx_license_id(license_id:Pgchar):Tgboolean;cdecl;external libappstream;
function as_is_spdx_license_exception_id(exception_id:Pgchar):Tgboolean;cdecl;external libappstream;
function as_is_spdx_license_expression(license:Pgchar):Tgboolean;cdecl;external libappstream;
function as_spdx_license_tokenize(license:Pgchar):^Pgchar;cdecl;external libappstream;
function as_spdx_license_detokenize(license_tokens:PPgchar):Pgchar;cdecl;external libappstream;
function as_license_to_spdx_id(license:Pgchar):Pgchar;cdecl;external libappstream;
function as_license_is_metadata_license_id(license_id:Pgchar):Tgboolean;cdecl;external libappstream;
function as_license_is_metadata_license(license:Pgchar):Tgboolean;cdecl;external libappstream;
function as_license_is_free_license(license:Pgchar):Tgboolean;cdecl;external libappstream;
function as_get_license_name(license:Pgchar):Pgchar;cdecl;external libappstream;
function as_get_license_url(license:Pgchar):Pgchar;cdecl;external libappstream;
{$endif}
{ __AS_SPDX_H  }

// === Konventiert am: 30-7-26 19:34:49 ===


implementation



end.
