
unit chafa_frame;
interface

{
  Automatically converted by H2Pas 1.0.0 from chafa_frame.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    chafa_frame.h
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
PChafaFrame  = ^ChafaFrame;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-  }
{ Copyright (C) 2018-2023 Hans Petter Jansson
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
{$ifndef __CHAFA_FRAME_H__}
{$define __CHAFA_FRAME_H__}
{$if !defined (__CHAFA_H_INSIDE__) && !defined (CHAFA_COMPILATION)}
{$error "Only <chafa.h> can be included directly."}
{$endif}
type

function chafa_frame_new(data:Tgconstpointer; pixel_type:TChafaPixelType; width:Tgint; height:Tgint; rowstride:Tgint):PChafaFrame;cdecl;external;
function chafa_frame_new_steal(data:Tgpointer; pixel_type:TChafaPixelType; width:Tgint; height:Tgint; rowstride:Tgint):PChafaFrame;cdecl;external;
function chafa_frame_new_borrow(data:Tgpointer; pixel_type:TChafaPixelType; width:Tgint; height:Tgint; rowstride:Tgint):PChafaFrame;cdecl;external;
procedure chafa_frame_ref(frame:PChafaFrame);cdecl;external;
procedure chafa_frame_unref(frame:PChafaFrame);cdecl;external;
{$endif}
{ __CHAFA_FRAME_H__  }

implementation


end.
