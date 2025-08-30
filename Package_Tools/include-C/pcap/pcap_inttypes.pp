
unit pcap_inttypes;
interface

{
  Automatically converted by H2Pas 1.0.0 from pcap_inttypes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pcap_inttypes.h
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
Pint16_t  = ^int16_t;
Pint32_t  = ^int32_t;
Pint64_t  = ^int64_t;
Pint8_t  = ^int8_t;
Puint16_t  = ^uint16_t;
Puint32_t  = ^uint32_t;
Puint64_t  = ^uint64_t;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2002 - 2005 NetGroup, Politecnico di Torino (Italy)
 * Copyright (c) 2005 - 2009 CACE Technologies, Inc. Davis (California)
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the Politecnico di Torino nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  }
{$ifndef pcap_pcap_inttypes_h}
{$define pcap_pcap_inttypes_h}
{
 * If we're compiling with Visual Studio, make sure the C99 integer
 * types are defined, by hook or by crook.
 *
 * XXX - verify that we have at least C99 support on UN*Xes?
 *
 * What about MinGW or various DOS toolchains?  We're currently assuming
 * sufficient C99 support there.
  }
{$if defined(_MSC_VER)}
{
   * Compiler is MSVC.
    }
{$if _MSC_VER >= 1800}
{
     * VS 2013 or newer; we have <inttypes.h>.
      }
{$include <inttypes.h>}
{$else}
{
     * Earlier VS; we have to define this stuff ourselves.
     * We don't support building libpcap with earlier versions of VS,
     * but SDKs for Npcap have to support building applications using
     * earlier versions of VS, so we work around this by defining
     * those types ourselves, as some files use them.
      }
type
  Puint8_t = ^Tuint8_t;
  Tuint8_t = byte;

  Pint8_t = ^Tint8_t;
  Tint8_t = char;

  Puint16_t = ^Tuint16_t;
  Tuint16_t = word;

  Pint16_t = ^Tint16_t;
  Tint16_t = smallint;

  Puint32_t = ^Tuint32_t;
  Tuint32_t = dword;

  Pint32_t = ^Tint32_t;
  Tint32_t = longint;
{$ifdef _MSC_EXTENSIONS}

  Puint64_t = ^Tuint64_t;
  Tuint64_t = Tuint64;

  Pint64_t = ^Tint64_t;
  Tint64_t = Tint64;
{$else}
{ _MSC_EXTENSIONS  }
type
  Puint64_t = ^Tuint64_t;
  Tuint64_t = qword;

  Pint64_t = ^Tint64_t;
  Tint64_t = int64;
{$endif}
{$endif}
{$else}
{ defined(_MSC_VER)  }
{
   * Not Visual Studio.
   * Include <inttypes.h> to get the integer types and PRi[doux]64 values
   * defined.
   *
   * If the compiler is MinGW, we assume we have <inttypes.h> - and
   * support for %zu in the formatted printing functions.
   *
   * If the target is UN*X, we assume we have a C99-or-later development
   * environment, and thus have <inttypes.h> - and support for %zu in
   * the formatted printing functions.
   *
   * If the target is MS-DOS, we assume we have <inttypes.h> - and support
   * for %zu in the formatted printing functions.
   *
   * I.e., assume we have <inttypes.h> and that it suffices.
    }
{
   * XXX - somehow make sure we have enough C99 support with other
   * compilers and support libraries?
    }
{$include <inttypes.h>}
{$endif}
{ defined(_MSC_VER)  }
{$endif}
{ pcap/pcap-inttypes.h  }

implementation


end.
