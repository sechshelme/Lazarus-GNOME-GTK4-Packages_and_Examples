
unit version;
interface

{
  Automatically converted by H2Pas 1.0.0 from version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    version.h
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
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{$ifndef AVDEVICE_VERSION_H}
{$define AVDEVICE_VERSION_H}
{*
 * @file
 * @ingroup lavd
 * Libavdevice version macros
  }
{$include "libavutil/version.h"}
{$include "version_major.h"}

const
  LIBAVDEVICE_VERSION_MINOR = 3;  
  LIBAVDEVICE_VERSION_MICRO = 100;  

{ was #define dname def_expr }
function LIBAVDEVICE_VERSION_INT : longint; { return type might be wrong }

{ was #define dname def_expr }
function LIBAVDEVICE_VERSION : longint; { return type might be wrong }

const
  LIBAVDEVICE_BUILD = LIBAVDEVICE_VERSION_INT;  
{$endif}
{ AVDEVICE_VERSION_H  }

implementation

{ was #define dname def_expr }
function LIBAVDEVICE_VERSION_INT : longint; { return type might be wrong }
  begin
    LIBAVDEVICE_VERSION_INT:=AV_VERSION_INT(LIBAVDEVICE_VERSION_MAJOR,LIBAVDEVICE_VERSION_MINOR,LIBAVDEVICE_VERSION_MICRO);
  end;

{ was #define dname def_expr }
function LIBAVDEVICE_VERSION : longint; { return type might be wrong }
  begin
    LIBAVDEVICE_VERSION:=AV_VERSION(LIBAVDEVICE_VERSION_MAJOR,LIBAVDEVICE_VERSION_MINOR,LIBAVDEVICE_VERSION_MICRO);
  end;


end.
