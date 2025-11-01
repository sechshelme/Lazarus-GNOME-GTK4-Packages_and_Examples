
unit cd_it8_utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_it8_utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_it8_utils.h
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
PCdColorXYZ  = ^CdColorXYZ;
PCdIt8  = ^CdIt8;
PCdSpectrum  = ^CdSpectrum;
Pgdouble  = ^gdouble;
PGError  = ^GError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2012 Richard Hughes <richard@hughsie.com>
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
{$ifndef __CD_IT8_UTILS_H__}
{$define __CD_IT8_UTILS_H__}
{$include <glib-object.h>}
{$include "cd-it8.h"}
{$include "cd-spectrum.h"}

function cd_it8_utils_calculate_ccmx(it8_reference:PCdIt8; it8_measured:PCdIt8; it8_ccmx:PCdIt8; error:PPGError):Tgboolean;cdecl;external;
function cd_it8_utils_calculate_xyz_from_cmf(cmf:PCdIt8; illuminant:PCdSpectrum; spectrum:PCdSpectrum; value:PCdColorXYZ; resolution:Tgdouble; 
           error:PPGError):Tgboolean;cdecl;external;
function cd_it8_utils_calculate_cri_from_cmf(cmf:PCdIt8; tcs:PCdIt8; illuminant:PCdSpectrum; value:Pgdouble; resolution:Tgdouble; 
           error:PPGError):Tgboolean;cdecl;external;
function cd_it8_utils_calculate_gamma(it8:PCdIt8; gamma_y:Pgdouble; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __CD_IT8_UTILS_H__  }

implementation


end.
