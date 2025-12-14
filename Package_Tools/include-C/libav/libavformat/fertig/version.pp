
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
 * Version macros.
 *
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
{$ifndef AVFORMAT_VERSION_H}
{$define AVFORMAT_VERSION_H}
{*
 * @file
 * @ingroup libavf
 * Libavformat version macros
  }
{$include "libavutil/version.h"}
{$include "version_major.h"}

const
  LIBAVFORMAT_VERSION_MINOR = 16;  
  LIBAVFORMAT_VERSION_MICRO = 100;  

{ was #define dname def_expr }
function LIBAVFORMAT_VERSION_INT : longint; { return type might be wrong }

{ was #define dname def_expr }
function LIBAVFORMAT_VERSION : longint; { return type might be wrong }

const
  LIBAVFORMAT_BUILD = LIBAVFORMAT_VERSION_INT;  
{ xxxxxxxxxxxx #define LIBAVFORMAT_IDENT       "Lavf" AV_STRINGIFY(LIBAVFORMAT_VERSION) }
{$endif}
{ AVFORMAT_VERSION_H  }

implementation

{ was #define dname def_expr }
function LIBAVFORMAT_VERSION_INT : longint; { return type might be wrong }
  begin
    LIBAVFORMAT_VERSION_INT:=AV_VERSION_INT(LIBAVFORMAT_VERSION_MAJOR,LIBAVFORMAT_VERSION_MINOR,LIBAVFORMAT_VERSION_MICRO);
  end;

{ was #define dname def_expr }
function LIBAVFORMAT_VERSION : longint; { return type might be wrong }
  begin
    LIBAVFORMAT_VERSION:=AV_VERSION(LIBAVFORMAT_VERSION_MAJOR,LIBAVFORMAT_VERSION_MINOR,LIBAVFORMAT_VERSION_MICRO);
  end;


end.
