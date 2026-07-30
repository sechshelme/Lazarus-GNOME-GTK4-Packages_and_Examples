
unit as_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_version.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2014 Richard Hughes <richard@hughsie.com>
 * Copyright (C) 2021-2024 Matthias Klumpp <matthias@tenstral.net>
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
(** unsupported pragma#pragma once*)
{$if !defined (__APPSTREAM_H_INSIDE__) && !defined (AS_COMPILATION)}
{$error "Only <appstream.h> can be included directly."}
{$endif}
{$include <glib.h>}
{ compile time version
  }

const
  AS_MAJOR_VERSION = 1;  
  AS_MINOR_VERSION = 0;  
  AS_MICRO_VERSION = 2;  
{ check whether a As version equal to or greater than
 * major.minor.micro.
#define AS_CHECK_VERSION(major,minor,micro)    \
    (AS_MAJOR_VERSION > (major) || \
     (AS_MAJOR_VERSION == (major) && AS_MINOR_VERSION > (minor)) || \
     (AS_MAJOR_VERSION == (major) && AS_MINOR_VERSION == (minor) && \
      AS_MICRO_VERSION >= (micro)))
  }
(* Const before type ignored *)

function as_version_string:Pgchar;cdecl;external;

implementation


end.
