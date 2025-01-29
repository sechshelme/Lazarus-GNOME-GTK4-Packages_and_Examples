
unit chafa_term_db;
interface

{
  Automatically converted by H2Pas 1.0.0 from chafa_term_db.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    chafa_term_db.h
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
PChafaTermDb  = ^ChafaTermDb;
PChafaTermInfo  = ^ChafaTermInfo;
Pgchar  = ^gchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-  }
{ Copyright (C) 2020-2023 Hans Petter Jansson
 *
 * This file is part of Chafa, a program that shows pictures on text terminals.
 *
 * Chafa is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Chafa is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Chafa.  If not, see <http://www.gnu.org/licenses/>.  }
{$ifndef __CHAFA_TERM_DB_H__}
{$define __CHAFA_TERM_DB_H__}
{$if !defined (__CHAFA_H_INSIDE__) && !defined (CHAFA_COMPILATION)}
{$error "Only <chafa.h> can be included directly."}
{$endif}
{$include <chafa-term-info.h>}
type

function chafa_term_db_new:PChafaTermDb;cdecl;external;
(* Const before type ignored *)
function chafa_term_db_copy(term_db:PChafaTermDb):PChafaTermDb;cdecl;external;
procedure chafa_term_db_ref(term_db:PChafaTermDb);cdecl;external;
procedure chafa_term_db_unref(term_db:PChafaTermDb);cdecl;external;
function chafa_term_db_get_default:PChafaTermDb;cdecl;external;
function chafa_term_db_detect(term_db:PChafaTermDb; envp:PPgchar):PChafaTermInfo;cdecl;external;
function chafa_term_db_get_fallback_info(term_db:PChafaTermDb):PChafaTermInfo;cdecl;external;
{$endif}
{ __CHAFA_TERM_DB_H__  }

implementation


end.
