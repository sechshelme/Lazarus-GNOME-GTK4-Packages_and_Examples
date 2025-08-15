
unit poppler_date;
interface

{
  Automatically converted by H2Pas 1.0.0 from poppler_date.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    poppler_date.h
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
Ptime_t  = ^time_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ poppler-date.h: glib interface to poppler
 *
 * Copyright (C) 2009 Carlos Garcia Campos <carlosgc@gnome.org>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.
  }
{$ifndef __POPPLER_DATE_H__}
{$define __POPPLER_DATE_H__}
{$include "poppler.h"}
(* Const before type ignored *)

function poppler_date_parse(date:Pgchar; timet:Ptime_t):Tgboolean;cdecl;external;
{$endif}
{ __POPPLER_DATE_H__  }

implementation


end.
