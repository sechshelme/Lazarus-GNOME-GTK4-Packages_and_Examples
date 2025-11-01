
unit cd_icc_utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_icc_utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_icc_utils.h
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
PCdMat3x3  = ^CdMat3x3;
Pgdouble  = ^gdouble;
PGError  = ^GError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2013 Richard Hughes <richard@hughsie.com>
 * Copyright (C) 2020 NVIDIA CORPORATION
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
{$ifndef __CD_ICC_UTILS_H__}
{$define __CD_ICC_UTILS_H__}
{$include <glib-object.h>}
{$include "cd-icc.h"}
{$include "cd-math.h"}

function cd_icc_utils_get_coverage(icc:PCdIcc; icc_reference:PCdIcc; coverage:Pgdouble; error:PPGError):Tgboolean;cdecl;external;
function cd_icc_utils_get_adaptation_matrix(icc:PCdIcc; icc_reference:PCdIcc; out:PCdMat3x3; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __CD_ICC_UTILS_H__  }

implementation


end.
