
unit version_major;
interface

{
  Automatically converted by H2Pas 1.0.0 from version_major.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    version_major.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Version macros.
 *
 * This file is part of libswresample
 *
 * libswresample is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * libswresample is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with libswresample; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{$ifndef SWRESAMPLE_VERSION_MAJOR_H}
{$define SWRESAMPLE_VERSION_MAJOR_H}
{*
 * @file
 * Libswresample version macros
  }

const
  LIBSWRESAMPLE_VERSION_MAJOR = 4;  
{$endif}
{ SWRESAMPLE_VERSION_MAJOR_H  }

implementation


end.
