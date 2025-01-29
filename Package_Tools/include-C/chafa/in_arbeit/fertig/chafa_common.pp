
unit chafa_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from chafa_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    chafa_common.h
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
PChafaAlign  = ^ChafaAlign;
PChafaPixelType  = ^ChafaPixelType;
PChafaTuck  = ^ChafaTuck;
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
{$ifndef __CHAFA_COMMON_H__}
{$define __CHAFA_COMMON_H__}
{$if !defined (__CHAFA_H_INSIDE__) && !defined (CHAFA_COMPILATION)}
{$error "Only <chafa.h> can be included directly."}
{$endif}
{*
 * ChafaPixelType:
 * @CHAFA_PIXEL_RGBA8_PREMULTIPLIED: Premultiplied RGBA, 8 bits per channel.
 * @CHAFA_PIXEL_BGRA8_PREMULTIPLIED: Premultiplied BGRA, 8 bits per channel.
 * @CHAFA_PIXEL_ARGB8_PREMULTIPLIED: Premultiplied ARGB, 8 bits per channel.
 * @CHAFA_PIXEL_ABGR8_PREMULTIPLIED: Premultiplied ABGR, 8 bits per channel.
 * @CHAFA_PIXEL_RGBA8_UNASSOCIATED: Unassociated RGBA, 8 bits per channel.
 * @CHAFA_PIXEL_BGRA8_UNASSOCIATED: Unassociated BGRA, 8 bits per channel.
 * @CHAFA_PIXEL_ARGB8_UNASSOCIATED: Unassociated ARGB, 8 bits per channel.
 * @CHAFA_PIXEL_ABGR8_UNASSOCIATED: Unassociated ABGR, 8 bits per channel.
 * @CHAFA_PIXEL_RGB8: Packed RGB (no alpha), 8 bits per channel.
 * @CHAFA_PIXEL_BGR8: Packed BGR (no alpha), 8 bits per channel.
 * @CHAFA_PIXEL_MAX: Last supported pixel type, plus one.
 *
 * Pixel formats supported by #ChafaCanvas and #ChafaSymbolMap.
 *
 * Since: 1.4
 * }
{ 32 bits per pixel  }
{ 24 bits per pixel  }
type
  PChafaPixelType = ^TChafaPixelType;
  TChafaPixelType =  Longint;
  Const
    CHAFA_PIXEL_RGBA8_PREMULTIPLIED = 0;
    CHAFA_PIXEL_BGRA8_PREMULTIPLIED = 1;
    CHAFA_PIXEL_ARGB8_PREMULTIPLIED = 2;
    CHAFA_PIXEL_ABGR8_PREMULTIPLIED = 3;
    CHAFA_PIXEL_RGBA8_UNASSOCIATED = 4;
    CHAFA_PIXEL_BGRA8_UNASSOCIATED = 5;
    CHAFA_PIXEL_ARGB8_UNASSOCIATED = 6;
    CHAFA_PIXEL_ABGR8_UNASSOCIATED = 7;
    CHAFA_PIXEL_RGB8 = 8;
    CHAFA_PIXEL_BGR8 = 9;
    CHAFA_PIXEL_MAX = 10;
;
{*
 * ChafaAlign:
 * @CHAFA_ALIGN_START: Align flush with beginning of the area (top or left in LTR locales).
 * @CHAFA_ALIGN_END: Align flush with end of the area (bottom or right in LTR locales).
 * @CHAFA_ALIGN_CENTER: Align in the middle of the area.
 * @CHAFA_ALIGN_MAX: Last supported alignment, plus one.
 *
 * Alignment options when placing an element within an area.
 *
 * Since: 1.14
 * }
type
  PChafaAlign = ^TChafaAlign;
  TChafaAlign =  Longint;
  Const
    CHAFA_ALIGN_START = 0;
    CHAFA_ALIGN_END = 1;
    CHAFA_ALIGN_CENTER = 2;
    CHAFA_ALIGN_MAX = 3;
;
{*
 * ChafaTuck:
 * @CHAFA_TUCK_STRETCH: Resize element to fit the area exactly, changing its aspect ratio.
 * @CHAFA_TUCK_FIT: Resize element to fit the area, preserving its aspect ratio by adding padding.
 * @CHAFA_TUCK_SHRINK_TO_FIT: Like @CHAFA_TUCK_FIT, but prohibit enlargement.
 * @CHAFA_TUCK_MAX: Last supported tucking policy, plus one.
 *
 * Resizing options when placing an element within an area. Usually used in conjunction
 * with #ChafaAlign to control the padding.
 *
 * Since: 1.14
 * }
type
  PChafaTuck = ^TChafaTuck;
  TChafaTuck =  Longint;
  Const
    CHAFA_TUCK_STRETCH = 0;
    CHAFA_TUCK_FIT = 1;
    CHAFA_TUCK_SHRINK_TO_FIT = 2;
    CHAFA_TUCK_MAX = 3;
;
{$endif}
{ __CHAFA_COMMON_H__  }

implementation


end.
