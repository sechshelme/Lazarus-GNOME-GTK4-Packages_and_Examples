
unit bswap;
interface

{
  Automatically converted by H2Pas 1.0.0 from bswap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bswap.h
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
 * copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at>
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
{*
 * @file
 * byte swapping routines
  }
{$ifndef AVUTIL_BSWAP_H}
{$define AVUTIL_BSWAP_H}
{$include <stdint.h>}
{$include "libavutil/avconfig.h"}
{$include "attributes.h"}
{$ifdef HAVE_AV_CONFIG_H}
{$include "config.h"}
{$if   ARCH_AARCH64}
{$include "aarch64/bswap.h"}
(*** was #elif ****){$else ARCH_ARM}
{$include "arm/bswap.h"}
(*** was #elif ****){$else ARCH_AVR32}
{$include "avr32/bswap.h"}
(*** was #elif ****){$else ARCH_RISCV}
{$include "riscv/bswap.h"}
(*** was #elif ****){$else ARCH_SH4}
{$include "sh4/bswap.h"}
(*** was #elif ****){$else ARCH_X86}
{$include "x86/bswap.h"}
{$endif}
{$endif}
{ HAVE_AV_CONFIG_H  }
{ be2ne ... big-endian to native-endian }
{ le2ne ... little-endian to native-endian }
{$if AV_HAVE_BIGENDIAN}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function av_be2ne16(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_be2ne32(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_be2ne64(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_le2ne16(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_le2ne32(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_le2ne64(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_BE2NEC(s,x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_LE2NEC(s,x : longint) : longint;

{$else}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function av_be2ne16(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_be2ne32(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_be2ne64(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_le2ne16(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_le2ne32(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_le2ne64(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_BE2NEC(s,x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_LE2NEC(s,x : longint) : longint;

{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function AV_BE2NE16C(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_BE2NE32C(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_BE2NE64C(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_LE2NE16C(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_LE2NE32C(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_LE2NE64C(x : longint) : longint;

{$endif}
{ AVUTIL_BSWAP_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_be2ne16(x : longint) : longint;
begin
  av_be2ne16:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_be2ne32(x : longint) : longint;
begin
  av_be2ne32:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_be2ne64(x : longint) : longint;
begin
  av_be2ne64:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_le2ne16(x : longint) : longint;
begin
  av_le2ne16:=av_bswap16(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_le2ne32(x : longint) : longint;
begin
  av_le2ne32:=av_bswap32(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_le2ne64(x : longint) : longint;
begin
  av_le2ne64:=av_bswap64(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_BE2NEC(s,x : longint) : longint;
begin
  AV_BE2NEC:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_LE2NEC(s,x : longint) : longint;
begin
  AV_LE2NEC:=AV_BSWAPC(s,x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_be2ne16(x : longint) : longint;
begin
  av_be2ne16:=av_bswap16(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_be2ne32(x : longint) : longint;
begin
  av_be2ne32:=av_bswap32(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_be2ne64(x : longint) : longint;
begin
  av_be2ne64:=av_bswap64(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_le2ne16(x : longint) : longint;
begin
  av_le2ne16:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_le2ne32(x : longint) : longint;
begin
  av_le2ne32:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function av_le2ne64(x : longint) : longint;
begin
  av_le2ne64:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_BE2NEC(s,x : longint) : longint;
begin
  AV_BE2NEC:=AV_BSWAPC(s,x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_LE2NEC(s,x : longint) : longint;
begin
  AV_LE2NEC:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_BE2NE16C(x : longint) : longint;
begin
  AV_BE2NE16C:=AV_BE2NEC(16,x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_BE2NE32C(x : longint) : longint;
begin
  AV_BE2NE32C:=AV_BE2NEC(32,x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_BE2NE64C(x : longint) : longint;
begin
  AV_BE2NE64C:=AV_BE2NEC(64,x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_LE2NE16C(x : longint) : longint;
begin
  AV_LE2NE16C:=AV_LE2NEC(16,x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_LE2NE32C(x : longint) : longint;
begin
  AV_LE2NE32C:=AV_LE2NEC(32,x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AV_LE2NE64C(x : longint) : longint;
begin
  AV_LE2NE64C:=AV_LE2NEC(64,x);
end;


end.
