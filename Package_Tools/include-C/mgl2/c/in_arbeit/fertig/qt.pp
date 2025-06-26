
unit qt;
interface

{
  Automatically converted by H2Pas 1.0.0 from qt.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    qt.h
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
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{**************************************************************************
 * qt.h is part of Math Graphic Library
 * Copyright (C) 2007-2016 Alexey Balakin <mathgl.abalakin@gmail.ru>       *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU Lesser General Public License  as       *
 *   published by the Free Software Foundation; either version 3 of the    *
 *   License, or (at your option) any later version.                       *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU Lesser General Public     *
 *   License along with this program; if not, write to the                 *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ************************************************************************** }
{$ifndef _MGL_QT_H_}
{$define _MGL_QT_H_}
{$include <mgl2/abstract.h>}
{----------------------------------------------------------------------------- }
{/ Creates Qt window for plotting }
(* Const before type ignored *)

function mgl_create_graph_qt(draw:function (gr:THMGL; p:pointer):longint; title:Pchar; par:pointer; load:procedure (p:pointer)):THMGL;cdecl;external;
(* Const before type ignored *)
function mgl_create_graph_qt_(title:Pchar; para2:longint):Tuintptr_t;cdecl;external;
{/ Run main Qt loop for event handling. }
function mgl_qt_run:longint;cdecl;external;
function mgl_qt_run_:longint;cdecl;external;
{/ Return pointer to widget (QMathGL*) used for plotting }
function mgl_qt_widget(gr:THMGL):pointer;cdecl;external;
{$endif}

implementation


end.
