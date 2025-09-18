
unit gmime_error;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_error.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_error.h
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
Pxxxxxxxxxxxxxxx  = ^xxxxxxxxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime
 *  Copyright (C) 2000-2022 Jeffrey Stedfast
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
 *  02110-1301, USA.
  }
{$ifndef __GMIME_ERROR_H__}
{$define __GMIME_ERROR_H__}
{$include <glib.h>}
  var
    gmime_error_quark : TGQuark;cvar;external;
{*
 * GMIME_ERROR:
 *
 * The GMime error domain GQuark value.
 * }

const
  GMIME_ERROR = gmime_error_quark;  
{*
 * GMIME_ERROR_IS_SYSTEM:
 * @error: integer error value
 *
 * Decides if an error is a system error (aka errno value) vs. a GMime
 * error.
 *
 * Meant to be used with #GError::code
 * }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GMIME_ERROR_IS_SYSTEM(error : longint) : longint;

{ errno is a positive value, so negative values should be safe to use  }
type
  Txxxxxxxxxxxxxxx =  Longint;
  Const
    GMIME_ERROR_GENERAL = -(1);
    GMIME_ERROR_NOT_SUPPORTED = -(2);
    GMIME_ERROR_INVALID_OPERATION = -(3);
    GMIME_ERROR_PARSE_ERROR = -(4);
    GMIME_ERROR_PROTOCOL_ERROR = -(5);

  var
    gmime_gpgme_error_quark : TGQuark;cvar;external;
{*
 * GMIME_GPGME_ERROR:
 *
 * The GMime GpgMe error domain GQuark value.
 * }

const
  GMIME_GPGME_ERROR = gmime_gpgme_error_quark;  
{$endif}
{ __GMIME_ERROR_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_ERROR_IS_SYSTEM(error : longint) : longint;
begin
  GMIME_ERROR_IS_SYSTEM:=error>0;
end;


end.
